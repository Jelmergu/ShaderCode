Shader "ScreenShaders/AdvancedBWShader" {
    Properties {
        _MainTex ("Base (RGB)", 2D) = "white" {}
        //IMPLEMENT: add rBlend property
        //IMPLEMENT: add gBlend property
        //IMPLEMENT: add bBlend property
    }
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag

            #include "UnityCG.cginc"

            uniform sampler2D _MainTex;
            //IMPLEMENT: add rBlend uniform
            //IMPLEMENT: add gBlend uniform
            //IMPLEMENT: add bBlend uniform

            float4 frag(v2f_img i) : COLOR {
                float4 color = tex2D(_MainTex, i.uv);

                //IMPLEMENT: convert rgb to BW
                //BWColor = total average of r, g and b

                float4 result = color;

                //Filter colors based on 3 different Blend variables
                // float redPercentage = color.r/(color.r+color.g-color.g*gBlend+color.b-color.b*bBlend);
                // result.r = lerp(BWColor, lerp(BWColor,color.r,redPercentage), rBlend);

                // float greenPercentage = color.g/(color.r-color.r*rBlend+color.g+color.b-color.b*bBlend);
                // result.g = lerp(BWColor, lerp(BWColor,color.g,greenPercentage), gBlend);

                // float bluePercentage = color.b/(color.r-color.r*rBlend+color.g-color.g*gBlend+color.b);
                // result.b = lerp(BWColor, lerp(BWColor,color.b,bluePercentage), bBlend);
                return result;
            }

            ENDCG
        }
    }
}