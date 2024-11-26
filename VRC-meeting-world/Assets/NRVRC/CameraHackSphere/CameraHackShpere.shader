Shader "NRVRC/CameraHackShpere"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
    }
        SubShader
    {
        Pass
        {
            Cull Front
            ZTest Always
            ZWrite On

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct VSinput
            {
                float4 vertex : POSITION;
            };

            struct PSinput
            {
                float4 vertex : SV_POSITION;
            };

            float _VRChatCameraMode;
            float _VRChatMirrorMode;

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float4 _MainTex_TexelSize;

            PSinput vert(VSinput v)
            {
                // _VRChatCameraModeについてはhttps://vcc.docs.vrchat.com/guides/version-matching/
                int sign = (_VRChatCameraMode == 1 || _VRChatCameraMode == 2 ? 1 : 0);
                sign = 1; // デバッグ用

                // View座標系におけるカメラの座標(CameraからのSphereの相対座標)から距離を求める
                float3 sphere_center = UnityObjectToViewPos(float3(0, 0, 0));
                float sphere_dis = length(sphere_center);

                // 
                float sphere_scale = length(mul(unity_ObjectToWorld, float4(0, 0, 1, 0)));

                // カメラとSphereが離れていたら描画しない
                if (sphere_dis > sphere_scale * 0.5)
                {
                    sign = 0;
                }

                PSinput o;

                // signが0出ない = CameraHackすす
                // 必ずCameraの描画をすべて埋めたいため10倍しておく
                o.vertex = UnityObjectToClipPos(v.vertex * 10) * sign;

                // FarPlaneに引っかからないようにする。inversZなのでWで割って1になる数を入れる。
                o.vertex.z = o.vertex.w;
                return o;
            }

            fixed4 frag(PSinput i) : SV_Target
            {
                // スクリーン座標をそのままuvとして使用する
                const float2 uv = i.vertex.xy / _ScreenParams.xy;
                fixed4 col = tex2D(_MainTex, uv);

                return col;
            }
            ENDCG
        }
    }
}
