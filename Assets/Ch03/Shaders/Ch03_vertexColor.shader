Shader "Custom/Ch03_vertexColor"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        Pass
        {

            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            fixed4 _constantColor;

            struct appdata {
                float4 pos : SV_POSITION;
                fixed4 color : COLOR;
            };

            struct v2f {
                float4 vertex : POSITION;
                float4 color : COLOR;    
            };

            appdata vert (v2f v)
            {
                appdata o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.color = v.color;
                return o;
            }

            // passthrough frag shader
            fixed4 frag (appdata i) : SV_Target {
                return i.color; 
            }

            ENDHLSL
        }
    }
    FallBack "Diffuse"
}
