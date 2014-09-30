// Compiled shader for all platforms, uncompressed size: 949.5KB

Shader "Spaventacorvi/Glam Glitter D - Bumped Rough Textured" {
Properties {
 _Color ("Main color", Color) = (0.705882,0.705882,0.705882,1)
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _Shininess ("Shininess", Range(0,1)) = 0.3
 _Fakelight ("Fake light", Range(0,0.1)) = 0
 _Normalmap ("Normalmap", 2D) = "bump" {}
 _Specularglitter ("Specular glitter", 2D) = "white" {}
 _Specularpower05 ("Specular power (0 - 5)", Range(0,5)) = 0
 _Specularcontrast13 ("Specular contrast (1 - 3)", Range(1,3)) = 1
 _Glittermap ("Glitter map", 2D) = "white" {}
 _Glittercolor ("Glitter color", Color) = (1,1,1,1)
 _Glitterpower ("Glitter power", Range(0,10)) = 2
 _Glittercontrast13 ("Glitter contrast (1 - 3)", Range(1,3)) = 1
 _Glitteryspeed01 ("Glittery speed (0 - 1)", Range(0,1)) = 0.2
 _Glitterymaskdotsscale ("Glittery & mask dots scale", Range(0.1,8)) = 1
 _Mask ("Mask", 2D) = "black" {}
 _MasktransparencyDebug ("Mask transparency (Debug)", Range(0,1)) = 1
 _Maskadjust0515 ("Mask adjust (0.5 - 1.5)", Range(0.5,1.5)) = 1
}
SubShader { 
 Tags { "RenderType"="Opaque" }


 // Stats for Vertex shader:
 //       d3d11 : 24 avg math (23..26)
 //        d3d9 : 31 avg math (29..34)
 //      opengl : 31 avg math (29..34)
 // Stats for Fragment shader:
 //       d3d11 : 82 avg math (80..84), 6 avg texture (6..7)
 //        d3d9 : 108 avg math (105..111), 6 avg texture (6..7)
 //      opengl : 96 avg math (94..98), 6 avg texture (6..7)
 Pass {
  Name "FORWARDBASE"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
Program "vp" {
SubProgram "opengl " {
// Stats: 29 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
"3.0-!!ARBvp1.0
PARAM c[13] = { { 0 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R1.z, R0, c[7];
DP4 R1.y, R0, c[6];
DP4 R1.x, R0, c[5];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
ADD R0.xyz, R0, c[0].x;
MUL R2.xyz, R0.zxyw, R1.yzxw;
MAD R2.xyz, R0.yzxw, R1.zxyw, -R2;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R2;
MOV result.texcoord[3].xyz, R1;
MOV result.texcoord[2].xyz, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 29 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 29 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c12, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r0.w, c12.x
mov r0.xyz, v2
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
add r0.xyz, r0, c12.x
mul r2.xyz, r0.zxyw, r1.yzxw
mad r2.xyz, r0.yzxw, r1.zxyw, -r2
mul r2.xyz, v2.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul o5.xyz, r0.w, r2
mov o4.xyz, r1
mov o3.xyz, r0
mov o1.xy, v3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
// Stats: 23 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedooilndalaneljhihncooenjckicbkmglabaaaaaafeafaaaaadaaaaaa
cmaaaaaamaaaaaaahiabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcneadaaaa
eaaaabaapfaaaaaafjaaaaaeegiocaaaaaaaaaaabdaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaa
egbabaaaadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
aaaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
aaaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
acaaaaaaegiocaaaaaaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
baaaaaaibcaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaaaaaaaaabaaaaaaa
baaaaaaiccaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaaaaaaaaabbaaaaaa
baaaaaaiecaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaaaaaaaaabcaaaaaa
dgaaaaafhccabaaaadaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgbfbaaaacaaaaaaegiccaaaaaaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaa
abaaaaaadiaaaaahhcaabaaaacaaaaaacgajbaaaaaaaaaaajgaebaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaajgaebaaaaaaaaaaacgajbaaaabaaaaaaegacbaia
ebaaaaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaa
acaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaafaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 lightDirection_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  lowp vec3 tmpvar_11;
  tmpvar_11 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_11;
  highp mat2 tmpvar_12;
  tmpvar_12[0].x = -0.999999;
  tmpvar_12[0].y = 0.00159255;
  tmpvar_12[1].x = -0.00159255;
  tmpvar_12[1].y = -0.999999;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_13 = texture2D (_Mask, P_14);
  node_1540_2 = tmpvar_13;
  highp vec2 P_15;
  P_15 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_12) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_16;
  arg0_16 = (1.0 - texture2D (_Glittermap, P_15).xyz);
  highp vec3 tmpvar_17;
  tmpvar_17 = (max (arg0_16, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture2D (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_23.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_25;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 lightDirection_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_9;
  normal_9.xy = ((texture2D (_Normalmap, P_8).wy * 2.0) - 1.0);
  normal_9.z = sqrt((1.0 - clamp (dot (normal_9.xy, normal_9.xy), 0.0, 1.0)));
  normalLocal_4 = normal_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  lowp vec3 tmpvar_11;
  tmpvar_11 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_11;
  highp mat2 tmpvar_12;
  tmpvar_12[0].x = -0.999999;
  tmpvar_12[0].y = 0.00159255;
  tmpvar_12[1].x = -0.00159255;
  tmpvar_12[1].y = -0.999999;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_13 = texture2D (_Mask, P_14);
  node_1540_2 = tmpvar_13;
  highp vec2 P_15;
  P_15 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_12) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_16;
  arg0_16 = (1.0 - texture2D (_Glittermap, P_15).xyz);
  highp vec3 tmpvar_17;
  tmpvar_17 = (max (arg0_16, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture2D (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_23.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_25;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 lightDirection_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  lowp vec3 tmpvar_11;
  tmpvar_11 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_11;
  highp mat2 tmpvar_12;
  tmpvar_12[0].x = -0.999999;
  tmpvar_12[0].y = 0.00159255;
  tmpvar_12[1].x = -0.00159255;
  tmpvar_12[1].y = -0.999999;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_13 = texture (_Mask, P_14);
  node_1540_2 = tmpvar_13;
  highp vec2 P_15;
  P_15 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_12) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_16;
  arg0_16 = (1.0 - texture (_Glittermap, P_15).xyz);
  highp vec3 tmpvar_17;
  tmpvar_17 = (max (arg0_16, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_23.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_25;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 29 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
"3.0-!!ARBvp1.0
PARAM c[13] = { { 0 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R1.z, R0, c[7];
DP4 R1.y, R0, c[6];
DP4 R1.x, R0, c[5];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
ADD R0.xyz, R0, c[0].x;
MUL R2.xyz, R0.zxyw, R1.yzxw;
MAD R2.xyz, R0.yzxw, R1.zxyw, -R2;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R2;
MOV result.texcoord[3].xyz, R1;
MOV result.texcoord[2].xyz, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 29 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 29 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c12, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r0.w, c12.x
mov r0.xyz, v2
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
add r0.xyz, r0, c12.x
mul r2.xyz, r0.zxyw, r1.yzxw
mad r2.xyz, r0.yzxw, r1.zxyw, -r2
mul r2.xyz, v2.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul o5.xyz, r0.w, r2
mov o4.xyz, r1
mov o3.xyz, r0
mov o1.xy, v3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
// Stats: 23 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedooilndalaneljhihncooenjckicbkmglabaaaaaafeafaaaaadaaaaaa
cmaaaaaamaaaaaaahiabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcneadaaaa
eaaaabaapfaaaaaafjaaaaaeegiocaaaaaaaaaaabdaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaa
egbabaaaadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
aaaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
aaaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
acaaaaaaegiocaaaaaaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
baaaaaaibcaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaaaaaaaaabaaaaaaa
baaaaaaiccaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaaaaaaaaabbaaaaaa
baaaaaaiecaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaaaaaaaaabcaaaaaa
dgaaaaafhccabaaaadaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgbfbaaaacaaaaaaegiccaaaaaaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaa
abaaaaaadiaaaaahhcaabaaaacaaaaaacgajbaaaaaaaaaaajgaebaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaajgaebaaaaaaaaaaacgajbaaaabaaaaaaegacbaia
ebaaaaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaa
acaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaafaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 lightDirection_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  lowp vec3 tmpvar_11;
  tmpvar_11 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_11;
  highp mat2 tmpvar_12;
  tmpvar_12[0].x = -0.999999;
  tmpvar_12[0].y = 0.00159255;
  tmpvar_12[1].x = -0.00159255;
  tmpvar_12[1].y = -0.999999;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_13 = texture2D (_Mask, P_14);
  node_1540_2 = tmpvar_13;
  highp vec2 P_15;
  P_15 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_12) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_16;
  arg0_16 = (1.0 - texture2D (_Glittermap, P_15).xyz);
  highp vec3 tmpvar_17;
  tmpvar_17 = (max (arg0_16, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture2D (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_23.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_25;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 lightDirection_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_9;
  normal_9.xy = ((texture2D (_Normalmap, P_8).wy * 2.0) - 1.0);
  normal_9.z = sqrt((1.0 - clamp (dot (normal_9.xy, normal_9.xy), 0.0, 1.0)));
  normalLocal_4 = normal_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  lowp vec3 tmpvar_11;
  tmpvar_11 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_11;
  highp mat2 tmpvar_12;
  tmpvar_12[0].x = -0.999999;
  tmpvar_12[0].y = 0.00159255;
  tmpvar_12[1].x = -0.00159255;
  tmpvar_12[1].y = -0.999999;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_13 = texture2D (_Mask, P_14);
  node_1540_2 = tmpvar_13;
  highp vec2 P_15;
  P_15 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_12) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_16;
  arg0_16 = (1.0 - texture2D (_Glittermap, P_15).xyz);
  highp vec3 tmpvar_17;
  tmpvar_17 = (max (arg0_16, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture2D (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_23.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_25;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 lightDirection_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  lowp vec3 tmpvar_11;
  tmpvar_11 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_11;
  highp mat2 tmpvar_12;
  tmpvar_12[0].x = -0.999999;
  tmpvar_12[0].y = 0.00159255;
  tmpvar_12[1].x = -0.00159255;
  tmpvar_12[1].y = -0.999999;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_13 = texture (_Mask, P_14);
  node_1540_2 = tmpvar_13;
  highp vec2 P_15;
  P_15 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_12) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_16;
  arg0_16 = (1.0 - texture (_Glittermap, P_15).xyz);
  highp vec3 tmpvar_17;
  tmpvar_17 = (max (arg0_16, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_23.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_25;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 29 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
"3.0-!!ARBvp1.0
PARAM c[13] = { { 0 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R1.z, R0, c[7];
DP4 R1.y, R0, c[6];
DP4 R1.x, R0, c[5];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
ADD R0.xyz, R0, c[0].x;
MUL R2.xyz, R0.zxyw, R1.yzxw;
MAD R2.xyz, R0.yzxw, R1.zxyw, -R2;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R2;
MOV result.texcoord[3].xyz, R1;
MOV result.texcoord[2].xyz, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 29 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 29 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c12, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r0.w, c12.x
mov r0.xyz, v2
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
add r0.xyz, r0, c12.x
mul r2.xyz, r0.zxyw, r1.yzxw
mad r2.xyz, r0.yzxw, r1.zxyw, -r2
mul r2.xyz, v2.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul o5.xyz, r0.w, r2
mov o4.xyz, r1
mov o3.xyz, r0
mov o1.xy, v3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
// Stats: 23 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedooilndalaneljhihncooenjckicbkmglabaaaaaafeafaaaaadaaaaaa
cmaaaaaamaaaaaaahiabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcneadaaaa
eaaaabaapfaaaaaafjaaaaaeegiocaaaaaaaaaaabdaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaa
egbabaaaadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
aaaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
aaaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
acaaaaaaegiocaaaaaaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
baaaaaaibcaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaaaaaaaaabaaaaaaa
baaaaaaiccaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaaaaaaaaabbaaaaaa
baaaaaaiecaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaaaaaaaaabcaaaaaa
dgaaaaafhccabaaaadaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgbfbaaaacaaaaaaegiccaaaaaaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaa
abaaaaaadiaaaaahhcaabaaaacaaaaaacgajbaaaaaaaaaaajgaebaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaajgaebaaaaaaaaaaacgajbaaaabaaaaaaegacbaia
ebaaaaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaa
acaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaafaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 lightDirection_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  lowp vec3 tmpvar_11;
  tmpvar_11 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_11;
  highp mat2 tmpvar_12;
  tmpvar_12[0].x = -0.999999;
  tmpvar_12[0].y = 0.00159255;
  tmpvar_12[1].x = -0.00159255;
  tmpvar_12[1].y = -0.999999;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_13 = texture2D (_Mask, P_14);
  node_1540_2 = tmpvar_13;
  highp vec2 P_15;
  P_15 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_12) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_16;
  arg0_16 = (1.0 - texture2D (_Glittermap, P_15).xyz);
  highp vec3 tmpvar_17;
  tmpvar_17 = (max (arg0_16, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture2D (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_23.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_25;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 lightDirection_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_9;
  normal_9.xy = ((texture2D (_Normalmap, P_8).wy * 2.0) - 1.0);
  normal_9.z = sqrt((1.0 - clamp (dot (normal_9.xy, normal_9.xy), 0.0, 1.0)));
  normalLocal_4 = normal_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  lowp vec3 tmpvar_11;
  tmpvar_11 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_11;
  highp mat2 tmpvar_12;
  tmpvar_12[0].x = -0.999999;
  tmpvar_12[0].y = 0.00159255;
  tmpvar_12[1].x = -0.00159255;
  tmpvar_12[1].y = -0.999999;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_13 = texture2D (_Mask, P_14);
  node_1540_2 = tmpvar_13;
  highp vec2 P_15;
  P_15 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_12) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_16;
  arg0_16 = (1.0 - texture2D (_Glittermap, P_15).xyz);
  highp vec3 tmpvar_17;
  tmpvar_17 = (max (arg0_16, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture2D (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_23.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_25;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 lightDirection_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  lowp vec3 tmpvar_11;
  tmpvar_11 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_11;
  highp mat2 tmpvar_12;
  tmpvar_12[0].x = -0.999999;
  tmpvar_12[0].y = 0.00159255;
  tmpvar_12[1].x = -0.00159255;
  tmpvar_12[1].y = -0.999999;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_13 = texture (_Mask, P_14);
  node_1540_2 = tmpvar_13;
  highp vec2 P_15;
  P_15 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_12) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_16;
  arg0_16 = (1.0 - texture (_Glittermap, P_15).xyz);
  highp vec3 tmpvar_17;
  tmpvar_17 = (max (arg0_16, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_23.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_25;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 34 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
"3.0-!!ARBvp1.0
PARAM c[14] = { { 0, 0.5 },
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R1.z, R0, c[7];
DP4 R1.y, R0, c[6];
DP4 R1.x, R0, c[5];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R1;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
ADD R1.xyz, R0, c[0].x;
MUL R0.xyz, R1.zxyw, R3.yzxw;
MAD R0.xyz, R1.yzxw, R3.zxyw, -R0;
MUL R0.xyz, vertex.attrib[14].w, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].y;
MUL R2.y, R2, c[13].x;
MOV result.texcoord[3].xyz, R3;
ADD result.texcoord[5].xy, R2, R2.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[2].xyz, R1;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 34 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 34 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c14, 0.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r0.w, c14.x
mov r0.xyz, v2
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r3.xyz, r0.w, r1
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
add r1.xyz, r0, c14.x
mul r0.xyz, r1.zxyw, r3.yzxw
mad r0.xyz, r1.yzxw, r3.zxyw, -r0
mul r0.xyz, v2.w, r0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul o5.xyz, r0.w, r0
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c14.y
mul r2.y, r2, c12.x
mov o4.xyz, r3
mad o6.xy, r2.z, c13.zwzw, r2
mov o0, r0
mov o6.zw, r0
mov o3.xyz, r1
mov o1.xy, v3
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
// Stats: 26 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerCamera" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedmleiiecjgjfdeomojhpbphibfdhlompiabaaaaaabeagaaaaadaaaaaa
cmaaaaaamaaaaaaajaabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklfdeieefchmaeaaaaeaaaabaabpabaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaabdaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaad
pccabaaaagaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
abaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpccabaaaacaaaaaaegiocaaaabaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaabaaaaaaibcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabaaaaaaabaaaaaaiccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabbaaaaaabaaaaaaiecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabcaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaafgbfbaaaacaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaa
acaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaa
aeaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaa
jgaebaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgaebaaaabaaaaaacgajbaaa
acaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgbpbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hccabaaaafaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaagaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 glstate_lightmodel_ambient;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_Normalmap, P_9).xyz * 2.0) - 1.0);
  normalLocal_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float tmpvar_13;
  mediump float lightShadowDataX_14;
  highp float dist_15;
  lowp float tmpvar_16;
  tmpvar_16 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_15 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = _LightShadowData.x;
  lightShadowDataX_14 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = max (float((dist_15 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_14);
  tmpvar_13 = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = (tmpvar_13 * 2.0);
  attenuation_3 = tmpvar_19;
  highp mat2 tmpvar_20;
  tmpvar_20[0].x = -0.999999;
  tmpvar_20[0].y = 0.00159255;
  tmpvar_20[1].x = -0.00159255;
  tmpvar_20[1].y = -0.999999;
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_21 = texture2D (_Mask, P_22);
  node_1540_2 = tmpvar_21;
  highp vec2 P_23;
  P_23 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_20) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_24;
  arg0_24 = (1.0 - texture2D (_Glittermap, P_23).xyz);
  highp vec3 tmpvar_25;
  tmpvar_25 = (max (arg0_24, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture2D (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture2D (_Specularglitter, P_29);
  highp vec3 tmpvar_30;
  tmpvar_30 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture2D (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_31.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
  tmpvar_1 = tmpvar_33;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = o_7;
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_10;
  normal_10.xy = ((texture2D (_Normalmap, P_9).wy * 2.0) - 1.0);
  normal_10.z = sqrt((1.0 - clamp (dot (normal_10.xy, normal_10.xy), 0.0, 1.0)));
  normalLocal_5 = normal_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x * 2.0);
  attenuation_3 = tmpvar_13;
  highp mat2 tmpvar_14;
  tmpvar_14[0].x = -0.999999;
  tmpvar_14[0].y = 0.00159255;
  tmpvar_14[1].x = -0.00159255;
  tmpvar_14[1].y = -0.999999;
  lowp vec4 tmpvar_15;
  highp vec2 P_16;
  P_16 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_15 = texture2D (_Mask, P_16);
  node_1540_2 = tmpvar_15;
  highp vec2 P_17;
  P_17 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_14) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_18;
  arg0_18 = (1.0 - texture2D (_Glittermap, P_17).xyz);
  highp vec3 tmpvar_19;
  tmpvar_19 = (max (arg0_18, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_20 = texture2D (_Glittermap, P_21);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_22 = texture2D (_Specularglitter, P_23);
  highp vec3 tmpvar_24;
  tmpvar_24 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_19) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_25 = texture2D (_MainTex, P_26);
  highp vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_25.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_24)) + (tmpvar_24 * _Fakelight));
  tmpvar_1 = tmpvar_27;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 glstate_lightmodel_ambient;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture (_Normalmap, P_9).xyz * 2.0) - 1.0);
  normalLocal_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float tmpvar_13;
  mediump float lightShadowDataX_14;
  highp float dist_15;
  lowp float tmpvar_16;
  tmpvar_16 = textureProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_15 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = _LightShadowData.x;
  lightShadowDataX_14 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = max (float((dist_15 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_14);
  tmpvar_13 = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = (tmpvar_13 * 2.0);
  attenuation_3 = tmpvar_19;
  highp mat2 tmpvar_20;
  tmpvar_20[0].x = -0.999999;
  tmpvar_20[0].y = 0.00159255;
  tmpvar_20[1].x = -0.00159255;
  tmpvar_20[1].y = -0.999999;
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_21 = texture (_Mask, P_22);
  node_1540_2 = tmpvar_21;
  highp vec2 P_23;
  P_23 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_20) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_24;
  arg0_24 = (1.0 - texture (_Glittermap, P_23).xyz);
  highp vec3 tmpvar_25;
  tmpvar_25 = (max (arg0_24, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture (_Specularglitter, P_29);
  highp vec3 tmpvar_30;
  tmpvar_30 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_31.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
  tmpvar_1 = tmpvar_33;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 34 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
"3.0-!!ARBvp1.0
PARAM c[14] = { { 0, 0.5 },
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R1.z, R0, c[7];
DP4 R1.y, R0, c[6];
DP4 R1.x, R0, c[5];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R1;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
ADD R1.xyz, R0, c[0].x;
MUL R0.xyz, R1.zxyw, R3.yzxw;
MAD R0.xyz, R1.yzxw, R3.zxyw, -R0;
MUL R0.xyz, vertex.attrib[14].w, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].y;
MUL R2.y, R2, c[13].x;
MOV result.texcoord[3].xyz, R3;
ADD result.texcoord[5].xy, R2, R2.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[2].xyz, R1;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 34 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 34 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c14, 0.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r0.w, c14.x
mov r0.xyz, v2
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r3.xyz, r0.w, r1
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
add r1.xyz, r0, c14.x
mul r0.xyz, r1.zxyw, r3.yzxw
mad r0.xyz, r1.yzxw, r3.zxyw, -r0
mul r0.xyz, v2.w, r0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul o5.xyz, r0.w, r0
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c14.y
mul r2.y, r2, c12.x
mov o4.xyz, r3
mad o6.xy, r2.z, c13.zwzw, r2
mov o0, r0
mov o6.zw, r0
mov o3.xyz, r1
mov o1.xy, v3
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
// Stats: 26 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerCamera" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedmleiiecjgjfdeomojhpbphibfdhlompiabaaaaaabeagaaaaadaaaaaa
cmaaaaaamaaaaaaajaabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklfdeieefchmaeaaaaeaaaabaabpabaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaabdaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaad
pccabaaaagaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
abaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpccabaaaacaaaaaaegiocaaaabaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaabaaaaaaibcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabaaaaaaabaaaaaaiccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabbaaaaaabaaaaaaiecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabcaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaafgbfbaaaacaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaa
acaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaa
aeaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaa
jgaebaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgaebaaaabaaaaaacgajbaaa
acaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgbpbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hccabaaaafaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaagaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 glstate_lightmodel_ambient;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_Normalmap, P_9).xyz * 2.0) - 1.0);
  normalLocal_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float tmpvar_13;
  mediump float lightShadowDataX_14;
  highp float dist_15;
  lowp float tmpvar_16;
  tmpvar_16 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_15 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = _LightShadowData.x;
  lightShadowDataX_14 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = max (float((dist_15 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_14);
  tmpvar_13 = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = (tmpvar_13 * 2.0);
  attenuation_3 = tmpvar_19;
  highp mat2 tmpvar_20;
  tmpvar_20[0].x = -0.999999;
  tmpvar_20[0].y = 0.00159255;
  tmpvar_20[1].x = -0.00159255;
  tmpvar_20[1].y = -0.999999;
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_21 = texture2D (_Mask, P_22);
  node_1540_2 = tmpvar_21;
  highp vec2 P_23;
  P_23 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_20) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_24;
  arg0_24 = (1.0 - texture2D (_Glittermap, P_23).xyz);
  highp vec3 tmpvar_25;
  tmpvar_25 = (max (arg0_24, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture2D (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture2D (_Specularglitter, P_29);
  highp vec3 tmpvar_30;
  tmpvar_30 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture2D (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_31.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
  tmpvar_1 = tmpvar_33;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = o_7;
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_10;
  normal_10.xy = ((texture2D (_Normalmap, P_9).wy * 2.0) - 1.0);
  normal_10.z = sqrt((1.0 - clamp (dot (normal_10.xy, normal_10.xy), 0.0, 1.0)));
  normalLocal_5 = normal_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x * 2.0);
  attenuation_3 = tmpvar_13;
  highp mat2 tmpvar_14;
  tmpvar_14[0].x = -0.999999;
  tmpvar_14[0].y = 0.00159255;
  tmpvar_14[1].x = -0.00159255;
  tmpvar_14[1].y = -0.999999;
  lowp vec4 tmpvar_15;
  highp vec2 P_16;
  P_16 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_15 = texture2D (_Mask, P_16);
  node_1540_2 = tmpvar_15;
  highp vec2 P_17;
  P_17 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_14) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_18;
  arg0_18 = (1.0 - texture2D (_Glittermap, P_17).xyz);
  highp vec3 tmpvar_19;
  tmpvar_19 = (max (arg0_18, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_20 = texture2D (_Glittermap, P_21);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_22 = texture2D (_Specularglitter, P_23);
  highp vec3 tmpvar_24;
  tmpvar_24 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_19) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_25 = texture2D (_MainTex, P_26);
  highp vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_25.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_24)) + (tmpvar_24 * _Fakelight));
  tmpvar_1 = tmpvar_27;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 glstate_lightmodel_ambient;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture (_Normalmap, P_9).xyz * 2.0) - 1.0);
  normalLocal_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float tmpvar_13;
  mediump float lightShadowDataX_14;
  highp float dist_15;
  lowp float tmpvar_16;
  tmpvar_16 = textureProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_15 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = _LightShadowData.x;
  lightShadowDataX_14 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = max (float((dist_15 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_14);
  tmpvar_13 = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = (tmpvar_13 * 2.0);
  attenuation_3 = tmpvar_19;
  highp mat2 tmpvar_20;
  tmpvar_20[0].x = -0.999999;
  tmpvar_20[0].y = 0.00159255;
  tmpvar_20[1].x = -0.00159255;
  tmpvar_20[1].y = -0.999999;
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_21 = texture (_Mask, P_22);
  node_1540_2 = tmpvar_21;
  highp vec2 P_23;
  P_23 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_20) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_24;
  arg0_24 = (1.0 - texture (_Glittermap, P_23).xyz);
  highp vec3 tmpvar_25;
  tmpvar_25 = (max (arg0_24, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture (_Specularglitter, P_29);
  highp vec3 tmpvar_30;
  tmpvar_30 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_31.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
  tmpvar_1 = tmpvar_33;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 34 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
"3.0-!!ARBvp1.0
PARAM c[14] = { { 0, 0.5 },
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R1.z, R0, c[7];
DP4 R1.y, R0, c[6];
DP4 R1.x, R0, c[5];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R1;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
ADD R1.xyz, R0, c[0].x;
MUL R0.xyz, R1.zxyw, R3.yzxw;
MAD R0.xyz, R1.yzxw, R3.zxyw, -R0;
MUL R0.xyz, vertex.attrib[14].w, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].y;
MUL R2.y, R2, c[13].x;
MOV result.texcoord[3].xyz, R3;
ADD result.texcoord[5].xy, R2, R2.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[2].xyz, R1;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 34 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 34 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c14, 0.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r0.w, c14.x
mov r0.xyz, v2
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r3.xyz, r0.w, r1
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
add r1.xyz, r0, c14.x
mul r0.xyz, r1.zxyw, r3.yzxw
mad r0.xyz, r1.yzxw, r3.zxyw, -r0
mul r0.xyz, v2.w, r0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul o5.xyz, r0.w, r0
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c14.y
mul r2.y, r2, c12.x
mov o4.xyz, r3
mad o6.xy, r2.z, c13.zwzw, r2
mov o0, r0
mov o6.zw, r0
mov o3.xyz, r1
mov o1.xy, v3
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
// Stats: 26 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerCamera" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedmleiiecjgjfdeomojhpbphibfdhlompiabaaaaaabeagaaaaadaaaaaa
cmaaaaaamaaaaaaajaabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklfdeieefchmaeaaaaeaaaabaabpabaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaabdaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaad
pccabaaaagaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
abaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpccabaaaacaaaaaaegiocaaaabaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaabaaaaaaibcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabaaaaaaabaaaaaaiccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabbaaaaaabaaaaaaiecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabcaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaafgbfbaaaacaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaa
acaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaa
aeaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaa
jgaebaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgaebaaaabaaaaaacgajbaaa
acaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgbpbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hccabaaaafaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaagaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 glstate_lightmodel_ambient;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_Normalmap, P_9).xyz * 2.0) - 1.0);
  normalLocal_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float tmpvar_13;
  mediump float lightShadowDataX_14;
  highp float dist_15;
  lowp float tmpvar_16;
  tmpvar_16 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_15 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = _LightShadowData.x;
  lightShadowDataX_14 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = max (float((dist_15 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_14);
  tmpvar_13 = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = (tmpvar_13 * 2.0);
  attenuation_3 = tmpvar_19;
  highp mat2 tmpvar_20;
  tmpvar_20[0].x = -0.999999;
  tmpvar_20[0].y = 0.00159255;
  tmpvar_20[1].x = -0.00159255;
  tmpvar_20[1].y = -0.999999;
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_21 = texture2D (_Mask, P_22);
  node_1540_2 = tmpvar_21;
  highp vec2 P_23;
  P_23 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_20) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_24;
  arg0_24 = (1.0 - texture2D (_Glittermap, P_23).xyz);
  highp vec3 tmpvar_25;
  tmpvar_25 = (max (arg0_24, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture2D (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture2D (_Specularglitter, P_29);
  highp vec3 tmpvar_30;
  tmpvar_30 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture2D (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_31.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
  tmpvar_1 = tmpvar_33;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = o_7;
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_10;
  normal_10.xy = ((texture2D (_Normalmap, P_9).wy * 2.0) - 1.0);
  normal_10.z = sqrt((1.0 - clamp (dot (normal_10.xy, normal_10.xy), 0.0, 1.0)));
  normalLocal_5 = normal_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x * 2.0);
  attenuation_3 = tmpvar_13;
  highp mat2 tmpvar_14;
  tmpvar_14[0].x = -0.999999;
  tmpvar_14[0].y = 0.00159255;
  tmpvar_14[1].x = -0.00159255;
  tmpvar_14[1].y = -0.999999;
  lowp vec4 tmpvar_15;
  highp vec2 P_16;
  P_16 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_15 = texture2D (_Mask, P_16);
  node_1540_2 = tmpvar_15;
  highp vec2 P_17;
  P_17 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_14) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_18;
  arg0_18 = (1.0 - texture2D (_Glittermap, P_17).xyz);
  highp vec3 tmpvar_19;
  tmpvar_19 = (max (arg0_18, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_20 = texture2D (_Glittermap, P_21);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_22 = texture2D (_Specularglitter, P_23);
  highp vec3 tmpvar_24;
  tmpvar_24 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_19) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_25 = texture2D (_MainTex, P_26);
  highp vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_25.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_24)) + (tmpvar_24 * _Fakelight));
  tmpvar_1 = tmpvar_27;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 glstate_lightmodel_ambient;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture (_Normalmap, P_9).xyz * 2.0) - 1.0);
  normalLocal_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float tmpvar_13;
  mediump float lightShadowDataX_14;
  highp float dist_15;
  lowp float tmpvar_16;
  tmpvar_16 = textureProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_15 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = _LightShadowData.x;
  lightShadowDataX_14 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = max (float((dist_15 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_14);
  tmpvar_13 = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = (tmpvar_13 * 2.0);
  attenuation_3 = tmpvar_19;
  highp mat2 tmpvar_20;
  tmpvar_20[0].x = -0.999999;
  tmpvar_20[0].y = 0.00159255;
  tmpvar_20[1].x = -0.00159255;
  tmpvar_20[1].y = -0.999999;
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_21 = texture (_Mask, P_22);
  node_1540_2 = tmpvar_21;
  highp vec2 P_23;
  P_23 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_20) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_24;
  arg0_24 = (1.0 - texture (_Glittermap, P_23).xyz);
  highp vec3 tmpvar_25;
  tmpvar_25 = (max (arg0_24, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture (_Specularglitter, P_29);
  highp vec3 tmpvar_30;
  tmpvar_30 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_31.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
  tmpvar_1 = tmpvar_33;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 29 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
"3.0-!!ARBvp1.0
PARAM c[13] = { { 0 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R1.z, R0, c[7];
DP4 R1.y, R0, c[6];
DP4 R1.x, R0, c[5];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
ADD R0.xyz, R0, c[0].x;
MUL R2.xyz, R0.zxyw, R1.yzxw;
MAD R2.xyz, R0.yzxw, R1.zxyw, -R2;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R2;
MOV result.texcoord[3].xyz, R1;
MOV result.texcoord[2].xyz, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 29 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 29 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c12, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r0.w, c12.x
mov r0.xyz, v2
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
add r0.xyz, r0, c12.x
mul r2.xyz, r0.zxyw, r1.yzxw
mad r2.xyz, r0.yzxw, r1.zxyw, -r2
mul r2.xyz, v2.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul o5.xyz, r0.w, r2
mov o4.xyz, r1
mov o3.xyz, r0
mov o1.xy, v3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
// Stats: 23 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedooilndalaneljhihncooenjckicbkmglabaaaaaafeafaaaaadaaaaaa
cmaaaaaamaaaaaaahiabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcneadaaaa
eaaaabaapfaaaaaafjaaaaaeegiocaaaaaaaaaaabdaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaa
egbabaaaadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
aaaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
aaaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
acaaaaaaegiocaaaaaaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
baaaaaaibcaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaaaaaaaaabaaaaaaa
baaaaaaiccaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaaaaaaaaabbaaaaaa
baaaaaaiecaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaaaaaaaaabcaaaaaa
dgaaaaafhccabaaaadaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgbfbaaaacaaaaaaegiccaaaaaaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaa
abaaaaaadiaaaaahhcaabaaaacaaaaaacgajbaaaaaaaaaaajgaebaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaajgaebaaaaaaaaaaacgajbaaaabaaaaaaegacbaia
ebaaaaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaa
acaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaafaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 lightDirection_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  lowp vec3 tmpvar_11;
  tmpvar_11 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_11;
  highp mat2 tmpvar_12;
  tmpvar_12[0].x = -0.999999;
  tmpvar_12[0].y = 0.00159255;
  tmpvar_12[1].x = -0.00159255;
  tmpvar_12[1].y = -0.999999;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_13 = texture2D (_Mask, P_14);
  node_1540_2 = tmpvar_13;
  highp vec2 P_15;
  P_15 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_12) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_16;
  arg0_16 = (1.0 - texture2D (_Glittermap, P_15).xyz);
  highp vec3 tmpvar_17;
  tmpvar_17 = (max (arg0_16, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture2D (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_23.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_25;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 lightDirection_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_9;
  normal_9.xy = ((texture2D (_Normalmap, P_8).wy * 2.0) - 1.0);
  normal_9.z = sqrt((1.0 - clamp (dot (normal_9.xy, normal_9.xy), 0.0, 1.0)));
  normalLocal_4 = normal_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  lowp vec3 tmpvar_11;
  tmpvar_11 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_11;
  highp mat2 tmpvar_12;
  tmpvar_12[0].x = -0.999999;
  tmpvar_12[0].y = 0.00159255;
  tmpvar_12[1].x = -0.00159255;
  tmpvar_12[1].y = -0.999999;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_13 = texture2D (_Mask, P_14);
  node_1540_2 = tmpvar_13;
  highp vec2 P_15;
  P_15 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_12) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_16;
  arg0_16 = (1.0 - texture2D (_Glittermap, P_15).xyz);
  highp vec3 tmpvar_17;
  tmpvar_17 = (max (arg0_16, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture2D (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_23.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_25;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 lightDirection_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  lowp vec3 tmpvar_11;
  tmpvar_11 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_11;
  highp mat2 tmpvar_12;
  tmpvar_12[0].x = -0.999999;
  tmpvar_12[0].y = 0.00159255;
  tmpvar_12[1].x = -0.00159255;
  tmpvar_12[1].y = -0.999999;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_13 = texture (_Mask, P_14);
  node_1540_2 = tmpvar_13;
  highp vec2 P_15;
  P_15 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_12) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_16;
  arg0_16 = (1.0 - texture (_Glittermap, P_15).xyz);
  highp vec3 tmpvar_17;
  tmpvar_17 = (max (arg0_16, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_23.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_25;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 34 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
"3.0-!!ARBvp1.0
PARAM c[14] = { { 0, 0.5 },
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R1.z, R0, c[7];
DP4 R1.y, R0, c[6];
DP4 R1.x, R0, c[5];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R1;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
ADD R1.xyz, R0, c[0].x;
MUL R0.xyz, R1.zxyw, R3.yzxw;
MAD R0.xyz, R1.yzxw, R3.zxyw, -R0;
MUL R0.xyz, vertex.attrib[14].w, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].y;
MUL R2.y, R2, c[13].x;
MOV result.texcoord[3].xyz, R3;
ADD result.texcoord[5].xy, R2, R2.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[2].xyz, R1;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 34 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 34 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c14, 0.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r0.w, c14.x
mov r0.xyz, v2
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r3.xyz, r0.w, r1
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
add r1.xyz, r0, c14.x
mul r0.xyz, r1.zxyw, r3.yzxw
mad r0.xyz, r1.yzxw, r3.zxyw, -r0
mul r0.xyz, v2.w, r0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul o5.xyz, r0.w, r0
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c14.y
mul r2.y, r2, c12.x
mov o4.xyz, r3
mad o6.xy, r2.z, c13.zwzw, r2
mov o0, r0
mov o6.zw, r0
mov o3.xyz, r1
mov o1.xy, v3
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
// Stats: 26 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerCamera" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedmleiiecjgjfdeomojhpbphibfdhlompiabaaaaaabeagaaaaadaaaaaa
cmaaaaaamaaaaaaajaabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklfdeieefchmaeaaaaeaaaabaabpabaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaabdaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaad
pccabaaaagaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
abaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpccabaaaacaaaaaaegiocaaaabaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaabaaaaaaibcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabaaaaaaabaaaaaaiccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabbaaaaaabaaaaaaiecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabcaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaafgbfbaaaacaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaa
acaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaa
aeaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaa
jgaebaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgaebaaaabaaaaaacgajbaaa
acaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgbpbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hccabaaaafaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaagaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 glstate_lightmodel_ambient;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_Normalmap, P_9).xyz * 2.0) - 1.0);
  normalLocal_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float tmpvar_13;
  mediump float lightShadowDataX_14;
  highp float dist_15;
  lowp float tmpvar_16;
  tmpvar_16 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_15 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = _LightShadowData.x;
  lightShadowDataX_14 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = max (float((dist_15 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_14);
  tmpvar_13 = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = (tmpvar_13 * 2.0);
  attenuation_3 = tmpvar_19;
  highp mat2 tmpvar_20;
  tmpvar_20[0].x = -0.999999;
  tmpvar_20[0].y = 0.00159255;
  tmpvar_20[1].x = -0.00159255;
  tmpvar_20[1].y = -0.999999;
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_21 = texture2D (_Mask, P_22);
  node_1540_2 = tmpvar_21;
  highp vec2 P_23;
  P_23 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_20) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_24;
  arg0_24 = (1.0 - texture2D (_Glittermap, P_23).xyz);
  highp vec3 tmpvar_25;
  tmpvar_25 = (max (arg0_24, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture2D (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture2D (_Specularglitter, P_29);
  highp vec3 tmpvar_30;
  tmpvar_30 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture2D (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_31.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
  tmpvar_1 = tmpvar_33;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = o_7;
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 glstate_lightmodel_ambient;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_10;
  normal_10.xy = ((texture2D (_Normalmap, P_9).wy * 2.0) - 1.0);
  normal_10.z = sqrt((1.0 - clamp (dot (normal_10.xy, normal_10.xy), 0.0, 1.0)));
  normalLocal_5 = normal_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float tmpvar_13;
  tmpvar_13 = (texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x * 2.0);
  attenuation_3 = tmpvar_13;
  highp mat2 tmpvar_14;
  tmpvar_14[0].x = -0.999999;
  tmpvar_14[0].y = 0.00159255;
  tmpvar_14[1].x = -0.00159255;
  tmpvar_14[1].y = -0.999999;
  lowp vec4 tmpvar_15;
  highp vec2 P_16;
  P_16 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_15 = texture2D (_Mask, P_16);
  node_1540_2 = tmpvar_15;
  highp vec2 P_17;
  P_17 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_14) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_18;
  arg0_18 = (1.0 - texture2D (_Glittermap, P_17).xyz);
  highp vec3 tmpvar_19;
  tmpvar_19 = (max (arg0_18, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_20 = texture2D (_Glittermap, P_21);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_22 = texture2D (_Specularglitter, P_23);
  highp vec3 tmpvar_24;
  tmpvar_24 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_19) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_25 = texture2D (_MainTex, P_26);
  highp vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_25.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_24)) + (tmpvar_24 * _Fakelight));
  tmpvar_1 = tmpvar_27;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 glstate_lightmodel_ambient;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture (_Normalmap, P_9).xyz * 2.0) - 1.0);
  normalLocal_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float tmpvar_13;
  mediump float lightShadowDataX_14;
  highp float dist_15;
  lowp float tmpvar_16;
  tmpvar_16 = textureProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_15 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = _LightShadowData.x;
  lightShadowDataX_14 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = max (float((dist_15 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_14);
  tmpvar_13 = tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_19 = (tmpvar_13 * 2.0);
  attenuation_3 = tmpvar_19;
  highp mat2 tmpvar_20;
  tmpvar_20[0].x = -0.999999;
  tmpvar_20[0].y = 0.00159255;
  tmpvar_20[1].x = -0.00159255;
  tmpvar_20[1].y = -0.999999;
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_21 = texture (_Mask, P_22);
  node_1540_2 = tmpvar_21;
  highp vec2 P_23;
  P_23 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_20) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_24;
  arg0_24 = (1.0 - texture (_Glittermap, P_23).xyz);
  highp vec3 tmpvar_25;
  tmpvar_25 = (max (arg0_24, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture (_Specularglitter, P_29);
  highp vec3 tmpvar_30;
  tmpvar_30 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_31.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
  tmpvar_1 = tmpvar_33;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 glstate_lightmodel_ambient;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_Normalmap, P_9).xyz * 2.0) - 1.0);
  normalLocal_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float shadow_13;
  lowp float tmpvar_14;
  tmpvar_14 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  highp float tmpvar_15;
  tmpvar_15 = (_LightShadowData.x + (tmpvar_14 * (1.0 - _LightShadowData.x)));
  shadow_13 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (shadow_13 * 2.0);
  attenuation_3 = tmpvar_16;
  highp mat2 tmpvar_17;
  tmpvar_17[0].x = -0.999999;
  tmpvar_17[0].y = 0.00159255;
  tmpvar_17[1].x = -0.00159255;
  tmpvar_17[1].y = -0.999999;
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_18 = texture2D (_Mask, P_19);
  node_1540_2 = tmpvar_18;
  highp vec2 P_20;
  P_20 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_17) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_21;
  arg0_21 = (1.0 - texture2D (_Glittermap, P_20).xyz);
  highp vec3 tmpvar_22;
  tmpvar_22 = (max (arg0_21, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_23 = texture2D (_Glittermap, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_25 = texture2D (_Specularglitter, P_26);
  highp vec3 tmpvar_27;
  tmpvar_27 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_23.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_22) + mix (pow ((tmpvar_25.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_28 = texture2D (_MainTex, P_29);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_28.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_22))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
  tmpvar_1 = tmpvar_30;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 glstate_lightmodel_ambient;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture (_Normalmap, P_9).xyz * 2.0) - 1.0);
  normalLocal_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float shadow_13;
  mediump float tmpvar_14;
  tmpvar_14 = texture (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  shadow_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = (_LightShadowData.x + (shadow_13 * (1.0 - _LightShadowData.x)));
  shadow_13 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (shadow_13 * 2.0);
  attenuation_3 = tmpvar_16;
  highp mat2 tmpvar_17;
  tmpvar_17[0].x = -0.999999;
  tmpvar_17[0].y = 0.00159255;
  tmpvar_17[1].x = -0.00159255;
  tmpvar_17[1].y = -0.999999;
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_18 = texture (_Mask, P_19);
  node_1540_2 = tmpvar_18;
  highp vec2 P_20;
  P_20 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_17) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_21;
  arg0_21 = (1.0 - texture (_Glittermap, P_20).xyz);
  highp vec3 tmpvar_22;
  tmpvar_22 = (max (arg0_21, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_23 = texture (_Glittermap, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_25 = texture (_Specularglitter, P_26);
  highp vec3 tmpvar_27;
  tmpvar_27 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_23.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_22) + mix (pow ((tmpvar_25.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_28 = texture (_MainTex, P_29);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_28.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_22))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
  tmpvar_1 = tmpvar_30;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 glstate_lightmodel_ambient;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_Normalmap, P_9).xyz * 2.0) - 1.0);
  normalLocal_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float shadow_13;
  lowp float tmpvar_14;
  tmpvar_14 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  highp float tmpvar_15;
  tmpvar_15 = (_LightShadowData.x + (tmpvar_14 * (1.0 - _LightShadowData.x)));
  shadow_13 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (shadow_13 * 2.0);
  attenuation_3 = tmpvar_16;
  highp mat2 tmpvar_17;
  tmpvar_17[0].x = -0.999999;
  tmpvar_17[0].y = 0.00159255;
  tmpvar_17[1].x = -0.00159255;
  tmpvar_17[1].y = -0.999999;
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_18 = texture2D (_Mask, P_19);
  node_1540_2 = tmpvar_18;
  highp vec2 P_20;
  P_20 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_17) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_21;
  arg0_21 = (1.0 - texture2D (_Glittermap, P_20).xyz);
  highp vec3 tmpvar_22;
  tmpvar_22 = (max (arg0_21, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_23 = texture2D (_Glittermap, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_25 = texture2D (_Specularglitter, P_26);
  highp vec3 tmpvar_27;
  tmpvar_27 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_23.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_22) + mix (pow ((tmpvar_25.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_28 = texture2D (_MainTex, P_29);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_28.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_22))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
  tmpvar_1 = tmpvar_30;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 glstate_lightmodel_ambient;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture (_Normalmap, P_9).xyz * 2.0) - 1.0);
  normalLocal_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float shadow_13;
  mediump float tmpvar_14;
  tmpvar_14 = texture (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  shadow_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = (_LightShadowData.x + (shadow_13 * (1.0 - _LightShadowData.x)));
  shadow_13 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (shadow_13 * 2.0);
  attenuation_3 = tmpvar_16;
  highp mat2 tmpvar_17;
  tmpvar_17[0].x = -0.999999;
  tmpvar_17[0].y = 0.00159255;
  tmpvar_17[1].x = -0.00159255;
  tmpvar_17[1].y = -0.999999;
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_18 = texture (_Mask, P_19);
  node_1540_2 = tmpvar_18;
  highp vec2 P_20;
  P_20 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_17) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_21;
  arg0_21 = (1.0 - texture (_Glittermap, P_20).xyz);
  highp vec3 tmpvar_22;
  tmpvar_22 = (max (arg0_21, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_23 = texture (_Glittermap, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_25 = texture (_Specularglitter, P_26);
  highp vec3 tmpvar_27;
  tmpvar_27 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_23.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_22) + mix (pow ((tmpvar_25.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_28 = texture (_MainTex, P_29);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_28.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_22))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
  tmpvar_1 = tmpvar_30;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 glstate_lightmodel_ambient;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_Normalmap, P_9).xyz * 2.0) - 1.0);
  normalLocal_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float shadow_13;
  lowp float tmpvar_14;
  tmpvar_14 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  highp float tmpvar_15;
  tmpvar_15 = (_LightShadowData.x + (tmpvar_14 * (1.0 - _LightShadowData.x)));
  shadow_13 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (shadow_13 * 2.0);
  attenuation_3 = tmpvar_16;
  highp mat2 tmpvar_17;
  tmpvar_17[0].x = -0.999999;
  tmpvar_17[0].y = 0.00159255;
  tmpvar_17[1].x = -0.00159255;
  tmpvar_17[1].y = -0.999999;
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_18 = texture2D (_Mask, P_19);
  node_1540_2 = tmpvar_18;
  highp vec2 P_20;
  P_20 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_17) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_21;
  arg0_21 = (1.0 - texture2D (_Glittermap, P_20).xyz);
  highp vec3 tmpvar_22;
  tmpvar_22 = (max (arg0_21, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_23 = texture2D (_Glittermap, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_25 = texture2D (_Specularglitter, P_26);
  highp vec3 tmpvar_27;
  tmpvar_27 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_23.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_22) + mix (pow ((tmpvar_25.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_28 = texture2D (_MainTex, P_29);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_28.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_22))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
  tmpvar_1 = tmpvar_30;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 glstate_lightmodel_ambient;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture (_Normalmap, P_9).xyz * 2.0) - 1.0);
  normalLocal_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float shadow_13;
  mediump float tmpvar_14;
  tmpvar_14 = texture (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  shadow_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = (_LightShadowData.x + (shadow_13 * (1.0 - _LightShadowData.x)));
  shadow_13 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (shadow_13 * 2.0);
  attenuation_3 = tmpvar_16;
  highp mat2 tmpvar_17;
  tmpvar_17[0].x = -0.999999;
  tmpvar_17[0].y = 0.00159255;
  tmpvar_17[1].x = -0.00159255;
  tmpvar_17[1].y = -0.999999;
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_18 = texture (_Mask, P_19);
  node_1540_2 = tmpvar_18;
  highp vec2 P_20;
  P_20 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_17) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_21;
  arg0_21 = (1.0 - texture (_Glittermap, P_20).xyz);
  highp vec3 tmpvar_22;
  tmpvar_22 = (max (arg0_21, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_23 = texture (_Glittermap, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_25 = texture (_Specularglitter, P_26);
  highp vec3 tmpvar_27;
  tmpvar_27 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_23.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_22) + mix (pow ((tmpvar_25.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_28 = texture (_MainTex, P_29);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_28.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_22))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
  tmpvar_1 = tmpvar_30;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 glstate_lightmodel_ambient;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture2D (_Normalmap, P_9).xyz * 2.0) - 1.0);
  normalLocal_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float shadow_13;
  lowp float tmpvar_14;
  tmpvar_14 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  highp float tmpvar_15;
  tmpvar_15 = (_LightShadowData.x + (tmpvar_14 * (1.0 - _LightShadowData.x)));
  shadow_13 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (shadow_13 * 2.0);
  attenuation_3 = tmpvar_16;
  highp mat2 tmpvar_17;
  tmpvar_17[0].x = -0.999999;
  tmpvar_17[0].y = 0.00159255;
  tmpvar_17[1].x = -0.00159255;
  tmpvar_17[1].y = -0.999999;
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_18 = texture2D (_Mask, P_19);
  node_1540_2 = tmpvar_18;
  highp vec2 P_20;
  P_20 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_17) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_21;
  arg0_21 = (1.0 - texture2D (_Glittermap, P_20).xyz);
  highp vec3 tmpvar_22;
  tmpvar_22 = (max (arg0_21, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_23 = texture2D (_Glittermap, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_25 = texture2D (_Specularglitter, P_26);
  highp vec3 tmpvar_27;
  tmpvar_27 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_23.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_22) + mix (pow ((tmpvar_25.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_28 = texture2D (_MainTex, P_29);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_28.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_22))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
  tmpvar_1 = tmpvar_30;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform highp vec4 glstate_lightmodel_ambient;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp float _Fakelight;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 lightDirection_4;
  highp vec3 normalLocal_5;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = xlv_TEXCOORD3.x;
  tmpvar_7[0].y = xlv_TEXCOORD4.x;
  tmpvar_7[0].z = tmpvar_6.x;
  tmpvar_7[1].x = xlv_TEXCOORD3.y;
  tmpvar_7[1].y = xlv_TEXCOORD4.y;
  tmpvar_7[1].z = tmpvar_6.y;
  tmpvar_7[2].x = xlv_TEXCOORD3.z;
  tmpvar_7[2].y = xlv_TEXCOORD4.z;
  tmpvar_7[2].z = tmpvar_6.z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_9;
  P_9 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_10;
  tmpvar_10 = ((texture (_Normalmap, P_9).xyz * 2.0) - 1.0);
  normalLocal_5 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((normalLocal_5 * tmpvar_7));
  lowp vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_12;
  lowp float shadow_13;
  mediump float tmpvar_14;
  tmpvar_14 = texture (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  shadow_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = (_LightShadowData.x + (shadow_13 * (1.0 - _LightShadowData.x)));
  shadow_13 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (shadow_13 * 2.0);
  attenuation_3 = tmpvar_16;
  highp mat2 tmpvar_17;
  tmpvar_17[0].x = -0.999999;
  tmpvar_17[0].y = 0.00159255;
  tmpvar_17[1].x = -0.00159255;
  tmpvar_17[1].y = -0.999999;
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_18 = texture (_Mask, P_19);
  node_1540_2 = tmpvar_18;
  highp vec2 P_20;
  P_20 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_17) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_21;
  arg0_21 = (1.0 - texture (_Glittermap, P_20).xyz);
  highp vec3 tmpvar_22;
  tmpvar_22 = (max (arg0_21, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_7 * tmpvar_8).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_23 = texture (_Glittermap, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_25 = texture (_Specularglitter, P_26);
  highp vec3 tmpvar_27;
  tmpvar_27 = (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_23.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_22) + mix (pow ((tmpvar_25.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz));
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_28 = texture (_MainTex, P_29);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * ((tmpvar_28.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_22))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
  tmpvar_1 = tmpvar_30;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 94 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_MainTex_ST]
Vector 7 [_Specularglitter_ST]
Float 8 [_MasktransparencyDebug]
Float 9 [_Specularpower05]
Float 10 [_Glitterpower]
Vector 11 [_Color]
Vector 12 [_Normalmap_ST]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Specularglitter] 2D 3
SetTexture 4 [_MainTex] 2D 4
"3.0-!!ARBfp1.0
PARAM c[24] = { state.lightmodel.ambient,
		program.local[1..20],
		{ 2, 1, 0, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
ADD R0.xyz, -fragment.texcoord[1], c[1];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MAD R1.xy, fragment.texcoord[0], c[12], c[12].zwzw;
TEX R2.yw, R1, texture[0], 2D;
MAD R3.xy, R2.wyzw, c[21].x, -c[21].y;
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, c[2];
MUL R5.xy, R3, R3;
MUL R2.xyz, R3.y, fragment.texcoord[4];
ADD_SAT R0.w, R5.x, R5.y;
DP3 R1.w, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[21].y;
RSQ R0.w, R0.w;
ADD R4.xyz, R1, R0;
MAD R3.xyz, R3.x, fragment.texcoord[3], R2;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R2, R3;
DP3 R1.w, R4, R4;
DP3 R0.w, R2, R2;
RSQ R1.w, R1.w;
MUL R3.xyz, R1.w, R4;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R2;
DP3 R0.w, R2, R3;
MAX R2.w, R0, c[21].z;
DP3 R0.w, fragment.texcoord[4], R0;
DP3 R0.z, fragment.texcoord[3], R0;
MOV R1.w, c[23].y;
MUL R1.w, R1, c[5].x;
MUL R5.xy, R0.zwzw, -c[16].x;
ADD R0.x, R1.w, c[21].y;
EX2 R0.z, R0.x;
MAD R0.xy, R5, c[21].w, fragment.texcoord[0];
POW R1.w, R2.w, R0.z;
ADD R0.zw, R0.xyxy, -c[22].x;
MUL R0.xy, R0.w, c[22].wyzw;
MAD R0.xy, R0.z, c[22].yzzw, R0;
MOV R0.w, c[16].x;
MUL R0.z, R0.w, -c[23].x;
ADD R0.xy, R0, c[22].x;
MUL R0.w, R0, c[22].x;
MUL R4.xyz, R1.w, c[3];
ADD R0.z, R0, c[21].y;
MUL R0.xy, R0, c[15].x;
MUL R3.xy, R0, R0.z;
MUL R5.zw, R3.xyxy, c[20].x;
MAD R0.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
MUL R0.xyz, R0, c[9].x;
MAD R3.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R3.xyz, R3, texture[1], 2D;
POW R0.x, R0.x, c[19].x;
POW R0.z, R0.z, c[19].x;
POW R0.y, R0.y, c[19].x;
MAD R6.xyz, R3, -R0, R0;
MAD R0.xy, R5.zwzw, c[17], c[17].zwzw;
TEX R0.xyz, R0, texture[2], 2D;
ADD R0.xyz, -R0, c[21].y;
MAX R3.xyz, R0, R3;
MUL R3.xyz, R3, c[8].x;
ADD R0.w, R0, c[21].y;
MAD R5.xy, -R5, c[21].w, fragment.texcoord[0];
MUL R5.xy, R5, R0.w;
DP3 R0.w, R2, R1;
MUL R5.xy, R5, c[15].x;
MAD R0.xy, R5, c[17], c[17].zwzw;
MOV R5.xyz, c[14];
MUL R5.xyz, R5, c[10].x;
TEX R0.xyz, R0, texture[2], 2D;
MUL R0.xyz, R5, R0;
MAX R0.w, R0, c[21].z;
POW R0.x, R0.x, c[18].x;
POW R0.z, R0.z, c[18].x;
POW R0.y, R0.y, c[18].x;
MAD R0.xyz, R3, -R0, R0;
ADD R0.xyz, R0, R6;
MUL R1.xyz, R4, R0;
MUL R2.xyz, R0, c[13].x;
MUL R0.xyz, R0.w, c[3];
MOV R0.w, c[21].y;
ADD R0.w, R0, -c[8].x;
MUL R4.xyz, R0.w, R3;
MAD R5.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R3.xyz, R5, texture[4], 2D;
ADD R0.xyz, R0, c[0];
MAD R3.xyz, R3, c[11], R4;
MAD R0.xyz, R0, R3, R1;
MAD result.color.xyz, R0, c[21].x, R2;
MOV result.color.w, c[21].y;
END
# 94 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 105 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_MainTex_ST]
Vector 7 [_Specularglitter_ST]
Float 8 [_MasktransparencyDebug]
Float 9 [_Specularpower05]
Float 10 [_Glitterpower]
Vector 11 [_Color]
Vector 12 [_Normalmap_ST]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Specularglitter] 2D 3
SetTexture 4 [_MainTex] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c21, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c22, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c23, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c24, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
mad r0.xy, v0, c12, c12.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c21.x, c21.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c21
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
dp3_pp r1.w, c2, c2
mad r0.xyz, r0.x, v3, r2
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r0
add r0.xyz, -v1, c1
dp3 r0.w, r1, r1
dp3 r2.x, r0, r0
rsq r2.x, r2.x
rsq r0.w, r0.w
mul r3.xyz, r2.x, r0
rsq_pp r1.w, r1.w
mul_pp r2.xyz, r1.w, c2
add r0.xyz, r2, r3
mul r1.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mul r0.xyz, r0.w, r0
mov r1.w, c5.x
mad r0.w, r1, c24.z, c24.y
dp3 r0.x, r1, r0
max r1.w, r0.x, c21.z
exp r2.w, r0.w
pow r0, r1.w, r2.w
mul r5.xyz, r0.x, c3
dp3 r0.w, v4, r3
dp3 r0.z, v3, r3
mul r7.xy, r0.zwzw, -c16.x
mad r3.xy, r7, c22.x, v0
add r6.xw, r3.yyzx, c22.y
mad r0.xy, v0, c7, c7.zwzw
texld r0.xyz, r0, s3
mul r4.xyz, r0, c9.x
pow r3, r4.x, c19.x
pow r0, r4.y, c19.x
mov r0.x, r3
pow r3, r4.z, c19.x
mul r7.zw, r6.x, c22
mov r0.z, r3
mad r3.xy, v0, c4, c4.zwzw
texld r3.xyz, r3, s1
mad r6.xyz, r3, -r0, r0
mad r0.xy, r6.w, c23, r7.zwzw
mov r0.z, c16.x
add r0.xy, r0, c23.z
mad r0.z, r0, c24.x, c24.y
mul r0.xy, r0, c15.x
mul r0.xy, r0, r0.z
mov r0.z, c16.x
mad r1.w, r0.z, c23.z, c23
mad r0.zw, -r7.xyxy, c22.x, v0.xyxy
mul r0.zw, r0, r1.w
mul r4.xy, r0.zwzw, c15.x
mov r0.w, c10.x
mul r0.xy, r0, c20.x
mad r0.xy, r0, c17, c17.zwzw
mad r4.xy, r4, c17, c17.zwzw
texld r0.xyz, r0, s2
texld r4.xyz, r4, s2
mul r7.xyz, c14, r0.w
mul r7.xyz, r7, r4
add r4.xyz, -r0, c21.w
pow r0, r7.x, c18.x
max r3.xyz, r4, r3
mul r4.xyz, r3, c8.x
pow r3, r7.y, c18.x
mov r7.x, r0
pow r0, r7.z, c18.x
dp3 r0.w, r1, r2
mov r7.y, r3
mov r7.z, r0
mad r0.xyz, r4, -r7, r7
add r0.xyz, r0, r6
mad r3.xy, v0, c6, c6.zwzw
mul r1.xyz, r5, r0
max r0.w, r0, c21.z
mul r2.xyz, r0, c13.x
mul r0.xyz, r0.w, c3
mov r0.w, c8.x
add r0.w, c21, -r0
add r0.xyz, r0, c0
mul r4.xyz, r0.w, r4
texld r3.xyz, r3, s4
mad r3.xyz, r3, c11, r4
mad r0.xyz, r0, r3, r1
mad oC0.xyz, r0, c21.x, r2
mov_pp oC0.w, c21
"
}
SubProgram "d3d11 " {
// Stats: 80 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Normalmap] 2D 3
SetTexture 1 [_Mask] 2D 0
SetTexture 2 [_Glittermap] 2D 4
SetTexture 3 [_Specularglitter] 2D 2
SetTexture 4 [_MainTex] 2D 1
ConstBuffer "$Globals" 224
Vector 16 [_LightColor0]
Vector 32 [_Mask_ST]
Float 48 [_Shininess]
Vector 64 [_MainTex_ST]
Vector 80 [_Specularglitter_ST]
Float 96 [_MasktransparencyDebug]
Float 100 [_Specularpower05]
Float 104 [_Glitterpower]
Vector 112 [_Color]
Vector 128 [_Normalmap_ST]
Float 144 [_Fakelight]
Vector 160 [_Glittercolor]
Float 176 [_Glitterymaskdotsscale]
Float 180 [_Glitteryspeed01]
Vector 192 [_Glittermap_ST]
Float 208 [_Glittercontrast13]
Float 212 [_Specularcontrast13]
Float 216 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerFrame" 3
"ps_4_0
eefiecedfjjlbbjhkmooalkjoldfahidjbjdbejfabaaaaaadianaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbiamaaaa
eaaaaaaaagadaaaafjaaaaaeegiocaaaaaaaaaaaaoaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
ahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaalaaaaaaaceaaaaa
mnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaia
ebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaah
ccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaa
acaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaak
bcaabaaaaaaaaaaabkiacaaaaaaaaaaaalaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaa
aaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaalaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaadiaaaaajlcaabaaa
aaaaaaaakgikcaaaaaaaaaaaagaaaaaaegiicaaaaaaaaaaaakaaaaaadiaaaaah
lcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaa
aaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaa
agiacaaaaaaaaaaaanaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
apaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaa
adaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
acaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaalaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaalaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaa
diaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaaanaaaaaa
dcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaaeaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaia
ebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaacaaaaaaogikcaaa
aaaaaaaaacaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaagaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaa
diaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaagaaaaaa
cpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaaanaaaaaabjaaaaafhcaabaaaaeaaaaaa
egacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaia
ebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaa
aaaaaaaaegaibaaaadaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaaihcaabaaaadaaaaaapgapbaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaaaaaaaaaagabaaaadaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaa
afaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaa
egbcbaaaafaaaaaadcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaa
aeaaaaaaegacbaaaagaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaa
egaabaaaafaaaaaaddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaa
aeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaa
adaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
abaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaajocaabaaa
abaaaaaaagijcaaaaaaaaaaaabaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaah
hcaabaaaadaaaaaakgakbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaa
adaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajhcaabaaaaeaaaaaa
egiccaaaadaaaaaaaeaaaaaaegiccaaaadaaaaaaaeaaaaaadcaaaaajhcaabaaa
abaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaaegacbaaaaeaaaaaaaaaaaaaj
ecaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaagaaaaaaabeaaaaaaaaaiadp
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaakgakbaaaaaaaaaaadcaaaaal
dcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaa
aaaaaaaaaeaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaa
aeaaaaaaaagabaaaabaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaaaeaaaaaa
egiccaaaaaaaaaaaahaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadcaaaaakhccabaaa
aaaaaaaaegadbaaaaaaaaaaaagiacaaaaaaaaaaaajaaaaaaegacbaaaabaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 94 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_MainTex_ST]
Vector 7 [_Specularglitter_ST]
Float 8 [_MasktransparencyDebug]
Float 9 [_Specularpower05]
Float 10 [_Glitterpower]
Vector 11 [_Color]
Vector 12 [_Normalmap_ST]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Specularglitter] 2D 3
SetTexture 4 [_MainTex] 2D 4
"3.0-!!ARBfp1.0
PARAM c[24] = { state.lightmodel.ambient,
		program.local[1..20],
		{ 2, 1, 0, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
ADD R0.xyz, -fragment.texcoord[1], c[1];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MAD R1.xy, fragment.texcoord[0], c[12], c[12].zwzw;
TEX R2.yw, R1, texture[0], 2D;
MAD R3.xy, R2.wyzw, c[21].x, -c[21].y;
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, c[2];
MUL R5.xy, R3, R3;
MUL R2.xyz, R3.y, fragment.texcoord[4];
ADD_SAT R0.w, R5.x, R5.y;
DP3 R1.w, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[21].y;
RSQ R0.w, R0.w;
ADD R4.xyz, R1, R0;
MAD R3.xyz, R3.x, fragment.texcoord[3], R2;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R2, R3;
DP3 R1.w, R4, R4;
DP3 R0.w, R2, R2;
RSQ R1.w, R1.w;
MUL R3.xyz, R1.w, R4;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R2;
DP3 R0.w, R2, R3;
MAX R2.w, R0, c[21].z;
DP3 R0.w, fragment.texcoord[4], R0;
DP3 R0.z, fragment.texcoord[3], R0;
MOV R1.w, c[23].y;
MUL R1.w, R1, c[5].x;
MUL R5.xy, R0.zwzw, -c[16].x;
ADD R0.x, R1.w, c[21].y;
EX2 R0.z, R0.x;
MAD R0.xy, R5, c[21].w, fragment.texcoord[0];
POW R1.w, R2.w, R0.z;
ADD R0.zw, R0.xyxy, -c[22].x;
MUL R0.xy, R0.w, c[22].wyzw;
MAD R0.xy, R0.z, c[22].yzzw, R0;
MOV R0.w, c[16].x;
MUL R0.z, R0.w, -c[23].x;
ADD R0.xy, R0, c[22].x;
MUL R0.w, R0, c[22].x;
MUL R4.xyz, R1.w, c[3];
ADD R0.z, R0, c[21].y;
MUL R0.xy, R0, c[15].x;
MUL R3.xy, R0, R0.z;
MUL R5.zw, R3.xyxy, c[20].x;
MAD R0.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
MUL R0.xyz, R0, c[9].x;
MAD R3.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R3.xyz, R3, texture[1], 2D;
POW R0.x, R0.x, c[19].x;
POW R0.z, R0.z, c[19].x;
POW R0.y, R0.y, c[19].x;
MAD R6.xyz, R3, -R0, R0;
MAD R0.xy, R5.zwzw, c[17], c[17].zwzw;
TEX R0.xyz, R0, texture[2], 2D;
ADD R0.xyz, -R0, c[21].y;
MAX R3.xyz, R0, R3;
MUL R3.xyz, R3, c[8].x;
ADD R0.w, R0, c[21].y;
MAD R5.xy, -R5, c[21].w, fragment.texcoord[0];
MUL R5.xy, R5, R0.w;
DP3 R0.w, R2, R1;
MUL R5.xy, R5, c[15].x;
MAD R0.xy, R5, c[17], c[17].zwzw;
MOV R5.xyz, c[14];
MUL R5.xyz, R5, c[10].x;
TEX R0.xyz, R0, texture[2], 2D;
MUL R0.xyz, R5, R0;
MAX R0.w, R0, c[21].z;
POW R0.x, R0.x, c[18].x;
POW R0.z, R0.z, c[18].x;
POW R0.y, R0.y, c[18].x;
MAD R0.xyz, R3, -R0, R0;
ADD R0.xyz, R0, R6;
MUL R1.xyz, R4, R0;
MUL R2.xyz, R0, c[13].x;
MUL R0.xyz, R0.w, c[3];
MOV R0.w, c[21].y;
ADD R0.w, R0, -c[8].x;
MUL R4.xyz, R0.w, R3;
MAD R5.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R3.xyz, R5, texture[4], 2D;
ADD R0.xyz, R0, c[0];
MAD R3.xyz, R3, c[11], R4;
MAD R0.xyz, R0, R3, R1;
MAD result.color.xyz, R0, c[21].x, R2;
MOV result.color.w, c[21].y;
END
# 94 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 105 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_MainTex_ST]
Vector 7 [_Specularglitter_ST]
Float 8 [_MasktransparencyDebug]
Float 9 [_Specularpower05]
Float 10 [_Glitterpower]
Vector 11 [_Color]
Vector 12 [_Normalmap_ST]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Specularglitter] 2D 3
SetTexture 4 [_MainTex] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c21, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c22, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c23, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c24, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
mad r0.xy, v0, c12, c12.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c21.x, c21.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c21
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
dp3_pp r1.w, c2, c2
mad r0.xyz, r0.x, v3, r2
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r0
add r0.xyz, -v1, c1
dp3 r0.w, r1, r1
dp3 r2.x, r0, r0
rsq r2.x, r2.x
rsq r0.w, r0.w
mul r3.xyz, r2.x, r0
rsq_pp r1.w, r1.w
mul_pp r2.xyz, r1.w, c2
add r0.xyz, r2, r3
mul r1.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mul r0.xyz, r0.w, r0
mov r1.w, c5.x
mad r0.w, r1, c24.z, c24.y
dp3 r0.x, r1, r0
max r1.w, r0.x, c21.z
exp r2.w, r0.w
pow r0, r1.w, r2.w
mul r5.xyz, r0.x, c3
dp3 r0.w, v4, r3
dp3 r0.z, v3, r3
mul r7.xy, r0.zwzw, -c16.x
mad r3.xy, r7, c22.x, v0
add r6.xw, r3.yyzx, c22.y
mad r0.xy, v0, c7, c7.zwzw
texld r0.xyz, r0, s3
mul r4.xyz, r0, c9.x
pow r3, r4.x, c19.x
pow r0, r4.y, c19.x
mov r0.x, r3
pow r3, r4.z, c19.x
mul r7.zw, r6.x, c22
mov r0.z, r3
mad r3.xy, v0, c4, c4.zwzw
texld r3.xyz, r3, s1
mad r6.xyz, r3, -r0, r0
mad r0.xy, r6.w, c23, r7.zwzw
mov r0.z, c16.x
add r0.xy, r0, c23.z
mad r0.z, r0, c24.x, c24.y
mul r0.xy, r0, c15.x
mul r0.xy, r0, r0.z
mov r0.z, c16.x
mad r1.w, r0.z, c23.z, c23
mad r0.zw, -r7.xyxy, c22.x, v0.xyxy
mul r0.zw, r0, r1.w
mul r4.xy, r0.zwzw, c15.x
mov r0.w, c10.x
mul r0.xy, r0, c20.x
mad r0.xy, r0, c17, c17.zwzw
mad r4.xy, r4, c17, c17.zwzw
texld r0.xyz, r0, s2
texld r4.xyz, r4, s2
mul r7.xyz, c14, r0.w
mul r7.xyz, r7, r4
add r4.xyz, -r0, c21.w
pow r0, r7.x, c18.x
max r3.xyz, r4, r3
mul r4.xyz, r3, c8.x
pow r3, r7.y, c18.x
mov r7.x, r0
pow r0, r7.z, c18.x
dp3 r0.w, r1, r2
mov r7.y, r3
mov r7.z, r0
mad r0.xyz, r4, -r7, r7
add r0.xyz, r0, r6
mad r3.xy, v0, c6, c6.zwzw
mul r1.xyz, r5, r0
max r0.w, r0, c21.z
mul r2.xyz, r0, c13.x
mul r0.xyz, r0.w, c3
mov r0.w, c8.x
add r0.w, c21, -r0
add r0.xyz, r0, c0
mul r4.xyz, r0.w, r4
texld r3.xyz, r3, s4
mad r3.xyz, r3, c11, r4
mad r0.xyz, r0, r3, r1
mad oC0.xyz, r0, c21.x, r2
mov_pp oC0.w, c21
"
}
SubProgram "d3d11 " {
// Stats: 80 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Normalmap] 2D 3
SetTexture 1 [_Mask] 2D 0
SetTexture 2 [_Glittermap] 2D 4
SetTexture 3 [_Specularglitter] 2D 2
SetTexture 4 [_MainTex] 2D 1
ConstBuffer "$Globals" 224
Vector 16 [_LightColor0]
Vector 32 [_Mask_ST]
Float 48 [_Shininess]
Vector 64 [_MainTex_ST]
Vector 80 [_Specularglitter_ST]
Float 96 [_MasktransparencyDebug]
Float 100 [_Specularpower05]
Float 104 [_Glitterpower]
Vector 112 [_Color]
Vector 128 [_Normalmap_ST]
Float 144 [_Fakelight]
Vector 160 [_Glittercolor]
Float 176 [_Glitterymaskdotsscale]
Float 180 [_Glitteryspeed01]
Vector 192 [_Glittermap_ST]
Float 208 [_Glittercontrast13]
Float 212 [_Specularcontrast13]
Float 216 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerFrame" 3
"ps_4_0
eefiecedfjjlbbjhkmooalkjoldfahidjbjdbejfabaaaaaadianaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbiamaaaa
eaaaaaaaagadaaaafjaaaaaeegiocaaaaaaaaaaaaoaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
ahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaalaaaaaaaceaaaaa
mnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaia
ebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaah
ccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaa
acaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaak
bcaabaaaaaaaaaaabkiacaaaaaaaaaaaalaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaa
aaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaalaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaadiaaaaajlcaabaaa
aaaaaaaakgikcaaaaaaaaaaaagaaaaaaegiicaaaaaaaaaaaakaaaaaadiaaaaah
lcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaa
aaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaa
agiacaaaaaaaaaaaanaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
apaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaa
adaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
acaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaalaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaalaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaa
diaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaaanaaaaaa
dcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaaeaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaia
ebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaacaaaaaaogikcaaa
aaaaaaaaacaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaagaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaa
diaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaagaaaaaa
cpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaaanaaaaaabjaaaaafhcaabaaaaeaaaaaa
egacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaia
ebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaa
aaaaaaaaegaibaaaadaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaaihcaabaaaadaaaaaapgapbaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaaaaaaaaaagabaaaadaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaa
afaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaa
egbcbaaaafaaaaaadcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaa
aeaaaaaaegacbaaaagaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaa
egaabaaaafaaaaaaddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaa
aeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaa
adaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
abaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaajocaabaaa
abaaaaaaagijcaaaaaaaaaaaabaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaah
hcaabaaaadaaaaaakgakbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaa
adaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajhcaabaaaaeaaaaaa
egiccaaaadaaaaaaaeaaaaaaegiccaaaadaaaaaaaeaaaaaadcaaaaajhcaabaaa
abaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaaegacbaaaaeaaaaaaaaaaaaaj
ecaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaagaaaaaaabeaaaaaaaaaiadp
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaakgakbaaaaaaaaaaadcaaaaal
dcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaa
aaaaaaaaaeaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaa
aeaaaaaaaagabaaaabaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaaaeaaaaaa
egiccaaaaaaaaaaaahaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadcaaaaakhccabaaa
aaaaaaaaegadbaaaaaaaaaaaagiacaaaaaaaaaaaajaaaaaaegacbaaaabaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 94 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_MainTex_ST]
Vector 7 [_Specularglitter_ST]
Float 8 [_MasktransparencyDebug]
Float 9 [_Specularpower05]
Float 10 [_Glitterpower]
Vector 11 [_Color]
Vector 12 [_Normalmap_ST]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Specularglitter] 2D 3
SetTexture 4 [_MainTex] 2D 4
"3.0-!!ARBfp1.0
PARAM c[24] = { state.lightmodel.ambient,
		program.local[1..20],
		{ 2, 1, 0, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
ADD R0.xyz, -fragment.texcoord[1], c[1];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MAD R1.xy, fragment.texcoord[0], c[12], c[12].zwzw;
TEX R2.yw, R1, texture[0], 2D;
MAD R3.xy, R2.wyzw, c[21].x, -c[21].y;
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, c[2];
MUL R5.xy, R3, R3;
MUL R2.xyz, R3.y, fragment.texcoord[4];
ADD_SAT R0.w, R5.x, R5.y;
DP3 R1.w, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[21].y;
RSQ R0.w, R0.w;
ADD R4.xyz, R1, R0;
MAD R3.xyz, R3.x, fragment.texcoord[3], R2;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R2, R3;
DP3 R1.w, R4, R4;
DP3 R0.w, R2, R2;
RSQ R1.w, R1.w;
MUL R3.xyz, R1.w, R4;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R2;
DP3 R0.w, R2, R3;
MAX R2.w, R0, c[21].z;
DP3 R0.w, fragment.texcoord[4], R0;
DP3 R0.z, fragment.texcoord[3], R0;
MOV R1.w, c[23].y;
MUL R1.w, R1, c[5].x;
MUL R5.xy, R0.zwzw, -c[16].x;
ADD R0.x, R1.w, c[21].y;
EX2 R0.z, R0.x;
MAD R0.xy, R5, c[21].w, fragment.texcoord[0];
POW R1.w, R2.w, R0.z;
ADD R0.zw, R0.xyxy, -c[22].x;
MUL R0.xy, R0.w, c[22].wyzw;
MAD R0.xy, R0.z, c[22].yzzw, R0;
MOV R0.w, c[16].x;
MUL R0.z, R0.w, -c[23].x;
ADD R0.xy, R0, c[22].x;
MUL R0.w, R0, c[22].x;
MUL R4.xyz, R1.w, c[3];
ADD R0.z, R0, c[21].y;
MUL R0.xy, R0, c[15].x;
MUL R3.xy, R0, R0.z;
MUL R5.zw, R3.xyxy, c[20].x;
MAD R0.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
MUL R0.xyz, R0, c[9].x;
MAD R3.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R3.xyz, R3, texture[1], 2D;
POW R0.x, R0.x, c[19].x;
POW R0.z, R0.z, c[19].x;
POW R0.y, R0.y, c[19].x;
MAD R6.xyz, R3, -R0, R0;
MAD R0.xy, R5.zwzw, c[17], c[17].zwzw;
TEX R0.xyz, R0, texture[2], 2D;
ADD R0.xyz, -R0, c[21].y;
MAX R3.xyz, R0, R3;
MUL R3.xyz, R3, c[8].x;
ADD R0.w, R0, c[21].y;
MAD R5.xy, -R5, c[21].w, fragment.texcoord[0];
MUL R5.xy, R5, R0.w;
DP3 R0.w, R2, R1;
MUL R5.xy, R5, c[15].x;
MAD R0.xy, R5, c[17], c[17].zwzw;
MOV R5.xyz, c[14];
MUL R5.xyz, R5, c[10].x;
TEX R0.xyz, R0, texture[2], 2D;
MUL R0.xyz, R5, R0;
MAX R0.w, R0, c[21].z;
POW R0.x, R0.x, c[18].x;
POW R0.z, R0.z, c[18].x;
POW R0.y, R0.y, c[18].x;
MAD R0.xyz, R3, -R0, R0;
ADD R0.xyz, R0, R6;
MUL R1.xyz, R4, R0;
MUL R2.xyz, R0, c[13].x;
MUL R0.xyz, R0.w, c[3];
MOV R0.w, c[21].y;
ADD R0.w, R0, -c[8].x;
MUL R4.xyz, R0.w, R3;
MAD R5.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R3.xyz, R5, texture[4], 2D;
ADD R0.xyz, R0, c[0];
MAD R3.xyz, R3, c[11], R4;
MAD R0.xyz, R0, R3, R1;
MAD result.color.xyz, R0, c[21].x, R2;
MOV result.color.w, c[21].y;
END
# 94 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 105 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_MainTex_ST]
Vector 7 [_Specularglitter_ST]
Float 8 [_MasktransparencyDebug]
Float 9 [_Specularpower05]
Float 10 [_Glitterpower]
Vector 11 [_Color]
Vector 12 [_Normalmap_ST]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Specularglitter] 2D 3
SetTexture 4 [_MainTex] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c21, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c22, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c23, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c24, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
mad r0.xy, v0, c12, c12.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c21.x, c21.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c21
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
dp3_pp r1.w, c2, c2
mad r0.xyz, r0.x, v3, r2
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r0
add r0.xyz, -v1, c1
dp3 r0.w, r1, r1
dp3 r2.x, r0, r0
rsq r2.x, r2.x
rsq r0.w, r0.w
mul r3.xyz, r2.x, r0
rsq_pp r1.w, r1.w
mul_pp r2.xyz, r1.w, c2
add r0.xyz, r2, r3
mul r1.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mul r0.xyz, r0.w, r0
mov r1.w, c5.x
mad r0.w, r1, c24.z, c24.y
dp3 r0.x, r1, r0
max r1.w, r0.x, c21.z
exp r2.w, r0.w
pow r0, r1.w, r2.w
mul r5.xyz, r0.x, c3
dp3 r0.w, v4, r3
dp3 r0.z, v3, r3
mul r7.xy, r0.zwzw, -c16.x
mad r3.xy, r7, c22.x, v0
add r6.xw, r3.yyzx, c22.y
mad r0.xy, v0, c7, c7.zwzw
texld r0.xyz, r0, s3
mul r4.xyz, r0, c9.x
pow r3, r4.x, c19.x
pow r0, r4.y, c19.x
mov r0.x, r3
pow r3, r4.z, c19.x
mul r7.zw, r6.x, c22
mov r0.z, r3
mad r3.xy, v0, c4, c4.zwzw
texld r3.xyz, r3, s1
mad r6.xyz, r3, -r0, r0
mad r0.xy, r6.w, c23, r7.zwzw
mov r0.z, c16.x
add r0.xy, r0, c23.z
mad r0.z, r0, c24.x, c24.y
mul r0.xy, r0, c15.x
mul r0.xy, r0, r0.z
mov r0.z, c16.x
mad r1.w, r0.z, c23.z, c23
mad r0.zw, -r7.xyxy, c22.x, v0.xyxy
mul r0.zw, r0, r1.w
mul r4.xy, r0.zwzw, c15.x
mov r0.w, c10.x
mul r0.xy, r0, c20.x
mad r0.xy, r0, c17, c17.zwzw
mad r4.xy, r4, c17, c17.zwzw
texld r0.xyz, r0, s2
texld r4.xyz, r4, s2
mul r7.xyz, c14, r0.w
mul r7.xyz, r7, r4
add r4.xyz, -r0, c21.w
pow r0, r7.x, c18.x
max r3.xyz, r4, r3
mul r4.xyz, r3, c8.x
pow r3, r7.y, c18.x
mov r7.x, r0
pow r0, r7.z, c18.x
dp3 r0.w, r1, r2
mov r7.y, r3
mov r7.z, r0
mad r0.xyz, r4, -r7, r7
add r0.xyz, r0, r6
mad r3.xy, v0, c6, c6.zwzw
mul r1.xyz, r5, r0
max r0.w, r0, c21.z
mul r2.xyz, r0, c13.x
mul r0.xyz, r0.w, c3
mov r0.w, c8.x
add r0.w, c21, -r0
add r0.xyz, r0, c0
mul r4.xyz, r0.w, r4
texld r3.xyz, r3, s4
mad r3.xyz, r3, c11, r4
mad r0.xyz, r0, r3, r1
mad oC0.xyz, r0, c21.x, r2
mov_pp oC0.w, c21
"
}
SubProgram "d3d11 " {
// Stats: 80 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_Normalmap] 2D 3
SetTexture 1 [_Mask] 2D 0
SetTexture 2 [_Glittermap] 2D 4
SetTexture 3 [_Specularglitter] 2D 2
SetTexture 4 [_MainTex] 2D 1
ConstBuffer "$Globals" 224
Vector 16 [_LightColor0]
Vector 32 [_Mask_ST]
Float 48 [_Shininess]
Vector 64 [_MainTex_ST]
Vector 80 [_Specularglitter_ST]
Float 96 [_MasktransparencyDebug]
Float 100 [_Specularpower05]
Float 104 [_Glitterpower]
Vector 112 [_Color]
Vector 128 [_Normalmap_ST]
Float 144 [_Fakelight]
Vector 160 [_Glittercolor]
Float 176 [_Glitterymaskdotsscale]
Float 180 [_Glitteryspeed01]
Vector 192 [_Glittermap_ST]
Float 208 [_Glittercontrast13]
Float 212 [_Specularcontrast13]
Float 216 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerFrame" 3
"ps_4_0
eefiecedfjjlbbjhkmooalkjoldfahidjbjdbejfabaaaaaadianaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbiamaaaa
eaaaaaaaagadaaaafjaaaaaeegiocaaaaaaaaaaaaoaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
ahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaalaaaaaaaceaaaaa
mnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaia
ebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaah
ccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaa
acaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaak
bcaabaaaaaaaaaaabkiacaaaaaaaaaaaalaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaa
aaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaalaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaadiaaaaajlcaabaaa
aaaaaaaakgikcaaaaaaaaaaaagaaaaaaegiicaaaaaaaaaaaakaaaaaadiaaaaah
lcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaa
aaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaa
agiacaaaaaaaaaaaanaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
apaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaa
adaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
acaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaalaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaalaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaa
diaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaaanaaaaaa
dcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaaeaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaia
ebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaacaaaaaaogikcaaa
aaaaaaaaacaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaagaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaa
diaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaagaaaaaa
cpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaaanaaaaaabjaaaaafhcaabaaaaeaaaaaa
egacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaia
ebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaa
aaaaaaaaegaibaaaadaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaaihcaabaaaadaaaaaapgapbaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaaaaaaaaaagabaaaadaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaa
afaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaa
egbcbaaaafaaaaaadcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaa
aeaaaaaaegacbaaaagaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaa
egaabaaaafaaaaaaddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaa
aeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaa
adaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
abaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaajocaabaaa
abaaaaaaagijcaaaaaaaaaaaabaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaah
hcaabaaaadaaaaaakgakbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaa
adaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajhcaabaaaaeaaaaaa
egiccaaaadaaaaaaaeaaaaaaegiccaaaadaaaaaaaeaaaaaadcaaaaajhcaabaaa
abaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaaegacbaaaaeaaaaaaaaaaaaaj
ecaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaagaaaaaaabeaaaaaaaaaiadp
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaakgakbaaaaaaaaaaadcaaaaal
dcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaa
aaaaaaaaaeaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaa
aeaaaaaaaagabaaaabaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaaaeaaaaaa
egiccaaaaaaaaaaaahaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadcaaaaakhccabaaa
aaaaaaaaegadbaaaaaaaaaaaagiacaaaaaaaaaaaajaaaaaaegacbaaaabaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 98 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_MainTex_ST]
Vector 7 [_Specularglitter_ST]
Float 8 [_MasktransparencyDebug]
Float 9 [_Specularpower05]
Float 10 [_Glitterpower]
Vector 11 [_Color]
Vector 12 [_Normalmap_ST]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"3.0-!!ARBfp1.0
PARAM c[24] = { state.lightmodel.ambient,
		program.local[1..20],
		{ 0.050000001, 0.5, -0.99999875, -0.001592548 },
		{ 0.001592548, -0.99999875, 0.31830987, 1 },
		{ 2, 0, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
MAD R0.xy, fragment.texcoord[0], c[12], c[12].zwzw;
MAD R5.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MOV R0.z, c[22].w;
MAD R1.zw, R0.xywy, c[23].x, -R0.z;
MUL R1.xy, R1.zwzw, R1.zwzw;
ADD_SAT R0.w, R1.x, R1.y;
ADD R1.x, -R0.w, c[22].w;
MUL R0.xyz, fragment.texcoord[4], R1.w;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MOV R4.xy, c[23].xzzw;
RCP R1.w, R1.x;
MAD R0.xyz, fragment.texcoord[3], R1.z, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
MAD R0.xyz, R1.w, R1, R0;
DP3 R0.w, R0, R0;
RSQ R1.w, R0.w;
ADD R2.xyz, -fragment.texcoord[1], c[1];
DP3 R1.x, R2, R2;
RSQ R2.w, R1.x;
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R2.xyz, R2.w, R2;
MUL R1.xyz, R0.w, c[2];
ADD R3.xyz, R2, R1;
MUL R0.xyz, R1.w, R0;
DP3 R0.w, R3, R3;
RSQ R1.w, R0.w;
MUL R3.xyz, R1.w, R3;
DP3 R1.w, R0, R3;
MUL R0.w, R4.y, c[5].x;
ADD R0.w, R0, c[22];
DP3 R3.x, R2, fragment.texcoord[3];
DP3 R3.y, fragment.texcoord[4], R2;
MUL R4.zw, R3.xyxy, -c[16].x;
MAD R2.zw, R4, c[21].x, fragment.texcoord[0].xyxy;
ADD R3.zw, R2, -c[21].y;
MUL R3.xy, R3.w, c[22];
MAD R3.xy, R3.z, c[21].zwzw, R3;
ADD R3.xy, R3, c[21].y;
DP3 R1.x, R0, R1;
EX2 R0.w, R0.w;
MAX R1.w, R1, c[23].y;
POW R1.w, R1.w, R0.w;
TXP R2.x, fragment.texcoord[5], texture[1], 2D;
MUL R0.w, R2.x, c[23].x;
FLR R2.x, R0.w;
MUL R2.xyz, R2.x, c[3];
MUL R2.xyz, R2, R1.w;
MOV R1.w, c[16].x;
MAD R2.w, R1, -c[22].z, c[22];
MUL R3.xy, R3, c[15].x;
MUL R3.zw, R3.xyxy, R2.w;
MUL R6.xy, R3.zwzw, c[20].x;
MAD R3.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R3.xyz, R3, texture[4], 2D;
MUL R3.xyz, R3, c[9].x;
MAD R6.xy, R6, c[17], c[17].zwzw;
MUL R1.w, R1, c[21].y;
TEX R6.xyz, R6, texture[3], 2D;
ADD R6.xyz, -R6, c[22].w;
TEX R5.xyz, R5, texture[2], 2D;
ADD R1.w, R1, c[22];
MAD R4.zw, -R4, c[21].x, fragment.texcoord[0].xyxy;
MUL R4.zw, R4, R1.w;
MAX R1.w, R1.x, c[23].y;
MUL R1.xyz, R0.w, c[3];
MOV R0.w, c[22];
MUL R4.zw, R4, c[15].x;
POW R3.x, R3.x, c[19].x;
POW R3.z, R3.z, c[19].x;
POW R3.y, R3.y, c[19].x;
MAD R3.xyz, R5, -R3, R3;
MAX R5.xyz, R6, R5;
MAD R6.xy, R4.zwzw, c[17], c[17].zwzw;
MOV R4.yzw, c[14].xxyz;
MUL R4.yzw, R4, c[10].x;
TEX R6.xyz, R6, texture[3], 2D;
MUL R6.xyz, R4.yzww, R6;
MUL R5.xyz, R5, c[8].x;
POW R6.x, R6.x, c[18].x;
POW R6.z, R6.z, c[18].x;
POW R6.y, R6.y, c[18].x;
MAD R6.xyz, R5, -R6, R6;
ADD R3.xyz, R6, R3;
MUL R0.xyz, R3, R2;
MUL R2.xyz, R4.x, c[0];
MAD R4.xy, fragment.texcoord[0], c[6], c[6].zwzw;
MAD R1.xyz, R1.w, R1, R2;
ADD R0.w, R0, -c[8].x;
MUL R2.xyz, R5, R0.w;
TEX R4.xyz, R4, texture[5], 2D;
MAD R2.xyz, R4, c[11], R2;
MAD R0.xyz, R1, R2, R0;
MAD result.color.xyz, R3, c[13].x, R0;
MOV result.color.w, c[22];
END
# 98 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 111 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_MainTex_ST]
Vector 7 [_Specularglitter_ST]
Float 8 [_MasktransparencyDebug]
Float 9 [_Specularpower05]
Float 10 [_Glitterpower]
Vector 11 [_Color]
Vector 12 [_Normalmap_ST]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c21, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c22, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c23, -0.31830987, 1.00000000, 2.00000000, -1.00000000
def c24, 0.00000000, 10.00000000, 1.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
add r0.xyz, -v1, c1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r1.xyz, r0.w, r0
mad r0.xy, v0, c12, c12.zwzw
texld r0.yw, r0, s0
mad_pp r2.xy, r0.wyzw, c23.z, c23.w
dp3_pp r0.z, c2, c2
rsq_pp r0.z, r0.z
mul_pp r5.xyz, r0.z, c2
add r3.xyz, r1, r5
dp3 r1.w, r3, r3
mul r0.xyz, v4, r2.y
mul_pp r4.xy, r2, r2
mad r2.xyz, v3, r2.x, r0
add_pp_sat r0.x, r4, r4.y
add_pp r0.x, -r0, c22.w
rsq_pp r0.w, r0.x
dp3 r0.y, v2, v2
rsq r0.y, r0.y
rcp_pp r0.w, r0.w
mul r0.xyz, r0.y, v2
mad r0.xyz, r0.w, r0, r2
dp3 r0.w, r0, r0
rsq r1.w, r1.w
rsq r0.w, r0.w
mul r4.xyz, r0.w, r0
mul r2.xyz, r1.w, r3
dp3 r0.x, r4, r2
max r2.x, r0, c24
texldp r0.x, v5, s1
mov r0.y, c5.x
mad r0.y, r0, c24, c24.z
mul_pp r1.w, r0.x, c23.z
exp r2.y, r0.y
pow r0, r2.x, r2.y
frc r0.y, r1.w
mov r0.w, r0.x
add r0.y, r1.w, -r0
mul r0.xyz, r0.y, c3
mul r6.xyz, r0, r0.w
dp3 r0.w, v4, r1
dp3 r0.z, r1, v3
mul r3.xy, r0.zwzw, -c16.x
mad r2.xy, r3, c21.x, v0
add r7.xy, r2, c21.y
mad r0.xy, v0, c7, c7.zwzw
texld r0.xyz, r0, s4
mul r1.xyz, r0, c9.x
pow r0, r1.x, c19.x
pow r2, r1.y, c19.x
mov r2.x, r0
pow r0, r1.z, c19.x
mad r0.xy, v0, c4, c4.zwzw
mov r2.z, r0
texld r1.xyz, r0, s2
mul r3.zw, r7.y, c21
mad r0.xy, r7.x, c22, r3.zwzw
mov r0.z, c16.x
add r0.xy, r0, c22.z
mad r2.xyz, r1, -r2, r2
mad r0.z, r0, c23.x, c23.y
mul r0.xy, r0, c15.x
mul r0.xy, r0, r0.z
mov r0.z, c16.x
mad r2.w, r0.z, c22.z, c22
mad r0.zw, -r3.xyxy, c21.x, v0.xyxy
mul r0.zw, r0, r2.w
mul r3.xy, r0.zwzw, c15.x
mov r0.w, c10.x
mul r0.xy, r0, c20.x
mad r0.xy, r0, c17, c17.zwzw
mad r3.xy, r3, c17, c17.zwzw
texld r0.xyz, r0, s3
texld r3.xyz, r3, s3
mul r7.xyz, c14, r0.w
mul r7.xyz, r7, r3
add r3.xyz, -r0, c22.w
max r1.xyz, r3, r1
pow r0, r7.x, c18.x
pow r3, r7.y, c18.x
mov r7.x, r0
pow r0, r7.z, c18.x
dp3 r0.w, r4, r5
max r2.w, r0, c24.x
mov r0.w, c8.x
mul r1.xyz, r1, c8.x
mov r7.y, r3
mov r7.z, r0
mad r0.xyz, r1, -r7, r7
add r0.xyz, r0, r2
mov r2.xyz, c0
mul r4.xyz, r1.w, c3
mul r2.xyz, c23.z, r2
mad r2.xyz, r2.w, r4, r2
add r0.w, c22, -r0
mul r4.xyz, r1, r0.w
mad r5.xy, v0, c6, c6.zwzw
texld r1.xyz, r5, s5
mul r3.xyz, r0, r6
mad r1.xyz, r1, c11, r4
mad r1.xyz, r2, r1, r3
mad oC0.xyz, r0, c13.x, r1
mov_pp oC0.w, c22
"
}
SubProgram "d3d11 " {
// Stats: 84 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Normalmap] 2D 4
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [_Mask] 2D 1
SetTexture 3 [_Glittermap] 2D 5
SetTexture 4 [_Specularglitter] 2D 3
SetTexture 5 [_MainTex] 2D 2
ConstBuffer "$Globals" 288
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Vector 192 [_Normalmap_ST]
Float 208 [_Fakelight]
Vector 224 [_Glittercolor]
Float 240 [_Glitterymaskdotsscale]
Float 244 [_Glitteryspeed01]
Vector 256 [_Glittermap_ST]
Float 272 [_Glittercontrast13]
Float 276 [_Specularcontrast13]
Float 280 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerFrame" 3
"ps_4_0
eefiecedaobabbjlfjolodgplbhpaenadnpiiiodabaaaaaaaeaoaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmmamaaaaeaaaaaaaddadaaaa
fjaaaaaeegiocaaaaaaaaaaabcaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaad
aagabaaaafaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
ahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaapaaaaaaaceaaaaa
mnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaia
ebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaah
ccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaa
acaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaak
bcaabaaaaaaaaaaabkiacaaaaaaaaaaaapaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaa
aaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaapaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaabaaaaaaaogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaafaaaaaadiaaaaajlcaabaaa
aaaaaaaakgikcaaaaaaaaaaaakaaaaaaegiicaaaaaaaaaaaaoaaaaaadiaaaaah
lcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaa
aaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaa
agiacaaaaaaaaaaabbaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
apaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaa
adaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
acaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaapaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaapaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaa
diaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaabbaaaaaa
dcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaabaaaaaaa
ogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaadaaaaaaaagabaaaafaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaia
ebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
acaaaaaaaagabaaaabaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaakaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaaeaaaaaaaagabaaaadaaaaaa
diaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaakaaaaaa
cpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaabbaaaaaabjaaaaafhcaabaaaaeaaaaaa
egacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaia
ebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaa
aaaaaaaaegaibaaaadaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaaihcaabaaaadaaaaaapgapbaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaaaaaaaaaagabaaaaeaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaa
afaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaa
egbcbaaaafaaaaaadcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaa
aeaaaaaaegacbaaaagaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaa
egaabaaaafaaaaaaddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaa
aeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaa
ahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
abaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaoaaaaahgcaabaaa
abaaaaaaagbbbaaaagaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaa
jgafbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaa
abaaaaaaakaabaaaadaaaaaaakaabaaaadaaaaaaebaaaaafecaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaabaaaaaaegiccaaa
aaaaaaaaafaaaaaadiaaaaaiocaabaaaabaaaaaakgakbaaaabaaaaaaagijcaaa
aaaaaaaaafaaaaaadiaaaaahocaabaaaabaaaaaakgakbaaaaaaaaaaafgaobaaa
abaaaaaadiaaaaahocaabaaaabaaaaaaaganbaaaaaaaaaaafgaobaaaabaaaaaa
aaaaaaajhcaabaaaaeaaaaaaegiccaaaadaaaaaaaeaaaaaaegiccaaaadaaaaaa
aeaaaaaadcaaaaajhcaabaaaadaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaa
egacbaaaaeaaaaaaaaaaaaajecaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaa
akaaaaaaabeaaaaaaaaaiadpdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
kgakbaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaa
aaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaeaaaaaaeghobaaaafaaaaaaaagabaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaa
dcaaaaajhcaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaajgahbaaa
abaaaaaadcaaaaakhccabaaaaaaaaaaaegadbaaaaaaaaaaaagiacaaaaaaaaaaa
anaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadp
doaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 98 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_MainTex_ST]
Vector 7 [_Specularglitter_ST]
Float 8 [_MasktransparencyDebug]
Float 9 [_Specularpower05]
Float 10 [_Glitterpower]
Vector 11 [_Color]
Vector 12 [_Normalmap_ST]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"3.0-!!ARBfp1.0
PARAM c[24] = { state.lightmodel.ambient,
		program.local[1..20],
		{ 0.050000001, 0.5, -0.99999875, -0.001592548 },
		{ 0.001592548, -0.99999875, 0.31830987, 1 },
		{ 2, 0, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
MAD R0.xy, fragment.texcoord[0], c[12], c[12].zwzw;
MAD R5.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MOV R0.z, c[22].w;
MAD R1.zw, R0.xywy, c[23].x, -R0.z;
MUL R1.xy, R1.zwzw, R1.zwzw;
ADD_SAT R0.w, R1.x, R1.y;
ADD R1.x, -R0.w, c[22].w;
MUL R0.xyz, fragment.texcoord[4], R1.w;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MOV R4.xy, c[23].xzzw;
RCP R1.w, R1.x;
MAD R0.xyz, fragment.texcoord[3], R1.z, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
MAD R0.xyz, R1.w, R1, R0;
DP3 R0.w, R0, R0;
RSQ R1.w, R0.w;
ADD R2.xyz, -fragment.texcoord[1], c[1];
DP3 R1.x, R2, R2;
RSQ R2.w, R1.x;
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R2.xyz, R2.w, R2;
MUL R1.xyz, R0.w, c[2];
ADD R3.xyz, R2, R1;
MUL R0.xyz, R1.w, R0;
DP3 R0.w, R3, R3;
RSQ R1.w, R0.w;
MUL R3.xyz, R1.w, R3;
DP3 R1.w, R0, R3;
MUL R0.w, R4.y, c[5].x;
ADD R0.w, R0, c[22];
DP3 R3.x, R2, fragment.texcoord[3];
DP3 R3.y, fragment.texcoord[4], R2;
MUL R4.zw, R3.xyxy, -c[16].x;
MAD R2.zw, R4, c[21].x, fragment.texcoord[0].xyxy;
ADD R3.zw, R2, -c[21].y;
MUL R3.xy, R3.w, c[22];
MAD R3.xy, R3.z, c[21].zwzw, R3;
ADD R3.xy, R3, c[21].y;
DP3 R1.x, R0, R1;
EX2 R0.w, R0.w;
MAX R1.w, R1, c[23].y;
POW R1.w, R1.w, R0.w;
TXP R2.x, fragment.texcoord[5], texture[1], 2D;
MUL R0.w, R2.x, c[23].x;
FLR R2.x, R0.w;
MUL R2.xyz, R2.x, c[3];
MUL R2.xyz, R2, R1.w;
MOV R1.w, c[16].x;
MAD R2.w, R1, -c[22].z, c[22];
MUL R3.xy, R3, c[15].x;
MUL R3.zw, R3.xyxy, R2.w;
MUL R6.xy, R3.zwzw, c[20].x;
MAD R3.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R3.xyz, R3, texture[4], 2D;
MUL R3.xyz, R3, c[9].x;
MAD R6.xy, R6, c[17], c[17].zwzw;
MUL R1.w, R1, c[21].y;
TEX R6.xyz, R6, texture[3], 2D;
ADD R6.xyz, -R6, c[22].w;
TEX R5.xyz, R5, texture[2], 2D;
ADD R1.w, R1, c[22];
MAD R4.zw, -R4, c[21].x, fragment.texcoord[0].xyxy;
MUL R4.zw, R4, R1.w;
MAX R1.w, R1.x, c[23].y;
MUL R1.xyz, R0.w, c[3];
MOV R0.w, c[22];
MUL R4.zw, R4, c[15].x;
POW R3.x, R3.x, c[19].x;
POW R3.z, R3.z, c[19].x;
POW R3.y, R3.y, c[19].x;
MAD R3.xyz, R5, -R3, R3;
MAX R5.xyz, R6, R5;
MAD R6.xy, R4.zwzw, c[17], c[17].zwzw;
MOV R4.yzw, c[14].xxyz;
MUL R4.yzw, R4, c[10].x;
TEX R6.xyz, R6, texture[3], 2D;
MUL R6.xyz, R4.yzww, R6;
MUL R5.xyz, R5, c[8].x;
POW R6.x, R6.x, c[18].x;
POW R6.z, R6.z, c[18].x;
POW R6.y, R6.y, c[18].x;
MAD R6.xyz, R5, -R6, R6;
ADD R3.xyz, R6, R3;
MUL R0.xyz, R3, R2;
MUL R2.xyz, R4.x, c[0];
MAD R4.xy, fragment.texcoord[0], c[6], c[6].zwzw;
MAD R1.xyz, R1.w, R1, R2;
ADD R0.w, R0, -c[8].x;
MUL R2.xyz, R5, R0.w;
TEX R4.xyz, R4, texture[5], 2D;
MAD R2.xyz, R4, c[11], R2;
MAD R0.xyz, R1, R2, R0;
MAD result.color.xyz, R3, c[13].x, R0;
MOV result.color.w, c[22];
END
# 98 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 111 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_MainTex_ST]
Vector 7 [_Specularglitter_ST]
Float 8 [_MasktransparencyDebug]
Float 9 [_Specularpower05]
Float 10 [_Glitterpower]
Vector 11 [_Color]
Vector 12 [_Normalmap_ST]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c21, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c22, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c23, -0.31830987, 1.00000000, 2.00000000, -1.00000000
def c24, 0.00000000, 10.00000000, 1.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
add r0.xyz, -v1, c1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r1.xyz, r0.w, r0
mad r0.xy, v0, c12, c12.zwzw
texld r0.yw, r0, s0
mad_pp r2.xy, r0.wyzw, c23.z, c23.w
dp3_pp r0.z, c2, c2
rsq_pp r0.z, r0.z
mul_pp r5.xyz, r0.z, c2
add r3.xyz, r1, r5
dp3 r1.w, r3, r3
mul r0.xyz, v4, r2.y
mul_pp r4.xy, r2, r2
mad r2.xyz, v3, r2.x, r0
add_pp_sat r0.x, r4, r4.y
add_pp r0.x, -r0, c22.w
rsq_pp r0.w, r0.x
dp3 r0.y, v2, v2
rsq r0.y, r0.y
rcp_pp r0.w, r0.w
mul r0.xyz, r0.y, v2
mad r0.xyz, r0.w, r0, r2
dp3 r0.w, r0, r0
rsq r1.w, r1.w
rsq r0.w, r0.w
mul r4.xyz, r0.w, r0
mul r2.xyz, r1.w, r3
dp3 r0.x, r4, r2
max r2.x, r0, c24
texldp r0.x, v5, s1
mov r0.y, c5.x
mad r0.y, r0, c24, c24.z
mul_pp r1.w, r0.x, c23.z
exp r2.y, r0.y
pow r0, r2.x, r2.y
frc r0.y, r1.w
mov r0.w, r0.x
add r0.y, r1.w, -r0
mul r0.xyz, r0.y, c3
mul r6.xyz, r0, r0.w
dp3 r0.w, v4, r1
dp3 r0.z, r1, v3
mul r3.xy, r0.zwzw, -c16.x
mad r2.xy, r3, c21.x, v0
add r7.xy, r2, c21.y
mad r0.xy, v0, c7, c7.zwzw
texld r0.xyz, r0, s4
mul r1.xyz, r0, c9.x
pow r0, r1.x, c19.x
pow r2, r1.y, c19.x
mov r2.x, r0
pow r0, r1.z, c19.x
mad r0.xy, v0, c4, c4.zwzw
mov r2.z, r0
texld r1.xyz, r0, s2
mul r3.zw, r7.y, c21
mad r0.xy, r7.x, c22, r3.zwzw
mov r0.z, c16.x
add r0.xy, r0, c22.z
mad r2.xyz, r1, -r2, r2
mad r0.z, r0, c23.x, c23.y
mul r0.xy, r0, c15.x
mul r0.xy, r0, r0.z
mov r0.z, c16.x
mad r2.w, r0.z, c22.z, c22
mad r0.zw, -r3.xyxy, c21.x, v0.xyxy
mul r0.zw, r0, r2.w
mul r3.xy, r0.zwzw, c15.x
mov r0.w, c10.x
mul r0.xy, r0, c20.x
mad r0.xy, r0, c17, c17.zwzw
mad r3.xy, r3, c17, c17.zwzw
texld r0.xyz, r0, s3
texld r3.xyz, r3, s3
mul r7.xyz, c14, r0.w
mul r7.xyz, r7, r3
add r3.xyz, -r0, c22.w
max r1.xyz, r3, r1
pow r0, r7.x, c18.x
pow r3, r7.y, c18.x
mov r7.x, r0
pow r0, r7.z, c18.x
dp3 r0.w, r4, r5
max r2.w, r0, c24.x
mov r0.w, c8.x
mul r1.xyz, r1, c8.x
mov r7.y, r3
mov r7.z, r0
mad r0.xyz, r1, -r7, r7
add r0.xyz, r0, r2
mov r2.xyz, c0
mul r4.xyz, r1.w, c3
mul r2.xyz, c23.z, r2
mad r2.xyz, r2.w, r4, r2
add r0.w, c22, -r0
mul r4.xyz, r1, r0.w
mad r5.xy, v0, c6, c6.zwzw
texld r1.xyz, r5, s5
mul r3.xyz, r0, r6
mad r1.xyz, r1, c11, r4
mad r1.xyz, r2, r1, r3
mad oC0.xyz, r0, c13.x, r1
mov_pp oC0.w, c22
"
}
SubProgram "d3d11 " {
// Stats: 84 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Normalmap] 2D 4
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [_Mask] 2D 1
SetTexture 3 [_Glittermap] 2D 5
SetTexture 4 [_Specularglitter] 2D 3
SetTexture 5 [_MainTex] 2D 2
ConstBuffer "$Globals" 288
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Vector 192 [_Normalmap_ST]
Float 208 [_Fakelight]
Vector 224 [_Glittercolor]
Float 240 [_Glitterymaskdotsscale]
Float 244 [_Glitteryspeed01]
Vector 256 [_Glittermap_ST]
Float 272 [_Glittercontrast13]
Float 276 [_Specularcontrast13]
Float 280 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerFrame" 3
"ps_4_0
eefiecedaobabbjlfjolodgplbhpaenadnpiiiodabaaaaaaaeaoaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmmamaaaaeaaaaaaaddadaaaa
fjaaaaaeegiocaaaaaaaaaaabcaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaad
aagabaaaafaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
ahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaapaaaaaaaceaaaaa
mnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaia
ebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaah
ccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaa
acaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaak
bcaabaaaaaaaaaaabkiacaaaaaaaaaaaapaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaa
aaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaapaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaabaaaaaaaogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaafaaaaaadiaaaaajlcaabaaa
aaaaaaaakgikcaaaaaaaaaaaakaaaaaaegiicaaaaaaaaaaaaoaaaaaadiaaaaah
lcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaa
aaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaa
agiacaaaaaaaaaaabbaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
apaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaa
adaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
acaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaapaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaapaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaa
diaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaabbaaaaaa
dcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaabaaaaaaa
ogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaadaaaaaaaagabaaaafaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaia
ebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
acaaaaaaaagabaaaabaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaakaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaaeaaaaaaaagabaaaadaaaaaa
diaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaakaaaaaa
cpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaabbaaaaaabjaaaaafhcaabaaaaeaaaaaa
egacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaia
ebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaa
aaaaaaaaegaibaaaadaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaaihcaabaaaadaaaaaapgapbaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaaaaaaaaaagabaaaaeaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaa
afaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaa
egbcbaaaafaaaaaadcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaa
aeaaaaaaegacbaaaagaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaa
egaabaaaafaaaaaaddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaa
aeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaa
ahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
abaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaoaaaaahgcaabaaa
abaaaaaaagbbbaaaagaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaa
jgafbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaa
abaaaaaaakaabaaaadaaaaaaakaabaaaadaaaaaaebaaaaafecaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaabaaaaaaegiccaaa
aaaaaaaaafaaaaaadiaaaaaiocaabaaaabaaaaaakgakbaaaabaaaaaaagijcaaa
aaaaaaaaafaaaaaadiaaaaahocaabaaaabaaaaaakgakbaaaaaaaaaaafgaobaaa
abaaaaaadiaaaaahocaabaaaabaaaaaaaganbaaaaaaaaaaafgaobaaaabaaaaaa
aaaaaaajhcaabaaaaeaaaaaaegiccaaaadaaaaaaaeaaaaaaegiccaaaadaaaaaa
aeaaaaaadcaaaaajhcaabaaaadaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaa
egacbaaaaeaaaaaaaaaaaaajecaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaa
akaaaaaaabeaaaaaaaaaiadpdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
kgakbaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaa
aaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaeaaaaaaeghobaaaafaaaaaaaagabaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaa
dcaaaaajhcaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaajgahbaaa
abaaaaaadcaaaaakhccabaaaaaaaaaaaegadbaaaaaaaaaaaagiacaaaaaaaaaaa
anaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadp
doaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 98 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_MainTex_ST]
Vector 7 [_Specularglitter_ST]
Float 8 [_MasktransparencyDebug]
Float 9 [_Specularpower05]
Float 10 [_Glitterpower]
Vector 11 [_Color]
Vector 12 [_Normalmap_ST]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"3.0-!!ARBfp1.0
PARAM c[24] = { state.lightmodel.ambient,
		program.local[1..20],
		{ 0.050000001, 0.5, -0.99999875, -0.001592548 },
		{ 0.001592548, -0.99999875, 0.31830987, 1 },
		{ 2, 0, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
MAD R0.xy, fragment.texcoord[0], c[12], c[12].zwzw;
MAD R5.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MOV R0.z, c[22].w;
MAD R1.zw, R0.xywy, c[23].x, -R0.z;
MUL R1.xy, R1.zwzw, R1.zwzw;
ADD_SAT R0.w, R1.x, R1.y;
ADD R1.x, -R0.w, c[22].w;
MUL R0.xyz, fragment.texcoord[4], R1.w;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MOV R4.xy, c[23].xzzw;
RCP R1.w, R1.x;
MAD R0.xyz, fragment.texcoord[3], R1.z, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
MAD R0.xyz, R1.w, R1, R0;
DP3 R0.w, R0, R0;
RSQ R1.w, R0.w;
ADD R2.xyz, -fragment.texcoord[1], c[1];
DP3 R1.x, R2, R2;
RSQ R2.w, R1.x;
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R2.xyz, R2.w, R2;
MUL R1.xyz, R0.w, c[2];
ADD R3.xyz, R2, R1;
MUL R0.xyz, R1.w, R0;
DP3 R0.w, R3, R3;
RSQ R1.w, R0.w;
MUL R3.xyz, R1.w, R3;
DP3 R1.w, R0, R3;
MUL R0.w, R4.y, c[5].x;
ADD R0.w, R0, c[22];
DP3 R3.x, R2, fragment.texcoord[3];
DP3 R3.y, fragment.texcoord[4], R2;
MUL R4.zw, R3.xyxy, -c[16].x;
MAD R2.zw, R4, c[21].x, fragment.texcoord[0].xyxy;
ADD R3.zw, R2, -c[21].y;
MUL R3.xy, R3.w, c[22];
MAD R3.xy, R3.z, c[21].zwzw, R3;
ADD R3.xy, R3, c[21].y;
DP3 R1.x, R0, R1;
EX2 R0.w, R0.w;
MAX R1.w, R1, c[23].y;
POW R1.w, R1.w, R0.w;
TXP R2.x, fragment.texcoord[5], texture[1], 2D;
MUL R0.w, R2.x, c[23].x;
FLR R2.x, R0.w;
MUL R2.xyz, R2.x, c[3];
MUL R2.xyz, R2, R1.w;
MOV R1.w, c[16].x;
MAD R2.w, R1, -c[22].z, c[22];
MUL R3.xy, R3, c[15].x;
MUL R3.zw, R3.xyxy, R2.w;
MUL R6.xy, R3.zwzw, c[20].x;
MAD R3.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R3.xyz, R3, texture[4], 2D;
MUL R3.xyz, R3, c[9].x;
MAD R6.xy, R6, c[17], c[17].zwzw;
MUL R1.w, R1, c[21].y;
TEX R6.xyz, R6, texture[3], 2D;
ADD R6.xyz, -R6, c[22].w;
TEX R5.xyz, R5, texture[2], 2D;
ADD R1.w, R1, c[22];
MAD R4.zw, -R4, c[21].x, fragment.texcoord[0].xyxy;
MUL R4.zw, R4, R1.w;
MAX R1.w, R1.x, c[23].y;
MUL R1.xyz, R0.w, c[3];
MOV R0.w, c[22];
MUL R4.zw, R4, c[15].x;
POW R3.x, R3.x, c[19].x;
POW R3.z, R3.z, c[19].x;
POW R3.y, R3.y, c[19].x;
MAD R3.xyz, R5, -R3, R3;
MAX R5.xyz, R6, R5;
MAD R6.xy, R4.zwzw, c[17], c[17].zwzw;
MOV R4.yzw, c[14].xxyz;
MUL R4.yzw, R4, c[10].x;
TEX R6.xyz, R6, texture[3], 2D;
MUL R6.xyz, R4.yzww, R6;
MUL R5.xyz, R5, c[8].x;
POW R6.x, R6.x, c[18].x;
POW R6.z, R6.z, c[18].x;
POW R6.y, R6.y, c[18].x;
MAD R6.xyz, R5, -R6, R6;
ADD R3.xyz, R6, R3;
MUL R0.xyz, R3, R2;
MUL R2.xyz, R4.x, c[0];
MAD R4.xy, fragment.texcoord[0], c[6], c[6].zwzw;
MAD R1.xyz, R1.w, R1, R2;
ADD R0.w, R0, -c[8].x;
MUL R2.xyz, R5, R0.w;
TEX R4.xyz, R4, texture[5], 2D;
MAD R2.xyz, R4, c[11], R2;
MAD R0.xyz, R1, R2, R0;
MAD result.color.xyz, R3, c[13].x, R0;
MOV result.color.w, c[22];
END
# 98 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 111 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_MainTex_ST]
Vector 7 [_Specularglitter_ST]
Float 8 [_MasktransparencyDebug]
Float 9 [_Specularpower05]
Float 10 [_Glitterpower]
Vector 11 [_Color]
Vector 12 [_Normalmap_ST]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c21, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c22, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c23, -0.31830987, 1.00000000, 2.00000000, -1.00000000
def c24, 0.00000000, 10.00000000, 1.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
add r0.xyz, -v1, c1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r1.xyz, r0.w, r0
mad r0.xy, v0, c12, c12.zwzw
texld r0.yw, r0, s0
mad_pp r2.xy, r0.wyzw, c23.z, c23.w
dp3_pp r0.z, c2, c2
rsq_pp r0.z, r0.z
mul_pp r5.xyz, r0.z, c2
add r3.xyz, r1, r5
dp3 r1.w, r3, r3
mul r0.xyz, v4, r2.y
mul_pp r4.xy, r2, r2
mad r2.xyz, v3, r2.x, r0
add_pp_sat r0.x, r4, r4.y
add_pp r0.x, -r0, c22.w
rsq_pp r0.w, r0.x
dp3 r0.y, v2, v2
rsq r0.y, r0.y
rcp_pp r0.w, r0.w
mul r0.xyz, r0.y, v2
mad r0.xyz, r0.w, r0, r2
dp3 r0.w, r0, r0
rsq r1.w, r1.w
rsq r0.w, r0.w
mul r4.xyz, r0.w, r0
mul r2.xyz, r1.w, r3
dp3 r0.x, r4, r2
max r2.x, r0, c24
texldp r0.x, v5, s1
mov r0.y, c5.x
mad r0.y, r0, c24, c24.z
mul_pp r1.w, r0.x, c23.z
exp r2.y, r0.y
pow r0, r2.x, r2.y
frc r0.y, r1.w
mov r0.w, r0.x
add r0.y, r1.w, -r0
mul r0.xyz, r0.y, c3
mul r6.xyz, r0, r0.w
dp3 r0.w, v4, r1
dp3 r0.z, r1, v3
mul r3.xy, r0.zwzw, -c16.x
mad r2.xy, r3, c21.x, v0
add r7.xy, r2, c21.y
mad r0.xy, v0, c7, c7.zwzw
texld r0.xyz, r0, s4
mul r1.xyz, r0, c9.x
pow r0, r1.x, c19.x
pow r2, r1.y, c19.x
mov r2.x, r0
pow r0, r1.z, c19.x
mad r0.xy, v0, c4, c4.zwzw
mov r2.z, r0
texld r1.xyz, r0, s2
mul r3.zw, r7.y, c21
mad r0.xy, r7.x, c22, r3.zwzw
mov r0.z, c16.x
add r0.xy, r0, c22.z
mad r2.xyz, r1, -r2, r2
mad r0.z, r0, c23.x, c23.y
mul r0.xy, r0, c15.x
mul r0.xy, r0, r0.z
mov r0.z, c16.x
mad r2.w, r0.z, c22.z, c22
mad r0.zw, -r3.xyxy, c21.x, v0.xyxy
mul r0.zw, r0, r2.w
mul r3.xy, r0.zwzw, c15.x
mov r0.w, c10.x
mul r0.xy, r0, c20.x
mad r0.xy, r0, c17, c17.zwzw
mad r3.xy, r3, c17, c17.zwzw
texld r0.xyz, r0, s3
texld r3.xyz, r3, s3
mul r7.xyz, c14, r0.w
mul r7.xyz, r7, r3
add r3.xyz, -r0, c22.w
max r1.xyz, r3, r1
pow r0, r7.x, c18.x
pow r3, r7.y, c18.x
mov r7.x, r0
pow r0, r7.z, c18.x
dp3 r0.w, r4, r5
max r2.w, r0, c24.x
mov r0.w, c8.x
mul r1.xyz, r1, c8.x
mov r7.y, r3
mov r7.z, r0
mad r0.xyz, r1, -r7, r7
add r0.xyz, r0, r2
mov r2.xyz, c0
mul r4.xyz, r1.w, c3
mul r2.xyz, c23.z, r2
mad r2.xyz, r2.w, r4, r2
add r0.w, c22, -r0
mul r4.xyz, r1, r0.w
mad r5.xy, v0, c6, c6.zwzw
texld r1.xyz, r5, s5
mul r3.xyz, r0, r6
mad r1.xyz, r1, c11, r4
mad r1.xyz, r2, r1, r3
mad oC0.xyz, r0, c13.x, r1
mov_pp oC0.w, c22
"
}
SubProgram "d3d11 " {
// Stats: 84 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_Normalmap] 2D 4
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [_Mask] 2D 1
SetTexture 3 [_Glittermap] 2D 5
SetTexture 4 [_Specularglitter] 2D 3
SetTexture 5 [_MainTex] 2D 2
ConstBuffer "$Globals" 288
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Vector 192 [_Normalmap_ST]
Float 208 [_Fakelight]
Vector 224 [_Glittercolor]
Float 240 [_Glitterymaskdotsscale]
Float 244 [_Glitteryspeed01]
Vector 256 [_Glittermap_ST]
Float 272 [_Glittercontrast13]
Float 276 [_Specularcontrast13]
Float 280 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerFrame" 3
"ps_4_0
eefiecedaobabbjlfjolodgplbhpaenadnpiiiodabaaaaaaaeaoaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmmamaaaaeaaaaaaaddadaaaa
fjaaaaaeegiocaaaaaaaaaaabcaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaad
aagabaaaafaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
ahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaapaaaaaaaceaaaaa
mnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaia
ebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaah
ccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaa
acaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaak
bcaabaaaaaaaaaaabkiacaaaaaaaaaaaapaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaa
aaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaapaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaabaaaaaaaogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaafaaaaaadiaaaaajlcaabaaa
aaaaaaaakgikcaaaaaaaaaaaakaaaaaaegiicaaaaaaaaaaaaoaaaaaadiaaaaah
lcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaa
aaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaa
agiacaaaaaaaaaaabbaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
apaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaa
adaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
acaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaapaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaapaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaa
diaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaabbaaaaaa
dcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaabaaaaaaa
ogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaadaaaaaaaagabaaaafaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaia
ebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
acaaaaaaaagabaaaabaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaakaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaaeaaaaaaaagabaaaadaaaaaa
diaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaakaaaaaa
cpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaabbaaaaaabjaaaaafhcaabaaaaeaaaaaa
egacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaia
ebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaa
aaaaaaaaegaibaaaadaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaaihcaabaaaadaaaaaapgapbaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaaaaaaaaaagabaaaaeaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaa
afaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaa
egbcbaaaafaaaaaadcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaa
aeaaaaaaegacbaaaagaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaa
egaabaaaafaaaaaaddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaa
aeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaa
ahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
abaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaoaaaaahgcaabaaa
abaaaaaaagbbbaaaagaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaa
jgafbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaa
abaaaaaaakaabaaaadaaaaaaakaabaaaadaaaaaaebaaaaafecaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaabaaaaaaegiccaaa
aaaaaaaaafaaaaaadiaaaaaiocaabaaaabaaaaaakgakbaaaabaaaaaaagijcaaa
aaaaaaaaafaaaaaadiaaaaahocaabaaaabaaaaaakgakbaaaaaaaaaaafgaobaaa
abaaaaaadiaaaaahocaabaaaabaaaaaaaganbaaaaaaaaaaafgaobaaaabaaaaaa
aaaaaaajhcaabaaaaeaaaaaaegiccaaaadaaaaaaaeaaaaaaegiccaaaadaaaaaa
aeaaaaaadcaaaaajhcaabaaaadaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaa
egacbaaaaeaaaaaaaaaaaaajecaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaa
akaaaaaaabeaaaaaaaaaiadpdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
kgakbaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaa
aaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaeaaaaaaeghobaaaafaaaaaaaagabaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaa
dcaaaaajhcaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaajgahbaaa
abaaaaaadcaaaaakhccabaaaaaaaaaaaegadbaaaaaaaaaaaagiacaaaaaaaaaaa
anaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadp
doaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 28 avg math (23..31)
 //        d3d9 : 34 avg math (29..38)
 //      opengl : 34 avg math (29..38)
 // Stats for Fragment shader:
 //       d3d11 : 86 avg math (79..96), 8 avg texture (6..12)
 //        d3d9 : 115 avg math (107..126), 8 avg texture (6..12)
 //      opengl : 104 avg math (93..118), 8 avg texture (6..12)
 Pass {
  Name "FORWARDADD"
  Tags { "LIGHTMODE"="ForwardAdd" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
Program "vp" {
SubProgram "opengl " {
// Stats: 33 math
Keywords { "POINT" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
"3.0-!!ARBvp1.0
PARAM c[17] = { { 0 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R1.z, R0, c[7];
DP4 R1.y, R0, c[6];
DP4 R1.x, R0, c[5];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
ADD R0.xyz, R0, c[0].x;
MUL R2.xyz, R0.zxyw, R1.yzxw;
MAD R2.xyz, R0.yzxw, R1.zxyw, -R2;
MOV result.texcoord[3].xyz, R1;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
DP4 R1.w, vertex.position, c[8];
DP4 R1.z, vertex.position, c[7];
DP4 R1.x, vertex.position, c[5];
DP4 R1.y, vertex.position, c[6];
MUL result.texcoord[4].xyz, R0.w, R2;
MOV result.texcoord[1], R1;
DP4 result.texcoord[5].z, R1, c[15];
DP4 result.texcoord[5].y, R1, c[14];
DP4 result.texcoord[5].x, R1, c[13];
MOV result.texcoord[2].xyz, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 33 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 33 math
Keywords { "POINT" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c16, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r0.w, c16.x
mov r0.xyz, v2
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
add r0.xyz, r0, c16.x
mul r2.xyz, r0.zxyw, r1.yzxw
mad r2.xyz, r0.yzxw, r1.zxyw, -r2
mov o4.xyz, r1
mul r2.xyz, v2.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
dp4 r1.w, v0, c7
dp4 r1.z, v0, c6
dp4 r1.x, v0, c4
dp4 r1.y, v0, c5
mul o5.xyz, r0.w, r2
mov o2, r1
dp4 o6.z, r1, c14
dp4 o6.y, r1, c13
dp4 o6.x, r1, c12
mov o3.xyz, r0
mov o1.xy, v3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 27 math
Keywords { "POINT" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 288
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedpgoikocoeepfnkgjiblmgnbjjmleglkiabaaaaaadeagaaaaadaaaaaa
cmaaaaaamaaaaaaajaabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklfdeieefcjmaeaaaaeaaaabaachabaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaabdaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaad
hccabaaaagaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaa
egaobaaaaaaaaaaabaaaaaaibcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabaaaaaaabaaaaaaiccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabbaaaaaabaaaaaaiecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabcaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaafgbfbaaaacaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaa
acaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaa
aeaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaa
jgaebaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgaebaaaabaaaaaacgajbaaa
acaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgbpbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hccabaaaafaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaaaaaaaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaakgakbaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhccabaaaagaaaaaaegiccaaaaaaaaaaaaeaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp float tmpvar_13;
  tmpvar_13 = (texture2D (_LightTexture0, vec2(tmpvar_12)).w * 2.0);
  attenuation_3 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_15;
  tmpvar_15[0].x = -0.999999;
  tmpvar_15[0].y = 0.00159255;
  tmpvar_15[1].x = -0.00159255;
  tmpvar_15[1].y = -0.999999;
  lowp vec4 tmpvar_16;
  highp vec2 P_17;
  P_17 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_16 = texture2D (_Mask, P_17);
  node_1540_2 = tmpvar_16;
  highp vec2 P_18;
  P_18 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_15) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_19;
  arg0_19 = (1.0 - texture2D (_Glittermap, P_18).xyz);
  highp vec3 tmpvar_20;
  tmpvar_20 = (max (arg0_19, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_21 = texture2D (_Glittermap, P_22);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_23 = texture2D (_Specularglitter, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_25 = texture2D (_MainTex, P_26);
  highp vec4 tmpvar_27;
  tmpvar_27.w = 0.0;
  tmpvar_27.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_14) * ((tmpvar_25.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + ((tmpvar_14 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_27;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "POINT" "SHADOWS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_9;
  normal_9.xy = ((texture2D (_Normalmap, P_8).wy * 2.0) - 1.0);
  normal_9.z = sqrt((1.0 - clamp (dot (normal_9.xy, normal_9.xy), 0.0, 1.0)));
  normalLocal_4 = normal_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp float tmpvar_13;
  tmpvar_13 = (texture2D (_LightTexture0, vec2(tmpvar_12)).w * 2.0);
  attenuation_3 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_15;
  tmpvar_15[0].x = -0.999999;
  tmpvar_15[0].y = 0.00159255;
  tmpvar_15[1].x = -0.00159255;
  tmpvar_15[1].y = -0.999999;
  lowp vec4 tmpvar_16;
  highp vec2 P_17;
  P_17 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_16 = texture2D (_Mask, P_17);
  node_1540_2 = tmpvar_16;
  highp vec2 P_18;
  P_18 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_15) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_19;
  arg0_19 = (1.0 - texture2D (_Glittermap, P_18).xyz);
  highp vec3 tmpvar_20;
  tmpvar_20 = (max (arg0_19, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_21 = texture2D (_Glittermap, P_22);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_23 = texture2D (_Specularglitter, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_25 = texture2D (_MainTex, P_26);
  highp vec4 tmpvar_27;
  tmpvar_27.w = 0.0;
  tmpvar_27.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_14) * ((tmpvar_25.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + ((tmpvar_14 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_27;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec3 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp float tmpvar_13;
  tmpvar_13 = (texture (_LightTexture0, vec2(tmpvar_12)).w * 2.0);
  attenuation_3 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_15;
  tmpvar_15[0].x = -0.999999;
  tmpvar_15[0].y = 0.00159255;
  tmpvar_15[1].x = -0.00159255;
  tmpvar_15[1].y = -0.999999;
  lowp vec4 tmpvar_16;
  highp vec2 P_17;
  P_17 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_16 = texture (_Mask, P_17);
  node_1540_2 = tmpvar_16;
  highp vec2 P_18;
  P_18 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_15) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_19;
  arg0_19 = (1.0 - texture (_Glittermap, P_18).xyz);
  highp vec3 tmpvar_20;
  tmpvar_20 = (max (arg0_19, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_21 = texture (_Glittermap, P_22);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_23 = texture (_Specularglitter, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_25 = texture (_MainTex, P_26);
  highp vec4 tmpvar_27;
  tmpvar_27.w = 0.0;
  tmpvar_27.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_14) * ((tmpvar_25.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + ((tmpvar_14 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_27;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 29 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
"3.0-!!ARBvp1.0
PARAM c[13] = { { 0 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R1.z, R0, c[7];
DP4 R1.y, R0, c[6];
DP4 R1.x, R0, c[5];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
ADD R0.xyz, R0, c[0].x;
MUL R2.xyz, R0.zxyw, R1.yzxw;
MAD R2.xyz, R0.yzxw, R1.zxyw, -R2;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R2;
MOV result.texcoord[3].xyz, R1;
MOV result.texcoord[2].xyz, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 29 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 29 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c12, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r0.w, c12.x
mov r0.xyz, v2
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
add r0.xyz, r0, c12.x
mul r2.xyz, r0.zxyw, r1.yzxw
mad r2.xyz, r0.yzxw, r1.zxyw, -r2
mul r2.xyz, v2.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul o5.xyz, r0.w, r2
mov o4.xyz, r1
mov o3.xyz, r0
mov o1.xy, v3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
// Stats: 23 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedooilndalaneljhihncooenjckicbkmglabaaaaaafeafaaaaadaaaaaa
cmaaaaaamaaaaaaahiabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcneadaaaa
eaaaabaapfaaaaaafjaaaaaeegiocaaaaaaaaaaabdaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaa
egbabaaaadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
aaaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
aaaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
acaaaaaaegiocaaaaaaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
baaaaaaibcaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaaaaaaaaabaaaaaaa
baaaaaaiccaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaaaaaaaaabbaaaaaa
baaaaaaiecaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaaaaaaaaabcaaaaaa
dgaaaaafhccabaaaadaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgbfbaaaacaaaaaaegiccaaaaaaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaa
abaaaaaadiaaaaahhcaabaaaacaaaaaacgajbaaaaaaaaaaajgaebaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaajgaebaaaaaaaaaaacgajbaaaabaaaaaaegacbaia
ebaaaaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaa
acaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaafaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = (2.0 * _LightColor0.xyz);
  highp mat2 tmpvar_12;
  tmpvar_12[0].x = -0.999999;
  tmpvar_12[0].y = 0.00159255;
  tmpvar_12[1].x = -0.00159255;
  tmpvar_12[1].y = -0.999999;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_13 = texture2D (_Mask, P_14);
  node_1540_2 = tmpvar_13;
  highp vec2 P_15;
  P_15 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_12) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_16;
  arg0_16 = (1.0 - texture2D (_Glittermap, P_15).xyz);
  highp vec3 tmpvar_17;
  tmpvar_17 = (max (arg0_16, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_22 = texture2D (_MainTex, P_23);
  highp vec4 tmpvar_24;
  tmpvar_24.w = 0.0;
  tmpvar_24.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_11) * ((tmpvar_22.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + ((tmpvar_11 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_24;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_8;
  normal_8.xy = ((texture2D (_Normalmap, P_7).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (dot (normal_8.xy, normal_8.xy), 0.0, 1.0)));
  normalLocal_3 = normal_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = (2.0 * _LightColor0.xyz);
  highp mat2 tmpvar_12;
  tmpvar_12[0].x = -0.999999;
  tmpvar_12[0].y = 0.00159255;
  tmpvar_12[1].x = -0.00159255;
  tmpvar_12[1].y = -0.999999;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_13 = texture2D (_Mask, P_14);
  node_1540_2 = tmpvar_13;
  highp vec2 P_15;
  P_15 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_12) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_16;
  arg0_16 = (1.0 - texture2D (_Glittermap, P_15).xyz);
  highp vec3 tmpvar_17;
  tmpvar_17 = (max (arg0_16, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_22 = texture2D (_MainTex, P_23);
  highp vec4 tmpvar_24;
  tmpvar_24.w = 0.0;
  tmpvar_24.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_11) * ((tmpvar_22.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + ((tmpvar_11 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_24;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = (2.0 * _LightColor0.xyz);
  highp mat2 tmpvar_12;
  tmpvar_12[0].x = -0.999999;
  tmpvar_12[0].y = 0.00159255;
  tmpvar_12[1].x = -0.00159255;
  tmpvar_12[1].y = -0.999999;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_13 = texture (_Mask, P_14);
  node_1540_2 = tmpvar_13;
  highp vec2 P_15;
  P_15 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_12) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_16;
  arg0_16 = (1.0 - texture (_Glittermap, P_15).xyz);
  highp vec3 tmpvar_17;
  tmpvar_17 = (max (arg0_16, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture (_Specularglitter, P_21);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_22 = texture (_MainTex, P_23);
  highp vec4 tmpvar_24;
  tmpvar_24.w = 0.0;
  tmpvar_24.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_11) * ((tmpvar_22.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + ((tmpvar_11 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_24;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 34 math
Keywords { "SPOT" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
"3.0-!!ARBvp1.0
PARAM c[17] = { { 0 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
TEMP R2;
DP4 R1.w, vertex.position, c[8];
MOV R0.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R1.z, R0, c[7];
DP4 R1.y, R0, c[6];
DP4 R1.x, R0, c[5];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
ADD R0.xyz, R0, c[0].x;
MUL R2.xyz, R0.zxyw, R1.yzxw;
MAD R2.xyz, R0.yzxw, R1.zxyw, -R2;
MOV result.texcoord[3].xyz, R1;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
DP4 R1.z, vertex.position, c[7];
DP4 R1.x, vertex.position, c[5];
DP4 R1.y, vertex.position, c[6];
MUL result.texcoord[4].xyz, R0.w, R2;
MOV result.texcoord[1], R1;
DP4 result.texcoord[5].w, R1, c[16];
DP4 result.texcoord[5].z, R1, c[15];
DP4 result.texcoord[5].y, R1, c[14];
DP4 result.texcoord[5].x, R1, c[13];
MOV result.texcoord[2].xyz, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 34 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 34 math
Keywords { "SPOT" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c16, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
dp4 r1.w, v0, c7
mov r0.w, c16.x
mov r0.xyz, v2
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
add r0.xyz, r0, c16.x
mul r2.xyz, r0.zxyw, r1.yzxw
mad r2.xyz, r0.yzxw, r1.zxyw, -r2
mov o4.xyz, r1
mul r2.xyz, v2.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
dp4 r1.z, v0, c6
dp4 r1.x, v0, c4
dp4 r1.y, v0, c5
mul o5.xyz, r0.w, r2
mov o2, r1
dp4 o6.w, r1, c15
dp4 o6.z, r1, c14
dp4 o6.y, r1, c13
dp4 o6.x, r1, c12
mov o3.xyz, r0
mov o1.xy, v3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 27 math
Keywords { "SPOT" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 288
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedcodhkfbadjpbpfonohbollfnckiaoighabaaaaaadeagaaaaadaaaaaa
cmaaaaaamaaaaaaajaabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklfdeieefcjmaeaaaaeaaaabaachabaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaabdaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaad
pccabaaaagaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaa
egaobaaaaaaaaaaabaaaaaaibcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabaaaaaaabaaaaaaiccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabbaaaaaabaaaaaaiecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabcaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaafgbfbaaaacaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaa
acaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaa
aeaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaa
jgaebaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgaebaaaabaaaaaacgajbaaa
acaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgbpbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hccabaaaafaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaaaaaaaaaabaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaakgakbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpccabaaaagaaaaaaegiocaaaaaaaaaaaaeaaaaaa
pgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_11 = texture2D (_LightTexture0, P_12);
  highp float tmpvar_13;
  tmpvar_13 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_LightTextureB0, vec2(tmpvar_13));
  highp vec3 tmpvar_15;
  tmpvar_15 = ((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_11.w) * tmpvar_14.w) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_16;
  tmpvar_16[0].x = -0.999999;
  tmpvar_16[0].y = 0.00159255;
  tmpvar_16[1].x = -0.00159255;
  tmpvar_16[1].y = -0.999999;
  lowp vec4 tmpvar_17;
  highp vec2 P_18;
  P_18 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_17 = texture2D (_Mask, P_18);
  node_1540_2 = tmpvar_17;
  highp vec2 P_19;
  P_19 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_16) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_20;
  arg0_20 = (1.0 - texture2D (_Glittermap, P_19).xyz);
  highp vec3 tmpvar_21;
  tmpvar_21 = (max (arg0_20, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_22 = texture2D (_Glittermap, P_23);
  lowp vec4 tmpvar_24;
  highp vec2 P_25;
  P_25 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_24 = texture2D (_Specularglitter, P_25);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_26 = texture2D (_MainTex, P_27);
  highp vec4 tmpvar_28;
  tmpvar_28.w = 0.0;
  tmpvar_28.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_15) * ((tmpvar_26.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_21))) + ((tmpvar_15 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_22.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_21) + mix (pow ((tmpvar_24.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_28;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "SPOT" "SHADOWS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_8;
  normal_8.xy = ((texture2D (_Normalmap, P_7).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (dot (normal_8.xy, normal_8.xy), 0.0, 1.0)));
  normalLocal_3 = normal_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_11 = texture2D (_LightTexture0, P_12);
  highp float tmpvar_13;
  tmpvar_13 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_LightTextureB0, vec2(tmpvar_13));
  highp vec3 tmpvar_15;
  tmpvar_15 = ((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_11.w) * tmpvar_14.w) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_16;
  tmpvar_16[0].x = -0.999999;
  tmpvar_16[0].y = 0.00159255;
  tmpvar_16[1].x = -0.00159255;
  tmpvar_16[1].y = -0.999999;
  lowp vec4 tmpvar_17;
  highp vec2 P_18;
  P_18 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_17 = texture2D (_Mask, P_18);
  node_1540_2 = tmpvar_17;
  highp vec2 P_19;
  P_19 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_16) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_20;
  arg0_20 = (1.0 - texture2D (_Glittermap, P_19).xyz);
  highp vec3 tmpvar_21;
  tmpvar_21 = (max (arg0_20, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_22 = texture2D (_Glittermap, P_23);
  lowp vec4 tmpvar_24;
  highp vec2 P_25;
  P_25 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_24 = texture2D (_Specularglitter, P_25);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_26 = texture2D (_MainTex, P_27);
  highp vec4 tmpvar_28;
  tmpvar_28.w = 0.0;
  tmpvar_28.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_15) * ((tmpvar_26.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_21))) + ((tmpvar_15 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_22.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_21) + mix (pow ((tmpvar_24.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_28;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "SPOT" "SHADOWS_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_11 = texture (_LightTexture0, P_12);
  highp float tmpvar_13;
  tmpvar_13 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture (_LightTextureB0, vec2(tmpvar_13));
  highp vec3 tmpvar_15;
  tmpvar_15 = ((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_11.w) * tmpvar_14.w) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_16;
  tmpvar_16[0].x = -0.999999;
  tmpvar_16[0].y = 0.00159255;
  tmpvar_16[1].x = -0.00159255;
  tmpvar_16[1].y = -0.999999;
  lowp vec4 tmpvar_17;
  highp vec2 P_18;
  P_18 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_17 = texture (_Mask, P_18);
  node_1540_2 = tmpvar_17;
  highp vec2 P_19;
  P_19 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_16) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_20;
  arg0_20 = (1.0 - texture (_Glittermap, P_19).xyz);
  highp vec3 tmpvar_21;
  tmpvar_21 = (max (arg0_20, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_22 = texture (_Glittermap, P_23);
  lowp vec4 tmpvar_24;
  highp vec2 P_25;
  P_25 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_24 = texture (_Specularglitter, P_25);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_26 = texture (_MainTex, P_27);
  highp vec4 tmpvar_28;
  tmpvar_28.w = 0.0;
  tmpvar_28.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_15) * ((tmpvar_26.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_21))) + ((tmpvar_15 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_22.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_21) + mix (pow ((tmpvar_24.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_28;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 33 math
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
"3.0-!!ARBvp1.0
PARAM c[17] = { { 0 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R1.z, R0, c[7];
DP4 R1.y, R0, c[6];
DP4 R1.x, R0, c[5];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
ADD R0.xyz, R0, c[0].x;
MUL R2.xyz, R0.zxyw, R1.yzxw;
MAD R2.xyz, R0.yzxw, R1.zxyw, -R2;
MOV result.texcoord[3].xyz, R1;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
DP4 R1.w, vertex.position, c[8];
DP4 R1.z, vertex.position, c[7];
DP4 R1.x, vertex.position, c[5];
DP4 R1.y, vertex.position, c[6];
MUL result.texcoord[4].xyz, R0.w, R2;
MOV result.texcoord[1], R1;
DP4 result.texcoord[5].z, R1, c[15];
DP4 result.texcoord[5].y, R1, c[14];
DP4 result.texcoord[5].x, R1, c[13];
MOV result.texcoord[2].xyz, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 33 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 33 math
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c16, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r0.w, c16.x
mov r0.xyz, v2
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
add r0.xyz, r0, c16.x
mul r2.xyz, r0.zxyw, r1.yzxw
mad r2.xyz, r0.yzxw, r1.zxyw, -r2
mov o4.xyz, r1
mul r2.xyz, v2.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
dp4 r1.w, v0, c7
dp4 r1.z, v0, c6
dp4 r1.x, v0, c4
dp4 r1.y, v0, c5
mul o5.xyz, r0.w, r2
mov o2, r1
dp4 o6.z, r1, c14
dp4 o6.y, r1, c13
dp4 o6.x, r1, c12
mov o3.xyz, r0
mov o1.xy, v3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 27 math
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 288
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedpgoikocoeepfnkgjiblmgnbjjmleglkiabaaaaaadeagaaaaadaaaaaa
cmaaaaaamaaaaaaajaabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklfdeieefcjmaeaaaaeaaaabaachabaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaabdaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaad
hccabaaaagaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaa
egaobaaaaaaaaaaabaaaaaaibcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabaaaaaaabaaaaaaiccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabbaaaaaabaaaaaaiecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabcaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaafgbfbaaaacaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaa
acaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaa
aeaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaa
jgaebaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgaebaaaabaaaaaacgajbaaa
acaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgbpbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hccabaaaafaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaaaaaaaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaakgakbaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhccabaaaagaaaaaaegiccaaaaaaaaaaaaeaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp float tmpvar_13;
  tmpvar_13 = ((texture2D (_LightTextureB0, vec2(tmpvar_12)).w * textureCube (_LightTexture0, xlv_TEXCOORD5).w) * 2.0);
  attenuation_3 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_15;
  tmpvar_15[0].x = -0.999999;
  tmpvar_15[0].y = 0.00159255;
  tmpvar_15[1].x = -0.00159255;
  tmpvar_15[1].y = -0.999999;
  lowp vec4 tmpvar_16;
  highp vec2 P_17;
  P_17 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_16 = texture2D (_Mask, P_17);
  node_1540_2 = tmpvar_16;
  highp vec2 P_18;
  P_18 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_15) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_19;
  arg0_19 = (1.0 - texture2D (_Glittermap, P_18).xyz);
  highp vec3 tmpvar_20;
  tmpvar_20 = (max (arg0_19, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_21 = texture2D (_Glittermap, P_22);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_23 = texture2D (_Specularglitter, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_25 = texture2D (_MainTex, P_26);
  highp vec4 tmpvar_27;
  tmpvar_27.w = 0.0;
  tmpvar_27.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_14) * ((tmpvar_25.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + ((tmpvar_14 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_27;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_9;
  normal_9.xy = ((texture2D (_Normalmap, P_8).wy * 2.0) - 1.0);
  normal_9.z = sqrt((1.0 - clamp (dot (normal_9.xy, normal_9.xy), 0.0, 1.0)));
  normalLocal_4 = normal_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp float tmpvar_13;
  tmpvar_13 = ((texture2D (_LightTextureB0, vec2(tmpvar_12)).w * textureCube (_LightTexture0, xlv_TEXCOORD5).w) * 2.0);
  attenuation_3 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_15;
  tmpvar_15[0].x = -0.999999;
  tmpvar_15[0].y = 0.00159255;
  tmpvar_15[1].x = -0.00159255;
  tmpvar_15[1].y = -0.999999;
  lowp vec4 tmpvar_16;
  highp vec2 P_17;
  P_17 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_16 = texture2D (_Mask, P_17);
  node_1540_2 = tmpvar_16;
  highp vec2 P_18;
  P_18 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_15) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_19;
  arg0_19 = (1.0 - texture2D (_Glittermap, P_18).xyz);
  highp vec3 tmpvar_20;
  tmpvar_20 = (max (arg0_19, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_21 = texture2D (_Glittermap, P_22);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_23 = texture2D (_Specularglitter, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_25 = texture2D (_MainTex, P_26);
  highp vec4 tmpvar_27;
  tmpvar_27.w = 0.0;
  tmpvar_27.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_14) * ((tmpvar_25.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + ((tmpvar_14 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_27;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec3 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec3 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp float tmpvar_13;
  tmpvar_13 = ((texture (_LightTextureB0, vec2(tmpvar_12)).w * texture (_LightTexture0, xlv_TEXCOORD5).w) * 2.0);
  attenuation_3 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_15;
  tmpvar_15[0].x = -0.999999;
  tmpvar_15[0].y = 0.00159255;
  tmpvar_15[1].x = -0.00159255;
  tmpvar_15[1].y = -0.999999;
  lowp vec4 tmpvar_16;
  highp vec2 P_17;
  P_17 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_16 = texture (_Mask, P_17);
  node_1540_2 = tmpvar_16;
  highp vec2 P_18;
  P_18 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_15) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_19;
  arg0_19 = (1.0 - texture (_Glittermap, P_18).xyz);
  highp vec3 tmpvar_20;
  tmpvar_20 = (max (arg0_19, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_21 = texture (_Glittermap, P_22);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_23 = texture (_Specularglitter, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_25 = texture (_MainTex, P_26);
  highp vec4 tmpvar_27;
  tmpvar_27.w = 0.0;
  tmpvar_27.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_14) * ((tmpvar_25.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + ((tmpvar_14 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_27;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 32 math
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
"3.0-!!ARBvp1.0
PARAM c[17] = { { 0 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R1.z, R0, c[7];
DP4 R1.y, R0, c[6];
DP4 R1.x, R0, c[5];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
ADD R0.xyz, R0, c[0].x;
MUL R2.xyz, R0.zxyw, R1.yzxw;
MAD R2.xyz, R0.yzxw, R1.zxyw, -R2;
MOV result.texcoord[3].xyz, R1;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
DP4 R1.w, vertex.position, c[8];
DP4 R1.z, vertex.position, c[7];
DP4 R1.x, vertex.position, c[5];
DP4 R1.y, vertex.position, c[6];
MUL result.texcoord[4].xyz, R0.w, R2;
MOV result.texcoord[1], R1;
DP4 result.texcoord[5].y, R1, c[14];
DP4 result.texcoord[5].x, R1, c[13];
MOV result.texcoord[2].xyz, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 32 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 32 math
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c16, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r0.w, c16.x
mov r0.xyz, v2
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
add r0.xyz, r0, c16.x
mul r2.xyz, r0.zxyw, r1.yzxw
mad r2.xyz, r0.yzxw, r1.zxyw, -r2
mov o4.xyz, r1
mul r2.xyz, v2.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
dp4 r1.w, v0, c7
dp4 r1.z, v0, c6
dp4 r1.x, v0, c4
dp4 r1.y, v0, c5
mul o5.xyz, r0.w, r2
mov o2, r1
dp4 o6.y, r1, c13
dp4 o6.x, r1, c12
mov o3.xyz, r0
mov o1.xy, v3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 27 math
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 288
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedmdfgjhoeogphpponijlbnkfloaemelddabaaaaaadeagaaaaadaaaaaa
cmaaaaaamaaaaaaajaabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklfdeieefcjmaeaaaaeaaaabaachabaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaabdaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
abaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaaegiacaaaaaaaaaaaacaaaaaa
dcaaaaakdcaabaaaabaaaaaaegiacaaaaaaaaaaaabaaaaaaagaabaaaaaaaaaaa
egaabaaaabaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaaaaaaaaaaadaaaaaa
kgakbaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakmccabaaaabaaaaaaagiecaaa
aaaaaaaaaeaaaaaapgapbaaaaaaaaaaaagaebaaaabaaaaaadgaaaaafpccabaaa
acaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaa
baaaaaaibcaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaabaaaaaabaaaaaaa
baaaaaaiccaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaabaaaaaabbaaaaaa
baaaaaaiecaabaaaaaaaaaaaegbcbaaaabaaaaaaegiccaaaabaaaaaabcaaaaaa
dgaaaaafhccabaaaadaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgbfbaaaacaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaabaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaa
abaaaaaadiaaaaahhcaabaaaacaaaaaacgajbaaaaaaaaaaajgaebaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaajgaebaaaaaaaaaaacgajbaaaabaaaaaaegacbaia
ebaaaaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaa
acaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaafaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_12;
  tmpvar_12 = (texture2D (_LightTexture0, xlv_TEXCOORD5).w * 2.0);
  attenuation_3 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_14;
  tmpvar_14[0].x = -0.999999;
  tmpvar_14[0].y = 0.00159255;
  tmpvar_14[1].x = -0.00159255;
  tmpvar_14[1].y = -0.999999;
  lowp vec4 tmpvar_15;
  highp vec2 P_16;
  P_16 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_15 = texture2D (_Mask, P_16);
  node_1540_2 = tmpvar_15;
  highp vec2 P_17;
  P_17 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_14) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_18;
  arg0_18 = (1.0 - texture2D (_Glittermap, P_17).xyz);
  highp vec3 tmpvar_19;
  tmpvar_19 = (max (arg0_18, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_20 = texture2D (_Glittermap, P_21);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_22 = texture2D (_Specularglitter, P_23);
  lowp vec4 tmpvar_24;
  highp vec2 P_25;
  P_25 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_24 = texture2D (_MainTex, P_25);
  highp vec4 tmpvar_26;
  tmpvar_26.w = 0.0;
  tmpvar_26.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_13) * ((tmpvar_24.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + ((tmpvar_13 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_19) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_26;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_9;
  normal_9.xy = ((texture2D (_Normalmap, P_8).wy * 2.0) - 1.0);
  normal_9.z = sqrt((1.0 - clamp (dot (normal_9.xy, normal_9.xy), 0.0, 1.0)));
  normalLocal_4 = normal_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_12;
  tmpvar_12 = (texture2D (_LightTexture0, xlv_TEXCOORD5).w * 2.0);
  attenuation_3 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_14;
  tmpvar_14[0].x = -0.999999;
  tmpvar_14[0].y = 0.00159255;
  tmpvar_14[1].x = -0.00159255;
  tmpvar_14[1].y = -0.999999;
  lowp vec4 tmpvar_15;
  highp vec2 P_16;
  P_16 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_15 = texture2D (_Mask, P_16);
  node_1540_2 = tmpvar_15;
  highp vec2 P_17;
  P_17 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_14) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_18;
  arg0_18 = (1.0 - texture2D (_Glittermap, P_17).xyz);
  highp vec3 tmpvar_19;
  tmpvar_19 = (max (arg0_18, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_20 = texture2D (_Glittermap, P_21);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_22 = texture2D (_Specularglitter, P_23);
  lowp vec4 tmpvar_24;
  highp vec2 P_25;
  P_25 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_24 = texture2D (_MainTex, P_25);
  highp vec4 tmpvar_26;
  tmpvar_26.w = 0.0;
  tmpvar_26.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_13) * ((tmpvar_24.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + ((tmpvar_13 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_19) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_26;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec2 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec2 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_12;
  tmpvar_12 = (texture (_LightTexture0, xlv_TEXCOORD5).w * 2.0);
  attenuation_3 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_14;
  tmpvar_14[0].x = -0.999999;
  tmpvar_14[0].y = 0.00159255;
  tmpvar_14[1].x = -0.00159255;
  tmpvar_14[1].y = -0.999999;
  lowp vec4 tmpvar_15;
  highp vec2 P_16;
  P_16 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_15 = texture (_Mask, P_16);
  node_1540_2 = tmpvar_15;
  highp vec2 P_17;
  P_17 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_14) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_18;
  arg0_18 = (1.0 - texture (_Glittermap, P_17).xyz);
  highp vec3 tmpvar_19;
  tmpvar_19 = (max (arg0_18, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_20 = texture (_Glittermap, P_21);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_22 = texture (_Specularglitter, P_23);
  lowp vec4 tmpvar_24;
  highp vec2 P_25;
  P_25 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_24 = texture (_MainTex, P_25);
  highp vec4 tmpvar_26;
  tmpvar_26.w = 0.0;
  tmpvar_26.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_13) * ((tmpvar_24.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + ((tmpvar_13 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_19) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_26;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 38 math
Keywords { "SPOT" "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [unity_World2Shadow0]
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
"3.0-!!ARBvp1.0
PARAM c[21] = { { 0 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.xyz, vertex.attrib[14];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, vertex.normal.y, c[14];
MAD R1.xyz, vertex.normal.x, c[13], R1;
MAD R1.xyz, vertex.normal.z, c[15], R1;
ADD R1.xyz, R1, c[0].x;
MUL R2.xyz, R1.zxyw, R0.yzxw;
MAD R2.xyz, R1.yzxw, R0.zxyw, -R2;
MOV result.texcoord[3].xyz, R0;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R2;
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
MOV result.texcoord[1], R0;
DP4 result.texcoord[5].w, R0, c[20];
DP4 result.texcoord[5].z, R0, c[19];
DP4 result.texcoord[5].y, R0, c[18];
DP4 result.texcoord[5].x, R0, c[17];
DP4 result.texcoord[6].w, R0, c[8];
DP4 result.texcoord[6].z, R0, c[7];
DP4 result.texcoord[6].y, R0, c[6];
DP4 result.texcoord[6].x, R0, c[5];
MOV result.texcoord[2].xyz, R1;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 38 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 38 math
Keywords { "SPOT" "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [unity_World2Shadow0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c20, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r1.xyz, v2
mov r1.w, c20.x
dp4 r0.z, r1, c10
dp4 r0.y, r1, c9
dp4 r0.x, r1, c8
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mul r1.xyz, v1.y, c13
mad r1.xyz, v1.x, c12, r1
mad r1.xyz, v1.z, c14, r1
add r1.xyz, r1, c20.x
mul r2.xyz, r1.zxyw, r0.yzxw
mad r2.xyz, r1.yzxw, r0.zxyw, -r2
mov o4.xyz, r0
mul r2.xyz, v2.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul o5.xyz, r0.w, r2
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
mov o2, r0
dp4 o6.w, r0, c19
dp4 o6.z, r0, c18
dp4 o6.y, r0, c17
dp4 o6.x, r0, c16
dp4 o7.w, r0, c7
dp4 o7.z, r0, c6
dp4 o7.y, r0, c5
dp4 o7.x, r0, c4
mov o3.xyz, r1
mov o1.xy, v3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 31 math
Keywords { "SPOT" "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 288
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedcapohiacgmmgmlkebfelblfpgdnphepmabaaaaaaaaahaaaaadaaaaaa
cmaaaaaamaaaaaaakiabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
neaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaneaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
neaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaaneaaaaaaagaaaaaa
aaaaaaaaadaaaaaaahaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklfdeieefcfaafaaaaeaaaabaafeabaaaafjaaaaaeegiocaaa
aaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaamaaaaaafjaaaaaeegiocaaa
acaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaa
fpaaaaadpcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadpccabaaaagaaaaaagfaaaaadpccabaaaahaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaaaaaaaaaabaaaaaai
bcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabaaaaaaabaaaaaai
ccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabbaaaaaabaaaaaai
ecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabcaaaaaadgaaaaaf
hccabaaaadaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaa
acaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaaacaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaajgaebaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaajgaebaaaabaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaa
adaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaacaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhccabaaaafaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaaaaaaaaaacaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
abaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaadaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pccabaaaagaaaaaaegiocaaaaaaaaaaaaeaaaaaapgapbaaaaaaaaaaaegaobaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaabaaaaaa
ajaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaaiaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaa
akaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaahaaaaaa
egiocaaaabaaaaaaalaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab
"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  lowp vec4 tmpvar_12;
  highp vec2 P_13;
  P_13 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_12 = texture2D (_LightTexture0, P_13);
  highp float tmpvar_14;
  tmpvar_14 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_LightTextureB0, vec2(tmpvar_14));
  lowp float tmpvar_16;
  mediump float shadow_17;
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6);
  highp float tmpvar_19;
  if ((tmpvar_18.x < (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))) {
    tmpvar_19 = _LightShadowData.x;
  } else {
    tmpvar_19 = 1.0;
  };
  shadow_17 = tmpvar_19;
  tmpvar_16 = shadow_17;
  highp vec3 tmpvar_20;
  tmpvar_20 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_12.w) * tmpvar_15.w) * tmpvar_16) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_21;
  tmpvar_21[0].x = -0.999999;
  tmpvar_21[0].y = 0.00159255;
  tmpvar_21[1].x = -0.00159255;
  tmpvar_21[1].y = -0.999999;
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_22 = texture2D (_Mask, P_23);
  node_1540_2 = tmpvar_22;
  highp vec2 P_24;
  P_24 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_21) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_25;
  arg0_25 = (1.0 - texture2D (_Glittermap, P_24).xyz);
  highp vec3 tmpvar_26;
  tmpvar_26 = (max (arg0_25, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_27;
  highp vec2 P_28;
  P_28 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_27 = texture2D (_Glittermap, P_28);
  lowp vec4 tmpvar_29;
  highp vec2 P_30;
  P_30 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_29 = texture2D (_Specularglitter, P_30);
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture2D (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 0.0;
  tmpvar_33.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_20) * ((tmpvar_31.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_26))) + ((tmpvar_20 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_26) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_33;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_8;
  normal_8.xy = ((texture2D (_Normalmap, P_7).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (dot (normal_8.xy, normal_8.xy), 0.0, 1.0)));
  normalLocal_3 = normal_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  lowp vec4 tmpvar_12;
  highp vec2 P_13;
  P_13 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_12 = texture2D (_LightTexture0, P_13);
  highp float tmpvar_14;
  tmpvar_14 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_LightTextureB0, vec2(tmpvar_14));
  lowp float tmpvar_16;
  mediump float shadow_17;
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6);
  highp float tmpvar_19;
  if ((tmpvar_18.x < (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))) {
    tmpvar_19 = _LightShadowData.x;
  } else {
    tmpvar_19 = 1.0;
  };
  shadow_17 = tmpvar_19;
  tmpvar_16 = shadow_17;
  highp vec3 tmpvar_20;
  tmpvar_20 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_12.w) * tmpvar_15.w) * tmpvar_16) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_21;
  tmpvar_21[0].x = -0.999999;
  tmpvar_21[0].y = 0.00159255;
  tmpvar_21[1].x = -0.00159255;
  tmpvar_21[1].y = -0.999999;
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_22 = texture2D (_Mask, P_23);
  node_1540_2 = tmpvar_22;
  highp vec2 P_24;
  P_24 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_21) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_25;
  arg0_25 = (1.0 - texture2D (_Glittermap, P_24).xyz);
  highp vec3 tmpvar_26;
  tmpvar_26 = (max (arg0_25, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_27;
  highp vec2 P_28;
  P_28 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_27 = texture2D (_Glittermap, P_28);
  lowp vec4 tmpvar_29;
  highp vec2 P_30;
  P_30 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_29 = texture2D (_Specularglitter, P_30);
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture2D (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 0.0;
  tmpvar_33.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_20) * ((tmpvar_31.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_26))) + ((tmpvar_20 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_26) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_33;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
out highp vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
in highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  lowp vec4 tmpvar_12;
  highp vec2 P_13;
  P_13 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_12 = texture (_LightTexture0, P_13);
  highp float tmpvar_14;
  tmpvar_14 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture (_LightTextureB0, vec2(tmpvar_14));
  lowp float tmpvar_16;
  mediump float shadow_17;
  lowp vec4 tmpvar_18;
  tmpvar_18 = textureProj (_ShadowMapTexture, xlv_TEXCOORD6);
  highp float tmpvar_19;
  if ((tmpvar_18.x < (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))) {
    tmpvar_19 = _LightShadowData.x;
  } else {
    tmpvar_19 = 1.0;
  };
  shadow_17 = tmpvar_19;
  tmpvar_16 = shadow_17;
  highp vec3 tmpvar_20;
  tmpvar_20 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_12.w) * tmpvar_15.w) * tmpvar_16) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_21;
  tmpvar_21[0].x = -0.999999;
  tmpvar_21[0].y = 0.00159255;
  tmpvar_21[1].x = -0.00159255;
  tmpvar_21[1].y = -0.999999;
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_22 = texture (_Mask, P_23);
  node_1540_2 = tmpvar_22;
  highp vec2 P_24;
  P_24 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_21) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_25;
  arg0_25 = (1.0 - texture (_Glittermap, P_24).xyz);
  highp vec3 tmpvar_26;
  tmpvar_26 = (max (arg0_25, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_27;
  highp vec2 P_28;
  P_28 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_27 = texture (_Glittermap, P_28);
  lowp vec4 tmpvar_29;
  highp vec2 P_30;
  P_30 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_29 = texture (_Specularglitter, P_30);
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 0.0;
  tmpvar_33.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_20) * ((tmpvar_31.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_26))) + ((tmpvar_20 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_26) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_33;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 38 math
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [unity_World2Shadow0]
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
"3.0-!!ARBvp1.0
PARAM c[21] = { { 0 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.xyz, vertex.attrib[14];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, vertex.normal.y, c[14];
MAD R1.xyz, vertex.normal.x, c[13], R1;
MAD R1.xyz, vertex.normal.z, c[15], R1;
ADD R1.xyz, R1, c[0].x;
MUL R2.xyz, R1.zxyw, R0.yzxw;
MAD R2.xyz, R1.yzxw, R0.zxyw, -R2;
MOV result.texcoord[3].xyz, R0;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R2;
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
MOV result.texcoord[1], R0;
DP4 result.texcoord[5].w, R0, c[20];
DP4 result.texcoord[5].z, R0, c[19];
DP4 result.texcoord[5].y, R0, c[18];
DP4 result.texcoord[5].x, R0, c[17];
DP4 result.texcoord[6].w, R0, c[8];
DP4 result.texcoord[6].z, R0, c[7];
DP4 result.texcoord[6].y, R0, c[6];
DP4 result.texcoord[6].x, R0, c[5];
MOV result.texcoord[2].xyz, R1;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 38 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 38 math
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [unity_World2Shadow0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c20, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r1.xyz, v2
mov r1.w, c20.x
dp4 r0.z, r1, c10
dp4 r0.y, r1, c9
dp4 r0.x, r1, c8
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mul r1.xyz, v1.y, c13
mad r1.xyz, v1.x, c12, r1
mad r1.xyz, v1.z, c14, r1
add r1.xyz, r1, c20.x
mul r2.xyz, r1.zxyw, r0.yzxw
mad r2.xyz, r1.yzxw, r0.zxyw, -r2
mov o4.xyz, r0
mul r2.xyz, v2.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul o5.xyz, r0.w, r2
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
mov o2, r0
dp4 o6.w, r0, c19
dp4 o6.z, r0, c18
dp4 o6.y, r0, c17
dp4 o6.x, r0, c16
dp4 o7.w, r0, c7
dp4 o7.z, r0, c6
dp4 o7.y, r0, c5
dp4 o7.x, r0, c4
mov o3.xyz, r1
mov o1.xy, v3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 31 math
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 288
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedcapohiacgmmgmlkebfelblfpgdnphepmabaaaaaaaaahaaaaadaaaaaa
cmaaaaaamaaaaaaakiabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
neaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaneaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
neaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaaneaaaaaaagaaaaaa
aaaaaaaaadaaaaaaahaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklfdeieefcfaafaaaaeaaaabaafeabaaaafjaaaaaeegiocaaa
aaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaamaaaaaafjaaaaaeegiocaaa
acaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaa
fpaaaaadpcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadpccabaaaagaaaaaagfaaaaadpccabaaaahaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaaaaaaaaaabaaaaaai
bcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabaaaaaaabaaaaaai
ccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabbaaaaaabaaaaaai
ecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabcaaaaaadgaaaaaf
hccabaaaadaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaa
acaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaaacaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaajgaebaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaajgaebaaaabaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaa
adaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaacaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhccabaaaafaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaaaaaaaaaacaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
abaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaadaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pccabaaaagaaaaaaegiocaaaaaaaaaaaaeaaaaaapgapbaaaaaaaaaaaegaobaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaabaaaaaa
ajaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaaiaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaa
akaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaahaaaaaa
egiocaaaabaaaaaaalaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab
"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_11 = texture2D (_LightTexture0, P_12);
  highp float tmpvar_13;
  tmpvar_13 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_LightTextureB0, vec2(tmpvar_13));
  lowp float tmpvar_15;
  mediump float shadow_16;
  lowp float tmpvar_17;
  tmpvar_17 = shadow2DProjEXT (_ShadowMapTexture, xlv_TEXCOORD6);
  shadow_16 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = (_LightShadowData.x + (shadow_16 * (1.0 - _LightShadowData.x)));
  shadow_16 = tmpvar_18;
  tmpvar_15 = shadow_16;
  highp vec3 tmpvar_19;
  tmpvar_19 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_11.w) * tmpvar_14.w) * tmpvar_15) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_20;
  tmpvar_20[0].x = -0.999999;
  tmpvar_20[0].y = 0.00159255;
  tmpvar_20[1].x = -0.00159255;
  tmpvar_20[1].y = -0.999999;
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_21 = texture2D (_Mask, P_22);
  node_1540_2 = tmpvar_21;
  highp vec2 P_23;
  P_23 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_20) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_24;
  arg0_24 = (1.0 - texture2D (_Glittermap, P_23).xyz);
  highp vec3 tmpvar_25;
  tmpvar_25 = (max (arg0_24, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture2D (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture2D (_Specularglitter, P_29);
  lowp vec4 tmpvar_30;
  highp vec2 P_31;
  P_31 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_30 = texture2D (_MainTex, P_31);
  highp vec4 tmpvar_32;
  tmpvar_32.w = 0.0;
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_19) * ((tmpvar_30.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_32;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
out highp vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
in highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_11 = texture (_LightTexture0, P_12);
  highp float tmpvar_13;
  tmpvar_13 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture (_LightTextureB0, vec2(tmpvar_13));
  lowp float tmpvar_15;
  mediump float shadow_16;
  mediump float tmpvar_17;
  tmpvar_17 = textureProj (_ShadowMapTexture, xlv_TEXCOORD6);
  highp float tmpvar_18;
  tmpvar_18 = (_LightShadowData.x + (tmpvar_17 * (1.0 - _LightShadowData.x)));
  shadow_16 = tmpvar_18;
  tmpvar_15 = shadow_16;
  highp vec3 tmpvar_19;
  tmpvar_19 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_11.w) * tmpvar_14.w) * tmpvar_15) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_20;
  tmpvar_20[0].x = -0.999999;
  tmpvar_20[0].y = 0.00159255;
  tmpvar_20[1].x = -0.00159255;
  tmpvar_20[1].y = -0.999999;
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_21 = texture (_Mask, P_22);
  node_1540_2 = tmpvar_21;
  highp vec2 P_23;
  P_23 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_20) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_24;
  arg0_24 = (1.0 - texture (_Glittermap, P_23).xyz);
  highp vec3 tmpvar_25;
  tmpvar_25 = (max (arg0_24, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture (_Specularglitter, P_29);
  lowp vec4 tmpvar_30;
  highp vec2 P_31;
  P_31 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_30 = texture (_MainTex, P_31);
  highp vec4 tmpvar_32;
  tmpvar_32.w = 0.0;
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_19) * ((tmpvar_30.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_32;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 34 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
"3.0-!!ARBvp1.0
PARAM c[14] = { { 0, 0.5 },
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R1.z, R0, c[7];
DP4 R1.y, R0, c[6];
DP4 R1.x, R0, c[5];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R1;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
ADD R1.xyz, R0, c[0].x;
MUL R0.xyz, R1.zxyw, R3.yzxw;
MAD R0.xyz, R1.yzxw, R3.zxyw, -R0;
MUL R0.xyz, vertex.attrib[14].w, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].y;
MUL R2.y, R2, c[13].x;
MOV result.texcoord[3].xyz, R3;
ADD result.texcoord[5].xy, R2, R2.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[2].xyz, R1;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.texcoord[1].w, vertex.position, c[8];
DP4 result.texcoord[1].z, vertex.position, c[7];
DP4 result.texcoord[1].y, vertex.position, c[6];
DP4 result.texcoord[1].x, vertex.position, c[5];
END
# 34 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 34 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c14, 0.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r0.w, c14.x
mov r0.xyz, v2
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r3.xyz, r0.w, r1
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
add r1.xyz, r0, c14.x
mul r0.xyz, r1.zxyw, r3.yzxw
mad r0.xyz, r1.yzxw, r3.zxyw, -r0
mul r0.xyz, v2.w, r0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul o5.xyz, r0.w, r0
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c14.y
mul r2.y, r2, c12.x
mov o4.xyz, r3
mad o6.xy, r2.z, c13.zwzw, r2
mov o0, r0
mov o6.zw, r0
mov o3.xyz, r1
mov o1.xy, v3
dp4 o2.w, v0, c7
dp4 o2.z, v0, c6
dp4 o2.y, v0, c5
dp4 o2.x, v0, c4
"
}
SubProgram "d3d11 " {
// Stats: 26 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "UnityPerCamera" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedmleiiecjgjfdeomojhpbphibfdhlompiabaaaaaabeagaaaaadaaaaaa
cmaaaaaamaaaaaaajaabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklfdeieefchmaeaaaaeaaaabaabpabaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaabdaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaadpcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaad
pccabaaaagaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
abaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpccabaaaacaaaaaaegiocaaaabaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaabaaaaaaibcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabaaaaaaabaaaaaaiccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabbaaaaaabaaaaaaiecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
abaaaaaabcaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaafgbfbaaaacaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaa
acaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaa
aeaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaa
jgaebaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgaebaaaabaaaaaacgajbaaa
acaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgbpbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hccabaaaafaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaagaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_12;
  mediump float lightShadowDataX_13;
  highp float dist_14;
  lowp float tmpvar_15;
  tmpvar_15 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_14 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = _LightShadowData.x;
  lightShadowDataX_13 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (float((dist_14 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_13);
  tmpvar_12 = tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_18 = (tmpvar_12 * 2.0);
  attenuation_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_20;
  tmpvar_20[0].x = -0.999999;
  tmpvar_20[0].y = 0.00159255;
  tmpvar_20[1].x = -0.00159255;
  tmpvar_20[1].y = -0.999999;
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_21 = texture2D (_Mask, P_22);
  node_1540_2 = tmpvar_21;
  highp vec2 P_23;
  P_23 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_20) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_24;
  arg0_24 = (1.0 - texture2D (_Glittermap, P_23).xyz);
  highp vec3 tmpvar_25;
  tmpvar_25 = (max (arg0_24, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture2D (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture2D (_Specularglitter, P_29);
  lowp vec4 tmpvar_30;
  highp vec2 P_31;
  P_31 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_30 = texture2D (_MainTex, P_31);
  highp vec4 tmpvar_32;
  tmpvar_32.w = 0.0;
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_19) * ((tmpvar_30.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_32;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = o_7;
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_9;
  normal_9.xy = ((texture2D (_Normalmap, P_8).wy * 2.0) - 1.0);
  normal_9.z = sqrt((1.0 - clamp (dot (normal_9.xy, normal_9.xy), 0.0, 1.0)));
  normalLocal_4 = normal_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_12;
  tmpvar_12 = (texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x * 2.0);
  attenuation_3 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_14;
  tmpvar_14[0].x = -0.999999;
  tmpvar_14[0].y = 0.00159255;
  tmpvar_14[1].x = -0.00159255;
  tmpvar_14[1].y = -0.999999;
  lowp vec4 tmpvar_15;
  highp vec2 P_16;
  P_16 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_15 = texture2D (_Mask, P_16);
  node_1540_2 = tmpvar_15;
  highp vec2 P_17;
  P_17 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_14) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_18;
  arg0_18 = (1.0 - texture2D (_Glittermap, P_17).xyz);
  highp vec3 tmpvar_19;
  tmpvar_19 = (max (arg0_18, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_20 = texture2D (_Glittermap, P_21);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_22 = texture2D (_Specularglitter, P_23);
  lowp vec4 tmpvar_24;
  highp vec2 P_25;
  P_25 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_24 = texture2D (_MainTex, P_25);
  highp vec4 tmpvar_26;
  tmpvar_26.w = 0.0;
  tmpvar_26.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_13) * ((tmpvar_24.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + ((tmpvar_13 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_19) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_26;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_12;
  mediump float lightShadowDataX_13;
  highp float dist_14;
  lowp float tmpvar_15;
  tmpvar_15 = textureProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_14 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = _LightShadowData.x;
  lightShadowDataX_13 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (float((dist_14 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_13);
  tmpvar_12 = tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_18 = (tmpvar_12 * 2.0);
  attenuation_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_20;
  tmpvar_20[0].x = -0.999999;
  tmpvar_20[0].y = 0.00159255;
  tmpvar_20[1].x = -0.00159255;
  tmpvar_20[1].y = -0.999999;
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_21 = texture (_Mask, P_22);
  node_1540_2 = tmpvar_21;
  highp vec2 P_23;
  P_23 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_20) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_24;
  arg0_24 = (1.0 - texture (_Glittermap, P_23).xyz);
  highp vec3 tmpvar_25;
  tmpvar_25 = (max (arg0_24, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture (_Specularglitter, P_29);
  lowp vec4 tmpvar_30;
  highp vec2 P_31;
  P_31 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_30 = texture (_MainTex, P_31);
  highp vec4 tmpvar_32;
  tmpvar_32.w = 0.0;
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_19) * ((tmpvar_30.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_32;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 37 math
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_ProjectionParams]
"3.0-!!ARBvp1.0
PARAM c[18] = { { 0, 0.5 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R1.z, R0, c[7];
DP4 R1.y, R0, c[6];
DP4 R1.x, R0, c[5];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R1;
MUL R0.xyz, vertex.normal.y, c[10];
MAD R0.xyz, vertex.normal.x, c[9], R0;
MAD R0.xyz, vertex.normal.z, c[11], R0;
ADD R1.xyz, R0, c[0].x;
MUL R0.xyz, R1.zxyw, R3.yzxw;
MAD R0.xyz, R1.yzxw, R3.zxyw, -R0;
MUL R0.xyz, vertex.attrib[14].w, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R2.w, vertex.position, c[8];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].y;
MUL R2.y, R2, c[17].x;
ADD result.texcoord[6].xy, R2, R2.z;
DP4 R2.z, vertex.position, c[7];
DP4 R2.x, vertex.position, c[5];
DP4 R2.y, vertex.position, c[6];
MOV result.texcoord[3].xyz, R3;
MOV result.position, R0;
MOV result.texcoord[1], R2;
DP4 result.texcoord[5].y, R2, c[14];
DP4 result.texcoord[5].x, R2, c[13];
MOV result.texcoord[6].zw, R0;
MOV result.texcoord[2].xyz, R1;
MOV result.texcoord[0].xy, vertex.texcoord[0];
END
# 37 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 37 math
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c18, 0.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r0.w, c18.x
mov r0.xyz, v2
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r3.xyz, r0.w, r1
mul r0.xyz, v1.y, c9
mad r0.xyz, v1.x, c8, r0
mad r0.xyz, v1.z, c10, r0
add r1.xyz, r0, c18.x
mul r0.xyz, r1.zxyw, r3.yzxw
mad r0.xyz, r1.yzxw, r3.zxyw, -r0
mul r0.xyz, v2.w, r0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul o5.xyz, r0.w, r0
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r2.w, v0, c7
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c18.y
mul r2.y, r2, c16.x
mad o7.xy, r2.z, c17.zwzw, r2
dp4 r2.z, v0, c6
dp4 r2.x, v0, c4
dp4 r2.y, v0, c5
mov o4.xyz, r3
mov o0, r0
mov o2, r2
dp4 o6.y, r2, c13
dp4 o6.x, r2, c12
mov o7.zw, r0
mov o3.xyz, r1
mov o1.xy, v3
"
}
SubProgram "d3d11 " {
// Stats: 30 math
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 352
Matrix 80 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedbehpeijpdmnokplpjapbdncfpmoglbemabaaaaaapeagaaaaadaaaaaa
cmaaaaaamaaaaaaakiabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
neaaaaaaafaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaneaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
neaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaaneaaaaaaagaaaaaa
aaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklfdeieefceeafaaaaeaaaabaafbabaaaafjaaaaaeegiocaaa
aaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaa
fpaaaaadpcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaadiaaaaaidcaabaaaacaaaaaafgafbaaaabaaaaaaegiacaaa
aaaaaaaaagaaaaaadcaaaaakdcaabaaaacaaaaaaegiacaaaaaaaaaaaafaaaaaa
agaabaaaabaaaaaaegaabaaaacaaaaaadcaaaaakdcaabaaaacaaaaaaegiacaaa
aaaaaaaaahaaaaaakgakbaaaabaaaaaaegaabaaaacaaaaaadcaaaaakmccabaaa
abaaaaaaagiecaaaaaaaaaaaaiaaaaaapgapbaaaabaaaaaaagaebaaaacaaaaaa
dgaaaaafpccabaaaacaaaaaaegaobaaaabaaaaaadgaaaaafdccabaaaabaaaaaa
egbabaaaadaaaaaabaaaaaaibcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabaaaaaaabaaaaaaiccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabbaaaaaabaaaaaaiecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaa
acaaaaaabcaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaafgbfbaaaacaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
acaaaaaaegacbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaa
aeaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaa
jgaebaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgaebaaaabaaaaaacgajbaaa
acaaaaaaegacbaiaebaaaaaaadaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgbpbaaaacaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hccabaaaafaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaagaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_12;
  mediump float lightShadowDataX_13;
  highp float dist_14;
  lowp float tmpvar_15;
  tmpvar_15 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  dist_14 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = _LightShadowData.x;
  lightShadowDataX_13 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (float((dist_14 > (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))), lightShadowDataX_13);
  tmpvar_12 = tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_18 = ((texture2D (_LightTexture0, xlv_TEXCOORD5).w * tmpvar_12) * 2.0);
  attenuation_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_20;
  tmpvar_20[0].x = -0.999999;
  tmpvar_20[0].y = 0.00159255;
  tmpvar_20[1].x = -0.00159255;
  tmpvar_20[1].y = -0.999999;
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_21 = texture2D (_Mask, P_22);
  node_1540_2 = tmpvar_21;
  highp vec2 P_23;
  P_23 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_20) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_24;
  arg0_24 = (1.0 - texture2D (_Glittermap, P_23).xyz);
  highp vec3 tmpvar_25;
  tmpvar_25 = (max (arg0_24, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture2D (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture2D (_Specularglitter, P_29);
  lowp vec4 tmpvar_30;
  highp vec2 P_31;
  P_31 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_30 = texture2D (_MainTex, P_31);
  highp vec4 tmpvar_32;
  tmpvar_32.w = 0.0;
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_19) * ((tmpvar_30.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_32;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  highp vec4 tmpvar_6;
  tmpvar_6 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_6 * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9.x = tmpvar_8.x;
  tmpvar_9.y = (tmpvar_8.y * _ProjectionParams.x);
  o_7.xy = (tmpvar_9 + tmpvar_8.w);
  o_7.zw = tmpvar_6.zw;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
  xlv_TEXCOORD6 = o_7;
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_9;
  normal_9.xy = ((texture2D (_Normalmap, P_8).wy * 2.0) - 1.0);
  normal_9.z = sqrt((1.0 - clamp (dot (normal_9.xy, normal_9.xy), 0.0, 1.0)));
  normalLocal_4 = normal_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_12;
  tmpvar_12 = ((texture2D (_LightTexture0, xlv_TEXCOORD5).w * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x) * 2.0);
  attenuation_3 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_14;
  tmpvar_14[0].x = -0.999999;
  tmpvar_14[0].y = 0.00159255;
  tmpvar_14[1].x = -0.00159255;
  tmpvar_14[1].y = -0.999999;
  lowp vec4 tmpvar_15;
  highp vec2 P_16;
  P_16 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_15 = texture2D (_Mask, P_16);
  node_1540_2 = tmpvar_15;
  highp vec2 P_17;
  P_17 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_14) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_18;
  arg0_18 = (1.0 - texture2D (_Glittermap, P_17).xyz);
  highp vec3 tmpvar_19;
  tmpvar_19 = (max (arg0_18, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_20 = texture2D (_Glittermap, P_21);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_22 = texture2D (_Specularglitter, P_23);
  lowp vec4 tmpvar_24;
  highp vec2 P_25;
  P_25 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_24 = texture2D (_MainTex, P_25);
  highp vec4 tmpvar_26;
  tmpvar_26.w = 0.0;
  tmpvar_26.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_13) * ((tmpvar_24.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + ((tmpvar_13 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_19) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_26;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec2 xlv_TEXCOORD5;
out highp vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec2 xlv_TEXCOORD5;
in highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp float attenuation_3;
  highp vec3 normalLocal_4;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD3.x;
  tmpvar_6[0].y = xlv_TEXCOORD4.x;
  tmpvar_6[0].z = tmpvar_5.x;
  tmpvar_6[1].x = xlv_TEXCOORD3.y;
  tmpvar_6[1].y = xlv_TEXCOORD4.y;
  tmpvar_6[1].z = tmpvar_5.y;
  tmpvar_6[2].x = xlv_TEXCOORD3.z;
  tmpvar_6[2].y = xlv_TEXCOORD4.z;
  tmpvar_6[2].z = tmpvar_5.z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_8;
  P_8 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture (_Normalmap, P_8).xyz * 2.0) - 1.0);
  normalLocal_4 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((normalLocal_4 * tmpvar_6));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_12;
  mediump float lightShadowDataX_13;
  highp float dist_14;
  lowp float tmpvar_15;
  tmpvar_15 = textureProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  dist_14 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = _LightShadowData.x;
  lightShadowDataX_13 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = max (float((dist_14 > (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))), lightShadowDataX_13);
  tmpvar_12 = tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_18 = ((texture (_LightTexture0, xlv_TEXCOORD5).w * tmpvar_12) * 2.0);
  attenuation_3 = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_20;
  tmpvar_20[0].x = -0.999999;
  tmpvar_20[0].y = 0.00159255;
  tmpvar_20[1].x = -0.00159255;
  tmpvar_20[1].y = -0.999999;
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_21 = texture (_Mask, P_22);
  node_1540_2 = tmpvar_21;
  highp vec2 P_23;
  P_23 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_20) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_24;
  arg0_24 = (1.0 - texture (_Glittermap, P_23).xyz);
  highp vec3 tmpvar_25;
  tmpvar_25 = (max (arg0_24, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture (_Specularglitter, P_29);
  lowp vec4 tmpvar_30;
  highp vec2 P_31;
  P_31 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_30 = texture (_MainTex, P_31);
  highp vec4 tmpvar_32;
  tmpvar_32.w = 0.0;
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_19) * ((tmpvar_30.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_32;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 34 math
Keywords { "POINT" "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_LightPositionRange]
"3.0-!!ARBvp1.0
PARAM c[18] = { { 0 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.xyz, vertex.attrib[14];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[7];
DP4 R0.y, R1, c[6];
DP4 R0.x, R1, c[5];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, vertex.normal.y, c[10];
MAD R1.xyz, vertex.normal.x, c[9], R1;
MAD R1.xyz, vertex.normal.z, c[11], R1;
ADD R1.xyz, R1, c[0].x;
MUL R2.xyz, R1.zxyw, R0.yzxw;
MAD R2.xyz, R1.yzxw, R0.zxyw, -R2;
MOV result.texcoord[3].xyz, R0;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R2;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
MOV result.texcoord[1], R0;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
MOV result.texcoord[2].xyz, R1;
ADD result.texcoord[6].xyz, R0, -c[17];
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 34 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 34 math
Keywords { "POINT" "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_LightPositionRange]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c17, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r1.xyz, v2
mov r1.w, c17.x
dp4 r0.z, r1, c6
dp4 r0.y, r1, c5
dp4 r0.x, r1, c4
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mul r1.xyz, v1.y, c9
mad r1.xyz, v1.x, c8, r1
mad r1.xyz, v1.z, c10, r1
add r1.xyz, r1, c17.x
mul r2.xyz, r1.zxyw, r0.yzxw
mad r2.xyz, r1.yzxw, r0.zxyw, -r2
mov o4.xyz, r0
mul r2.xyz, v2.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul o5.xyz, r0.w, r2
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov o2, r0
dp4 o6.z, r0, c14
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
mov o3.xyz, r1
add o7.xyz, r0, -c16
mov o1.xy, v3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 28 math
Keywords { "POINT" "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 288
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedilmignahpapgpmgdabomnngaommhchmnabaaaaaaimagaaaaadaaaaaa
cmaaaaaamaaaaaaakiabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
neaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaneaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
neaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaahaiaaaaneaaaaaaagaaaaaa
aaaaaaaaadaaaaaaahaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklfdeieefcnmaeaaaaeaaaabaadhabaaaafjaaaaaeegiocaaa
aaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaacaaaaaafjaaaaaeegiocaaa
acaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaa
fpaaaaadpcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadhccabaaaagaaaaaagfaaaaadhccabaaaahaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaaaaaaaaaabaaaaaai
bcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabaaaaaaabaaaaaai
ccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabbaaaaaabaaaaaai
ecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabcaaaaaadgaaaaaf
hccabaaaadaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaa
acaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaaacaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaajgaebaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaajgaebaaaabaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaa
adaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaacaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhccabaaaafaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaa
abaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaadaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hccabaaaagaaaaaaegiccaaaaaaaaaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaaaaaaaaajhccabaaaahaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaa
abaaaaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_CUBE" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
  xlv_TEXCOORD6 = ((_Object2World * _glesVertex).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightPositionRange;
uniform highp vec4 _LightShadowData;
uniform lowp samplerCube _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTexture0, vec2(tmpvar_12));
  highp float tmpvar_14;
  tmpvar_14 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec4 packDist_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  packDist_15 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (packDist_15, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp float tmpvar_18;
  if ((tmpvar_17 < tmpvar_14)) {
    tmpvar_18 = _LightShadowData.x;
  } else {
    tmpvar_18 = 1.0;
  };
  highp vec3 tmpvar_19;
  tmpvar_19 = (((tmpvar_13.w * tmpvar_18) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_20;
  tmpvar_20[0].x = -0.999999;
  tmpvar_20[0].y = 0.00159255;
  tmpvar_20[1].x = -0.00159255;
  tmpvar_20[1].y = -0.999999;
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_21 = texture2D (_Mask, P_22);
  node_1540_2 = tmpvar_21;
  highp vec2 P_23;
  P_23 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_20) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_24;
  arg0_24 = (1.0 - texture2D (_Glittermap, P_23).xyz);
  highp vec3 tmpvar_25;
  tmpvar_25 = (max (arg0_24, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture2D (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture2D (_Specularglitter, P_29);
  lowp vec4 tmpvar_30;
  highp vec2 P_31;
  P_31 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_30 = texture2D (_MainTex, P_31);
  highp vec4 tmpvar_32;
  tmpvar_32.w = 0.0;
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_19) * ((tmpvar_30.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_32;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "POINT" "SHADOWS_CUBE" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
  xlv_TEXCOORD6 = ((_Object2World * _glesVertex).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightPositionRange;
uniform highp vec4 _LightShadowData;
uniform lowp samplerCube _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_8;
  normal_8.xy = ((texture2D (_Normalmap, P_7).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (dot (normal_8.xy, normal_8.xy), 0.0, 1.0)));
  normalLocal_3 = normal_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTexture0, vec2(tmpvar_12));
  highp float tmpvar_14;
  tmpvar_14 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec4 packDist_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  packDist_15 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (packDist_15, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp float tmpvar_18;
  if ((tmpvar_17 < tmpvar_14)) {
    tmpvar_18 = _LightShadowData.x;
  } else {
    tmpvar_18 = 1.0;
  };
  highp vec3 tmpvar_19;
  tmpvar_19 = (((tmpvar_13.w * tmpvar_18) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_20;
  tmpvar_20[0].x = -0.999999;
  tmpvar_20[0].y = 0.00159255;
  tmpvar_20[1].x = -0.00159255;
  tmpvar_20[1].y = -0.999999;
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_21 = texture2D (_Mask, P_22);
  node_1540_2 = tmpvar_21;
  highp vec2 P_23;
  P_23 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_20) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_24;
  arg0_24 = (1.0 - texture2D (_Glittermap, P_23).xyz);
  highp vec3 tmpvar_25;
  tmpvar_25 = (max (arg0_24, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture2D (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture2D (_Specularglitter, P_29);
  lowp vec4 tmpvar_30;
  highp vec2 P_31;
  P_31 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_30 = texture2D (_MainTex, P_31);
  highp vec4 tmpvar_32;
  tmpvar_32.w = 0.0;
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_19) * ((tmpvar_30.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_32;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec3 xlv_TEXCOORD5;
out highp vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
  xlv_TEXCOORD6 = ((_Object2World * _glesVertex).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightPositionRange;
uniform highp vec4 _LightShadowData;
uniform lowp samplerCube _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec3 xlv_TEXCOORD5;
in highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_LightTexture0, vec2(tmpvar_12));
  highp float tmpvar_14;
  tmpvar_14 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec4 packDist_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture (_ShadowMapTexture, xlv_TEXCOORD6);
  packDist_15 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (packDist_15, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp float tmpvar_18;
  if ((tmpvar_17 < tmpvar_14)) {
    tmpvar_18 = _LightShadowData.x;
  } else {
    tmpvar_18 = 1.0;
  };
  highp vec3 tmpvar_19;
  tmpvar_19 = (((tmpvar_13.w * tmpvar_18) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_20;
  tmpvar_20[0].x = -0.999999;
  tmpvar_20[0].y = 0.00159255;
  tmpvar_20[1].x = -0.00159255;
  tmpvar_20[1].y = -0.999999;
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_21 = texture (_Mask, P_22);
  node_1540_2 = tmpvar_21;
  highp vec2 P_23;
  P_23 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_20) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_24;
  arg0_24 = (1.0 - texture (_Glittermap, P_23).xyz);
  highp vec3 tmpvar_25;
  tmpvar_25 = (max (arg0_24, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture (_Specularglitter, P_29);
  lowp vec4 tmpvar_30;
  highp vec2 P_31;
  P_31 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_30 = texture (_MainTex, P_31);
  highp vec4 tmpvar_32;
  tmpvar_32.w = 0.0;
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_19) * ((tmpvar_30.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_32;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 34 math
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_LightPositionRange]
"3.0-!!ARBvp1.0
PARAM c[18] = { { 0 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.xyz, vertex.attrib[14];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[7];
DP4 R0.y, R1, c[6];
DP4 R0.x, R1, c[5];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, vertex.normal.y, c[10];
MAD R1.xyz, vertex.normal.x, c[9], R1;
MAD R1.xyz, vertex.normal.z, c[11], R1;
ADD R1.xyz, R1, c[0].x;
MUL R2.xyz, R1.zxyw, R0.yzxw;
MAD R2.xyz, R1.yzxw, R0.zxyw, -R2;
MOV result.texcoord[3].xyz, R0;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R2;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
MOV result.texcoord[1], R0;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
MOV result.texcoord[2].xyz, R1;
ADD result.texcoord[6].xyz, R0, -c[17];
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 34 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 34 math
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_LightPositionRange]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c17, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r1.xyz, v2
mov r1.w, c17.x
dp4 r0.z, r1, c6
dp4 r0.y, r1, c5
dp4 r0.x, r1, c4
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mul r1.xyz, v1.y, c9
mad r1.xyz, v1.x, c8, r1
mad r1.xyz, v1.z, c10, r1
add r1.xyz, r1, c17.x
mul r2.xyz, r1.zxyw, r0.yzxw
mad r2.xyz, r1.yzxw, r0.zxyw, -r2
mov o4.xyz, r0
mul r2.xyz, v2.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul o5.xyz, r0.w, r2
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov o2, r0
dp4 o6.z, r0, c14
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
mov o3.xyz, r1
add o7.xyz, r0, -c16
mov o1.xy, v3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 28 math
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 288
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedilmignahpapgpmgdabomnngaommhchmnabaaaaaaimagaaaaadaaaaaa
cmaaaaaamaaaaaaakiabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
neaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaneaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
neaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaahaiaaaaneaaaaaaagaaaaaa
aaaaaaaaadaaaaaaahaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklfdeieefcnmaeaaaaeaaaabaadhabaaaafjaaaaaeegiocaaa
aaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaacaaaaaafjaaaaaeegiocaaa
acaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaa
fpaaaaadpcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadhccabaaaagaaaaaagfaaaaadhccabaaaahaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaaaaaaaaaabaaaaaai
bcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabaaaaaaabaaaaaai
ccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabbaaaaaabaaaaaai
ecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabcaaaaaadgaaaaaf
hccabaaaadaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaa
acaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaaacaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaajgaebaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaajgaebaaaabaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaa
adaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaacaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhccabaaaafaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaa
abaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaadaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hccabaaaagaaaaaaegiccaaaaaaaaaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaaaaaaaaajhccabaaaahaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaa
abaaaaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
  xlv_TEXCOORD6 = ((_Object2World * _glesVertex).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightPositionRange;
uniform highp vec4 _LightShadowData;
uniform lowp samplerCube _ShadowMapTexture;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTextureB0, vec2(tmpvar_12));
  lowp vec4 tmpvar_14;
  tmpvar_14 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  highp float tmpvar_15;
  tmpvar_15 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec4 packDist_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  packDist_16 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (packDist_16, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp float tmpvar_19;
  if ((tmpvar_18 < tmpvar_15)) {
    tmpvar_19 = _LightShadowData.x;
  } else {
    tmpvar_19 = 1.0;
  };
  highp vec3 tmpvar_20;
  tmpvar_20 = ((((tmpvar_13.w * tmpvar_14.w) * tmpvar_19) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_21;
  tmpvar_21[0].x = -0.999999;
  tmpvar_21[0].y = 0.00159255;
  tmpvar_21[1].x = -0.00159255;
  tmpvar_21[1].y = -0.999999;
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_22 = texture2D (_Mask, P_23);
  node_1540_2 = tmpvar_22;
  highp vec2 P_24;
  P_24 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_21) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_25;
  arg0_25 = (1.0 - texture2D (_Glittermap, P_24).xyz);
  highp vec3 tmpvar_26;
  tmpvar_26 = (max (arg0_25, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_27;
  highp vec2 P_28;
  P_28 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_27 = texture2D (_Glittermap, P_28);
  lowp vec4 tmpvar_29;
  highp vec2 P_30;
  P_30 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_29 = texture2D (_Specularglitter, P_30);
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture2D (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 0.0;
  tmpvar_33.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_20) * ((tmpvar_31.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_26))) + ((tmpvar_20 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_26) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_33;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
  xlv_TEXCOORD6 = ((_Object2World * _glesVertex).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightPositionRange;
uniform highp vec4 _LightShadowData;
uniform lowp samplerCube _ShadowMapTexture;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_8;
  normal_8.xy = ((texture2D (_Normalmap, P_7).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (dot (normal_8.xy, normal_8.xy), 0.0, 1.0)));
  normalLocal_3 = normal_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTextureB0, vec2(tmpvar_12));
  lowp vec4 tmpvar_14;
  tmpvar_14 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  highp float tmpvar_15;
  tmpvar_15 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec4 packDist_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  packDist_16 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (packDist_16, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp float tmpvar_19;
  if ((tmpvar_18 < tmpvar_15)) {
    tmpvar_19 = _LightShadowData.x;
  } else {
    tmpvar_19 = 1.0;
  };
  highp vec3 tmpvar_20;
  tmpvar_20 = ((((tmpvar_13.w * tmpvar_14.w) * tmpvar_19) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_21;
  tmpvar_21[0].x = -0.999999;
  tmpvar_21[0].y = 0.00159255;
  tmpvar_21[1].x = -0.00159255;
  tmpvar_21[1].y = -0.999999;
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_22 = texture2D (_Mask, P_23);
  node_1540_2 = tmpvar_22;
  highp vec2 P_24;
  P_24 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_21) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_25;
  arg0_25 = (1.0 - texture2D (_Glittermap, P_24).xyz);
  highp vec3 tmpvar_26;
  tmpvar_26 = (max (arg0_25, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_27;
  highp vec2 P_28;
  P_28 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_27 = texture2D (_Glittermap, P_28);
  lowp vec4 tmpvar_29;
  highp vec2 P_30;
  P_30 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_29 = texture2D (_Specularglitter, P_30);
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture2D (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 0.0;
  tmpvar_33.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_20) * ((tmpvar_31.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_26))) + ((tmpvar_20 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_26) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_33;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec3 xlv_TEXCOORD5;
out highp vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
  xlv_TEXCOORD6 = ((_Object2World * _glesVertex).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightPositionRange;
uniform highp vec4 _LightShadowData;
uniform lowp samplerCube _ShadowMapTexture;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec3 xlv_TEXCOORD5;
in highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_LightTextureB0, vec2(tmpvar_12));
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture (_LightTexture0, xlv_TEXCOORD5);
  highp float tmpvar_15;
  tmpvar_15 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec4 packDist_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture (_ShadowMapTexture, xlv_TEXCOORD6);
  packDist_16 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (packDist_16, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp float tmpvar_19;
  if ((tmpvar_18 < tmpvar_15)) {
    tmpvar_19 = _LightShadowData.x;
  } else {
    tmpvar_19 = 1.0;
  };
  highp vec3 tmpvar_20;
  tmpvar_20 = ((((tmpvar_13.w * tmpvar_14.w) * tmpvar_19) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_21;
  tmpvar_21[0].x = -0.999999;
  tmpvar_21[0].y = 0.00159255;
  tmpvar_21[1].x = -0.00159255;
  tmpvar_21[1].y = -0.999999;
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_22 = texture (_Mask, P_23);
  node_1540_2 = tmpvar_22;
  highp vec2 P_24;
  P_24 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_21) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_25;
  arg0_25 = (1.0 - texture (_Glittermap, P_24).xyz);
  highp vec3 tmpvar_26;
  tmpvar_26 = (max (arg0_25, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_27;
  highp vec2 P_28;
  P_28 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_27 = texture (_Glittermap, P_28);
  lowp vec4 tmpvar_29;
  highp vec2 P_30;
  P_30 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_29 = texture (_Specularglitter, P_30);
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 0.0;
  tmpvar_33.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_20) * ((tmpvar_31.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_26))) + ((tmpvar_20 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_26) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_33;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 38 math
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [unity_World2Shadow0]
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
"3.0-!!ARBvp1.0
PARAM c[21] = { { 0 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.xyz, vertex.attrib[14];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, vertex.normal.y, c[14];
MAD R1.xyz, vertex.normal.x, c[13], R1;
MAD R1.xyz, vertex.normal.z, c[15], R1;
ADD R1.xyz, R1, c[0].x;
MUL R2.xyz, R1.zxyw, R0.yzxw;
MAD R2.xyz, R1.yzxw, R0.zxyw, -R2;
MOV result.texcoord[3].xyz, R0;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R2;
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
MOV result.texcoord[1], R0;
DP4 result.texcoord[5].w, R0, c[20];
DP4 result.texcoord[5].z, R0, c[19];
DP4 result.texcoord[5].y, R0, c[18];
DP4 result.texcoord[5].x, R0, c[17];
DP4 result.texcoord[6].w, R0, c[8];
DP4 result.texcoord[6].z, R0, c[7];
DP4 result.texcoord[6].y, R0, c[6];
DP4 result.texcoord[6].x, R0, c[5];
MOV result.texcoord[2].xyz, R1;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 38 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 38 math
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [unity_World2Shadow0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c20, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r1.xyz, v2
mov r1.w, c20.x
dp4 r0.z, r1, c10
dp4 r0.y, r1, c9
dp4 r0.x, r1, c8
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mul r1.xyz, v1.y, c13
mad r1.xyz, v1.x, c12, r1
mad r1.xyz, v1.z, c14, r1
add r1.xyz, r1, c20.x
mul r2.xyz, r1.zxyw, r0.yzxw
mad r2.xyz, r1.yzxw, r0.zxyw, -r2
mov o4.xyz, r0
mul r2.xyz, v2.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul o5.xyz, r0.w, r2
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
mov o2, r0
dp4 o6.w, r0, c19
dp4 o6.z, r0, c18
dp4 o6.y, r0, c17
dp4 o6.x, r0, c16
dp4 o7.w, r0, c7
dp4 o7.z, r0, c6
dp4 o7.y, r0, c5
dp4 o7.x, r0, c4
mov o3.xyz, r1
mov o1.xy, v3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 31 math
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 352
Matrix 80 [_LightMatrix0]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedkhfcpdmoakoelmjfgeikpakdjdallphdabaaaaaaaaahaaaaadaaaaaa
cmaaaaaamaaaaaaakiabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
neaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaneaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
neaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaaneaaaaaaagaaaaaa
aaaaaaaaadaaaaaaahaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklfdeieefcfaafaaaaeaaaabaafeabaaaafjaaaaaeegiocaaa
aaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaamaaaaaafjaaaaaeegiocaaa
acaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaa
fpaaaaadpcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadpccabaaaagaaaaaagfaaaaadpccabaaaahaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaaaaaaaaaabaaaaaai
bcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabaaaaaaabaaaaaai
ccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabbaaaaaabaaaaaai
ecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabcaaaaaadgaaaaaf
hccabaaaadaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaa
acaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaaacaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaajgaebaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaajgaebaaaabaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaa
adaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaacaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhccabaaaafaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaaaaaaaaaagaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
afaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaahaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pccabaaaagaaaaaaegiocaaaaaaaaaaaaiaaaaaapgapbaaaaaaaaaaaegaobaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaabaaaaaa
ajaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaaiaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaa
akaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaahaaaaaa
egiocaaaabaaaaaaalaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab
"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _ShadowOffsets[4];
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  lowp vec4 tmpvar_12;
  highp vec2 P_13;
  P_13 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_12 = texture2D (_LightTexture0, P_13);
  highp float tmpvar_14;
  tmpvar_14 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_LightTextureB0, vec2(tmpvar_14));
  lowp float tmpvar_16;
  mediump vec4 shadows_17;
  highp vec4 shadowVals_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD6.xyz / xlv_TEXCOORD6.w);
  highp vec2 P_20;
  P_20 = (tmpvar_19.xy + _ShadowOffsets[0].xy);
  lowp float tmpvar_21;
  tmpvar_21 = texture2D (_ShadowMapTexture, P_20).x;
  shadowVals_18.x = tmpvar_21;
  highp vec2 P_22;
  P_22 = (tmpvar_19.xy + _ShadowOffsets[1].xy);
  lowp float tmpvar_23;
  tmpvar_23 = texture2D (_ShadowMapTexture, P_22).x;
  shadowVals_18.y = tmpvar_23;
  highp vec2 P_24;
  P_24 = (tmpvar_19.xy + _ShadowOffsets[2].xy);
  lowp float tmpvar_25;
  tmpvar_25 = texture2D (_ShadowMapTexture, P_24).x;
  shadowVals_18.z = tmpvar_25;
  highp vec2 P_26;
  P_26 = (tmpvar_19.xy + _ShadowOffsets[3].xy);
  lowp float tmpvar_27;
  tmpvar_27 = texture2D (_ShadowMapTexture, P_26).x;
  shadowVals_18.w = tmpvar_27;
  bvec4 tmpvar_28;
  tmpvar_28 = lessThan (shadowVals_18, tmpvar_19.zzzz);
  highp vec4 tmpvar_29;
  tmpvar_29 = _LightShadowData.xxxx;
  highp float tmpvar_30;
  if (tmpvar_28.x) {
    tmpvar_30 = tmpvar_29.x;
  } else {
    tmpvar_30 = 1.0;
  };
  highp float tmpvar_31;
  if (tmpvar_28.y) {
    tmpvar_31 = tmpvar_29.y;
  } else {
    tmpvar_31 = 1.0;
  };
  highp float tmpvar_32;
  if (tmpvar_28.z) {
    tmpvar_32 = tmpvar_29.z;
  } else {
    tmpvar_32 = 1.0;
  };
  highp float tmpvar_33;
  if (tmpvar_28.w) {
    tmpvar_33 = tmpvar_29.w;
  } else {
    tmpvar_33 = 1.0;
  };
  highp vec4 tmpvar_34;
  tmpvar_34.x = tmpvar_30;
  tmpvar_34.y = tmpvar_31;
  tmpvar_34.z = tmpvar_32;
  tmpvar_34.w = tmpvar_33;
  shadows_17 = tmpvar_34;
  mediump float tmpvar_35;
  tmpvar_35 = dot (shadows_17, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_16 = tmpvar_35;
  highp vec3 tmpvar_36;
  tmpvar_36 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_12.w) * tmpvar_15.w) * tmpvar_16) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_37;
  tmpvar_37[0].x = -0.999999;
  tmpvar_37[0].y = 0.00159255;
  tmpvar_37[1].x = -0.00159255;
  tmpvar_37[1].y = -0.999999;
  lowp vec4 tmpvar_38;
  highp vec2 P_39;
  P_39 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_38 = texture2D (_Mask, P_39);
  node_1540_2 = tmpvar_38;
  highp vec2 P_40;
  P_40 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_37) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_41;
  arg0_41 = (1.0 - texture2D (_Glittermap, P_40).xyz);
  highp vec3 tmpvar_42;
  tmpvar_42 = (max (arg0_41, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_43;
  highp vec2 P_44;
  P_44 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_43 = texture2D (_Glittermap, P_44);
  lowp vec4 tmpvar_45;
  highp vec2 P_46;
  P_46 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_45 = texture2D (_Specularglitter, P_46);
  lowp vec4 tmpvar_47;
  highp vec2 P_48;
  P_48 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_47 = texture2D (_MainTex, P_48);
  highp vec4 tmpvar_49;
  tmpvar_49.w = 0.0;
  tmpvar_49.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_36) * ((tmpvar_47.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_42))) + ((tmpvar_36 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_43.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_42) + mix (pow ((tmpvar_45.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_49;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _ShadowOffsets[4];
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_8;
  normal_8.xy = ((texture2D (_Normalmap, P_7).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (dot (normal_8.xy, normal_8.xy), 0.0, 1.0)));
  normalLocal_3 = normal_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  lowp vec4 tmpvar_12;
  highp vec2 P_13;
  P_13 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_12 = texture2D (_LightTexture0, P_13);
  highp float tmpvar_14;
  tmpvar_14 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_LightTextureB0, vec2(tmpvar_14));
  lowp float tmpvar_16;
  mediump vec4 shadows_17;
  highp vec4 shadowVals_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD6.xyz / xlv_TEXCOORD6.w);
  highp vec2 P_20;
  P_20 = (tmpvar_19.xy + _ShadowOffsets[0].xy);
  lowp float tmpvar_21;
  tmpvar_21 = texture2D (_ShadowMapTexture, P_20).x;
  shadowVals_18.x = tmpvar_21;
  highp vec2 P_22;
  P_22 = (tmpvar_19.xy + _ShadowOffsets[1].xy);
  lowp float tmpvar_23;
  tmpvar_23 = texture2D (_ShadowMapTexture, P_22).x;
  shadowVals_18.y = tmpvar_23;
  highp vec2 P_24;
  P_24 = (tmpvar_19.xy + _ShadowOffsets[2].xy);
  lowp float tmpvar_25;
  tmpvar_25 = texture2D (_ShadowMapTexture, P_24).x;
  shadowVals_18.z = tmpvar_25;
  highp vec2 P_26;
  P_26 = (tmpvar_19.xy + _ShadowOffsets[3].xy);
  lowp float tmpvar_27;
  tmpvar_27 = texture2D (_ShadowMapTexture, P_26).x;
  shadowVals_18.w = tmpvar_27;
  bvec4 tmpvar_28;
  tmpvar_28 = lessThan (shadowVals_18, tmpvar_19.zzzz);
  highp vec4 tmpvar_29;
  tmpvar_29 = _LightShadowData.xxxx;
  highp float tmpvar_30;
  if (tmpvar_28.x) {
    tmpvar_30 = tmpvar_29.x;
  } else {
    tmpvar_30 = 1.0;
  };
  highp float tmpvar_31;
  if (tmpvar_28.y) {
    tmpvar_31 = tmpvar_29.y;
  } else {
    tmpvar_31 = 1.0;
  };
  highp float tmpvar_32;
  if (tmpvar_28.z) {
    tmpvar_32 = tmpvar_29.z;
  } else {
    tmpvar_32 = 1.0;
  };
  highp float tmpvar_33;
  if (tmpvar_28.w) {
    tmpvar_33 = tmpvar_29.w;
  } else {
    tmpvar_33 = 1.0;
  };
  highp vec4 tmpvar_34;
  tmpvar_34.x = tmpvar_30;
  tmpvar_34.y = tmpvar_31;
  tmpvar_34.z = tmpvar_32;
  tmpvar_34.w = tmpvar_33;
  shadows_17 = tmpvar_34;
  mediump float tmpvar_35;
  tmpvar_35 = dot (shadows_17, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_16 = tmpvar_35;
  highp vec3 tmpvar_36;
  tmpvar_36 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_12.w) * tmpvar_15.w) * tmpvar_16) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_37;
  tmpvar_37[0].x = -0.999999;
  tmpvar_37[0].y = 0.00159255;
  tmpvar_37[1].x = -0.00159255;
  tmpvar_37[1].y = -0.999999;
  lowp vec4 tmpvar_38;
  highp vec2 P_39;
  P_39 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_38 = texture2D (_Mask, P_39);
  node_1540_2 = tmpvar_38;
  highp vec2 P_40;
  P_40 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_37) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_41;
  arg0_41 = (1.0 - texture2D (_Glittermap, P_40).xyz);
  highp vec3 tmpvar_42;
  tmpvar_42 = (max (arg0_41, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_43;
  highp vec2 P_44;
  P_44 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_43 = texture2D (_Glittermap, P_44);
  lowp vec4 tmpvar_45;
  highp vec2 P_46;
  P_46 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_45 = texture2D (_Specularglitter, P_46);
  lowp vec4 tmpvar_47;
  highp vec2 P_48;
  P_48 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_47 = texture2D (_MainTex, P_48);
  highp vec4 tmpvar_49;
  tmpvar_49.w = 0.0;
  tmpvar_49.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_36) * ((tmpvar_47.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_42))) + ((tmpvar_36 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_43.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_42) + mix (pow ((tmpvar_45.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_49;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
out highp vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform highp vec4 _ShadowOffsets[4];
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
in highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  lowp vec4 tmpvar_12;
  highp vec2 P_13;
  P_13 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_12 = texture (_LightTexture0, P_13);
  highp float tmpvar_14;
  tmpvar_14 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture (_LightTextureB0, vec2(tmpvar_14));
  lowp float tmpvar_16;
  mediump vec4 shadows_17;
  highp vec4 shadowVals_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD6.xyz / xlv_TEXCOORD6.w);
  highp vec2 P_20;
  P_20 = (tmpvar_19.xy + _ShadowOffsets[0].xy);
  lowp float tmpvar_21;
  tmpvar_21 = texture (_ShadowMapTexture, P_20).x;
  shadowVals_18.x = tmpvar_21;
  highp vec2 P_22;
  P_22 = (tmpvar_19.xy + _ShadowOffsets[1].xy);
  lowp float tmpvar_23;
  tmpvar_23 = texture (_ShadowMapTexture, P_22).x;
  shadowVals_18.y = tmpvar_23;
  highp vec2 P_24;
  P_24 = (tmpvar_19.xy + _ShadowOffsets[2].xy);
  lowp float tmpvar_25;
  tmpvar_25 = texture (_ShadowMapTexture, P_24).x;
  shadowVals_18.z = tmpvar_25;
  highp vec2 P_26;
  P_26 = (tmpvar_19.xy + _ShadowOffsets[3].xy);
  lowp float tmpvar_27;
  tmpvar_27 = texture (_ShadowMapTexture, P_26).x;
  shadowVals_18.w = tmpvar_27;
  bvec4 tmpvar_28;
  tmpvar_28 = lessThan (shadowVals_18, tmpvar_19.zzzz);
  highp vec4 tmpvar_29;
  tmpvar_29 = _LightShadowData.xxxx;
  highp float tmpvar_30;
  if (tmpvar_28.x) {
    tmpvar_30 = tmpvar_29.x;
  } else {
    tmpvar_30 = 1.0;
  };
  highp float tmpvar_31;
  if (tmpvar_28.y) {
    tmpvar_31 = tmpvar_29.y;
  } else {
    tmpvar_31 = 1.0;
  };
  highp float tmpvar_32;
  if (tmpvar_28.z) {
    tmpvar_32 = tmpvar_29.z;
  } else {
    tmpvar_32 = 1.0;
  };
  highp float tmpvar_33;
  if (tmpvar_28.w) {
    tmpvar_33 = tmpvar_29.w;
  } else {
    tmpvar_33 = 1.0;
  };
  highp vec4 tmpvar_34;
  tmpvar_34.x = tmpvar_30;
  tmpvar_34.y = tmpvar_31;
  tmpvar_34.z = tmpvar_32;
  tmpvar_34.w = tmpvar_33;
  shadows_17 = tmpvar_34;
  mediump float tmpvar_35;
  tmpvar_35 = dot (shadows_17, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_16 = tmpvar_35;
  highp vec3 tmpvar_36;
  tmpvar_36 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_12.w) * tmpvar_15.w) * tmpvar_16) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_37;
  tmpvar_37[0].x = -0.999999;
  tmpvar_37[0].y = 0.00159255;
  tmpvar_37[1].x = -0.00159255;
  tmpvar_37[1].y = -0.999999;
  lowp vec4 tmpvar_38;
  highp vec2 P_39;
  P_39 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_38 = texture (_Mask, P_39);
  node_1540_2 = tmpvar_38;
  highp vec2 P_40;
  P_40 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_37) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_41;
  arg0_41 = (1.0 - texture (_Glittermap, P_40).xyz);
  highp vec3 tmpvar_42;
  tmpvar_42 = (max (arg0_41, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_43;
  highp vec2 P_44;
  P_44 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_43 = texture (_Glittermap, P_44);
  lowp vec4 tmpvar_45;
  highp vec2 P_46;
  P_46 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_45 = texture (_Specularglitter, P_46);
  lowp vec4 tmpvar_47;
  highp vec2 P_48;
  P_48 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_47 = texture (_MainTex, P_48);
  highp vec4 tmpvar_49;
  tmpvar_49.w = 0.0;
  tmpvar_49.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_36) * ((tmpvar_47.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_42))) + ((tmpvar_36 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_43.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_42) + mix (pow ((tmpvar_45.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_49;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 38 math
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [unity_World2Shadow0]
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
"3.0-!!ARBvp1.0
PARAM c[21] = { { 0 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.xyz, vertex.attrib[14];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.y, R1, c[10];
DP4 R0.x, R1, c[9];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, vertex.normal.y, c[14];
MAD R1.xyz, vertex.normal.x, c[13], R1;
MAD R1.xyz, vertex.normal.z, c[15], R1;
ADD R1.xyz, R1, c[0].x;
MUL R2.xyz, R1.zxyw, R0.yzxw;
MAD R2.xyz, R1.yzxw, R0.zxyw, -R2;
MOV result.texcoord[3].xyz, R0;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R2;
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
MOV result.texcoord[1], R0;
DP4 result.texcoord[5].w, R0, c[20];
DP4 result.texcoord[5].z, R0, c[19];
DP4 result.texcoord[5].y, R0, c[18];
DP4 result.texcoord[5].x, R0, c[17];
DP4 result.texcoord[6].w, R0, c[8];
DP4 result.texcoord[6].z, R0, c[7];
DP4 result.texcoord[6].y, R0, c[6];
DP4 result.texcoord[6].x, R0, c[5];
MOV result.texcoord[2].xyz, R1;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 38 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 38 math
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [unity_World2Shadow0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c20, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r1.xyz, v2
mov r1.w, c20.x
dp4 r0.z, r1, c10
dp4 r0.y, r1, c9
dp4 r0.x, r1, c8
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mul r1.xyz, v1.y, c13
mad r1.xyz, v1.x, c12, r1
mad r1.xyz, v1.z, c14, r1
add r1.xyz, r1, c20.x
mul r2.xyz, r1.zxyw, r0.yzxw
mad r2.xyz, r1.yzxw, r0.zxyw, -r2
mov o4.xyz, r0
mul r2.xyz, v2.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul o5.xyz, r0.w, r2
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
mov o2, r0
dp4 o6.w, r0, c19
dp4 o6.z, r0, c18
dp4 o6.y, r0, c17
dp4 o6.x, r0, c16
dp4 o7.w, r0, c7
dp4 o7.z, r0, c6
dp4 o7.y, r0, c5
dp4 o7.x, r0, c4
mov o3.xyz, r1
mov o1.xy, v3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 31 math
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 352
Matrix 80 [_LightMatrix0]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityShadows" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedkhfcpdmoakoelmjfgeikpakdjdallphdabaaaaaaaaahaaaaadaaaaaa
cmaaaaaamaaaaaaakiabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
neaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaneaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
neaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaaneaaaaaaagaaaaaa
aaaaaaaaadaaaaaaahaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklfdeieefcfaafaaaaeaaaabaafeabaaaafjaaaaaeegiocaaa
aaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaamaaaaaafjaaaaaeegiocaaa
acaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaa
fpaaaaadpcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadpccabaaaagaaaaaagfaaaaadpccabaaaahaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaaaaaaaaaabaaaaaai
bcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabaaaaaaabaaaaaai
ccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabbaaaaaabaaaaaai
ecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabcaaaaaadgaaaaaf
hccabaaaadaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaa
acaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaaacaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaajgaebaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaajgaebaaaabaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaa
adaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaacaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhccabaaaafaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaaaaaaaaaagaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
afaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaahaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pccabaaaagaaaaaaegiocaaaaaaaaaaaaiaaaaaapgapbaaaaaaaaaaaegaobaaa
abaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaabaaaaaa
ajaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaaaiaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaabaaaaaa
akaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaahaaaaaa
egiocaaaabaaaaaaalaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab
"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp vec4 _ShadowOffsets[4];
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_11 = texture2D (_LightTexture0, P_12);
  highp float tmpvar_13;
  tmpvar_13 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_LightTextureB0, vec2(tmpvar_13));
  lowp float tmpvar_15;
  mediump vec4 shadows_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD6.xyz / xlv_TEXCOORD6.w);
  highp vec3 coord_18;
  coord_18 = (tmpvar_17 + _ShadowOffsets[0].xyz);
  lowp float tmpvar_19;
  tmpvar_19 = shadow2DEXT (_ShadowMapTexture, coord_18);
  shadows_16.x = tmpvar_19;
  highp vec3 coord_20;
  coord_20 = (tmpvar_17 + _ShadowOffsets[1].xyz);
  lowp float tmpvar_21;
  tmpvar_21 = shadow2DEXT (_ShadowMapTexture, coord_20);
  shadows_16.y = tmpvar_21;
  highp vec3 coord_22;
  coord_22 = (tmpvar_17 + _ShadowOffsets[2].xyz);
  lowp float tmpvar_23;
  tmpvar_23 = shadow2DEXT (_ShadowMapTexture, coord_22);
  shadows_16.z = tmpvar_23;
  highp vec3 coord_24;
  coord_24 = (tmpvar_17 + _ShadowOffsets[3].xyz);
  lowp float tmpvar_25;
  tmpvar_25 = shadow2DEXT (_ShadowMapTexture, coord_24);
  shadows_16.w = tmpvar_25;
  highp vec4 tmpvar_26;
  tmpvar_26 = (_LightShadowData.xxxx + (shadows_16 * (1.0 - _LightShadowData.xxxx)));
  shadows_16 = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = dot (shadows_16, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_15 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_11.w) * tmpvar_14.w) * tmpvar_15) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_29;
  tmpvar_29[0].x = -0.999999;
  tmpvar_29[0].y = 0.00159255;
  tmpvar_29[1].x = -0.00159255;
  tmpvar_29[1].y = -0.999999;
  lowp vec4 tmpvar_30;
  highp vec2 P_31;
  P_31 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_30 = texture2D (_Mask, P_31);
  node_1540_2 = tmpvar_30;
  highp vec2 P_32;
  P_32 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_29) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_33;
  arg0_33 = (1.0 - texture2D (_Glittermap, P_32).xyz);
  highp vec3 tmpvar_34;
  tmpvar_34 = (max (arg0_33, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_35;
  highp vec2 P_36;
  P_36 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_35 = texture2D (_Glittermap, P_36);
  lowp vec4 tmpvar_37;
  highp vec2 P_38;
  P_38 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_37 = texture2D (_Specularglitter, P_38);
  lowp vec4 tmpvar_39;
  highp vec2 P_40;
  P_40 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_39 = texture2D (_MainTex, P_40);
  highp vec4 tmpvar_41;
  tmpvar_41.w = 0.0;
  tmpvar_41.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_28) * ((tmpvar_39.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_34))) + ((tmpvar_28 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_35.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_34) + mix (pow ((tmpvar_37.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_41;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec4 xlv_TEXCOORD5;
out highp vec4 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
  xlv_TEXCOORD6 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightShadowData;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp vec4 _ShadowOffsets[4];
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec4 xlv_TEXCOORD5;
in highp vec4 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_11 = texture (_LightTexture0, P_12);
  highp float tmpvar_13;
  tmpvar_13 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture (_LightTextureB0, vec2(tmpvar_13));
  lowp float tmpvar_15;
  mediump vec4 shadows_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD6.xyz / xlv_TEXCOORD6.w);
  highp vec3 coord_18;
  coord_18 = (tmpvar_17 + _ShadowOffsets[0].xyz);
  mediump float tmpvar_19;
  tmpvar_19 = texture (_ShadowMapTexture, coord_18);
  shadows_16.x = tmpvar_19;
  highp vec3 coord_20;
  coord_20 = (tmpvar_17 + _ShadowOffsets[1].xyz);
  mediump float tmpvar_21;
  tmpvar_21 = texture (_ShadowMapTexture, coord_20);
  shadows_16.y = tmpvar_21;
  highp vec3 coord_22;
  coord_22 = (tmpvar_17 + _ShadowOffsets[2].xyz);
  mediump float tmpvar_23;
  tmpvar_23 = texture (_ShadowMapTexture, coord_22);
  shadows_16.z = tmpvar_23;
  highp vec3 coord_24;
  coord_24 = (tmpvar_17 + _ShadowOffsets[3].xyz);
  mediump float tmpvar_25;
  tmpvar_25 = texture (_ShadowMapTexture, coord_24);
  shadows_16.w = tmpvar_25;
  highp vec4 tmpvar_26;
  tmpvar_26 = (_LightShadowData.xxxx + (shadows_16 * (1.0 - _LightShadowData.xxxx)));
  shadows_16 = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = dot (shadows_16, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_15 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_11.w) * tmpvar_14.w) * tmpvar_15) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_29;
  tmpvar_29[0].x = -0.999999;
  tmpvar_29[0].y = 0.00159255;
  tmpvar_29[1].x = -0.00159255;
  tmpvar_29[1].y = -0.999999;
  lowp vec4 tmpvar_30;
  highp vec2 P_31;
  P_31 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_30 = texture (_Mask, P_31);
  node_1540_2 = tmpvar_30;
  highp vec2 P_32;
  P_32 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_29) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_33;
  arg0_33 = (1.0 - texture (_Glittermap, P_32).xyz);
  highp vec3 tmpvar_34;
  tmpvar_34 = (max (arg0_33, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_35;
  highp vec2 P_36;
  P_36 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_35 = texture (_Glittermap, P_36);
  lowp vec4 tmpvar_37;
  highp vec2 P_38;
  P_38 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_37 = texture (_Specularglitter, P_38);
  lowp vec4 tmpvar_39;
  highp vec2 P_40;
  P_40 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_39 = texture (_MainTex, P_40);
  highp vec4 tmpvar_41;
  tmpvar_41.w = 0.0;
  tmpvar_41.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_28) * ((tmpvar_39.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_34))) + ((tmpvar_28 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_35.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_34) + mix (pow ((tmpvar_37.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_41;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 34 math
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_LightPositionRange]
"3.0-!!ARBvp1.0
PARAM c[18] = { { 0 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.xyz, vertex.attrib[14];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[7];
DP4 R0.y, R1, c[6];
DP4 R0.x, R1, c[5];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, vertex.normal.y, c[10];
MAD R1.xyz, vertex.normal.x, c[9], R1;
MAD R1.xyz, vertex.normal.z, c[11], R1;
ADD R1.xyz, R1, c[0].x;
MUL R2.xyz, R1.zxyw, R0.yzxw;
MAD R2.xyz, R1.yzxw, R0.zxyw, -R2;
MOV result.texcoord[3].xyz, R0;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R2;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
MOV result.texcoord[1], R0;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
MOV result.texcoord[2].xyz, R1;
ADD result.texcoord[6].xyz, R0, -c[17];
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 34 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 34 math
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_LightPositionRange]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c17, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r1.xyz, v2
mov r1.w, c17.x
dp4 r0.z, r1, c6
dp4 r0.y, r1, c5
dp4 r0.x, r1, c4
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mul r1.xyz, v1.y, c9
mad r1.xyz, v1.x, c8, r1
mad r1.xyz, v1.z, c10, r1
add r1.xyz, r1, c17.x
mul r2.xyz, r1.zxyw, r0.yzxw
mad r2.xyz, r1.yzxw, r0.zxyw, -r2
mov o4.xyz, r0
mul r2.xyz, v2.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul o5.xyz, r0.w, r2
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov o2, r0
dp4 o6.z, r0, c14
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
mov o3.xyz, r1
add o7.xyz, r0, -c16
mov o1.xy, v3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 28 math
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 288
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedilmignahpapgpmgdabomnngaommhchmnabaaaaaaimagaaaaadaaaaaa
cmaaaaaamaaaaaaakiabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
neaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaneaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
neaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaahaiaaaaneaaaaaaagaaaaaa
aaaaaaaaadaaaaaaahaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklfdeieefcnmaeaaaaeaaaabaadhabaaaafjaaaaaeegiocaaa
aaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaacaaaaaafjaaaaaeegiocaaa
acaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaa
fpaaaaadpcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadhccabaaaagaaaaaagfaaaaadhccabaaaahaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaaaaaaaaaabaaaaaai
bcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabaaaaaaabaaaaaai
ccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabbaaaaaabaaaaaai
ecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabcaaaaaadgaaaaaf
hccabaaaadaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaa
acaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaaacaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaajgaebaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaajgaebaaaabaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaa
adaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaacaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhccabaaaafaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaa
abaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaadaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hccabaaaagaaaaaaegiccaaaaaaaaaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaaaaaaaaajhccabaaaahaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaa
abaaaaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
  xlv_TEXCOORD6 = ((_Object2World * _glesVertex).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightPositionRange;
uniform highp vec4 _LightShadowData;
uniform lowp samplerCube _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTexture0, vec2(tmpvar_12));
  highp float tmpvar_14;
  mediump vec4 shadows_15;
  highp vec4 shadowVals_16;
  highp float tmpvar_17;
  tmpvar_17 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec3 vec_18;
  vec_18 = (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125));
  highp vec4 packDist_19;
  lowp vec4 tmpvar_20;
  tmpvar_20 = textureCube (_ShadowMapTexture, vec_18);
  packDist_19 = tmpvar_20;
  shadowVals_16.x = dot (packDist_19, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_21;
  vec_21 = (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125));
  highp vec4 packDist_22;
  lowp vec4 tmpvar_23;
  tmpvar_23 = textureCube (_ShadowMapTexture, vec_21);
  packDist_22 = tmpvar_23;
  shadowVals_16.y = dot (packDist_22, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_24;
  vec_24 = (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125));
  highp vec4 packDist_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = textureCube (_ShadowMapTexture, vec_24);
  packDist_25 = tmpvar_26;
  shadowVals_16.z = dot (packDist_25, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_27;
  vec_27 = (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125));
  highp vec4 packDist_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = textureCube (_ShadowMapTexture, vec_27);
  packDist_28 = tmpvar_29;
  shadowVals_16.w = dot (packDist_28, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  bvec4 tmpvar_30;
  tmpvar_30 = lessThan (shadowVals_16, vec4(tmpvar_17));
  highp vec4 tmpvar_31;
  tmpvar_31 = _LightShadowData.xxxx;
  highp float tmpvar_32;
  if (tmpvar_30.x) {
    tmpvar_32 = tmpvar_31.x;
  } else {
    tmpvar_32 = 1.0;
  };
  highp float tmpvar_33;
  if (tmpvar_30.y) {
    tmpvar_33 = tmpvar_31.y;
  } else {
    tmpvar_33 = 1.0;
  };
  highp float tmpvar_34;
  if (tmpvar_30.z) {
    tmpvar_34 = tmpvar_31.z;
  } else {
    tmpvar_34 = 1.0;
  };
  highp float tmpvar_35;
  if (tmpvar_30.w) {
    tmpvar_35 = tmpvar_31.w;
  } else {
    tmpvar_35 = 1.0;
  };
  highp vec4 tmpvar_36;
  tmpvar_36.x = tmpvar_32;
  tmpvar_36.y = tmpvar_33;
  tmpvar_36.z = tmpvar_34;
  tmpvar_36.w = tmpvar_35;
  shadows_15 = tmpvar_36;
  mediump float tmpvar_37;
  tmpvar_37 = dot (shadows_15, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_14 = tmpvar_37;
  highp vec3 tmpvar_38;
  tmpvar_38 = (((tmpvar_13.w * tmpvar_14) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_39;
  tmpvar_39[0].x = -0.999999;
  tmpvar_39[0].y = 0.00159255;
  tmpvar_39[1].x = -0.00159255;
  tmpvar_39[1].y = -0.999999;
  lowp vec4 tmpvar_40;
  highp vec2 P_41;
  P_41 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_40 = texture2D (_Mask, P_41);
  node_1540_2 = tmpvar_40;
  highp vec2 P_42;
  P_42 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_39) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_43;
  arg0_43 = (1.0 - texture2D (_Glittermap, P_42).xyz);
  highp vec3 tmpvar_44;
  tmpvar_44 = (max (arg0_43, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_45;
  highp vec2 P_46;
  P_46 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_45 = texture2D (_Glittermap, P_46);
  lowp vec4 tmpvar_47;
  highp vec2 P_48;
  P_48 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_47 = texture2D (_Specularglitter, P_48);
  lowp vec4 tmpvar_49;
  highp vec2 P_50;
  P_50 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_49 = texture2D (_MainTex, P_50);
  highp vec4 tmpvar_51;
  tmpvar_51.w = 0.0;
  tmpvar_51.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_38) * ((tmpvar_49.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_44))) + ((tmpvar_38 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_45.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_44) + mix (pow ((tmpvar_47.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_51;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
  xlv_TEXCOORD6 = ((_Object2World * _glesVertex).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightPositionRange;
uniform highp vec4 _LightShadowData;
uniform lowp samplerCube _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_8;
  normal_8.xy = ((texture2D (_Normalmap, P_7).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (dot (normal_8.xy, normal_8.xy), 0.0, 1.0)));
  normalLocal_3 = normal_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTexture0, vec2(tmpvar_12));
  highp float tmpvar_14;
  mediump vec4 shadows_15;
  highp vec4 shadowVals_16;
  highp float tmpvar_17;
  tmpvar_17 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec3 vec_18;
  vec_18 = (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125));
  highp vec4 packDist_19;
  lowp vec4 tmpvar_20;
  tmpvar_20 = textureCube (_ShadowMapTexture, vec_18);
  packDist_19 = tmpvar_20;
  shadowVals_16.x = dot (packDist_19, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_21;
  vec_21 = (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125));
  highp vec4 packDist_22;
  lowp vec4 tmpvar_23;
  tmpvar_23 = textureCube (_ShadowMapTexture, vec_21);
  packDist_22 = tmpvar_23;
  shadowVals_16.y = dot (packDist_22, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_24;
  vec_24 = (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125));
  highp vec4 packDist_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = textureCube (_ShadowMapTexture, vec_24);
  packDist_25 = tmpvar_26;
  shadowVals_16.z = dot (packDist_25, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_27;
  vec_27 = (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125));
  highp vec4 packDist_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = textureCube (_ShadowMapTexture, vec_27);
  packDist_28 = tmpvar_29;
  shadowVals_16.w = dot (packDist_28, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  bvec4 tmpvar_30;
  tmpvar_30 = lessThan (shadowVals_16, vec4(tmpvar_17));
  highp vec4 tmpvar_31;
  tmpvar_31 = _LightShadowData.xxxx;
  highp float tmpvar_32;
  if (tmpvar_30.x) {
    tmpvar_32 = tmpvar_31.x;
  } else {
    tmpvar_32 = 1.0;
  };
  highp float tmpvar_33;
  if (tmpvar_30.y) {
    tmpvar_33 = tmpvar_31.y;
  } else {
    tmpvar_33 = 1.0;
  };
  highp float tmpvar_34;
  if (tmpvar_30.z) {
    tmpvar_34 = tmpvar_31.z;
  } else {
    tmpvar_34 = 1.0;
  };
  highp float tmpvar_35;
  if (tmpvar_30.w) {
    tmpvar_35 = tmpvar_31.w;
  } else {
    tmpvar_35 = 1.0;
  };
  highp vec4 tmpvar_36;
  tmpvar_36.x = tmpvar_32;
  tmpvar_36.y = tmpvar_33;
  tmpvar_36.z = tmpvar_34;
  tmpvar_36.w = tmpvar_35;
  shadows_15 = tmpvar_36;
  mediump float tmpvar_37;
  tmpvar_37 = dot (shadows_15, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_14 = tmpvar_37;
  highp vec3 tmpvar_38;
  tmpvar_38 = (((tmpvar_13.w * tmpvar_14) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_39;
  tmpvar_39[0].x = -0.999999;
  tmpvar_39[0].y = 0.00159255;
  tmpvar_39[1].x = -0.00159255;
  tmpvar_39[1].y = -0.999999;
  lowp vec4 tmpvar_40;
  highp vec2 P_41;
  P_41 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_40 = texture2D (_Mask, P_41);
  node_1540_2 = tmpvar_40;
  highp vec2 P_42;
  P_42 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_39) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_43;
  arg0_43 = (1.0 - texture2D (_Glittermap, P_42).xyz);
  highp vec3 tmpvar_44;
  tmpvar_44 = (max (arg0_43, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_45;
  highp vec2 P_46;
  P_46 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_45 = texture2D (_Glittermap, P_46);
  lowp vec4 tmpvar_47;
  highp vec2 P_48;
  P_48 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_47 = texture2D (_Specularglitter, P_48);
  lowp vec4 tmpvar_49;
  highp vec2 P_50;
  P_50 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_49 = texture2D (_MainTex, P_50);
  highp vec4 tmpvar_51;
  tmpvar_51.w = 0.0;
  tmpvar_51.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_38) * ((tmpvar_49.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_44))) + ((tmpvar_38 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_45.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_44) + mix (pow ((tmpvar_47.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_51;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec3 xlv_TEXCOORD5;
out highp vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
  xlv_TEXCOORD6 = ((_Object2World * _glesVertex).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightPositionRange;
uniform highp vec4 _LightShadowData;
uniform lowp samplerCube _ShadowMapTexture;
uniform sampler2D _LightTexture0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec3 xlv_TEXCOORD5;
in highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_LightTexture0, vec2(tmpvar_12));
  highp float tmpvar_14;
  mediump vec4 shadows_15;
  highp vec4 shadowVals_16;
  highp float tmpvar_17;
  tmpvar_17 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec3 vec_18;
  vec_18 = (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125));
  highp vec4 packDist_19;
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture (_ShadowMapTexture, vec_18);
  packDist_19 = tmpvar_20;
  shadowVals_16.x = dot (packDist_19, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_21;
  vec_21 = (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125));
  highp vec4 packDist_22;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture (_ShadowMapTexture, vec_21);
  packDist_22 = tmpvar_23;
  shadowVals_16.y = dot (packDist_22, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_24;
  vec_24 = (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125));
  highp vec4 packDist_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture (_ShadowMapTexture, vec_24);
  packDist_25 = tmpvar_26;
  shadowVals_16.z = dot (packDist_25, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_27;
  vec_27 = (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125));
  highp vec4 packDist_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture (_ShadowMapTexture, vec_27);
  packDist_28 = tmpvar_29;
  shadowVals_16.w = dot (packDist_28, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  bvec4 tmpvar_30;
  tmpvar_30 = lessThan (shadowVals_16, vec4(tmpvar_17));
  highp vec4 tmpvar_31;
  tmpvar_31 = _LightShadowData.xxxx;
  highp float tmpvar_32;
  if (tmpvar_30.x) {
    tmpvar_32 = tmpvar_31.x;
  } else {
    tmpvar_32 = 1.0;
  };
  highp float tmpvar_33;
  if (tmpvar_30.y) {
    tmpvar_33 = tmpvar_31.y;
  } else {
    tmpvar_33 = 1.0;
  };
  highp float tmpvar_34;
  if (tmpvar_30.z) {
    tmpvar_34 = tmpvar_31.z;
  } else {
    tmpvar_34 = 1.0;
  };
  highp float tmpvar_35;
  if (tmpvar_30.w) {
    tmpvar_35 = tmpvar_31.w;
  } else {
    tmpvar_35 = 1.0;
  };
  highp vec4 tmpvar_36;
  tmpvar_36.x = tmpvar_32;
  tmpvar_36.y = tmpvar_33;
  tmpvar_36.z = tmpvar_34;
  tmpvar_36.w = tmpvar_35;
  shadows_15 = tmpvar_36;
  mediump float tmpvar_37;
  tmpvar_37 = dot (shadows_15, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_14 = tmpvar_37;
  highp vec3 tmpvar_38;
  tmpvar_38 = (((tmpvar_13.w * tmpvar_14) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_39;
  tmpvar_39[0].x = -0.999999;
  tmpvar_39[0].y = 0.00159255;
  tmpvar_39[1].x = -0.00159255;
  tmpvar_39[1].y = -0.999999;
  lowp vec4 tmpvar_40;
  highp vec2 P_41;
  P_41 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_40 = texture (_Mask, P_41);
  node_1540_2 = tmpvar_40;
  highp vec2 P_42;
  P_42 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_39) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_43;
  arg0_43 = (1.0 - texture (_Glittermap, P_42).xyz);
  highp vec3 tmpvar_44;
  tmpvar_44 = (max (arg0_43, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_45;
  highp vec2 P_46;
  P_46 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_45 = texture (_Glittermap, P_46);
  lowp vec4 tmpvar_47;
  highp vec2 P_48;
  P_48 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_47 = texture (_Specularglitter, P_48);
  lowp vec4 tmpvar_49;
  highp vec2 P_50;
  P_50 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_49 = texture (_MainTex, P_50);
  highp vec4 tmpvar_51;
  tmpvar_51.w = 0.0;
  tmpvar_51.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_38) * ((tmpvar_49.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_44))) + ((tmpvar_38 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_45.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_44) + mix (pow ((tmpvar_47.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_51;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 34 math
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_LightPositionRange]
"3.0-!!ARBvp1.0
PARAM c[18] = { { 0 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.xyz, vertex.attrib[14];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[7];
DP4 R0.y, R1, c[6];
DP4 R0.x, R1, c[5];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, vertex.normal.y, c[10];
MAD R1.xyz, vertex.normal.x, c[9], R1;
MAD R1.xyz, vertex.normal.z, c[11], R1;
ADD R1.xyz, R1, c[0].x;
MUL R2.xyz, R1.zxyw, R0.yzxw;
MAD R2.xyz, R1.yzxw, R0.zxyw, -R2;
MOV result.texcoord[3].xyz, R0;
MUL R2.xyz, vertex.attrib[14].w, R2;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL result.texcoord[4].xyz, R0.w, R2;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
MOV result.texcoord[1], R0;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
MOV result.texcoord[2].xyz, R1;
ADD result.texcoord[6].xyz, R0, -c[17];
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 34 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 34 math
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_LightPositionRange]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c17, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_tangent0 v2
dcl_texcoord0 v3
mov r1.xyz, v2
mov r1.w, c17.x
dp4 r0.z, r1, c6
dp4 r0.y, r1, c5
dp4 r0.x, r1, c4
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mul r1.xyz, v1.y, c9
mad r1.xyz, v1.x, c8, r1
mad r1.xyz, v1.z, c10, r1
add r1.xyz, r1, c17.x
mul r2.xyz, r1.zxyw, r0.yzxw
mad r2.xyz, r1.yzxw, r0.zxyw, -r2
mov o4.xyz, r0
mul r2.xyz, v2.w, r2
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul o5.xyz, r0.w, r2
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov o2, r0
dp4 o6.z, r0, c14
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
mov o3.xyz, r1
add o7.xyz, r0, -c16
mov o1.xy, v3
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 28 math
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 288
Matrix 16 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedilmignahpapgpmgdabomnngaommhchmnabaaaaaaimagaaaaadaaaaaa
cmaaaaaamaaaaaaakiabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaahiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaafaepfdej
feejepeoaaeoepfcenebemaafeebeoehefeofeaafeeffiedepepfceeaaklklkl
epfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
neaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaneaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
neaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaahaiaaaaneaaaaaaagaaaaaa
aaaaaaaaadaaaaaaahaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklfdeieefcnmaeaaaaeaaaabaadhabaaaafjaaaaaeegiocaaa
aaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaacaaaaaafjaaaaaeegiocaaa
acaaaaaabdaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaa
fpaaaaadpcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadhccabaaaagaaaaaagfaaaaadhccabaaaahaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaaaaaaaaaabaaaaaai
bcaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabaaaaaaabaaaaaai
ccaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabbaaaaaabaaaaaai
ecaabaaaabaaaaaaegbcbaaaabaaaaaaegiccaaaacaaaaaabcaaaaaadgaaaaaf
hccabaaaadaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaa
acaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaaacaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaacgajbaaaabaaaaaajgaebaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaajgaebaaaabaaaaaacgajbaaaacaaaaaaegacbaiaebaaaaaa
adaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaacaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhccabaaaafaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaa
abaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaadaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hccabaaaagaaaaaaegiccaaaaaaaaaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaaaaaaaaajhccabaaaahaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaa
abaaaaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
  xlv_TEXCOORD6 = ((_Object2World * _glesVertex).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightPositionRange;
uniform highp vec4 _LightShadowData;
uniform lowp samplerCube _ShadowMapTexture;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTextureB0, vec2(tmpvar_12));
  lowp vec4 tmpvar_14;
  tmpvar_14 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  highp float tmpvar_15;
  mediump vec4 shadows_16;
  highp vec4 shadowVals_17;
  highp float tmpvar_18;
  tmpvar_18 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec3 vec_19;
  vec_19 = (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125));
  highp vec4 packDist_20;
  lowp vec4 tmpvar_21;
  tmpvar_21 = textureCube (_ShadowMapTexture, vec_19);
  packDist_20 = tmpvar_21;
  shadowVals_17.x = dot (packDist_20, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_22;
  vec_22 = (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125));
  highp vec4 packDist_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureCube (_ShadowMapTexture, vec_22);
  packDist_23 = tmpvar_24;
  shadowVals_17.y = dot (packDist_23, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_25;
  vec_25 = (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125));
  highp vec4 packDist_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = textureCube (_ShadowMapTexture, vec_25);
  packDist_26 = tmpvar_27;
  shadowVals_17.z = dot (packDist_26, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_28;
  vec_28 = (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125));
  highp vec4 packDist_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = textureCube (_ShadowMapTexture, vec_28);
  packDist_29 = tmpvar_30;
  shadowVals_17.w = dot (packDist_29, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  bvec4 tmpvar_31;
  tmpvar_31 = lessThan (shadowVals_17, vec4(tmpvar_18));
  highp vec4 tmpvar_32;
  tmpvar_32 = _LightShadowData.xxxx;
  highp float tmpvar_33;
  if (tmpvar_31.x) {
    tmpvar_33 = tmpvar_32.x;
  } else {
    tmpvar_33 = 1.0;
  };
  highp float tmpvar_34;
  if (tmpvar_31.y) {
    tmpvar_34 = tmpvar_32.y;
  } else {
    tmpvar_34 = 1.0;
  };
  highp float tmpvar_35;
  if (tmpvar_31.z) {
    tmpvar_35 = tmpvar_32.z;
  } else {
    tmpvar_35 = 1.0;
  };
  highp float tmpvar_36;
  if (tmpvar_31.w) {
    tmpvar_36 = tmpvar_32.w;
  } else {
    tmpvar_36 = 1.0;
  };
  highp vec4 tmpvar_37;
  tmpvar_37.x = tmpvar_33;
  tmpvar_37.y = tmpvar_34;
  tmpvar_37.z = tmpvar_35;
  tmpvar_37.w = tmpvar_36;
  shadows_16 = tmpvar_37;
  mediump float tmpvar_38;
  tmpvar_38 = dot (shadows_16, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_15 = tmpvar_38;
  highp vec3 tmpvar_39;
  tmpvar_39 = ((((tmpvar_13.w * tmpvar_14.w) * tmpvar_15) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_40;
  tmpvar_40[0].x = -0.999999;
  tmpvar_40[0].y = 0.00159255;
  tmpvar_40[1].x = -0.00159255;
  tmpvar_40[1].y = -0.999999;
  lowp vec4 tmpvar_41;
  highp vec2 P_42;
  P_42 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_41 = texture2D (_Mask, P_42);
  node_1540_2 = tmpvar_41;
  highp vec2 P_43;
  P_43 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_40) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_44;
  arg0_44 = (1.0 - texture2D (_Glittermap, P_43).xyz);
  highp vec3 tmpvar_45;
  tmpvar_45 = (max (arg0_44, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_46;
  highp vec2 P_47;
  P_47 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_46 = texture2D (_Glittermap, P_47);
  lowp vec4 tmpvar_48;
  highp vec2 P_49;
  P_49 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_48 = texture2D (_Specularglitter, P_49);
  lowp vec4 tmpvar_50;
  highp vec2 P_51;
  P_51 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_50 = texture2D (_MainTex, P_51);
  highp vec4 tmpvar_52;
  tmpvar_52.w = 0.0;
  tmpvar_52.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_39) * ((tmpvar_50.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_45))) + ((tmpvar_39 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_46.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_45) + mix (pow ((tmpvar_48.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_52;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesTANGENT;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
  xlv_TEXCOORD6 = ((_Object2World * _glesVertex).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightPositionRange;
uniform highp vec4 _LightShadowData;
uniform lowp samplerCube _ShadowMapTexture;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 normal_8;
  normal_8.xy = ((texture2D (_Normalmap, P_7).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (dot (normal_8.xy, normal_8.xy), 0.0, 1.0)));
  normalLocal_3 = normal_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTextureB0, vec2(tmpvar_12));
  lowp vec4 tmpvar_14;
  tmpvar_14 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  highp float tmpvar_15;
  mediump vec4 shadows_16;
  highp vec4 shadowVals_17;
  highp float tmpvar_18;
  tmpvar_18 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec3 vec_19;
  vec_19 = (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125));
  highp vec4 packDist_20;
  lowp vec4 tmpvar_21;
  tmpvar_21 = textureCube (_ShadowMapTexture, vec_19);
  packDist_20 = tmpvar_21;
  shadowVals_17.x = dot (packDist_20, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_22;
  vec_22 = (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125));
  highp vec4 packDist_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureCube (_ShadowMapTexture, vec_22);
  packDist_23 = tmpvar_24;
  shadowVals_17.y = dot (packDist_23, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_25;
  vec_25 = (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125));
  highp vec4 packDist_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = textureCube (_ShadowMapTexture, vec_25);
  packDist_26 = tmpvar_27;
  shadowVals_17.z = dot (packDist_26, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_28;
  vec_28 = (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125));
  highp vec4 packDist_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = textureCube (_ShadowMapTexture, vec_28);
  packDist_29 = tmpvar_30;
  shadowVals_17.w = dot (packDist_29, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  bvec4 tmpvar_31;
  tmpvar_31 = lessThan (shadowVals_17, vec4(tmpvar_18));
  highp vec4 tmpvar_32;
  tmpvar_32 = _LightShadowData.xxxx;
  highp float tmpvar_33;
  if (tmpvar_31.x) {
    tmpvar_33 = tmpvar_32.x;
  } else {
    tmpvar_33 = 1.0;
  };
  highp float tmpvar_34;
  if (tmpvar_31.y) {
    tmpvar_34 = tmpvar_32.y;
  } else {
    tmpvar_34 = 1.0;
  };
  highp float tmpvar_35;
  if (tmpvar_31.z) {
    tmpvar_35 = tmpvar_32.z;
  } else {
    tmpvar_35 = 1.0;
  };
  highp float tmpvar_36;
  if (tmpvar_31.w) {
    tmpvar_36 = tmpvar_32.w;
  } else {
    tmpvar_36 = 1.0;
  };
  highp vec4 tmpvar_37;
  tmpvar_37.x = tmpvar_33;
  tmpvar_37.y = tmpvar_34;
  tmpvar_37.z = tmpvar_35;
  tmpvar_37.w = tmpvar_36;
  shadows_16 = tmpvar_37;
  mediump float tmpvar_38;
  tmpvar_38 = dot (shadows_16, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_15 = tmpvar_38;
  highp vec3 tmpvar_39;
  tmpvar_39 = ((((tmpvar_13.w * tmpvar_14.w) * tmpvar_15) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_40;
  tmpvar_40[0].x = -0.999999;
  tmpvar_40[0].y = 0.00159255;
  tmpvar_40[1].x = -0.00159255;
  tmpvar_40[1].y = -0.999999;
  lowp vec4 tmpvar_41;
  highp vec2 P_42;
  P_42 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_41 = texture2D (_Mask, P_42);
  node_1540_2 = tmpvar_41;
  highp vec2 P_43;
  P_43 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_40) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_44;
  arg0_44 = (1.0 - texture2D (_Glittermap, P_43).xyz);
  highp vec3 tmpvar_45;
  tmpvar_45 = (max (arg0_44, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_46;
  highp vec2 P_47;
  P_47 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_46 = texture2D (_Glittermap, P_47);
  lowp vec4 tmpvar_48;
  highp vec2 P_49;
  P_49 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_48 = texture2D (_Specularglitter, P_49);
  lowp vec4 tmpvar_50;
  highp vec2 P_51;
  P_51 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_50 = texture2D (_MainTex, P_51);
  highp vec4 tmpvar_52;
  tmpvar_52.w = 0.0;
  tmpvar_52.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_39) * ((tmpvar_50.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_45))) + ((tmpvar_39 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_46.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_45) + mix (pow ((tmpvar_48.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_52;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
#define TANGENT vec4(normalize(_glesTANGENT.xyz), _glesTANGENT.w)
in vec4 _glesTANGENT;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp mat4 _LightMatrix0;
out highp vec2 xlv_TEXCOORD0;
out highp vec4 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
out highp vec3 xlv_TEXCOORD4;
out highp vec3 xlv_TEXCOORD5;
out highp vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 0.0;
  tmpvar_2.xyz = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  tmpvar_3 = (tmpvar_2 * _World2Object).xyz;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_Object2World * tmpvar_4).xyz);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_Object2World * _glesVertex);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = normalize((((tmpvar_3.yzx * tmpvar_5.zxy) - (tmpvar_3.zxy * tmpvar_5.yzx)) * _glesTANGENT.w));
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
  xlv_TEXCOORD6 = ((_Object2World * _glesVertex).xyz - _LightPositionRange.xyz);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec4 _LightPositionRange;
uniform highp vec4 _LightShadowData;
uniform lowp samplerCube _ShadowMapTexture;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform highp vec4 _LightColor0;
uniform sampler2D _Mask;
uniform highp vec4 _Mask_ST;
uniform highp float _Shininess;
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform sampler2D _Normalmap;
uniform highp vec4 _Normalmap_ST;
uniform highp vec4 _Glittercolor;
uniform highp float _Glitterymaskdotsscale;
uniform highp float _Glitteryspeed01;
uniform sampler2D _Glittermap;
uniform highp vec4 _Glittermap_ST;
uniform highp float _Glittercontrast13;
uniform highp float _Specularcontrast13;
uniform highp float _Maskadjust0515;
in highp vec2 xlv_TEXCOORD0;
in highp vec4 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
in highp vec3 xlv_TEXCOORD4;
in highp vec3 xlv_TEXCOORD5;
in highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 node_1540_2;
  highp vec3 normalLocal_3;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = xlv_TEXCOORD3.x;
  tmpvar_5[0].y = xlv_TEXCOORD4.x;
  tmpvar_5[0].z = tmpvar_4.x;
  tmpvar_5[1].x = xlv_TEXCOORD3.y;
  tmpvar_5[1].y = xlv_TEXCOORD4.y;
  tmpvar_5[1].z = tmpvar_4.y;
  tmpvar_5[2].x = xlv_TEXCOORD3.z;
  tmpvar_5[2].y = xlv_TEXCOORD4.z;
  tmpvar_5[2].z = tmpvar_4.z;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec2 P_7;
  P_7 = ((xlv_TEXCOORD0 * _Normalmap_ST.xy) + _Normalmap_ST.zw);
  lowp vec3 tmpvar_8;
  tmpvar_8 = ((texture (_Normalmap, P_7).xyz * 2.0) - 1.0);
  normalLocal_3 = tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((normalLocal_3 * tmpvar_5));
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_6 + tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_LightTextureB0, vec2(tmpvar_12));
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture (_LightTexture0, xlv_TEXCOORD5);
  highp float tmpvar_15;
  mediump vec4 shadows_16;
  highp vec4 shadowVals_17;
  highp float tmpvar_18;
  tmpvar_18 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec3 vec_19;
  vec_19 = (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125));
  highp vec4 packDist_20;
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture (_ShadowMapTexture, vec_19);
  packDist_20 = tmpvar_21;
  shadowVals_17.x = dot (packDist_20, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_22;
  vec_22 = (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125));
  highp vec4 packDist_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_ShadowMapTexture, vec_22);
  packDist_23 = tmpvar_24;
  shadowVals_17.y = dot (packDist_23, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_25;
  vec_25 = (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125));
  highp vec4 packDist_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture (_ShadowMapTexture, vec_25);
  packDist_26 = tmpvar_27;
  shadowVals_17.z = dot (packDist_26, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_28;
  vec_28 = (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125));
  highp vec4 packDist_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture (_ShadowMapTexture, vec_28);
  packDist_29 = tmpvar_30;
  shadowVals_17.w = dot (packDist_29, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  bvec4 tmpvar_31;
  tmpvar_31 = lessThan (shadowVals_17, vec4(tmpvar_18));
  highp vec4 tmpvar_32;
  tmpvar_32 = _LightShadowData.xxxx;
  highp float tmpvar_33;
  if (tmpvar_31.x) {
    tmpvar_33 = tmpvar_32.x;
  } else {
    tmpvar_33 = 1.0;
  };
  highp float tmpvar_34;
  if (tmpvar_31.y) {
    tmpvar_34 = tmpvar_32.y;
  } else {
    tmpvar_34 = 1.0;
  };
  highp float tmpvar_35;
  if (tmpvar_31.z) {
    tmpvar_35 = tmpvar_32.z;
  } else {
    tmpvar_35 = 1.0;
  };
  highp float tmpvar_36;
  if (tmpvar_31.w) {
    tmpvar_36 = tmpvar_32.w;
  } else {
    tmpvar_36 = 1.0;
  };
  highp vec4 tmpvar_37;
  tmpvar_37.x = tmpvar_33;
  tmpvar_37.y = tmpvar_34;
  tmpvar_37.z = tmpvar_35;
  tmpvar_37.w = tmpvar_36;
  shadows_16 = tmpvar_37;
  mediump float tmpvar_38;
  tmpvar_38 = dot (shadows_16, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_15 = tmpvar_38;
  highp vec3 tmpvar_39;
  tmpvar_39 = ((((tmpvar_13.w * tmpvar_14.w) * tmpvar_15) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_40;
  tmpvar_40[0].x = -0.999999;
  tmpvar_40[0].y = 0.00159255;
  tmpvar_40[1].x = -0.00159255;
  tmpvar_40[1].y = -0.999999;
  lowp vec4 tmpvar_41;
  highp vec2 P_42;
  P_42 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_41 = texture (_Mask, P_42);
  node_1540_2 = tmpvar_41;
  highp vec2 P_43;
  P_43 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_40) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_44;
  arg0_44 = (1.0 - texture (_Glittermap, P_43).xyz);
  highp vec3 tmpvar_45;
  tmpvar_45 = (max (arg0_44, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_46;
  highp vec2 P_47;
  P_47 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_46 = texture (_Glittermap, P_47);
  lowp vec4 tmpvar_48;
  highp vec2 P_49;
  P_49 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_48 = texture (_Specularglitter, P_49);
  lowp vec4 tmpvar_50;
  highp vec2 P_51;
  P_51 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_50 = texture (_MainTex, P_51);
  highp vec4 tmpvar_52;
  tmpvar_52.w = 0.0;
  tmpvar_52.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_39) * ((tmpvar_50.xyz * _Color.xyz) + ((1.0 - _MasktransparencyDebug) * tmpvar_45))) + ((tmpvar_39 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_46.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_45) + mix (pow ((tmpvar_48.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_52;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 96 math, 7 textures
Keywords { "POINT" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_MainTex_ST]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"3.0-!!ARBfp1.0
PARAM c[22] = { program.local[0..18],
		{ 2, 1, 0, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MAD R0.xy, fragment.texcoord[0], c[11], c[11].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[19].x, -c[19].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.w, R1.x, R1.y;
MUL R2.xyz, R0.y, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[19].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R1, R0;
DP3 R0.x, R2, R2;
RSQ R0.w, R0.x;
MUL R2.xyz, R0.w, R2;
ADD R0.xyz, -fragment.texcoord[1], c[0];
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R2.w, R0, R0;
DP3 R1.w, R1, R1;
RSQ R1.w, R1.w;
RSQ R2.w, R2.w;
MOV R0.w, c[21].y;
MUL R0.xyz, R2.w, R0;
MUL R1.xyz, R1.w, R1;
ADD R3.xyz, R1, R0;
DP3 R1.w, R3, R3;
RSQ R1.w, R1.w;
MUL R3.xyz, R1.w, R3;
MUL R0.w, R0, c[4].x;
ADD R1.w, R0, c[19].y;
DP3 R0.w, R2, R3;
MAX R0.w, R0, c[19].z;
EX2 R1.w, R1.w;
POW R1.w, R0.w, R1.w;
DP3 R0.w, fragment.texcoord[4], R0;
DP3 R0.z, fragment.texcoord[3], R0;
MUL R6.xy, R0.zwzw, -c[14].x;
DP3 R0.x, fragment.texcoord[5], fragment.texcoord[5];
TEX R0.w, R0.x, texture[1], 2D;
MAD R0.xy, R6, c[19].w, fragment.texcoord[0];
MUL R3.xyz, R0.w, c[2];
ADD R0.zw, R0.xyxy, -c[20].x;
MUL R0.xy, R0.w, c[20].wyzw;
MUL R3.xyz, R3, c[19].x;
MAD R0.xy, R0.z, c[20].yzzw, R0;
MOV R0.w, c[14].x;
MUL R0.z, R0.w, -c[21].x;
ADD R0.xy, R0, c[20].x;
MUL R0.w, R0, c[20].x;
MUL R5.xyz, R3, R1.w;
ADD R0.z, R0, c[19].y;
MUL R0.xy, R0, c[13].x;
MUL R4.xy, R0, R0.z;
MUL R6.zw, R4.xyxy, c[18].x;
MAD R0.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R0.xyz, R0, texture[4], 2D;
MUL R0.xyz, R0, c[8].x;
MAD R4.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R4.xyz, R4, texture[2], 2D;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R7.xyz, R4, -R0, R0;
MAD R0.xy, R6.zwzw, c[15], c[15].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
ADD R0.xyz, -R0, c[19].y;
MAX R4.xyz, R0, R4;
ADD R0.w, R0, c[19].y;
MAD R6.xy, -R6, c[19].w, fragment.texcoord[0];
MUL R6.xy, R6, R0.w;
DP3 R0.w, R2, R1;
MAX R1.x, R0.w, c[19].z;
MUL R6.xy, R6, c[13].x;
MAD R0.xy, R6, c[15], c[15].zwzw;
MOV R6.xyz, c[12];
MOV R0.w, c[19].y;
MAD R2.xy, fragment.texcoord[0], c[5], c[5].zwzw;
MUL R4.xyz, R4, c[7].x;
MUL R1.xyz, R1.x, R3;
ADD R0.w, R0, -c[7].x;
TEX R0.xyz, R0, texture[3], 2D;
MUL R6.xyz, R6, c[9].x;
MUL R0.xyz, R6, R0;
POW R0.x, R0.x, c[16].x;
POW R0.z, R0.z, c[16].x;
POW R0.y, R0.y, c[16].x;
MAD R0.xyz, R4, -R0, R0;
ADD R0.xyz, R0, R7;
MUL R0.xyz, R5, R0;
MUL R3.xyz, R0.w, R4;
TEX R2.xyz, R2, texture[5], 2D;
MAD R2.xyz, R2, c[10], R3;
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[19].z;
END
# 96 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 108 math, 7 textures
Keywords { "POINT" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_MainTex_ST]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c19, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c20, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c21, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c22, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
mad r0.xy, v0, c11, c11.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c19.x, c19.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
mad r0.xyz, r0.x, v3, r2
add r2.xyz, -v1, c0
dp3 r1.w, r2, r2
rsq r1.w, r1.w
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c19
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
mul r3.xyz, r1.w, r2
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r0
mad r0.xyz, -v1, c1.w, c1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r2.xyz, r0.w, r0
add r0.xyz, r2, r3
dp3 r0.w, r1, r1
dp3 r1.w, r0, r0
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
rsq r1.w, r1.w
mul r0.xyz, r1.w, r0
dp3 r0.x, r1, r0
max r0.y, r0.x, c19.z
mov r0.w, c4.x
mad r0.z, r0.w, c22, c22.y
exp r0.z, r0.z
pow r4, r0.y, r0.z
dp3 r0.x, v5, v5
texld r0.x, r0.x, s1
mul r0.xyz, r0.x, c2
mov r0.w, r4.x
mul r4.xyz, r0, c19.x
mul r6.xyz, r4, r0.w
dp3 r0.w, v4, r3
dp3 r0.z, v3, r3
mul r5.xy, r0.zwzw, -c14.x
mad r3.xy, r5, c20.x, v0
add r8.xy, r3, c20.y
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s4
mul r7.xyz, r0, c8.x
pow r3, r7.y, c17.x
pow r0, r7.x, c17.x
mov r7.x, r0
pow r0, r7.z, c17.x
mov r7.z, r0
mov r0.z, c14.x
mul r5.zw, r8.y, c20
mov r7.y, r3
mad r0.xy, v0, c3, c3.zwzw
texld r3.xyz, r0, s2
mad r0.xy, r8.x, c21, r5.zwzw
add r0.xy, r0, c21.z
mad r7.xyz, r3, -r7, r7
mad r0.z, r0, c22.x, c22.y
mul r0.xy, r0, c13.x
mul r0.xy, r0, r0.z
mov r0.z, c14.x
mad r1.w, r0.z, c21.z, c21
mad r0.zw, -r5.xyxy, c20.x, v0.xyxy
mul r0.zw, r0, r1.w
mul r5.xy, r0.zwzw, c13.x
mov r0.w, c9.x
mul r0.xy, r0, c18.x
mad r0.xy, r0, c15, c15.zwzw
mad r5.xy, r5, c15, c15.zwzw
texld r0.xyz, r0, s3
texld r5.xyz, r5, s3
mul r8.xyz, c12, r0.w
mul r8.xyz, r8, r5
add r5.xyz, -r0, c19.w
pow r0, r8.x, c16.x
max r3.xyz, r5, r3
mul r5.xyz, r3, c7.x
pow r3, r8.y, c16.x
mov r8.x, r0
pow r0, r8.z, c16.x
dp3 r0.w, r1, r2
mov r8.y, r3
mov r8.z, r0
mad r0.xyz, r5, -r8, r8
add r0.xyz, r0, r7
mul r1.xyz, r6, r0
max r0.x, r0.w, c19.z
mov r0.y, c7.x
add r0.z, c19.w, -r0.y
mul r2.xyz, r0.x, r4
mul r3.xyz, r0.z, r5
mad r0.xy, v0, c5, c5.zwzw
texld r0.xyz, r0, s5
mad r0.xyz, r0, c10, r3
mad oC0.xyz, r2, r0, r1
mov_pp oC0.w, c19.z
"
}
SubProgram "d3d11 " {
// Stats: 81 math, 7 textures
Keywords { "POINT" "SHADOWS_OFF" }
SetTexture 0 [_Normalmap] 2D 4
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_Mask] 2D 1
SetTexture 3 [_Glittermap] 2D 5
SetTexture 4 [_Specularglitter] 2D 3
SetTexture 5 [_MainTex] 2D 2
ConstBuffer "$Globals" 288
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Vector 192 [_Normalmap_ST]
Vector 224 [_Glittercolor]
Float 240 [_Glitterymaskdotsscale]
Float 244 [_Glitteryspeed01]
Vector 256 [_Glittermap_ST]
Float 272 [_Glittercontrast13]
Float 276 [_Specularcontrast13]
Float 280 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedkokkeiaeapihlmbmcnnpbojnjcchbljgabaaaaaajaanaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfiamaaaaeaaaaaaabgadaaaa
fjaaaaaeegiocaaaaaaaaaaabcaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaadiaaaaaldcaabaaaaaaaaaaa
fgifcaaaaaaaaaaaapaaaaaaaceaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaaa
aaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaa
aeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaa
aeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaa
egacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaaagafbaaaaaaaaaaaegaebaaa
adaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaa
apaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaahdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaakdcaabaaaacaaaaaaogakbaaa
acaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaaapaaaaaadcaaaaaldcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaabaaaaaaaogikcaaaaaaaaaaa
baaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaaaaaaaaaeghobaaaadaaaaaa
aagabaaaafaaaaaadiaaaaajlcaabaaaaaaaaaaakgikcaaaaaaaaaaaakaaaaaa
egiicaaaaaaaaaaaaoaaaaaadiaaaaahlcaabaaaaaaaaaaaegaibaaaadaaaaaa
egambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaadiaaaaai
lcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaaaaaaaaaabbaaaaaabjaaaaaf
lcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaakbcaabaaaadaaaaaaegaabaaa
acaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaa
adaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaa
aaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaaagiacaaa
aaaaaaaaapaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaa
apaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaaacaaaaaa
pgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaa
acaaaaaakgikcaaaaaaaaaaabbaaaaaadcaaaaaldcaabaaaacaaaaaaegaabaaa
acaaaaaaegiacaaaaaaaaaaabaaaaaaaogikcaaaaaaaaaaabaaaaaaaefaaaaaj
pcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaadaaaaaaaagabaaaafaaaaaa
aaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaaacaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaadaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaadeaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaaklcaabaaa
aaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaa
dcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaajaaaaaa
ogikcaaaaaaaaaaaajaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaa
eghobaaaaeaaaaaaaagabaaaadaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaa
aeaaaaaafgifcaaaaaaaaaaaakaaaaaacpaaaaafhcaabaaaaeaaaaaaegacbaaa
aeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaa
bbaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaa
adaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaaaeaaaaaaegacbaaaaeaaaaaa
aaaaaaahlcaabaaaaaaaaaaaegambaaaaaaaaaaaegaibaaaadaaaaaadcaaaaam
hcaabaaaadaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaadaaaaaa
egacbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaadaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
aeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaldcaabaaaafaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaa
efaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaaaaaaaaaaagabaaa
aeaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaaafaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
diaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaaegbcbaaaafaaaaaadcaaaaaj
hcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaaaeaaaaaaegacbaaaagaaaaaa
apaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaaegaabaaaafaaaaaaddaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiecaabaaa
aaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaa
aeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaa
abaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaadeaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
dcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaacaeb
abeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaabaaaaaabjaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaagaaaaaa
egbcbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaafgafbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaabaaaaaaakaabaaaadaaaaaa
akaabaaaadaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaaagijcaaa
aaaaaaaaafaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaajgahbaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaaagaabaaaabaaaaaa
diaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaaj
icaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaaaaaaiadp
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaaaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaa
aaaaaaaaaiaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
afaaaaaaaagabaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaaadaaaaaa
egiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "POINT" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 93 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_MainTex_ST]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Specularglitter] 2D 3
SetTexture 4 [_MainTex] 2D 4
"3.0-!!ARBfp1.0
PARAM c[22] = { program.local[0..18],
		{ 2, 1, 0, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MAD R0.xy, fragment.texcoord[0], c[11], c[11].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[19].x, -c[19].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.w, R1.x, R1.y;
MUL R2.xyz, R0.y, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[19].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MOV R7.xyz, c[12];
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R0.xyz, R0.w, R1, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R0;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R0, R0;
ADD R1.xyz, -fragment.texcoord[1], c[0];
DP3 R1.w, R1, R1;
RSQ R1.w, R1.w;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R0;
MUL R1.xyz, R1.w, R1;
DP3 R0.x, fragment.texcoord[3], R1;
DP3 R0.y, fragment.texcoord[4], R1;
MUL R0.xy, R0, -c[14].x;
ADD R1.xyz, R2, R1;
MAD R0.zw, R0.xyxy, c[19].w, fragment.texcoord[0].xyxy;
ADD R4.xy, R0.zwzw, -c[20].x;
DP3 R1.w, R1, R1;
RSQ R1.w, R1.w;
MUL R1.xyz, R1.w, R1;
DP3 R1.x, R3, R1;
MAX R1.z, R1.x, c[19];
MUL R0.zw, R4.y, c[20].xywy;
MAD R0.zw, R4.x, c[20].xyyz, R0;
MOV R1.w, c[14].x;
MOV R1.x, c[21].y;
MAD R5.xy, -R0, c[19].w, fragment.texcoord[0];
ADD R0.zw, R0, c[20].x;
MUL R2.w, R1.x, c[4].x;
MUL R1.y, R1.w, -c[21].x;
ADD R1.x, R1.y, c[19].y;
MUL R0.zw, R0, c[13].x;
MUL R0.zw, R0, R1.x;
ADD R1.y, R2.w, c[19];
EX2 R1.x, R1.y;
POW R2.w, R1.z, R1.x;
MUL R0.zw, R0, c[18].x;
MAD R1.xy, R0.zwzw, c[15], c[15].zwzw;
MOV R0.zw, c[19].xyxy;
MUL R4.xyz, R0.z, c[2];
TEX R1.xyz, R1, texture[2], 2D;
MUL R0.z, R1.w, c[20].x;
ADD R0.z, R0, c[19].y;
MUL R5.xy, R5, R0.z;
MAD R0.xy, fragment.texcoord[0], c[3], c[3].zwzw;
MUL R5.xy, R5, c[13].x;
MAD R5.xy, R5, c[15], c[15].zwzw;
TEX R0.xyz, R0, texture[1], 2D;
ADD R1.xyz, -R1, c[19].y;
MAX R1.xyz, R1, R0;
TEX R5.xyz, R5, texture[2], 2D;
MUL R7.xyz, R7, c[9].x;
MUL R7.xyz, R7, R5;
MUL R5.xyz, R1, c[7].x;
MAD R1.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R1.xyz, R1, texture[3], 2D;
MUL R1.xyz, R1, c[8].x;
POW R1.x, R1.x, c[17].x;
POW R1.z, R1.z, c[17].x;
POW R1.y, R1.y, c[17].x;
MAD R0.xyz, R0, -R1, R1;
DP3 R1.x, R3, R2;
MAX R1.x, R1, c[19].z;
ADD R0.w, R0, -c[7].x;
MAD R2.xy, fragment.texcoord[0], c[5], c[5].zwzw;
MUL R6.xyz, R4, R2.w;
POW R7.x, R7.x, c[16].x;
POW R7.y, R7.y, c[16].x;
POW R7.z, R7.z, c[16].x;
MAD R7.xyz, R5, -R7, R7;
ADD R0.xyz, R7, R0;
MUL R0.xyz, R6, R0;
MUL R1.xyz, R1.x, R4;
MUL R3.xyz, R0.w, R5;
TEX R2.xyz, R2, texture[4], 2D;
MAD R2.xyz, R2, c[10], R3;
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[19].z;
END
# 93 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 107 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_MainTex_ST]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Specularglitter] 2D 3
SetTexture 4 [_MainTex] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c19, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c20, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c21, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c22, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
mad r0.xy, v0, c11, c11.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c19.x, c19.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
mad r0.xyz, r0.x, v3, r2
mad_pp r2.xyz, -v1, c1.w, c1
dp3_pp r1.w, r2, r2
rsq_pp r1.w, r1.w
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c19
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
mov r4.xyz, c2
mul_pp r2.xyz, r1.w, r2
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r0
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
dp3 r2.w, r0, r0
rsq r0.w, r0.w
rsq r2.w, r2.w
mul r0.xyz, r2.w, r0
add r3.xyz, r2, r0
mul r1.xyz, r0.w, r1
dp3 r1.w, r3, r3
rsq r0.w, r1.w
mul r3.xyz, r0.w, r3
dp3 r0.w, r1, r3
mov r1.w, c4.x
mad r1.w, r1, c22.z, c22.y
exp r1.w, r1.w
max r0.w, r0, c19.z
pow r3, r0.w, r1.w
mov r0.w, r3.x
mul r4.xyz, c19.x, r4
mul r6.xyz, r4, r0.w
dp3 r0.w, v4, r0
dp3 r0.z, v3, r0
mul r5.xy, r0.zwzw, -c14.x
mad r3.xy, r5, c20.x, v0
add r8.xy, r3, c20.y
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s3
mul r7.xyz, r0, c8.x
pow r3, r7.y, c17.x
pow r0, r7.x, c17.x
mov r7.x, r0
pow r0, r7.z, c17.x
mov r7.z, r0
mov r0.z, c14.x
mul r5.zw, r8.y, c20
mov r7.y, r3
mad r0.xy, v0, c3, c3.zwzw
texld r3.xyz, r0, s1
mad r0.xy, r8.x, c21, r5.zwzw
add r0.xy, r0, c21.z
mad r7.xyz, r3, -r7, r7
mad r0.z, r0, c22.x, c22.y
mul r0.xy, r0, c13.x
mul r0.xy, r0, r0.z
mov r0.z, c14.x
mad r1.w, r0.z, c21.z, c21
mad r0.zw, -r5.xyxy, c20.x, v0.xyxy
mul r0.zw, r0, r1.w
mul r5.xy, r0.zwzw, c13.x
mov r0.w, c9.x
mul r0.xy, r0, c18.x
mad r0.xy, r0, c15, c15.zwzw
mad r5.xy, r5, c15, c15.zwzw
texld r0.xyz, r0, s2
texld r5.xyz, r5, s2
mul r8.xyz, c12, r0.w
mul r8.xyz, r8, r5
add r5.xyz, -r0, c19.w
pow r0, r8.x, c16.x
max r3.xyz, r5, r3
mul r5.xyz, r3, c7.x
pow r3, r8.y, c16.x
mov r8.x, r0
pow r0, r8.z, c16.x
dp3 r0.w, r1, r2
mov r8.y, r3
mov r8.z, r0
mad r0.xyz, r5, -r8, r8
add r0.xyz, r0, r7
mul r1.xyz, r6, r0
max r0.x, r0.w, c19.z
mov r0.y, c7.x
add r0.z, c19.w, -r0.y
mul r2.xyz, r0.x, r4
mul r3.xyz, r0.z, r5
mad r0.xy, v0, c5, c5.zwzw
texld r0.xyz, r0, s4
mad r0.xyz, r0, c10, r3
mad oC0.xyz, r2, r0, r1
mov_pp oC0.w, c19.z
"
}
SubProgram "d3d11 " {
// Stats: 79 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
SetTexture 0 [_Normalmap] 2D 3
SetTexture 1 [_Mask] 2D 0
SetTexture 2 [_Glittermap] 2D 4
SetTexture 3 [_Specularglitter] 2D 2
SetTexture 4 [_MainTex] 2D 1
ConstBuffer "$Globals" 224
Vector 16 [_LightColor0]
Vector 32 [_Mask_ST]
Float 48 [_Shininess]
Vector 64 [_MainTex_ST]
Vector 80 [_Specularglitter_ST]
Float 96 [_MasktransparencyDebug]
Float 100 [_Specularpower05]
Float 104 [_Glitterpower]
Vector 112 [_Color]
Vector 128 [_Normalmap_ST]
Vector 160 [_Glittercolor]
Float 176 [_Glitterymaskdotsscale]
Float 180 [_Glitteryspeed01]
Vector 192 [_Glittermap_ST]
Float 208 [_Glittercontrast13]
Float 212 [_Specularcontrast13]
Float 216 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedbnjnpkhgdlinbicdhfpoffccjpfdnillabaaaaaapiamaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcnialaaaa
eaaaaaaapgacaaaafjaaaaaeegiocaaaaaaaaaaaaoaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaadiaaaaaldcaabaaaaaaaaaaa
fgifcaaaaaaaaaaaalaaaaaaaceaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaaa
aaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaa
aeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaa
aeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaa
egacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaaagafbaaaaaaaaaaaegaebaaa
adaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaa
alaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaahdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaakdcaabaaaacaaaaaaogakbaaa
acaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaaalaaaaaadcaaaaaldcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaa
amaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaa
aagabaaaaeaaaaaadiaaaaajlcaabaaaaaaaaaaakgikcaaaaaaaaaaaagaaaaaa
egiicaaaaaaaaaaaakaaaaaadiaaaaahlcaabaaaaaaaaaaaegaibaaaadaaaaaa
egambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaadiaaaaai
lcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaaaaaaaaaaanaaaaaabjaaaaaf
lcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaakbcaabaaaadaaaaaaegaabaaa
acaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaa
adaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaa
aaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaaagiacaaa
aaaaaaaaalaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaa
alaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaaacaaaaaa
pgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaa
acaaaaaakgikcaaaaaaaaaaaanaaaaaadcaaaaaldcaabaaaacaaaaaaegaabaaa
acaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaaefaaaaaj
pcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaa
aaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaaacaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaacaaaaaaogikcaaaaaaaaaaaacaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaadaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaadeaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaagaaaaaadcaaaaaklcaabaaa
aaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaa
dcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaafaaaaaa
ogikcaaaaaaaaaaaafaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaa
eghobaaaadaaaaaaaagabaaaacaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaa
aeaaaaaafgifcaaaaaaaaaaaagaaaaaacpaaaaafhcaabaaaaeaaaaaaegacbaaa
aeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaa
anaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaa
adaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaaaeaaaaaaegacbaaaaeaaaaaa
aaaaaaahlcaabaaaaaaaaaaaegambaaaaaaaaaaaegaibaaaadaaaaaadcaaaaam
hcaabaaaadaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaadaaaaaa
egacbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaadaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
aeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaldcaabaaaafaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
efaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaaaaaaaaaaagabaaa
adaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaaafaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
diaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaaegbcbaaaafaaaaaadcaaaaaj
hcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaaaeaaaaaaegacbaaaagaaaaaa
apaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaaegaabaaaafaaaaaaddaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiecaabaaa
aaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaa
aeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaa
abaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaadeaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
dcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaaadaaaaaaabeaaaaaaaaacaeb
abeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaabaaaaaabjaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaaaaaaaaajocaabaaaabaaaaaaagijcaaaaaaaaaaa
abaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaa
aaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaa
agaabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaa
adaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaagaaaaaa
abeaaaaaaaaaiadpdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaa
aaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaa
adaaaaaaeghobaaaaeaaaaaaaagabaaaabaaaaaadcaaaaakhcaabaaaacaaaaaa
egacbaaaadaaaaaaegiccaaaaaaaaaaaahaaaaaaegacbaaaacaaaaaadcaaaaaj
hccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 101 math, 8 textures
Keywords { "SPOT" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_MainTex_ST]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"3.0-!!ARBfp1.0
PARAM c[22] = { program.local[0..18],
		{ 2, 1, 0, 0.5 },
		{ 0.050000001, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.x, R1, R1;
RSQ R0.w, R0.x;
MAD R2.xy, fragment.texcoord[0], c[11], c[11].zwzw;
TEX R2.yw, R2, texture[0], 2D;
MAD R3.xy, R2.wyzw, c[19].x, -c[19].y;
DP3 R1.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R1.xyz, R0.w, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MUL R5.xy, R3, R3;
MUL R2.xyz, R3.y, fragment.texcoord[4];
ADD_SAT R0.w, R5.x, R5.y;
ADD R0.w, -R0, c[19].y;
RSQ R0.w, R0.w;
ADD R4.xyz, R1, R0;
MAD R3.xyz, R3.x, fragment.texcoord[3], R2;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, fragment.texcoord[2];
DP3 R1.w, R4, R4;
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R2, R3;
DP3 R0.w, R2, R2;
RSQ R1.w, R1.w;
MUL R3.xyz, R1.w, R4;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R2;
DP3 R0.w, R2, R3;
MAX R1.w, R0, c[19].z;
DP3 R0.w, fragment.texcoord[4], R0;
DP3 R0.z, fragment.texcoord[3], R0;
MAD R4.xy, fragment.texcoord[0], c[3], c[3].zwzw;
MUL R6.xy, R0.zwzw, -c[14].x;
MOV R0.x, c[21].y;
MUL R0.z, R0.x, c[4].x;
MAD R0.xy, R6, c[20].x, fragment.texcoord[0];
ADD R2.w, R0.z, c[19].y;
ADD R0.zw, R0.xyxy, -c[19].w;
MUL R0.xy, R0.w, c[20].wyzw;
MAD R0.xy, R0.z, c[20].yzzw, R0;
EX2 R2.w, R2.w;
POW R2.w, R1.w, R2.w;
MOV R1.w, c[14].x;
RCP R0.z, fragment.texcoord[5].w;
MAD R0.zw, fragment.texcoord[5].xyxy, R0.z, c[19].w;
TEX R0.w, R0.zwzw, texture[1], 2D;
ADD R0.xy, R0, c[19].w;
SLT R0.z, c[19], fragment.texcoord[5];
MUL R0.z, R0, R0.w;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
TEX R0.w, R0.w, texture[2], 2D;
MUL R0.z, R0, R0.w;
MUL R3.x, R1.w, -c[21];
ADD R0.w, R3.x, c[19].y;
MUL R0.z, R0, c[19].x;
MUL R3.xyz, R0.z, c[2];
MUL R0.xy, R0, c[13].x;
MUL R0.xy, R0, R0.w;
MUL R0.zw, R0.xyxy, c[18].x;
MAD R6.zw, R0, c[15].xyxy, c[15];
MAD R0.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R0.xyz, R0, texture[5], 2D;
MUL R0.xyz, R0, c[8].x;
MUL R5.xyz, R3, R2.w;
TEX R4.xyz, R4, texture[3], 2D;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R7.xyz, R4, -R0, R0;
TEX R0.xyz, R6.zwzw, texture[4], 2D;
ADD R0.xyz, -R0, c[19].y;
MAX R4.xyz, R0, R4;
MAD R0.w, R1, c[19], c[19].y;
MAD R6.xy, -R6, c[20].x, fragment.texcoord[0];
MUL R6.xy, R6, R0.w;
DP3 R0.w, R2, R1;
MAX R1.x, R0.w, c[19].z;
MUL R6.xy, R6, c[13].x;
MAD R0.xy, R6, c[15], c[15].zwzw;
MOV R6.xyz, c[12];
MOV R0.w, c[19].y;
MAD R2.xy, fragment.texcoord[0], c[5], c[5].zwzw;
MUL R4.xyz, R4, c[7].x;
MUL R1.xyz, R1.x, R3;
ADD R0.w, R0, -c[7].x;
TEX R0.xyz, R0, texture[4], 2D;
MUL R6.xyz, R6, c[9].x;
MUL R0.xyz, R6, R0;
POW R0.x, R0.x, c[16].x;
POW R0.z, R0.z, c[16].x;
POW R0.y, R0.y, c[16].x;
MAD R0.xyz, R4, -R0, R0;
ADD R0.xyz, R0, R7;
MUL R0.xyz, R5, R0;
MUL R3.xyz, R0.w, R4;
TEX R2.xyz, R2, texture[6], 2D;
MAD R2.xyz, R2, c[10], R3;
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[19].z;
END
# 101 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 113 math, 8 textures
Keywords { "SPOT" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_MainTex_ST]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c19, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c20, 0.50000000, 0.05000000, -0.50000000, 1.00000000
def c21, 0.00159374, -0.99999875, -0.00159374, 0
def c22, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
mad r0.xy, v0, c11, c11.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c19.x, c19.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
mad r0.xyz, r0.x, v3, r2
add r2.xyz, -v1, c0
dp3 r1.w, r2, r2
rsq r1.w, r1.w
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c19
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
mul r3.xyz, r1.w, r2
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r0
mad r0.xyz, -v1, c1.w, c1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r2.xyz, r0.w, r0
add r0.xyz, r2, r3
dp3 r0.w, r1, r1
dp3 r1.w, r0, r0
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
rsq r1.w, r1.w
mul r0.xyz, r1.w, r0
dp3 r0.x, r1, r0
max r0.y, r0.x, c19.z
mov r0.w, c4.x
mad r0.z, r0.w, c22, c22.y
exp r0.z, r0.z
pow r4, r0.y, r0.z
rcp r0.x, v5.w
mad r5.xy, v5, r0.x, c20.x
dp3 r0.x, v5, v5
dp3 r0.z, v3, r3
texld r0.w, r5, s1
cmp r0.y, -v5.z, c19.z, c19.w
mul_pp r0.y, r0, r0.w
dp3 r0.w, v4, r3
mul r5.xy, r0.zwzw, -c14.x
mad r3.xy, r5, c20.y, v0
add r8.xy, r3, c20.z
texld r0.x, r0.x, s2
mul_pp r0.x, r0.y, r0
mov r0.y, r4.x
mul_pp r0.x, r0, c19
mul r4.xyz, r0.x, c2
mul r6.xyz, r4, r0.y
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s5
mul r7.xyz, r0, c8.x
pow r3, r7.y, c17.x
pow r0, r7.x, c17.x
mov r7.x, r0
pow r0, r7.z, c17.x
mov r7.z, r0
mov r0.z, c14.x
mul r5.zw, r8.y, c21.xyxy
mov r7.y, r3
mad r0.xy, v0, c3, c3.zwzw
texld r3.xyz, r0, s3
mad r0.xy, r8.x, c21.yzzw, r5.zwzw
add r0.xy, r0, c20.x
mad r7.xyz, r3, -r7, r7
mad r0.z, r0, c22.x, c22.y
mul r0.xy, r0, c13.x
mul r0.xy, r0, r0.z
mov r0.z, c14.x
mad r1.w, r0.z, c20.x, c20
mad r0.zw, -r5.xyxy, c20.y, v0.xyxy
mul r0.zw, r0, r1.w
mul r5.xy, r0.zwzw, c13.x
mov r0.w, c9.x
mul r0.xy, r0, c18.x
mad r0.xy, r0, c15, c15.zwzw
mad r5.xy, r5, c15, c15.zwzw
texld r0.xyz, r0, s4
texld r5.xyz, r5, s4
mul r8.xyz, c12, r0.w
mul r8.xyz, r8, r5
add r5.xyz, -r0, c19.w
pow r0, r8.x, c16.x
max r3.xyz, r5, r3
mul r5.xyz, r3, c7.x
pow r3, r8.y, c16.x
mov r8.x, r0
pow r0, r8.z, c16.x
dp3 r0.w, r1, r2
mov r8.y, r3
mov r8.z, r0
mad r0.xyz, r5, -r8, r8
add r0.xyz, r0, r7
mul r1.xyz, r6, r0
max r0.x, r0.w, c19.z
mov r0.y, c7.x
add r0.z, c19.w, -r0.y
mul r2.xyz, r0.x, r4
mul r3.xyz, r0.z, r5
mad r0.xy, v0, c5, c5.zwzw
texld r0.xyz, r0, s6
mad r0.xyz, r0, c10, r3
mad oC0.xyz, r2, r0, r1
mov_pp oC0.w, c19.z
"
}
SubProgram "d3d11 " {
// Stats: 86 math, 8 textures
Keywords { "SPOT" "SHADOWS_OFF" }
SetTexture 0 [_Normalmap] 2D 5
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_LightTextureB0] 2D 1
SetTexture 3 [_Mask] 2D 2
SetTexture 4 [_Glittermap] 2D 6
SetTexture 5 [_Specularglitter] 2D 4
SetTexture 6 [_MainTex] 2D 3
ConstBuffer "$Globals" 288
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Vector 192 [_Normalmap_ST]
Vector 224 [_Glittercolor]
Float 240 [_Glitterymaskdotsscale]
Float 244 [_Glitteryspeed01]
Vector 256 [_Glittermap_ST]
Float 272 [_Glittercontrast13]
Float 276 [_Specularcontrast13]
Float 280 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedkbjdpljjhihohagmgbklfbcpndfpdmkbabaaaaaagiaoaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcdaanaaaaeaaaaaaaemadaaaa
fjaaaaaeegiocaaaaaaaaaaabcaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaa
ffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaaagaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaa
aaaaaaaaapaaaaaaaceaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaaj
hcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaa
baaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaa
egacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaa
acaaaaaadcaaaaajpcaabaaaacaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaa
egbebaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaapaaaaaa
abeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegaabaaaacaaaaaaaaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaa
aceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaa
egaabaaaaaaaaaaaagiacaaaaaaaaaaaapaaaaaadcaaaaaldcaabaaaaaaaaaaa
egaabaaaaaaaaaaaegiacaaaaaaaaaaabaaaaaaaogikcaaaaaaaaaaabaaaaaaa
efaaaaajpcaabaaaadaaaaaaegaabaaaaaaaaaaaeghobaaaaeaaaaaaaagabaaa
agaaaaaadiaaaaajlcaabaaaaaaaaaaakgikcaaaaaaaaaaaakaaaaaaegiicaaa
aaaaaaaaaoaaaaaadiaaaaahlcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaa
aaaaaaaacpaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaa
aaaaaaaaegambaaaaaaaaaaaagiacaaaaaaaaaaabbaaaaaabjaaaaaflcaabaaa
aaaaaaaaegambaaaaaaaaaaaapaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaa
aceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaa
egaabaaaacaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaak
dcaabaaaacaaaaaaegaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaa
apaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaaapaaaaaa
abeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaa
abaaaaaaegaabaaaacaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaa
kgikcaaaaaaaaaaabbaaaaaadcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaa
egiacaaaaaaaaaaabaaaaaaaogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaa
acaaaaaaegaabaaaacaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaaaaaaaaal
hcaabaaaacaaaaaaegacbaiaebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaa
aaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaadaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaadeaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaa
egacbaaaacaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaaklcaabaaaaaaaaaaa
egaibaaaacaaaaaaegambaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaal
dcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaa
afaaaaaaaagabaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaa
fgifcaaaaaaaaaaaakaaaaaacpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaa
diaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaabbaaaaaa
bjaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaa
egacbaaaadaaaaaaegacbaiaebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaah
lcaabaaaaaaaaaaaegambaaaaaaaaaaaegaibaaaadaaaaaadcaaaaamhcaabaaa
adaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaa
acaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaa
adaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
adaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaa
egacbaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaa
eeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaa
kgakbaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaaefaaaaaj
pcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaaaaaaaaaaagabaaaafaaaaaa
dcaaaaapdcaabaaaafaaaaaahgapbaaaafaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaadiaaaaah
hcaabaaaagaaaaaafgafbaaaafaaaaaaegbcbaaaafaaaaaadcaaaaajhcaabaaa
agaaaaaaagaabaaaafaaaaaaegbcbaaaaeaaaaaaegacbaaaagaaaaaaapaaaaah
ecaabaaaaaaaaaaaegaabaaaafaaaaaaegaabaaaafaaaaaaddaaaaahecaabaaa
aaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiecaabaaaaaaaaaaa
ckaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadcaaaaajhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaa
aeaaaaaaegacbaaaagaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaaeaaaaaa
egacbaaaaeaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
hcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaaabaaaaaa
egacbaaaaeaaaaaaegacbaaaadaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaa
abaaaaaaabeaaaaaaaaaaaaadeaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
abeaaaaaaaaaaaaacpaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaak
ccaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaacaebabeaaaaa
aaaaiadpbjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahecaabaaa
aaaaaaaackaabaaaaaaaaaaabkaabaaaabaaaaaabjaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaaaoaaaaahgcaabaaaabaaaaaaagbbbaaaagaaaaaapgbpbaaa
agaaaaaaaaaaaaakgcaabaaaabaaaaaafgagbaaaabaaaaaaaceaaaaaaaaaaaaa
aaaaaadpaaaaaadpaaaaaaaaefaaaaajpcaabaaaadaaaaaajgafbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaadbaaaaahccaabaaaabaaaaaaabeaaaaa
aaaaaaaackbabaaaagaaaaaaabaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaa
abeaaaaaaaaaiadpdiaaaaahccaabaaaabaaaaaadkaabaaaadaaaaaabkaabaaa
abaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaa
efaaaaajpcaabaaaadaaaaaakgakbaaaabaaaaaaeghobaaaacaaaaaaaagabaaa
abaaaaaaapaaaaahccaabaaaabaaaaaafgafbaaaabaaaaaaagaabaaaadaaaaaa
diaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaa
diaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaajgahbaaaabaaaaaaagaabaaaabaaaaaadiaaaaahhcaabaaa
aaaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajicaabaaaaaaaaaaa
akiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaaaaaaiadpdiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgapbaaaaaaaaaaadcaaaaaldcaabaaaadaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
efaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaagaaaaaaaagabaaa
adaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaaadaaaaaaegiccaaaaaaaaaaa
alaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "SPOT" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SPOT" "SHADOWS_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 98 math, 8 textures
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_MainTex_ST]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"3.0-!!ARBfp1.0
PARAM c[22] = { program.local[0..18],
		{ 2, 1, 0, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MAD R0.xy, fragment.texcoord[0], c[11], c[11].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[19].x, -c[19].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.w, R1.x, R1.y;
MUL R2.xyz, R0.y, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[19].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R1, R0;
DP3 R0.x, R2, R2;
RSQ R0.w, R0.x;
MUL R2.xyz, R0.w, R2;
ADD R0.xyz, -fragment.texcoord[1], c[0];
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R2.w, R0, R0;
DP3 R1.w, R1, R1;
RSQ R2.w, R2.w;
RSQ R1.w, R1.w;
MOV R0.w, c[21].y;
MUL R0.xyz, R2.w, R0;
MUL R1.xyz, R1.w, R1;
ADD R3.xyz, R1, R0;
DP3 R1.w, R3, R3;
RSQ R1.w, R1.w;
MUL R3.xyz, R1.w, R3;
MUL R0.w, R0, c[4].x;
ADD R1.w, R0, c[19].y;
DP3 R0.w, R2, R3;
DP3 R3.x, fragment.texcoord[3], R0;
DP3 R3.y, fragment.texcoord[4], R0;
MUL R6.xy, R3, -c[14].x;
EX2 R1.w, R1.w;
MAX R0.w, R0, c[19].z;
POW R2.w, R0.w, R1.w;
DP3 R0.x, fragment.texcoord[5], fragment.texcoord[5];
TEX R1.w, R0.x, texture[1], 2D;
MAD R0.xy, R6, c[19].w, fragment.texcoord[0];
TEX R0.w, fragment.texcoord[5], texture[2], CUBE;
MUL R0.z, R1.w, R0.w;
MUL R3.xyz, R0.z, c[2];
ADD R0.zw, R0.xyxy, -c[20].x;
MUL R0.xy, R0.w, c[20].wyzw;
MUL R3.xyz, R3, c[19].x;
MAD R0.xy, R0.z, c[20].yzzw, R0;
MOV R0.w, c[14].x;
MUL R0.z, R0.w, -c[21].x;
ADD R0.xy, R0, c[20].x;
MUL R0.w, R0, c[20].x;
MUL R5.xyz, R3, R2.w;
ADD R0.z, R0, c[19].y;
MUL R0.xy, R0, c[13].x;
MUL R4.xy, R0, R0.z;
MUL R6.zw, R4.xyxy, c[18].x;
MAD R0.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R0.xyz, R0, texture[5], 2D;
MUL R0.xyz, R0, c[8].x;
MAD R4.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R4.xyz, R4, texture[3], 2D;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R7.xyz, R4, -R0, R0;
MAD R0.xy, R6.zwzw, c[15], c[15].zwzw;
TEX R0.xyz, R0, texture[4], 2D;
ADD R0.xyz, -R0, c[19].y;
MAX R4.xyz, R0, R4;
ADD R0.w, R0, c[19].y;
MAD R6.xy, -R6, c[19].w, fragment.texcoord[0];
MUL R6.xy, R6, R0.w;
DP3 R0.w, R2, R1;
MAX R1.x, R0.w, c[19].z;
MUL R6.xy, R6, c[13].x;
MAD R0.xy, R6, c[15], c[15].zwzw;
MOV R6.xyz, c[12];
MOV R0.w, c[19].y;
MAD R2.xy, fragment.texcoord[0], c[5], c[5].zwzw;
MUL R4.xyz, R4, c[7].x;
MUL R1.xyz, R1.x, R3;
ADD R0.w, R0, -c[7].x;
TEX R0.xyz, R0, texture[4], 2D;
MUL R6.xyz, R6, c[9].x;
MUL R0.xyz, R6, R0;
POW R0.x, R0.x, c[16].x;
POW R0.z, R0.z, c[16].x;
POW R0.y, R0.y, c[16].x;
MAD R0.xyz, R4, -R0, R0;
ADD R0.xyz, R0, R7;
MUL R0.xyz, R5, R0;
MUL R3.xyz, R0.w, R4;
TEX R2.xyz, R2, texture[6], 2D;
MAD R2.xyz, R2, c[10], R3;
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[19].z;
END
# 98 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 109 math, 8 textures
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_MainTex_ST]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c19, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c20, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c21, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c22, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
mad r0.xy, v0, c11, c11.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c19.x, c19.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
mad r0.xyz, r0.x, v3, r2
add r2.xyz, -v1, c0
dp3 r2.w, r2, r2
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c19
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
rsq r2.w, r2.w
mul r3.xyz, r2.w, r2
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r0
mad r0.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
dp3 r1.w, r0, r0
rsq r1.w, r1.w
mul r2.xyz, r1.w, r0
add r0.xyz, r2, r3
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mul r0.xyz, r0.w, r0
dp3 r0.x, r1, r0
mov r1.w, c4.x
mad r0.w, r1, c22.z, c22.y
exp r0.y, r0.w
max r0.x, r0, c19.z
pow r4, r0.x, r0.y
dp3 r0.x, v5, v5
texld r0.w, v5, s2
texld r0.x, r0.x, s1
mul r0.x, r0, r0.w
mul r0.xyz, r0.x, c2
mov r0.w, r4.x
mul r4.xyz, r0, c19.x
mul r6.xyz, r4, r0.w
dp3 r0.w, v4, r3
dp3 r0.z, v3, r3
mul r5.xy, r0.zwzw, -c14.x
mad r3.xy, r5, c20.x, v0
add r8.xy, r3, c20.y
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s5
mul r7.xyz, r0, c8.x
pow r3, r7.y, c17.x
pow r0, r7.x, c17.x
mov r7.x, r0
pow r0, r7.z, c17.x
mov r7.z, r0
mov r0.z, c14.x
mul r5.zw, r8.y, c20
mov r7.y, r3
mad r0.xy, v0, c3, c3.zwzw
texld r3.xyz, r0, s3
mad r0.xy, r8.x, c21, r5.zwzw
add r0.xy, r0, c21.z
mad r7.xyz, r3, -r7, r7
mad r0.z, r0, c22.x, c22.y
mul r0.xy, r0, c13.x
mul r0.xy, r0, r0.z
mov r0.z, c14.x
mad r1.w, r0.z, c21.z, c21
mad r0.zw, -r5.xyxy, c20.x, v0.xyxy
mul r0.zw, r0, r1.w
mul r5.xy, r0.zwzw, c13.x
mov r0.w, c9.x
mul r0.xy, r0, c18.x
mad r0.xy, r0, c15, c15.zwzw
mad r5.xy, r5, c15, c15.zwzw
texld r0.xyz, r0, s4
texld r5.xyz, r5, s4
mul r8.xyz, c12, r0.w
mul r8.xyz, r8, r5
add r5.xyz, -r0, c19.w
pow r0, r8.x, c16.x
max r3.xyz, r5, r3
mul r5.xyz, r3, c7.x
pow r3, r8.y, c16.x
mov r8.x, r0
pow r0, r8.z, c16.x
dp3 r0.w, r1, r2
mov r8.y, r3
mov r8.z, r0
mad r0.xyz, r5, -r8, r8
add r0.xyz, r0, r7
mul r1.xyz, r6, r0
max r0.x, r0.w, c19.z
mov r0.y, c7.x
add r0.z, c19.w, -r0.y
mul r2.xyz, r0.x, r4
mul r3.xyz, r0.z, r5
mad r0.xy, v0, c5, c5.zwzw
texld r0.xyz, r0, s6
mad r0.xyz, r0, c10, r3
mad oC0.xyz, r2, r0, r1
mov_pp oC0.w, c19.z
"
}
SubProgram "d3d11 " {
// Stats: 81 math, 8 textures
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
SetTexture 0 [_Normalmap] 2D 5
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 0
SetTexture 3 [_Mask] 2D 2
SetTexture 4 [_Glittermap] 2D 6
SetTexture 5 [_Specularglitter] 2D 4
SetTexture 6 [_MainTex] 2D 3
ConstBuffer "$Globals" 288
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Vector 192 [_Normalmap_ST]
Vector 224 [_Glittercolor]
Float 240 [_Glitterymaskdotsscale]
Float 244 [_Glitteryspeed01]
Vector 256 [_Glittermap_ST]
Float 272 [_Glittercontrast13]
Float 276 [_Specularcontrast13]
Float 280 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedpmddpdpgblgpojnmanilnfaaejjgggebabaaaaaanaanaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcjiamaaaaeaaaaaaacgadaaaa
fjaaaaaeegiocaaaaaaaaaaabcaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaa
ffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaa
aaaaaaaaapaaaaaaaceaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaaj
hcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaa
baaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaa
egacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaa
acaaaaaadcaaaaajpcaabaaaacaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaa
egbebaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaapaaaaaa
abeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegaabaaaacaaaaaaaaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaa
aceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaa
egaabaaaaaaaaaaaagiacaaaaaaaaaaaapaaaaaadcaaaaaldcaabaaaaaaaaaaa
egaabaaaaaaaaaaaegiacaaaaaaaaaaabaaaaaaaogikcaaaaaaaaaaabaaaaaaa
efaaaaajpcaabaaaadaaaaaaegaabaaaaaaaaaaaeghobaaaaeaaaaaaaagabaaa
agaaaaaadiaaaaajlcaabaaaaaaaaaaakgikcaaaaaaaaaaaakaaaaaaegiicaaa
aaaaaaaaaoaaaaaadiaaaaahlcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaa
aaaaaaaacpaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaa
aaaaaaaaegambaaaaaaaaaaaagiacaaaaaaaaaaabbaaaaaabjaaaaaflcaabaaa
aaaaaaaaegambaaaaaaaaaaaapaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaa
aceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaa
egaabaaaacaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaak
dcaabaaaacaaaaaaegaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaa
apaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaaapaaaaaa
abeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaa
abaaaaaaegaabaaaacaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaa
kgikcaaaaaaaaaaabbaaaaaadcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaa
egiacaaaaaaaaaaabaaaaaaaogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaa
acaaaaaaegaabaaaacaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaaaaaaaaal
hcaabaaaacaaaaaaegacbaiaebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaa
aaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaadaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaadeaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaa
egacbaaaacaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaaklcaabaaaaaaaaaaa
egaibaaaacaaaaaaegambaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaal
dcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaa
afaaaaaaaagabaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaa
fgifcaaaaaaaaaaaakaaaaaacpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaa
diaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaabbaaaaaa
bjaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaa
egacbaaaadaaaaaaegacbaiaebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaah
lcaabaaaaaaaaaaaegambaaaaaaaaaaaegaibaaaadaaaaaadcaaaaamhcaabaaa
adaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaa
acaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaa
adaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
adaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaa
egacbaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaa
eeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaa
kgakbaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaaefaaaaaj
pcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaaaaaaaaaaagabaaaafaaaaaa
dcaaaaapdcaabaaaafaaaaaahgapbaaaafaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaadiaaaaah
hcaabaaaagaaaaaafgafbaaaafaaaaaaegbcbaaaafaaaaaadcaaaaajhcaabaaa
agaaaaaaagaabaaaafaaaaaaegbcbaaaaeaaaaaaegacbaaaagaaaaaaapaaaaah
ecaabaaaaaaaaaaaegaabaaaafaaaaaaegaabaaaafaaaaaaddaaaaahecaabaaa
aaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiecaabaaaaaaaaaaa
ckaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadcaaaaajhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaa
aeaaaaaaegacbaaaagaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaaeaaaaaa
egacbaaaaeaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
hcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaaabaaaaaa
egacbaaaaeaaaaaaegacbaaaadaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaa
abaaaaaaabeaaaaaaaaaaaaadeaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
abeaaaaaaaaaaaaacpaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaak
ccaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaacaebabeaaaaa
aaaaiadpbjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahecaabaaa
aaaaaaaackaabaaaaaaaaaaabkaabaaaabaaaaaabjaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaagaaaaaaegbcbaaa
agaaaaaaefaaaaajpcaabaaaadaaaaaafgafbaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaaefaaaaajpcaabaaaaeaaaaaaegbcbaaaagaaaaaaeghobaaa
acaaaaaaaagabaaaaaaaaaaaapaaaaahccaabaaaabaaaaaaagaabaaaadaaaaaa
pgapbaaaaeaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaaagijcaaa
aaaaaaaaafaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaajgahbaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaaagaabaaaabaaaaaa
diaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaaj
icaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaaaaaaiadp
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaaaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaa
aaaaaaaaaiaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
agaaaaaaaagabaaaadaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaaadaaaaaa
egiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 95 math, 7 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_MainTex_ST]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"3.0-!!ARBfp1.0
PARAM c[22] = { program.local[0..18],
		{ 2, 1, 0, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MAD R0.xy, fragment.texcoord[0], c[11], c[11].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[19].x, -c[19].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.w, R1.x, R1.y;
MUL R2.xyz, R0.y, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[19].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R1, R0;
DP3 R0.x, R2, R2;
RSQ R0.w, R0.x;
MUL R2.xyz, R0.w, R2;
ADD R0.xyz, -fragment.texcoord[1], c[0];
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R2.w, R0, R0;
DP3 R1.w, R1, R1;
RSQ R1.w, R1.w;
RSQ R2.w, R2.w;
MOV R0.w, c[21].y;
MUL R0.xyz, R2.w, R0;
MUL R1.xyz, R1.w, R1;
ADD R3.xyz, R1, R0;
DP3 R1.w, R3, R3;
RSQ R1.w, R1.w;
MUL R3.xyz, R1.w, R3;
MUL R0.w, R0, c[4].x;
ADD R1.w, R0, c[19].y;
DP3 R0.w, R2, R3;
DP3 R3.x, fragment.texcoord[3], R0;
DP3 R3.y, fragment.texcoord[4], R0;
MUL R6.xy, R3, -c[14].x;
MAD R0.xy, R6, c[19].w, fragment.texcoord[0];
MAX R0.w, R0, c[19].z;
EX2 R1.w, R1.w;
POW R1.w, R0.w, R1.w;
TEX R0.w, fragment.texcoord[5], texture[1], 2D;
MUL R3.xyz, R0.w, c[2];
ADD R0.zw, R0.xyxy, -c[20].x;
MUL R0.xy, R0.w, c[20].wyzw;
MUL R3.xyz, R3, c[19].x;
MAD R0.xy, R0.z, c[20].yzzw, R0;
MOV R0.w, c[14].x;
MUL R0.z, R0.w, -c[21].x;
ADD R0.xy, R0, c[20].x;
MUL R0.w, R0, c[20].x;
MUL R5.xyz, R3, R1.w;
ADD R0.z, R0, c[19].y;
MUL R0.xy, R0, c[13].x;
MUL R4.xy, R0, R0.z;
MUL R6.zw, R4.xyxy, c[18].x;
MAD R0.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R0.xyz, R0, texture[4], 2D;
MUL R0.xyz, R0, c[8].x;
MAD R4.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R4.xyz, R4, texture[2], 2D;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R7.xyz, R4, -R0, R0;
MAD R0.xy, R6.zwzw, c[15], c[15].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
ADD R0.xyz, -R0, c[19].y;
MAX R4.xyz, R0, R4;
ADD R0.w, R0, c[19].y;
MAD R6.xy, -R6, c[19].w, fragment.texcoord[0];
MUL R6.xy, R6, R0.w;
DP3 R0.w, R2, R1;
MAX R1.x, R0.w, c[19].z;
MUL R6.xy, R6, c[13].x;
MAD R0.xy, R6, c[15], c[15].zwzw;
MOV R6.xyz, c[12];
MOV R0.w, c[19].y;
MAD R2.xy, fragment.texcoord[0], c[5], c[5].zwzw;
MUL R4.xyz, R4, c[7].x;
MUL R1.xyz, R1.x, R3;
ADD R0.w, R0, -c[7].x;
TEX R0.xyz, R0, texture[3], 2D;
MUL R6.xyz, R6, c[9].x;
MUL R0.xyz, R6, R0;
POW R0.x, R0.x, c[16].x;
POW R0.z, R0.z, c[16].x;
POW R0.y, R0.y, c[16].x;
MAD R0.xyz, R4, -R0, R0;
ADD R0.xyz, R0, R7;
MUL R0.xyz, R5, R0;
MUL R3.xyz, R0.w, R4;
TEX R2.xyz, R2, texture[5], 2D;
MAD R2.xyz, R2, c[10], R3;
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[19].z;
END
# 95 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 107 math, 7 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_MainTex_ST]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c19, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c20, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c21, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c22, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xy
mad r0.xy, v0, c11, c11.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c19.x, c19.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
mad r0.xyz, r0.x, v3, r2
mad_pp r2.xyz, -v1, c1.w, c1
dp3_pp r1.w, r2, r2
rsq_pp r1.w, r1.w
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c19
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
mul_pp r2.xyz, r1.w, r2
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r0
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
dp3 r2.w, r0, r0
rsq r0.w, r0.w
rsq r2.w, r2.w
mul r0.xyz, r2.w, r0
add r3.xyz, r2, r0
mul r1.xyz, r0.w, r1
dp3 r1.w, r3, r3
rsq r0.w, r1.w
mul r3.xyz, r0.w, r3
dp3 r0.w, r1, r3
mov r1.w, c4.x
mad r1.w, r1, c22.z, c22.y
exp r1.w, r1.w
max r0.w, r0, c19.z
pow r3, r0.w, r1.w
texld r0.w, v5, s1
mul r4.xyz, r0.w, c2
mov r0.w, r3.x
mul r4.xyz, r4, c19.x
mul r6.xyz, r4, r0.w
dp3 r0.w, v4, r0
dp3 r0.z, v3, r0
mul r5.xy, r0.zwzw, -c14.x
mad r3.xy, r5, c20.x, v0
add r8.xy, r3, c20.y
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s4
mul r7.xyz, r0, c8.x
pow r3, r7.y, c17.x
pow r0, r7.x, c17.x
mov r7.x, r0
pow r0, r7.z, c17.x
mov r7.z, r0
mov r0.z, c14.x
mul r5.zw, r8.y, c20
mov r7.y, r3
mad r0.xy, v0, c3, c3.zwzw
texld r3.xyz, r0, s2
mad r0.xy, r8.x, c21, r5.zwzw
add r0.xy, r0, c21.z
mad r7.xyz, r3, -r7, r7
mad r0.z, r0, c22.x, c22.y
mul r0.xy, r0, c13.x
mul r0.xy, r0, r0.z
mov r0.z, c14.x
mad r1.w, r0.z, c21.z, c21
mad r0.zw, -r5.xyxy, c20.x, v0.xyxy
mul r0.zw, r0, r1.w
mul r5.xy, r0.zwzw, c13.x
mov r0.w, c9.x
mul r0.xy, r0, c18.x
mad r0.xy, r0, c15, c15.zwzw
mad r5.xy, r5, c15, c15.zwzw
texld r0.xyz, r0, s3
texld r5.xyz, r5, s3
mul r8.xyz, c12, r0.w
mul r8.xyz, r8, r5
add r5.xyz, -r0, c19.w
pow r0, r8.x, c16.x
max r3.xyz, r5, r3
mul r5.xyz, r3, c7.x
pow r3, r8.y, c16.x
mov r8.x, r0
pow r0, r8.z, c16.x
dp3 r0.w, r1, r2
mov r8.y, r3
mov r8.z, r0
mad r0.xyz, r5, -r8, r8
add r0.xyz, r0, r7
mul r1.xyz, r6, r0
max r0.x, r0.w, c19.z
mov r0.y, c7.x
add r0.z, c19.w, -r0.y
mul r2.xyz, r0.x, r4
mul r3.xyz, r0.z, r5
mad r0.xy, v0, c5, c5.zwzw
texld r0.xyz, r0, s5
mad r0.xyz, r0, c10, r3
mad oC0.xyz, r2, r0, r1
mov_pp oC0.w, c19.z
"
}
SubProgram "d3d11 " {
// Stats: 80 math, 7 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
SetTexture 0 [_Normalmap] 2D 4
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_Mask] 2D 1
SetTexture 3 [_Glittermap] 2D 5
SetTexture 4 [_Specularglitter] 2D 3
SetTexture 5 [_MainTex] 2D 2
ConstBuffer "$Globals" 288
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Vector 192 [_Normalmap_ST]
Vector 224 [_Glittercolor]
Float 240 [_Glitterymaskdotsscale]
Float 244 [_Glitteryspeed01]
Vector 256 [_Glittermap_ST]
Float 272 [_Glittercontrast13]
Float 276 [_Specularcontrast13]
Float 280 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedkgbfpggkcgnfagnhlchfconmpjhndgaiabaaaaaaheanaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcdmamaaaaeaaaaaaaapadaaaa
fjaaaaaeegiocaaaaaaaaaaabcaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaadiaaaaaldcaabaaaaaaaaaaa
fgifcaaaaaaaaaaaapaaaaaaaceaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaaa
aaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaa
aeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaa
aeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaa
egacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaaagafbaaaaaaaaaaaegaebaaa
adaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaa
apaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaahdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaakdcaabaaaacaaaaaaogakbaaa
acaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaaapaaaaaadcaaaaaldcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaabaaaaaaaogikcaaaaaaaaaaa
baaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaaaaaaaaaeghobaaaadaaaaaa
aagabaaaafaaaaaadiaaaaajlcaabaaaaaaaaaaakgikcaaaaaaaaaaaakaaaaaa
egiicaaaaaaaaaaaaoaaaaaadiaaaaahlcaabaaaaaaaaaaaegaibaaaadaaaaaa
egambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaadiaaaaai
lcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaaaaaaaaaabbaaaaaabjaaaaaf
lcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaakbcaabaaaadaaaaaaegaabaaa
acaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaa
adaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaa
aaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaaagiacaaa
aaaaaaaaapaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaa
apaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaaacaaaaaa
pgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaa
acaaaaaakgikcaaaaaaaaaaabbaaaaaadcaaaaaldcaabaaaacaaaaaaegaabaaa
acaaaaaaegiacaaaaaaaaaaabaaaaaaaogikcaaaaaaaaaaabaaaaaaaefaaaaaj
pcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaadaaaaaaaagabaaaafaaaaaa
aaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaaacaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaadaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaadeaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaaklcaabaaa
aaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaa
dcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaajaaaaaa
ogikcaaaaaaaaaaaajaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaa
eghobaaaaeaaaaaaaagabaaaadaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaa
aeaaaaaafgifcaaaaaaaaaaaakaaaaaacpaaaaafhcaabaaaaeaaaaaaegacbaaa
aeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaa
bbaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaa
adaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaaaeaaaaaaegacbaaaaeaaaaaa
aaaaaaahlcaabaaaaaaaaaaaegambaaaaaaaaaaaegaibaaaadaaaaaadcaaaaam
hcaabaaaadaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaadaaaaaa
egacbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaadaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
aeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaldcaabaaaafaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaa
efaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaaaaaaaaaaagabaaa
aeaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaaafaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
diaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaaegbcbaaaafaaaaaadcaaaaaj
hcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaaaeaaaaaaegacbaaaagaaaaaa
apaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaaegaabaaaafaaaaaaddaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiecaabaaa
aaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaa
aeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaa
abaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaadeaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
dcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaacaeb
abeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaabaaaaaabjaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaaefaaaaajpcaabaaaadaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaabaaaaaadkaabaaa
adaaaaaadkaabaaaadaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaa
agijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaa
jgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaaagaabaaa
abaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaa
aaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaa
aaaaiadpdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaaaaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaafaaaaaaaagabaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaa
adaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 106 math, 9 textures
Keywords { "SPOT" "SHADOWS_DEPTH" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_MainTex_ST]
Vector 7 [_Specularglitter_ST]
Float 8 [_MasktransparencyDebug]
Float 9 [_Specularpower05]
Float 10 [_Glitterpower]
Vector 11 [_Color]
Vector 12 [_Normalmap_ST]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"3.0-!!ARBfp1.0
PARAM c[23] = { program.local[0..19],
		{ 2, 1, 0, 0.5 },
		{ 0.050000001, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MAD R0.xy, fragment.texcoord[0], c[12], c[12].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[20].x, -c[20].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.w, R1.x, R1.y;
MUL R2.xyz, R0.y, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[20].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MOV R7.xyz, c[13];
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R0.xyz, R0.w, R1, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R0;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R1.w, R0, R0;
RSQ R1.w, R1.w;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
MUL R0.xyz, R1.w, R0;
DP3 R1.x, fragment.texcoord[3], R0;
DP3 R1.y, fragment.texcoord[4], R0;
MUL R5.xy, R1, -c[15].x;
ADD R0.xyz, R2, R0;
MAD R1.xy, R5, c[21].x, fragment.texcoord[0];
ADD R1.zw, R1.xyxy, -c[20].w;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.z, R3, R0;
MAX R0.w, R0.z, c[20].z;
MUL R1.xy, R1.w, c[21].wyzw;
MAD R1.xy, R1.z, c[21].yzzw, R1;
ADD R0.xy, R1, c[20].w;
MOV R0.z, c[22].y;
MUL R1.x, R0.z, c[5];
MOV R3.w, c[15].x;
MUL R0.z, R3.w, -c[22].x;
ADD R1.x, R1, c[20].y;
EX2 R1.x, R1.x;
POW R1.z, R0.w, R1.x;
ADD R0.z, R0, c[20].y;
MUL R0.xy, R0, c[14].x;
MUL R0.xy, R0, R0.z;
MUL R1.xy, R0, c[19].x;
DP3 R0.z, fragment.texcoord[5], fragment.texcoord[5];
TEX R1.w, R0.z, texture[2], 2D;
TXP R0.x, fragment.texcoord[6], texture[3], 2D;
RCP R0.y, fragment.texcoord[6].w;
MAD R0.y, -fragment.texcoord[6].z, R0, R0.x;
MOV R2.w, c[20].y;
CMP R4.x, R0.y, c[2], R2.w;
RCP R0.x, fragment.texcoord[5].w;
MAD R0.xy, fragment.texcoord[5], R0.x, c[20].w;
TEX R0.w, R0, texture[1], 2D;
SLT R0.x, c[20].z, fragment.texcoord[5].z;
MUL R0.x, R0, R0.w;
MUL R0.x, R0, R1.w;
MUL R0.x, R0, R4;
MUL R0.w, R0.x, c[20].x;
MUL R4.xyz, R0.w, c[3];
MAD R1.xy, R1, c[16], c[16].zwzw;
TEX R0.xyz, R1, texture[5], 2D;
MUL R6.xyz, R4, R1.z;
ADD R1.xyz, -R0, c[20].y;
MAD R0.zw, -R5.xyxy, c[21].x, fragment.texcoord[0].xyxy;
MAD R1.w, R3, c[20], c[20].y;
MUL R5.xy, R0.zwzw, R1.w;
DP3 R0.w, R3, R2;
MAD R0.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R0.xyz, R0, texture[4], 2D;
MUL R5.xy, R5, c[14].x;
MAD R5.xy, R5, c[16], c[16].zwzw;
MAD R2.xy, fragment.texcoord[0], c[6], c[6].zwzw;
MAX R1.xyz, R1, R0;
TEX R5.xyz, R5, texture[5], 2D;
MUL R7.xyz, R7, c[10].x;
MUL R7.xyz, R7, R5;
MUL R5.xyz, R1, c[8].x;
MAD R1.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R1.xyz, R1, texture[6], 2D;
MUL R1.xyz, R1, c[9].x;
POW R1.x, R1.x, c[18].x;
POW R1.z, R1.z, c[18].x;
POW R1.y, R1.y, c[18].x;
MAD R0.xyz, R0, -R1, R1;
MAX R0.w, R0, c[20].z;
MUL R1.xyz, R0.w, R4;
ADD R0.w, R2, -c[8].x;
POW R7.x, R7.x, c[17].x;
POW R7.y, R7.y, c[17].x;
POW R7.z, R7.z, c[17].x;
MAD R7.xyz, R5, -R7, R7;
ADD R0.xyz, R7, R0;
MUL R0.xyz, R6, R0;
MUL R3.xyz, R0.w, R5;
TEX R2.xyz, R2, texture[7], 2D;
MAD R2.xyz, R2, c[11], R3;
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[20].z;
END
# 106 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 118 math, 9 textures
Keywords { "SPOT" "SHADOWS_DEPTH" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_MainTex_ST]
Vector 7 [_Specularglitter_ST]
Float 8 [_MasktransparencyDebug]
Float 9 [_Specularpower05]
Float 10 [_Glitterpower]
Vector 11 [_Color]
Vector 12 [_Normalmap_ST]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
def c20, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c21, 0.50000000, 0.05000000, -0.50000000, 1.00000000
def c22, 0.00159374, -0.99999875, -0.00159374, 0
def c23, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
dcl_texcoord6 v6
mad r0.xy, v0, c12, c12.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c20.x, c20.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
mad r0.xyz, r0.x, v3, r2
add r2.xyz, -v1, c0
dp3 r2.w, r2, r2
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c20
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
rsq r2.w, r2.w
mul r3.xyz, r2.w, r2
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r0
mad r0.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
dp3 r1.w, r0, r0
rsq r1.w, r1.w
mul r2.xyz, r1.w, r0
add r0.xyz, r2, r3
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mul r0.xyz, r0.w, r0
dp3 r0.x, r1, r0
mov r1.w, c5.x
mad r0.w, r1, c23.z, c23.y
exp r0.y, r0.w
max r0.x, r0, c20.z
pow r4, r0.x, r0.y
texldp r0.x, v6, s3
rcp r0.y, v6.w
mad r0.y, -v6.z, r0, r0.x
rcp r0.x, v5.w
mad r5.xy, v5, r0.x, c21.x
mov r0.z, c2.x
cmp r0.z, r0.y, c20.w, r0
dp3 r0.x, v5, v5
texld r0.w, r5, s1
cmp r0.y, -v5.z, c20.z, c20.w
mul_pp r0.y, r0, r0.w
texld r0.x, r0.x, s2
mul_pp r0.x, r0.y, r0
mul_pp r0.x, r0, r0.z
dp3 r0.w, v4, r3
dp3 r0.z, v3, r3
mul r5.xy, r0.zwzw, -c15.x
mad r3.xy, r5, c21.y, v0
add r8.xy, r3, c21.z
mov r0.y, r4.x
mul_pp r0.x, r0, c20
mul r4.xyz, r0.x, c3
mul r6.xyz, r4, r0.y
mad r0.xy, v0, c7, c7.zwzw
texld r0.xyz, r0, s6
mul r7.xyz, r0, c9.x
pow r3, r7.y, c18.x
pow r0, r7.x, c18.x
mov r7.x, r0
pow r0, r7.z, c18.x
mov r7.z, r0
mov r0.z, c15.x
mul r5.zw, r8.y, c22.xyxy
mov r7.y, r3
mad r0.xy, v0, c4, c4.zwzw
texld r3.xyz, r0, s4
mad r0.xy, r8.x, c22.yzzw, r5.zwzw
add r0.xy, r0, c21.x
mad r7.xyz, r3, -r7, r7
mad r0.z, r0, c23.x, c23.y
mul r0.xy, r0, c14.x
mul r0.xy, r0, r0.z
mov r0.z, c15.x
mad r1.w, r0.z, c21.x, c21
mad r0.zw, -r5.xyxy, c21.y, v0.xyxy
mul r0.zw, r0, r1.w
mul r5.xy, r0.zwzw, c14.x
mov r0.w, c10.x
mul r0.xy, r0, c19.x
mad r0.xy, r0, c16, c16.zwzw
mad r5.xy, r5, c16, c16.zwzw
texld r0.xyz, r0, s5
texld r5.xyz, r5, s5
mul r8.xyz, c13, r0.w
mul r8.xyz, r8, r5
add r5.xyz, -r0, c20.w
pow r0, r8.x, c17.x
max r3.xyz, r5, r3
mul r5.xyz, r3, c8.x
pow r3, r8.y, c17.x
mov r8.x, r0
pow r0, r8.z, c17.x
dp3 r0.w, r1, r2
mov r8.y, r3
mov r8.z, r0
mad r0.xyz, r5, -r8, r8
add r0.xyz, r0, r7
mul r1.xyz, r6, r0
max r0.x, r0.w, c20.z
mov r0.y, c8.x
add r0.z, c20.w, -r0.y
mul r2.xyz, r0.x, r4
mul r3.xyz, r0.z, r5
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s7
mad r0.xyz, r0, c11, r3
mad oC0.xyz, r2, r0, r1
mov_pp oC0.w, c20.z
"
}
SubProgram "d3d11 " {
// Stats: 89 math, 9 textures
Keywords { "SPOT" "SHADOWS_DEPTH" }
SetTexture 0 [_Normalmap] 2D 6
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 0
SetTexture 4 [_Mask] 2D 3
SetTexture 5 [_Glittermap] 2D 7
SetTexture 6 [_Specularglitter] 2D 5
SetTexture 7 [_MainTex] 2D 4
ConstBuffer "$Globals" 288
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Vector 192 [_Normalmap_ST]
Vector 224 [_Glittercolor]
Float 240 [_Glitterymaskdotsscale]
Float 244 [_Glitteryspeed01]
Vector 256 [_Glittermap_ST]
Float 272 [_Glittercontrast13]
Float 276 [_Specularcontrast13]
Float 280 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityShadows" 416
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
"ps_4_0
eefiecedeknnahafcdcpdkjdffcdaboldfcijiafabaaaaaafiapaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcaiaoaaaaeaaaaaaaicadaaaafjaaaaaeegiocaaa
aaaaaaaabcaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaa
agaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaaagaaaaaa
gcbaaaadpcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaa
diaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaapaaaaaaaceaaaaamnmmemdn
mnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
bcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaa
adaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaa
agafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaa
aaaaaaaabkiacaaaaaaaaaaaapaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadp
diaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaak
dcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaa
apaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaa
baaaaaaaogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaa
aaaaaaaaeghobaaaafaaaaaaaagabaaaahaaaaaadiaaaaajlcaabaaaaaaaaaaa
kgikcaaaaaaaaaaaakaaaaaaegiicaaaaaaaaaaaaoaaaaaadiaaaaahlcaabaaa
aaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaa
egambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaa
aaaaaaaabbaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaak
bcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaa
aaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalk
olpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaa
egaabaaaacaaaaaaagiacaaaaaaaaaaaapaaaaaadcaaaaalicaabaaaabaaaaaa
bkiacaiaebaaaaaaaaaaaaaaapaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadp
diaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaai
dcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaabbaaaaaadcaaaaal
dcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaabaaaaaaaogikcaaa
aaaaaaaabaaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
afaaaaaaaagabaaaahaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaa
acaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaa
adaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaaeaaaaaa
aagabaaaadaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaa
adaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaa
akaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaa
aaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaajpcaabaaa
aeaaaaaaegaabaaaaeaaaaaaeghobaaaagaaaaaaaagabaaaafaaaaaadiaaaaai
hcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaakaaaaaacpaaaaaf
hcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaa
aeaaaaaafgifcaaaaaaaaaaabbaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaa
aeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaa
aeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaaaaaaaaaa
egaibaaaadaaaaaadcaaaaamhcaabaaaadaaaaaapgipcaaaacaaaaaaaaaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaa
abaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaa
adaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaaaaaaaaaagabaaaagaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaa
afaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaa
egbcbaaaafaaaaaadcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaa
aeaaaaaaegacbaaaagaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaa
egaabaaaafaaaaaaddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaa
aeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaa
ahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
abaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaoaaaaahgcaabaaa
abaaaaaaagbbbaaaagaaaaaapgbpbaaaagaaaaaaaaaaaaakgcaabaaaabaaaaaa
fgagbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaadpaaaaaadpaaaaaaaaefaaaaaj
pcaabaaaadaaaaaajgafbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
dbaaaaahccaabaaaabaaaaaaabeaaaaaaaaaaaaackbabaaaagaaaaaaabaaaaah
ccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahccaabaaa
abaaaaaadkaabaaaadaaaaaabkaabaaaabaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaakgakbaaa
abaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahccaabaaaabaaaaaa
bkaabaaaabaaaaaaakaabaaaadaaaaaaaoaaaaahhcaabaaaadaaaaaaegbcbaaa
ahaaaaaapgbpbaaaahaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaadaaaaaa
eghobaaaadaaaaaaaagabaaaaaaaaaaadbaaaaahecaabaaaabaaaaaaakaabaaa
aeaaaaaackaabaaaadaaaaaadhaaaaakecaabaaaabaaaaaackaabaaaabaaaaaa
akiacaaaadaaaaaabiaaaaaaabeaaaaaaaaaiadpapaaaaahccaabaaaabaaaaaa
fgafbaaaabaaaaaakgakbaaaabaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaa
abaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaa
aaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaa
agaabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaa
adaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaa
abeaaaaaaaaaiadpdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaa
aaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaa
adaaaaaaeghobaaaahaaaaaaaagabaaaaeaaaaaadcaaaaakhcaabaaaacaaaaaa
egacbaaaadaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaadcaaaaaj
hccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 105 math, 9 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_MainTex_ST]
Vector 7 [_Specularglitter_ST]
Float 8 [_MasktransparencyDebug]
Float 9 [_Specularpower05]
Float 10 [_Glitterpower]
Vector 11 [_Color]
Vector 12 [_Normalmap_ST]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"3.0-!!ARBfp1.0
OPTION ARB_fragment_program_shadow;
PARAM c[23] = { program.local[0..19],
		{ 2, 1, 0, 0.5 },
		{ 0.050000001, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MAD R0.xy, fragment.texcoord[0], c[12], c[12].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[20].x, -c[20].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.w, R1.x, R1.y;
MUL R2.xyz, R0.y, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[20].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MOV R7.xyz, c[13];
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R0.xyz, R0.w, R1, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R0;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R1.w, R0, R0;
RSQ R1.w, R1.w;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
MUL R0.xyz, R1.w, R0;
DP3 R1.x, fragment.texcoord[3], R0;
DP3 R1.y, fragment.texcoord[4], R0;
MUL R5.xy, R1, -c[15].x;
ADD R0.xyz, R2, R0;
MAD R1.xy, R5, c[21].x, fragment.texcoord[0];
ADD R1.zw, R1.xyxy, -c[20].w;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.z, R3, R0;
MAX R0.w, R0.z, c[20].z;
MUL R1.xy, R1.w, c[21].wyzw;
MAD R1.xy, R1.z, c[21].yzzw, R1;
ADD R0.xy, R1, c[20].w;
MOV R0.z, c[22].y;
MUL R1.x, R0.z, c[5];
MOV R3.w, c[15].x;
MUL R0.z, R3.w, -c[22].x;
ADD R1.x, R1, c[20].y;
EX2 R1.x, R1.x;
POW R1.z, R0.w, R1.x;
ADD R0.z, R0, c[20].y;
MUL R0.xy, R0, c[14].x;
MUL R0.xy, R0, R0.z;
MUL R1.xy, R0, c[19].x;
MOV R2.w, c[20].y;
ADD R0.z, R2.w, -c[2].x;
TXP R0.x, fragment.texcoord[6], texture[3], SHADOW2D;
MAD R4.x, R0, R0.z, c[2];
DP3 R0.z, fragment.texcoord[5], fragment.texcoord[5];
RCP R0.y, fragment.texcoord[5].w;
MAD R0.xy, fragment.texcoord[5], R0.y, c[20].w;
TEX R0.w, R0, texture[1], 2D;
SLT R0.x, c[20].z, fragment.texcoord[5].z;
TEX R1.w, R0.z, texture[2], 2D;
MUL R0.x, R0, R0.w;
MUL R0.x, R0, R1.w;
MUL R0.x, R0, R4;
MUL R0.w, R0.x, c[20].x;
MUL R4.xyz, R0.w, c[3];
MAD R1.xy, R1, c[16], c[16].zwzw;
TEX R0.xyz, R1, texture[5], 2D;
MUL R6.xyz, R4, R1.z;
ADD R1.xyz, -R0, c[20].y;
MAD R0.zw, -R5.xyxy, c[21].x, fragment.texcoord[0].xyxy;
MAD R1.w, R3, c[20], c[20].y;
MUL R5.xy, R0.zwzw, R1.w;
DP3 R0.w, R3, R2;
MAD R0.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R0.xyz, R0, texture[4], 2D;
MUL R5.xy, R5, c[14].x;
MAD R5.xy, R5, c[16], c[16].zwzw;
MAD R2.xy, fragment.texcoord[0], c[6], c[6].zwzw;
MAX R1.xyz, R1, R0;
TEX R5.xyz, R5, texture[5], 2D;
MUL R7.xyz, R7, c[10].x;
MUL R7.xyz, R7, R5;
MUL R5.xyz, R1, c[8].x;
MAD R1.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R1.xyz, R1, texture[6], 2D;
MUL R1.xyz, R1, c[9].x;
POW R1.x, R1.x, c[18].x;
POW R1.z, R1.z, c[18].x;
POW R1.y, R1.y, c[18].x;
MAD R0.xyz, R0, -R1, R1;
MAX R0.w, R0, c[20].z;
MUL R1.xyz, R0.w, R4;
ADD R0.w, R2, -c[8].x;
POW R7.x, R7.x, c[17].x;
POW R7.y, R7.y, c[17].x;
POW R7.z, R7.z, c[17].x;
MAD R7.xyz, R5, -R7, R7;
ADD R0.xyz, R7, R0;
MUL R0.xyz, R6, R0;
MUL R3.xyz, R0.w, R5;
TEX R2.xyz, R2, texture[7], 2D;
MAD R2.xyz, R2, c[11], R3;
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[20].z;
END
# 105 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 117 math, 9 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_MainTex_ST]
Vector 7 [_Specularglitter_ST]
Float 8 [_MasktransparencyDebug]
Float 9 [_Specularpower05]
Float 10 [_Glitterpower]
Vector 11 [_Color]
Vector 12 [_Normalmap_ST]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
def c20, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c21, 0.50000000, 0.05000000, -0.50000000, 1.00000000
def c22, 0.00159374, -0.99999875, -0.00159374, 0
def c23, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
dcl_texcoord6 v6
mad r0.xy, v0, c12, c12.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c20.x, c20.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
mad r0.xyz, r0.x, v3, r2
add r2.xyz, -v1, c0
dp3 r2.w, r2, r2
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c20
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
rsq r2.w, r2.w
mul r3.xyz, r2.w, r2
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r0
mad r0.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
dp3 r1.w, r0, r0
rsq r1.w, r1.w
mul r2.xyz, r1.w, r0
add r0.xyz, r2, r3
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mul r0.xyz, r0.w, r0
dp3 r0.x, r1, r0
mov r1.w, c5.x
mad r0.w, r1, c23.z, c23.y
exp r0.y, r0.w
max r0.x, r0, c20.z
pow r4, r0.x, r0.y
mov r0.x, c2
rcp r0.y, v5.w
mad r5.xy, v5, r0.y, c21.x
add r0.z, c20.w, -r0.x
texldp r0.x, v6, s3
mad r0.z, r0.x, r0, c2.x
dp3 r0.x, v5, v5
texld r0.w, r5, s1
cmp r0.y, -v5.z, c20.z, c20.w
mul_pp r0.y, r0, r0.w
texld r0.x, r0.x, s2
mul_pp r0.x, r0.y, r0
mul_pp r0.x, r0, r0.z
dp3 r0.w, v4, r3
dp3 r0.z, v3, r3
mul r5.xy, r0.zwzw, -c15.x
mad r3.xy, r5, c21.y, v0
add r8.xy, r3, c21.z
mov r0.y, r4.x
mul_pp r0.x, r0, c20
mul r4.xyz, r0.x, c3
mul r6.xyz, r4, r0.y
mad r0.xy, v0, c7, c7.zwzw
texld r0.xyz, r0, s6
mul r7.xyz, r0, c9.x
pow r3, r7.y, c18.x
pow r0, r7.x, c18.x
mov r7.x, r0
pow r0, r7.z, c18.x
mov r7.z, r0
mov r0.z, c15.x
mul r5.zw, r8.y, c22.xyxy
mov r7.y, r3
mad r0.xy, v0, c4, c4.zwzw
texld r3.xyz, r0, s4
mad r0.xy, r8.x, c22.yzzw, r5.zwzw
add r0.xy, r0, c21.x
mad r7.xyz, r3, -r7, r7
mad r0.z, r0, c23.x, c23.y
mul r0.xy, r0, c14.x
mul r0.xy, r0, r0.z
mov r0.z, c15.x
mad r1.w, r0.z, c21.x, c21
mad r0.zw, -r5.xyxy, c21.y, v0.xyxy
mul r0.zw, r0, r1.w
mul r5.xy, r0.zwzw, c14.x
mov r0.w, c10.x
mul r0.xy, r0, c19.x
mad r0.xy, r0, c16, c16.zwzw
mad r5.xy, r5, c16, c16.zwzw
texld r0.xyz, r0, s5
texld r5.xyz, r5, s5
mul r8.xyz, c13, r0.w
mul r8.xyz, r8, r5
add r5.xyz, -r0, c20.w
pow r0, r8.x, c17.x
max r3.xyz, r5, r3
mul r5.xyz, r3, c8.x
pow r3, r8.y, c17.x
mov r8.x, r0
pow r0, r8.z, c17.x
dp3 r0.w, r1, r2
mov r8.y, r3
mov r8.z, r0
mad r0.xyz, r5, -r8, r8
add r0.xyz, r0, r7
mul r1.xyz, r6, r0
max r0.x, r0.w, c20.z
mov r0.y, c8.x
add r0.z, c20.w, -r0.y
mul r2.xyz, r0.x, r4
mul r3.xyz, r0.z, r5
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s7
mad r0.xyz, r0, c11, r3
mad oC0.xyz, r2, r0, r1
mov_pp oC0.w, c20.z
"
}
SubProgram "d3d11 " {
// Stats: 90 math, 8 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
SetTexture 0 [_Normalmap] 2D 6
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 7
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 4
SetTexture 7 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 288
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Vector 192 [_Normalmap_ST]
Vector 224 [_Glittercolor]
Float 240 [_Glitterymaskdotsscale]
Float 244 [_Glitteryspeed01]
Vector 256 [_Glittermap_ST]
Float 272 [_Glittercontrast13]
Float 276 [_Specularcontrast13]
Float 280 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityShadows" 416
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
"ps_4_0
eefiecedcldleimhaglmaomggkkicdbplaafnoplabaaaaaagiapaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcbiaoaaaaeaaaaaaaigadaaaafjaaaaaeegiocaaa
aaaaaaaabcaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaiaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaa
agaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaaagaaaaaa
gcbaaaadpcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaa
diaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaapaaaaaaaceaaaaamnmmemdn
mnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
bcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaa
adaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaa
agafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaa
aaaaaaaabkiacaaaaaaaaaaaapaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadp
diaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaak
dcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaa
apaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaa
baaaaaaaogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaa
aaaaaaaaeghobaaaaeaaaaaaaagabaaaahaaaaaadiaaaaajlcaabaaaaaaaaaaa
kgikcaaaaaaaaaaaakaaaaaaegiicaaaaaaaaaaaaoaaaaaadiaaaaahlcaabaaa
aaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaa
egambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaa
aaaaaaaabbaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaak
bcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaa
aaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalk
olpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaa
egaabaaaacaaaaaaagiacaaaaaaaaaaaapaaaaaadcaaaaalicaabaaaabaaaaaa
bkiacaiaebaaaaaaaaaaaaaaapaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadp
diaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaai
dcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaabbaaaaaadcaaaaal
dcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaabaaaaaaaogikcaaa
aaaaaaaabaaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
aeaaaaaaaagabaaaahaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaa
acaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaa
adaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaadaaaaaa
aagabaaaadaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaa
adaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaa
akaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaa
aaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaajpcaabaaa
aeaaaaaaegaabaaaaeaaaaaaeghobaaaafaaaaaaaagabaaaafaaaaaadiaaaaai
hcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaakaaaaaacpaaaaaf
hcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaa
aeaaaaaafgifcaaaaaaaaaaabbaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaa
aeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaa
aeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaaaaaaaaaa
egaibaaaadaaaaaadcaaaaamhcaabaaaadaaaaaapgipcaaaacaaaaaaaaaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaa
abaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaa
adaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaaaaaaaaaagabaaaagaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaa
afaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaa
egbcbaaaafaaaaaadcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaa
aeaaaaaaegacbaaaagaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaa
egaabaaaafaaaaaaddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaa
aeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaa
ahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
abaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaoaaaaahgcaabaaa
abaaaaaaagbbbaaaagaaaaaapgbpbaaaagaaaaaaaaaaaaakgcaabaaaabaaaaaa
fgagbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaadpaaaaaadpaaaaaaaaefaaaaaj
pcaabaaaadaaaaaajgafbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
dbaaaaahccaabaaaabaaaaaaabeaaaaaaaaaaaaackbabaaaagaaaaaaabaaaaah
ccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahccaabaaa
abaaaaaadkaabaaaadaaaaaabkaabaaaabaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaakgakbaaa
abaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahccaabaaaabaaaaaa
bkaabaaaabaaaaaaakaabaaaadaaaaaaaoaaaaahhcaabaaaadaaaaaaegbcbaaa
ahaaaaaapgbpbaaaahaaaaaaehaaaaalecaabaaaabaaaaaaegaabaaaadaaaaaa
aghabaaaahaaaaaaaagabaaaaaaaaaaackaabaaaadaaaaaaaaaaaaajicaabaaa
abaaaaaaakiacaiaebaaaaaaadaaaaaabiaaaaaaabeaaaaaaaaaiadpdcaaaaak
ecaabaaaabaaaaaackaabaaaabaaaaaadkaabaaaabaaaaaaakiacaaaadaaaaaa
biaaaaaaapaaaaahccaabaaaabaaaaaafgafbaaaabaaaaaakgakbaaaabaaaaaa
diaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaa
diaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaajgahbaaaabaaaaaaagaabaaaabaaaaaadiaaaaahhcaabaaa
aaaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajicaabaaaaaaaaaaa
akiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaaaaaaiadpdiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgapbaaaaaaaaaaadcaaaaaldcaabaaaadaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
efaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaagaaaaaaaagabaaa
aeaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaaadaaaaaaegiccaaaaaaaaaaa
alaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 95 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_MainTex_ST]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"3.0-!!ARBfp1.0
PARAM c[22] = { program.local[0..18],
		{ 2, 1, 0, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MAD R0.xy, fragment.texcoord[0], c[11], c[11].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[19].x, -c[19].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.w, R1.x, R1.y;
MUL R2.xyz, R0.y, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[19].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R1, R0;
DP3 R0.x, R2, R2;
RSQ R0.w, R0.x;
MUL R2.xyz, R0.w, R2;
ADD R0.xyz, -fragment.texcoord[1], c[0];
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R2.w, R0, R0;
DP3 R1.w, R1, R1;
RSQ R1.w, R1.w;
RSQ R2.w, R2.w;
MOV R0.w, c[21].y;
MUL R0.xyz, R2.w, R0;
MUL R1.xyz, R1.w, R1;
ADD R3.xyz, R1, R0;
DP3 R1.w, R3, R3;
RSQ R1.w, R1.w;
MUL R3.xyz, R1.w, R3;
MUL R0.w, R0, c[4].x;
ADD R1.w, R0, c[19].y;
DP3 R0.w, R2, R3;
DP3 R3.x, fragment.texcoord[3], R0;
DP3 R3.y, fragment.texcoord[4], R0;
TXP R0.x, fragment.texcoord[5], texture[1], 2D;
MUL R6.xy, R3, -c[14].x;
MUL R0.x, R0, c[19];
MUL R3.xyz, R0.x, c[2];
MAX R0.w, R0, c[19].z;
EX2 R1.w, R1.w;
POW R1.w, R0.w, R1.w;
MAD R0.zw, R6.xyxy, c[19].w, fragment.texcoord[0].xyxy;
ADD R0.zw, R0, -c[20].x;
MUL R0.xy, R0.w, c[20].wyzw;
MAD R0.xy, R0.z, c[20].yzzw, R0;
MOV R0.w, c[14].x;
MUL R0.z, R0.w, -c[21].x;
ADD R0.xy, R0, c[20].x;
MUL R0.w, R0, c[20].x;
MUL R5.xyz, R3, R1.w;
ADD R0.z, R0, c[19].y;
MUL R0.xy, R0, c[13].x;
MUL R4.xy, R0, R0.z;
MUL R6.zw, R4.xyxy, c[18].x;
MAD R0.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R0.xyz, R0, texture[4], 2D;
MUL R0.xyz, R0, c[8].x;
MAD R4.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R4.xyz, R4, texture[2], 2D;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R7.xyz, R4, -R0, R0;
MAD R0.xy, R6.zwzw, c[15], c[15].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
ADD R0.xyz, -R0, c[19].y;
MAX R4.xyz, R0, R4;
ADD R0.w, R0, c[19].y;
MAD R6.xy, -R6, c[19].w, fragment.texcoord[0];
MUL R6.xy, R6, R0.w;
DP3 R0.w, R2, R1;
MAX R1.x, R0.w, c[19].z;
MUL R6.xy, R6, c[13].x;
MAD R0.xy, R6, c[15], c[15].zwzw;
MOV R6.xyz, c[12];
MOV R0.w, c[19].y;
MAD R2.xy, fragment.texcoord[0], c[5], c[5].zwzw;
MUL R4.xyz, R4, c[7].x;
MUL R1.xyz, R1.x, R3;
ADD R0.w, R0, -c[7].x;
TEX R0.xyz, R0, texture[3], 2D;
MUL R6.xyz, R6, c[9].x;
MUL R0.xyz, R6, R0;
POW R0.x, R0.x, c[16].x;
POW R0.z, R0.z, c[16].x;
POW R0.y, R0.y, c[16].x;
MAD R0.xyz, R4, -R0, R0;
ADD R0.xyz, R0, R7;
MUL R0.xyz, R5, R0;
MUL R3.xyz, R0.w, R4;
TEX R2.xyz, R2, texture[5], 2D;
MAD R2.xyz, R2, c[10], R3;
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[19].z;
END
# 95 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 107 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_MainTex_ST]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c19, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c20, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c21, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c22, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
mad r0.xy, v0, c11, c11.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c19.x, c19.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
mad r0.xyz, r0.x, v3, r2
mad_pp r2.xyz, -v1, c1.w, c1
dp3_pp r1.w, r2, r2
rsq_pp r1.w, r1.w
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c19
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
mul_pp r2.xyz, r1.w, r2
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r0
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
dp3 r2.w, r0, r0
rsq r0.w, r0.w
rsq r2.w, r2.w
mul r0.xyz, r2.w, r0
add r3.xyz, r2, r0
mul r1.xyz, r0.w, r1
dp3 r1.w, r3, r3
rsq r0.w, r1.w
mul r3.xyz, r0.w, r3
dp3 r0.w, r1, r3
mov r1.w, c4.x
mad r1.w, r1, c22.z, c22.y
exp r1.w, r1.w
max r0.w, r0, c19.z
pow r3, r0.w, r1.w
texldp r4.x, v5, s1
mul_pp r0.w, r4.x, c19.x
mul r4.xyz, r0.w, c2
dp3 r0.w, v4, r0
dp3 r0.z, v3, r0
mov r1.w, r3.x
mul r5.xy, r0.zwzw, -c14.x
mad r3.xy, r5, c20.x, v0
add r8.xy, r3, c20.y
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s4
mul r7.xyz, r0, c8.x
pow r3, r7.y, c17.x
pow r0, r7.x, c17.x
mov r7.x, r0
pow r0, r7.z, c17.x
mov r7.z, r0
mov r0.z, c14.x
mul r5.zw, r8.y, c20
mul r6.xyz, r4, r1.w
mov r7.y, r3
mad r0.xy, v0, c3, c3.zwzw
texld r3.xyz, r0, s2
mad r0.xy, r8.x, c21, r5.zwzw
add r0.xy, r0, c21.z
mad r7.xyz, r3, -r7, r7
mad r0.z, r0, c22.x, c22.y
mul r0.xy, r0, c13.x
mul r0.xy, r0, r0.z
mov r0.z, c14.x
mad r1.w, r0.z, c21.z, c21
mad r0.zw, -r5.xyxy, c20.x, v0.xyxy
mul r0.zw, r0, r1.w
mul r5.xy, r0.zwzw, c13.x
mov r0.w, c9.x
mul r0.xy, r0, c18.x
mad r0.xy, r0, c15, c15.zwzw
mad r5.xy, r5, c15, c15.zwzw
texld r0.xyz, r0, s3
texld r5.xyz, r5, s3
mul r8.xyz, c12, r0.w
mul r8.xyz, r8, r5
add r5.xyz, -r0, c19.w
pow r0, r8.x, c16.x
max r3.xyz, r5, r3
mul r5.xyz, r3, c7.x
pow r3, r8.y, c16.x
mov r8.x, r0
pow r0, r8.z, c16.x
dp3 r0.w, r1, r2
mov r8.y, r3
mov r8.z, r0
mad r0.xyz, r5, -r8, r8
add r0.xyz, r0, r7
mul r1.xyz, r6, r0
max r0.x, r0.w, c19.z
mov r0.y, c7.x
add r0.z, c19.w, -r0.y
mul r2.xyz, r0.x, r4
mul r3.xyz, r0.z, r5
mad r0.xy, v0, c5, c5.zwzw
texld r0.xyz, r0, s5
mad r0.xyz, r0, c10, r3
mad oC0.xyz, r2, r0, r1
mov_pp oC0.w, c19.z
"
}
SubProgram "d3d11 " {
// Stats: 81 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
SetTexture 0 [_Normalmap] 2D 4
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [_Mask] 2D 1
SetTexture 3 [_Glittermap] 2D 5
SetTexture 4 [_Specularglitter] 2D 3
SetTexture 5 [_MainTex] 2D 2
ConstBuffer "$Globals" 288
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Vector 192 [_Normalmap_ST]
Vector 224 [_Glittercolor]
Float 240 [_Glitterymaskdotsscale]
Float 244 [_Glitteryspeed01]
Vector 256 [_Glittermap_ST]
Float 272 [_Glittercontrast13]
Float 276 [_Specularcontrast13]
Float 280 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedlpkiiokomlhcocdkilaoifkdapcpmpdgabaaaaaajaanaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfiamaaaaeaaaaaaabgadaaaa
fjaaaaaeegiocaaaaaaaaaaabcaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadlcbabaaaagaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaadiaaaaaldcaabaaaaaaaaaaa
fgifcaaaaaaaaaaaapaaaaaaaceaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaaa
aaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaa
aeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaa
aeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaa
egacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaaagafbaaaaaaaaaaaegaebaaa
adaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaa
apaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaahdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaakdcaabaaaacaaaaaaogakbaaa
acaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaaapaaaaaadcaaaaaldcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaabaaaaaaaogikcaaaaaaaaaaa
baaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaaaaaaaaaeghobaaaadaaaaaa
aagabaaaafaaaaaadiaaaaajlcaabaaaaaaaaaaakgikcaaaaaaaaaaaakaaaaaa
egiicaaaaaaaaaaaaoaaaaaadiaaaaahlcaabaaaaaaaaaaaegaibaaaadaaaaaa
egambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaadiaaaaai
lcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaaaaaaaaaabbaaaaaabjaaaaaf
lcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaakbcaabaaaadaaaaaaegaabaaa
acaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaa
adaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaa
aaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaaagiacaaa
aaaaaaaaapaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaa
apaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaaacaaaaaa
pgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaa
acaaaaaakgikcaaaaaaaaaaabbaaaaaadcaaaaaldcaabaaaacaaaaaaegaabaaa
acaaaaaaegiacaaaaaaaaaaabaaaaaaaogikcaaaaaaaaaaabaaaaaaaefaaaaaj
pcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaadaaaaaaaagabaaaafaaaaaa
aaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaaacaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaadaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaadeaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaaklcaabaaa
aaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaa
dcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaajaaaaaa
ogikcaaaaaaaaaaaajaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaa
eghobaaaaeaaaaaaaagabaaaadaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaa
aeaaaaaafgifcaaaaaaaaaaaakaaaaaacpaaaaafhcaabaaaaeaaaaaaegacbaaa
aeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaa
bbaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaa
adaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaaaeaaaaaaegacbaaaaeaaaaaa
aaaaaaahlcaabaaaaaaaaaaaegambaaaaaaaaaaaegaibaaaadaaaaaadcaaaaam
hcaabaaaadaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaadaaaaaa
egacbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaadaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
aeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaldcaabaaaafaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaa
efaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaaaaaaaaaaagabaaa
aeaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaaafaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
diaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaaegbcbaaaafaaaaaadcaaaaaj
hcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaaaeaaaaaaegacbaaaagaaaaaa
apaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaaegaabaaaafaaaaaaddaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiecaabaaa
aaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaa
aeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaa
abaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaadeaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
dcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaacaeb
abeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaabaaaaaabjaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaaaoaaaaahgcaabaaaabaaaaaaagbbbaaaagaaaaaa
pgbpbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaajgafbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaabaaaaaaakaabaaaadaaaaaa
akaabaaaadaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaaagijcaaa
aaaaaaaaafaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaajgahbaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaaagaabaaaabaaaaaa
diaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaaj
icaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaaaaaaiadp
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaaaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaa
aaaaaaaaaiaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
afaaaaaaaagabaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaaadaaaaaa
egiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 97 math, 8 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_MainTex_ST]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"3.0-!!ARBfp1.0
PARAM c[22] = { program.local[0..18],
		{ 2, 1, 0, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MAD R0.xy, fragment.texcoord[0], c[11], c[11].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[19].x, -c[19].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.w, R1.x, R1.y;
MUL R2.xyz, R0.y, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[19].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R1, R0;
DP3 R0.x, R2, R2;
RSQ R0.w, R0.x;
MUL R2.xyz, R0.w, R2;
ADD R0.xyz, -fragment.texcoord[1], c[0];
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R2.w, R0, R0;
DP3 R1.w, R1, R1;
RSQ R1.w, R1.w;
RSQ R2.w, R2.w;
MOV R0.w, c[21].y;
MUL R0.xyz, R2.w, R0;
MUL R1.xyz, R1.w, R1;
ADD R3.xyz, R1, R0;
DP3 R1.w, R3, R3;
RSQ R1.w, R1.w;
MUL R3.xyz, R1.w, R3;
MUL R0.w, R0, c[4].x;
ADD R1.w, R0, c[19].y;
DP3 R0.w, R2, R3;
DP3 R3.x, fragment.texcoord[3], R0;
DP3 R3.y, fragment.texcoord[4], R0;
MUL R6.xy, R3, -c[14].x;
MAX R0.w, R0, c[19].z;
EX2 R1.w, R1.w;
POW R1.w, R0.w, R1.w;
TXP R0.x, fragment.texcoord[6], texture[1], 2D;
TEX R0.w, fragment.texcoord[5], texture[2], 2D;
MUL R0.z, R0.w, R0.x;
MAD R0.xy, R6, c[19].w, fragment.texcoord[0];
MUL R3.xyz, R0.z, c[2];
ADD R0.zw, R0.xyxy, -c[20].x;
MUL R0.xy, R0.w, c[20].wyzw;
MUL R3.xyz, R3, c[19].x;
MAD R0.xy, R0.z, c[20].yzzw, R0;
MOV R0.w, c[14].x;
MUL R0.z, R0.w, -c[21].x;
ADD R0.xy, R0, c[20].x;
MUL R0.w, R0, c[20].x;
MUL R5.xyz, R3, R1.w;
ADD R0.z, R0, c[19].y;
MUL R0.xy, R0, c[13].x;
MUL R4.xy, R0, R0.z;
MUL R6.zw, R4.xyxy, c[18].x;
MAD R0.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R0.xyz, R0, texture[5], 2D;
MUL R0.xyz, R0, c[8].x;
MAD R4.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R4.xyz, R4, texture[3], 2D;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R7.xyz, R4, -R0, R0;
MAD R0.xy, R6.zwzw, c[15], c[15].zwzw;
TEX R0.xyz, R0, texture[4], 2D;
ADD R0.xyz, -R0, c[19].y;
MAX R4.xyz, R0, R4;
ADD R0.w, R0, c[19].y;
MAD R6.xy, -R6, c[19].w, fragment.texcoord[0];
MUL R6.xy, R6, R0.w;
DP3 R0.w, R2, R1;
MAX R1.x, R0.w, c[19].z;
MUL R6.xy, R6, c[13].x;
MAD R0.xy, R6, c[15], c[15].zwzw;
MOV R6.xyz, c[12];
MOV R0.w, c[19].y;
MAD R2.xy, fragment.texcoord[0], c[5], c[5].zwzw;
MUL R4.xyz, R4, c[7].x;
MUL R1.xyz, R1.x, R3;
ADD R0.w, R0, -c[7].x;
TEX R0.xyz, R0, texture[4], 2D;
MUL R6.xyz, R6, c[9].x;
MUL R0.xyz, R6, R0;
POW R0.x, R0.x, c[16].x;
POW R0.z, R0.z, c[16].x;
POW R0.y, R0.y, c[16].x;
MAD R0.xyz, R4, -R0, R0;
ADD R0.xyz, R0, R7;
MUL R0.xyz, R5, R0;
MUL R3.xyz, R0.w, R4;
TEX R2.xyz, R2, texture[6], 2D;
MAD R2.xyz, R2, c[10], R3;
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[19].z;
END
# 97 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 108 math, 8 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_MainTex_ST]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c19, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c20, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c21, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c22, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xy
dcl_texcoord6 v6
mad r0.xy, v0, c11, c11.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c19.x, c19.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
mad r0.xyz, r0.x, v3, r2
add r2.xyz, -v1, c0
dp3 r2.w, r2, r2
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c19
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
rsq r2.w, r2.w
mul r3.xyz, r2.w, r2
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r0
mad_pp r0.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
dp3_pp r1.w, r0, r0
rsq_pp r1.w, r1.w
mul_pp r2.xyz, r1.w, r0
add r0.xyz, r2, r3
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mul r0.xyz, r0.w, r0
dp3 r0.x, r1, r0
mov r1.w, c4.x
mad r0.w, r1, c22.z, c22.y
exp r0.y, r0.w
max r0.x, r0, c19.z
pow r4, r0.x, r0.y
texld r0.w, v5, s2
texldp r0.x, v6, s1
mul r0.x, r0.w, r0
mul r0.xyz, r0.x, c2
mov r0.w, r4.x
mul r4.xyz, r0, c19.x
mul r6.xyz, r4, r0.w
dp3 r0.w, v4, r3
dp3 r0.z, v3, r3
mul r5.xy, r0.zwzw, -c14.x
mad r3.xy, r5, c20.x, v0
add r8.xy, r3, c20.y
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s5
mul r7.xyz, r0, c8.x
pow r3, r7.y, c17.x
pow r0, r7.x, c17.x
mov r7.x, r0
pow r0, r7.z, c17.x
mov r7.z, r0
mov r0.z, c14.x
mul r5.zw, r8.y, c20
mov r7.y, r3
mad r0.xy, v0, c3, c3.zwzw
texld r3.xyz, r0, s3
mad r0.xy, r8.x, c21, r5.zwzw
add r0.xy, r0, c21.z
mad r7.xyz, r3, -r7, r7
mad r0.z, r0, c22.x, c22.y
mul r0.xy, r0, c13.x
mul r0.xy, r0, r0.z
mov r0.z, c14.x
mad r1.w, r0.z, c21.z, c21
mad r0.zw, -r5.xyxy, c20.x, v0.xyxy
mul r0.zw, r0, r1.w
mul r5.xy, r0.zwzw, c13.x
mov r0.w, c9.x
mul r0.xy, r0, c18.x
mad r0.xy, r0, c15, c15.zwzw
mad r5.xy, r5, c15, c15.zwzw
texld r0.xyz, r0, s4
texld r5.xyz, r5, s4
mul r8.xyz, c12, r0.w
mul r8.xyz, r8, r5
add r5.xyz, -r0, c19.w
pow r0, r8.x, c16.x
max r3.xyz, r5, r3
mul r5.xyz, r3, c7.x
pow r3, r8.y, c16.x
mov r8.x, r0
pow r0, r8.z, c16.x
dp3 r0.w, r1, r2
mov r8.y, r3
mov r8.z, r0
mad r0.xyz, r5, -r8, r8
add r0.xyz, r0, r7
mul r1.xyz, r6, r0
max r0.x, r0.w, c19.z
mov r0.y, c7.x
add r0.z, c19.w, -r0.y
mul r2.xyz, r0.x, r4
mul r3.xyz, r0.z, r5
mad r0.xy, v0, c5, c5.zwzw
texld r0.xyz, r0, s6
mad r0.xyz, r0, c10, r3
mad oC0.xyz, r2, r0, r1
mov_pp oC0.w, c19.z
"
}
SubProgram "d3d11 " {
// Stats: 81 math, 8 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
SetTexture 0 [_Normalmap] 2D 5
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 0
SetTexture 3 [_Mask] 2D 2
SetTexture 4 [_Glittermap] 2D 6
SetTexture 5 [_Specularglitter] 2D 4
SetTexture 6 [_MainTex] 2D 3
ConstBuffer "$Globals" 352
Vector 144 [_LightColor0]
Vector 160 [_Mask_ST]
Float 176 [_Shininess]
Vector 192 [_MainTex_ST]
Vector 208 [_Specularglitter_ST]
Float 224 [_MasktransparencyDebug]
Float 228 [_Specularpower05]
Float 232 [_Glitterpower]
Vector 240 [_Color]
Vector 256 [_Normalmap_ST]
Vector 288 [_Glittercolor]
Float 304 [_Glitterymaskdotsscale]
Float 308 [_Glitteryspeed01]
Vector 320 [_Glittermap_ST]
Float 336 [_Glittercontrast13]
Float 340 [_Specularcontrast13]
Float 344 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedfpeafnhmpaihdacfehfaoldpnpgfpdclabaaaaaapeanaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaaneaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaagaaaaaaapalaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefckeamaaaaeaaaaaaacjadaaaafjaaaaaeegiocaaa
aaaaaaaabgaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaaagaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaae
aahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaae
aahabaaaagaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadlcbabaaaagaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaadiaaaaaldcaabaaaaaaaaaaa
fgifcaaaaaaaaaaabdaaaaaaaceaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaaa
aaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaa
aeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaa
aeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaa
egacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaaagafbaaaaaaaaaaaegaebaaa
adaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaa
bdaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaahdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaakdcaabaaaacaaaaaaogakbaaa
acaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaabdaaaaaadcaaaaaldcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaabeaaaaaaogikcaaaaaaaaaaa
beaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaaaaaaaaaeghobaaaaeaaaaaa
aagabaaaagaaaaaadiaaaaajlcaabaaaaaaaaaaakgikcaaaaaaaaaaaaoaaaaaa
egiicaaaaaaaaaaabcaaaaaadiaaaaahlcaabaaaaaaaaaaaegaibaaaadaaaaaa
egambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaadiaaaaai
lcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaaaaaaaaaabfaaaaaabjaaaaaf
lcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaakbcaabaaaadaaaaaaegaabaaa
acaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaa
adaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaa
aaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaaagiacaaa
aaaaaaaabdaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaa
bdaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaaacaaaaaa
pgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaa
acaaaaaakgikcaaaaaaaaaaabfaaaaaadcaaaaaldcaabaaaacaaaaaaegaabaaa
acaaaaaaegiacaaaaaaaaaaabeaaaaaaogikcaaaaaaaaaaabeaaaaaaefaaaaaj
pcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaa
aaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaaacaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaadaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaadeaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaaklcaabaaa
aaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaa
dcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaanaaaaaa
ogikcaaaaaaaaaaaanaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaa
eghobaaaafaaaaaaaagabaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaa
aeaaaaaafgifcaaaaaaaaaaaaoaaaaaacpaaaaafhcaabaaaaeaaaaaaegacbaaa
aeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaa
bfaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaa
adaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaaaeaaaaaaegacbaaaaeaaaaaa
aaaaaaahlcaabaaaaaaaaaaaegambaaaaaaaaaaaegaibaaaadaaaaaadcaaaaam
hcaabaaaadaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaadaaaaaa
egacbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaadaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
aeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaldcaabaaaafaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaabaaaaaaaogikcaaaaaaaaaaabaaaaaaa
efaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaaaaaaaaaaagabaaa
afaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaaafaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
diaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaaegbcbaaaafaaaaaadcaaaaaj
hcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaaaeaaaaaaegacbaaaagaaaaaa
apaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaaegaabaaaafaaaaaaddaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiecaabaaa
aaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaa
aeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaa
abaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaadeaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
dcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaaalaaaaaaabeaaaaaaaaacaeb
abeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaabaaaaaabjaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaaaoaaaaahgcaabaaaabaaaaaaagbbbaaaagaaaaaa
pgbpbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaajgafbaaaabaaaaaaeghobaaa
acaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaaaeaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaaapaaaaahccaabaaaabaaaaaapgapbaaa
aeaaaaaaagaabaaaadaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaa
agijcaaaaaaaaaaaajaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaa
jgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaaagaabaaa
abaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaa
aaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaa
aaaaiadpdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaaaaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaagaaaaaaaagabaaaadaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaa
adaaaaaaegiccaaaaaaaaaaaapaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 105 math, 8 textures
Keywords { "POINT" "SHADOWS_CUBE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_Mask_ST]
Float 6 [_Shininess]
Vector 7 [_MainTex_ST]
Vector 8 [_Specularglitter_ST]
Float 9 [_MasktransparencyDebug]
Float 10 [_Specularpower05]
Float 11 [_Glitterpower]
Vector 12 [_Color]
Vector 13 [_Normalmap_ST]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"3.0-!!ARBfp1.0
PARAM c[25] = { program.local[0..20],
		{ 2, 1, 0, 0.97000003 },
		{ 1, 0.0039215689, 1.53787e-005, 6.0308629e-008 },
		{ 0.050000001, 0.5, -0.99999875, -0.001592548 },
		{ 0.001592548, -0.99999875, 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.x, R1, R1;
RSQ R0.w, R0.x;
MUL R2.xyz, R0.w, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
MAD R1.xy, fragment.texcoord[0], c[13], c[13].zwzw;
TEX R1.yw, R1, texture[0], 2D;
MAD R3.xy, R1.wyzw, c[21].x, -c[21].y;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
ADD R4.xyz, R2, R0;
MUL R5.xy, R3, R3;
MUL R1.xyz, R3.y, fragment.texcoord[4];
MAD R3.xyz, R3.x, fragment.texcoord[3], R1;
ADD_SAT R0.w, R5.x, R5.y;
DP3 R1.w, R4, R4;
RSQ R1.w, R1.w;
MUL R4.xyz, R1.w, R4;
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[21].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MOV R7.xyz, c[14];
RCP R0.w, R0.w;
MUL R1.xyz, R1.x, fragment.texcoord[2];
MAD R1.xyz, R0.w, R1, R3;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R1;
DP3 R0.w, R3, R4;
MAX R1.y, R0.w, c[21].z;
DP3 R0.w, fragment.texcoord[4], R0;
DP3 R0.z, fragment.texcoord[3], R0;
MOV R1.x, c[24].w;
MUL R5.xy, R0.zwzw, -c[16].x;
MUL R0.x, R1, c[6];
ADD R0.z, R0.x, c[21].y;
MAD R0.xy, R5, c[23].x, fragment.texcoord[0];
EX2 R0.z, R0.z;
POW R2.w, R1.y, R0.z;
ADD R0.xy, R0, -c[23].y;
MUL R0.zw, R0.y, c[24].xyxy;
MAD R0.xy, R0.x, c[23].zwzw, R0.zwzw;
MOV R1.w, c[16].x;
MUL R0.z, R1.w, -c[24];
ADD R0.xy, R0, c[23].y;
MUL R0.xy, R0, c[15].x;
ADD R0.z, R0, c[21].y;
MUL R0.zw, R0.xyxy, R0.z;
DP3 R0.x, fragment.texcoord[6], fragment.texcoord[6];
RSQ R1.z, R0.x;
MUL R1.xy, R0.zwzw, c[20].x;
TEX R0, fragment.texcoord[6], texture[1], CUBE;
DP4 R0.y, R0, c[22];
RCP R1.z, R1.z;
MUL R0.x, R1.z, c[2].w;
MAD R0.y, -R0.x, c[21].w, R0;
MOV R0.w, c[21].y;
CMP R0.y, R0, c[3].x, R0.w;
DP3 R0.x, fragment.texcoord[5], fragment.texcoord[5];
TEX R3.w, R0.x, texture[2], 2D;
MUL R0.z, R3.w, R0.y;
MAD R0.xy, R1, c[17], c[17].zwzw;
MUL R1.xyz, R0.z, c[4];
MUL R4.xyz, R1, c[21].x;
TEX R0.xyz, R0, texture[4], 2D;
ADD R1.xyz, -R0, c[21].y;
MUL R0.x, R1.w, c[23].y;
ADD R0.z, R0.x, c[21].y;
MAD R5.xy, -R5, c[23].x, fragment.texcoord[0];
MUL R5.xy, R5, R0.z;
MAD R0.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
MUL R5.xy, R5, c[15].x;
MAD R5.xy, R5, c[17], c[17].zwzw;
MAX R1.xyz, R1, R0;
TEX R5.xyz, R5, texture[4], 2D;
MUL R7.xyz, R7, c[11].x;
MUL R7.xyz, R7, R5;
MUL R5.xyz, R1, c[9].x;
MAD R1.xy, fragment.texcoord[0], c[8], c[8].zwzw;
TEX R1.xyz, R1, texture[5], 2D;
MUL R1.xyz, R1, c[10].x;
POW R1.x, R1.x, c[19].x;
POW R1.z, R1.z, c[19].x;
POW R1.y, R1.y, c[19].x;
MAD R0.xyz, R0, -R1, R1;
DP3 R1.x, R3, R2;
MAX R1.x, R1, c[21].z;
ADD R0.w, R0, -c[9].x;
MAD R2.xy, fragment.texcoord[0], c[7], c[7].zwzw;
MUL R6.xyz, R4, R2.w;
POW R7.x, R7.x, c[18].x;
POW R7.y, R7.y, c[18].x;
POW R7.z, R7.z, c[18].x;
MAD R7.xyz, R5, -R7, R7;
ADD R0.xyz, R7, R0;
MUL R0.xyz, R6, R0;
MUL R1.xyz, R1.x, R4;
MUL R3.xyz, R0.w, R5;
TEX R2.xyz, R2, texture[6], 2D;
MAD R2.xyz, R2, c[12], R3;
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[21].z;
END
# 105 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 117 math, 8 textures
Keywords { "POINT" "SHADOWS_CUBE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_Mask_ST]
Float 6 [_Shininess]
Vector 7 [_MainTex_ST]
Vector 8 [_Specularglitter_ST]
Float 9 [_MasktransparencyDebug]
Float 10 [_Specularpower05]
Float 11 [_Glitterpower]
Vector 12 [_Color]
Vector 13 [_Normalmap_ST]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"ps_3_0
dcl_2d s0
dcl_cube s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c21, 2.00000000, -1.00000000, 0.00000000, 0.97000003
def c22, 1.00000000, 0.00392157, 0.00001538, 0.00000006
def c23, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c24, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c25, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
mad r0.xy, v0, c13, c13.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c21.x, c21.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
mad r0.xyz, r0.x, v3, r2
add r2.xyz, -v1, c0
dp3 r1.w, r2, r2
rsq r1.w, r1.w
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c22.x
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
mul r3.xyz, r1.w, r2
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r0
mad r0.xyz, -v1, c1.w, c1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r2.xyz, r0.w, r0
add r0.xyz, r2, r3
dp3 r0.w, r1, r1
dp3 r1.w, r0, r0
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
rsq r1.w, r1.w
mul r0.xyz, r1.w, r0
dp3 r0.x, r1, r0
max r0.y, r0.x, c21.z
mov r0.w, c6.x
mad r0.z, r0.w, c25, c25.y
exp r0.z, r0.z
pow r4, r0.y, r0.z
dp3 r0.x, v6, v6
rsq r1.w, r0.x
texld r0, v6, s1
dp4 r0.y, r0, c22
rcp r1.w, r1.w
mul r0.x, r1.w, c2.w
mad r0.y, -r0.x, c21.w, r0
mov r0.z, c3.x
dp3 r0.x, v5, v5
mov r0.w, r4.x
cmp r0.y, r0, c22.x, r0.z
texld r0.x, r0.x, s2
mul r0.x, r0, r0.y
mul r0.xyz, r0.x, c4
mul r4.xyz, r0, c21.x
mul r6.xyz, r4, r0.w
dp3 r0.w, v4, r3
dp3 r0.z, v3, r3
mul r5.xy, r0.zwzw, -c16.x
mad r3.xy, r5, c23.x, v0
add r8.xy, r3, c23.y
mad r0.xy, v0, c8, c8.zwzw
texld r0.xyz, r0, s5
mul r7.xyz, r0, c10.x
pow r3, r7.y, c19.x
pow r0, r7.x, c19.x
mov r7.x, r0
pow r0, r7.z, c19.x
mov r7.z, r0
mov r0.z, c16.x
mul r5.zw, r8.y, c23
mov r7.y, r3
mad r0.xy, v0, c5, c5.zwzw
texld r3.xyz, r0, s3
mad r0.xy, r8.x, c24, r5.zwzw
add r0.xy, r0, c24.z
mad r7.xyz, r3, -r7, r7
mad r0.z, r0, c25.x, c25.y
mul r0.xy, r0, c15.x
mul r0.xy, r0, r0.z
mov r0.z, c16.x
mad r1.w, r0.z, c24.z, c24
mad r0.zw, -r5.xyxy, c23.x, v0.xyxy
mul r0.zw, r0, r1.w
mul r5.xy, r0.zwzw, c15.x
mov r0.w, c11.x
mul r0.xy, r0, c20.x
mad r0.xy, r0, c17, c17.zwzw
mad r5.xy, r5, c17, c17.zwzw
texld r0.xyz, r0, s4
texld r5.xyz, r5, s4
mul r8.xyz, c14, r0.w
mul r8.xyz, r8, r5
add r5.xyz, -r0, c22.x
pow r0, r8.x, c18.x
max r3.xyz, r5, r3
mul r5.xyz, r3, c9.x
pow r3, r8.y, c18.x
mov r8.x, r0
pow r0, r8.z, c18.x
dp3 r0.w, r1, r2
mov r8.y, r3
mov r8.z, r0
mad r0.xyz, r5, -r8, r8
add r0.xyz, r0, r7
mul r1.xyz, r6, r0
max r0.x, r0.w, c21.z
mov r0.y, c9.x
add r0.z, c22.x, -r0.y
mul r2.xyz, r0.x, r4
mul r3.xyz, r0.z, r5
mad r0.xy, v0, c7, c7.zwzw
texld r0.xyz, r0, s6
mad r0.xyz, r0, c12, r3
mad oC0.xyz, r2, r0, r1
mov_pp oC0.w, c21.z
"
}
SubProgram "d3d11 " {
// Stats: 87 math, 8 textures
Keywords { "POINT" "SHADOWS_CUBE" }
SetTexture 0 [_Normalmap] 2D 5
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_ShadowMapTexture] CUBE 0
SetTexture 3 [_Mask] 2D 2
SetTexture 4 [_Glittermap] 2D 6
SetTexture 5 [_Specularglitter] 2D 4
SetTexture 6 [_MainTex] 2D 3
ConstBuffer "$Globals" 288
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Vector 192 [_Normalmap_ST]
Vector 224 [_Glittercolor]
Float 240 [_Glitterymaskdotsscale]
Float 244 [_Glitteryspeed01]
Vector 256 [_Glittermap_ST]
Float 272 [_Glittercontrast13]
Float 276 [_Specularcontrast13]
Float 280 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 16 [_LightPositionRange]
ConstBuffer "UnityShadows" 416
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
"ps_4_0
eefiecednkbooahocemokomhmmaocejgcpiefifaabaaaaaanmaoaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcimanaaaaeaaaaaaagdadaaaafjaaaaaeegiocaaa
aaaaaaaabcaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaacaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaa
agaaaaaagcbaaaadhcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
ahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaapaaaaaaaceaaaaa
mnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaia
ebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaah
ccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaa
acaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaak
bcaabaaaaaaaaaaabkiacaaaaaaaaaaaapaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaa
aaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaapaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaabaaaaaaaogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaaaaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaadiaaaaajlcaabaaa
aaaaaaaakgikcaaaaaaaaaaaakaaaaaaegiicaaaaaaaaaaaaoaaaaaadiaaaaah
lcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaa
aaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaa
agiacaaaaaaaaaaabbaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
apaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaa
adaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
acaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaapaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaapaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaa
diaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaabbaaaaaa
dcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaabaaaaaaa
ogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaaeaaaaaaaagabaaaagaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaia
ebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
adaaaaaaaagabaaaacaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaakaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaafaaaaaaaagabaaaaeaaaaaa
diaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaakaaaaaa
cpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaabbaaaaaabjaaaaafhcaabaaaaeaaaaaa
egacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaia
ebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaa
aaaaaaaaegaibaaaadaaaaaadcaaaaamhcaabaaaadaaaaaapgipcaaaacaaaaaa
aaaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaah
icaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaa
egacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaa
aaaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaa
aaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaa
adaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
amaaaaaaogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaa
afaaaaaaeghobaaaaaaaaaaaaagabaaaafaaaaaadcaaaaapdcaabaaaafaaaaaa
hgapbaaaafaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaa
aaaaialpaaaaialpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaa
afaaaaaaegbcbaaaafaaaaaadcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaa
egbcbaaaaeaaaaaaegacbaaaagaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaa
afaaaaaaegaabaaaafaaaaaaddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
abeaaaaaaaaaiadpaaaaaaaiecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaaj
hcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaa
baaaaaahecaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaa
aaaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaa
adaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaa
deaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaa
aaaaaaaaahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaa
abaaaaaabkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
bkaabaaaabaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaabaaaaaah
ccaabaaaabaaaaaaegbcbaaaahaaaaaaegbcbaaaahaaaaaaelaaaaafccaabaaa
abaaaaaabkaabaaaabaaaaaadiaaaaaiccaabaaaabaaaaaabkaabaaaabaaaaaa
dkiacaaaacaaaaaaabaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaa
abeaaaaaomfbhidpefaaaaajpcaabaaaadaaaaaaegbcbaaaahaaaaaaeghobaaa
acaaaaaaaagabaaaaaaaaaaabbaaaaakecaabaaaabaaaaaaegaobaaaadaaaaaa
aceaaaaaaaaaiadpibiaiadlicabibdhafidibdddbaaaaahccaabaaaabaaaaaa
ckaabaaaabaaaaaabkaabaaaabaaaaaadhaaaaakccaabaaaabaaaaaabkaabaaa
abaaaaaaakiacaaaadaaaaaabiaaaaaaabeaaaaaaaaaiadpbaaaaaahecaabaaa
abaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaa
kgakbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaapaaaaahccaabaaa
abaaaaaaagaabaaaadaaaaaafgafbaaaabaaaaaadiaaaaaiocaabaaaabaaaaaa
fgafbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaadaaaaaa
kgakbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaa
abaaaaaaagaabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaa
egacbaaaadaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaa
akaaaaaaabeaaaaaaaaaiadpdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
pgapbaaaaaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaa
aaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaadaaaaaaeghobaaaagaaaaaaaagabaaaadaaaaaadcaaaaakhcaabaaa
acaaaaaaegacbaaaadaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_CUBE" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "POINT" "SHADOWS_CUBE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 107 math, 9 textures
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_Mask_ST]
Float 6 [_Shininess]
Vector 7 [_MainTex_ST]
Vector 8 [_Specularglitter_ST]
Float 9 [_MasktransparencyDebug]
Float 10 [_Specularpower05]
Float 11 [_Glitterpower]
Vector 12 [_Color]
Vector 13 [_Normalmap_ST]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"3.0-!!ARBfp1.0
PARAM c[25] = { program.local[0..20],
		{ 2, 1, 0, 0.97000003 },
		{ 1, 0.0039215689, 1.53787e-005, 6.0308629e-008 },
		{ 0.050000001, 0.5, -0.99999875, -0.001592548 },
		{ 0.001592548, -0.99999875, 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MAD R0.xy, fragment.texcoord[0], c[13], c[13].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[21].x, -c[21].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.w, R1.x, R1.y;
MUL R2.xyz, R0.y, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[21].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MOV R7.xyz, c[14];
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R0.xyz, R0.w, R1, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R0;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R1.w, R0, R0;
RSQ R1.w, R1.w;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R1;
MUL R0.xyz, R1.w, R0;
DP3 R1.x, fragment.texcoord[3], R0;
DP3 R1.y, fragment.texcoord[4], R0;
MUL R5.xy, R1, -c[16].x;
ADD R0.xyz, R2, R0;
MAD R1.xy, R5, c[23].x, fragment.texcoord[0];
ADD R1.zw, R1.xyxy, -c[23].y;
MUL R1.xy, R1.w, c[24];
MAD R1.xy, R1.z, c[23].zwzw, R1;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.z, R3, R0;
ADD R0.xy, R1, c[23].y;
MAX R0.w, R0.z, c[21].z;
MOV R0.z, c[24].w;
MUL R1.x, R0.z, c[6];
MOV R3.w, c[16].x;
MUL R0.z, R3.w, -c[24];
ADD R1.x, R1, c[21].y;
EX2 R1.x, R1.x;
DP3 R1.z, fragment.texcoord[6], fragment.texcoord[6];
POW R4.w, R0.w, R1.x;
ADD R0.z, R0, c[21].y;
MUL R0.xy, R0, c[15].x;
MUL R0.xy, R0, R0.z;
MUL R1.xy, R0, c[20].x;
TEX R0, fragment.texcoord[6], texture[1], CUBE;
DP4 R0.y, R0, c[22];
RSQ R1.z, R1.z;
RCP R0.x, R1.z;
MUL R0.x, R0, c[2].w;
MAD R0.x, -R0, c[21].w, R0.y;
MOV R1.w, c[21].y;
CMP R0.y, R0.x, c[3].x, R1.w;
DP3 R0.x, fragment.texcoord[5], fragment.texcoord[5];
TEX R2.w, R0.x, texture[2], 2D;
TEX R0.w, fragment.texcoord[5], texture[3], CUBE;
MUL R0.x, R2.w, R0.w;
MUL R0.z, R0.x, R0.y;
MAD R0.xy, R1, c[17], c[17].zwzw;
MUL R1.xyz, R0.z, c[4];
MUL R4.xyz, R1, c[21].x;
TEX R0.xyz, R0, texture[5], 2D;
ADD R1.xyz, -R0, c[21].y;
MUL R0.x, R3.w, c[23].y;
ADD R2.w, R0.x, c[21].y;
MAD R0.zw, -R5.xyxy, c[23].x, fragment.texcoord[0].xyxy;
MUL R5.xy, R0.zwzw, R2.w;
DP3 R0.w, R3, R2;
MAD R0.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R0.xyz, R0, texture[4], 2D;
MUL R5.xy, R5, c[15].x;
MAD R5.xy, R5, c[17], c[17].zwzw;
MAD R2.xy, fragment.texcoord[0], c[7], c[7].zwzw;
MAX R1.xyz, R1, R0;
TEX R5.xyz, R5, texture[5], 2D;
MUL R7.xyz, R7, c[11].x;
MUL R7.xyz, R7, R5;
MUL R5.xyz, R1, c[9].x;
MAD R1.xy, fragment.texcoord[0], c[8], c[8].zwzw;
TEX R1.xyz, R1, texture[6], 2D;
MUL R1.xyz, R1, c[10].x;
POW R1.x, R1.x, c[19].x;
POW R1.z, R1.z, c[19].x;
POW R1.y, R1.y, c[19].x;
MAD R0.xyz, R0, -R1, R1;
MAX R0.w, R0, c[21].z;
MUL R1.xyz, R0.w, R4;
ADD R0.w, R1, -c[9].x;
MUL R6.xyz, R4, R4.w;
POW R7.x, R7.x, c[18].x;
POW R7.y, R7.y, c[18].x;
POW R7.z, R7.z, c[18].x;
MAD R7.xyz, R5, -R7, R7;
ADD R0.xyz, R7, R0;
MUL R0.xyz, R6, R0;
MUL R3.xyz, R0.w, R5;
TEX R2.xyz, R2, texture[7], 2D;
MAD R2.xyz, R2, c[12], R3;
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[21].z;
END
# 107 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 118 math, 9 textures
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_Mask_ST]
Float 6 [_Shininess]
Vector 7 [_MainTex_ST]
Vector 8 [_Specularglitter_ST]
Float 9 [_MasktransparencyDebug]
Float 10 [_Specularpower05]
Float 11 [_Glitterpower]
Vector 12 [_Color]
Vector 13 [_Normalmap_ST]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"ps_3_0
dcl_2d s0
dcl_cube s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
def c21, 2.00000000, -1.00000000, 0.00000000, 0.97000003
def c22, 1.00000000, 0.00392157, 0.00001538, 0.00000006
def c23, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c24, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c25, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
mad r0.xy, v0, c13, c13.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c21.x, c21.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
mad r0.xyz, r0.x, v3, r2
add r2.xyz, -v1, c0
dp3 r2.w, r2, r2
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c22.x
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
rsq r2.w, r2.w
mul r3.xyz, r2.w, r2
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r0
mad r0.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
dp3 r1.w, r0, r0
rsq r1.w, r1.w
mul r2.xyz, r1.w, r0
add r0.xyz, r2, r3
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mul r0.xyz, r0.w, r0
dp3 r0.x, r1, r0
mov r1.w, c6.x
mad r0.w, r1, c25.z, c25.y
dp3 r1.w, v6, v6
exp r0.y, r0.w
max r0.x, r0, c21.z
pow r4, r0.x, r0.y
texld r0, v6, s1
dp4 r0.y, r0, c22
rsq r1.w, r1.w
rcp r0.x, r1.w
mul r0.x, r0, c2.w
mad r0.x, -r0, c21.w, r0.y
mov r0.z, c3.x
cmp r0.y, r0.x, c22.x, r0.z
dp3 r0.x, v5, v5
texld r0.w, v5, s3
texld r0.x, r0.x, s2
mul r0.x, r0, r0.w
mul r0.x, r0, r0.y
mul r0.xyz, r0.x, c4
mov r0.w, r4.x
mul r4.xyz, r0, c21.x
mul r6.xyz, r4, r0.w
dp3 r0.w, v4, r3
dp3 r0.z, v3, r3
mul r5.xy, r0.zwzw, -c16.x
mad r3.xy, r5, c23.x, v0
add r8.xy, r3, c23.y
mad r0.xy, v0, c8, c8.zwzw
texld r0.xyz, r0, s6
mul r7.xyz, r0, c10.x
pow r3, r7.y, c19.x
pow r0, r7.x, c19.x
mov r7.x, r0
pow r0, r7.z, c19.x
mov r7.z, r0
mov r0.z, c16.x
mul r5.zw, r8.y, c23
mov r7.y, r3
mad r0.xy, v0, c5, c5.zwzw
texld r3.xyz, r0, s4
mad r0.xy, r8.x, c24, r5.zwzw
add r0.xy, r0, c24.z
mad r7.xyz, r3, -r7, r7
mad r0.z, r0, c25.x, c25.y
mul r0.xy, r0, c15.x
mul r0.xy, r0, r0.z
mov r0.z, c16.x
mad r1.w, r0.z, c24.z, c24
mad r0.zw, -r5.xyxy, c23.x, v0.xyxy
mul r0.zw, r0, r1.w
mul r5.xy, r0.zwzw, c15.x
mov r0.w, c11.x
mul r0.xy, r0, c20.x
mad r0.xy, r0, c17, c17.zwzw
mad r5.xy, r5, c17, c17.zwzw
texld r0.xyz, r0, s5
texld r5.xyz, r5, s5
mul r8.xyz, c14, r0.w
mul r8.xyz, r8, r5
add r5.xyz, -r0, c22.x
pow r0, r8.x, c18.x
max r3.xyz, r5, r3
mul r5.xyz, r3, c9.x
pow r3, r8.y, c18.x
mov r8.x, r0
pow r0, r8.z, c18.x
dp3 r0.w, r1, r2
mov r8.y, r3
mov r8.z, r0
mad r0.xyz, r5, -r8, r8
add r0.xyz, r0, r7
mul r1.xyz, r6, r0
max r0.x, r0.w, c21.z
mov r0.y, c9.x
add r0.z, c22.x, -r0.y
mul r2.xyz, r0.x, r4
mul r3.xyz, r0.z, r5
mad r0.xy, v0, c7, c7.zwzw
texld r0.xyz, r0, s7
mad r0.xyz, r0, c12, r3
mad oC0.xyz, r2, r0, r1
mov_pp oC0.w, c21.z
"
}
SubProgram "d3d11 " {
// Stats: 88 math, 9 textures
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
SetTexture 0 [_Normalmap] 2D 6
SetTexture 1 [_LightTextureB0] 2D 2
SetTexture 2 [_LightTexture0] CUBE 1
SetTexture 3 [_ShadowMapTexture] CUBE 0
SetTexture 4 [_Mask] 2D 3
SetTexture 5 [_Glittermap] 2D 7
SetTexture 6 [_Specularglitter] 2D 5
SetTexture 7 [_MainTex] 2D 4
ConstBuffer "$Globals" 288
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Vector 192 [_Normalmap_ST]
Vector 224 [_Glittercolor]
Float 240 [_Glitterymaskdotsscale]
Float 244 [_Glitteryspeed01]
Vector 256 [_Glittermap_ST]
Float 272 [_Glittercontrast13]
Float 276 [_Specularcontrast13]
Float 280 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 16 [_LightPositionRange]
ConstBuffer "UnityShadows" 416
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
"ps_4_0
eefiecedaofbepobgmfomhjimilehjjhgkmpajhmabaaaaaadiapaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcoianaaaaeaaaaaaahkadaaaafjaaaaaeegiocaaa
aaaaaaaabcaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaacaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaa
acaaaaaaffffaaaafidaaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaa
agaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaa
gcbaaaadhcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaa
diaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaapaaaaaaaceaaaaamnmmemdn
mnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
bcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaa
adaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaa
agafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaa
aaaaaaaabkiacaaaaaaaaaaaapaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadp
diaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaak
dcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaa
apaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaa
baaaaaaaogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaa
aaaaaaaaeghobaaaafaaaaaaaagabaaaahaaaaaadiaaaaajlcaabaaaaaaaaaaa
kgikcaaaaaaaaaaaakaaaaaaegiicaaaaaaaaaaaaoaaaaaadiaaaaahlcaabaaa
aaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaa
egambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaa
aaaaaaaabbaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaak
bcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaa
aaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalk
olpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaa
egaabaaaacaaaaaaagiacaaaaaaaaaaaapaaaaaadcaaaaalicaabaaaabaaaaaa
bkiacaiaebaaaaaaaaaaaaaaapaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadp
diaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaai
dcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaabbaaaaaadcaaaaal
dcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaabaaaaaaaogikcaaa
aaaaaaaabaaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
afaaaaaaaagabaaaahaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaa
acaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaa
adaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaaeaaaaaa
aagabaaaadaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaa
adaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaa
akaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaa
aaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaajpcaabaaa
aeaaaaaaegaabaaaaeaaaaaaeghobaaaagaaaaaaaagabaaaafaaaaaadiaaaaai
hcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaakaaaaaacpaaaaaf
hcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaa
aeaaaaaafgifcaaaaaaaaaaabbaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaa
aeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaa
aeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaaaaaaaaaa
egaibaaaadaaaaaadcaaaaamhcaabaaaadaaaaaapgipcaaaacaaaaaaaaaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaa
abaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaa
adaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaaaaaaaaaagabaaaagaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaa
afaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaa
egbcbaaaafaaaaaadcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaa
aeaaaaaaegacbaaaagaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaa
egaabaaaafaaaaaaddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaa
aeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaa
ahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
abaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaabaaaaaahccaabaaa
abaaaaaaegbcbaaaahaaaaaaegbcbaaaahaaaaaaelaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaaiccaabaaaabaaaaaabkaabaaaabaaaaaadkiacaaa
acaaaaaaabaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaa
omfbhidpefaaaaajpcaabaaaadaaaaaaegbcbaaaahaaaaaaeghobaaaadaaaaaa
aagabaaaaaaaaaaabbaaaaakecaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
aaaaiadpibiaiadlicabibdhafidibdddbaaaaahccaabaaaabaaaaaackaabaaa
abaaaaaabkaabaaaabaaaaaadhaaaaakccaabaaaabaaaaaabkaabaaaabaaaaaa
akiacaaaadaaaaaabiaaaaaaabeaaaaaaaaaiadpbaaaaaahecaabaaaabaaaaaa
egbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaakgakbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaa
egbcbaaaagaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaadiaaaaahecaabaaa
abaaaaaaakaabaaaadaaaaaadkaabaaaaeaaaaaaapaaaaahccaabaaaabaaaaaa
kgakbaaaabaaaaaafgafbaaaabaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaa
abaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaa
aaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaa
agaabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaa
adaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaa
abeaaaaaaaaaiadpdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaa
aaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaa
adaaaaaaeghobaaaahaaaaaaaagabaaaaeaaaaaadcaaaaakhcaabaaaacaaaaaa
egacbaaaadaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaadcaaaaaj
hccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 117 math, 12 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_ShadowOffsets0]
Vector 4 [_ShadowOffsets1]
Vector 5 [_ShadowOffsets2]
Vector 6 [_ShadowOffsets3]
Vector 7 [_LightColor0]
Vector 8 [_Mask_ST]
Float 9 [_Shininess]
Vector 10 [_MainTex_ST]
Vector 11 [_Specularglitter_ST]
Float 12 [_MasktransparencyDebug]
Float 13 [_Specularpower05]
Float 14 [_Glitterpower]
Vector 15 [_Color]
Vector 16 [_Normalmap_ST]
Vector 17 [_Glittercolor]
Float 18 [_Glitterymaskdotsscale]
Float 19 [_Glitteryspeed01]
Vector 20 [_Glittermap_ST]
Float 21 [_Glittercontrast13]
Float 22 [_Specularcontrast13]
Float 23 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"3.0-!!ARBfp1.0
PARAM c[27] = { program.local[0..23],
		{ 2, 1, 0, 0.5 },
		{ 0.25, 0.050000001, -0.99999875, -0.001592548 },
		{ 0.001592548, -0.99999875, 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.x, R1, R1;
RSQ R0.w, R0.x;
MUL R2.xyz, R0.w, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
MAD R1.xy, fragment.texcoord[0], c[16], c[16].zwzw;
TEX R1.yw, R1, texture[0], 2D;
MAD R3.xy, R1.wyzw, c[24].x, -c[24].y;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
ADD R4.xyz, R2, R0;
MUL R5.xy, R3, R3;
MUL R1.xyz, R3.y, fragment.texcoord[4];
MAD R3.xyz, R3.x, fragment.texcoord[3], R1;
ADD_SAT R0.w, R5.x, R5.y;
DP3 R1.w, R4, R4;
RSQ R1.w, R1.w;
MUL R4.xyz, R1.w, R4;
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[24].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MOV R7.xyz, c[17];
RCP R1.w, fragment.texcoord[6].w;
RCP R0.w, R0.w;
MUL R1.xyz, R1.x, fragment.texcoord[2];
MAD R1.xyz, R0.w, R1, R3;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R1;
DP3 R0.w, R3, R4;
MAX R1.x, R0.w, c[24].z;
DP3 R0.w, fragment.texcoord[4], R0;
DP3 R0.z, fragment.texcoord[3], R0;
MUL R5.xy, R0.zwzw, -c[19].x;
MOV R0.x, c[26].w;
MUL R0.z, R0.x, c[9].x;
MAD R0.xy, R5, c[25].y, fragment.texcoord[0];
ADD R0.z, R0, c[24].y;
EX2 R1.y, R0.z;
ADD R0.xy, R0, -c[24].w;
MUL R0.zw, R0.y, c[26].xyxy;
MAD R0.xy, R0.x, c[25].zwzw, R0.zwzw;
MOV R3.w, c[19].x;
ADD R0.xy, R0, c[24].w;
MUL R0.z, R3.w, -c[26];
POW R1.z, R1.x, R1.y;
MAD R4.xy, fragment.texcoord[6], R1.w, c[5];
MUL R0.xy, R0, c[18].x;
ADD R0.z, R0, c[24].y;
MUL R0.zw, R0.xyxy, R0.z;
MAD R0.xy, fragment.texcoord[6], R1.w, c[6];
MUL R1.xy, R0.zwzw, c[23].x;
TEX R0.x, R0, texture[3], 2D;
MOV R0.w, R0.x;
TEX R0.x, R4, texture[3], 2D;
MAD R4.xy, fragment.texcoord[6], R1.w, c[4];
MOV R0.z, R0.x;
TEX R0.x, R4, texture[3], 2D;
MAD R4.xy, fragment.texcoord[6], R1.w, c[3];
MOV R0.y, R0.x;
TEX R0.x, R4, texture[3], 2D;
MAD R0, -fragment.texcoord[6].z, R1.w, R0;
MOV R2.w, c[24].y;
CMP R0, R0, c[2].x, R2.w;
DP4 R4.x, R0, c[25].x;
RCP R1.w, fragment.texcoord[5].w;
MAD R0.xy, fragment.texcoord[5], R1.w, c[24].w;
TEX R0.w, R0, texture[1], 2D;
DP3 R0.z, fragment.texcoord[5], fragment.texcoord[5];
SLT R0.x, c[24].z, fragment.texcoord[5].z;
TEX R1.w, R0.z, texture[2], 2D;
MUL R0.x, R0, R0.w;
MUL R0.x, R0, R1.w;
MUL R0.x, R0, R4;
MUL R0.w, R0.x, c[24].x;
MUL R4.xyz, R0.w, c[7];
MAD R1.xy, R1, c[20], c[20].zwzw;
TEX R0.xyz, R1, texture[5], 2D;
MUL R6.xyz, R4, R1.z;
ADD R1.xyz, -R0, c[24].y;
MAD R0.zw, -R5.xyxy, c[25].y, fragment.texcoord[0].xyxy;
MAD R1.w, R3, c[24], c[24].y;
MUL R5.xy, R0.zwzw, R1.w;
DP3 R0.w, R3, R2;
MAD R0.xy, fragment.texcoord[0], c[8], c[8].zwzw;
TEX R0.xyz, R0, texture[4], 2D;
MUL R5.xy, R5, c[18].x;
MAD R5.xy, R5, c[20], c[20].zwzw;
MAD R2.xy, fragment.texcoord[0], c[10], c[10].zwzw;
MAX R1.xyz, R1, R0;
TEX R5.xyz, R5, texture[5], 2D;
MUL R7.xyz, R7, c[14].x;
MUL R7.xyz, R7, R5;
MUL R5.xyz, R1, c[12].x;
MAD R1.xy, fragment.texcoord[0], c[11], c[11].zwzw;
TEX R1.xyz, R1, texture[6], 2D;
MUL R1.xyz, R1, c[13].x;
POW R1.x, R1.x, c[22].x;
POW R1.z, R1.z, c[22].x;
POW R1.y, R1.y, c[22].x;
MAD R0.xyz, R0, -R1, R1;
MAX R0.w, R0, c[24].z;
MUL R1.xyz, R0.w, R4;
ADD R0.w, R2, -c[12].x;
POW R7.x, R7.x, c[21].x;
POW R7.y, R7.y, c[21].x;
POW R7.z, R7.z, c[21].x;
MAD R7.xyz, R5, -R7, R7;
ADD R0.xyz, R7, R0;
MUL R0.xyz, R6, R0;
MUL R3.xyz, R0.w, R5;
TEX R2.xyz, R2, texture[7], 2D;
MAD R2.xyz, R2, c[15], R3;
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[24].z;
END
# 117 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 126 math, 12 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_ShadowOffsets0]
Vector 4 [_ShadowOffsets1]
Vector 5 [_ShadowOffsets2]
Vector 6 [_ShadowOffsets3]
Vector 7 [_LightColor0]
Vector 8 [_Mask_ST]
Float 9 [_Shininess]
Vector 10 [_MainTex_ST]
Vector 11 [_Specularglitter_ST]
Float 12 [_MasktransparencyDebug]
Float 13 [_Specularpower05]
Float 14 [_Glitterpower]
Vector 15 [_Color]
Vector 16 [_Normalmap_ST]
Vector 17 [_Glittercolor]
Float 18 [_Glitterymaskdotsscale]
Float 19 [_Glitteryspeed01]
Vector 20 [_Glittermap_ST]
Float 21 [_Glittercontrast13]
Float 22 [_Specularcontrast13]
Float 23 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
def c24, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c25, 0.50000000, 0.25000000, 0.05000000, -0.50000000
def c26, 0.00159374, -0.99999875, -0.00159374, 0
def c27, -0.31830987, 1.00000000, 10.00000000, 0.50000000
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
dcl_texcoord6 v6
mad r0.xyz, -v1, c1.w, c1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r2.xyz, r0.w, r0
add r1.xyz, -v1, c0
dp3 r0.z, r1, r1
mad r0.xy, v0, c16, c16.zwzw
rsq r0.z, r0.z
mul r3.xyz, r0.z, r1
texld r0.yw, r0, s0
mad_pp r1.xy, r0.wyzw, c24.x, c24.y
rcp r1.w, v6.w
add r4.xyz, r2, r3
mul r0.xyz, r1.y, v4
mul_pp r5.xy, r1, r1
mad r1.xyz, r1.x, v3, r0
add_pp_sat r0.x, r5, r5.y
add_pp r0.x, -r0, c24.w
rsq_pp r0.w, r0.x
dp3 r0.y, v2, v2
rsq r0.y, r0.y
mad r5.xy, v6, r1.w, c5
rcp_pp r0.w, r0.w
mul r0.xyz, r0.y, v2
mad r0.xyz, r0.w, r0, r1
dp3 r0.w, r0, r0
dp3 r1.x, r4, r4
rsq r1.x, r1.x
mul r4.xyz, r1.x, r4
rsq r0.w, r0.w
mul r1.xyz, r0.w, r0
dp3 r0.x, r1, r4
max r0.z, r0.x, c24
mov r0.y, c9.x
mad r0.x, r0.y, c27.z, c27.y
exp r0.w, r0.x
pow r4, r0.z, r0.w
mad r0.xy, v6, r1.w, c6
texld r0.x, r0, s3
mov r0.w, r0.x
texld r0.x, r5, s3
mad r5.xy, v6, r1.w, c4
mov r0.z, r0.x
texld r0.x, r5, s3
mad r5.xy, v6, r1.w, c3
mov r0.y, r0.x
texld r0.x, r5, s3
mad r0, -v6.z, r1.w, r0
rcp r1.w, v5.w
mov r2.w, c2.x
cmp r0, r0, c24.w, r2.w
dp4_pp r0.z, r0, c25.y
mad r5.xy, v5, r1.w, c25.x
dp3 r0.x, v5, v5
texld r0.w, r5, s1
cmp r0.y, -v5.z, c24.z, c24.w
mul_pp r0.y, r0, r0.w
texld r0.x, r0.x, s2
mul_pp r0.x, r0.y, r0
mul_pp r0.x, r0, r0.z
dp3 r0.w, v4, r3
dp3 r0.z, v3, r3
mul r5.xy, r0.zwzw, -c19.x
mad r3.xy, r5, c25.z, v0
add r8.xy, r3, c25.w
mov r0.y, r4.x
mul_pp r0.x, r0, c24
mul r4.xyz, r0.x, c7
mul r6.xyz, r4, r0.y
mad r0.xy, v0, c11, c11.zwzw
texld r0.xyz, r0, s6
mul r7.xyz, r0, c13.x
pow r3, r7.y, c22.x
pow r0, r7.x, c22.x
mov r7.x, r0
pow r0, r7.z, c22.x
mov r7.z, r0
mov r0.z, c19.x
mul r5.zw, r8.y, c26.xyxy
mov r7.y, r3
mad r0.xy, v0, c8, c8.zwzw
texld r3.xyz, r0, s4
mad r0.xy, r8.x, c26.yzzw, r5.zwzw
add r0.xy, r0, c25.x
mad r7.xyz, r3, -r7, r7
mad r0.z, r0, c27.x, c27.y
mul r0.xy, r0, c18.x
mul r0.xy, r0, r0.z
mov r0.z, c19.x
mad r1.w, r0.z, c27, c27.y
mad r0.zw, -r5.xyxy, c25.z, v0.xyxy
mul r0.zw, r0, r1.w
mul r5.xy, r0.zwzw, c18.x
mov r0.w, c14.x
mul r0.xy, r0, c23.x
mad r0.xy, r0, c20, c20.zwzw
mad r5.xy, r5, c20, c20.zwzw
texld r0.xyz, r0, s5
texld r5.xyz, r5, s5
mul r8.xyz, c17, r0.w
mul r8.xyz, r8, r5
add r5.xyz, -r0, c24.w
pow r0, r8.x, c21.x
max r3.xyz, r5, r3
mul r5.xyz, r3, c12.x
pow r3, r8.y, c21.x
mov r8.x, r0
pow r0, r8.z, c21.x
dp3 r0.w, r1, r2
mov r8.y, r3
mov r8.z, r0
mad r0.xyz, r5, -r8, r8
add r0.xyz, r0, r7
mul r1.xyz, r6, r0
max r0.x, r0.w, c24.z
mov r0.y, c12.x
add r0.z, c24.w, -r0.y
mul r2.xyz, r0.x, r4
mul r3.xyz, r0.z, r5
mad r0.xy, v0, c10, c10.zwzw
texld r0.xyz, r0, s7
mad r0.xyz, r0, c15, r3
mad oC0.xyz, r2, r0, r1
mov_pp oC0.w, c24.z
"
}
SubProgram "d3d11 " {
// Stats: 94 math, 12 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
SetTexture 0 [_Normalmap] 2D 6
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 0
SetTexture 4 [_Mask] 2D 3
SetTexture 5 [_Glittermap] 2D 7
SetTexture 6 [_Specularglitter] 2D 5
SetTexture 7 [_MainTex] 2D 4
ConstBuffer "$Globals" 352
Vector 16 [_ShadowOffsets0]
Vector 32 [_ShadowOffsets1]
Vector 48 [_ShadowOffsets2]
Vector 64 [_ShadowOffsets3]
Vector 144 [_LightColor0]
Vector 160 [_Mask_ST]
Float 176 [_Shininess]
Vector 192 [_MainTex_ST]
Vector 208 [_Specularglitter_ST]
Float 224 [_MasktransparencyDebug]
Float 228 [_Specularpower05]
Float 232 [_Glitterpower]
Vector 240 [_Color]
Vector 256 [_Normalmap_ST]
Vector 288 [_Glittercolor]
Float 304 [_Glitterymaskdotsscale]
Float 308 [_Glitteryspeed01]
Vector 320 [_Glittermap_ST]
Float 336 [_Glittercontrast13]
Float 340 [_Specularcontrast13]
Float 344 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityShadows" 416
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
"ps_4_0
eefiecedomgkmbnelbgmbgonkbcmkljfjohfdaciabaaaaaalebaaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcgeapaaaaeaaaaaaanjadaaaafjaaaaaeegiocaaa
aaaaaaaabgaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaa
agaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaaagaaaaaa
gcbaaaadpcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaa
diaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaabdaaaaaaaceaaaaamnmmemdn
mnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
bcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaa
adaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaa
agafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaa
aaaaaaaabkiacaaaaaaaaaaabdaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadp
diaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaak
dcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaa
bdaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaa
beaaaaaaogikcaaaaaaaaaaabeaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaa
aaaaaaaaeghobaaaafaaaaaaaagabaaaahaaaaaadiaaaaajlcaabaaaaaaaaaaa
kgikcaaaaaaaaaaaaoaaaaaaegiicaaaaaaaaaaabcaaaaaadiaaaaahlcaabaaa
aaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaa
egambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaa
aaaaaaaabfaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaak
bcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaa
aaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalk
olpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaa
egaabaaaacaaaaaaagiacaaaaaaaaaaabdaaaaaadcaaaaalicaabaaaabaaaaaa
bkiacaiaebaaaaaaaaaaaaaabdaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadp
diaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaai
dcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaabfaaaaaadcaaaaal
dcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaabeaaaaaaogikcaaa
aaaaaaaabeaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
afaaaaaaaagabaaaahaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaa
acaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaa
adaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaa
akaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaaeaaaaaa
aagabaaaadaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaa
adaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaa
aoaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaa
aaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaanaaaaaaogikcaaaaaaaaaaaanaaaaaaefaaaaajpcaabaaa
aeaaaaaaegaabaaaaeaaaaaaeghobaaaagaaaaaaaagabaaaafaaaaaadiaaaaai
hcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaaoaaaaaacpaaaaaf
hcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaa
aeaaaaaafgifcaaaaaaaaaaabfaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaa
aeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaa
aeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaaaaaaaaaa
egaibaaaadaaaaaadcaaaaamhcaabaaaadaaaaaapgipcaaaacaaaaaaaaaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaa
abaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaa
adaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaabaaaaaaa
ogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaaaaaaaaaagabaaaagaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaa
afaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaa
egbcbaaaafaaaaaadcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaa
aeaaaaaaegacbaaaagaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaa
egaabaaaafaaaaaaddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaa
aeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaa
alaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
abaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaoaaaaahocaabaaa
abaaaaaaagbjbaaaahaaaaaapgbpbaaaahaaaaaaaaaaaaaidcaabaaaadaaaaaa
jgafbaaaabaaaaaaegiacaaaaaaaaaaaabaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaadaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaaaaaaaaaidcaabaaa
aeaaaaaajgafbaaaabaaaaaaegiacaaaaaaaaaaaacaaaaaaefaaaaajpcaabaaa
aeaaaaaaegaabaaaaeaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaadgaaaaaf
ccaabaaaadaaaaaaakaabaaaaeaaaaaaaaaaaaaidcaabaaaaeaaaaaajgafbaaa
abaaaaaaegiacaaaaaaaaaaaadaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaa
aeaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaadgaaaaafecaabaaaadaaaaaa
akaabaaaaeaaaaaaaaaaaaaigcaabaaaabaaaaaafgagbaaaabaaaaaaagibcaaa
aaaaaaaaaeaaaaaaefaaaaajpcaabaaaaeaaaaaajgafbaaaabaaaaaaeghobaaa
adaaaaaaaagabaaaaaaaaaaadgaaaaaficaabaaaadaaaaaaakaabaaaaeaaaaaa
dbaaaaahpcaabaaaadaaaaaaegaobaaaadaaaaaapgapbaaaabaaaaaadhaaaaan
pcaabaaaadaaaaaaegaobaaaadaaaaaaagiacaaaadaaaaaabiaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpbbaaaaakccaabaaaabaaaaaaegaobaaa
adaaaaaaaceaaaaaaaaaiadoaaaaiadoaaaaiadoaaaaiadoaoaaaaahmcaabaaa
abaaaaaaagbebaaaagaaaaaapgbpbaaaagaaaaaaaaaaaaakmcaabaaaabaaaaaa
kgaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaadpaaaaaadpefaaaaaj
pcaabaaaadaaaaaaogakbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
dbaaaaahecaabaaaabaaaaaaabeaaaaaaaaaaaaackbabaaaagaaaaaaabaaaaah
ecaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahecaabaaa
abaaaaaadkaabaaaadaaaaaackaabaaaabaaaaaabaaaaaahicaabaaaabaaaaaa
egbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaapgapbaaa
abaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahecaabaaaabaaaaaa
ckaabaaaabaaaaaaakaabaaaadaaaaaaapaaaaahccaabaaaabaaaaaakgakbaaa
abaaaaaafgafbaaaabaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaa
agijcaaaaaaaaaaaajaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaa
jgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaaagaabaaa
abaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaa
aaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaa
aaaaiadpdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaaaaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaahaaaaaaaagabaaaaeaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaa
adaaaaaaegiccaaaaaaaaaaaapaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 117 math, 12 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_ShadowOffsets0]
Vector 4 [_ShadowOffsets1]
Vector 5 [_ShadowOffsets2]
Vector 6 [_ShadowOffsets3]
Vector 7 [_LightColor0]
Vector 8 [_Mask_ST]
Float 9 [_Shininess]
Vector 10 [_MainTex_ST]
Vector 11 [_Specularglitter_ST]
Float 12 [_MasktransparencyDebug]
Float 13 [_Specularpower05]
Float 14 [_Glitterpower]
Vector 15 [_Color]
Vector 16 [_Normalmap_ST]
Vector 17 [_Glittercolor]
Float 18 [_Glitterymaskdotsscale]
Float 19 [_Glitteryspeed01]
Vector 20 [_Glittermap_ST]
Float 21 [_Glittercontrast13]
Float 22 [_Specularcontrast13]
Float 23 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"3.0-!!ARBfp1.0
OPTION ARB_fragment_program_shadow;
PARAM c[27] = { program.local[0..23],
		{ 2, 1, 0, 0.5 },
		{ 0.25, 0.050000001, -0.99999875, -0.001592548 },
		{ 0.001592548, -0.99999875, 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.x, R1, R1;
RSQ R0.w, R0.x;
MUL R2.xyz, R0.w, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
MAD R1.xy, fragment.texcoord[0], c[16], c[16].zwzw;
TEX R1.yw, R1, texture[0], 2D;
MAD R3.xy, R1.wyzw, c[24].x, -c[24].y;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
ADD R4.xyz, R2, R0;
MUL R5.xy, R3, R3;
MUL R1.xyz, R3.y, fragment.texcoord[4];
MAD R3.xyz, R3.x, fragment.texcoord[3], R1;
ADD_SAT R0.w, R5.x, R5.y;
DP3 R1.w, R4, R4;
RSQ R1.w, R1.w;
MUL R4.xyz, R1.w, R4;
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[24].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MOV R7.xyz, c[17];
RCP R1.w, fragment.texcoord[6].w;
RCP R0.w, R0.w;
MUL R1.xyz, R1.x, fragment.texcoord[2];
MAD R1.xyz, R0.w, R1, R3;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R1;
DP3 R0.w, R3, R4;
DP3 R1.x, fragment.texcoord[3], R0;
DP3 R1.y, fragment.texcoord[4], R0;
MUL R5.xy, R1, -c[19].x;
MAX R1.z, R0.w, c[24];
MOV R0.x, c[26].w;
MUL R1.x, R0, c[9];
MAD R0.zw, R5.xyxy, c[25].y, fragment.texcoord[0].xyxy;
ADD R0.xy, R0.zwzw, -c[24].w;
MUL R0.zw, R0.y, c[26].xyxy;
MAD R0.xy, R0.x, c[25].zwzw, R0.zwzw;
ADD R1.x, R1, c[24].y;
EX2 R1.x, R1.x;
ADD R0.xy, R0, c[24].w;
POW R4.w, R1.z, R1.x;
MUL R1.xy, R0, c[18].x;
MOV R3.w, c[19].x;
MUL R0.x, R3.w, -c[26].z;
ADD R0.w, R0.x, c[24].y;
MUL R1.xy, R1, R0.w;
MAD R0.xyz, fragment.texcoord[6], R1.w, c[6];
MUL R4.xy, R1, c[23].x;
MAD R1.xyz, fragment.texcoord[6], R1.w, c[4];
TEX R0.x, R0, texture[3], SHADOW2D;
MOV R0.w, R0.x;
MAD R0.xyz, fragment.texcoord[6], R1.w, c[5];
TEX R0.x, R0, texture[3], SHADOW2D;
TEX R1.x, R1, texture[3], SHADOW2D;
MOV R0.y, R1.x;
MAD R1.xyz, fragment.texcoord[6], R1.w, c[3];
MOV R0.z, R0.x;
TEX R0.x, R1, texture[3], SHADOW2D;
MOV R2.w, c[24].y;
ADD R1.w, R2, -c[2].x;
MAD R0, R0, R1.w, c[2].x;
DP4 R1.y, R0, c[25].x;
RCP R1.x, fragment.texcoord[5].w;
MAD R0.xy, fragment.texcoord[5], R1.x, c[24].w;
TEX R0.w, R0, texture[1], 2D;
DP3 R0.z, fragment.texcoord[5], fragment.texcoord[5];
SLT R0.x, c[24].z, fragment.texcoord[5].z;
TEX R1.w, R0.z, texture[2], 2D;
MUL R0.x, R0, R0.w;
MUL R0.x, R0, R1.w;
MUL R0.x, R0, R1.y;
MAD R1.xy, R4, c[20], c[20].zwzw;
MUL R0.w, R0.x, c[24].x;
TEX R0.xyz, R1, texture[5], 2D;
MUL R4.xyz, R0.w, c[7];
ADD R1.xyz, -R0, c[24].y;
MAD R0.zw, -R5.xyxy, c[25].y, fragment.texcoord[0].xyxy;
MAD R1.w, R3, c[24], c[24].y;
MUL R5.xy, R0.zwzw, R1.w;
DP3 R0.w, R3, R2;
MAD R0.xy, fragment.texcoord[0], c[8], c[8].zwzw;
TEX R0.xyz, R0, texture[4], 2D;
MUL R5.xy, R5, c[18].x;
MAD R5.xy, R5, c[20], c[20].zwzw;
MAD R2.xy, fragment.texcoord[0], c[10], c[10].zwzw;
MAX R1.xyz, R1, R0;
TEX R5.xyz, R5, texture[5], 2D;
MUL R7.xyz, R7, c[14].x;
MUL R7.xyz, R7, R5;
MUL R5.xyz, R1, c[12].x;
MAD R1.xy, fragment.texcoord[0], c[11], c[11].zwzw;
TEX R1.xyz, R1, texture[6], 2D;
MUL R1.xyz, R1, c[13].x;
POW R1.x, R1.x, c[22].x;
POW R1.z, R1.z, c[22].x;
POW R1.y, R1.y, c[22].x;
MAD R0.xyz, R0, -R1, R1;
MAX R0.w, R0, c[24].z;
MUL R1.xyz, R0.w, R4;
ADD R0.w, R2, -c[12].x;
MUL R6.xyz, R4, R4.w;
POW R7.x, R7.x, c[21].x;
POW R7.y, R7.y, c[21].x;
POW R7.z, R7.z, c[21].x;
MAD R7.xyz, R5, -R7, R7;
ADD R0.xyz, R7, R0;
MUL R0.xyz, R6, R0;
MUL R3.xyz, R0.w, R5;
TEX R2.xyz, R2, texture[7], 2D;
MAD R2.xyz, R2, c[15], R3;
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[24].z;
END
# 117 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 126 math, 12 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_ShadowOffsets0]
Vector 4 [_ShadowOffsets1]
Vector 5 [_ShadowOffsets2]
Vector 6 [_ShadowOffsets3]
Vector 7 [_LightColor0]
Vector 8 [_Mask_ST]
Float 9 [_Shininess]
Vector 10 [_MainTex_ST]
Vector 11 [_Specularglitter_ST]
Float 12 [_MasktransparencyDebug]
Float 13 [_Specularpower05]
Float 14 [_Glitterpower]
Vector 15 [_Color]
Vector 16 [_Normalmap_ST]
Vector 17 [_Glittercolor]
Float 18 [_Glitterymaskdotsscale]
Float 19 [_Glitteryspeed01]
Vector 20 [_Glittermap_ST]
Float 21 [_Glittercontrast13]
Float 22 [_Specularcontrast13]
Float 23 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
def c24, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c25, 0.50000000, 0.25000000, 0.05000000, -0.50000000
def c26, 0.00159374, -0.99999875, -0.00159374, 0
def c27, -0.31830987, 1.00000000, 10.00000000, 0.50000000
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
dcl_texcoord6 v6
mad r0.xyz, -v1, c1.w, c1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r2.xyz, r0.w, r0
add r1.xyz, -v1, c0
dp3 r0.z, r1, r1
mad r0.xy, v0, c16, c16.zwzw
rsq r0.z, r0.z
mul r3.xyz, r0.z, r1
texld r0.yw, r0, s0
mad_pp r1.xy, r0.wyzw, c24.x, c24.y
add r4.xyz, r2, r3
mul r0.xyz, r1.y, v4
mul_pp r5.xy, r1, r1
mad r1.xyz, r1.x, v3, r0
add_pp_sat r0.x, r5, r5.y
add_pp r0.x, -r0, c24.w
rsq_pp r0.w, r0.x
dp3 r0.y, v2, v2
rsq r0.y, r0.y
rcp r1.w, v6.w
rcp_pp r0.w, r0.w
mul r0.xyz, r0.y, v2
mad r0.xyz, r0.w, r0, r1
dp3 r0.w, r0, r0
dp3 r1.x, r4, r4
rsq r1.x, r1.x
mul r4.xyz, r1.x, r4
rsq r0.w, r0.w
mul r1.xyz, r0.w, r0
dp3 r0.x, r1, r4
max r0.w, r0.x, c24.z
mad r4.xyz, v6, r1.w, c4
mov r0.x, c9
mad r2.w, r0.x, c27.z, c27.y
mad r0.xyz, v6, r1.w, c6
exp r2.w, r2.w
pow r5, r0.w, r2.w
texld r0.x, r0, s3
mov_pp r0.w, r0.x
mad r0.xyz, v6, r1.w, c5
texld r0.x, r0, s3
texld r4.x, r4, s3
mov_pp r0.z, r0.x
mov_pp r0.y, r4.x
mad r4.xyz, v6, r1.w, c3
mov r0.x, c2
add r1.w, c24, -r0.x
texld r0.x, r4, s3
mad r0, r0, r1.w, c2.x
dp4_pp r0.z, r0, c25.y
rcp r1.w, v5.w
mad r4.xy, v5, r1.w, c25.x
dp3 r0.x, v5, v5
texld r0.w, r4, s1
cmp r0.y, -v5.z, c24.z, c24.w
mul_pp r0.y, r0, r0.w
texld r0.x, r0.x, s2
mul_pp r0.x, r0.y, r0
mul_pp r0.x, r0, r0.z
mul_pp r0.x, r0, c24
dp3 r0.w, v4, r3
dp3 r0.z, v3, r3
mov r0.y, r5.x
mul r5.xy, r0.zwzw, -c19.x
mul r4.xyz, r0.x, c7
mad r3.xy, r5, c25.z, v0
add r8.xy, r3, c25.w
mul r6.xyz, r4, r0.y
mad r0.xy, v0, c11, c11.zwzw
texld r0.xyz, r0, s6
mul r7.xyz, r0, c13.x
pow r3, r7.y, c22.x
pow r0, r7.x, c22.x
mov r7.x, r0
pow r0, r7.z, c22.x
mov r7.z, r0
mov r0.z, c19.x
mul r5.zw, r8.y, c26.xyxy
mov r7.y, r3
mad r0.xy, v0, c8, c8.zwzw
texld r3.xyz, r0, s4
mad r0.xy, r8.x, c26.yzzw, r5.zwzw
add r0.xy, r0, c25.x
mad r7.xyz, r3, -r7, r7
mad r0.z, r0, c27.x, c27.y
mul r0.xy, r0, c18.x
mul r0.xy, r0, r0.z
mov r0.z, c19.x
mad r1.w, r0.z, c27, c27.y
mad r0.zw, -r5.xyxy, c25.z, v0.xyxy
mul r0.zw, r0, r1.w
mul r5.xy, r0.zwzw, c18.x
mov r0.w, c14.x
mul r0.xy, r0, c23.x
mad r0.xy, r0, c20, c20.zwzw
mad r5.xy, r5, c20, c20.zwzw
texld r0.xyz, r0, s5
texld r5.xyz, r5, s5
mul r8.xyz, c17, r0.w
mul r8.xyz, r8, r5
add r5.xyz, -r0, c24.w
pow r0, r8.x, c21.x
max r3.xyz, r5, r3
mul r5.xyz, r3, c12.x
pow r3, r8.y, c21.x
mov r8.x, r0
pow r0, r8.z, c21.x
dp3 r0.w, r1, r2
mov r8.y, r3
mov r8.z, r0
mad r0.xyz, r5, -r8, r8
add r0.xyz, r0, r7
mul r1.xyz, r6, r0
max r0.x, r0.w, c24.z
mov r0.y, c12.x
add r0.z, c24.w, -r0.y
mul r2.xyz, r0.x, r4
mul r3.xyz, r0.z, r5
mad r0.xy, v0, c10, c10.zwzw
texld r0.xyz, r0, s7
mad r0.xyz, r0, c15, r3
mad oC0.xyz, r2, r0, r1
mov_pp oC0.w, c24.z
"
}
SubProgram "d3d11 " {
// Stats: 95 math, 8 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
SetTexture 0 [_Normalmap] 2D 6
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 7
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 4
SetTexture 7 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 352
Vector 16 [_ShadowOffsets0]
Vector 32 [_ShadowOffsets1]
Vector 48 [_ShadowOffsets2]
Vector 64 [_ShadowOffsets3]
Vector 144 [_LightColor0]
Vector 160 [_Mask_ST]
Float 176 [_Shininess]
Vector 192 [_MainTex_ST]
Vector 208 [_Specularglitter_ST]
Float 224 [_MasktransparencyDebug]
Float 228 [_Specularpower05]
Float 232 [_Glitterpower]
Vector 240 [_Color]
Vector 256 [_Normalmap_ST]
Vector 288 [_Glittercolor]
Float 304 [_Glitterymaskdotsscale]
Float 308 [_Glitteryspeed01]
Vector 320 [_Glittermap_ST]
Float 336 [_Glittercontrast13]
Float 340 [_Specularcontrast13]
Float 344 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityShadows" 416
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
"ps_4_0
eefiecedagdbppdonimkbjelkoadbffljinoonfaabaaaaaajebaaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefceeapaaaaeaaaaaaanbadaaaafjaaaaaeegiocaaa
aaaaaaaabgaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaiaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaa
agaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaaagaaaaaa
gcbaaaadpcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaa
diaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaabdaaaaaaaceaaaaamnmmemdn
mnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
bcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaa
adaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaa
agafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaa
aaaaaaaabkiacaaaaaaaaaaabdaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadp
diaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaak
dcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaa
bdaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaa
beaaaaaaogikcaaaaaaaaaaabeaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaa
aaaaaaaaeghobaaaaeaaaaaaaagabaaaahaaaaaadiaaaaajlcaabaaaaaaaaaaa
kgikcaaaaaaaaaaaaoaaaaaaegiicaaaaaaaaaaabcaaaaaadiaaaaahlcaabaaa
aaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaa
egambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaa
aaaaaaaabfaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaak
bcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaa
aaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalk
olpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaa
egaabaaaacaaaaaaagiacaaaaaaaaaaabdaaaaaadcaaaaalicaabaaaabaaaaaa
bkiacaiaebaaaaaaaaaaaaaabdaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadp
diaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaai
dcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaabfaaaaaadcaaaaal
dcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaabeaaaaaaogikcaaa
aaaaaaaabeaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
aeaaaaaaaagabaaaahaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaa
acaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaa
adaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaa
akaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaadaaaaaa
aagabaaaadaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaa
adaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaa
aoaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaa
aaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaanaaaaaaogikcaaaaaaaaaaaanaaaaaaefaaaaajpcaabaaa
aeaaaaaaegaabaaaaeaaaaaaeghobaaaafaaaaaaaagabaaaafaaaaaadiaaaaai
hcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaaoaaaaaacpaaaaaf
hcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaa
aeaaaaaafgifcaaaaaaaaaaabfaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaa
aeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaa
aeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaaaaaaaaaa
egaibaaaadaaaaaadcaaaaamhcaabaaaadaaaaaapgipcaaaacaaaaaaaaaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaa
abaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaa
adaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaabaaaaaaa
ogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaaaaaaaaaagabaaaagaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaa
afaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaa
egbcbaaaafaaaaaadcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaa
aeaaaaaaegacbaaaagaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaa
egaabaaaafaaaaaaddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaa
aeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaa
alaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
abaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaajccaabaaa
abaaaaaaakiacaiaebaaaaaaadaaaaaabiaaaaaaabeaaaaaaaaaiadpaoaaaaah
hcaabaaaadaaaaaaegbcbaaaahaaaaaapgbpbaaaahaaaaaaaaaaaaaihcaabaaa
aeaaaaaaegacbaaaadaaaaaaegiccaaaaaaaaaaaabaaaaaaehaaaaalbcaabaaa
aeaaaaaaegaabaaaaeaaaaaaaghabaaaahaaaaaaaagabaaaaaaaaaaackaabaaa
aeaaaaaaaaaaaaaihcaabaaaafaaaaaaegacbaaaadaaaaaaegiccaaaaaaaaaaa
acaaaaaaehaaaaalccaabaaaaeaaaaaaegaabaaaafaaaaaaaghabaaaahaaaaaa
aagabaaaaaaaaaaackaabaaaafaaaaaaaaaaaaaihcaabaaaafaaaaaaegacbaaa
adaaaaaaegiccaaaaaaaaaaaadaaaaaaaaaaaaaihcaabaaaadaaaaaaegacbaaa
adaaaaaaegiccaaaaaaaaaaaaeaaaaaaehaaaaalicaabaaaaeaaaaaaegaabaaa
adaaaaaaaghabaaaahaaaaaaaagabaaaaaaaaaaackaabaaaadaaaaaaehaaaaal
ecaabaaaaeaaaaaaegaabaaaafaaaaaaaghabaaaahaaaaaaaagabaaaaaaaaaaa
ckaabaaaafaaaaaadcaaaaakpcaabaaaadaaaaaaegaobaaaaeaaaaaafgafbaaa
abaaaaaaagiacaaaadaaaaaabiaaaaaabbaaaaakccaabaaaabaaaaaaegaobaaa
adaaaaaaaceaaaaaaaaaiadoaaaaiadoaaaaiadoaaaaiadoaoaaaaahmcaabaaa
abaaaaaaagbebaaaagaaaaaapgbpbaaaagaaaaaaaaaaaaakmcaabaaaabaaaaaa
kgaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaadpaaaaaadpefaaaaaj
pcaabaaaadaaaaaaogakbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
dbaaaaahecaabaaaabaaaaaaabeaaaaaaaaaaaaackbabaaaagaaaaaaabaaaaah
ecaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahecaabaaa
abaaaaaadkaabaaaadaaaaaackaabaaaabaaaaaabaaaaaahicaabaaaabaaaaaa
egbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaapgapbaaa
abaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahecaabaaaabaaaaaa
ckaabaaaabaaaaaaakaabaaaadaaaaaaapaaaaahccaabaaaabaaaaaakgakbaaa
abaaaaaafgafbaaaabaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaa
agijcaaaaaaaaaaaajaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaa
jgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaaagaabaaa
abaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaa
aaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaa
aaaaiadpdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaaaaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaagaaaaaaaagabaaaaeaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaa
adaaaaaaegiccaaaaaaaaaaaapaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 116 math, 11 textures
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_Mask_ST]
Float 6 [_Shininess]
Vector 7 [_MainTex_ST]
Vector 8 [_Specularglitter_ST]
Float 9 [_MasktransparencyDebug]
Float 10 [_Specularpower05]
Float 11 [_Glitterpower]
Vector 12 [_Color]
Vector 13 [_Normalmap_ST]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"3.0-!!ARBfp1.0
PARAM c[26] = { program.local[0..20],
		{ 2, 1, 0, 0.97000003 },
		{ 0.0078125, -0.0078125, 0.25, 0.050000001 },
		{ 1, 0.0039215689, 1.53787e-005, 6.0308629e-008 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MAD R0.xy, fragment.texcoord[0], c[13], c[13].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[21].x, -c[21].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.w, R1.x, R1.y;
MUL R2.xyz, R0.y, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[21].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MOV R7.xyz, c[14];
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R3.xyz, R0.w, R1, R0;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R3, R3;
ADD R1.xyz, -fragment.texcoord[1], c[0];
DP3 R2.x, R1, R1;
DP3 R1.w, R0, R0;
RSQ R2.x, R2.x;
MUL R1.xyz, R2.x, R1;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, R0;
ADD R0.xyz, R2, R1;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R3;
DP3 R1.w, R0, R0;
RSQ R1.w, R1.w;
MUL R0.xyz, R1.w, R0;
MOV R0.w, c[25].y;
DP3 R0.x, R3, R0;
MUL R0.w, R0, c[6].x;
ADD R0.y, R0.w, c[21];
MAX R0.w, R0.x, c[21].z;
EX2 R1.w, R0.y;
POW R2.w, R0.w, R1.w;
ADD R0.xyz, fragment.texcoord[6], c[22].xyyw;
TEX R0, R0, texture[1], CUBE;
DP4 R4.w, R0, c[23];
ADD R0.xyz, fragment.texcoord[6], c[22].yxyw;
TEX R0, R0, texture[1], CUBE;
DP4 R4.z, R0, c[23];
DP3 R4.x, fragment.texcoord[3], R1;
DP3 R4.y, fragment.texcoord[4], R1;
ADD R1.xyz, fragment.texcoord[6], c[22].yyxw;
MUL R5.xy, R4, -c[16].x;
TEX R1, R1, texture[1], CUBE;
DP4 R4.y, R1, c[23];
DP3 R0.w, fragment.texcoord[6], fragment.texcoord[6];
RSQ R1.x, R0.w;
ADD R0.xyz, fragment.texcoord[6], c[22].x;
TEX R0, R0, texture[1], CUBE;
DP4 R4.x, R0, c[23];
RCP R1.x, R1.x;
MUL R0.x, R1, c[2].w;
MAD R1, -R0.x, c[21].w, R4;
MAD R0.xy, R5, c[22].w, fragment.texcoord[0];
MOV R0.w, c[21].y;
CMP R1, R1, c[3].x, R0.w;
DP4 R1.x, R1, c[22].z;
ADD R0.xy, R0, -c[24].x;
MUL R4.xy, R0.y, c[24].wyzw;
MAD R0.xy, R0.x, c[24].yzzw, R4;
MOV R1.w, c[16].x;
MUL R0.z, R1.w, -c[25].x;
ADD R1.y, R0.z, c[21];
DP3 R0.z, fragment.texcoord[5], fragment.texcoord[5];
ADD R0.xy, R0, c[24].x;
MUL R0.xy, R0, c[15].x;
TEX R3.w, R0.z, texture[2], 2D;
MUL R0.xy, R0, R1.y;
MUL R0.z, R3.w, R1.x;
MUL R1.xy, R0, c[20].x;
MUL R0.xyz, R0.z, c[4];
MUL R4.xyz, R0, c[21].x;
MAD R1.xy, R1, c[17], c[17].zwzw;
TEX R0.xyz, R1, texture[4], 2D;
ADD R1.xyz, -R0, c[21].y;
MUL R0.x, R1.w, c[24];
ADD R0.z, R0.x, c[21].y;
MAD R5.xy, -R5, c[22].w, fragment.texcoord[0];
MUL R5.xy, R5, R0.z;
MAD R0.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
MUL R5.xy, R5, c[15].x;
MAD R5.xy, R5, c[17], c[17].zwzw;
MAX R1.xyz, R1, R0;
TEX R5.xyz, R5, texture[4], 2D;
MUL R7.xyz, R7, c[11].x;
MUL R7.xyz, R7, R5;
MUL R5.xyz, R1, c[9].x;
MAD R1.xy, fragment.texcoord[0], c[8], c[8].zwzw;
TEX R1.xyz, R1, texture[5], 2D;
MUL R1.xyz, R1, c[10].x;
POW R1.x, R1.x, c[19].x;
POW R1.z, R1.z, c[19].x;
POW R1.y, R1.y, c[19].x;
MAD R0.xyz, R0, -R1, R1;
DP3 R1.x, R3, R2;
MAX R1.x, R1, c[21].z;
ADD R0.w, R0, -c[9].x;
MAD R2.xy, fragment.texcoord[0], c[7], c[7].zwzw;
MUL R6.xyz, R4, R2.w;
POW R7.x, R7.x, c[18].x;
POW R7.y, R7.y, c[18].x;
POW R7.z, R7.z, c[18].x;
MAD R7.xyz, R5, -R7, R7;
ADD R0.xyz, R7, R0;
MUL R0.xyz, R6, R0;
MUL R1.xyz, R1.x, R4;
MUL R3.xyz, R0.w, R5;
TEX R2.xyz, R2, texture[6], 2D;
MAD R2.xyz, R2, c[12], R3;
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[21].z;
END
# 116 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 125 math, 11 textures
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_Mask_ST]
Float 6 [_Shininess]
Vector 7 [_MainTex_ST]
Vector 8 [_Specularglitter_ST]
Float 9 [_MasktransparencyDebug]
Float 10 [_Specularpower05]
Float 11 [_Glitterpower]
Vector 12 [_Color]
Vector 13 [_Normalmap_ST]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"ps_3_0
dcl_2d s0
dcl_cube s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c21, 2.00000000, -1.00000000, 0.00000000, 0.00781250
def c22, 0.00781250, -0.00781250, 0.97000003, 0.25000000
def c23, 1.00000000, 0.00392157, 0.00001538, 0.00000006
def c24, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c25, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c26, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
mad r0.xyz, -v1, c1.w, c1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r2.xyz, r0.w, r0
add r3.xyz, -v1, c0
dp3 r0.z, r3, r3
mad r0.xy, v0, c13, c13.zwzw
texld r1.yw, r0, s0
rsq r0.z, r0.z
mul r0.xyz, r0.z, r3
mad_pp r3.xy, r1.wyzw, c21.x, c21.y
add r4.xyz, r2, r0
mul_pp r5.xy, r3, r3
mul r1.xyz, r3.y, v4
mad r3.xyz, r3.x, v3, r1
add_pp_sat r0.w, r5.x, r5.y
dp3 r1.w, r4, r4
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c23.x
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r3
dp3 r0.w, r1, r1
rsq r1.w, r1.w
mul r3.xyz, r1.w, r4
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3 r0.w, r1, r3
mov r1.w, c6.x
mad r1.w, r1, c26.z, c26.y
add r3.xyz, v6, c22.xyyw
texld r3, r3, s1
dp4 r6.w, r3, c23
add r3.xyz, v6, c22.yxyw
texld r3, r3, s1
dp4 r6.z, r3, c23
add r4.xyz, v6, c22.yyxw
texld r4, r4, s1
add r3.xyz, v6, c21.w
texld r3, r3, s1
dp4 r6.y, r4, c23
dp4 r6.x, r3, c23
max r0.w, r0, c21.z
exp r1.w, r1.w
pow r5, r0.w, r1.w
dp3 r0.w, v6, v6
rsq r0.w, r0.w
rcp r0.w, r0.w
mul r0.w, r0, c2
mad r3, -r0.w, c22.z, r6
mov r1.w, c3.x
cmp r4, r3, c23.x, r1.w
dp3 r3.x, v5, v5
dp4_pp r0.w, r4, c22.w
texld r3.x, r3.x, s2
mul r0.w, r3.x, r0
mul r3.xyz, r0.w, c4
mul r4.xyz, r3, c21.x
mov r0.w, r5.x
mul r6.xyz, r4, r0.w
dp3 r0.w, v4, r0
dp3 r0.z, v3, r0
mul r5.xy, r0.zwzw, -c16.x
mad r3.xy, r5, c24.x, v0
add r8.xy, r3, c24.y
mad r0.xy, v0, c8, c8.zwzw
texld r0.xyz, r0, s5
mul r7.xyz, r0, c10.x
pow r3, r7.y, c19.x
pow r0, r7.x, c19.x
mov r7.x, r0
pow r0, r7.z, c19.x
mov r7.z, r0
mov r0.z, c16.x
mul r5.zw, r8.y, c24
mov r7.y, r3
mad r0.xy, v0, c5, c5.zwzw
texld r3.xyz, r0, s3
mad r0.xy, r8.x, c25, r5.zwzw
add r0.xy, r0, c25.z
mad r7.xyz, r3, -r7, r7
mad r0.z, r0, c26.x, c26.y
mul r0.xy, r0, c15.x
mul r0.xy, r0, r0.z
mov r0.z, c16.x
mad r1.w, r0.z, c25.z, c25
mad r0.zw, -r5.xyxy, c24.x, v0.xyxy
mul r0.zw, r0, r1.w
mul r5.xy, r0.zwzw, c15.x
mov r0.w, c11.x
mul r0.xy, r0, c20.x
mad r0.xy, r0, c17, c17.zwzw
mad r5.xy, r5, c17, c17.zwzw
texld r0.xyz, r0, s4
texld r5.xyz, r5, s4
mul r8.xyz, c14, r0.w
mul r8.xyz, r8, r5
add r5.xyz, -r0, c23.x
pow r0, r8.x, c18.x
max r3.xyz, r5, r3
mul r5.xyz, r3, c9.x
pow r3, r8.y, c18.x
mov r8.x, r0
pow r0, r8.z, c18.x
dp3 r0.w, r1, r2
mov r8.y, r3
mov r8.z, r0
mad r0.xyz, r5, -r8, r8
add r0.xyz, r0, r7
mul r1.xyz, r6, r0
max r0.x, r0.w, c21.z
mov r0.y, c9.x
add r0.z, c23.x, -r0.y
mul r2.xyz, r0.x, r4
mul r3.xyz, r0.z, r5
mad r0.xy, v0, c7, c7.zwzw
texld r0.xyz, r0, s6
mad r0.xyz, r0, c12, r3
mad oC0.xyz, r2, r0, r1
mov_pp oC0.w, c21.z
"
}
SubProgram "d3d11 " {
// Stats: 95 math, 11 textures
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
SetTexture 0 [_Normalmap] 2D 5
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_ShadowMapTexture] CUBE 0
SetTexture 3 [_Mask] 2D 2
SetTexture 4 [_Glittermap] 2D 6
SetTexture 5 [_Specularglitter] 2D 4
SetTexture 6 [_MainTex] 2D 3
ConstBuffer "$Globals" 288
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Vector 192 [_Normalmap_ST]
Vector 224 [_Glittercolor]
Float 240 [_Glitterymaskdotsscale]
Float 244 [_Glitteryspeed01]
Vector 256 [_Glittermap_ST]
Float 272 [_Glittercontrast13]
Float 276 [_Specularcontrast13]
Float 280 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 16 [_LightPositionRange]
ConstBuffer "UnityShadows" 416
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
"ps_4_0
eefiecedganbdjekafjilpgjbfakedfjafbajejmabaaaaaajebaaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefceeapaaaaeaaaaaaanbadaaaafjaaaaaeegiocaaa
aaaaaaaabcaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaacaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaa
agaaaaaagcbaaaadhcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
ahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaapaaaaaaaceaaaaa
mnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaia
ebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaah
ccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaa
acaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaak
bcaabaaaaaaaaaaabkiacaaaaaaaaaaaapaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaa
aaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaapaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaabaaaaaaaogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaaaaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaadiaaaaajlcaabaaa
aaaaaaaakgikcaaaaaaaaaaaakaaaaaaegiicaaaaaaaaaaaaoaaaaaadiaaaaah
lcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaa
aaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaa
agiacaaaaaaaaaaabbaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
apaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaa
adaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
acaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaapaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaapaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaa
diaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaabbaaaaaa
dcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaabaaaaaaa
ogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaaeaaaaaaaagabaaaagaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaia
ebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
adaaaaaaaagabaaaacaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaakaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaafaaaaaaaagabaaaaeaaaaaa
diaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaakaaaaaa
cpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaabbaaaaaabjaaaaafhcaabaaaaeaaaaaa
egacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaia
ebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaa
aaaaaaaaegaibaaaadaaaaaadcaaaaamhcaabaaaadaaaaaapgipcaaaacaaaaaa
aaaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaah
icaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaa
egacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaa
aaaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaa
aaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaa
adaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
amaaaaaaogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaa
afaaaaaaeghobaaaaaaaaaaaaagabaaaafaaaaaadcaaaaapdcaabaaaafaaaaaa
hgapbaaaafaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaa
aaaaialpaaaaialpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaa
afaaaaaaegbcbaaaafaaaaaadcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaa
egbcbaaaaeaaaaaaegacbaaaagaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaa
afaaaaaaegaabaaaafaaaaaaddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
abeaaaaaaaaaiadpaaaaaaaiecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaaj
hcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaa
baaaaaahecaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaa
aaaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaa
adaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaa
deaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaa
aaaaaaaaahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaa
abaaaaaabkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
bkaabaaaabaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaabaaaaaah
ccaabaaaabaaaaaaegbcbaaaahaaaaaaegbcbaaaahaaaaaaelaaaaafccaabaaa
abaaaaaabkaabaaaabaaaaaadiaaaaaiccaabaaaabaaaaaabkaabaaaabaaaaaa
dkiacaaaacaaaaaaabaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaa
abeaaaaaomfbhidpaaaaaaakhcaabaaaadaaaaaaegbcbaaaahaaaaaaaceaaaaa
aaaaaadmaaaaaadmaaaaaadmaaaaaaaaefaaaaajpcaabaaaadaaaaaaegacbaaa
adaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaabbaaaaakbcaabaaaadaaaaaa
egaobaaaadaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdhafidibddaaaaaaak
hcaabaaaaeaaaaaaegbcbaaaahaaaaaaaceaaaaaaaaaaalmaaaaaalmaaaaaadm
aaaaaaaaefaaaaajpcaabaaaaeaaaaaaegacbaaaaeaaaaaaeghobaaaacaaaaaa
aagabaaaaaaaaaaabbaaaaakccaabaaaadaaaaaaegaobaaaaeaaaaaaaceaaaaa
aaaaiadpibiaiadlicabibdhafidibddaaaaaaakhcaabaaaaeaaaaaaegbcbaaa
ahaaaaaaaceaaaaaaaaaaalmaaaaaadmaaaaaalmaaaaaaaaefaaaaajpcaabaaa
aeaaaaaaegacbaaaaeaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaabbaaaaak
ecaabaaaadaaaaaaegaobaaaaeaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdh
afidibddaaaaaaakhcaabaaaaeaaaaaaegbcbaaaahaaaaaaaceaaaaaaaaaaadm
aaaaaalmaaaaaalmaaaaaaaaefaaaaajpcaabaaaaeaaaaaaegacbaaaaeaaaaaa
eghobaaaacaaaaaaaagabaaaaaaaaaaabbaaaaakicaabaaaadaaaaaaegaobaaa
aeaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdhafidibdddbaaaaahpcaabaaa
adaaaaaaegaobaaaadaaaaaafgafbaaaabaaaaaadhaaaaanpcaabaaaadaaaaaa
egaobaaaadaaaaaaagiacaaaadaaaaaabiaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpbbaaaaakccaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
aaaaiadoaaaaiadoaaaaiadoaaaaiadobaaaaaahecaabaaaabaaaaaaegbcbaaa
agaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaakgakbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaaapaaaaahccaabaaaabaaaaaaagaabaaa
adaaaaaafgafbaaaabaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaa
agijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaa
jgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaaagaabaaa
abaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaa
aaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaa
aaaaiadpdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaaaaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaagaaaaaaaagabaaaadaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaa
adaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 118 math, 12 textures
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_Mask_ST]
Float 6 [_Shininess]
Vector 7 [_MainTex_ST]
Vector 8 [_Specularglitter_ST]
Float 9 [_MasktransparencyDebug]
Float 10 [_Specularpower05]
Float 11 [_Glitterpower]
Vector 12 [_Color]
Vector 13 [_Normalmap_ST]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"3.0-!!ARBfp1.0
PARAM c[26] = { program.local[0..20],
		{ 2, 1, 0, 0.97000003 },
		{ 0.0078125, -0.0078125, 0.25, 0.050000001 },
		{ 1, 0.0039215689, 1.53787e-005, 6.0308629e-008 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MAD R0.xy, fragment.texcoord[0], c[13], c[13].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[21].x, -c[21].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.w, R1.x, R1.y;
MUL R2.xyz, R0.y, fragment.texcoord[4];
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
ADD R2.xyz, -fragment.texcoord[1], c[0];
DP3 R1.w, R2, R2;
RSQ R1.w, R1.w;
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[21].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MOV R7.xyz, c[14];
MUL R4.xyz, R1.w, R2;
RCP R0.w, R0.w;
MUL R1.xyz, R1.x, fragment.texcoord[2];
MAD R1.xyz, R0.w, R1, R0;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R0;
DP3 R0.w, R1, R1;
ADD R0.xyz, R2, R4;
DP3 R1.w, R0, R0;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R1;
RSQ R1.w, R1.w;
MUL R0.xyz, R1.w, R0;
DP3 R0.x, R3, R0;
MOV R0.w, c[25].y;
MUL R0.y, R0.w, c[6].x;
ADD R0.w, R0.y, c[21].y;
MAX R1.x, R0, c[21].z;
EX2 R1.y, R0.w;
POW R3.w, R1.x, R1.y;
ADD R0.xyz, fragment.texcoord[6], c[22].xyyw;
TEX R0, R0, texture[1], CUBE;
DP4 R5.w, R0, c[23];
ADD R0.xyz, fragment.texcoord[6], c[22].yxyw;
TEX R0, R0, texture[1], CUBE;
DP4 R5.z, R0, c[23];
ADD R1.xyz, fragment.texcoord[6], c[22].yyxw;
TEX R1, R1, texture[1], CUBE;
DP4 R5.y, R1, c[23];
DP3 R0.w, fragment.texcoord[6], fragment.texcoord[6];
RSQ R1.x, R0.w;
ADD R0.xyz, fragment.texcoord[6], c[22].x;
TEX R0, R0, texture[1], CUBE;
DP4 R5.x, R0, c[23];
RCP R1.x, R1.x;
MUL R0.x, R1, c[2].w;
MAD R0, -R0.x, c[21].w, R5;
MOV R1.w, c[21].y;
CMP R0, R0, c[3].x, R1.w;
DP4 R0.z, R0, c[22].z;
MOV R4.w, c[16].x;
MUL R0.w, R4, -c[25].x;
DP3 R1.x, fragment.texcoord[3], R4;
DP3 R1.y, fragment.texcoord[4], R4;
MUL R5.xy, R1, -c[16].x;
MAD R1.xy, R5, c[22].w, fragment.texcoord[0];
ADD R1.xy, R1, -c[24].x;
MUL R0.xy, R1.y, c[24].wyzw;
MAD R0.xy, R1.x, c[24].yzzw, R0;
DP3 R1.x, fragment.texcoord[5], fragment.texcoord[5];
ADD R0.xy, R0, c[24].x;
TEX R2.w, R1.x, texture[2], 2D;
ADD R0.w, R0, c[21].y;
MUL R0.xy, R0, c[15].x;
MUL R0.xy, R0, R0.w;
MUL R1.xy, R0, c[20].x;
TEX R0.w, fragment.texcoord[5], texture[3], CUBE;
MUL R0.w, R2, R0;
MUL R0.z, R0.w, R0;
MUL R0.xyz, R0.z, c[4];
MUL R4.xyz, R0, c[21].x;
MAD R1.xy, R1, c[17], c[17].zwzw;
TEX R0.xyz, R1, texture[5], 2D;
ADD R1.xyz, -R0, c[21].y;
MUL R0.x, R4.w, c[24];
ADD R2.w, R0.x, c[21].y;
MAD R0.zw, -R5.xyxy, c[22].w, fragment.texcoord[0].xyxy;
MUL R5.xy, R0.zwzw, R2.w;
DP3 R0.w, R3, R2;
MAD R0.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R0.xyz, R0, texture[4], 2D;
MUL R5.xy, R5, c[15].x;
MAD R5.xy, R5, c[17], c[17].zwzw;
MAD R2.xy, fragment.texcoord[0], c[7], c[7].zwzw;
MAX R1.xyz, R1, R0;
TEX R5.xyz, R5, texture[5], 2D;
MUL R7.xyz, R7, c[11].x;
MUL R7.xyz, R7, R5;
MUL R5.xyz, R1, c[9].x;
MAD R1.xy, fragment.texcoord[0], c[8], c[8].zwzw;
TEX R1.xyz, R1, texture[6], 2D;
MUL R1.xyz, R1, c[10].x;
POW R1.x, R1.x, c[19].x;
POW R1.z, R1.z, c[19].x;
POW R1.y, R1.y, c[19].x;
MAD R0.xyz, R0, -R1, R1;
MAX R0.w, R0, c[21].z;
MUL R1.xyz, R0.w, R4;
ADD R0.w, R1, -c[9].x;
MUL R6.xyz, R4, R3.w;
POW R7.x, R7.x, c[18].x;
POW R7.y, R7.y, c[18].x;
POW R7.z, R7.z, c[18].x;
MAD R7.xyz, R5, -R7, R7;
ADD R0.xyz, R7, R0;
MUL R0.xyz, R6, R0;
MUL R3.xyz, R0.w, R5;
TEX R2.xyz, R2, texture[7], 2D;
MAD R2.xyz, R2, c[12], R3;
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[21].z;
END
# 118 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 126 math, 12 textures
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_Mask_ST]
Float 6 [_Shininess]
Vector 7 [_MainTex_ST]
Vector 8 [_Specularglitter_ST]
Float 9 [_MasktransparencyDebug]
Float 10 [_Specularpower05]
Float 11 [_Glitterpower]
Vector 12 [_Color]
Vector 13 [_Normalmap_ST]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"ps_3_0
dcl_2d s0
dcl_cube s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
def c21, 2.00000000, -1.00000000, 0.00000000, 0.00781250
def c22, 0.00781250, -0.00781250, 0.97000003, 0.25000000
def c23, 1.00000000, 0.00392157, 0.00001538, 0.00000006
def c24, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c25, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c26, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
mad r0.xy, v0, c13, c13.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c21.x, c21.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
mad r0.xyz, r0.x, v3, r2
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c23.x
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
mov r2.w, c6.x
mad r2.w, r2, c26.z, c26.y
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r0
add r0.xyz, -v1, c0
mad r2.xyz, -v1, c1.w, c1
dp3 r1.w, r0, r0
dp3 r0.w, r2, r2
rsq r1.w, r1.w
rsq r0.w, r0.w
mul r2.xyz, r0.w, r2
mul r0.xyz, r1.w, r0
add r3.xyz, r2, r0
dp3 r0.w, r1, r1
dp3 r1.w, r3, r3
rsq r0.w, r0.w
rsq r1.w, r1.w
mul r4.xyz, r1.w, r3
mul r1.xyz, r0.w, r1
dp3 r0.w, r1, r4
add r3.xyz, v6, c22.xyyw
texld r3, r3, s1
dp4 r5.w, r3, c23
add r3.xyz, v6, c22.yxyw
texld r3, r3, s1
dp4 r5.z, r3, c23
add r4.xyz, v6, c22.yyxw
texld r4, r4, s1
add r3.xyz, v6, c21.w
texld r3, r3, s1
dp3 r1.w, v6, v6
rsq r1.w, r1.w
rcp r1.w, r1.w
dp4 r5.y, r4, c23
dp4 r5.x, r3, c23
mul r1.w, r1, c2
mad r3, -r1.w, c22.z, r5
mov r1.w, c3.x
cmp r4, r3, c23.x, r1.w
dp4_pp r1.w, r4, c22.w
dp3 r4.x, v5, v5
max r0.w, r0, c21.z
exp r2.w, r2.w
pow r3, r0.w, r2.w
texld r4.x, r4.x, s2
texld r0.w, v5, s3
mul r0.w, r4.x, r0
mul r0.w, r0, r1
mul r4.xyz, r0.w, c4
mov r0.w, r3.x
mul r4.xyz, r4, c21.x
mul r6.xyz, r4, r0.w
dp3 r0.w, v4, r0
dp3 r0.z, v3, r0
mul r5.xy, r0.zwzw, -c16.x
mad r3.xy, r5, c24.x, v0
add r8.xy, r3, c24.y
mad r0.xy, v0, c8, c8.zwzw
texld r0.xyz, r0, s6
mul r7.xyz, r0, c10.x
pow r3, r7.y, c19.x
pow r0, r7.x, c19.x
mov r7.x, r0
pow r0, r7.z, c19.x
mov r7.z, r0
mov r0.z, c16.x
mul r5.zw, r8.y, c24
mov r7.y, r3
mad r0.xy, v0, c5, c5.zwzw
texld r3.xyz, r0, s4
mad r0.xy, r8.x, c25, r5.zwzw
add r0.xy, r0, c25.z
mad r7.xyz, r3, -r7, r7
mad r0.z, r0, c26.x, c26.y
mul r0.xy, r0, c15.x
mul r0.xy, r0, r0.z
mov r0.z, c16.x
mad r1.w, r0.z, c25.z, c25
mad r0.zw, -r5.xyxy, c24.x, v0.xyxy
mul r0.zw, r0, r1.w
mul r5.xy, r0.zwzw, c15.x
mov r0.w, c11.x
mul r0.xy, r0, c20.x
mad r0.xy, r0, c17, c17.zwzw
mad r5.xy, r5, c17, c17.zwzw
texld r0.xyz, r0, s5
texld r5.xyz, r5, s5
mul r8.xyz, c14, r0.w
mul r8.xyz, r8, r5
add r5.xyz, -r0, c23.x
pow r0, r8.x, c18.x
max r3.xyz, r5, r3
mul r5.xyz, r3, c9.x
pow r3, r8.y, c18.x
mov r8.x, r0
pow r0, r8.z, c18.x
dp3 r0.w, r1, r2
mov r8.y, r3
mov r8.z, r0
mad r0.xyz, r5, -r8, r8
add r0.xyz, r0, r7
mul r1.xyz, r6, r0
max r0.x, r0.w, c21.z
mov r0.y, c9.x
add r0.z, c23.x, -r0.y
mul r2.xyz, r0.x, r4
mul r3.xyz, r0.z, r5
mad r0.xy, v0, c7, c7.zwzw
texld r0.xyz, r0, s7
mad r0.xyz, r0, c12, r3
mad oC0.xyz, r2, r0, r1
mov_pp oC0.w, c21.z
"
}
SubProgram "d3d11 " {
// Stats: 96 math, 12 textures
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
SetTexture 0 [_Normalmap] 2D 6
SetTexture 1 [_LightTextureB0] 2D 2
SetTexture 2 [_LightTexture0] CUBE 1
SetTexture 3 [_ShadowMapTexture] CUBE 0
SetTexture 4 [_Mask] 2D 3
SetTexture 5 [_Glittermap] 2D 7
SetTexture 6 [_Specularglitter] 2D 5
SetTexture 7 [_MainTex] 2D 4
ConstBuffer "$Globals" 288
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Vector 192 [_Normalmap_ST]
Vector 224 [_Glittercolor]
Float 240 [_Glitterymaskdotsscale]
Float 244 [_Glitteryspeed01]
Vector 256 [_Glittermap_ST]
Float 272 [_Glittercontrast13]
Float 276 [_Specularcontrast13]
Float 280 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 16 [_LightPositionRange]
ConstBuffer "UnityShadows" 416
Vector 384 [_LightShadowData]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityShadows" 3
"ps_4_0
eefiecedmjmeifnffajbcckomoeoflcgmcdlpnikabaaaaaapabaaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefckaapaaaaeaaaaaaaoiadaaaafjaaaaaeegiocaaa
aaaaaaaabcaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaacaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaa
acaaaaaaffffaaaafidaaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaa
agaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaa
gcbaaaadhcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaa
diaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaapaaaaaaaceaaaaamnmmemdn
mnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
bcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaa
adaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaa
agafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaa
aaaaaaaabkiacaaaaaaaaaaaapaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadp
diaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaak
dcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaa
apaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaa
baaaaaaaogikcaaaaaaaaaaabaaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaa
aaaaaaaaeghobaaaafaaaaaaaagabaaaahaaaaaadiaaaaajlcaabaaaaaaaaaaa
kgikcaaaaaaaaaaaakaaaaaaegiicaaaaaaaaaaaaoaaaaaadiaaaaahlcaabaaa
aaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaa
egambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaa
aaaaaaaabbaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaak
bcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaa
aaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalk
olpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaa
egaabaaaacaaaaaaagiacaaaaaaaaaaaapaaaaaadcaaaaalicaabaaaabaaaaaa
bkiacaiaebaaaaaaaaaaaaaaapaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadp
diaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaai
dcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaabbaaaaaadcaaaaal
dcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaabaaaaaaaogikcaaa
aaaaaaaabaaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
afaaaaaaaagabaaaahaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaa
acaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaa
adaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaaeaaaaaa
aagabaaaadaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaa
adaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaa
akaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaa
aaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaajpcaabaaa
aeaaaaaaegaabaaaaeaaaaaaeghobaaaagaaaaaaaagabaaaafaaaaaadiaaaaai
hcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaakaaaaaacpaaaaaf
hcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaa
aeaaaaaafgifcaaaaaaaaaaabbaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaa
aeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaa
aeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaaaaaaaaaa
egaibaaaadaaaaaadcaaaaamhcaabaaaadaaaaaapgipcaaaacaaaaaaaaaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaa
abaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaa
adaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaaaaaaaaaagabaaaagaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaa
afaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaa
egbcbaaaafaaaaaadcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaa
aeaaaaaaegacbaaaagaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaa
egaabaaaafaaaaaaddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaa
aeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aeaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaa
ahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
abaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaabaaaaaahccaabaaa
abaaaaaaegbcbaaaahaaaaaaegbcbaaaahaaaaaaelaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaaiccaabaaaabaaaaaabkaabaaaabaaaaaadkiacaaa
acaaaaaaabaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaa
omfbhidpaaaaaaakhcaabaaaadaaaaaaegbcbaaaahaaaaaaaceaaaaaaaaaaadm
aaaaaadmaaaaaadmaaaaaaaaefaaaaajpcaabaaaadaaaaaaegacbaaaadaaaaaa
eghobaaaadaaaaaaaagabaaaaaaaaaaabbaaaaakbcaabaaaadaaaaaaegaobaaa
adaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdhafidibddaaaaaaakhcaabaaa
aeaaaaaaegbcbaaaahaaaaaaaceaaaaaaaaaaalmaaaaaalmaaaaaadmaaaaaaaa
efaaaaajpcaabaaaaeaaaaaaegacbaaaaeaaaaaaeghobaaaadaaaaaaaagabaaa
aaaaaaaabbaaaaakccaabaaaadaaaaaaegaobaaaaeaaaaaaaceaaaaaaaaaiadp
ibiaiadlicabibdhafidibddaaaaaaakhcaabaaaaeaaaaaaegbcbaaaahaaaaaa
aceaaaaaaaaaaalmaaaaaadmaaaaaalmaaaaaaaaefaaaaajpcaabaaaaeaaaaaa
egacbaaaaeaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaabbaaaaakecaabaaa
adaaaaaaegaobaaaaeaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdhafidibdd
aaaaaaakhcaabaaaaeaaaaaaegbcbaaaahaaaaaaaceaaaaaaaaaaadmaaaaaalm
aaaaaalmaaaaaaaaefaaaaajpcaabaaaaeaaaaaaegacbaaaaeaaaaaaeghobaaa
adaaaaaaaagabaaaaaaaaaaabbaaaaakicaabaaaadaaaaaaegaobaaaaeaaaaaa
aceaaaaaaaaaiadpibiaiadlicabibdhafidibdddbaaaaahpcaabaaaadaaaaaa
egaobaaaadaaaaaafgafbaaaabaaaaaadhaaaaanpcaabaaaadaaaaaaegaobaaa
adaaaaaaagiacaaaadaaaaaabiaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpbbaaaaakccaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaaaaaaiado
aaaaiadoaaaaiadoaaaaiadobaaaaaahecaabaaaabaaaaaaegbcbaaaagaaaaaa
egbcbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaakgakbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbcbaaaagaaaaaa
eghobaaaacaaaaaaaagabaaaabaaaaaadiaaaaahecaabaaaabaaaaaaakaabaaa
adaaaaaadkaabaaaaeaaaaaaapaaaaahccaabaaaabaaaaaakgakbaaaabaaaaaa
fgafbaaaabaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaaagijcaaa
aaaaaaaaafaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaajgahbaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaaagaabaaaabaaaaaa
diaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaaj
icaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaaaaaaiadp
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaaaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaa
aaaaaaaaaiaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
ahaaaaaaaagabaaaaeaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaaadaaaaaa
egiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES3"
}
}
 }
}
Fallback "Diffuse"
}