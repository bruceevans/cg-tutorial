Shader "Custom/Ch03_twist"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Twist ("Twist", Range(0,5)) = 0.5
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

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _Twist;

            struct appdata {
                float4 vertex : POSITION;
                fixed4 uv : TEXCOORD0;
            };

            struct v2f {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target {
                return tex2D(_MainTex, i.uv);
            }

            ENDHLSL
        }
    }
    FallBack "Diffuse"
}
