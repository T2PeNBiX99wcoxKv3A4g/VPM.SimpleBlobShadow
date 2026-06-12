// Credit: Claude, Gemini

Shader "yky/SimpleBlobShadow"
{
    Properties
    {
        [Header(Shadow Shape)]
        _ShadowRadius ("Shadow Radius (world units)", Float) = 0.4
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

        GrabPass
        {
            "_GrabTexture"
        }

        Pass
        {
            Name "BlobShadow"

            Cull Front
            ZWrite Off
            ZTest Always
            Blend SrcAlpha OneMinusSrcAlpha

            CGPROGRAM
            #pragma vertex   vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #pragma target 3.0

            #include "UnityCG.cginc"

            sampler2D _GrabTexture;

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

            struct appdata
            {
                float4 vertex : POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f
            {
                float4 pos : SV_POSITION;
                float4 grabPos : TEXCOORD0;
                float4 screenPos: TEXCOORD1;
                float3 viewDirWS: TEXCOORD2;
                UNITY_VERTEX_OUTPUT_STEREO
            };

            v2f vert(appdata v)
            {
                v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                o.pos = UnityObjectToClipPos(v.vertex);
                o.grabPos = ComputeGrabScreenPos(o.pos);
                o.screenPos = ComputeScreenPos(o.pos);

                float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
                o.viewDirWS = worldPos - _WorldSpaceCameraPos;

                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);

                if (_HideInCamera > 0.5 && _VRChatCameraMode != 0.0) discard;
                if (_HideInMirror > 0.5 && (_VRChatMirrorMode != 0.0 || _VRChatFaceMirrorMode != 0.0)) discard;

                float2 screenUV = i.screenPos.xy / i.screenPos.w;
                float rawDepth = SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, screenUV);

                float linearDepth = Linear01Depth(rawDepth);
                if (linearDepth > 0.9999) discard;

                float eyeDepth = LinearEyeDepth(rawDepth);
                float3 camForward = -UNITY_MATRIX_I_V._m02_m12_m22;
                float3 viewDirWS = normalize(i.viewDirWS);
                float3 worldPos = _WorldSpaceCameraPos + viewDirWS * (eyeDepth / dot(viewDirWS, camForward));
                float3 objectWorldPos = mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz;

                float footY;
                if (_FootWorldY < -999.0)
                    footY = objectWorldPos.y;
                else
                    footY = _FootWorldY;

                float2 footXZ = objectWorldPos.xz;
                float heightAboveGround = footY - worldPos.y;

                if (heightAboveGround < -max(_SlopeBias, 0.0)) discard;

                heightAboveGround = max(heightAboveGround, 0.0);

                float heightFactor = saturate(
                    (heightAboveGround - _HeightFadeStart) /
                    max(_HeightFadeEnd - _HeightFadeStart, 0.001)
                );

                float heightAlpha = 1.0 - heightFactor;
                float dynamicRadius = _ShadowRadius * (1.0 + heightFactor * _HeightRadiusMul);

                float2 delta = worldPos.xz - footXZ;
                float dist = length(delta);

                float softEdge = dynamicRadius * _ShadowSoftness;
                float shadowMask = 1.0 - smoothstep(
                    dynamicRadius - softEdge,
                    dynamicRadius,
                    dist
                );

                float finalAlpha = shadowMask * heightAlpha * _ShadowOpacity;
                if (finalAlpha < 0.002) discard;

                float4 grabColor = tex2Dproj(_GrabTexture, i.grabPos);
                float3 shadowedColor = lerp(grabColor.rgb, _ShadowColor.rgb, finalAlpha);

                return fixed4(shadowedColor, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Hidden"
}