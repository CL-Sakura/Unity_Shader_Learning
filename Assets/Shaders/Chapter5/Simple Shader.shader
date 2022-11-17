// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Shader Learning/Chapter5/Simple Shader"
{
   Properties {
		_Color ("Color Tint", Color) = (1, 1, 1, 1)
	}
	SubShader {
        Pass {
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            //告诉Unity哪个函数包含了顶点着色器的代码，哪个函数包含了片元着色器的代码
            // #pragma vertex name 一般写法

            struct a2v {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 texcoord : TEXCOORD0;
            };


            

            float4 vert (a2v v) : SV_POSITION {
                return UnityObjectToClipPos(v.vertex);
            }


             fixed4 frag() : SV_Target {
                 return fixed4(1.0, 1.0, 1.0, 1.0);
             }


            ENDCG
        }
    }
}
