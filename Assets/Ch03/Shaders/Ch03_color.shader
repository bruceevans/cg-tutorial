Shader "Custom/Ch03_color"
{
    Properties
    {
        _constantColor ("Color", Color) = (1,1,1,1)
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
                o.color = _constantColor;
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
