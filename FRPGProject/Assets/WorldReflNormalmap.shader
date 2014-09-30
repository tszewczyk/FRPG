  Shader "Glitter" {
Properties {
	_Color ("Main Color", Color) = (1,1,1,1)
	_SpecColor ("Specular Color", Color) = (0.5, 0.5, 0.5, 1)
	_Shininess ("Shininess", Range (0.03, 1)) = 0.078125
	_MainTex ("Base (RGB) Gloss (A)", 2D) = "white" {}
	_SpecMap ("Specular map", 2D) = "black" {}
	_SpecMap2 ("Specular map secondary", 2D) = "black" {}
}
SubShader { 
	Tags { "RenderType"="Opaque" }
	LOD 400
	
CGPROGRAM
#pragma surface surf BlinnPhong


sampler2D _MainTex;
sampler2D _SpecMap;
sampler2D _SpecMap2;
fixed4 _Color;
half _Shininess;

struct Input {
	float2 uv_MainTex;
	float2 uv_BumpMap;
	float2 uv_SpecMap;
	float2 uv_SpecMap2;
};

void surf (Input IN, inout SurfaceOutput o) {
	fixed4 tex = tex2D(_MainTex, IN.uv_MainTex);
	fixed4 specTex = tex2D(_SpecMap, IN.uv_SpecMap);
	fixed4 specTex2 = tex2D(_SpecMap2, IN.uv_SpecMap2);

	o.Gloss = specTex.r;
	o.Alpha = tex.a * _Color.a;
	o.Specular = (_Shininess * (specTex.g)) + specTex2.g;
	o.Normal =  UnpackNormal(specTex2);
}
ENDCG
}

FallBack "Specular"
}