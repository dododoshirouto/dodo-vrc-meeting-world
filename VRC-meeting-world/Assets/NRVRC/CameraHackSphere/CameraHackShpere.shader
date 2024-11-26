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
                // _VRChatCameraMode�ɂ��Ă�https://vcc.docs.vrchat.com/guides/version-matching/
                int sign = (_VRChatCameraMode == 1 || _VRChatCameraMode == 2 ? 1 : 0);
                sign = 1; // �f�o�b�O�p

                // View���W�n�ɂ�����J�����̍��W(Camera�����Sphere�̑��΍��W)���狗�������߂�
                float3 sphere_center = UnityObjectToViewPos(float3(0, 0, 0));
                float sphere_dis = length(sphere_center);

                // 
                float sphere_scale = length(mul(unity_ObjectToWorld, float4(0, 0, 1, 0)));

                // �J������Sphere������Ă�����`�悵�Ȃ�
                if (sphere_dis > sphere_scale * 0.5)
                {
                    sign = 0;
                }

                PSinput o;

                // sign��0�o�Ȃ� = CameraHack����
                // �K��Camera�̕`������ׂĖ��߂�������10�{���Ă���
                o.vertex = UnityObjectToClipPos(v.vertex * 10) * sign;

                // FarPlane�Ɉ���������Ȃ��悤�ɂ���BinversZ�Ȃ̂�W�Ŋ�����1�ɂȂ鐔������B
                o.vertex.z = o.vertex.w;
                return o;
            }

            fixed4 frag(PSinput i) : SV_Target
            {
                // �X�N���[�����W�����̂܂�uv�Ƃ��Ďg�p����
                const float2 uv = i.vertex.xy / _ScreenParams.xy;
                fixed4 col = tex2D(_MainTex, uv);

                return col;
            }
            ENDCG
        }
    }
}
