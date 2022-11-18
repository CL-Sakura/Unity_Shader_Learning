// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Shader Learning/Chapter5/Simple Shader"
{
   Properties {
       //声明一个Color类型的属性
		_Color ("Color Tint", Color) = (1.0, 1.0, 1.0, 1.0)
	}
	SubShader {
        Pass {
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            //告诉Unity哪个函数包含了顶点着色器的代码，哪个函数包含了片元着色器的代码
            // #pragma vertex name 一般写法

            // 在CG代码中，我们需要定义一个与属性名称和类型都匹配的变量
            fixed4 _Color;
            
            struct a2v {
                // POSITION 语义告诉Unity， 用模型空间的坐标顶点填充vertex变量
                float4 vertex : POSITION;
                // NORMAL 语义告诉Unity， 用模型空间的法线方向填充normal变量
                float3 normal : NORMAL;
                // TEXCOORD0 语义告诉Unity， 用模型空间的第一套纹理坐标填充texcoord变量
                float4 texcoord : TEXCOORD0;
            };

            struct v2f
            {
                // SV_POSITION 告诉Unity，pos里面包含了顶点在裁剪空间中的位置信息
                float4 pos : SV_POSITION;
                // COLOR0 语义可以用于存储颜色信息
                fixed3 color : COLOR0;
            };
            

            v2f vert (a2v v) {
                v2f o;
                o.pos  = UnityObjectToClipPos(v.vertex);
                o.color = v.normal * 0.5 + fixed3(0.5, 0.5, 0.5);
                return  o;
            }


             fixed4 frag(v2f i) : SV_Target {
                 // SV_Target告诉渲染器，把用户输出的存储到一个渲染目标中
                 fixed3 c = i.color;

                 // 用Color属性来控制输出颜色
                 c *= _Color.rgb;
                 return fixed4(c, 1.0);
             }


            ENDCG
        }
    }
}
