Shader "ScreenShaders/BWShader" {
    Properties {
        _MainTex ("Base (RGB)", 2D) = "white" {}
        colorAmount("Color amount",Range(0,1)) = 0
    }
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag

            #include "UnityCG.cginc"

            uniform sampler2D _MainTex;
            uniform float colorAmount;

            float4 frag(v2f_img i) : COLOR {
                float4 color = tex2D(_MainTex, i.uv);
                
                //IMPLEMENT: convert rgb to a singular BW value
                //BWColor = total average of r, g and b
                
                //IMPLEMENT: assign BW value to r, g and b variables
                //r = lerp between BWColor and r using colorAmount
                //g = lerp between BWColor and g using colorAmount
                //b = lerp between BWColor and b using colorAmount
                return color;
            }

            ENDCG
        }
    }
}