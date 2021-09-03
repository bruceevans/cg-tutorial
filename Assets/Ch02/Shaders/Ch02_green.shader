Shader "Custom/ch02-green-vert"
{

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
                o.color = float4(0, 1, 0, 1);
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
