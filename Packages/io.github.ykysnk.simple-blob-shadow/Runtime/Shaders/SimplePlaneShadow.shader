// Credit: Claude, Gemini

Shader "yky/SimplePlaneShadow"
{
    Properties
    {
        [Header(Shadow Shape)]
        _ShadowRadius ("Shadow Radius", Range(0.0, 0.5)) = 0.4
        _ShadowSoftness ("Edge Fade / Softness", Range(0.01, 1.0)) = 0.3
        _ShadowOpacity ("Opacity", Range(0.0, 1.0)) = 0.6
        _ShadowColor ("Shadow Color", Color) = (0, 0, 0, 1)

        [Header(Height Falloff)]
        _HeightFadeStart ("Fade Start Height (m)", Float) = 0.05
        _HeightFadeEnd ("Fade End Height (m)", Float) = 1.5
        _HeightRadiusMul ("Radius Grow With Height", Range(0.0, 3.0)) = 1.0
        _Height ("Height from Raycast (m)", Float) = 0.0

        [Header(VRChat)]
        [Toggle] _HideInMirror ("Hide In Mirror", Float) = 0
        [Toggle] _HideInCamera ("Hide In Camera", Float) = 0
    }

    SubShader
    {
        Tags
        {
            "Queue" = "Transparent"
            "RenderType" = "Transparent"
            "IgnoreProjector" = "True"
            "VRCFallback" = "Hidden"
        }

        Pass
        {
            Name "PlaneShadow"

            Cull Off
            ZWrite Off
            ZTest LEqual
            Blend SrcAlpha OneMinusSrcAlpha

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #pragma target 3.0

            #include "UnityCG.cginc"

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
            float _Height;

            float _HideInMirror;
            float _HideInCamera;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f
            {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
                UNITY_VERTEX_OUTPUT_STEREO
            };

            v2f vert(appdata v)
            {
                v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);

                if (_HideInCamera > 0.5 && _VRChatCameraMode != 0.0) discard;
                if (_HideInMirror > 0.5 && (_VRChatMirrorMode != 0.0 || _VRChatFaceMirrorMode != 0.0)) discard;

                float manualHeightClamped = max(_Height, 0.0);
                float heightFactor = saturate(
                    (manualHeightClamped - _HeightFadeStart) /
                    max(_HeightFadeEnd - _HeightFadeStart, 0.001)
                );

                float heightAlpha = 1.0 - heightFactor;
                float dynamicRadius = saturate(_ShadowRadius * (1.0 + heightFactor * _HeightRadiusMul));

                float2 centerUV = i.uv - float2(0.5, 0.5);
                float dist = length(centerUV);

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