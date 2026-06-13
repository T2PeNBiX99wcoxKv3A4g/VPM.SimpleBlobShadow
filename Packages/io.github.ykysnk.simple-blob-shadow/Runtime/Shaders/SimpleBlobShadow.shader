// Credit: Claude, Gemini

Shader "yky/SimpleBlobShadow"
{
    Properties
    {
        [Header(Shadow Shape)]
        _ShadowRadius ("Shadow Radius (world units)", Range(0.01, 1.0)) = 0.4
        _ShadowSoftness ("Edge Softness", Range(0.01, 1.0)) = 0.3
        _ShadowOpacity ("Max Opacity", Range(0.0, 1.0)) = 0.6
        _ShadowColor ("Shadow Color", Color) = (0, 0, 0, 1)

        [Header(Height Falloff)]
        _HeightFadeStart ("Fade Start Height (m)", Float) = 0.05
        _HeightFadeEnd ("Fade End Height (m)", Float) = 1.5
        _HeightRadiusMul ("Radius Grow With Height", Range(0.0, 3.0)) = 1.0

        [Header(Foot Position)]
        _FootWorldY ("Foot World Y Override", Float) = -9999
        _SlopeBias ("Slope / Step Tolerance (m)", Float) = 0.2

        [Header(VRChat)]
        [Toggle] _HideInMirror ("Hide In Mirror", Float) = 0
        [Toggle] _HideInCamera ("Hide In Camera", Float) = 0

        [Header(Advanced)]
        [Toggle(MANUAL_FADE)] _ManualFade ("Manual Fade", Float) = 0
        _ManualHeight ("Manual Height from Raycast (m)", Float) = 0.0
    }

    SubShader
    {
        Tags
        {
            "Queue" = "Transparent-10"
            "RenderType" = "Transparent"
            "IgnoreProjector" = "True"
            "VRCFallback" = "Hidden"
        }

        Pass
        {
            Name "BlobShadow"

            Cull Front
            ZWrite Off
            ZTest Always
            Blend SrcAlpha OneMinusSrcAlpha

            Stencil
            {
                Ref 128
                ReadMask 128
                Comp NotEqual
                Pass Keep
            }

            CGPROGRAM
            #pragma vertex   vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #pragma target 3.0
            #pragma shader_feature MANUAL_FADE

            #include "UnityCG.cginc"

            UNITY_DECLARE_DEPTH_TEXTURE(_CameraDepthTexture);

            float _VRChatCameraMode;
            float _VRChatMirrorMode;
            float _VRChatFaceMirrorMode;

            float _ShadowRadius;
            float _ShadowSoftness;
            float _ShadowOpacity;
            float4 _ShadowColor;
            float _HeightFadeStart;
            float _HeightFadeEnd;
            float _HeightRadiusMul;
            float _FootWorldY;
            float _SlopeBias;

            float _HideInMirror;
            float _HideInCamera;
            float _ManualHeight;

            struct appdata
            {
                float4 vertex : POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f
            {
                float4 pos : SV_POSITION;
                float4 screenPos: TEXCOORD0;
                float3 worldPos : TEXCOORD1;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };

            v2f vert(appdata v)
            {
                v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                o.pos = UnityObjectToClipPos(v.vertex);
                o.screenPos = ComputeScreenPos(o.pos);
                o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;

                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);

                if (_HideInCamera > 0.5 && _VRChatCameraMode != 0.0) discard;
                if (_HideInMirror > 0.5 && (_VRChatMirrorMode != 0.0 || _VRChatFaceMirrorMode != 0.0)) discard;

                float2 uv = i.screenPos.xy / i.screenPos.w;
                float2 stereoUV = UnityStereoTransformScreenSpaceTex(uv);

                float rawDepth = SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, stereoUV);
                float linearDepth = Linear01Depth(rawDepth);
                if (linearDepth > 0.9999) discard;

                float eyeDepth = LinearEyeDepth(rawDepth);

                // Reconstruct world position from camera to the depth surface
                float3 viewDir = i.worldPos - _WorldSpaceCameraPos;
                // Avoid division by zero or near-zero if camera is very close to the vertex
                // screenPos.w is the view-space Z.
                float3 ray = viewDir / max(i.screenPos.w, 0.00001);
                float3 worldPos = _WorldSpaceCameraPos + ray * eyeDepth;
                float3 objectWorldPos = mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz;
                float2 footXZ = objectWorldPos.xz;

                float heightFactor = 0.0;

                #ifdef MANUAL_FADE
                float manualHeightClamped = max(_ManualHeight, 0.0);
                heightFactor = saturate(
                    (manualHeightClamped - _HeightFadeStart) /
                    max(_HeightFadeEnd - _HeightFadeStart, 0.001)
                );
                #else
                float footY = (_FootWorldY < -999.0) ? objectWorldPos.y : _FootWorldY;
                float heightAboveGround = footY - worldPos.y;

                if (heightAboveGround < -max(_SlopeBias, 0.0)) discard;
                heightAboveGround = max(heightAboveGround, 0.0);

                heightFactor = saturate(
                    (heightAboveGround - _HeightFadeStart) /
                    max(_HeightFadeEnd - _HeightFadeStart, 0.001)
                );
                #endif

                float heightAlpha = 1.0 - heightFactor;
                float dynamicRadius = saturate(_ShadowRadius * (1.0 + heightFactor * _HeightRadiusMul));

                float2 delta = worldPos.xz - footXZ;
                float dist = length(delta);

                float softEdge = dynamicRadius * _ShadowSoftness;
                float shadowMask = 1.0 - smoothstep(
                    dynamicRadius - softEdge,
                    dynamicRadius,
                    dist
                );

                float finalAlpha = saturate(shadowMask * heightAlpha * _ShadowOpacity);
                if (finalAlpha < 0.002) discard;

                return fixed4(_ShadowColor.rgb, finalAlpha);
            }
            ENDCG
        }
    }
    FallBack "Hidden"
}