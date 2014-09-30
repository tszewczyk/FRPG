// Compiled shader for all platforms, uncompressed size: 920.1KB

Shader "Spaventacorvi/Glam Glitter C - Bumped Rough" {
Properties {
 _Color ("Main color", Color) = (0.705882,0.705882,0.705882,1)
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
 //       d3d11 : 80 avg math (78..82), 5 avg texture (5..6)
 //        d3d9 : 106 avg math (104..109), 5 avg texture (5..6)
 //      opengl : 93 avg math (91..95), 5 avg texture (5..6)
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
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_23;
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
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_23;
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
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_23;
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
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_23;
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
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_23;
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
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_23;
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
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_23;
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
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_23;
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
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_23;
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
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
  tmpvar_1 = tmpvar_31;
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
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_24)) + (tmpvar_24 * _Fakelight));
  tmpvar_1 = tmpvar_25;
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
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
  tmpvar_1 = tmpvar_31;
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
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
  tmpvar_1 = tmpvar_31;
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
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_24)) + (tmpvar_24 * _Fakelight));
  tmpvar_1 = tmpvar_25;
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
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
  tmpvar_1 = tmpvar_31;
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
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
  tmpvar_1 = tmpvar_31;
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
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_24)) + (tmpvar_24 * _Fakelight));
  tmpvar_1 = tmpvar_25;
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
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
  tmpvar_1 = tmpvar_31;
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
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_23;
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
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_23;
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
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = (((((max (0.0, dot (tmpvar_10, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_3)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
  tmpvar_1 = tmpvar_23;
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
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
  tmpvar_1 = tmpvar_31;
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
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_24)) + (tmpvar_24 * _Fakelight));
  tmpvar_1 = tmpvar_25;
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
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
  tmpvar_1 = tmpvar_31;
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
  highp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_22))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
  tmpvar_1 = tmpvar_28;
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
  highp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_22))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
  tmpvar_1 = tmpvar_28;
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
  highp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_22))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
  tmpvar_1 = tmpvar_28;
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
  highp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_22))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
  tmpvar_1 = tmpvar_28;
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
  highp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_22))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
  tmpvar_1 = tmpvar_28;
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
  highp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_22))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
  tmpvar_1 = tmpvar_28;
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
  highp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_22))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
  tmpvar_1 = tmpvar_28;
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
  highp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = (((((max (0.0, dot (tmpvar_11, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_22))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_8 + lightDirection_4)), tmpvar_11)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
  tmpvar_1 = tmpvar_28;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 91 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Float 12 [_Fakelight]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Specularglitter] 2D 3
"3.0-!!ARBfp1.0
PARAM c[23] = { state.lightmodel.ambient,
		program.local[1..19],
		{ 2, 1, 0, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
ADD R0.xyz, -fragment.texcoord[1], c[1];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MAD R1.xy, fragment.texcoord[0], c[11], c[11].zwzw;
TEX R2.yw, R1, texture[0], 2D;
MAD R3.xy, R2.wyzw, c[20].x, -c[20].y;
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, c[2];
MUL R5.xy, R3, R3;
MUL R2.xyz, R3.y, fragment.texcoord[4];
ADD_SAT R0.w, R5.x, R5.y;
DP3 R1.w, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[20].y;
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
RSQ R0.w, R0.w;
MUL R3.xyz, R1.w, R4;
MUL R2.xyz, R0.w, R2;
DP3 R0.w, R2, R3;
MAX R1.w, R0, c[20].z;
DP3 R0.w, fragment.texcoord[4], R0;
DP3 R0.z, fragment.texcoord[3], R0;
MOV R2.w, c[22].y;
MUL R4.xy, R0.zwzw, -c[15].x;
MUL R0.x, R2.w, c[5];
ADD R0.z, R0.x, c[20].y;
MAD R0.xy, R4, c[20].w, fragment.texcoord[0];
ADD R3.xy, R0, -c[21].x;
EX2 R0.z, R0.z;
POW R0.w, R1.w, R0.z;
MUL R0.xy, R3.y, c[21].wyzw;
MOV R1.w, c[15].x;
MUL R0.z, R1.w, -c[22].x;
MAD R0.xy, R3.x, c[21].yzzw, R0;
ADD R0.xy, R0, c[21].x;
MUL R1.w, R1, c[21].x;
ADD R0.z, R0, c[20].y;
MUL R0.xy, R0, c[14].x;
MUL R3.xy, R0, R0.z;
MUL R4.zw, R3.xyxy, c[19].x;
MAD R0.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
MUL R0.xyz, R0, c[8].x;
MAD R3.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R3.xyz, R3, texture[1], 2D;
POW R0.x, R0.x, c[18].x;
POW R0.z, R0.z, c[18].x;
POW R0.y, R0.y, c[18].x;
MAD R5.xyz, R3, -R0, R0;
MAD R0.xy, R4.zwzw, c[16], c[16].zwzw;
TEX R0.xyz, R0, texture[2], 2D;
ADD R0.xyz, -R0, c[20].y;
MAX R3.xyz, R0, R3;
MUL R3.xyz, R3, c[7].x;
ADD R1.w, R1, c[20].y;
MAD R4.xy, -R4, c[20].w, fragment.texcoord[0];
MUL R4.xy, R4, R1.w;
MUL R4.xy, R4, c[14].x;
MAD R0.xy, R4, c[16], c[16].zwzw;
MOV R4.xyz, c[13];
MUL R4.xyz, R4, c[9].x;
TEX R0.xyz, R0, texture[2], 2D;
MUL R0.xyz, R4, R0;
MUL R4.xyz, R0.w, c[3];
DP3 R0.w, R2, R1;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R0.xyz, R3, -R0, R0;
ADD R0.xyz, R0, R5;
MUL R4.xyz, R4, R0;
MUL R1.xyz, R0, c[12].x;
MAX R0.x, R0.w, c[20].z;
MOV R0.w, c[20].y;
MUL R0.xyz, R0.x, c[3];
ADD R0.w, R0, -c[7].x;
ADD R0.xyz, R0, c[0];
MAD R2.xyz, R0.w, R3, c[10];
MAD R0.xyz, R0, R2, R4;
MAD result.color.xyz, R0, c[20].x, R1;
MOV result.color.w, c[20].y;
END
# 91 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 104 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Float 12 [_Fakelight]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Specularglitter] 2D 3
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c20, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c21, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c22, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c23, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
mad r0.xy, v0, c11, c11.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c20.x, c20.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c20
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
mad r0.w, r1, c23.z, c23.y
dp3 r0.x, r1, r0
exp r2.w, r0.w
max r1.w, r0.x, c20.z
pow r0, r1.w, r2.w
mov r1.w, r0.x
dp3 r0.w, v4, r3
dp3 r0.z, v3, r3
mul r4.xy, r0.zwzw, -c15.x
mad r3.xy, r4, c21.x, v0
add r6.xy, r3, c21.y
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s3
mul r5.xyz, r0, c8.x
pow r3, r5.x, c18.x
pow r0, r5.y, c18.x
mov r0.x, r3
pow r3, r5.z, c18.x
mul r4.zw, r6.y, c21
mov r0.z, r3
mad r3.xy, v0, c4, c4.zwzw
texld r3.xyz, r3, s1
mad r5.xyz, r3, -r0, r0
mad r0.xy, r6.x, c22, r4.zwzw
mov r0.z, c15.x
add r0.xy, r0, c22.z
mad r0.z, r0, c23.x, c23.y
mul r0.xy, r0, c14.x
mul r0.xy, r0, r0.z
mov r0.z, c15.x
mad r2.w, r0.z, c22.z, c22
mad r0.zw, -r4.xyxy, c21.x, v0.xyxy
mul r0.zw, r0, r2.w
mul r4.xy, r0.zwzw, c14.x
mov r0.w, c9.x
mul r0.xy, r0, c19.x
mad r0.xy, r0, c16, c16.zwzw
mad r4.xy, r4, c16, c16.zwzw
texld r0.xyz, r0, s2
texld r4.xyz, r4, s2
mul r6.xyz, c13, r0.w
mul r6.xyz, r6, r4
add r4.xyz, -r0, c20.w
pow r0, r6.x, c17.x
max r3.xyz, r4, r3
mul r4.xyz, r3, c7.x
pow r3, r6.y, c17.x
mov r6.x, r0
pow r0, r6.z, c17.x
mov r6.y, r3
mov r6.z, r0
mad r0.xyz, r4, -r6, r6
add r0.xyz, r0, r5
dp3 r0.w, r1, r2
mul r3.xyz, r1.w, c3
mul r3.xyz, r3, r0
mul r1.xyz, r0, c12.x
max r0.x, r0.w, c20.z
mov r0.w, c7.x
mul r0.xyz, r0.x, c3
add r0.w, c20, -r0
add r0.xyz, r0, c0
mad r2.xyz, r0.w, r4, c10
mad r0.xyz, r0, r2, r3
mad oC0.xyz, r0, c20.x, r1
mov_pp oC0.w, c20
"
}
SubProgram "d3d11 " {
// Stats: 78 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Normalmap] 2D 2
SetTexture 1 [_Mask] 2D 0
SetTexture 2 [_Glittermap] 2D 3
SetTexture 3 [_Specularglitter] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 32 [_Mask_ST]
Float 48 [_Shininess]
Vector 64 [_Specularglitter_ST]
Float 80 [_MasktransparencyDebug]
Float 84 [_Specularpower05]
Float 88 [_Glitterpower]
Vector 96 [_Color]
Vector 112 [_Normalmap_ST]
Float 128 [_Fakelight]
Vector 144 [_Glittercolor]
Float 160 [_Glitterymaskdotsscale]
Float 164 [_Glitteryspeed01]
Vector 176 [_Glittermap_ST]
Float 192 [_Glittercontrast13]
Float 196 [_Specularcontrast13]
Float 200 [_Maskadjust0515]
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
eefiecedfpeehofjnbokbjaccjmgfmjinkngmpgfabaaaaaalaamaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcjaalaaaa
eaaaaaaaoeacaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaakaaaaaa
aceaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaa
baaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaaj
pcaabaaaacaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaa
dcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaakaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaa
acaaaaaaaaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalp
aaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaa
agiacaaaaaaaaaaaakaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaa
egiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaadiaaaaaj
lcaabaaaaaaaaaaakgikcaaaaaaaaaaaafaaaaaaegiicaaaaaaaaaaaajaaaaaa
diaaaaahlcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaf
lcaabaaaaaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaa
aaaaaaaaagiacaaaaaaaaaaaamaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaa
aaaaaaaaapaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplp
allnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaa
aceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaa
egaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaai
dcaabaaaacaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaal
icaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaaidpjkcdo
abeaaaaaaaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaa
acaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaa
amaaaaaadcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaa
alaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaaaaaaaalhcaabaaaacaaaaaa
egacbaiaebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaacaaaaaa
ogikcaaaaaaaaaaaacaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
agiacaaaaaaaaaaaafaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaa
egambaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaa
efaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaadaaaaaaaagabaaa
abaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaa
afaaaaaacpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaa
aeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaamaaaaaabjaaaaafhcaabaaa
aeaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaiaebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaa
egambaaaaaaaaaaaegaibaaaadaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaa
acaaaaaaaaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaapgapbaaaabaaaaaaegiccaaa
acaaaaaaaaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaa
aaaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaa
aaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaa
adaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
ahaaaaaaogikcaaaaaaaaaaaahaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaa
afaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadcaaaaapdcaabaaaafaaaaaa
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
aaaaaaaaadaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaa
abaaaaaabkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
bkaabaaaabaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaaj
ocaabaaaabaaaaaaagijcaaaaaaaaaaaabaaaaaaagijcaaaaaaaaaaaabaaaaaa
diaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaah
hcaabaaaadaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajhcaabaaa
aeaaaaaaegiccaaaadaaaaaaaeaaaaaaegiccaaaadaaaaaaaeaaaaaadcaaaaaj
hcaabaaaabaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaaegacbaaaaeaaaaaa
aaaaaaajecaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaafaaaaaaabeaaaaa
aaaaiadpdcaaaaakhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaa
egiccaaaaaaaaaaaagaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaadaaaaaadcaaaaakhccabaaaaaaaaaaaegadbaaa
aaaaaaaaagiacaaaaaaaaaaaaiaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
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
// Stats: 91 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Float 12 [_Fakelight]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Specularglitter] 2D 3
"3.0-!!ARBfp1.0
PARAM c[23] = { state.lightmodel.ambient,
		program.local[1..19],
		{ 2, 1, 0, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
ADD R0.xyz, -fragment.texcoord[1], c[1];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MAD R1.xy, fragment.texcoord[0], c[11], c[11].zwzw;
TEX R2.yw, R1, texture[0], 2D;
MAD R3.xy, R2.wyzw, c[20].x, -c[20].y;
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, c[2];
MUL R5.xy, R3, R3;
MUL R2.xyz, R3.y, fragment.texcoord[4];
ADD_SAT R0.w, R5.x, R5.y;
DP3 R1.w, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[20].y;
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
RSQ R0.w, R0.w;
MUL R3.xyz, R1.w, R4;
MUL R2.xyz, R0.w, R2;
DP3 R0.w, R2, R3;
MAX R1.w, R0, c[20].z;
DP3 R0.w, fragment.texcoord[4], R0;
DP3 R0.z, fragment.texcoord[3], R0;
MOV R2.w, c[22].y;
MUL R4.xy, R0.zwzw, -c[15].x;
MUL R0.x, R2.w, c[5];
ADD R0.z, R0.x, c[20].y;
MAD R0.xy, R4, c[20].w, fragment.texcoord[0];
ADD R3.xy, R0, -c[21].x;
EX2 R0.z, R0.z;
POW R0.w, R1.w, R0.z;
MUL R0.xy, R3.y, c[21].wyzw;
MOV R1.w, c[15].x;
MUL R0.z, R1.w, -c[22].x;
MAD R0.xy, R3.x, c[21].yzzw, R0;
ADD R0.xy, R0, c[21].x;
MUL R1.w, R1, c[21].x;
ADD R0.z, R0, c[20].y;
MUL R0.xy, R0, c[14].x;
MUL R3.xy, R0, R0.z;
MUL R4.zw, R3.xyxy, c[19].x;
MAD R0.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
MUL R0.xyz, R0, c[8].x;
MAD R3.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R3.xyz, R3, texture[1], 2D;
POW R0.x, R0.x, c[18].x;
POW R0.z, R0.z, c[18].x;
POW R0.y, R0.y, c[18].x;
MAD R5.xyz, R3, -R0, R0;
MAD R0.xy, R4.zwzw, c[16], c[16].zwzw;
TEX R0.xyz, R0, texture[2], 2D;
ADD R0.xyz, -R0, c[20].y;
MAX R3.xyz, R0, R3;
MUL R3.xyz, R3, c[7].x;
ADD R1.w, R1, c[20].y;
MAD R4.xy, -R4, c[20].w, fragment.texcoord[0];
MUL R4.xy, R4, R1.w;
MUL R4.xy, R4, c[14].x;
MAD R0.xy, R4, c[16], c[16].zwzw;
MOV R4.xyz, c[13];
MUL R4.xyz, R4, c[9].x;
TEX R0.xyz, R0, texture[2], 2D;
MUL R0.xyz, R4, R0;
MUL R4.xyz, R0.w, c[3];
DP3 R0.w, R2, R1;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R0.xyz, R3, -R0, R0;
ADD R0.xyz, R0, R5;
MUL R4.xyz, R4, R0;
MUL R1.xyz, R0, c[12].x;
MAX R0.x, R0.w, c[20].z;
MOV R0.w, c[20].y;
MUL R0.xyz, R0.x, c[3];
ADD R0.w, R0, -c[7].x;
ADD R0.xyz, R0, c[0];
MAD R2.xyz, R0.w, R3, c[10];
MAD R0.xyz, R0, R2, R4;
MAD result.color.xyz, R0, c[20].x, R1;
MOV result.color.w, c[20].y;
END
# 91 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 104 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Float 12 [_Fakelight]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Specularglitter] 2D 3
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c20, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c21, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c22, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c23, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
mad r0.xy, v0, c11, c11.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c20.x, c20.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c20
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
mad r0.w, r1, c23.z, c23.y
dp3 r0.x, r1, r0
exp r2.w, r0.w
max r1.w, r0.x, c20.z
pow r0, r1.w, r2.w
mov r1.w, r0.x
dp3 r0.w, v4, r3
dp3 r0.z, v3, r3
mul r4.xy, r0.zwzw, -c15.x
mad r3.xy, r4, c21.x, v0
add r6.xy, r3, c21.y
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s3
mul r5.xyz, r0, c8.x
pow r3, r5.x, c18.x
pow r0, r5.y, c18.x
mov r0.x, r3
pow r3, r5.z, c18.x
mul r4.zw, r6.y, c21
mov r0.z, r3
mad r3.xy, v0, c4, c4.zwzw
texld r3.xyz, r3, s1
mad r5.xyz, r3, -r0, r0
mad r0.xy, r6.x, c22, r4.zwzw
mov r0.z, c15.x
add r0.xy, r0, c22.z
mad r0.z, r0, c23.x, c23.y
mul r0.xy, r0, c14.x
mul r0.xy, r0, r0.z
mov r0.z, c15.x
mad r2.w, r0.z, c22.z, c22
mad r0.zw, -r4.xyxy, c21.x, v0.xyxy
mul r0.zw, r0, r2.w
mul r4.xy, r0.zwzw, c14.x
mov r0.w, c9.x
mul r0.xy, r0, c19.x
mad r0.xy, r0, c16, c16.zwzw
mad r4.xy, r4, c16, c16.zwzw
texld r0.xyz, r0, s2
texld r4.xyz, r4, s2
mul r6.xyz, c13, r0.w
mul r6.xyz, r6, r4
add r4.xyz, -r0, c20.w
pow r0, r6.x, c17.x
max r3.xyz, r4, r3
mul r4.xyz, r3, c7.x
pow r3, r6.y, c17.x
mov r6.x, r0
pow r0, r6.z, c17.x
mov r6.y, r3
mov r6.z, r0
mad r0.xyz, r4, -r6, r6
add r0.xyz, r0, r5
dp3 r0.w, r1, r2
mul r3.xyz, r1.w, c3
mul r3.xyz, r3, r0
mul r1.xyz, r0, c12.x
max r0.x, r0.w, c20.z
mov r0.w, c7.x
mul r0.xyz, r0.x, c3
add r0.w, c20, -r0
add r0.xyz, r0, c0
mad r2.xyz, r0.w, r4, c10
mad r0.xyz, r0, r2, r3
mad oC0.xyz, r0, c20.x, r1
mov_pp oC0.w, c20
"
}
SubProgram "d3d11 " {
// Stats: 78 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Normalmap] 2D 2
SetTexture 1 [_Mask] 2D 0
SetTexture 2 [_Glittermap] 2D 3
SetTexture 3 [_Specularglitter] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 32 [_Mask_ST]
Float 48 [_Shininess]
Vector 64 [_Specularglitter_ST]
Float 80 [_MasktransparencyDebug]
Float 84 [_Specularpower05]
Float 88 [_Glitterpower]
Vector 96 [_Color]
Vector 112 [_Normalmap_ST]
Float 128 [_Fakelight]
Vector 144 [_Glittercolor]
Float 160 [_Glitterymaskdotsscale]
Float 164 [_Glitteryspeed01]
Vector 176 [_Glittermap_ST]
Float 192 [_Glittercontrast13]
Float 196 [_Specularcontrast13]
Float 200 [_Maskadjust0515]
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
eefiecedfpeehofjnbokbjaccjmgfmjinkngmpgfabaaaaaalaamaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcjaalaaaa
eaaaaaaaoeacaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaakaaaaaa
aceaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaa
baaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaaj
pcaabaaaacaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaa
dcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaakaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaa
acaaaaaaaaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalp
aaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaa
agiacaaaaaaaaaaaakaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaa
egiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaadiaaaaaj
lcaabaaaaaaaaaaakgikcaaaaaaaaaaaafaaaaaaegiicaaaaaaaaaaaajaaaaaa
diaaaaahlcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaf
lcaabaaaaaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaa
aaaaaaaaagiacaaaaaaaaaaaamaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaa
aaaaaaaaapaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplp
allnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaa
aceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaa
egaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaai
dcaabaaaacaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaal
icaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaaidpjkcdo
abeaaaaaaaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaa
acaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaa
amaaaaaadcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaa
alaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaaaaaaaalhcaabaaaacaaaaaa
egacbaiaebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaacaaaaaa
ogikcaaaaaaaaaaaacaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
agiacaaaaaaaaaaaafaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaa
egambaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaa
efaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaadaaaaaaaagabaaa
abaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaa
afaaaaaacpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaa
aeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaamaaaaaabjaaaaafhcaabaaa
aeaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaiaebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaa
egambaaaaaaaaaaaegaibaaaadaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaa
acaaaaaaaaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaapgapbaaaabaaaaaaegiccaaa
acaaaaaaaaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaa
aaaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaa
aaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaa
adaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
ahaaaaaaogikcaaaaaaaaaaaahaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaa
afaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadcaaaaapdcaabaaaafaaaaaa
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
aaaaaaaaadaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaa
abaaaaaabkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
bkaabaaaabaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaaj
ocaabaaaabaaaaaaagijcaaaaaaaaaaaabaaaaaaagijcaaaaaaaaaaaabaaaaaa
diaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaah
hcaabaaaadaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajhcaabaaa
aeaaaaaaegiccaaaadaaaaaaaeaaaaaaegiccaaaadaaaaaaaeaaaaaadcaaaaaj
hcaabaaaabaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaaegacbaaaaeaaaaaa
aaaaaaajecaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaafaaaaaaabeaaaaa
aaaaiadpdcaaaaakhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaa
egiccaaaaaaaaaaaagaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaadaaaaaadcaaaaakhccabaaaaaaaaaaaegadbaaa
aaaaaaaaagiacaaaaaaaaaaaaiaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
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
// Stats: 91 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Float 12 [_Fakelight]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Specularglitter] 2D 3
"3.0-!!ARBfp1.0
PARAM c[23] = { state.lightmodel.ambient,
		program.local[1..19],
		{ 2, 1, 0, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
ADD R0.xyz, -fragment.texcoord[1], c[1];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MAD R1.xy, fragment.texcoord[0], c[11], c[11].zwzw;
TEX R2.yw, R1, texture[0], 2D;
MAD R3.xy, R2.wyzw, c[20].x, -c[20].y;
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, c[2];
MUL R5.xy, R3, R3;
MUL R2.xyz, R3.y, fragment.texcoord[4];
ADD_SAT R0.w, R5.x, R5.y;
DP3 R1.w, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[20].y;
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
RSQ R0.w, R0.w;
MUL R3.xyz, R1.w, R4;
MUL R2.xyz, R0.w, R2;
DP3 R0.w, R2, R3;
MAX R1.w, R0, c[20].z;
DP3 R0.w, fragment.texcoord[4], R0;
DP3 R0.z, fragment.texcoord[3], R0;
MOV R2.w, c[22].y;
MUL R4.xy, R0.zwzw, -c[15].x;
MUL R0.x, R2.w, c[5];
ADD R0.z, R0.x, c[20].y;
MAD R0.xy, R4, c[20].w, fragment.texcoord[0];
ADD R3.xy, R0, -c[21].x;
EX2 R0.z, R0.z;
POW R0.w, R1.w, R0.z;
MUL R0.xy, R3.y, c[21].wyzw;
MOV R1.w, c[15].x;
MUL R0.z, R1.w, -c[22].x;
MAD R0.xy, R3.x, c[21].yzzw, R0;
ADD R0.xy, R0, c[21].x;
MUL R1.w, R1, c[21].x;
ADD R0.z, R0, c[20].y;
MUL R0.xy, R0, c[14].x;
MUL R3.xy, R0, R0.z;
MUL R4.zw, R3.xyxy, c[19].x;
MAD R0.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
MUL R0.xyz, R0, c[8].x;
MAD R3.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R3.xyz, R3, texture[1], 2D;
POW R0.x, R0.x, c[18].x;
POW R0.z, R0.z, c[18].x;
POW R0.y, R0.y, c[18].x;
MAD R5.xyz, R3, -R0, R0;
MAD R0.xy, R4.zwzw, c[16], c[16].zwzw;
TEX R0.xyz, R0, texture[2], 2D;
ADD R0.xyz, -R0, c[20].y;
MAX R3.xyz, R0, R3;
MUL R3.xyz, R3, c[7].x;
ADD R1.w, R1, c[20].y;
MAD R4.xy, -R4, c[20].w, fragment.texcoord[0];
MUL R4.xy, R4, R1.w;
MUL R4.xy, R4, c[14].x;
MAD R0.xy, R4, c[16], c[16].zwzw;
MOV R4.xyz, c[13];
MUL R4.xyz, R4, c[9].x;
TEX R0.xyz, R0, texture[2], 2D;
MUL R0.xyz, R4, R0;
MUL R4.xyz, R0.w, c[3];
DP3 R0.w, R2, R1;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R0.xyz, R3, -R0, R0;
ADD R0.xyz, R0, R5;
MUL R4.xyz, R4, R0;
MUL R1.xyz, R0, c[12].x;
MAX R0.x, R0.w, c[20].z;
MOV R0.w, c[20].y;
MUL R0.xyz, R0.x, c[3];
ADD R0.w, R0, -c[7].x;
ADD R0.xyz, R0, c[0];
MAD R2.xyz, R0.w, R3, c[10];
MAD R0.xyz, R0, R2, R4;
MAD result.color.xyz, R0, c[20].x, R1;
MOV result.color.w, c[20].y;
END
# 91 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 104 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Float 12 [_Fakelight]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Specularglitter] 2D 3
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c20, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c21, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c22, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c23, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
mad r0.xy, v0, c11, c11.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c20.x, c20.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c20
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
mad r0.w, r1, c23.z, c23.y
dp3 r0.x, r1, r0
exp r2.w, r0.w
max r1.w, r0.x, c20.z
pow r0, r1.w, r2.w
mov r1.w, r0.x
dp3 r0.w, v4, r3
dp3 r0.z, v3, r3
mul r4.xy, r0.zwzw, -c15.x
mad r3.xy, r4, c21.x, v0
add r6.xy, r3, c21.y
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s3
mul r5.xyz, r0, c8.x
pow r3, r5.x, c18.x
pow r0, r5.y, c18.x
mov r0.x, r3
pow r3, r5.z, c18.x
mul r4.zw, r6.y, c21
mov r0.z, r3
mad r3.xy, v0, c4, c4.zwzw
texld r3.xyz, r3, s1
mad r5.xyz, r3, -r0, r0
mad r0.xy, r6.x, c22, r4.zwzw
mov r0.z, c15.x
add r0.xy, r0, c22.z
mad r0.z, r0, c23.x, c23.y
mul r0.xy, r0, c14.x
mul r0.xy, r0, r0.z
mov r0.z, c15.x
mad r2.w, r0.z, c22.z, c22
mad r0.zw, -r4.xyxy, c21.x, v0.xyxy
mul r0.zw, r0, r2.w
mul r4.xy, r0.zwzw, c14.x
mov r0.w, c9.x
mul r0.xy, r0, c19.x
mad r0.xy, r0, c16, c16.zwzw
mad r4.xy, r4, c16, c16.zwzw
texld r0.xyz, r0, s2
texld r4.xyz, r4, s2
mul r6.xyz, c13, r0.w
mul r6.xyz, r6, r4
add r4.xyz, -r0, c20.w
pow r0, r6.x, c17.x
max r3.xyz, r4, r3
mul r4.xyz, r3, c7.x
pow r3, r6.y, c17.x
mov r6.x, r0
pow r0, r6.z, c17.x
mov r6.y, r3
mov r6.z, r0
mad r0.xyz, r4, -r6, r6
add r0.xyz, r0, r5
dp3 r0.w, r1, r2
mul r3.xyz, r1.w, c3
mul r3.xyz, r3, r0
mul r1.xyz, r0, c12.x
max r0.x, r0.w, c20.z
mov r0.w, c7.x
mul r0.xyz, r0.x, c3
add r0.w, c20, -r0
add r0.xyz, r0, c0
mad r2.xyz, r0.w, r4, c10
mad r0.xyz, r0, r2, r3
mad oC0.xyz, r0, c20.x, r1
mov_pp oC0.w, c20
"
}
SubProgram "d3d11 " {
// Stats: 78 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_Normalmap] 2D 2
SetTexture 1 [_Mask] 2D 0
SetTexture 2 [_Glittermap] 2D 3
SetTexture 3 [_Specularglitter] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 32 [_Mask_ST]
Float 48 [_Shininess]
Vector 64 [_Specularglitter_ST]
Float 80 [_MasktransparencyDebug]
Float 84 [_Specularpower05]
Float 88 [_Glitterpower]
Vector 96 [_Color]
Vector 112 [_Normalmap_ST]
Float 128 [_Fakelight]
Vector 144 [_Glittercolor]
Float 160 [_Glitterymaskdotsscale]
Float 164 [_Glitteryspeed01]
Vector 176 [_Glittermap_ST]
Float 192 [_Glittercontrast13]
Float 196 [_Specularcontrast13]
Float 200 [_Maskadjust0515]
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
eefiecedfpeehofjnbokbjaccjmgfmjinkngmpgfabaaaaaalaamaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcjaalaaaa
eaaaaaaaoeacaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaakaaaaaa
aceaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaa
baaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaaj
pcaabaaaacaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaa
dcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaakaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaa
acaaaaaaaaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalp
aaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaa
agiacaaaaaaaaaaaakaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaa
egiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaadiaaaaaj
lcaabaaaaaaaaaaakgikcaaaaaaaaaaaafaaaaaaegiicaaaaaaaaaaaajaaaaaa
diaaaaahlcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaf
lcaabaaaaaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaa
aaaaaaaaagiacaaaaaaaaaaaamaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaa
aaaaaaaaapaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplp
allnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaa
aceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaa
egaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaai
dcaabaaaacaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaal
icaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaaidpjkcdo
abeaaaaaaaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaa
acaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaa
amaaaaaadcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaa
alaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaaaaaaaalhcaabaaaacaaaaaa
egacbaiaebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaacaaaaaa
ogikcaaaaaaaaaaaacaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
agiacaaaaaaaaaaaafaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaa
egambaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaa
efaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaadaaaaaaaagabaaa
abaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaa
afaaaaaacpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaa
aeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaamaaaaaabjaaaaafhcaabaaa
aeaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaiaebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaa
egambaaaaaaaaaaaegaibaaaadaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaa
acaaaaaaaaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaapgapbaaaabaaaaaaegiccaaa
acaaaaaaaaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaa
aaaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaa
aaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaa
adaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
ahaaaaaaogikcaaaaaaaaaaaahaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaa
afaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadcaaaaapdcaabaaaafaaaaaa
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
aaaaaaaaadaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaa
abaaaaaabkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
bkaabaaaabaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaaj
ocaabaaaabaaaaaaagijcaaaaaaaaaaaabaaaaaaagijcaaaaaaaaaaaabaaaaaa
diaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaah
hcaabaaaadaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajhcaabaaa
aeaaaaaaegiccaaaadaaaaaaaeaaaaaaegiccaaaadaaaaaaaeaaaaaadcaaaaaj
hcaabaaaabaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaaegacbaaaaeaaaaaa
aaaaaaajecaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaafaaaaaaabeaaaaa
aaaaiadpdcaaaaakhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaa
egiccaaaaaaaaaaaagaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaadaaaaaadcaaaaakhccabaaaaaaaaaaaegadbaaa
aaaaaaaaagiacaaaaaaaaaaaaiaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
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
// Stats: 95 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Float 12 [_Fakelight]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
"3.0-!!ARBfp1.0
PARAM c[23] = { state.lightmodel.ambient,
		program.local[1..19],
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
MAD R0.xy, fragment.texcoord[0], c[11], c[11].zwzw;
MAD R4.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MOV R0.z, c[21].w;
MAD R1.zw, R0.xywy, c[22].x, -R0.z;
MUL R1.xy, R1.zwzw, R1.zwzw;
ADD_SAT R0.w, R1.x, R1.y;
ADD R1.x, -R0.w, c[21].w;
MUL R0.xyz, fragment.texcoord[4], R1.w;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
RCP R1.w, R1.x;
MOV R5.xy, c[22].xzzw;
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
MUL R0.w, R5.y, c[5].x;
ADD R0.w, R0, c[21];
DP3 R3.x, R2, fragment.texcoord[3];
DP3 R3.y, fragment.texcoord[4], R2;
MUL R5.zw, R3.xyxy, -c[15].x;
MAD R2.zw, R5, c[20].x, fragment.texcoord[0].xyxy;
ADD R3.zw, R2, -c[20].y;
MUL R3.xy, R3.w, c[21];
MAD R3.xy, R3.z, c[20].zwzw, R3;
ADD R3.xy, R3, c[20].y;
DP3 R1.x, R0, R1;
EX2 R0.w, R0.w;
MAX R1.w, R1, c[22].y;
POW R1.w, R1.w, R0.w;
TXP R2.x, fragment.texcoord[5], texture[1], 2D;
MUL R0.w, R2.x, c[22].x;
FLR R2.x, R0.w;
MUL R2.xyz, R2.x, c[3];
MUL R2.xyz, R2, R1.w;
MOV R1.w, c[15].x;
MAD R2.w, R1, -c[21].z, c[21];
MUL R3.xy, R3, c[14].x;
MUL R3.zw, R3.xyxy, R2.w;
MUL R6.xy, R3.zwzw, c[19].x;
MAD R3.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R3.xyz, R3, texture[4], 2D;
MUL R3.xyz, R3, c[8].x;
MAD R6.xy, R6, c[16], c[16].zwzw;
MUL R1.w, R1, c[20].y;
TEX R6.xyz, R6, texture[3], 2D;
ADD R6.xyz, -R6, c[21].w;
TEX R4.xyz, R4, texture[2], 2D;
ADD R1.w, R1, c[21];
MAD R5.zw, -R5, c[20].x, fragment.texcoord[0].xyxy;
MUL R5.zw, R5, R1.w;
MAX R1.w, R1.x, c[22].y;
MUL R1.xyz, R0.w, c[3];
MOV R0.w, c[21];
MUL R5.zw, R5, c[14].x;
POW R3.x, R3.x, c[18].x;
POW R3.z, R3.z, c[18].x;
POW R3.y, R3.y, c[18].x;
MAD R3.xyz, R4, -R3, R3;
MAX R4.xyz, R6, R4;
MAD R6.xy, R5.zwzw, c[16], c[16].zwzw;
MOV R5.yzw, c[13].xxyz;
MUL R4.xyz, R4, c[7].x;
TEX R6.xyz, R6, texture[3], 2D;
MUL R5.yzw, R5, c[9].x;
MUL R6.xyz, R5.yzww, R6;
POW R6.x, R6.x, c[17].x;
POW R6.z, R6.z, c[17].x;
POW R6.y, R6.y, c[17].x;
MAD R6.xyz, R4, -R6, R6;
ADD R3.xyz, R6, R3;
MUL R0.xyz, R3, R2;
MUL R2.xyz, R5.x, c[0];
MAD R1.xyz, R1.w, R1, R2;
ADD R0.w, R0, -c[7].x;
MAD R2.xyz, R4, R0.w, c[10];
MAD R0.xyz, R1, R2, R0;
MAD result.color.xyz, R3, c[12].x, R0;
MOV result.color.w, c[21];
END
# 95 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 109 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Float 12 [_Fakelight]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c20, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c21, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c22, -0.31830987, 1.00000000, 2.00000000, -1.00000000
def c23, 0.00000000, 10.00000000, 1.00000000, 0
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
mad r0.xy, v0, c11, c11.zwzw
texld r0.yw, r0, s0
mad_pp r2.xy, r0.wyzw, c22.z, c22.w
dp3_pp r0.z, c2, c2
rsq_pp r0.z, r0.z
mul_pp r5.xyz, r0.z, c2
add r3.xyz, r1, r5
dp3 r1.w, r3, r3
mul r0.xyz, v4, r2.y
mul_pp r4.xy, r2, r2
mad r2.xyz, v3, r2.x, r0
add_pp_sat r0.x, r4, r4.y
add_pp r0.x, -r0, c21.w
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
max r2.x, r0, c23
texldp r0.x, v5, s1
mov r0.y, c5.x
mad r0.y, r0, c23, c23.z
mul_pp r1.w, r0.x, c22.z
exp r2.y, r0.y
pow r0, r2.x, r2.y
frc r0.y, r1.w
mov r0.w, r0.x
add r0.y, r1.w, -r0
mul r0.xyz, r0.y, c3
mul r6.xyz, r0, r0.w
dp3 r0.w, v4, r1
dp3 r0.z, r1, v3
mul r3.xy, r0.zwzw, -c15.x
mad r2.xy, r3, c20.x, v0
add r7.xy, r2, c20.y
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s4
mul r1.xyz, r0, c8.x
pow r0, r1.x, c18.x
pow r2, r1.y, c18.x
mov r2.x, r0
pow r0, r1.z, c18.x
mad r0.xy, v0, c4, c4.zwzw
mov r2.z, r0
texld r1.xyz, r0, s2
mul r3.zw, r7.y, c20
mad r0.xy, r7.x, c21, r3.zwzw
mov r0.z, c15.x
add r0.xy, r0, c21.z
mad r2.xyz, r1, -r2, r2
mad r0.z, r0, c22.x, c22.y
mul r0.xy, r0, c14.x
mul r0.xy, r0, r0.z
mov r0.z, c15.x
mad r2.w, r0.z, c21.z, c21
mad r0.zw, -r3.xyxy, c20.x, v0.xyxy
mul r0.zw, r0, r2.w
mul r3.xy, r0.zwzw, c14.x
mov r0.w, c9.x
mul r0.xy, r0, c19.x
mad r0.xy, r0, c16, c16.zwzw
mad r3.xy, r3, c16, c16.zwzw
texld r0.xyz, r0, s3
texld r3.xyz, r3, s3
mul r7.xyz, c13, r0.w
mul r7.xyz, r7, r3
add r3.xyz, -r0, c21.w
max r1.xyz, r3, r1
pow r0, r7.x, c17.x
pow r3, r7.y, c17.x
mov r7.x, r0
pow r0, r7.z, c17.x
dp3 r0.w, r4, r5
mov r7.y, r3
max r2.w, r0, c23.x
mov r4.xyz, c0
mov r0.w, c7.x
mul r1.xyz, r1, c7.x
mov r7.z, r0
mad r0.xyz, r1, -r7, r7
add r0.xyz, r0, r2
add r0.w, c21, -r0
mul r2.xyz, r0, r6
mul r3.xyz, r1.w, c3
mul r4.xyz, c22.z, r4
mad r3.xyz, r2.w, r3, r4
mad r1.xyz, r1, r0.w, c10
mad r1.xyz, r3, r1, r2
mad oC0.xyz, r0, c12.x, r1
mov_pp oC0.w, c21
"
}
SubProgram "d3d11 " {
// Stats: 82 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Normalmap] 2D 3
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [_Mask] 2D 1
SetTexture 3 [_Glittermap] 2D 4
SetTexture 4 [_Specularglitter] 2D 2
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_Specularglitter_ST]
Float 144 [_MasktransparencyDebug]
Float 148 [_Specularpower05]
Float 152 [_Glitterpower]
Vector 160 [_Color]
Vector 176 [_Normalmap_ST]
Float 192 [_Fakelight]
Vector 208 [_Glittercolor]
Float 224 [_Glitterymaskdotsscale]
Float 228 [_Glitteryspeed01]
Vector 240 [_Glittermap_ST]
Float 256 [_Glittercontrast13]
Float 260 [_Specularcontrast13]
Float 264 [_Maskadjust0515]
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
eefiecedilgbaoailpekiebinigiogkdfmibpcfgabaaaaaahmanaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefceeamaaaaeaaaaaaabbadaaaa
fjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaae
aahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaaoaaaaaa
aceaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaa
baaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaaj
pcaabaaaacaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaa
dcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaa
acaaaaaaaaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalp
aaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaa
agiacaaaaaaaaaaaaoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaa
egiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaadiaaaaaj
lcaabaaaaaaaaaaakgikcaaaaaaaaaaaajaaaaaaegiicaaaaaaaaaaaanaaaaaa
diaaaaahlcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaf
lcaabaaaaaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaa
aaaaaaaaagiacaaaaaaaaaaabaaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaa
aaaaaaaaapaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplp
allnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaa
aceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaa
egaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaai
dcaabaaaacaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaal
icaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdo
abeaaaaaaaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaa
acaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaa
baaaaaaadcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaa
apaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaaaaaaaaalhcaabaaaacaaaaaa
egacbaiaebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaacaaaaaaaagabaaaabaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
agiacaaaaaaaaaaaajaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaa
egambaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
efaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaaeaaaaaaaagabaaa
acaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaa
ajaaaaaacpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaa
aeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaa
aeaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaiaebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaa
egambaaaaaaaaaaaegaibaaaadaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaa
acaaaaaaaaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaapgapbaaaabaaaaaaegiccaaa
acaaaaaaaaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaa
aaaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaa
aaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaa
adaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
alaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaa
afaaaaaaeghobaaaaaaaaaaaaagabaaaadaaaaaadcaaaaapdcaabaaaafaaaaaa
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
bkaabaaaabaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaoaaaaah
gcaabaaaabaaaaaaagbbbaaaagaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaa
adaaaaaajgafbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaah
ccaabaaaabaaaaaaakaabaaaadaaaaaaakaabaaaadaaaaaaebaaaaafecaabaaa
abaaaaaabkaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaabaaaaaa
egiccaaaaaaaaaaaafaaaaaadiaaaaaiocaabaaaabaaaaaakgakbaaaabaaaaaa
agijcaaaaaaaaaaaafaaaaaadiaaaaahocaabaaaabaaaaaakgakbaaaaaaaaaaa
fgaobaaaabaaaaaadiaaaaahocaabaaaabaaaaaaaganbaaaaaaaaaaafgaobaaa
abaaaaaaaaaaaaajhcaabaaaaeaaaaaaegiccaaaadaaaaaaaeaaaaaaegiccaaa
adaaaaaaaeaaaaaadcaaaaajhcaabaaaadaaaaaaagaabaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaaeaaaaaaaaaaaaajecaabaaaaaaaaaaaakiacaiaebaaaaaa
aaaaaaaaajaaaaaaabeaaaaaaaaaiadpdcaaaaakhcaabaaaacaaaaaakgakbaaa
aaaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaaakaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaajgahbaaaabaaaaaadcaaaaak
hccabaaaaaaaaaaaegadbaaaaaaaaaaaagiacaaaaaaaaaaaamaaaaaaegacbaaa
abaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
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
// Stats: 95 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Float 12 [_Fakelight]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
"3.0-!!ARBfp1.0
PARAM c[23] = { state.lightmodel.ambient,
		program.local[1..19],
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
MAD R0.xy, fragment.texcoord[0], c[11], c[11].zwzw;
MAD R4.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MOV R0.z, c[21].w;
MAD R1.zw, R0.xywy, c[22].x, -R0.z;
MUL R1.xy, R1.zwzw, R1.zwzw;
ADD_SAT R0.w, R1.x, R1.y;
ADD R1.x, -R0.w, c[21].w;
MUL R0.xyz, fragment.texcoord[4], R1.w;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
RCP R1.w, R1.x;
MOV R5.xy, c[22].xzzw;
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
MUL R0.w, R5.y, c[5].x;
ADD R0.w, R0, c[21];
DP3 R3.x, R2, fragment.texcoord[3];
DP3 R3.y, fragment.texcoord[4], R2;
MUL R5.zw, R3.xyxy, -c[15].x;
MAD R2.zw, R5, c[20].x, fragment.texcoord[0].xyxy;
ADD R3.zw, R2, -c[20].y;
MUL R3.xy, R3.w, c[21];
MAD R3.xy, R3.z, c[20].zwzw, R3;
ADD R3.xy, R3, c[20].y;
DP3 R1.x, R0, R1;
EX2 R0.w, R0.w;
MAX R1.w, R1, c[22].y;
POW R1.w, R1.w, R0.w;
TXP R2.x, fragment.texcoord[5], texture[1], 2D;
MUL R0.w, R2.x, c[22].x;
FLR R2.x, R0.w;
MUL R2.xyz, R2.x, c[3];
MUL R2.xyz, R2, R1.w;
MOV R1.w, c[15].x;
MAD R2.w, R1, -c[21].z, c[21];
MUL R3.xy, R3, c[14].x;
MUL R3.zw, R3.xyxy, R2.w;
MUL R6.xy, R3.zwzw, c[19].x;
MAD R3.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R3.xyz, R3, texture[4], 2D;
MUL R3.xyz, R3, c[8].x;
MAD R6.xy, R6, c[16], c[16].zwzw;
MUL R1.w, R1, c[20].y;
TEX R6.xyz, R6, texture[3], 2D;
ADD R6.xyz, -R6, c[21].w;
TEX R4.xyz, R4, texture[2], 2D;
ADD R1.w, R1, c[21];
MAD R5.zw, -R5, c[20].x, fragment.texcoord[0].xyxy;
MUL R5.zw, R5, R1.w;
MAX R1.w, R1.x, c[22].y;
MUL R1.xyz, R0.w, c[3];
MOV R0.w, c[21];
MUL R5.zw, R5, c[14].x;
POW R3.x, R3.x, c[18].x;
POW R3.z, R3.z, c[18].x;
POW R3.y, R3.y, c[18].x;
MAD R3.xyz, R4, -R3, R3;
MAX R4.xyz, R6, R4;
MAD R6.xy, R5.zwzw, c[16], c[16].zwzw;
MOV R5.yzw, c[13].xxyz;
MUL R4.xyz, R4, c[7].x;
TEX R6.xyz, R6, texture[3], 2D;
MUL R5.yzw, R5, c[9].x;
MUL R6.xyz, R5.yzww, R6;
POW R6.x, R6.x, c[17].x;
POW R6.z, R6.z, c[17].x;
POW R6.y, R6.y, c[17].x;
MAD R6.xyz, R4, -R6, R6;
ADD R3.xyz, R6, R3;
MUL R0.xyz, R3, R2;
MUL R2.xyz, R5.x, c[0];
MAD R1.xyz, R1.w, R1, R2;
ADD R0.w, R0, -c[7].x;
MAD R2.xyz, R4, R0.w, c[10];
MAD R0.xyz, R1, R2, R0;
MAD result.color.xyz, R3, c[12].x, R0;
MOV result.color.w, c[21];
END
# 95 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 109 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Float 12 [_Fakelight]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c20, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c21, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c22, -0.31830987, 1.00000000, 2.00000000, -1.00000000
def c23, 0.00000000, 10.00000000, 1.00000000, 0
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
mad r0.xy, v0, c11, c11.zwzw
texld r0.yw, r0, s0
mad_pp r2.xy, r0.wyzw, c22.z, c22.w
dp3_pp r0.z, c2, c2
rsq_pp r0.z, r0.z
mul_pp r5.xyz, r0.z, c2
add r3.xyz, r1, r5
dp3 r1.w, r3, r3
mul r0.xyz, v4, r2.y
mul_pp r4.xy, r2, r2
mad r2.xyz, v3, r2.x, r0
add_pp_sat r0.x, r4, r4.y
add_pp r0.x, -r0, c21.w
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
max r2.x, r0, c23
texldp r0.x, v5, s1
mov r0.y, c5.x
mad r0.y, r0, c23, c23.z
mul_pp r1.w, r0.x, c22.z
exp r2.y, r0.y
pow r0, r2.x, r2.y
frc r0.y, r1.w
mov r0.w, r0.x
add r0.y, r1.w, -r0
mul r0.xyz, r0.y, c3
mul r6.xyz, r0, r0.w
dp3 r0.w, v4, r1
dp3 r0.z, r1, v3
mul r3.xy, r0.zwzw, -c15.x
mad r2.xy, r3, c20.x, v0
add r7.xy, r2, c20.y
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s4
mul r1.xyz, r0, c8.x
pow r0, r1.x, c18.x
pow r2, r1.y, c18.x
mov r2.x, r0
pow r0, r1.z, c18.x
mad r0.xy, v0, c4, c4.zwzw
mov r2.z, r0
texld r1.xyz, r0, s2
mul r3.zw, r7.y, c20
mad r0.xy, r7.x, c21, r3.zwzw
mov r0.z, c15.x
add r0.xy, r0, c21.z
mad r2.xyz, r1, -r2, r2
mad r0.z, r0, c22.x, c22.y
mul r0.xy, r0, c14.x
mul r0.xy, r0, r0.z
mov r0.z, c15.x
mad r2.w, r0.z, c21.z, c21
mad r0.zw, -r3.xyxy, c20.x, v0.xyxy
mul r0.zw, r0, r2.w
mul r3.xy, r0.zwzw, c14.x
mov r0.w, c9.x
mul r0.xy, r0, c19.x
mad r0.xy, r0, c16, c16.zwzw
mad r3.xy, r3, c16, c16.zwzw
texld r0.xyz, r0, s3
texld r3.xyz, r3, s3
mul r7.xyz, c13, r0.w
mul r7.xyz, r7, r3
add r3.xyz, -r0, c21.w
max r1.xyz, r3, r1
pow r0, r7.x, c17.x
pow r3, r7.y, c17.x
mov r7.x, r0
pow r0, r7.z, c17.x
dp3 r0.w, r4, r5
mov r7.y, r3
max r2.w, r0, c23.x
mov r4.xyz, c0
mov r0.w, c7.x
mul r1.xyz, r1, c7.x
mov r7.z, r0
mad r0.xyz, r1, -r7, r7
add r0.xyz, r0, r2
add r0.w, c21, -r0
mul r2.xyz, r0, r6
mul r3.xyz, r1.w, c3
mul r4.xyz, c22.z, r4
mad r3.xyz, r2.w, r3, r4
mad r1.xyz, r1, r0.w, c10
mad r1.xyz, r3, r1, r2
mad oC0.xyz, r0, c12.x, r1
mov_pp oC0.w, c21
"
}
SubProgram "d3d11 " {
// Stats: 82 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Normalmap] 2D 3
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [_Mask] 2D 1
SetTexture 3 [_Glittermap] 2D 4
SetTexture 4 [_Specularglitter] 2D 2
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_Specularglitter_ST]
Float 144 [_MasktransparencyDebug]
Float 148 [_Specularpower05]
Float 152 [_Glitterpower]
Vector 160 [_Color]
Vector 176 [_Normalmap_ST]
Float 192 [_Fakelight]
Vector 208 [_Glittercolor]
Float 224 [_Glitterymaskdotsscale]
Float 228 [_Glitteryspeed01]
Vector 240 [_Glittermap_ST]
Float 256 [_Glittercontrast13]
Float 260 [_Specularcontrast13]
Float 264 [_Maskadjust0515]
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
eefiecedilgbaoailpekiebinigiogkdfmibpcfgabaaaaaahmanaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefceeamaaaaeaaaaaaabbadaaaa
fjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaae
aahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaaoaaaaaa
aceaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaa
baaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaaj
pcaabaaaacaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaa
dcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaa
acaaaaaaaaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalp
aaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaa
agiacaaaaaaaaaaaaoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaa
egiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaadiaaaaaj
lcaabaaaaaaaaaaakgikcaaaaaaaaaaaajaaaaaaegiicaaaaaaaaaaaanaaaaaa
diaaaaahlcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaf
lcaabaaaaaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaa
aaaaaaaaagiacaaaaaaaaaaabaaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaa
aaaaaaaaapaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplp
allnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaa
aceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaa
egaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaai
dcaabaaaacaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaal
icaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdo
abeaaaaaaaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaa
acaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaa
baaaaaaadcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaa
apaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaaaaaaaaalhcaabaaaacaaaaaa
egacbaiaebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaacaaaaaaaagabaaaabaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
agiacaaaaaaaaaaaajaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaa
egambaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
efaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaaeaaaaaaaagabaaa
acaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaa
ajaaaaaacpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaa
aeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaa
aeaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaiaebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaa
egambaaaaaaaaaaaegaibaaaadaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaa
acaaaaaaaaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaapgapbaaaabaaaaaaegiccaaa
acaaaaaaaaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaa
aaaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaa
aaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaa
adaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
alaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaa
afaaaaaaeghobaaaaaaaaaaaaagabaaaadaaaaaadcaaaaapdcaabaaaafaaaaaa
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
bkaabaaaabaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaoaaaaah
gcaabaaaabaaaaaaagbbbaaaagaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaa
adaaaaaajgafbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaah
ccaabaaaabaaaaaaakaabaaaadaaaaaaakaabaaaadaaaaaaebaaaaafecaabaaa
abaaaaaabkaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaabaaaaaa
egiccaaaaaaaaaaaafaaaaaadiaaaaaiocaabaaaabaaaaaakgakbaaaabaaaaaa
agijcaaaaaaaaaaaafaaaaaadiaaaaahocaabaaaabaaaaaakgakbaaaaaaaaaaa
fgaobaaaabaaaaaadiaaaaahocaabaaaabaaaaaaaganbaaaaaaaaaaafgaobaaa
abaaaaaaaaaaaaajhcaabaaaaeaaaaaaegiccaaaadaaaaaaaeaaaaaaegiccaaa
adaaaaaaaeaaaaaadcaaaaajhcaabaaaadaaaaaaagaabaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaaeaaaaaaaaaaaaajecaabaaaaaaaaaaaakiacaiaebaaaaaa
aaaaaaaaajaaaaaaabeaaaaaaaaaiadpdcaaaaakhcaabaaaacaaaaaakgakbaaa
aaaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaaakaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaajgahbaaaabaaaaaadcaaaaak
hccabaaaaaaaaaaaegadbaaaaaaaaaaaagiacaaaaaaaaaaaamaaaaaaegacbaaa
abaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
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
// Stats: 95 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Float 12 [_Fakelight]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
"3.0-!!ARBfp1.0
PARAM c[23] = { state.lightmodel.ambient,
		program.local[1..19],
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
MAD R0.xy, fragment.texcoord[0], c[11], c[11].zwzw;
MAD R4.xy, fragment.texcoord[0], c[4], c[4].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MOV R0.z, c[21].w;
MAD R1.zw, R0.xywy, c[22].x, -R0.z;
MUL R1.xy, R1.zwzw, R1.zwzw;
ADD_SAT R0.w, R1.x, R1.y;
ADD R1.x, -R0.w, c[21].w;
MUL R0.xyz, fragment.texcoord[4], R1.w;
RSQ R1.x, R1.x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
RCP R1.w, R1.x;
MOV R5.xy, c[22].xzzw;
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
MUL R0.w, R5.y, c[5].x;
ADD R0.w, R0, c[21];
DP3 R3.x, R2, fragment.texcoord[3];
DP3 R3.y, fragment.texcoord[4], R2;
MUL R5.zw, R3.xyxy, -c[15].x;
MAD R2.zw, R5, c[20].x, fragment.texcoord[0].xyxy;
ADD R3.zw, R2, -c[20].y;
MUL R3.xy, R3.w, c[21];
MAD R3.xy, R3.z, c[20].zwzw, R3;
ADD R3.xy, R3, c[20].y;
DP3 R1.x, R0, R1;
EX2 R0.w, R0.w;
MAX R1.w, R1, c[22].y;
POW R1.w, R1.w, R0.w;
TXP R2.x, fragment.texcoord[5], texture[1], 2D;
MUL R0.w, R2.x, c[22].x;
FLR R2.x, R0.w;
MUL R2.xyz, R2.x, c[3];
MUL R2.xyz, R2, R1.w;
MOV R1.w, c[15].x;
MAD R2.w, R1, -c[21].z, c[21];
MUL R3.xy, R3, c[14].x;
MUL R3.zw, R3.xyxy, R2.w;
MUL R6.xy, R3.zwzw, c[19].x;
MAD R3.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R3.xyz, R3, texture[4], 2D;
MUL R3.xyz, R3, c[8].x;
MAD R6.xy, R6, c[16], c[16].zwzw;
MUL R1.w, R1, c[20].y;
TEX R6.xyz, R6, texture[3], 2D;
ADD R6.xyz, -R6, c[21].w;
TEX R4.xyz, R4, texture[2], 2D;
ADD R1.w, R1, c[21];
MAD R5.zw, -R5, c[20].x, fragment.texcoord[0].xyxy;
MUL R5.zw, R5, R1.w;
MAX R1.w, R1.x, c[22].y;
MUL R1.xyz, R0.w, c[3];
MOV R0.w, c[21];
MUL R5.zw, R5, c[14].x;
POW R3.x, R3.x, c[18].x;
POW R3.z, R3.z, c[18].x;
POW R3.y, R3.y, c[18].x;
MAD R3.xyz, R4, -R3, R3;
MAX R4.xyz, R6, R4;
MAD R6.xy, R5.zwzw, c[16], c[16].zwzw;
MOV R5.yzw, c[13].xxyz;
MUL R4.xyz, R4, c[7].x;
TEX R6.xyz, R6, texture[3], 2D;
MUL R5.yzw, R5, c[9].x;
MUL R6.xyz, R5.yzww, R6;
POW R6.x, R6.x, c[17].x;
POW R6.z, R6.z, c[17].x;
POW R6.y, R6.y, c[17].x;
MAD R6.xyz, R4, -R6, R6;
ADD R3.xyz, R6, R3;
MUL R0.xyz, R3, R2;
MUL R2.xyz, R5.x, c[0];
MAD R1.xyz, R1.w, R1, R2;
ADD R0.w, R0, -c[7].x;
MAD R2.xyz, R4, R0.w, c[10];
MAD R0.xyz, R1, R2, R0;
MAD result.color.xyz, R3, c[12].x, R0;
MOV result.color.w, c[21];
END
# 95 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 109 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [glstate_lightmodel_ambient]
Vector 1 [_WorldSpaceCameraPos]
Vector 2 [_WorldSpaceLightPos0]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
Vector 6 [_Specularglitter_ST]
Float 7 [_MasktransparencyDebug]
Float 8 [_Specularpower05]
Float 9 [_Glitterpower]
Vector 10 [_Color]
Vector 11 [_Normalmap_ST]
Float 12 [_Fakelight]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c20, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c21, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c22, -0.31830987, 1.00000000, 2.00000000, -1.00000000
def c23, 0.00000000, 10.00000000, 1.00000000, 0
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
mad r0.xy, v0, c11, c11.zwzw
texld r0.yw, r0, s0
mad_pp r2.xy, r0.wyzw, c22.z, c22.w
dp3_pp r0.z, c2, c2
rsq_pp r0.z, r0.z
mul_pp r5.xyz, r0.z, c2
add r3.xyz, r1, r5
dp3 r1.w, r3, r3
mul r0.xyz, v4, r2.y
mul_pp r4.xy, r2, r2
mad r2.xyz, v3, r2.x, r0
add_pp_sat r0.x, r4, r4.y
add_pp r0.x, -r0, c21.w
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
max r2.x, r0, c23
texldp r0.x, v5, s1
mov r0.y, c5.x
mad r0.y, r0, c23, c23.z
mul_pp r1.w, r0.x, c22.z
exp r2.y, r0.y
pow r0, r2.x, r2.y
frc r0.y, r1.w
mov r0.w, r0.x
add r0.y, r1.w, -r0
mul r0.xyz, r0.y, c3
mul r6.xyz, r0, r0.w
dp3 r0.w, v4, r1
dp3 r0.z, r1, v3
mul r3.xy, r0.zwzw, -c15.x
mad r2.xy, r3, c20.x, v0
add r7.xy, r2, c20.y
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s4
mul r1.xyz, r0, c8.x
pow r0, r1.x, c18.x
pow r2, r1.y, c18.x
mov r2.x, r0
pow r0, r1.z, c18.x
mad r0.xy, v0, c4, c4.zwzw
mov r2.z, r0
texld r1.xyz, r0, s2
mul r3.zw, r7.y, c20
mad r0.xy, r7.x, c21, r3.zwzw
mov r0.z, c15.x
add r0.xy, r0, c21.z
mad r2.xyz, r1, -r2, r2
mad r0.z, r0, c22.x, c22.y
mul r0.xy, r0, c14.x
mul r0.xy, r0, r0.z
mov r0.z, c15.x
mad r2.w, r0.z, c21.z, c21
mad r0.zw, -r3.xyxy, c20.x, v0.xyxy
mul r0.zw, r0, r2.w
mul r3.xy, r0.zwzw, c14.x
mov r0.w, c9.x
mul r0.xy, r0, c19.x
mad r0.xy, r0, c16, c16.zwzw
mad r3.xy, r3, c16, c16.zwzw
texld r0.xyz, r0, s3
texld r3.xyz, r3, s3
mul r7.xyz, c13, r0.w
mul r7.xyz, r7, r3
add r3.xyz, -r0, c21.w
max r1.xyz, r3, r1
pow r0, r7.x, c17.x
pow r3, r7.y, c17.x
mov r7.x, r0
pow r0, r7.z, c17.x
dp3 r0.w, r4, r5
mov r7.y, r3
max r2.w, r0, c23.x
mov r4.xyz, c0
mov r0.w, c7.x
mul r1.xyz, r1, c7.x
mov r7.z, r0
mad r0.xyz, r1, -r7, r7
add r0.xyz, r0, r2
add r0.w, c21, -r0
mul r2.xyz, r0, r6
mul r3.xyz, r1.w, c3
mul r4.xyz, c22.z, r4
mad r3.xyz, r2.w, r3, r4
mad r1.xyz, r1, r0.w, c10
mad r1.xyz, r3, r1, r2
mad oC0.xyz, r0, c12.x, r1
mov_pp oC0.w, c21
"
}
SubProgram "d3d11 " {
// Stats: 82 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_Normalmap] 2D 3
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [_Mask] 2D 1
SetTexture 3 [_Glittermap] 2D 4
SetTexture 4 [_Specularglitter] 2D 2
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_Specularglitter_ST]
Float 144 [_MasktransparencyDebug]
Float 148 [_Specularpower05]
Float 152 [_Glitterpower]
Vector 160 [_Color]
Vector 176 [_Normalmap_ST]
Float 192 [_Fakelight]
Vector 208 [_Glittercolor]
Float 224 [_Glitterymaskdotsscale]
Float 228 [_Glitteryspeed01]
Vector 240 [_Glittermap_ST]
Float 256 [_Glittercontrast13]
Float 260 [_Specularcontrast13]
Float 264 [_Maskadjust0515]
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
eefiecedilgbaoailpekiebinigiogkdfmibpcfgabaaaaaahmanaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefceeamaaaaeaaaaaaabbadaaaa
fjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaae
aahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaaoaaaaaa
aceaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaa
baaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaaj
pcaabaaaacaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaa
dcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaa
acaaaaaaaaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalp
aaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaa
agiacaaaaaaaaaaaaoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaa
egiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaadiaaaaaj
lcaabaaaaaaaaaaakgikcaaaaaaaaaaaajaaaaaaegiicaaaaaaaaaaaanaaaaaa
diaaaaahlcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaf
lcaabaaaaaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaa
aaaaaaaaagiacaaaaaaaaaaabaaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaa
aaaaaaaaapaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplp
allnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaa
aceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaa
egaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaai
dcaabaaaacaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaal
icaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdo
abeaaaaaaaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaa
acaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaa
baaaaaaadcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaa
apaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaaaaaaaaalhcaabaaaacaaaaaa
egacbaiaebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaacaaaaaaaagabaaaabaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
agiacaaaaaaaaaaaajaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaa
egambaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
efaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaaeaaaaaaaagabaaa
acaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaa
ajaaaaaacpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaa
aeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaa
aeaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaiaebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaa
egambaaaaaaaaaaaegaibaaaadaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaa
acaaaaaaaaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaapgapbaaaabaaaaaaegiccaaa
acaaaaaaaaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaa
aaaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaa
aaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaa
adaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
alaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaa
afaaaaaaeghobaaaaaaaaaaaaagabaaaadaaaaaadcaaaaapdcaabaaaafaaaaaa
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
bkaabaaaabaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaoaaaaah
gcaabaaaabaaaaaaagbbbaaaagaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaa
adaaaaaajgafbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaah
ccaabaaaabaaaaaaakaabaaaadaaaaaaakaabaaaadaaaaaaebaaaaafecaabaaa
abaaaaaabkaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaabaaaaaa
egiccaaaaaaaaaaaafaaaaaadiaaaaaiocaabaaaabaaaaaakgakbaaaabaaaaaa
agijcaaaaaaaaaaaafaaaaaadiaaaaahocaabaaaabaaaaaakgakbaaaaaaaaaaa
fgaobaaaabaaaaaadiaaaaahocaabaaaabaaaaaaaganbaaaaaaaaaaafgaobaaa
abaaaaaaaaaaaaajhcaabaaaaeaaaaaaegiccaaaadaaaaaaaeaaaaaaegiccaaa
adaaaaaaaeaaaaaadcaaaaajhcaabaaaadaaaaaaagaabaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaaeaaaaaaaaaaaaajecaabaaaaaaaaaaaakiacaiaebaaaaaa
aaaaaaaaajaaaaaaabeaaaaaaaaaiadpdcaaaaakhcaabaaaacaaaaaakgakbaaa
aaaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaaakaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaajgahbaaaabaaaaaadcaaaaak
hccabaaaaaaaaaaaegadbaaaaaaaaaaaagiacaaaaaaaaaaaamaaaaaaegacbaaa
abaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
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
 //       d3d11 : 84 avg math (77..94), 7 avg texture (5..11)
 //        d3d9 : 112 avg math (104..124), 7 avg texture (5..11)
 //      opengl : 101 avg math (90..115), 7 avg texture (5..11)
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
ConstBuffer "$Globals" 272
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
  highp vec4 tmpvar_25;
  tmpvar_25.w = 0.0;
  tmpvar_25.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_14) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + ((tmpvar_14 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_25;
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
  highp vec4 tmpvar_25;
  tmpvar_25.w = 0.0;
  tmpvar_25.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_14) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + ((tmpvar_14 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_25;
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
  highp vec4 tmpvar_25;
  tmpvar_25.w = 0.0;
  tmpvar_25.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_14) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + ((tmpvar_14 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_25;
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
  highp vec4 tmpvar_22;
  tmpvar_22.w = 0.0;
  tmpvar_22.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_11) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + ((tmpvar_11 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_22;
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
  highp vec4 tmpvar_22;
  tmpvar_22.w = 0.0;
  tmpvar_22.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_11) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + ((tmpvar_11 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_22;
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
  highp vec4 tmpvar_22;
  tmpvar_22.w = 0.0;
  tmpvar_22.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_11) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + ((tmpvar_11 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_22;
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
ConstBuffer "$Globals" 272
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
  highp vec4 tmpvar_26;
  tmpvar_26.w = 0.0;
  tmpvar_26.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_15) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_21))) + ((tmpvar_15 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_22.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_21) + mix (pow ((tmpvar_24.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_26;
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
  highp vec4 tmpvar_26;
  tmpvar_26.w = 0.0;
  tmpvar_26.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_15) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_21))) + ((tmpvar_15 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_22.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_21) + mix (pow ((tmpvar_24.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_26;
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
  highp vec4 tmpvar_26;
  tmpvar_26.w = 0.0;
  tmpvar_26.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_15) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_21))) + ((tmpvar_15 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_22.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_21) + mix (pow ((tmpvar_24.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_26;
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
ConstBuffer "$Globals" 272
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
  highp vec4 tmpvar_25;
  tmpvar_25.w = 0.0;
  tmpvar_25.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_14) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + ((tmpvar_14 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_25;
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
  highp vec4 tmpvar_25;
  tmpvar_25.w = 0.0;
  tmpvar_25.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_14) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + ((tmpvar_14 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_25;
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
  highp vec4 tmpvar_25;
  tmpvar_25.w = 0.0;
  tmpvar_25.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_14) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + ((tmpvar_14 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_25;
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
ConstBuffer "$Globals" 272
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
  highp vec4 tmpvar_24;
  tmpvar_24.w = 0.0;
  tmpvar_24.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_13) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + ((tmpvar_13 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_19) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_24;
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
  highp vec4 tmpvar_24;
  tmpvar_24.w = 0.0;
  tmpvar_24.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_13) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + ((tmpvar_13 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_19) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_24;
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
  highp vec4 tmpvar_24;
  tmpvar_24.w = 0.0;
  tmpvar_24.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_13) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + ((tmpvar_13 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_19) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_24;
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
ConstBuffer "$Globals" 272
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
  highp vec4 tmpvar_31;
  tmpvar_31.w = 0.0;
  tmpvar_31.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_20) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_26))) + ((tmpvar_20 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_26) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_31;
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
  highp vec4 tmpvar_31;
  tmpvar_31.w = 0.0;
  tmpvar_31.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_20) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_26))) + ((tmpvar_20 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_26) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_31;
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
  highp vec4 tmpvar_31;
  tmpvar_31.w = 0.0;
  tmpvar_31.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_20) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_26))) + ((tmpvar_20 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_26) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_31;
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
ConstBuffer "$Globals" 272
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
  highp vec4 tmpvar_30;
  tmpvar_30.w = 0.0;
  tmpvar_30.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_19) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_30;
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
  highp vec4 tmpvar_30;
  tmpvar_30.w = 0.0;
  tmpvar_30.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_19) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_30;
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
  highp vec4 tmpvar_30;
  tmpvar_30.w = 0.0;
  tmpvar_30.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_19) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_30;
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
  highp vec4 tmpvar_24;
  tmpvar_24.w = 0.0;
  tmpvar_24.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_13) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + ((tmpvar_13 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_19) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_24;
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
  highp vec4 tmpvar_30;
  tmpvar_30.w = 0.0;
  tmpvar_30.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_19) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_30;
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
ConstBuffer "$Globals" 336
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
  highp vec4 tmpvar_30;
  tmpvar_30.w = 0.0;
  tmpvar_30.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_19) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_30;
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
  highp vec4 tmpvar_24;
  tmpvar_24.w = 0.0;
  tmpvar_24.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_13) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + ((tmpvar_13 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_19) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_24;
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
  highp vec4 tmpvar_30;
  tmpvar_30.w = 0.0;
  tmpvar_30.xyz = (((max (0.0, dot (tmpvar_10, tmpvar_11)) * tmpvar_19) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (normalize((tmpvar_7 + tmpvar_11)), tmpvar_10)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_30;
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
ConstBuffer "$Globals" 272
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
  highp vec4 tmpvar_30;
  tmpvar_30.w = 0.0;
  tmpvar_30.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_19) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_30;
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
  highp vec4 tmpvar_30;
  tmpvar_30.w = 0.0;
  tmpvar_30.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_19) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_30;
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
  highp vec4 tmpvar_30;
  tmpvar_30.w = 0.0;
  tmpvar_30.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_19) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_25))) + ((tmpvar_19 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_25) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_30;
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
ConstBuffer "$Globals" 272
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
  highp vec4 tmpvar_31;
  tmpvar_31.w = 0.0;
  tmpvar_31.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_20) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_26))) + ((tmpvar_20 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_26) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_31;
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
  highp vec4 tmpvar_31;
  tmpvar_31.w = 0.0;
  tmpvar_31.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_20) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_26))) + ((tmpvar_20 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_26) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_31;
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
  highp vec4 tmpvar_31;
  tmpvar_31.w = 0.0;
  tmpvar_31.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_20) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_26))) + ((tmpvar_20 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_26) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_31;
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
ConstBuffer "$Globals" 336
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
  highp vec4 tmpvar_47;
  tmpvar_47.w = 0.0;
  tmpvar_47.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_36) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_42))) + ((tmpvar_36 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_43.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_42) + mix (pow ((tmpvar_45.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_47;
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
  highp vec4 tmpvar_47;
  tmpvar_47.w = 0.0;
  tmpvar_47.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_36) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_42))) + ((tmpvar_36 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_43.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_42) + mix (pow ((tmpvar_45.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_47;
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
  highp vec4 tmpvar_47;
  tmpvar_47.w = 0.0;
  tmpvar_47.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_36) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_42))) + ((tmpvar_36 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_43.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_42) + mix (pow ((tmpvar_45.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_47;
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
ConstBuffer "$Globals" 336
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
  highp vec4 tmpvar_39;
  tmpvar_39.w = 0.0;
  tmpvar_39.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_28) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_34))) + ((tmpvar_28 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_35.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_34) + mix (pow ((tmpvar_37.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_39;
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
  highp vec4 tmpvar_39;
  tmpvar_39.w = 0.0;
  tmpvar_39.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_28) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_34))) + ((tmpvar_28 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_10)), tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_35.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_34) + mix (pow ((tmpvar_37.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_39;
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
ConstBuffer "$Globals" 272
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
  highp vec4 tmpvar_49;
  tmpvar_49.w = 0.0;
  tmpvar_49.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_38) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_44))) + ((tmpvar_38 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_45.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_44) + mix (pow ((tmpvar_47.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_49;
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
  highp vec4 tmpvar_49;
  tmpvar_49.w = 0.0;
  tmpvar_49.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_38) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_44))) + ((tmpvar_38 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_45.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_44) + mix (pow ((tmpvar_47.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_49;
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
  highp vec4 tmpvar_49;
  tmpvar_49.w = 0.0;
  tmpvar_49.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_38) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_44))) + ((tmpvar_38 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_45.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_44) + mix (pow ((tmpvar_47.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_49;
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
ConstBuffer "$Globals" 272
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
  highp vec4 tmpvar_50;
  tmpvar_50.w = 0.0;
  tmpvar_50.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_39) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_45))) + ((tmpvar_39 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_46.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_45) + mix (pow ((tmpvar_48.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_50;
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
  highp vec4 tmpvar_50;
  tmpvar_50.w = 0.0;
  tmpvar_50.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_39) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_45))) + ((tmpvar_39 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_46.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_45) + mix (pow ((tmpvar_48.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_50;
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
  highp vec4 tmpvar_50;
  tmpvar_50.w = 0.0;
  tmpvar_50.xyz = (((max (0.0, dot (tmpvar_9, tmpvar_10)) * tmpvar_39) * (_Color.xyz + ((1.0 - _MasktransparencyDebug) * tmpvar_45))) + ((tmpvar_39 * pow (max (0.0, dot (tmpvar_11, tmpvar_9)), exp2(((_Shininess * 10.0) + 1.0)))) * (mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_46.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_45) + mix (pow ((tmpvar_48.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz))));
  tmpvar_1 = tmpvar_50;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 93 math, 6 textures
Keywords { "POINT" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_Specularglitter_ST]
Float 6 [_MasktransparencyDebug]
Float 7 [_Specularpower05]
Float 8 [_Glitterpower]
Vector 9 [_Color]
Vector 10 [_Normalmap_ST]
Vector 11 [_Glittercolor]
Float 12 [_Glitterymaskdotsscale]
Float 13 [_Glitteryspeed01]
Vector 14 [_Glittermap_ST]
Float 15 [_Glittercontrast13]
Float 16 [_Specularcontrast13]
Float 17 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
"3.0-!!ARBfp1.0
PARAM c[21] = { program.local[0..17],
		{ 2, 1, 0, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MAD R0.xy, fragment.texcoord[0], c[10], c[10].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[18].x, -c[18].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.w, R1.x, R1.y;
MUL R2.xyz, R0.y, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[18].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MOV R5.xyz, c[11];
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R1, R0;
DP3 R0.x, R2, R2;
RSQ R0.w, R0.x;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
ADD R1.xyz, -fragment.texcoord[1], c[0];
DP3 R2.w, R1, R1;
DP3 R1.w, R0, R0;
RSQ R1.w, R1.w;
MUL R3.xyz, R1.w, R0;
RSQ R2.w, R2.w;
MUL R1.xyz, R2.w, R1;
ADD R0.xyz, R3, R1;
MUL R2.xyz, R0.w, R2;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.z, R2, R0;
DP3 R4.x, fragment.texcoord[3], R1;
DP3 R4.y, fragment.texcoord[4], R1;
MUL R4.xy, R4, -c[13].x;
MAD R1.xy, R4, c[18].w, fragment.texcoord[0];
ADD R1.xy, R1, -c[19].x;
MUL R0.xy, R1.y, c[19].wyzw;
MAD R0.xy, R1.x, c[19].yzzw, R0;
ADD R0.xy, R0, c[19].x;
MOV R1.w, c[13].x;
MAX R0.w, R0.z, c[18].z;
MUL R0.z, R1.w, -c[20].x;
ADD R1.x, R0.z, c[18].y;
MUL R0.xy, R0, c[12].x;
MUL R0.xy, R0, R1.x;
MOV R0.z, c[20].y;
MUL R0.z, R0, c[4].x;
ADD R0.z, R0, c[18].y;
EX2 R1.x, R0.z;
MUL R0.xy, R0, c[17].x;
MAD R0.xy, R0, c[14], c[14].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
POW R0.w, R0.w, R1.x;
ADD R1.xyz, -R0, c[18].y;
MUL R0.x, R1.w, c[19];
ADD R0.z, R0.x, c[18].y;
MAD R4.xy, -R4, c[18].w, fragment.texcoord[0];
MUL R4.xy, R4, R0.z;
MAD R0.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R0.xyz, R0, texture[2], 2D;
MUL R4.xy, R4, c[12].x;
MAD R4.xy, R4, c[14], c[14].zwzw;
DP3 R1.w, fragment.texcoord[5], fragment.texcoord[5];
MAX R1.xyz, R1, R0;
TEX R4.xyz, R4, texture[3], 2D;
MUL R5.xyz, R5, c[8].x;
MUL R5.xyz, R5, R4;
MUL R4.xyz, R1, c[6].x;
MAD R1.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R1.xyz, R1, texture[4], 2D;
MUL R1.xyz, R1, c[7].x;
TEX R1.w, R1.w, texture[1], 2D;
POW R5.x, R5.x, c[15].x;
POW R5.y, R5.y, c[15].x;
POW R5.z, R5.z, c[15].x;
MAD R5.xyz, R4, -R5, R5;
POW R1.x, R1.x, c[16].x;
POW R1.y, R1.y, c[16].x;
POW R1.z, R1.z, c[16].x;
MAD R1.xyz, R0, -R1, R1;
MUL R0.xyz, R1.w, c[2];
DP3 R1.w, R2, R3;
ADD R1.xyz, R5, R1;
MUL R0.xyz, R0, c[18].x;
MUL R5.xyz, R0, R0.w;
MOV R0.w, c[18].y;
MAX R1.w, R1, c[18].z;
ADD R0.w, R0, -c[6].x;
MUL R1.xyz, R5, R1;
MUL R0.xyz, R1.w, R0;
MAD R2.xyz, R0.w, R4, c[9];
MAD result.color.xyz, R0, R2, R1;
MOV result.color.w, c[18].z;
END
# 93 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 104 math, 6 textures
Keywords { "POINT" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_Specularglitter_ST]
Float 6 [_MasktransparencyDebug]
Float 7 [_Specularpower05]
Float 8 [_Glitterpower]
Vector 9 [_Color]
Vector 10 [_Normalmap_ST]
Vector 11 [_Glittercolor]
Float 12 [_Glitterymaskdotsscale]
Float 13 [_Glitteryspeed01]
Vector 14 [_Glittermap_ST]
Float 15 [_Glittercontrast13]
Float 16 [_Specularcontrast13]
Float 17 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c18, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c19, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c20, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c21, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
mad r0.xy, v0, c10, c10.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c18.x, c18.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c18
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
mad r0.xyz, r0.x, v3, r2
mul r1.xyz, r1.x, v2
rcp_pp r0.w, r0.w
mad r0.xyz, r0.w, r1, r0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r2.xyz, r0.w, r0
mad r1.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
dp3 r1.w, r0, r0
rsq r1.w, r1.w
rsq r0.w, r0.w
mul r3.xyz, r0.w, r1
mul r0.xyz, r1.w, r0
dp3 r1.x, v3, r0
dp3 r1.y, v4, r0
mul r1.xy, r1, -c13.x
mad r1.zw, r1.xyxy, c19.x, v0.xyxy
add r4.xy, r1.zwzw, c19.y
add r0.xyz, r3, r0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r0.z, r2, r0
mul r1.zw, r4.y, c19
mad r1.zw, r4.x, c20.xyxy, r1
add r0.xy, r1.zwzw, c20.z
max r2.w, r0.z, c18.z
mov r0.z, c13.x
mov r0.w, c4.x
mad r0.w, r0, c21.z, c21.y
mad r0.z, r0, c21.x, c21.y
mul r0.xy, r0, c12.x
mul r0.xy, r0, r0.z
mul r1.zw, r0.xyxy, c17.x
mad r4.xy, r1.zwzw, c14, c14.zwzw
exp r3.w, r0.w
pow r0, r2.w, r3.w
mov r0.w, c13.x
texld r4.xyz, r4, s3
mov r1.w, r0.x
add r0.xyz, -r4, c18.w
mad r4.xy, -r1, c19.x, v0
mad r0.w, r0, c20.z, c20
mul r4.xy, r4, r0.w
mov r0.w, c8.x
mad r1.xy, v0, c3, c3.zwzw
texld r1.xyz, r1, s2
mul r4.xy, r4, c12.x
mad r4.xy, r4, c14, c14.zwzw
max r0.xyz, r0, r1
mul r5.xyz, c11, r0.w
texld r4.xyz, r4, s3
mul r6.xyz, r5, r4
pow r5, r6.x, c15.x
mul r4.xyz, r0, c6.x
pow r0, r6.y, c15.x
mov r5.y, r0
pow r0, r6.z, c15.x
mad r6.xy, v0, c5, c5.zwzw
texld r6.xyz, r6, s4
mul r7.xyz, r6, c7.x
mov r5.z, r0
pow r0, r7.x, c16.x
mad r6.xyz, r4, -r5, r5
pow r5, r7.y, c16.x
mov r5.x, r0
pow r0, r7.z, c16.x
mov r5.z, r0
mad r1.xyz, r1, -r5, r5
dp3 r0.w, r2, r3
dp3 r0.x, v5, v5
texld r0.x, r0.x, s1
mul r0.xyz, r0.x, c2
mul r0.xyz, r0, c18.x
mul r5.xyz, r0, r1.w
add r1.xyz, r6, r1
mov r1.w, c6.x
max r0.w, r0, c18.z
add r1.w, c18, -r1
mul r1.xyz, r5, r1
mul r0.xyz, r0.w, r0
mad r2.xyz, r1.w, r4, c9
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c18.z
"
}
SubProgram "d3d11 " {
// Stats: 79 math, 6 textures
Keywords { "POINT" "SHADOWS_OFF" }
SetTexture 0 [_Normalmap] 2D 3
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_Mask] 2D 1
SetTexture 3 [_Glittermap] 2D 4
SetTexture 4 [_Specularglitter] 2D 2
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_Specularglitter_ST]
Float 144 [_MasktransparencyDebug]
Float 148 [_Specularpower05]
Float 152 [_Glitterpower]
Vector 160 [_Color]
Vector 176 [_Normalmap_ST]
Vector 208 [_Glittercolor]
Float 224 [_Glitterymaskdotsscale]
Float 228 [_Glitteryspeed01]
Vector 240 [_Glittermap_ST]
Float 256 [_Glittercontrast13]
Float 260 [_Specularcontrast13]
Float 264 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedidjjmafdklkhakldldgiihcpegbjmppcabaaaaaaaianaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcnaalaaaaeaaaaaaapeacaaaa
fjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaa
agaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaadiaaaaaldcaabaaa
aaaaaaaafgifcaaaaaaaaaaaaoaaaaaaaceaaaaamnmmemdnmnmmemlnaaaaaaaa
aaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaa
abaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaa
egbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaa
afaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaaagafbaaaaaaaaaaa
egaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaa
aaaaaaaaaoaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaahdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaakdcaabaaaacaaaaaa
ogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaal
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaa
aaaaaaaaapaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaaaaaaaaaeghobaaa
adaaaaaaaagabaaaaeaaaaaadiaaaaajlcaabaaaaaaaaaaakgikcaaaaaaaaaaa
ajaaaaaaegiicaaaaaaaaaaaanaaaaaadiaaaaahlcaabaaaaaaaaaaaegaibaaa
adaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
diaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaaaaaaaaaabaaaaaaa
bjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaakbcaabaaaadaaaaaa
egaabaaaacaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaak
ccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaa
aaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaa
agiacaaaaaaaaaaaaoaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaa
aaaaaaaaaoaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaa
acaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaaidcaabaaaacaaaaaa
egaabaaaacaaaaaakgikcaaaaaaaaaaabaaaaaaadcaaaaaldcaabaaaacaaaaaa
egaabaaaacaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaa
efaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
aeaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaaj
pcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaa
deaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaajaaaaaadcaaaaak
lcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaaaaaaaaaaegambaaa
aaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaa
aeaaaaaaeghobaaaaeaaaaaaaagabaaaacaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaaajaaaaaacpaaaaafhcaabaaaaeaaaaaa
egacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaa
aaaaaaaabaaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaak
hcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaaaeaaaaaaegacbaaa
aeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaaaaaaaaaaegaibaaaadaaaaaa
dcaaaaamhcaabaaaadaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadcaaaaaj
hcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaadaaaaaa
baaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
hcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaldcaabaaa
afaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaa
alaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaaaaaaaaa
aagabaaaadaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaaafaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaaegbcbaaaafaaaaaa
dcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaaaeaaaaaaegacbaaa
agaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaaegaabaaaafaaaaaa
ddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
ecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaaaeaaaaaakgakbaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaa
baaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaah
bcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaadeaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaahecaabaaaaaaaaaaa
ckaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaa
aaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaa
diaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaabaaaaaabjaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaa
agaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaafgafbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaabaaaaaaakaabaaa
adaaaaaaakaabaaaadaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaa
agijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaa
jgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaaagaabaaa
abaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaa
aaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaajaaaaaaabeaaaaa
aaaaiadpdcaaaaakhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaa
egiccaaaaaaaaaaaakaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
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
// Stats: 90 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_Specularglitter_ST]
Float 6 [_MasktransparencyDebug]
Float 7 [_Specularpower05]
Float 8 [_Glitterpower]
Vector 9 [_Color]
Vector 10 [_Normalmap_ST]
Vector 11 [_Glittercolor]
Float 12 [_Glitterymaskdotsscale]
Float 13 [_Glitteryspeed01]
Vector 14 [_Glittermap_ST]
Float 15 [_Glittercontrast13]
Float 16 [_Specularcontrast13]
Float 17 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Specularglitter] 2D 3
"3.0-!!ARBfp1.0
PARAM c[21] = { program.local[0..17],
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
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.x, R1, R1;
RSQ R0.w, R0.x;
MAD R2.xy, fragment.texcoord[0], c[10], c[10].zwzw;
TEX R2.yw, R2, texture[0], 2D;
MAD R3.xy, R2.wyzw, c[18].x, -c[18].y;
DP3 R1.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R1.xyz, R0.w, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MUL R5.xy, R3, R3;
MUL R2.xyz, R3.y, fragment.texcoord[4];
ADD_SAT R0.w, R5.x, R5.y;
ADD R0.w, -R0, c[18].y;
RSQ R0.w, R0.w;
ADD R4.xyz, R1, R0;
MAD R3.xyz, R3.x, fragment.texcoord[3], R2;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R2, R3;
DP3 R0.w, R2, R2;
DP3 R1.w, R4, R4;
RSQ R1.w, R1.w;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R2;
MUL R4.xyz, R1.w, R4;
DP3 R1.w, R3, R4;
DP3 R1.x, R3, R1;
MOV R0.w, c[20].y;
MUL R2.x, R0.w, c[4];
DP3 R0.w, fragment.texcoord[4], R0;
DP3 R0.z, fragment.texcoord[3], R0;
MUL R6.xy, R0.zwzw, -c[13].x;
MOV R0.zw, c[18].xyxy;
ADD R2.x, R2, c[18].y;
EX2 R0.x, R2.x;
MAX R1.w, R1, c[18].z;
POW R1.w, R1.w, R0.x;
MAD R0.xy, R6, c[18].w, fragment.texcoord[0];
MUL R2.xyz, R0.z, c[2];
MUL R5.xyz, R2, R1.w;
ADD R0.xy, R0, -c[19].x;
MUL R4.xy, R0.y, c[19].wyzw;
MAD R0.xy, R0.x, c[19].yzzw, R4;
MOV R1.w, c[13].x;
MUL R0.z, R1.w, -c[20].x;
ADD R0.xy, R0, c[19].x;
MUL R1.w, R1, c[19].x;
MAX R1.x, R1, c[18].z;
ADD R0.z, R0, c[18].y;
MUL R0.xy, R0, c[12].x;
MUL R4.xy, R0, R0.z;
MUL R6.zw, R4.xyxy, c[17].x;
MAD R0.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
MUL R0.xyz, R0, c[7].x;
MAD R4.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R4.xyz, R4, texture[1], 2D;
POW R0.x, R0.x, c[16].x;
POW R0.z, R0.z, c[16].x;
POW R0.y, R0.y, c[16].x;
MAD R7.xyz, R4, -R0, R0;
MAD R0.xy, R6.zwzw, c[14], c[14].zwzw;
TEX R0.xyz, R0, texture[2], 2D;
ADD R0.xyz, -R0, c[18].y;
MAX R4.xyz, R0, R4;
MUL R4.xyz, R4, c[6].x;
MUL R1.xyz, R1.x, R2;
ADD R0.w, R0, -c[6].x;
ADD R1.w, R1, c[18].y;
MAD R6.xy, -R6, c[18].w, fragment.texcoord[0];
MUL R6.xy, R6, R1.w;
MUL R6.xy, R6, c[12].x;
MAD R0.xy, R6, c[14], c[14].zwzw;
MOV R6.xyz, c[11];
TEX R0.xyz, R0, texture[2], 2D;
MUL R6.xyz, R6, c[8].x;
MUL R0.xyz, R6, R0;
POW R0.x, R0.x, c[15].x;
POW R0.z, R0.z, c[15].x;
POW R0.y, R0.y, c[15].x;
MAD R0.xyz, R4, -R0, R0;
ADD R0.xyz, R0, R7;
MUL R0.xyz, R5, R0;
MAD R2.xyz, R0.w, R4, c[9];
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[18].z;
END
# 90 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 105 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_Specularglitter_ST]
Float 6 [_MasktransparencyDebug]
Float 7 [_Specularpower05]
Float 8 [_Glitterpower]
Vector 9 [_Color]
Vector 10 [_Normalmap_ST]
Vector 11 [_Glittercolor]
Float 12 [_Glitterymaskdotsscale]
Float 13 [_Glitteryspeed01]
Vector 14 [_Glittermap_ST]
Float 15 [_Glittercontrast13]
Float 16 [_Specularcontrast13]
Float 17 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Specularglitter] 2D 3
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c18, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c19, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c20, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c21, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
mad_pp r0.xyz, -v1, c1.w, c1
dp3_pp r0.w, r0, r0
rsq_pp r0.w, r0.w
mul_pp r4.xyz, r0.w, r0
add r2.xyz, -v1, c0
dp3 r0.z, r2, r2
mad r0.xy, v0, c10, c10.zwzw
texld r1.yw, r0, s0
rsq r0.z, r0.z
mul r0.xyz, r0.z, r2
mad_pp r2.xy, r1.wyzw, c18.x, c18.y
add r3.xyz, r4, r0
mul_pp r5.xy, r2, r2
mul r1.xyz, r2.y, v4
mad r2.xyz, r2.x, v3, r1
add_pp_sat r0.w, r5.x, r5.y
dp3 r1.w, r3, r3
rsq r1.w, r1.w
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c18
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
mul r3.xyz, r1.w, r3
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r2
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r2.xyz, r0.w, r1
dp3 r0.w, r2, r3
dp3 r1.x, v3, r0
dp3 r1.y, v4, r0
mul r1.xy, r1, -c13.x
mad r0.xy, r1, c19.x, v0
add r3.xy, r0, c19.y
mov r0.z, c4.x
mad r0.z, r0, c21, c21.y
mul r1.zw, r3.y, c19
exp r3.z, r0.z
max r2.w, r0, c18.z
pow r0, r2.w, r3.z
mad r0.zw, r3.x, c20.xyxy, r1
add r0.zw, r0, c20.z
mov r1.w, r0.x
mul r0.xy, r0.zwzw, c12.x
mov r0.w, c13.x
mov r0.z, c13.x
mad r0.z, r0, c21.x, c21.y
mul r0.xy, r0, r0.z
mul r3.xy, r0, c17.x
mad r0.w, r0, c20.z, c20
mad r1.xy, -r1, c19.x, v0
mul r1.xy, r1, r0.w
mul r0.zw, r1.xyxy, c12.x
mad r0.xy, r0.zwzw, c14, c14.zwzw
mov r0.w, c8.x
texld r0.xyz, r0, s2
mul r1.xyz, c11, r0.w
mul r6.xyz, r1, r0
mad r0.xy, r3, c14, c14.zwzw
pow r3, r6.x, c15.x
mov r6.x, r3
mad r1.xy, v0, c3, c3.zwzw
texld r0.xyz, r0, s2
texld r1.xyz, r1, s1
add r0.xyz, -r0, c18.w
max r0.xyz, r0, r1
mul r5.xyz, r0, c6.x
pow r0, r6.y, c15.x
mad r3.xy, v0, c5, c5.zwzw
mov r6.y, r0
texld r0.xyz, r3, s3
mul r7.xyz, r0, c7.x
pow r3, r6.z, c15.x
pow r0, r7.x, c16.x
mov r6.z, r3
pow r3, r7.y, c16.x
mov r7.x, r0
pow r0, r7.z, c16.x
mov r7.z, r0
mov r7.y, r3
dp3 r0.w, r2, r4
mov r0.xyz, c2
mul r0.xyz, c18.x, r0
mul r3.xyz, r0, r1.w
mov r1.w, c6.x
max r0.w, r0, c18.z
add r1.w, c18, -r1
mad r6.xyz, r5, -r6, r6
mad r1.xyz, r1, -r7, r7
add r1.xyz, r6, r1
mul r1.xyz, r3, r1
mul r0.xyz, r0.w, r0
mad r2.xyz, r1.w, r5, c9
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c18.z
"
}
SubProgram "d3d11 " {
// Stats: 77 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
SetTexture 0 [_Normalmap] 2D 2
SetTexture 1 [_Mask] 2D 0
SetTexture 2 [_Glittermap] 2D 3
SetTexture 3 [_Specularglitter] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 32 [_Mask_ST]
Float 48 [_Shininess]
Vector 64 [_Specularglitter_ST]
Float 80 [_MasktransparencyDebug]
Float 84 [_Specularpower05]
Float 88 [_Glitterpower]
Vector 96 [_Color]
Vector 112 [_Normalmap_ST]
Vector 144 [_Glittercolor]
Float 160 [_Glitterymaskdotsscale]
Float 164 [_Glitteryspeed01]
Vector 176 [_Glittermap_ST]
Float 192 [_Glittercontrast13]
Float 196 [_Specularcontrast13]
Float 200 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedckfcejoabnbcinalcffpnfjnkpgckiefabaaaaaahaamaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfaalaaaa
eaaaaaaaneacaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaadiaaaaaldcaabaaa
aaaaaaaafgifcaaaaaaaaaaaakaaaaaaaceaaaaamnmmemdnmnmmemlnaaaaaaaa
aaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaa
abaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaa
egbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaa
afaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaaagafbaaaaaaaaaaa
egaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaa
aaaaaaaaakaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaahdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaakdcaabaaaacaaaaaa
ogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaal
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaa
aaaaaaaaalaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaaaaaaaaaeghobaaa
acaaaaaaaagabaaaadaaaaaadiaaaaajlcaabaaaaaaaaaaakgikcaaaaaaaaaaa
afaaaaaaegiicaaaaaaaaaaaajaaaaaadiaaaaahlcaabaaaaaaaaaaaegaibaaa
adaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
diaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaaaaaaaaaaamaaaaaa
bjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaakbcaabaaaadaaaaaa
egaabaaaacaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaak
ccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaa
aaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaa
agiacaaaaaaaaaaaakaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaa
aaaaaaaaakaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaa
acaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaaidcaabaaaacaaaaaa
egaabaaaacaaaaaakgikcaaaaaaaaaaaamaaaaaadcaaaaaldcaabaaaacaaaaaa
egaabaaaacaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaa
efaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaacaaaaaaaagabaaa
adaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaacaaaaaaogikcaaaaaaaaaaaacaaaaaaefaaaaaj
pcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
deaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaafaaaaaadcaaaaak
lcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaaaaaaaaaaegambaaa
aaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaa
aeaaaaaaeghobaaaadaaaaaaaagabaaaabaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaaafaaaaaacpaaaaafhcaabaaaaeaaaaaa
egacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaa
aaaaaaaaamaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaak
hcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaaaeaaaaaaegacbaaa
aeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaaaaaaaaaaegaibaaaadaaaaaa
dcaaaaamhcaabaaaadaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadcaaaaaj
hcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaadaaaaaa
baaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
hcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaldcaabaaa
afaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaa
ahaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaaaaaaaaa
aagabaaaacaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaaafaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaaegbcbaaaafaaaaaa
dcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaaaeaaaaaaegacbaaa
agaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaaegaabaaaafaaaaaa
ddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
ecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaaaeaaaaaakgakbaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaa
baaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaah
bcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaadeaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaahecaabaaaaaaaaaaa
ckaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaaadaaaaaaabeaaaaa
aaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaa
diaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaabaaaaaabjaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaajocaabaaaabaaaaaaagijcaaa
aaaaaaaaabaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaaadaaaaaa
kgakbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaa
abaaaaaaagaabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaa
egacbaaaadaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaa
afaaaaaaabeaaaaaaaaaiadpdcaaaaakhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egacbaaaacaaaaaaegiccaaaaaaaaaaaagaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 98 math, 7 textures
Keywords { "SPOT" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_Specularglitter_ST]
Float 6 [_MasktransparencyDebug]
Float 7 [_Specularpower05]
Float 8 [_Glitterpower]
Vector 9 [_Color]
Vector 10 [_Normalmap_ST]
Vector 11 [_Glittercolor]
Float 12 [_Glitterymaskdotsscale]
Float 13 [_Glitteryspeed01]
Vector 14 [_Glittermap_ST]
Float 15 [_Glittercontrast13]
Float 16 [_Specularcontrast13]
Float 17 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
"3.0-!!ARBfp1.0
PARAM c[21] = { program.local[0..17],
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
MAD R0.xy, fragment.texcoord[0], c[10], c[10].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[18].x, -c[18].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.w, R1.x, R1.y;
MUL R2.xyz, R0.y, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[18].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MOV R5.xyz, c[11];
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R1, R0;
DP3 R0.x, R2, R2;
RSQ R0.w, R0.x;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
ADD R1.xyz, -fragment.texcoord[1], c[0];
DP3 R2.w, R1, R1;
DP3 R1.w, R0, R0;
RSQ R2.w, R2.w;
MUL R1.xyz, R2.w, R1;
RSQ R1.w, R1.w;
MUL R3.xyz, R1.w, R0;
ADD R0.xyz, R3, R1;
MUL R2.xyz, R0.w, R2;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.z, R2, R0;
DP3 R4.x, fragment.texcoord[3], R1;
DP3 R4.y, fragment.texcoord[4], R1;
MUL R4.xy, R4, -c[13].x;
MAD R1.xy, R4, c[19].x, fragment.texcoord[0];
ADD R1.xy, R1, -c[18].w;
MUL R0.xy, R1.y, c[19].wyzw;
MAD R0.xy, R1.x, c[19].yzzw, R0;
ADD R0.xy, R0, c[18].w;
MAX R0.w, R0.z, c[18].z;
MOV R1.w, c[13].x;
MUL R0.z, R1.w, -c[20].x;
ADD R1.x, R0.z, c[18].y;
MUL R0.xy, R0, c[12].x;
MUL R0.xy, R0, R1.x;
MOV R0.z, c[20].y;
MUL R0.z, R0, c[4].x;
ADD R0.z, R0, c[18].y;
EX2 R1.x, R0.z;
MUL R0.xy, R0, c[17].x;
MAD R0.xy, R0, c[14], c[14].zwzw;
TEX R0.xyz, R0, texture[4], 2D;
POW R2.w, R0.w, R1.x;
ADD R1.xyz, -R0, c[18].y;
MAD R0.zw, -R4.xyxy, c[19].x, fragment.texcoord[0].xyxy;
MAD R1.w, R1, c[18], c[18].y;
MUL R4.xy, R0.zwzw, R1.w;
RCP R0.w, fragment.texcoord[5].w;
MAD R0.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
MUL R4.xy, R4, c[12].x;
MAD R4.xy, R4, c[14], c[14].zwzw;
MAD R6.xy, fragment.texcoord[5], R0.w, c[18].w;
DP3 R1.w, fragment.texcoord[5], fragment.texcoord[5];
MAX R1.xyz, R1, R0;
TEX R4.xyz, R4, texture[4], 2D;
MUL R5.xyz, R5, c[8].x;
MUL R5.xyz, R5, R4;
MUL R4.xyz, R1, c[6].x;
MAD R1.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R1.xyz, R1, texture[5], 2D;
MUL R1.xyz, R1, c[7].x;
POW R1.x, R1.x, c[16].x;
POW R1.y, R1.y, c[16].x;
POW R1.z, R1.z, c[16].x;
MAD R0.xyz, R0, -R1, R1;
TEX R1.w, R1.w, texture[2], 2D;
POW R5.x, R5.x, c[15].x;
POW R5.y, R5.y, c[15].x;
POW R5.z, R5.z, c[15].x;
MAD R5.xyz, R4, -R5, R5;
ADD R1.xyz, R5, R0;
TEX R0.w, R6, texture[1], 2D;
SLT R3.w, c[18].z, fragment.texcoord[5].z;
MUL R0.w, R3, R0;
MUL R0.w, R0, R1;
MUL R0.w, R0, c[18].x;
MUL R0.xyz, R0.w, c[2];
MUL R5.xyz, R0, R2.w;
DP3 R1.w, R2, R3;
MOV R0.w, c[18].y;
MAX R1.w, R1, c[18].z;
ADD R0.w, R0, -c[6].x;
MUL R1.xyz, R5, R1;
MUL R0.xyz, R1.w, R0;
MAD R2.xyz, R0.w, R4, c[9];
MAD result.color.xyz, R0, R2, R1;
MOV result.color.w, c[18].z;
END
# 98 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 109 math, 7 textures
Keywords { "SPOT" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_Specularglitter_ST]
Float 6 [_MasktransparencyDebug]
Float 7 [_Specularpower05]
Float 8 [_Glitterpower]
Vector 9 [_Color]
Vector 10 [_Normalmap_ST]
Vector 11 [_Glittercolor]
Float 12 [_Glitterymaskdotsscale]
Float 13 [_Glitteryspeed01]
Vector 14 [_Glittermap_ST]
Float 15 [_Glittercontrast13]
Float 16 [_Specularcontrast13]
Float 17 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c18, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c19, 0.50000000, 0.05000000, -0.50000000, 1.00000000
def c20, 0.00159374, -0.99999875, -0.00159374, 0
def c21, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
mad r0.xy, v0, c10, c10.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c18.x, c18.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c18
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
mad r0.xyz, r0.x, v3, r2
mul r1.xyz, r1.x, v2
rcp_pp r0.w, r0.w
mad r0.xyz, r0.w, r1, r0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r2.xyz, r0.w, r0
mad r1.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
dp3 r1.w, r0, r0
rsq r1.w, r1.w
rsq r0.w, r0.w
mul r3.xyz, r0.w, r1
mul r0.xyz, r1.w, r0
dp3 r1.x, v3, r0
dp3 r1.y, v4, r0
mul r1.xy, r1, -c13.x
mad r1.zw, r1.xyxy, c19.y, v0.xyxy
add r4.xy, r1.zwzw, c19.z
add r0.xyz, r3, r0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r0.z, r2, r0
mul r1.zw, r4.y, c20.xyxy
mad r1.zw, r4.x, c20.xyyz, r1
add r0.xy, r1.zwzw, c19.x
max r2.w, r0.z, c18.z
mov r0.z, c13.x
mov r0.w, c4.x
mad r0.w, r0, c21.z, c21.y
mad r0.z, r0, c21.x, c21.y
mul r0.xy, r0, c12.x
mul r0.xy, r0, r0.z
mul r1.zw, r0.xyxy, c17.x
mad r4.xy, r1.zwzw, c14, c14.zwzw
exp r3.w, r0.w
pow r0, r2.w, r3.w
mov r0.w, c13.x
texld r4.xyz, r4, s4
mov r1.w, r0.x
add r0.xyz, -r4, c18.w
mad r4.xy, -r1, c19.y, v0
mad r0.w, r0, c19.x, c19
mul r4.xy, r4, r0.w
mov r0.w, c8.x
mad r1.xy, v0, c3, c3.zwzw
texld r1.xyz, r1, s3
mul r4.xy, r4, c12.x
mad r4.xy, r4, c14, c14.zwzw
max r0.xyz, r0, r1
mul r5.xyz, c11, r0.w
texld r4.xyz, r4, s4
mul r6.xyz, r5, r4
pow r5, r6.x, c15.x
mul r4.xyz, r0, c6.x
pow r0, r6.y, c15.x
mov r5.y, r0
pow r0, r6.z, c15.x
mov r5.z, r0
mad r6.xy, v0, c5, c5.zwzw
texld r6.xyz, r6, s5
mul r7.xyz, r6, c7.x
pow r0, r7.x, c16.x
pow r6, r7.y, c16.x
mov r6.x, r0
pow r0, r7.z, c16.x
rcp r0.x, v5.w
mad r7.xy, v5, r0.x, c19.x
dp3 r0.x, v5, v5
mad r5.xyz, r4, -r5, r5
texld r0.w, r7, s1
cmp r0.y, -v5.z, c18.z, c18.w
mul_pp r0.y, r0, r0.w
texld r0.x, r0.x, s2
mul_pp r0.w, r0.y, r0.x
mov r6.z, r0
mad r0.xyz, r1, -r6, r6
add r1.xyz, r5, r0
mul_pp r0.w, r0, c18.x
mul r0.xyz, r0.w, c2
mul r5.xyz, r0, r1.w
dp3 r0.w, r2, r3
mov r1.w, c6.x
max r0.w, r0, c18.z
add r1.w, c18, -r1
mul r1.xyz, r5, r1
mul r0.xyz, r0.w, r0
mad r2.xyz, r1.w, r4, c9
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c18.z
"
}
SubProgram "d3d11 " {
// Stats: 84 math, 7 textures
Keywords { "SPOT" "SHADOWS_OFF" }
SetTexture 0 [_Normalmap] 2D 4
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_LightTextureB0] 2D 1
SetTexture 3 [_Mask] 2D 2
SetTexture 4 [_Glittermap] 2D 5
SetTexture 5 [_Specularglitter] 2D 3
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_Specularglitter_ST]
Float 144 [_MasktransparencyDebug]
Float 148 [_Specularpower05]
Float 152 [_Glitterpower]
Vector 160 [_Color]
Vector 176 [_Normalmap_ST]
Vector 208 [_Glittercolor]
Float 224 [_Glitterymaskdotsscale]
Float 228 [_Glitteryspeed01]
Vector 240 [_Glittermap_ST]
Float 256 [_Glittercontrast13]
Float 260 [_Specularcontrast13]
Float 264 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecednhkacpofpidegaojdmdefgmkblchgahlabaaaaaaoaanaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefckiamaaaaeaaaaaaackadaaaa
fjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaaagaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaadiaaaaaldcaabaaaaaaaaaaa
fgifcaaaaaaaaaaaaoaaaaaaaceaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaaa
aaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaa
aeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaa
aeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaa
egacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaaagafbaaaaaaaaaaaegaebaaa
adaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaa
aoaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaahdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaakdcaabaaaacaaaaaaogakbaaa
acaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaaldcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaa
apaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaaaaaaaaaeghobaaaaeaaaaaa
aagabaaaafaaaaaadiaaaaajlcaabaaaaaaaaaaakgikcaaaaaaaaaaaajaaaaaa
egiicaaaaaaaaaaaanaaaaaadiaaaaahlcaabaaaaaaaaaaaegaibaaaadaaaaaa
egambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaadiaaaaai
lcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaaaaaaaaaabaaaaaaabjaaaaaf
lcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaakbcaabaaaadaaaaaaegaabaaa
acaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaa
adaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaa
aaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaaagiacaaa
aaaaaaaaaoaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaa
aoaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaaacaaaaaa
pgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaa
acaaaaaakgikcaaaaaaaaaaabaaaaaaadcaaaaaldcaabaaaacaaaaaaegaabaaa
acaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaaj
pcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaa
aaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaaacaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaadaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaadeaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaajaaaaaadcaaaaaklcaabaaa
aaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaa
dcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaa
eghobaaaafaaaaaaaagabaaaadaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaa
aeaaaaaafgifcaaaaaaaaaaaajaaaaaacpaaaaafhcaabaaaaeaaaaaaegacbaaa
aeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaa
baaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaa
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
egbabaaaabaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaa
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
pgbpbaaaagaaaaaaaaaaaaakgcaabaaaabaaaaaafgagbaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaaadpaaaaaadpaaaaaaaaefaaaaajpcaabaaaadaaaaaajgafbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaadbaaaaahccaabaaaabaaaaaa
abeaaaaaaaaaaaaackbabaaaagaaaaaaabaaaaahccaabaaaabaaaaaabkaabaaa
abaaaaaaabeaaaaaaaaaiadpdiaaaaahccaabaaaabaaaaaadkaabaaaadaaaaaa
bkaabaaaabaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaagaaaaaaegbcbaaa
agaaaaaaefaaaaajpcaabaaaadaaaaaakgakbaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaabaaaaaaapaaaaahccaabaaaabaaaaaafgafbaaaabaaaaaaagaabaaa
adaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaaagijcaaaaaaaaaaa
afaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaajgahbaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaaagaabaaaabaaaaaadiaaaaah
hcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajicaabaaa
aaaaaaaaakiacaiaebaaaaaaaaaaaaaaajaaaaaaabeaaaaaaaaaiadpdcaaaaak
hcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaa
akaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
"
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
// Stats: 95 math, 7 textures
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_Specularglitter_ST]
Float 6 [_MasktransparencyDebug]
Float 7 [_Specularpower05]
Float 8 [_Glitterpower]
Vector 9 [_Color]
Vector 10 [_Normalmap_ST]
Vector 11 [_Glittercolor]
Float 12 [_Glitterymaskdotsscale]
Float 13 [_Glitteryspeed01]
Vector 14 [_Glittermap_ST]
Float 15 [_Glittercontrast13]
Float 16 [_Specularcontrast13]
Float 17 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
"3.0-!!ARBfp1.0
PARAM c[21] = { program.local[0..17],
		{ 2, 1, 0, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MAD R0.xy, fragment.texcoord[0], c[10], c[10].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[18].x, -c[18].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.w, R1.x, R1.y;
MUL R2.xyz, R0.y, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[18].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MOV R5.xyz, c[11];
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R1, R0;
DP3 R0.x, R2, R2;
RSQ R0.w, R0.x;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
ADD R1.xyz, -fragment.texcoord[1], c[0];
DP3 R2.w, R1, R1;
DP3 R1.w, R0, R0;
RSQ R2.w, R2.w;
MUL R1.xyz, R2.w, R1;
RSQ R1.w, R1.w;
MUL R3.xyz, R1.w, R0;
ADD R0.xyz, R3, R1;
MUL R2.xyz, R0.w, R2;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.z, R2, R0;
DP3 R4.x, fragment.texcoord[3], R1;
DP3 R4.y, fragment.texcoord[4], R1;
MUL R4.xy, R4, -c[13].x;
MAD R1.xy, R4, c[18].w, fragment.texcoord[0];
ADD R1.xy, R1, -c[19].x;
MUL R0.xy, R1.y, c[19].wyzw;
MAD R0.xy, R1.x, c[19].yzzw, R0;
ADD R0.xy, R0, c[19].x;
MAX R1.y, R0.z, c[18].z;
MOV R0.w, c[13].x;
MUL R0.z, R0.w, -c[20].x;
ADD R1.x, R0.z, c[18].y;
MUL R0.xy, R0, c[12].x;
MUL R0.xy, R0, R1.x;
MOV R0.z, c[20].y;
MUL R0.z, R0, c[4].x;
ADD R0.z, R0, c[18].y;
EX2 R1.x, R0.z;
MUL R0.xy, R0, c[17].x;
MAD R0.xy, R0, c[14], c[14].zwzw;
TEX R0.xyz, R0, texture[4], 2D;
POW R2.w, R1.y, R1.x;
ADD R1.xyz, -R0, c[18].y;
MUL R0.x, R0.w, c[19];
ADD R1.w, R0.x, c[18].y;
MAD R0.zw, -R4.xyxy, c[18].w, fragment.texcoord[0].xyxy;
MUL R4.xy, R0.zwzw, R1.w;
MAD R0.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
MUL R4.xy, R4, c[12].x;
MAD R4.xy, R4, c[14], c[14].zwzw;
DP3 R1.w, fragment.texcoord[5], fragment.texcoord[5];
MAX R1.xyz, R1, R0;
TEX R4.xyz, R4, texture[4], 2D;
MUL R5.xyz, R5, c[8].x;
MUL R5.xyz, R5, R4;
MUL R4.xyz, R1, c[6].x;
MAD R1.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R1.xyz, R1, texture[5], 2D;
MUL R1.xyz, R1, c[7].x;
TEX R1.w, R1.w, texture[1], 2D;
TEX R0.w, fragment.texcoord[5], texture[2], CUBE;
MUL R0.w, R1, R0;
DP3 R1.w, R2, R3;
POW R5.x, R5.x, c[15].x;
POW R5.y, R5.y, c[15].x;
POW R5.z, R5.z, c[15].x;
MAD R5.xyz, R4, -R5, R5;
POW R1.x, R1.x, c[16].x;
POW R1.y, R1.y, c[16].x;
POW R1.z, R1.z, c[16].x;
MAD R1.xyz, R0, -R1, R1;
MUL R0.xyz, R0.w, c[2];
MOV R0.w, c[18].y;
ADD R0.w, R0, -c[6].x;
ADD R1.xyz, R5, R1;
MUL R0.xyz, R0, c[18].x;
MUL R5.xyz, R0, R2.w;
MAX R1.w, R1, c[18].z;
MUL R1.xyz, R5, R1;
MUL R0.xyz, R1.w, R0;
MAD R2.xyz, R0.w, R4, c[9];
MAD result.color.xyz, R0, R2, R1;
MOV result.color.w, c[18].z;
END
# 95 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 107 math, 7 textures
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_Specularglitter_ST]
Float 6 [_MasktransparencyDebug]
Float 7 [_Specularpower05]
Float 8 [_Glitterpower]
Vector 9 [_Color]
Vector 10 [_Normalmap_ST]
Vector 11 [_Glittercolor]
Float 12 [_Glitterymaskdotsscale]
Float 13 [_Glitteryspeed01]
Vector 14 [_Glittermap_ST]
Float 15 [_Glittercontrast13]
Float 16 [_Specularcontrast13]
Float 17 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c18, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c19, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c20, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c21, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
mad r0.xyz, -v1, c1.w, c1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r3.xyz, r0.w, r0
add r2.xyz, -v1, c0
dp3 r0.z, r2, r2
mad r0.xy, v0, c10, c10.zwzw
texld r1.yw, r0, s0
rsq r0.z, r0.z
mul r0.xyz, r0.z, r2
mad_pp r2.xy, r1.wyzw, c18.x, c18.y
add r4.xyz, r3, r0
mul_pp r5.xy, r2, r2
mul r1.xyz, r2.y, v4
mad r2.xyz, r2.x, v3, r1
add_pp_sat r0.w, r5.x, r5.y
dp3 r1.w, r4, r4
rsq r1.w, r1.w
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c18
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
mul r4.xyz, r1.w, r4
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r2
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r2.xyz, r0.w, r1
dp3 r0.w, r2, r4
dp3 r1.x, v3, r0
dp3 r1.y, v4, r0
mul r1.xy, r1, -c13.x
mad r0.xy, r1, c19.x, v0
add r4.xy, r0, c19.y
mov r0.z, c4.x
mad r0.z, r0, c21, c21.y
mul r1.zw, r4.y, c19
max r2.w, r0, c18.z
exp r3.w, r0.z
pow r0, r2.w, r3.w
mad r0.zw, r4.x, c20.xyxy, r1
add r0.zw, r0, c20.z
mov r1.w, r0.x
mul r0.xy, r0.zwzw, c12.x
mov r0.w, c13.x
mov r0.z, c13.x
mad r0.z, r0, c21.x, c21.y
mul r0.xy, r0, r0.z
mul r4.xy, r0, c17.x
mad r0.w, r0, c20.z, c20
mad r1.xy, -r1, c19.x, v0
mul r1.xy, r1, r0.w
mul r0.zw, r1.xyxy, c12.x
mad r0.xy, r0.zwzw, c14, c14.zwzw
mov r0.w, c8.x
texld r0.xyz, r0, s4
mul r1.xyz, c11, r0.w
mul r6.xyz, r1, r0
pow r5, r6.x, c15.x
mov r6.x, r5
mad r0.xy, r4, c14, c14.zwzw
mad r1.xy, v0, c3, c3.zwzw
texld r0.xyz, r0, s4
texld r1.xyz, r1, s3
add r0.xyz, -r0, c18.w
max r0.xyz, r0, r1
mul r4.xyz, r0, c6.x
pow r0, r6.y, c15.x
mov r6.y, r0
mad r5.xy, v0, c5, c5.zwzw
texld r0.xyz, r5, s5
mul r7.xyz, r0, c7.x
pow r5, r6.z, c15.x
pow r0, r7.x, c16.x
mov r6.z, r5
mad r5.xyz, r4, -r6, r6
mov r7.x, r0
pow r0, r7.z, c16.x
pow r6, r7.y, c16.x
dp3 r0.x, v5, v5
mov r7.z, r0
mov r7.y, r6
mad r1.xyz, r1, -r7, r7
texld r0.w, v5, s2
texld r0.x, r0.x, s1
mul r0.x, r0, r0.w
dp3 r0.w, r2, r3
mul r0.xyz, r0.x, c2
add r1.xyz, r5, r1
mul r0.xyz, r0, c18.x
mul r5.xyz, r0, r1.w
mov r1.w, c6.x
max r0.w, r0, c18.z
add r1.w, c18, -r1
mul r1.xyz, r5, r1
mul r0.xyz, r0.w, r0
mad r2.xyz, r1.w, r4, c9
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c18.z
"
}
SubProgram "d3d11 " {
// Stats: 79 math, 7 textures
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
SetTexture 0 [_Normalmap] 2D 4
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 0
SetTexture 3 [_Mask] 2D 2
SetTexture 4 [_Glittermap] 2D 5
SetTexture 5 [_Specularglitter] 2D 3
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_Specularglitter_ST]
Float 144 [_MasktransparencyDebug]
Float 148 [_Specularpower05]
Float 152 [_Glitterpower]
Vector 160 [_Color]
Vector 176 [_Normalmap_ST]
Vector 208 [_Glittercolor]
Float 224 [_Glitterymaskdotsscale]
Float 228 [_Glitteryspeed01]
Vector 240 [_Glittermap_ST]
Float 256 [_Glittercontrast13]
Float 260 [_Specularcontrast13]
Float 264 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecednbcbdbnmidhkgoickodekffkloigankaabaaaaaaeianaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbaamaaaaeaaaaaaaaeadaaaa
fjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaadiaaaaaldcaabaaaaaaaaaaa
fgifcaaaaaaaaaaaaoaaaaaaaceaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaaa
aaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaa
aeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaa
aeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaa
egacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaaagafbaaaaaaaaaaaegaebaaa
adaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaa
aoaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaahdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaakdcaabaaaacaaaaaaogakbaaa
acaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaaldcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaa
apaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaaaaaaaaaeghobaaaaeaaaaaa
aagabaaaafaaaaaadiaaaaajlcaabaaaaaaaaaaakgikcaaaaaaaaaaaajaaaaaa
egiicaaaaaaaaaaaanaaaaaadiaaaaahlcaabaaaaaaaaaaaegaibaaaadaaaaaa
egambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaadiaaaaai
lcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaaaaaaaaaabaaaaaaabjaaaaaf
lcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaakbcaabaaaadaaaaaaegaabaaa
acaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaa
adaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaa
aaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaaagiacaaa
aaaaaaaaaoaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaa
aoaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaaacaaaaaa
pgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaa
acaaaaaakgikcaaaaaaaaaaabaaaaaaadcaaaaaldcaabaaaacaaaaaaegaabaaa
acaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaaj
pcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaa
aaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaaacaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaadaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaadeaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaajaaaaaadcaaaaaklcaabaaa
aaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaa
dcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaa
eghobaaaafaaaaaaaagabaaaadaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaa
aeaaaaaafgifcaaaaaaaaaaaajaaaaaacpaaaaafhcaabaaaaeaaaaaaegacbaaa
aeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaa
baaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaa
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
egbabaaaabaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaa
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
abaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaaeaaaaaaegbcbaaaagaaaaaa
eghobaaaacaaaaaaaagabaaaaaaaaaaaapaaaaahccaabaaaabaaaaaaagaabaaa
adaaaaaapgapbaaaaeaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaa
agijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaa
jgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaaagaabaaa
abaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaa
aaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaajaaaaaaabeaaaaa
aaaaiadpdcaaaaakhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaa
egiccaaaaaaaaaaaakaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
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
// Stats: 92 math, 6 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_Specularglitter_ST]
Float 6 [_MasktransparencyDebug]
Float 7 [_Specularpower05]
Float 8 [_Glitterpower]
Vector 9 [_Color]
Vector 10 [_Normalmap_ST]
Vector 11 [_Glittercolor]
Float 12 [_Glitterymaskdotsscale]
Float 13 [_Glitteryspeed01]
Vector 14 [_Glittermap_ST]
Float 15 [_Glittercontrast13]
Float 16 [_Specularcontrast13]
Float 17 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
"3.0-!!ARBfp1.0
PARAM c[21] = { program.local[0..17],
		{ 2, 1, 0, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MAD R0.xy, fragment.texcoord[0], c[10], c[10].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[18].x, -c[18].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.w, R1.x, R1.y;
MUL R2.xyz, R0.y, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[18].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MOV R5.xyz, c[11];
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R1, R0;
DP3 R0.x, R2, R2;
RSQ R0.w, R0.x;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
ADD R1.xyz, -fragment.texcoord[1], c[0];
DP3 R2.w, R1, R1;
DP3 R1.w, R0, R0;
RSQ R1.w, R1.w;
MUL R3.xyz, R1.w, R0;
RSQ R2.w, R2.w;
MUL R1.xyz, R2.w, R1;
ADD R0.xyz, R3, R1;
MUL R2.xyz, R0.w, R2;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.z, R2, R0;
DP3 R4.x, fragment.texcoord[3], R1;
DP3 R4.y, fragment.texcoord[4], R1;
MUL R4.xy, R4, -c[13].x;
MAD R1.xy, R4, c[18].w, fragment.texcoord[0];
ADD R1.xy, R1, -c[19].x;
MUL R0.xy, R1.y, c[19].wyzw;
MAD R0.xy, R1.x, c[19].yzzw, R0;
ADD R0.xy, R0, c[19].x;
MOV R1.w, c[13].x;
MAX R0.w, R0.z, c[18].z;
MUL R0.z, R1.w, -c[20].x;
ADD R1.x, R0.z, c[18].y;
MUL R0.xy, R0, c[12].x;
MUL R0.xy, R0, R1.x;
MOV R0.z, c[20].y;
MUL R0.z, R0, c[4].x;
ADD R0.z, R0, c[18].y;
EX2 R1.x, R0.z;
MUL R0.xy, R0, c[17].x;
MAD R0.xy, R0, c[14], c[14].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
POW R0.w, R0.w, R1.x;
ADD R1.xyz, -R0, c[18].y;
MUL R0.x, R1.w, c[19];
ADD R0.z, R0.x, c[18].y;
MAD R4.xy, -R4, c[18].w, fragment.texcoord[0];
MUL R4.xy, R4, R0.z;
MAD R0.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R0.xyz, R0, texture[2], 2D;
MUL R4.xy, R4, c[12].x;
MAD R4.xy, R4, c[14], c[14].zwzw;
MAX R1.xyz, R1, R0;
TEX R4.xyz, R4, texture[3], 2D;
MUL R5.xyz, R5, c[8].x;
MUL R5.xyz, R5, R4;
MUL R4.xyz, R1, c[6].x;
MAD R1.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R1.xyz, R1, texture[4], 2D;
MUL R1.xyz, R1, c[7].x;
TEX R1.w, fragment.texcoord[5], texture[1], 2D;
POW R5.x, R5.x, c[15].x;
POW R5.y, R5.y, c[15].x;
POW R5.z, R5.z, c[15].x;
MAD R5.xyz, R4, -R5, R5;
POW R1.x, R1.x, c[16].x;
POW R1.y, R1.y, c[16].x;
POW R1.z, R1.z, c[16].x;
MAD R1.xyz, R0, -R1, R1;
MUL R0.xyz, R1.w, c[2];
DP3 R1.w, R2, R3;
ADD R1.xyz, R5, R1;
MUL R0.xyz, R0, c[18].x;
MUL R5.xyz, R0, R0.w;
MOV R0.w, c[18].y;
MAX R1.w, R1, c[18].z;
ADD R0.w, R0, -c[6].x;
MUL R1.xyz, R5, R1;
MUL R0.xyz, R1.w, R0;
MAD R2.xyz, R0.w, R4, c[9];
MAD result.color.xyz, R0, R2, R1;
MOV result.color.w, c[18].z;
END
# 92 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 105 math, 6 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_Specularglitter_ST]
Float 6 [_MasktransparencyDebug]
Float 7 [_Specularpower05]
Float 8 [_Glitterpower]
Vector 9 [_Color]
Vector 10 [_Normalmap_ST]
Vector 11 [_Glittercolor]
Float 12 [_Glitterymaskdotsscale]
Float 13 [_Glitteryspeed01]
Vector 14 [_Glittermap_ST]
Float 15 [_Glittercontrast13]
Float 16 [_Specularcontrast13]
Float 17 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c18, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c19, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c20, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c21, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xy
mad_pp r0.xyz, -v1, c1.w, c1
dp3_pp r0.w, r0, r0
rsq_pp r0.w, r0.w
mul_pp r4.xyz, r0.w, r0
add r2.xyz, -v1, c0
dp3 r0.z, r2, r2
mad r0.xy, v0, c10, c10.zwzw
texld r1.yw, r0, s0
rsq r0.z, r0.z
mul r0.xyz, r0.z, r2
mad_pp r2.xy, r1.wyzw, c18.x, c18.y
add r3.xyz, r4, r0
mul_pp r5.xy, r2, r2
mul r1.xyz, r2.y, v4
mad r2.xyz, r2.x, v3, r1
add_pp_sat r0.w, r5.x, r5.y
dp3 r1.w, r3, r3
rsq r1.w, r1.w
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c18
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
mul r3.xyz, r1.w, r3
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r2
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r2.xyz, r0.w, r1
dp3 r0.w, r2, r3
dp3 r1.x, v3, r0
dp3 r1.y, v4, r0
mul r1.xy, r1, -c13.x
mad r0.xy, r1, c19.x, v0
add r3.xy, r0, c19.y
mov r0.z, c4.x
mad r0.z, r0, c21, c21.y
mul r1.zw, r3.y, c19
exp r3.z, r0.z
max r2.w, r0, c18.z
pow r0, r2.w, r3.z
mad r0.zw, r3.x, c20.xyxy, r1
add r0.zw, r0, c20.z
mov r1.w, r0.x
mul r0.xy, r0.zwzw, c12.x
mov r0.w, c13.x
mov r0.z, c13.x
mad r0.z, r0, c21.x, c21.y
mul r0.xy, r0, r0.z
mul r3.xy, r0, c17.x
mad r0.w, r0, c20.z, c20
mad r1.xy, -r1, c19.x, v0
mul r1.xy, r1, r0.w
mul r0.zw, r1.xyxy, c12.x
mad r0.xy, r0.zwzw, c14, c14.zwzw
mov r0.w, c8.x
texld r0.xyz, r0, s3
mul r1.xyz, c11, r0.w
mul r6.xyz, r1, r0
mad r0.xy, r3, c14, c14.zwzw
pow r3, r6.x, c15.x
mov r6.x, r3
mad r1.xy, v0, c3, c3.zwzw
texld r0.xyz, r0, s3
texld r1.xyz, r1, s2
add r0.xyz, -r0, c18.w
max r0.xyz, r0, r1
mul r5.xyz, r0, c6.x
pow r0, r6.y, c15.x
mad r3.xy, v0, c5, c5.zwzw
mov r6.y, r0
texld r0.xyz, r3, s4
mul r7.xyz, r0, c7.x
pow r3, r6.z, c15.x
pow r0, r7.x, c16.x
mov r6.z, r3
pow r3, r7.y, c16.x
mov r7.x, r0
pow r0, r7.z, c16.x
mov r7.y, r3
mov r7.z, r0
texld r0.w, v5, s1
mul r0.xyz, r0.w, c2
mul r0.xyz, r0, c18.x
mul r3.xyz, r0, r1.w
dp3 r0.w, r2, r4
mov r1.w, c6.x
max r0.w, r0, c18.z
add r1.w, c18, -r1
mad r6.xyz, r5, -r6, r6
mad r1.xyz, r1, -r7, r7
add r1.xyz, r6, r1
mul r1.xyz, r3, r1
mul r0.xyz, r0.w, r0
mad r2.xyz, r1.w, r5, c9
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c18.z
"
}
SubProgram "d3d11 " {
// Stats: 78 math, 6 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
SetTexture 0 [_Normalmap] 2D 3
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_Mask] 2D 1
SetTexture 3 [_Glittermap] 2D 4
SetTexture 4 [_Specularglitter] 2D 2
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_Specularglitter_ST]
Float 144 [_MasktransparencyDebug]
Float 148 [_Specularpower05]
Float 152 [_Glitterpower]
Vector 160 [_Color]
Vector 176 [_Normalmap_ST]
Vector 208 [_Glittercolor]
Float 224 [_Glitterymaskdotsscale]
Float 228 [_Glitteryspeed01]
Vector 240 [_Glittermap_ST]
Float 256 [_Glittercontrast13]
Float 260 [_Specularcontrast13]
Float 264 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedejpgdmjlkcppbgpelgeaihgmnjgboplfabaaaaaaomamaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefclealaaaaeaaaaaaaonacaaaa
fjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaadiaaaaaldcaabaaa
aaaaaaaafgifcaaaaaaaaaaaaoaaaaaaaceaaaaamnmmemdnmnmmemlnaaaaaaaa
aaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaa
abaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaa
egbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaa
afaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaaagafbaaaaaaaaaaa
egaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaa
aaaaaaaaaoaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaahdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaakdcaabaaaacaaaaaa
ogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaal
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaa
aaaaaaaaapaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaaaaaaaaaeghobaaa
adaaaaaaaagabaaaaeaaaaaadiaaaaajlcaabaaaaaaaaaaakgikcaaaaaaaaaaa
ajaaaaaaegiicaaaaaaaaaaaanaaaaaadiaaaaahlcaabaaaaaaaaaaaegaibaaa
adaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
diaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaaaaaaaaaabaaaaaaa
bjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaakbcaabaaaadaaaaaa
egaabaaaacaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaak
ccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaa
aaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaa
agiacaaaaaaaaaaaaoaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaa
aaaaaaaaaoaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaa
acaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaaidcaabaaaacaaaaaa
egaabaaaacaaaaaakgikcaaaaaaaaaaabaaaaaaadcaaaaaldcaabaaaacaaaaaa
egaabaaaacaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaa
efaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
aeaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaaj
pcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaa
deaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaajaaaaaadcaaaaak
lcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaaaaaaaaaaegambaaa
aaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaa
aeaaaaaaeghobaaaaeaaaaaaaagabaaaacaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaaajaaaaaacpaaaaafhcaabaaaaeaaaaaa
egacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaa
aaaaaaaabaaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaak
hcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaaaeaaaaaaegacbaaa
aeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaaaaaaaaaaegaibaaaadaaaaaa
dcaaaaamhcaabaaaadaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadcaaaaaj
hcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaadaaaaaa
baaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
hcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaldcaabaaa
afaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaa
alaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaaaaaaaaa
aagabaaaadaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaaafaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaaegbcbaaaafaaaaaa
dcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaaaeaaaaaaegacbaaa
agaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaaegaabaaaafaaaaaa
ddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
ecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaaaeaaaaaakgakbaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaa
baaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaah
bcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaadeaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaahecaabaaaaaaaaaaa
ckaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaa
aaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaa
diaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaabaaaaaabjaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaaefaaaaajpcaabaaaadaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaabaaaaaa
dkaabaaaadaaaaaadkaabaaaadaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaa
abaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaa
aaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaa
agaabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaa
adaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaajaaaaaa
abeaaaaaaaaaiadpdcaaaaakhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
acaaaaaaegiccaaaaaaaaaaaakaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 103 math, 8 textures
Keywords { "SPOT" "SHADOWS_DEPTH" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
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
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
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
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R2, R3;
DP3 R0.w, R2, R2;
DP3 R1.w, R4, R4;
RSQ R1.w, R1.w;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R2;
MUL R4.xyz, R1.w, R4;
DP3 R0.w, R3, R4;
DP3 R1.x, R3, R1;
DP3 R2.x, fragment.texcoord[3], R0;
DP3 R2.y, fragment.texcoord[4], R0;
MUL R6.xy, R2, -c[14].x;
MAX R1.w, R0, c[19].z;
MAD R0.zw, R6.xyxy, c[20].x, fragment.texcoord[0].xyxy;
MOV R0.x, c[21].y;
MUL R2.x, R0, c[5];
ADD R0.xy, R0.zwzw, -c[19].w;
MUL R0.zw, R0.y, c[20].xywy;
ADD R2.x, R2, c[19].y;
MAD R0.xy, R0.x, c[20].yzzw, R0.zwzw;
EX2 R2.x, R2.x;
POW R0.z, R1.w, R2.x;
ADD R2.xy, R0, c[19].w;
RCP R0.x, fragment.texcoord[5].w;
MAD R0.xy, fragment.texcoord[5], R0.x, c[19].w;
TEX R0.w, R0, texture[1], 2D;
DP3 R1.w, fragment.texcoord[5], fragment.texcoord[5];
SLT R0.x, c[19].z, fragment.texcoord[5].z;
MUL R0.x, R0, R0.w;
TEX R1.w, R1.w, texture[2], 2D;
MUL R0.y, R0.x, R1.w;
MOV R1.w, c[14].x;
MUL R2.z, R1.w, -c[21].x;
MUL R2.xy, R2, c[13].x;
RCP R0.w, fragment.texcoord[6].w;
TXP R0.x, fragment.texcoord[6], texture[3], 2D;
MAD R0.x, -fragment.texcoord[6].z, R0.w, R0;
MOV R0.w, c[19].y;
CMP R0.x, R0, c[2], R0.w;
MUL R0.x, R0.y, R0;
ADD R0.y, R2.z, c[19];
MUL R2.z, R0.x, c[19].x;
MUL R0.xy, R2, R0.y;
MUL R4.xy, R0, c[18].x;
MUL R2.xyz, R2.z, c[3];
MAD R6.zw, R4.xyxy, c[15].xyxy, c[15];
MAD R4.xy, fragment.texcoord[0], c[4], c[4].zwzw;
MAX R1.x, R1, c[19].z;
MUL R5.xyz, R2, R0.z;
MAD R0.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R0.xyz, R0, texture[6], 2D;
MUL R0.xyz, R0, c[8].x;
TEX R4.xyz, R4, texture[4], 2D;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R7.xyz, R4, -R0, R0;
TEX R0.xyz, R6.zwzw, texture[5], 2D;
ADD R0.xyz, -R0, c[19].y;
MAX R4.xyz, R0, R4;
MUL R4.xyz, R4, c[7].x;
MUL R1.xyz, R1.x, R2;
ADD R0.w, R0, -c[7].x;
MAD R1.w, R1, c[19], c[19].y;
MAD R6.xy, -R6, c[20].x, fragment.texcoord[0];
MUL R6.xy, R6, R1.w;
MUL R6.xy, R6, c[13].x;
MAD R0.xy, R6, c[15], c[15].zwzw;
MOV R6.xyz, c[12];
TEX R0.xyz, R0, texture[5], 2D;
MUL R6.xyz, R6, c[9].x;
MUL R0.xyz, R6, R0;
POW R0.x, R0.x, c[16].x;
POW R0.z, R0.z, c[16].x;
POW R0.y, R0.y, c[16].x;
MAD R0.xyz, R4, -R0, R0;
ADD R0.xyz, R0, R7;
MUL R0.xyz, R5, R0;
MAD R2.xyz, R0.w, R4, c[10];
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[19].z;
END
# 103 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 116 math, 8 textures
Keywords { "SPOT" "SHADOWS_DEPTH" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
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
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
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
dcl_texcoord6 v6
mad r0.xyz, -v1, c1.w, c1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r3.xyz, r0.w, r0
add r2.xyz, -v1, c0
dp3 r0.z, r2, r2
mad r0.xy, v0, c11, c11.zwzw
texld r1.yw, r0, s0
rsq r0.z, r0.z
mul r0.xyz, r0.z, r2
mad_pp r2.xy, r1.wyzw, c19.x, c19.y
add r4.xyz, r3, r0
mul_pp r5.xy, r2, r2
mul r1.xyz, r2.y, v4
mad r2.xyz, r2.x, v3, r1
add_pp_sat r0.w, r5.x, r5.y
dp3 r1.w, r4, r4
rsq r1.w, r1.w
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c19
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
mul r4.xyz, r1.w, r4
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r2
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r2.xyz, r0.w, r1
dp3 r0.w, r2, r4
dp3 r1.x, v3, r0
dp3 r1.y, v4, r0
mul r1.xy, r1, -c14.x
mad r0.xy, r1, c20.y, v0
add r4.xy, r0, c20.z
mov r0.z, c5.x
mad r0.z, r0, c22, c22.y
mul r1.zw, r4.y, c21.xyxy
max r2.w, r0, c19.z
exp r3.w, r0.z
pow r0, r2.w, r3.w
mad r0.zw, r4.x, c21.xyyz, r1
add r0.zw, r0, c20.x
mov r1.w, r0.x
mul r0.xy, r0.zwzw, c13.x
mov r0.w, c14.x
mov r0.z, c14.x
mad r0.z, r0, c22.x, c22.y
mul r0.xy, r0, r0.z
mul r4.xy, r0, c18.x
mad r0.w, r0, c20.x, c20
mad r1.xy, -r1, c20.y, v0
mul r1.xy, r1, r0.w
mul r0.zw, r1.xyxy, c13.x
mad r0.xy, r0.zwzw, c15, c15.zwzw
mov r0.w, c9.x
texld r0.xyz, r0, s5
mul r1.xyz, c12, r0.w
mul r6.xyz, r1, r0
pow r5, r6.x, c16.x
mov r6.x, r5
mad r0.xy, r4, c15, c15.zwzw
mad r1.xy, v0, c4, c4.zwzw
texld r0.xyz, r0, s5
texld r1.xyz, r1, s4
add r0.xyz, -r0, c19.w
max r0.xyz, r0, r1
mul r4.xyz, r0, c7.x
pow r0, r6.y, c16.x
mov r6.y, r0
mad r5.xy, v0, c6, c6.zwzw
texld r0.xyz, r5, s6
mul r7.xyz, r0, c8.x
pow r5, r6.z, c16.x
pow r0, r7.x, c17.x
mov r6.z, r5
mad r5.xyz, r4, -r6, r6
pow r6, r7.y, c17.x
mov r7.x, r0
pow r0, r7.z, c17.x
mov r7.z, r0
mov r7.y, r6
texldp r0.x, v6, s3
rcp r0.y, v6.w
mad r0.y, -v6.z, r0, r0.x
mov r0.z, c2.x
cmp r0.y, r0, c19.w, r0.z
rcp r0.x, v5.w
mad r6.xy, v5, r0.x, c20.x
dp3 r0.x, v5, v5
texld r0.w, r6, s1
cmp r0.z, -v5, c19, c19.w
mul_pp r0.z, r0, r0.w
texld r0.x, r0.x, s2
mul_pp r0.x, r0.z, r0
mul_pp r0.w, r0.x, r0.y
mad r0.xyz, r1, -r7, r7
add r1.xyz, r5, r0
mul_pp r0.w, r0, c19.x
mul r0.xyz, r0.w, c3
mul r5.xyz, r0, r1.w
dp3 r0.w, r2, r3
mov r1.w, c7.x
max r0.w, r0, c19.z
add r1.w, c19, -r1
mul r1.xyz, r5, r1
mul r0.xyz, r0.w, r0
mad r2.xyz, r1.w, r4, c10
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c19.z
"
}
SubProgram "d3d11 " {
// Stats: 87 math, 8 textures
Keywords { "SPOT" "SHADOWS_DEPTH" }
SetTexture 0 [_Normalmap] 2D 5
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 0
SetTexture 4 [_Mask] 2D 3
SetTexture 5 [_Glittermap] 2D 6
SetTexture 6 [_Specularglitter] 2D 4
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_Specularglitter_ST]
Float 144 [_MasktransparencyDebug]
Float 148 [_Specularpower05]
Float 152 [_Glitterpower]
Vector 160 [_Color]
Vector 176 [_Normalmap_ST]
Vector 208 [_Glittercolor]
Float 224 [_Glitterymaskdotsscale]
Float 228 [_Glitteryspeed01]
Vector 240 [_Glittermap_ST]
Float 256 [_Glittercontrast13]
Float 260 [_Specularcontrast13]
Float 264 [_Maskadjust0515]
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
eefiecedijenomennadgcocbhkiobikpclbmagbiabaaaaaanaaoaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefciaanaaaaeaaaaaaagaadaaaafjaaaaaeegiocaaa
aaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaa
agaaaaaagcbaaaadpcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
ahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaaoaaaaaaaceaaaaa
mnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaia
ebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaah
ccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaa
acaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaak
bcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaa
aaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaaoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaaaaaaaaaeghobaaaafaaaaaaaagabaaaagaaaaaadiaaaaajlcaabaaa
aaaaaaaakgikcaaaaaaaaaaaajaaaaaaegiicaaaaaaaaaaaanaaaaaadiaaaaah
lcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaa
aaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaa
agiacaaaaaaaaaaabaaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
apaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaa
adaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
acaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaa
diaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaabaaaaaaa
dcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaaapaaaaaa
ogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaafaaaaaaaagabaaaagaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaia
ebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
aeaaaaaaaagabaaaadaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaajaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaagaaaaaaaagabaaaaeaaaaaa
diaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaajaaaaaa
cpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaaeaaaaaa
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
alaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaa
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
bkaabaaaabaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaoaaaaah
gcaabaaaabaaaaaaagbbbaaaagaaaaaapgbpbaaaagaaaaaaaaaaaaakgcaabaaa
abaaaaaafgagbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaadpaaaaaadpaaaaaaaa
efaaaaajpcaabaaaadaaaaaajgafbaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaadbaaaaahccaabaaaabaaaaaaabeaaaaaaaaaaaaackbabaaaagaaaaaa
abaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaah
ccaabaaaabaaaaaadkaabaaaadaaaaaabkaabaaaabaaaaaabaaaaaahecaabaaa
abaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaa
kgakbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahccaabaaa
abaaaaaabkaabaaaabaaaaaaakaabaaaadaaaaaaaoaaaaahhcaabaaaadaaaaaa
egbcbaaaahaaaaaapgbpbaaaahaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaa
adaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaadbaaaaahecaabaaaabaaaaaa
akaabaaaaeaaaaaackaabaaaadaaaaaadhaaaaakecaabaaaabaaaaaackaabaaa
abaaaaaaakiacaaaadaaaaaabiaaaaaaabeaaaaaaaaaiadpapaaaaahccaabaaa
abaaaaaafgafbaaaabaaaaaakgakbaaaabaaaaaadiaaaaaiocaabaaaabaaaaaa
fgafbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaadaaaaaa
kgakbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaa
abaaaaaaagaabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaa
egacbaaaadaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaa
ajaaaaaaabeaaaaaaaaaiadpdcaaaaakhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egacbaaaacaaaaaaegiccaaaaaaaaaaaakaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 102 math, 8 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
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
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
"3.0-!!ARBfp1.0
OPTION ARB_fragment_program_shadow;
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
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R2, R3;
DP3 R0.w, R2, R2;
DP3 R1.w, R4, R4;
RSQ R1.w, R1.w;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R2;
MUL R4.xyz, R1.w, R4;
DP3 R0.w, R3, R4;
DP3 R1.x, R3, R1;
DP3 R2.x, fragment.texcoord[3], R0;
DP3 R2.y, fragment.texcoord[4], R0;
MUL R6.xy, R2, -c[14].x;
MAX R1.w, R0, c[19].z;
MAD R0.zw, R6.xyxy, c[20].x, fragment.texcoord[0].xyxy;
MOV R0.x, c[21].y;
MUL R2.x, R0, c[5];
ADD R0.xy, R0.zwzw, -c[19].w;
MUL R0.zw, R0.y, c[20].xywy;
ADD R2.x, R2, c[19].y;
MAD R0.xy, R0.x, c[20].yzzw, R0.zwzw;
EX2 R2.x, R2.x;
POW R0.z, R1.w, R2.x;
ADD R2.xy, R0, c[19].w;
RCP R0.x, fragment.texcoord[5].w;
MAD R0.xy, fragment.texcoord[5], R0.x, c[19].w;
TEX R0.w, R0, texture[1], 2D;
DP3 R1.w, fragment.texcoord[5], fragment.texcoord[5];
SLT R0.x, c[19].z, fragment.texcoord[5].z;
MUL R0.x, R0, R0.w;
TEX R1.w, R1.w, texture[2], 2D;
MUL R0.y, R0.x, R1.w;
MOV R0.w, c[19].y;
ADD R2.z, R0.w, -c[2].x;
TXP R0.x, fragment.texcoord[6], texture[3], SHADOW2D;
MAD R0.x, R0, R2.z, c[2];
MOV R1.w, c[14].x;
MUL R2.z, R1.w, -c[21].x;
MUL R0.x, R0.y, R0;
ADD R0.y, R2.z, c[19];
MUL R2.xy, R2, c[13].x;
MUL R2.z, R0.x, c[19].x;
MUL R0.xy, R2, R0.y;
MUL R4.xy, R0, c[18].x;
MUL R2.xyz, R2.z, c[3];
MAD R6.zw, R4.xyxy, c[15].xyxy, c[15];
MAD R4.xy, fragment.texcoord[0], c[4], c[4].zwzw;
MAX R1.x, R1, c[19].z;
MUL R5.xyz, R2, R0.z;
MAD R0.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R0.xyz, R0, texture[6], 2D;
MUL R0.xyz, R0, c[8].x;
TEX R4.xyz, R4, texture[4], 2D;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R7.xyz, R4, -R0, R0;
TEX R0.xyz, R6.zwzw, texture[5], 2D;
ADD R0.xyz, -R0, c[19].y;
MAX R4.xyz, R0, R4;
MUL R4.xyz, R4, c[7].x;
MUL R1.xyz, R1.x, R2;
ADD R0.w, R0, -c[7].x;
MAD R1.w, R1, c[19], c[19].y;
MAD R6.xy, -R6, c[20].x, fragment.texcoord[0];
MUL R6.xy, R6, R1.w;
MUL R6.xy, R6, c[13].x;
MAD R0.xy, R6, c[15], c[15].zwzw;
MOV R6.xyz, c[12];
TEX R0.xyz, R0, texture[5], 2D;
MUL R6.xyz, R6, c[9].x;
MUL R0.xyz, R6, R0;
POW R0.x, R0.x, c[16].x;
POW R0.z, R0.z, c[16].x;
POW R0.y, R0.y, c[16].x;
MAD R0.xyz, R4, -R0, R0;
ADD R0.xyz, R0, R7;
MUL R0.xyz, R5, R0;
MAD R2.xyz, R0.w, R4, c[10];
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[19].z;
END
# 102 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 115 math, 8 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightShadowData]
Vector 3 [_LightColor0]
Vector 4 [_Mask_ST]
Float 5 [_Shininess]
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
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
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
dcl_texcoord6 v6
mad r0.xyz, -v1, c1.w, c1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r3.xyz, r0.w, r0
add r2.xyz, -v1, c0
dp3 r0.z, r2, r2
mad r0.xy, v0, c11, c11.zwzw
texld r1.yw, r0, s0
rsq r0.z, r0.z
mul r0.xyz, r0.z, r2
mad_pp r2.xy, r1.wyzw, c19.x, c19.y
add r4.xyz, r3, r0
mul_pp r5.xy, r2, r2
mul r1.xyz, r2.y, v4
mad r2.xyz, r2.x, v3, r1
add_pp_sat r0.w, r5.x, r5.y
dp3 r1.w, r4, r4
rsq r1.w, r1.w
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c19
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
mul r4.xyz, r1.w, r4
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r2
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r2.xyz, r0.w, r1
dp3 r0.w, r2, r4
dp3 r1.x, v3, r0
dp3 r1.y, v4, r0
mul r1.xy, r1, -c14.x
mad r0.xy, r1, c20.y, v0
add r4.xy, r0, c20.z
mov r0.z, c5.x
mad r0.z, r0, c22, c22.y
mul r1.zw, r4.y, c21.xyxy
max r2.w, r0, c19.z
exp r3.w, r0.z
pow r0, r2.w, r3.w
mad r0.zw, r4.x, c21.xyyz, r1
add r0.zw, r0, c20.x
mov r1.w, r0.x
mul r0.xy, r0.zwzw, c13.x
mov r0.w, c14.x
mov r0.z, c14.x
mad r0.z, r0, c22.x, c22.y
mul r0.xy, r0, r0.z
mul r4.xy, r0, c18.x
mad r0.w, r0, c20.x, c20
mad r1.xy, -r1, c20.y, v0
mul r1.xy, r1, r0.w
mul r0.zw, r1.xyxy, c13.x
mad r0.xy, r0.zwzw, c15, c15.zwzw
mov r0.w, c9.x
texld r0.xyz, r0, s5
mul r1.xyz, c12, r0.w
mul r6.xyz, r1, r0
pow r5, r6.x, c16.x
mov r6.x, r5
mad r0.xy, r4, c15, c15.zwzw
mad r1.xy, v0, c4, c4.zwzw
texld r0.xyz, r0, s5
texld r1.xyz, r1, s4
add r0.xyz, -r0, c19.w
max r0.xyz, r0, r1
mul r4.xyz, r0, c7.x
pow r0, r6.y, c16.x
mov r6.y, r0
mad r5.xy, v0, c6, c6.zwzw
texld r0.xyz, r5, s6
mul r7.xyz, r0, c8.x
pow r5, r6.z, c16.x
pow r0, r7.x, c17.x
mov r6.z, r5
mad r5.xyz, r4, -r6, r6
pow r6, r7.y, c17.x
mov r7.x, r0
pow r0, r7.z, c17.x
mov r7.z, r0
mov r0.x, c2
add r0.y, c19.w, -r0.x
texldp r0.x, v6, s3
mad r0.y, r0.x, r0, c2.x
dp3 r0.x, v5, v5
mov r7.y, r6
rcp r0.z, v5.w
mad r6.xy, v5, r0.z, c20.x
texld r0.w, r6, s1
cmp r0.z, -v5, c19, c19.w
mul_pp r0.z, r0, r0.w
texld r0.x, r0.x, s2
mul_pp r0.x, r0.z, r0
mul_pp r0.w, r0.x, r0.y
mad r0.xyz, r1, -r7, r7
add r1.xyz, r5, r0
mul_pp r0.w, r0, c19.x
mul r0.xyz, r0.w, c3
mul r5.xyz, r0, r1.w
dp3 r0.w, r2, r3
mov r1.w, c7.x
max r0.w, r0, c19.z
add r1.w, c19, -r1
mul r1.xyz, r5, r1
mul r0.xyz, r0.w, r0
mad r2.xyz, r1.w, r4, c10
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c19.z
"
}
SubProgram "d3d11 " {
// Stats: 88 math, 7 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
SetTexture 0 [_Normalmap] 2D 5
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 6
SetTexture 5 [_Specularglitter] 2D 4
SetTexture 6 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_Specularglitter_ST]
Float 144 [_MasktransparencyDebug]
Float 148 [_Specularpower05]
Float 152 [_Glitterpower]
Vector 160 [_Color]
Vector 176 [_Normalmap_ST]
Vector 208 [_Glittercolor]
Float 224 [_Glitterymaskdotsscale]
Float 228 [_Glitteryspeed01]
Vector 240 [_Glittermap_ST]
Float 256 [_Glittercontrast13]
Float 260 [_Specularcontrast13]
Float 264 [_Maskadjust0515]
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
eefiecedcjfbololcjoikpkfchnejieibclnbkhiabaaaaaaoaaoaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcjaanaaaaeaaaaaaageadaaaafjaaaaaeegiocaaa
aaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaiaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaa
agaaaaaagcbaaaadpcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
ahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaaoaaaaaaaceaaaaa
mnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaia
ebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaah
ccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaa
acaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaak
bcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaa
aaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaaoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaaaaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaadiaaaaajlcaabaaa
aaaaaaaakgikcaaaaaaaaaaaajaaaaaaegiicaaaaaaaaaaaanaaaaaadiaaaaah
lcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaa
aaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaa
agiacaaaaaaaaaaabaaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
apaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaa
adaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
acaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaa
diaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaabaaaaaaa
dcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaaapaaaaaa
ogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaaeaaaaaaaagabaaaagaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaia
ebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
adaaaaaaaagabaaaadaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaajaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaafaaaaaaaagabaaaaeaaaaaa
diaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaajaaaaaa
cpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaaeaaaaaa
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
alaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaa
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
bkaabaaaabaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaoaaaaah
gcaabaaaabaaaaaaagbbbaaaagaaaaaapgbpbaaaagaaaaaaaaaaaaakgcaabaaa
abaaaaaafgagbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaadpaaaaaadpaaaaaaaa
efaaaaajpcaabaaaadaaaaaajgafbaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaadbaaaaahccaabaaaabaaaaaaabeaaaaaaaaaaaaackbabaaaagaaaaaa
abaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaah
ccaabaaaabaaaaaadkaabaaaadaaaaaabkaabaaaabaaaaaabaaaaaahecaabaaa
abaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaa
kgakbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahccaabaaa
abaaaaaabkaabaaaabaaaaaaakaabaaaadaaaaaaaoaaaaahhcaabaaaadaaaaaa
egbcbaaaahaaaaaapgbpbaaaahaaaaaaehaaaaalecaabaaaabaaaaaaegaabaaa
adaaaaaaaghabaaaagaaaaaaaagabaaaaaaaaaaackaabaaaadaaaaaaaaaaaaaj
icaabaaaabaaaaaaakiacaiaebaaaaaaadaaaaaabiaaaaaaabeaaaaaaaaaiadp
dcaaaaakecaabaaaabaaaaaackaabaaaabaaaaaadkaabaaaabaaaaaaakiacaaa
adaaaaaabiaaaaaaapaaaaahccaabaaaabaaaaaafgafbaaaabaaaaaakgakbaaa
abaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaaagijcaaaaaaaaaaa
afaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaajgahbaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaaagaabaaaabaaaaaadiaaaaah
hcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajicaabaaa
aaaaaaaaakiacaiaebaaaaaaaaaaaaaaajaaaaaaabeaaaaaaaaaiadpdcaaaaak
hcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaa
akaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
"
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
// Stats: 92 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_Specularglitter_ST]
Float 6 [_MasktransparencyDebug]
Float 7 [_Specularpower05]
Float 8 [_Glitterpower]
Vector 9 [_Color]
Vector 10 [_Normalmap_ST]
Vector 11 [_Glittercolor]
Float 12 [_Glitterymaskdotsscale]
Float 13 [_Glitteryspeed01]
Vector 14 [_Glittermap_ST]
Float 15 [_Glittercontrast13]
Float 16 [_Specularcontrast13]
Float 17 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
"3.0-!!ARBfp1.0
PARAM c[21] = { program.local[0..17],
		{ 2, 1, 0, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MAD R0.xy, fragment.texcoord[0], c[10], c[10].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[18].x, -c[18].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.w, R1.x, R1.y;
MUL R2.xyz, R0.y, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[18].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R1, R0;
DP3 R0.x, R2, R2;
RSQ R0.w, R0.x;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R2.w, R0, R0;
DP3 R1.w, R1, R1;
RSQ R2.w, R2.w;
MUL R0.xyz, R2.w, R0;
RSQ R1.w, R1.w;
MUL R3.xyz, R1.w, R1;
ADD R1.xyz, R3, R0;
MUL R2.xyz, R0.w, R2;
DP3 R0.w, R1, R1;
DP3 R4.x, fragment.texcoord[3], R0;
DP3 R4.y, fragment.texcoord[4], R0;
RSQ R0.x, R0.w;
MUL R0.xyz, R0.x, R1;
MUL R4.xy, R4, -c[13].x;
MAD R4.zw, R4.xyxy, c[18].w, fragment.texcoord[0].xyxy;
ADD R1.xy, R4.zwzw, -c[19].x;
DP3 R0.z, R2, R0;
MUL R0.xy, R1.y, c[19].wyzw;
MAD R0.xy, R1.x, c[19].yzzw, R0;
ADD R0.xy, R0, c[19].x;
MAX R1.y, R0.z, c[18].z;
MOV R0.w, c[13].x;
MUL R0.z, R0.w, -c[20].x;
ADD R1.x, R0.z, c[18].y;
MUL R0.xy, R0, c[12].x;
MUL R0.xy, R0, R1.x;
MOV R0.z, c[20].y;
MUL R0.z, R0, c[4].x;
ADD R0.z, R0, c[18].y;
EX2 R1.x, R0.z;
POW R2.w, R1.y, R1.x;
MUL R0.xy, R0, c[17].x;
MAD R0.xy, R0, c[14], c[14].zwzw;
TEX R0.xyz, R0, texture[3], 2D;
MUL R0.w, R0, c[19].x;
ADD R0.xyz, -R0, c[18].y;
MAD R1.zw, -R4.xyxy, c[18].w, fragment.texcoord[0].xyxy;
ADD R0.w, R0, c[18].y;
MUL R4.xy, R1.zwzw, R0.w;
MAD R1.xy, fragment.texcoord[0], c[3], c[3].zwzw;
MUL R5.xy, R4, c[12].x;
TEX R1.xyz, R1, texture[2], 2D;
MAX R4.xyz, R0, R1;
MAD R0.xy, R5, c[14], c[14].zwzw;
MOV R5.xyz, c[11];
TEX R0.xyz, R0, texture[3], 2D;
MUL R5.xyz, R5, c[8].x;
MUL R5.xyz, R5, R0;
MAD R0.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R0.xyz, R0, texture[4], 2D;
MUL R0.xyz, R0, c[7].x;
POW R0.w, R0.x, c[16].x;
TXP R0.x, fragment.texcoord[5], texture[1], 2D;
MUL R4.xyz, R4, c[6].x;
POW R0.y, R0.y, c[16].x;
POW R0.z, R0.z, c[16].x;
MAD R1.xyz, R1, -R0.wyzw, R0.wyzw;
MOV R0.w, c[18].y;
MUL R0.x, R0, c[18];
POW R5.x, R5.x, c[15].x;
POW R5.y, R5.y, c[15].x;
POW R5.z, R5.z, c[15].x;
MAD R5.xyz, R4, -R5, R5;
ADD R1.xyz, R5, R1;
MUL R5.xyz, R0.x, c[2];
MUL R0.xyz, R5, R2.w;
MUL R0.xyz, R0, R1;
DP3 R1.x, R2, R3;
MAX R1.x, R1, c[18].z;
ADD R0.w, R0, -c[6].x;
MUL R1.xyz, R1.x, R5;
MAD R2.xyz, R0.w, R4, c[9];
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[18].z;
END
# 92 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 105 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_Specularglitter_ST]
Float 6 [_MasktransparencyDebug]
Float 7 [_Specularpower05]
Float 8 [_Glitterpower]
Vector 9 [_Color]
Vector 10 [_Normalmap_ST]
Vector 11 [_Glittercolor]
Float 12 [_Glitterymaskdotsscale]
Float 13 [_Glitteryspeed01]
Vector 14 [_Glittermap_ST]
Float 15 [_Glittercontrast13]
Float 16 [_Specularcontrast13]
Float 17 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Specularglitter] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c18, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c19, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c20, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c21, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
mad_pp r0.xyz, -v1, c1.w, c1
dp3_pp r0.w, r0, r0
rsq_pp r0.w, r0.w
mul_pp r4.xyz, r0.w, r0
add r2.xyz, -v1, c0
dp3 r0.z, r2, r2
mad r0.xy, v0, c10, c10.zwzw
texld r1.yw, r0, s0
rsq r0.z, r0.z
mul r0.xyz, r0.z, r2
mad_pp r2.xy, r1.wyzw, c18.x, c18.y
add r3.xyz, r4, r0
mul_pp r5.xy, r2, r2
mul r1.xyz, r2.y, v4
mad r2.xyz, r2.x, v3, r1
add_pp_sat r0.w, r5.x, r5.y
dp3 r1.w, r3, r3
rsq r1.w, r1.w
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c18
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
mul r3.xyz, r1.w, r3
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r2
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r2.xyz, r0.w, r1
dp3 r0.w, r2, r3
dp3 r1.x, v3, r0
dp3 r1.y, v4, r0
mul r1.xy, r1, -c13.x
mad r0.xy, r1, c19.x, v0
add r3.xy, r0, c19.y
mov r0.z, c4.x
mad r0.z, r0, c21, c21.y
mul r1.zw, r3.y, c19
exp r3.z, r0.z
max r2.w, r0, c18.z
pow r0, r2.w, r3.z
mad r0.zw, r3.x, c20.xyxy, r1
add r0.zw, r0, c20.z
mov r1.w, r0.x
mul r0.xy, r0.zwzw, c12.x
mov r0.w, c13.x
mov r0.z, c13.x
mad r0.z, r0, c21.x, c21.y
mul r0.xy, r0, r0.z
mul r3.xy, r0, c17.x
mad r0.w, r0, c20.z, c20
mad r1.xy, -r1, c19.x, v0
mul r1.xy, r1, r0.w
mul r0.zw, r1.xyxy, c12.x
mad r0.xy, r0.zwzw, c14, c14.zwzw
mov r0.w, c8.x
texld r0.xyz, r0, s3
mul r1.xyz, c11, r0.w
mul r6.xyz, r1, r0
mad r0.xy, r3, c14, c14.zwzw
pow r3, r6.x, c15.x
mov r6.x, r3
mad r1.xy, v0, c3, c3.zwzw
texld r0.xyz, r0, s3
texld r1.xyz, r1, s2
add r0.xyz, -r0, c18.w
max r0.xyz, r0, r1
mul r5.xyz, r0, c6.x
pow r0, r6.y, c15.x
mad r3.xy, v0, c5, c5.zwzw
mov r6.y, r0
texld r0.xyz, r3, s4
mul r7.xyz, r0, c7.x
pow r3, r6.z, c15.x
pow r0, r7.x, c16.x
mov r6.z, r3
pow r3, r7.y, c16.x
mov r7.x, r0
pow r0, r7.z, c16.x
texldp r3.x, v5, s1
mul_pp r0.w, r3.x, c18.x
mov r7.y, r3
mov r7.z, r0
mad r0.xyz, r1, -r7, r7
mad r6.xyz, r5, -r6, r6
add r1.xyz, r6, r0
mul r0.xyz, r0.w, c2
mul r3.xyz, r0, r1.w
dp3 r0.w, r2, r4
mov r1.w, c6.x
max r0.w, r0, c18.z
add r1.w, c18, -r1
mul r1.xyz, r3, r1
mul r0.xyz, r0.w, r0
mad r2.xyz, r1.w, r5, c9
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c18.z
"
}
SubProgram "d3d11 " {
// Stats: 79 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
SetTexture 0 [_Normalmap] 2D 3
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [_Mask] 2D 1
SetTexture 3 [_Glittermap] 2D 4
SetTexture 4 [_Specularglitter] 2D 2
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_Specularglitter_ST]
Float 144 [_MasktransparencyDebug]
Float 148 [_Specularpower05]
Float 152 [_Glitterpower]
Vector 160 [_Color]
Vector 176 [_Normalmap_ST]
Vector 208 [_Glittercolor]
Float 224 [_Glitterymaskdotsscale]
Float 228 [_Glitteryspeed01]
Vector 240 [_Glittermap_ST]
Float 256 [_Glittercontrast13]
Float 260 [_Specularcontrast13]
Float 264 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedkebkeadicdbbgmigolpehlpipjjcjofpabaaaaaaaianaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcnaalaaaaeaaaaaaapeacaaaa
fjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadlcbabaaa
agaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaadiaaaaaldcaabaaa
aaaaaaaafgifcaaaaaaaaaaaaoaaaaaaaceaaaaamnmmemdnmnmmemlnaaaaaaaa
aaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaa
abaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaa
egbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaa
afaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaaagafbaaaaaaaaaaa
egaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaa
aaaaaaaaaoaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaahdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaakdcaabaaaacaaaaaa
ogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaal
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaa
aaaaaaaaapaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaaaaaaaaaeghobaaa
adaaaaaaaagabaaaaeaaaaaadiaaaaajlcaabaaaaaaaaaaakgikcaaaaaaaaaaa
ajaaaaaaegiicaaaaaaaaaaaanaaaaaadiaaaaahlcaabaaaaaaaaaaaegaibaaa
adaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
diaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaaaaaaaaaabaaaaaaa
bjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaakbcaabaaaadaaaaaa
egaabaaaacaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaak
ccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaa
aaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaa
agiacaaaaaaaaaaaaoaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaa
aaaaaaaaaoaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaa
acaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaaidcaabaaaacaaaaaa
egaabaaaacaaaaaakgikcaaaaaaaaaaabaaaaaaadcaaaaaldcaabaaaacaaaaaa
egaabaaaacaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaa
efaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
aeaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaaj
pcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaa
deaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaajaaaaaadcaaaaak
lcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaaaaaaaaaaegambaaa
aaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaa
aeaaaaaaeghobaaaaeaaaaaaaagabaaaacaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaaajaaaaaacpaaaaafhcaabaaaaeaaaaaa
egacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaa
aaaaaaaabaaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaak
hcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaaaeaaaaaaegacbaaa
aeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaaaaaaaaaaegaibaaaadaaaaaa
dcaaaaamhcaabaaaadaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadcaaaaaj
hcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaadaaaaaa
baaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
hcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaldcaabaaa
afaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaa
alaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaaaaaaaaa
aagabaaaadaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaaafaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaaegbcbaaaafaaaaaa
dcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaaaeaaaaaaegacbaaa
agaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaaegaabaaaafaaaaaa
ddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
ecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaaaeaaaaaakgakbaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaa
baaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaah
bcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaadeaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaahecaabaaaaaaaaaaa
ckaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaa
aaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaa
diaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaabaaaaaabjaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaaaoaaaaahgcaabaaaabaaaaaaagbbbaaa
agaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaajgafbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaabaaaaaaakaabaaa
adaaaaaaakaabaaaadaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaa
agijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaa
jgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaaagaabaaa
abaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaa
aaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaajaaaaaaabeaaaaa
aaaaiadpdcaaaaakhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaa
egiccaaaaaaaaaaaakaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
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
// Stats: 94 math, 7 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_Specularglitter_ST]
Float 6 [_MasktransparencyDebug]
Float 7 [_Specularpower05]
Float 8 [_Glitterpower]
Vector 9 [_Color]
Vector 10 [_Normalmap_ST]
Vector 11 [_Glittercolor]
Float 12 [_Glitterymaskdotsscale]
Float 13 [_Glitteryspeed01]
Vector 14 [_Glittermap_ST]
Float 15 [_Glittercontrast13]
Float 16 [_Specularcontrast13]
Float 17 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
"3.0-!!ARBfp1.0
PARAM c[21] = { program.local[0..17],
		{ 2, 1, 0, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MAD R0.xy, fragment.texcoord[0], c[10], c[10].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R1.zw, R0.xywy, c[18].x, -c[18].y;
MUL R1.xy, R1.zwzw, R1.zwzw;
ADD_SAT R1.x, R1, R1.y;
MUL R0.xyz, R1.w, fragment.texcoord[4];
ADD R1.x, -R1, c[18].y;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MOV R5.xyz, c[11];
MAD R0.xyz, R1.z, fragment.texcoord[3], R0;
MUL R5.xyz, R5, c[8].x;
RSQ R1.w, R1.x;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[2];
RCP R0.w, R1.w;
MAD R1.xyz, R0.w, R1, R0;
DP3 R0.x, R1, R1;
RSQ R2.w, R0.x;
MUL R1.xyz, R2.w, R1;
ADD R2.xyz, -fragment.texcoord[1], c[0];
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R2, R2;
DP3 R1.w, R0, R0;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R2;
RSQ R1.w, R1.w;
MUL R0.xyz, R1.w, R0;
ADD R2.xyz, R0, R3;
DP3 R0.x, R1, R0;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R2;
DP3 R0.w, R1, R2;
MAX R1.w, R0, c[18].z;
MOV R0.w, c[13].x;
MUL R2.z, R0.w, -c[20].x;
MUL R0.w, R0, c[19].x;
DP3 R4.x, fragment.texcoord[3], R3;
DP3 R4.y, fragment.texcoord[4], R3;
MUL R3.xy, R4, -c[13].x;
MAD R3.zw, R3.xyxy, c[18].w, fragment.texcoord[0].xyxy;
ADD R3.zw, R3, -c[19].x;
MUL R2.xy, R3.w, c[19].wyzw;
MAD R2.xy, R3.z, c[19].yzzw, R2;
MAD R3.zw, -R3.xyxy, c[18].w, fragment.texcoord[0].xyxy;
ADD R0.w, R0, c[18].y;
MUL R4.xy, R3.zwzw, R0.w;
ADD R2.xy, R2, c[19].x;
MAD R3.xy, fragment.texcoord[0], c[3], c[3].zwzw;
MUL R4.xy, R4, c[12].x;
MAD R4.xy, R4, c[14], c[14].zwzw;
TEX R4.xyz, R4, texture[4], 2D;
MUL R4.xyz, R5, R4;
MAD R5.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R5.xyz, R5, texture[5], 2D;
MUL R5.xyz, R5, c[7].x;
POW R5.w, R5.x, c[16].x;
TEX R3.xyz, R3, texture[3], 2D;
ADD R2.z, R2, c[18].y;
MUL R2.xy, R2, c[12].x;
MUL R2.xy, R2, R2.z;
MOV R2.w, c[20].y;
MUL R2.z, R2.w, c[4].x;
ADD R2.z, R2, c[18].y;
EX2 R2.w, R2.z;
MUL R2.xy, R2, c[17].x;
MAD R2.xy, R2, c[14], c[14].zwzw;
TEX R2.xyz, R2, texture[4], 2D;
ADD R2.xyz, -R2, c[18].y;
MAX R2.xyz, R2, R3;
MUL R2.xyz, R2, c[6].x;
TXP R5.x, fragment.texcoord[6], texture[1], 2D;
TEX R0.w, fragment.texcoord[5], texture[2], 2D;
MUL R0.w, R0, R5.x;
MOV R0.y, c[18];
POW R1.w, R1.w, R2.w;
POW R4.x, R4.x, c[15].x;
POW R4.y, R4.y, c[15].x;
POW R4.z, R4.z, c[15].x;
MAD R4.xyz, R2, -R4, R4;
POW R5.y, R5.y, c[16].x;
POW R5.z, R5.z, c[16].x;
MAD R5.xyz, R3, -R5.wyzw, R5.wyzw;
MUL R3.xyz, R0.w, c[2];
ADD R0.w, R0.y, -c[6].x;
ADD R4.xyz, R4, R5;
MUL R3.xyz, R3, c[18].x;
MUL R5.xyz, R3, R1.w;
MAX R0.x, R0, c[18].z;
MUL R4.xyz, R5, R4;
MUL R0.xyz, R0.x, R3;
MAD R1.xyz, R0.w, R2, c[9];
MAD result.color.xyz, R0, R1, R4;
MOV result.color.w, c[18].z;
END
# 94 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 106 math, 7 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightColor0]
Vector 3 [_Mask_ST]
Float 4 [_Shininess]
Vector 5 [_Specularglitter_ST]
Float 6 [_MasktransparencyDebug]
Float 7 [_Specularpower05]
Float 8 [_Glitterpower]
Vector 9 [_Color]
Vector 10 [_Normalmap_ST]
Vector 11 [_Glittercolor]
Float 12 [_Glitterymaskdotsscale]
Float 13 [_Glitteryspeed01]
Vector 14 [_Glittermap_ST]
Float 15 [_Glittercontrast13]
Float 16 [_Specularcontrast13]
Float 17 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c18, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c19, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c20, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c21, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xy
dcl_texcoord6 v6
mad_pp r0.xyz, -v1, c1.w, c1
dp3_pp r0.w, r0, r0
rsq_pp r0.w, r0.w
mul_pp r3.xyz, r0.w, r0
add r2.xyz, -v1, c0
dp3 r0.z, r2, r2
mad r0.xy, v0, c10, c10.zwzw
texld r1.yw, r0, s0
rsq r0.z, r0.z
mul r0.xyz, r0.z, r2
mad_pp r2.xy, r1.wyzw, c18.x, c18.y
add r4.xyz, r3, r0
mul_pp r5.xy, r2, r2
mul r1.xyz, r2.y, v4
mad r2.xyz, r2.x, v3, r1
add_pp_sat r0.w, r5.x, r5.y
dp3 r1.w, r4, r4
rsq r1.w, r1.w
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c18
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
mul r4.xyz, r1.w, r4
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r2
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r2.xyz, r0.w, r1
dp3 r0.w, r2, r4
dp3 r1.x, v3, r0
dp3 r1.y, v4, r0
mul r1.xy, r1, -c13.x
mad r0.xy, r1, c19.x, v0
add r4.xy, r0, c19.y
mov r0.z, c4.x
mad r0.z, r0, c21, c21.y
mul r1.zw, r4.y, c19
max r2.w, r0, c18.z
exp r3.w, r0.z
pow r0, r2.w, r3.w
mad r0.zw, r4.x, c20.xyxy, r1
add r0.zw, r0, c20.z
mov r1.w, r0.x
mul r0.xy, r0.zwzw, c12.x
mov r0.w, c13.x
mov r0.z, c13.x
mad r0.z, r0, c21.x, c21.y
mul r0.xy, r0, r0.z
mul r4.xy, r0, c17.x
mad r0.w, r0, c20.z, c20
mad r1.xy, -r1, c19.x, v0
mul r1.xy, r1, r0.w
mul r0.zw, r1.xyxy, c12.x
mad r0.xy, r0.zwzw, c14, c14.zwzw
mov r0.w, c8.x
texld r0.xyz, r0, s4
mul r1.xyz, c11, r0.w
mul r6.xyz, r1, r0
pow r5, r6.x, c15.x
mad r0.xy, r4, c14, c14.zwzw
mov r6.x, r5
mad r1.xy, v0, c3, c3.zwzw
texld r0.xyz, r0, s4
texld r1.xyz, r1, s3
add r0.xyz, -r0, c18.w
max r0.xyz, r0, r1
mul r4.xyz, r0, c6.x
pow r0, r6.y, c15.x
mad r5.xy, v0, c5, c5.zwzw
mov r6.y, r0
texld r0.xyz, r5, s5
mul r7.xyz, r0, c7.x
pow r5, r6.z, c15.x
pow r0, r7.x, c16.x
mov r6.z, r5
pow r5, r7.y, c16.x
mov r7.x, r0
pow r0, r7.z, c16.x
mov r7.y, r5
mov r7.z, r0
texld r0.w, v5, s2
texldp r0.x, v6, s1
mul r0.x, r0.w, r0
dp3 r0.w, r2, r3
mul r0.xyz, r0.x, c2
mul r0.xyz, r0, c18.x
mul r5.xyz, r0, r1.w
mov r1.w, c6.x
max r0.w, r0, c18.z
add r1.w, c18, -r1
mad r6.xyz, r4, -r6, r6
mad r1.xyz, r1, -r7, r7
add r1.xyz, r6, r1
mul r1.xyz, r5, r1
mul r0.xyz, r0.w, r0
mad r2.xyz, r1.w, r4, c9
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c18.z
"
}
SubProgram "d3d11 " {
// Stats: 79 math, 7 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
SetTexture 0 [_Normalmap] 2D 4
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 0
SetTexture 3 [_Mask] 2D 2
SetTexture 4 [_Glittermap] 2D 5
SetTexture 5 [_Specularglitter] 2D 3
ConstBuffer "$Globals" 336
Vector 144 [_LightColor0]
Vector 160 [_Mask_ST]
Float 176 [_Shininess]
Vector 192 [_Specularglitter_ST]
Float 208 [_MasktransparencyDebug]
Float 212 [_Specularpower05]
Float 216 [_Glitterpower]
Vector 224 [_Color]
Vector 240 [_Normalmap_ST]
Vector 272 [_Glittercolor]
Float 288 [_Glitterymaskdotsscale]
Float 292 [_Glitteryspeed01]
Vector 304 [_Glittermap_ST]
Float 320 [_Glittercontrast13]
Float 324 [_Specularcontrast13]
Float 328 [_Maskadjust0515]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
"ps_4_0
eefiecedcdmfmcccmpkkfilnoagkneaflkgjjjfjabaaaaaagmanaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaaneaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaagaaaaaaapalaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcbmamaaaaeaaaaaaaahadaaaafjaaaaaeegiocaaa
aaaaaaaabfaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafkaaaaadaagabaaaafaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaa
fibiaaaeaahabaaaafaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
mcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadlcbabaaa
agaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaadiaaaaaldcaabaaa
aaaaaaaafgifcaaaaaaaaaaabcaaaaaaaceaaaaamnmmemdnmnmmemlnaaaaaaaa
aaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaa
abaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaa
egbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaa
afaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaacaaaaaaagafbaaaaaaaaaaa
egaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaa
aaaaaaaabcaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaahdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaaaaaaaaakdcaabaaaacaaaaaa
ogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaabcaaaaaadcaaaaal
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaabdaaaaaaogikcaaa
aaaaaaaabdaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaaaaaaaaaeghobaaa
aeaaaaaaaagabaaaafaaaaaadiaaaaajlcaabaaaaaaaaaaakgikcaaaaaaaaaaa
anaaaaaaegiicaaaaaaaaaaabbaaaaaadiaaaaahlcaabaaaaaaaaaaaegaibaaa
adaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
diaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaaagiacaaaaaaaaaaabeaaaaaa
bjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaaapaaaaakbcaabaaaadaaaaaa
egaabaaaacaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaak
ccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaa
aaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaaadaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaa
agiacaaaaaaaaaaabcaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaa
aaaaaaaabcaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaa
acaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaadiaaaaaidcaabaaaacaaaaaa
egaabaaaacaaaaaakgikcaaaaaaaaaaabeaaaaaadcaaaaaldcaabaaaacaaaaaa
egaabaaaacaaaaaaegiacaaaaaaaaaaabdaaaaaaogikcaaaaaaaaaaabdaaaaaa
efaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaaeaaaaaaaagabaaa
afaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaiaebaaaaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaaadaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaaefaaaaaj
pcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaa
deaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaiaebaaaaaaaaaaaaaaegambaaa
aaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaa
amaaaaaaogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaa
aeaaaaaaeghobaaaafaaaaaaaagabaaaadaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaaanaaaaaacpaaaaafhcaabaaaaeaaaaaa
egacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaa
aaaaaaaabeaaaaaabjaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadcaaaaak
hcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaaaeaaaaaaegacbaaa
aeaaaaaaaaaaaaahlcaabaaaaaaaaaaaegambaaaaaaaaaaaegaibaaaadaaaaaa
dcaaaaamhcaabaaaadaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaa
acaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadcaaaaaj
hcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaadaaaaaa
baaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
hcaabaaaaeaaaaaakgakbaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaldcaabaaa
afaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaa
apaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaaaaaaaaa
aagabaaaaeaaaaaadcaaaaapdcaabaaaafaaaaaahgapbaaaafaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaadiaaaaahhcaabaaaagaaaaaafgafbaaaafaaaaaaegbcbaaaafaaaaaa
dcaaaaajhcaabaaaagaaaaaaagaabaaaafaaaaaaegbcbaaaaeaaaaaaegacbaaa
agaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaafaaaaaaegaabaaaafaaaaaa
ddaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaai
ecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajhcaabaaaaeaaaaaakgakbaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaagaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaaeaaaaaaegacbaaaaeaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaa
baaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaabaaaaaah
bcaabaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaadeaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadeaaaaahecaabaaaaaaaaaaa
ckaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaaalaaaaaaabeaaaaa
aaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaa
diaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaabaaaaaabjaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaaaoaaaaahgcaabaaaabaaaaaaagbbbaaa
agaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaajgafbaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaaaeaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaapaaaaahccaabaaaabaaaaaa
pgapbaaaaeaaaaaaagaabaaaadaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaa
abaaaaaaagijcaaaaaaaaaaaajaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaa
aaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaa
agaabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaa
adaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaanaaaaaa
abeaaaaaaaaaiadpdcaaaaakhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
acaaaaaaegiccaaaaaaaaaaaaoaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 102 math, 7 textures
Keywords { "POINT" "SHADOWS_CUBE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_Mask_ST]
Float 6 [_Shininess]
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
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
"3.0-!!ARBfp1.0
PARAM c[24] = { program.local[0..19],
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
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R3.xyz, R0.w, R1, R0;
DP3 R0.x, R3, R3;
RSQ R0.w, R0.x;
MUL R3.xyz, R0.w, R3;
ADD R0.xyz, -fragment.texcoord[1], c[0];
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R2.x, R0, R0;
DP3 R1.w, R1, R1;
RSQ R2.x, R2.x;
RSQ R1.w, R1.w;
MOV R0.w, c[23];
MUL R0.xyz, R2.x, R0;
MUL R1.xyz, R1.w, R1;
ADD R2.xyz, R1, R0;
DP3 R1.x, R3, R1;
DP3 R1.w, R2, R2;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, R2;
MUL R0.w, R0, c[6].x;
ADD R1.w, R0, c[20].y;
DP3 R0.w, R3, R2;
EX2 R1.w, R1.w;
MAX R0.w, R0, c[20].z;
POW R2.w, R0.w, R1.w;
DP3 R0.w, fragment.texcoord[4], R0;
DP3 R0.z, fragment.texcoord[3], R0;
MUL R6.xy, R0.zwzw, -c[15].x;
MAD R2.xy, R6, c[22].x, fragment.texcoord[0];
DP3 R0.x, fragment.texcoord[6], fragment.texcoord[6];
RSQ R1.w, R0.x;
TEX R0, fragment.texcoord[6], texture[1], CUBE;
DP4 R0.y, R0, c[21];
RCP R1.w, R1.w;
MUL R0.x, R1.w, c[2].w;
MAD R0.y, -R0.x, c[20].w, R0;
MOV R0.w, c[20].y;
CMP R0.y, R0, c[3].x, R0.w;
DP3 R0.x, fragment.texcoord[5], fragment.texcoord[5];
TEX R1.w, R0.x, texture[2], 2D;
MUL R0.x, R1.w, R0.y;
MUL R0.xyz, R0.x, c[4];
ADD R4.xy, R2, -c[22].y;
MUL R2.xyz, R0, c[20].x;
MUL R0.xy, R4.y, c[23];
MOV R1.w, c[15].x;
MUL R0.z, R1.w, -c[23];
MAD R0.xy, R4.x, c[22].zwzw, R0;
ADD R0.xy, R0, c[22].y;
MUL R1.w, R1, c[22].y;
MAX R1.x, R1, c[20].z;
MUL R5.xyz, R2, R2.w;
ADD R0.z, R0, c[20].y;
MUL R0.xy, R0, c[14].x;
MUL R4.xy, R0, R0.z;
MUL R6.zw, R4.xyxy, c[19].x;
MAD R0.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R0.xyz, R0, texture[5], 2D;
MUL R0.xyz, R0, c[9].x;
MAD R4.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R4.xyz, R4, texture[3], 2D;
POW R0.x, R0.x, c[18].x;
POW R0.z, R0.z, c[18].x;
POW R0.y, R0.y, c[18].x;
MAD R7.xyz, R4, -R0, R0;
MAD R0.xy, R6.zwzw, c[16], c[16].zwzw;
TEX R0.xyz, R0, texture[4], 2D;
ADD R0.xyz, -R0, c[20].y;
MAX R4.xyz, R0, R4;
MUL R4.xyz, R4, c[8].x;
MUL R1.xyz, R1.x, R2;
ADD R0.w, R0, -c[8].x;
ADD R1.w, R1, c[20].y;
MAD R6.xy, -R6, c[22].x, fragment.texcoord[0];
MUL R6.xy, R6, R1.w;
MUL R6.xy, R6, c[14].x;
MAD R0.xy, R6, c[16], c[16].zwzw;
MOV R6.xyz, c[13];
TEX R0.xyz, R0, texture[4], 2D;
MUL R6.xyz, R6, c[10].x;
MUL R0.xyz, R6, R0;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R0.xyz, R4, -R0, R0;
ADD R0.xyz, R0, R7;
MUL R0.xyz, R5, R0;
MAD R2.xyz, R0.w, R4, c[11];
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[20].z;
END
# 102 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 114 math, 7 textures
Keywords { "POINT" "SHADOWS_CUBE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_Mask_ST]
Float 6 [_Shininess]
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
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
"ps_3_0
dcl_2d s0
dcl_cube s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c20, 2.00000000, -1.00000000, 0.00000000, 0.97000003
def c21, 1.00000000, 0.00392157, 0.00001538, 0.00000006
def c22, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c23, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c24, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
mad r0.xy, v0, c12, c12.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c20.x, c20.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c21.x
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
mad r0.xyz, r0.x, v3, r2
mul r1.xyz, r1.x, v2
rcp_pp r0.w, r0.w
mad r0.xyz, r0.w, r1, r0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r3.xyz, r0.w, r0
mad r1.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
dp3 r1.w, r0, r0
rsq r1.w, r1.w
rsq r0.w, r0.w
mul r4.xyz, r0.w, r1
mul r0.xyz, r1.w, r0
dp3 r1.x, v3, r0
dp3 r1.y, v4, r0
mul r1.xy, r1, -c15.x
mad r1.zw, r1.xyxy, c22.x, v0.xyxy
add r2.xy, r1.zwzw, c22.y
add r0.xyz, r4, r0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mul r1.zw, r2.y, c22
mad r1.zw, r2.x, c23.xyxy, r1
dp3 r0.z, r3, r0
add r0.xy, r1.zwzw, c23.z
max r2.x, r0.z, c20.z
mul r0.zw, r0.xyxy, c14.x
mov r0.y, c6.x
mad r1.z, r0.y, c24, c24.y
mov r0.x, c15
mad r0.x, r0, c24, c24.y
exp r2.y, r1.z
mul r0.xy, r0.zwzw, r0.x
mul r1.zw, r0.xyxy, c19.x
pow r0, r2.x, r2.y
mad r2.xy, r1.zwzw, c16, c16.zwzw
mov r0.w, c15.x
texld r2.xyz, r2, s4
mov r1.w, r0.x
add r0.xyz, -r2, c21.x
mad r2.xy, -r1, c22.x, v0
mad r0.w, r0, c23.z, c23
mul r2.xy, r2, r0.w
mov r0.w, c10.x
mad r1.xy, v0, c5, c5.zwzw
texld r1.xyz, r1, s3
mul r2.xy, r2, c14.x
mad r2.xy, r2, c16, c16.zwzw
max r0.xyz, r0, r1
mul r5.xyz, c13, r0.w
texld r2.xyz, r2, s4
mul r6.xyz, r5, r2
pow r2, r6.x, c17.x
mul r5.xyz, r0, c8.x
pow r0, r6.y, c17.x
mov r2.y, r0
pow r0, r6.z, c17.x
mad r0.xy, v0, c7, c7.zwzw
texld r6.xyz, r0, s5
mul r7.xyz, r6, c9.x
mov r2.z, r0
mad r6.xyz, r5, -r2, r2
pow r2, r7.x, c18.x
dp3 r0.x, v6, v6
rsq r2.y, r0.x
texld r0, v6, s1
dp4 r0.y, r0, c21
rcp r2.y, r2.y
mul r0.x, r2.y, c2.w
mad r0.y, -r0.x, c20.w, r0
mov r0.z, c3.x
mov r7.x, r2
pow r2, r7.y, c18.x
dp3 r0.x, v5, v5
cmp r0.y, r0, c21.x, r0.z
texld r0.x, r0.x, s2
mul r3.w, r0.x, r0.y
pow r0, r7.z, c18.x
mov r7.z, r0
mov r7.y, r2
mad r1.xyz, r1, -r7, r7
mul r0.xyz, r3.w, c4
mul r0.xyz, r0, c20.x
mul r2.xyz, r0, r1.w
add r1.xyz, r6, r1
dp3 r0.w, r3, r4
mov r1.w, c8.x
max r0.w, r0, c20.z
mul r1.xyz, r2, r1
add r1.w, c21.x, -r1
mul r0.xyz, r0.w, r0
mad r2.xyz, r1.w, r5, c11
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c20.z
"
}
SubProgram "d3d11 " {
// Stats: 85 math, 7 textures
Keywords { "POINT" "SHADOWS_CUBE" }
SetTexture 0 [_Normalmap] 2D 4
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_ShadowMapTexture] CUBE 0
SetTexture 3 [_Mask] 2D 2
SetTexture 4 [_Glittermap] 2D 5
SetTexture 5 [_Specularglitter] 2D 3
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_Specularglitter_ST]
Float 144 [_MasktransparencyDebug]
Float 148 [_Specularpower05]
Float 152 [_Glitterpower]
Vector 160 [_Color]
Vector 176 [_Normalmap_ST]
Vector 208 [_Glittercolor]
Float 224 [_Glitterymaskdotsscale]
Float 228 [_Glitteryspeed01]
Vector 240 [_Glittermap_ST]
Float 256 [_Glittercontrast13]
Float 260 [_Specularcontrast13]
Float 264 [_Maskadjust0515]
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
eefiecedfgkpgfmfinihkhflpabgehflfeafblciabaaaaaafeaoaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcaeanaaaaeaaaaaaaebadaaaafjaaaaaeegiocaaa
aaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaacaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fidaaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
fibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaad
hcbabaaaagaaaaaagcbaaaadhcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaaoaaaaaa
aceaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaa
baaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaaj
pcaabaaaacaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaa
dcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaa
acaaaaaaaaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalp
aaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaa
agiacaaaaaaaaaaaaoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaa
egiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaaaaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaadiaaaaaj
lcaabaaaaaaaaaaakgikcaaaaaaaaaaaajaaaaaaegiicaaaaaaaaaaaanaaaaaa
diaaaaahlcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaf
lcaabaaaaaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaa
aaaaaaaaagiacaaaaaaaaaaabaaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaa
aaaaaaaaapaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplp
allnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaa
aceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaa
egaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaai
dcaabaaaacaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaal
icaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdo
abeaaaaaaaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaa
acaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaa
baaaaaaadcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaa
apaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaa
acaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaaaaaaaalhcaabaaaacaaaaaa
egacbaiaebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaadaaaaaaaagabaaaacaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
agiacaaaaaaaaaaaajaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaa
egambaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
efaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaafaaaaaaaagabaaa
adaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaa
ajaaaaaacpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaa
aeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaa
aeaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaiaebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaa
egambaaaaaaaaaaaegaibaaaadaaaaaadcaaaaamhcaabaaaadaaaaaapgipcaaa
acaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaa
abaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaa
kgakbaaaaaaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
ecaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egbcbaaaadaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaa
aaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaafaaaaaa
egaabaaaafaaaaaaeghobaaaaaaaaaaaaagabaaaaeaaaaaadcaaaaapdcaabaaa
afaaaaaahgapbaaaafaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaagaaaaaa
fgafbaaaafaaaaaaegbcbaaaafaaaaaadcaaaaajhcaabaaaagaaaaaaagaabaaa
afaaaaaaegbcbaaaaeaaaaaaegacbaaaagaaaaaaapaaaaahecaabaaaaaaaaaaa
egaabaaaafaaaaaaegaabaaaafaaaaaaddaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiecaabaaaaaaaaaaackaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
dcaaaaajhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaa
agaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaa
eeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaa
kgakbaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaa
egacbaaaadaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaadeaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaa
cpaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaabaaaaaa
akiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaaf
ccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaabkaabaaaabaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
baaaaaahccaabaaaabaaaaaaegbcbaaaahaaaaaaegbcbaaaahaaaaaaelaaaaaf
ccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaaiccaabaaaabaaaaaabkaabaaa
abaaaaaadkiacaaaacaaaaaaabaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaa
abaaaaaaabeaaaaaomfbhidpefaaaaajpcaabaaaadaaaaaaegbcbaaaahaaaaaa
eghobaaaacaaaaaaaagabaaaaaaaaaaabbaaaaakecaabaaaabaaaaaaegaobaaa
adaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdhafidibdddbaaaaahccaabaaa
abaaaaaackaabaaaabaaaaaabkaabaaaabaaaaaadhaaaaakccaabaaaabaaaaaa
bkaabaaaabaaaaaaakiacaaaadaaaaaabiaaaaaaabeaaaaaaaaaiadpbaaaaaah
ecaabaaaabaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaa
adaaaaaakgakbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaapaaaaah
ccaabaaaabaaaaaaagaabaaaadaaaaaafgafbaaaabaaaaaadiaaaaaiocaabaaa
abaaaaaafgafbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaa
adaaaaaakgakbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
jgahbaaaabaaaaaaagaabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaa
aaaaaaaaegacbaaaadaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaa
aaaaaaaaajaaaaaaabeaaaaaaaaaiadpdcaaaaakhcaabaaaacaaaaaapgapbaaa
aaaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaaakaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 104 math, 8 textures
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_Mask_ST]
Float 6 [_Shininess]
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
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
"3.0-!!ARBfp1.0
PARAM c[24] = { program.local[0..19],
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
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R3.xyz, R0.w, R1, R0;
DP3 R0.x, R3, R3;
RSQ R0.w, R0.x;
MUL R3.xyz, R0.w, R3;
ADD R0.xyz, -fragment.texcoord[1], c[0];
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R2.x, R0, R0;
DP3 R1.w, R1, R1;
RSQ R2.x, R2.x;
RSQ R1.w, R1.w;
MOV R0.w, c[23];
MUL R0.xyz, R2.x, R0;
MUL R1.xyz, R1.w, R1;
ADD R2.xyz, R1, R0;
DP3 R1.x, R3, R1;
DP3 R1.w, R2, R2;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, R2;
MUL R0.w, R0, c[6].x;
ADD R1.w, R0, c[20].y;
DP3 R0.w, R3, R2;
DP3 R2.x, fragment.texcoord[3], R0;
DP3 R2.y, fragment.texcoord[4], R0;
MUL R6.xy, R2, -c[15].x;
MAD R2.xy, R6, c[22].x, fragment.texcoord[0];
ADD R4.xy, R2, -c[22].y;
EX2 R1.w, R1.w;
MAX R0.w, R0, c[20].z;
POW R3.w, R0.w, R1.w;
TEX R0, fragment.texcoord[6], texture[1], CUBE;
DP4 R0.y, R0, c[21];
DP3 R1.w, fragment.texcoord[6], fragment.texcoord[6];
RSQ R1.w, R1.w;
RCP R0.x, R1.w;
MUL R0.x, R0, c[2].w;
MAD R0.x, -R0, c[20].w, R0.y;
MOV R0.w, c[20].y;
CMP R0.y, R0.x, c[3].x, R0.w;
DP3 R0.x, fragment.texcoord[5], fragment.texcoord[5];
TEX R1.w, fragment.texcoord[5], texture[3], CUBE;
TEX R2.w, R0.x, texture[2], 2D;
MUL R0.x, R2.w, R1.w;
MUL R0.x, R0, R0.y;
MUL R0.xyz, R0.x, c[4];
MUL R2.xyz, R0, c[20].x;
MUL R0.xy, R4.y, c[23];
MOV R1.w, c[15].x;
MUL R0.z, R1.w, -c[23];
MAD R0.xy, R4.x, c[22].zwzw, R0;
ADD R0.xy, R0, c[22].y;
MUL R1.w, R1, c[22].y;
MAX R1.x, R1, c[20].z;
MUL R5.xyz, R2, R3.w;
ADD R0.z, R0, c[20].y;
MUL R0.xy, R0, c[14].x;
MUL R4.xy, R0, R0.z;
MUL R6.zw, R4.xyxy, c[19].x;
MAD R0.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R0.xyz, R0, texture[6], 2D;
MUL R0.xyz, R0, c[9].x;
MAD R4.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R4.xyz, R4, texture[4], 2D;
POW R0.x, R0.x, c[18].x;
POW R0.z, R0.z, c[18].x;
POW R0.y, R0.y, c[18].x;
MAD R7.xyz, R4, -R0, R0;
MAD R0.xy, R6.zwzw, c[16], c[16].zwzw;
TEX R0.xyz, R0, texture[5], 2D;
ADD R0.xyz, -R0, c[20].y;
MAX R4.xyz, R0, R4;
MUL R4.xyz, R4, c[8].x;
MUL R1.xyz, R1.x, R2;
ADD R0.w, R0, -c[8].x;
ADD R1.w, R1, c[20].y;
MAD R6.xy, -R6, c[22].x, fragment.texcoord[0];
MUL R6.xy, R6, R1.w;
MUL R6.xy, R6, c[14].x;
MAD R0.xy, R6, c[16], c[16].zwzw;
MOV R6.xyz, c[13];
TEX R0.xyz, R0, texture[5], 2D;
MUL R6.xyz, R6, c[10].x;
MUL R0.xyz, R6, R0;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R0.xyz, R4, -R0, R0;
ADD R0.xyz, R0, R7;
MUL R0.xyz, R5, R0;
MAD R2.xyz, R0.w, R4, c[11];
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[20].z;
END
# 104 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 115 math, 8 textures
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_Mask_ST]
Float 6 [_Shininess]
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
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
"ps_3_0
dcl_2d s0
dcl_cube s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c20, 2.00000000, -1.00000000, 0.00000000, 0.97000003
def c21, 1.00000000, 0.00392157, 0.00001538, 0.00000006
def c22, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c23, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c24, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
mad r0.xy, v0, c12, c12.zwzw
texld r0.yw, r0, s0
mad_pp r0.xy, r0.wyzw, c20.x, c20.y
mul_pp r1.xy, r0, r0
add_pp_sat r0.w, r1.x, r1.y
mul r2.xyz, r0.y, v4
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c21.x
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
dp3 r3.w, v6, v6
mad r0.xyz, r0.x, v3, r2
mul r1.xyz, r1.x, v2
rcp_pp r0.w, r0.w
mad r0.xyz, r0.w, r1, r0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r3.xyz, r0.w, r0
mad r1.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
add r0.xyz, -v1, c0
dp3 r1.w, r0, r0
rsq r1.w, r1.w
rsq r0.w, r0.w
mul r4.xyz, r0.w, r1
mul r0.xyz, r1.w, r0
dp3 r1.x, v3, r0
dp3 r1.y, v4, r0
mul r1.xy, r1, -c15.x
mad r1.zw, r1.xyxy, c22.x, v0.xyxy
add r2.xy, r1.zwzw, c22.y
add r0.xyz, r4, r0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mul r1.zw, r2.y, c22
mad r1.zw, r2.x, c23.xyxy, r1
dp3 r0.z, r3, r0
add r0.xy, r1.zwzw, c23.z
max r2.x, r0.z, c20.z
mul r0.zw, r0.xyxy, c14.x
mov r0.y, c6.x
mad r1.z, r0.y, c24, c24.y
mov r0.x, c15
mad r0.x, r0, c24, c24.y
exp r2.y, r1.z
mul r0.xy, r0.zwzw, r0.x
mul r1.zw, r0.xyxy, c19.x
pow r0, r2.x, r2.y
mad r2.xy, r1.zwzw, c16, c16.zwzw
mov r0.w, c15.x
texld r2.xyz, r2, s5
mov r1.w, r0.x
add r0.xyz, -r2, c21.x
mad r2.xy, -r1, c22.x, v0
mad r0.w, r0, c23.z, c23
mul r2.xy, r2, r0.w
mov r0.w, c10.x
mad r1.xy, v0, c5, c5.zwzw
texld r1.xyz, r1, s4
mul r2.xy, r2, c14.x
mad r2.xy, r2, c16, c16.zwzw
max r0.xyz, r0, r1
mul r5.xyz, c13, r0.w
texld r2.xyz, r2, s5
mul r6.xyz, r5, r2
mul r5.xyz, r0, c8.x
pow r0, r6.y, c17.x
pow r2, r6.x, c17.x
mov r0.x, r2
pow r2, r6.z, c17.x
mad r6.xy, v0, c7, c7.zwzw
texld r6.xyz, r6, s6
mul r6.xyz, r6, c9.x
mov r0.z, r2
pow r2, r6.x, c18.x
mad r2.yzw, r5.xxyz, -r0.xxyz, r0.xxyz
texld r0, v6, s1
dp4 r0.y, r0, c21
rsq r3.w, r3.w
rcp r0.x, r3.w
pow r7, r6.y, c18.x
mul r0.x, r0, c2.w
mad r0.x, -r0, c20.w, r0.y
mov r0.z, c3.x
cmp r0.y, r0.x, c21.x, r0.z
dp3 r0.x, v5, v5
texld r0.w, v5, s3
texld r0.x, r0.x, s2
mul r0.x, r0, r0.w
mul r3.w, r0.x, r0.y
pow r0, r6.z, c18.x
mov r6.z, r0
mul r0.xyz, r3.w, c4
dp3 r0.w, r3, r4
mov r6.x, r2
mov r6.y, r7
mad r1.xyz, r1, -r6, r6
add r1.xyz, r2.yzww, r1
mul r0.xyz, r0, c20.x
mul r2.xyz, r0, r1.w
mov r1.w, c8.x
max r0.w, r0, c20.z
mul r1.xyz, r2, r1
add r1.w, c21.x, -r1
mul r0.xyz, r0.w, r0
mad r2.xyz, r1.w, r5, c11
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c20.z
"
}
SubProgram "d3d11 " {
// Stats: 86 math, 8 textures
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
SetTexture 0 [_Normalmap] 2D 5
SetTexture 1 [_LightTextureB0] 2D 2
SetTexture 2 [_LightTexture0] CUBE 1
SetTexture 3 [_ShadowMapTexture] CUBE 0
SetTexture 4 [_Mask] 2D 3
SetTexture 5 [_Glittermap] 2D 6
SetTexture 6 [_Specularglitter] 2D 4
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_Specularglitter_ST]
Float 144 [_MasktransparencyDebug]
Float 148 [_Specularpower05]
Float 152 [_Glitterpower]
Vector 160 [_Color]
Vector 176 [_Normalmap_ST]
Vector 208 [_Glittercolor]
Float 224 [_Glitterymaskdotsscale]
Float 228 [_Glitteryspeed01]
Vector 240 [_Glittermap_ST]
Float 256 [_Glittercontrast13]
Float 260 [_Specularcontrast13]
Float 264 [_Maskadjust0515]
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
eefiecedajkkcecklahnmlmgegiocjliahjidkjmabaaaaaalaaoaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcgaanaaaaeaaaaaaafiadaaaafjaaaaaeegiocaaa
aaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaacaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaafidaaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaa
agaaaaaagcbaaaadhcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
ahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaaoaaaaaaaceaaaaa
mnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaia
ebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaah
ccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaa
acaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaak
bcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaa
aaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaaoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaaaaaaaaaeghobaaaafaaaaaaaagabaaaagaaaaaadiaaaaajlcaabaaa
aaaaaaaakgikcaaaaaaaaaaaajaaaaaaegiicaaaaaaaaaaaanaaaaaadiaaaaah
lcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaa
aaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaa
agiacaaaaaaaaaaabaaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
apaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaa
adaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
acaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaa
diaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaabaaaaaaa
dcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaaapaaaaaa
ogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaafaaaaaaaagabaaaagaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaia
ebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
aeaaaaaaaagabaaaadaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaajaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaagaaaaaaaagabaaaaeaaaaaa
diaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaajaaaaaa
cpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaaeaaaaaa
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
alaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaa
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
adaaaaaaaagabaaaaaaaaaaabbaaaaakecaabaaaabaaaaaaegaobaaaadaaaaaa
aceaaaaaaaaaiadpibiaiadlicabibdhafidibdddbaaaaahccaabaaaabaaaaaa
ckaabaaaabaaaaaabkaabaaaabaaaaaadhaaaaakccaabaaaabaaaaaabkaabaaa
abaaaaaaakiacaaaadaaaaaabiaaaaaaabeaaaaaaaaaiadpbaaaaaahecaabaaa
abaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaa
kgakbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaa
aeaaaaaaegbcbaaaagaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaadiaaaaah
ecaabaaaabaaaaaaakaabaaaadaaaaaadkaabaaaaeaaaaaaapaaaaahccaabaaa
abaaaaaakgakbaaaabaaaaaafgafbaaaabaaaaaadiaaaaaiocaabaaaabaaaaaa
fgafbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaadaaaaaa
kgakbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaa
abaaaaaaagaabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaa
egacbaaaadaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaa
ajaaaaaaabeaaaaaaaaaiadpdcaaaaakhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egacbaaaacaaaaaaegiccaaaaaaaaaaaakaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 114 math, 11 textures
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
Vector 10 [_Specularglitter_ST]
Float 11 [_MasktransparencyDebug]
Float 12 [_Specularpower05]
Float 13 [_Glitterpower]
Vector 14 [_Color]
Vector 15 [_Normalmap_ST]
Vector 16 [_Glittercolor]
Float 17 [_Glitterymaskdotsscale]
Float 18 [_Glitteryspeed01]
Vector 19 [_Glittermap_ST]
Float 20 [_Glittercontrast13]
Float 21 [_Specularcontrast13]
Float 22 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
"3.0-!!ARBfp1.0
PARAM c[26] = { program.local[0..22],
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
MAD R2.xy, fragment.texcoord[0], c[15], c[15].zwzw;
TEX R2.yw, R2, texture[0], 2D;
MAD R3.xy, R2.wyzw, c[23].x, -c[23].y;
DP3 R1.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R1.xyz, R0.w, R1;
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MUL R5.xy, R3, R3;
MUL R2.xyz, R3.y, fragment.texcoord[4];
ADD_SAT R0.w, R5.x, R5.y;
ADD R0.w, -R0, c[23].y;
RSQ R0.w, R0.w;
ADD R4.xyz, R1, R0;
MAD R3.xyz, R3.x, fragment.texcoord[3], R2;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R2, R3;
DP3 R0.w, R2, R2;
DP3 R1.w, R4, R4;
RSQ R1.w, R1.w;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R2;
MUL R4.xyz, R1.w, R4;
DP3 R0.w, R3, R4;
DP3 R1.x, R3, R1;
DP3 R2.x, fragment.texcoord[3], R0;
DP3 R2.y, fragment.texcoord[4], R0;
MUL R6.xy, R2, -c[18].x;
MAX R1.w, R0, c[23].z;
MAD R0.zw, R6.xyxy, c[24].y, fragment.texcoord[0].xyxy;
MOV R0.x, c[25].w;
MUL R2.x, R0, c[9];
ADD R0.xy, R0.zwzw, -c[23].w;
MUL R0.zw, R0.y, c[25].xyxy;
MAD R0.xy, R0.x, c[24].zwzw, R0.zwzw;
ADD R0.xy, R0, c[23].w;
ADD R2.x, R2, c[23].y;
EX2 R2.x, R2.x;
RCP R0.w, fragment.texcoord[6].w;
POW R0.z, R1.w, R2.x;
MUL R4.xy, R0, c[17].x;
MAD R0.xy, fragment.texcoord[6], R0.w, c[6];
MAD R2.xy, fragment.texcoord[6], R0.w, c[5];
TEX R0.x, R0, texture[3], 2D;
TEX R2.x, R2, texture[3], 2D;
MOV R2.w, R0.x;
MAD R0.xy, fragment.texcoord[6], R0.w, c[4];
MOV R2.z, R2.x;
MAD R2.xy, fragment.texcoord[6], R0.w, c[3];
TEX R0.x, R0, texture[3], 2D;
TEX R2.x, R2, texture[3], 2D;
MOV R2.y, R0.x;
MAD R2, -fragment.texcoord[6].z, R0.w, R2;
MOV R0.w, c[23].y;
CMP R2, R2, c[2].x, R0.w;
DP4 R2.x, R2, c[24].x;
RCP R0.x, fragment.texcoord[5].w;
MAD R0.xy, fragment.texcoord[5], R0.x, c[23].w;
TEX R1.w, R0, texture[1], 2D;
SLT R0.x, c[23].z, fragment.texcoord[5].z;
MUL R0.x, R0, R1.w;
DP3 R0.y, fragment.texcoord[5], fragment.texcoord[5];
TEX R1.w, R0.y, texture[2], 2D;
MUL R0.x, R0, R1.w;
MUL R0.x, R0, R2;
MUL R1.w, R0.x, c[23].x;
MUL R2.xyz, R1.w, c[7];
MOV R2.w, c[18].x;
MUL R0.y, R2.w, -c[25].z;
ADD R0.y, R0, c[23];
MUL R0.xy, R4, R0.y;
MUL R4.xy, R0, c[22].x;
MAD R6.zw, R4.xyxy, c[19].xyxy, c[19];
MAD R4.xy, fragment.texcoord[0], c[8], c[8].zwzw;
MAX R1.x, R1, c[23].z;
MUL R5.xyz, R2, R0.z;
MAD R0.xy, fragment.texcoord[0], c[10], c[10].zwzw;
TEX R0.xyz, R0, texture[6], 2D;
MUL R0.xyz, R0, c[12].x;
TEX R4.xyz, R4, texture[4], 2D;
POW R0.x, R0.x, c[21].x;
POW R0.z, R0.z, c[21].x;
POW R0.y, R0.y, c[21].x;
MAD R7.xyz, R4, -R0, R0;
TEX R0.xyz, R6.zwzw, texture[5], 2D;
ADD R0.xyz, -R0, c[23].y;
MAX R4.xyz, R0, R4;
MUL R4.xyz, R4, c[11].x;
MUL R1.xyz, R1.x, R2;
ADD R0.w, R0, -c[11].x;
MAD R1.w, R2, c[23], c[23].y;
MAD R6.xy, -R6, c[24].y, fragment.texcoord[0];
MUL R6.xy, R6, R1.w;
MUL R6.xy, R6, c[17].x;
MAD R0.xy, R6, c[19], c[19].zwzw;
MOV R6.xyz, c[16];
TEX R0.xyz, R0, texture[5], 2D;
MUL R6.xyz, R6, c[13].x;
MUL R0.xyz, R6, R0;
POW R0.x, R0.x, c[20].x;
POW R0.z, R0.z, c[20].x;
POW R0.y, R0.y, c[20].x;
MAD R0.xyz, R4, -R0, R0;
ADD R0.xyz, R0, R7;
MUL R0.xyz, R5, R0;
MAD R2.xyz, R0.w, R4, c[14];
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[23].z;
END
# 114 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 124 math, 11 textures
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
Vector 10 [_Specularglitter_ST]
Float 11 [_MasktransparencyDebug]
Float 12 [_Specularpower05]
Float 13 [_Glitterpower]
Vector 14 [_Color]
Vector 15 [_Normalmap_ST]
Vector 16 [_Glittercolor]
Float 17 [_Glitterymaskdotsscale]
Float 18 [_Glitteryspeed01]
Vector 19 [_Glittermap_ST]
Float 20 [_Glittercontrast13]
Float 21 [_Specularcontrast13]
Float 22 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c23, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c24, 0.50000000, 0.25000000, 0.05000000, -0.50000000
def c25, 0.00159374, -0.99999875, -0.00159374, 0
def c26, -0.31830987, 1.00000000, 10.00000000, 0.50000000
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
dcl_texcoord6 v6
mad r1.xyz, -v1, c1.w, c1
dp3 r0.x, r1, r1
add r3.xyz, -v1, c0
rsq r0.x, r0.x
mul r2.xyz, r0.x, r1
dp3 r0.z, r3, r3
mad r0.xy, v0, c15, c15.zwzw
texld r1.yw, r0, s0
mad_pp r4.zw, r1.xywy, c23.x, c23.y
mul_pp r4.xy, r4.zwzw, r4.zwzw
add_pp_sat r1.w, r4.x, r4.y
rsq r0.z, r0.z
mul r0.xyz, r0.z, r3
mul r1.xyz, r4.w, v4
dp3 r0.w, v2, v2
add_pp r1.w, -r1, c23
add r3.xyz, r2, r0
mad r1.xyz, r4.z, v3, r1
rsq r0.w, r0.w
mul r4.xyz, r0.w, v2
rsq_pp r1.w, r1.w
rcp_pp r0.w, r1.w
mad r1.xyz, r0.w, r4, r1
dp3 r1.w, r1, r1
dp3 r0.w, r3, r3
rsq r0.w, r0.w
mul r4.xyz, r0.w, r3
rsq r1.w, r1.w
mul r3.xyz, r1.w, r1
dp3 r0.w, r3, r4
dp3 r1.x, v3, r0
dp3 r1.y, v4, r0
mov r0.x, c9
mad r0.x, r0, c26.z, c26.y
max r3.w, r0, c23.z
mul r1.xy, r1, -c18.x
mad r0.zw, r1.xyxy, c24.z, v0.xyxy
add r4.xy, r0.zwzw, c24.w
exp r2.w, r0.x
pow r0, r3.w, r2.w
mul r1.zw, r4.y, c25.xyxy
mad r0.zw, r4.x, c25.xyyz, r1
add r1.zw, r0, c24.x
mov r0.w, r0.x
mul r0.xy, r1.zwzw, c17.x
mov r0.z, c18.x
mad r0.z, r0, c26.w, c26.y
mad r1.xy, -r1, c24.z, v0
mul r1.xy, r1, r0.z
mov r1.z, c18.x
mad r0.z, r1, c26.x, c26.y
mul r1.zw, r1.xyxy, c17.x
mul r1.xy, r0, r0.z
mad r0.xy, r1.zwzw, c19, c19.zwzw
mov r1.z, c13.x
rcp r1.w, v6.w
texld r0.xyz, r0, s5
mul r4.xyz, c16, r1.z
mul r4.xyz, r4, r0
pow r6, r4.z, c20.x
mul r0.xy, r1, c22.x
mad r1.xy, r0, c19, c19.zwzw
pow r5, r4.x, c20.x
mad r6.xy, v6, r1.w, c5
mov r4.x, r5
pow r5, r4.y, c20.x
mov r4.y, r5
mad r5.xy, v6, r1.w, c6
texld r5.x, r5, s3
mov r6.w, r5.x
mad r5.xy, v6, r1.w, c4
mad r0.xy, v0, c8, c8.zwzw
texld r1.xyz, r1, s5
texld r0.xyz, r0, s4
add r1.xyz, -r1, c23.w
max r1.xyz, r1, r0
mul r1.xyz, r1, c11.x
mov r4.z, r6
texld r6.x, r6, s3
mov r6.z, r6.x
mad r6.xy, v6, r1.w, c3
texld r6.x, r6, s3
texld r5.x, r5, s3
mov r6.y, r5.x
mad r5, -v6.z, r1.w, r6
mad r6.xy, v0, c10, c10.zwzw
texld r7.xyz, r6, s6
mov r1.w, c2.x
cmp r6, r5, c23.w, r1.w
mul r5.xyz, r7, c12.x
dp4_pp r2.w, r6, c24.y
pow r6, r5.x, c21.x
rcp r1.w, v5.w
mad r7.xy, v5, r1.w, c24.x
texld r1.w, r7, s1
pow r7, r5.y, c21.x
dp3 r5.x, v5, v5
cmp r3.w, -v5.z, c23.z, c23
mad r4.xyz, r1, -r4, r4
texld r5.x, r5.x, s2
mul_pp r1.w, r3, r1
mul_pp r1.w, r1, r5.x
mov r5.x, r6
pow r6, r5.z, c21.x
mul_pp r1.w, r1, r2
mov r5.z, r6
mov r5.y, r7
mad r0.xyz, r0, -r5, r5
add r4.xyz, r4, r0
mul_pp r1.w, r1, c23.x
mul r0.xyz, r1.w, c7
mul r5.xyz, r0, r0.w
dp3 r1.w, r3, r2
mov r0.w, c11.x
max r1.w, r1, c23.z
add r0.w, c23, -r0
mul r4.xyz, r5, r4
mul r0.xyz, r1.w, r0
mad r1.xyz, r0.w, r1, c14
mad oC0.xyz, r0, r1, r4
mov_pp oC0.w, c23.z
"
}
SubProgram "d3d11 " {
// Stats: 92 math, 11 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
SetTexture 0 [_Normalmap] 2D 5
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 0
SetTexture 4 [_Mask] 2D 3
SetTexture 5 [_Glittermap] 2D 6
SetTexture 6 [_Specularglitter] 2D 4
ConstBuffer "$Globals" 336
Vector 16 [_ShadowOffsets0]
Vector 32 [_ShadowOffsets1]
Vector 48 [_ShadowOffsets2]
Vector 64 [_ShadowOffsets3]
Vector 144 [_LightColor0]
Vector 160 [_Mask_ST]
Float 176 [_Shininess]
Vector 192 [_Specularglitter_ST]
Float 208 [_MasktransparencyDebug]
Float 212 [_Specularpower05]
Float 216 [_Glitterpower]
Vector 224 [_Color]
Vector 240 [_Normalmap_ST]
Vector 272 [_Glittercolor]
Float 288 [_Glitterymaskdotsscale]
Float 292 [_Glitteryspeed01]
Vector 304 [_Glittermap_ST]
Float 320 [_Glittercontrast13]
Float 324 [_Specularcontrast13]
Float 328 [_Maskadjust0515]
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
eefiecedacigpioipebjmchjegaihkpmpmfanmpiabaaaaaacmbaaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcnmaoaaaaeaaaaaaalhadaaaafjaaaaaeegiocaaa
aaaaaaaabfaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaa
agaaaaaagcbaaaadpcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
ahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaabcaaaaaaaceaaaaa
mnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaia
ebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaah
ccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaa
acaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaak
bcaabaaaaaaaaaaabkiacaaaaaaaaaaabcaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaa
aaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaabcaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaabdaaaaaaogikcaaaaaaaaaaabdaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaaaaaaaaaeghobaaaafaaaaaaaagabaaaagaaaaaadiaaaaajlcaabaaa
aaaaaaaakgikcaaaaaaaaaaaanaaaaaaegiicaaaaaaaaaaabbaaaaaadiaaaaah
lcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaa
aaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaa
agiacaaaaaaaaaaabeaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
apaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaa
adaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
acaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaabcaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaabcaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaa
diaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaabeaaaaaa
dcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaabdaaaaaa
ogikcaaaaaaaaaaabdaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaafaaaaaaaagabaaaagaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaia
ebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaa
aaaaaaaaakaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
aeaaaaaaaagabaaaadaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaagaaaaaaaagabaaaaeaaaaaa
diaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaanaaaaaa
cpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaabeaaaaaabjaaaaafhcaabaaaaeaaaaaa
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
apaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaa
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
aaaaaaaaalaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaa
abaaaaaabkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
bkaabaaaabaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaoaaaaah
ocaabaaaabaaaaaaagbjbaaaahaaaaaapgbpbaaaahaaaaaaaaaaaaaidcaabaaa
adaaaaaajgafbaaaabaaaaaaegiacaaaaaaaaaaaabaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaadaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaaaaaaaaai
dcaabaaaaeaaaaaajgafbaaaabaaaaaaegiacaaaaaaaaaaaacaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaa
dgaaaaafccaabaaaadaaaaaaakaabaaaaeaaaaaaaaaaaaaidcaabaaaaeaaaaaa
jgafbaaaabaaaaaaegiacaaaaaaaaaaaadaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaeaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaadgaaaaafecaabaaa
adaaaaaaakaabaaaaeaaaaaaaaaaaaaigcaabaaaabaaaaaafgagbaaaabaaaaaa
agibcaaaaaaaaaaaaeaaaaaaefaaaaajpcaabaaaaeaaaaaajgafbaaaabaaaaaa
eghobaaaadaaaaaaaagabaaaaaaaaaaadgaaaaaficaabaaaadaaaaaaakaabaaa
aeaaaaaadbaaaaahpcaabaaaadaaaaaaegaobaaaadaaaaaapgapbaaaabaaaaaa
dhaaaaanpcaabaaaadaaaaaaegaobaaaadaaaaaaagiacaaaadaaaaaabiaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpbbaaaaakccaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaaaaaaiadoaaaaiadoaaaaiadoaaaaiadoaoaaaaah
mcaabaaaabaaaaaaagbebaaaagaaaaaapgbpbaaaagaaaaaaaaaaaaakmcaabaaa
abaaaaaakgaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaadpaaaaaadp
efaaaaajpcaabaaaadaaaaaaogakbaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaadbaaaaahecaabaaaabaaaaaaabeaaaaaaaaaaaaackbabaaaagaaaaaa
abaaaaahecaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaah
ecaabaaaabaaaaaadkaabaaaadaaaaaackaabaaaabaaaaaabaaaaaahicaabaaa
abaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaa
pgapbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahecaabaaa
abaaaaaackaabaaaabaaaaaaakaabaaaadaaaaaaapaaaaahccaabaaaabaaaaaa
kgakbaaaabaaaaaafgafbaaaabaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaa
abaaaaaaagijcaaaaaaaaaaaajaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaa
aaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaa
agaabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaa
adaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaanaaaaaa
abeaaaaaaaaaiadpdcaaaaakhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
acaaaaaaegiccaaaaaaaaaaaaoaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 114 math, 11 textures
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
Vector 10 [_Specularglitter_ST]
Float 11 [_MasktransparencyDebug]
Float 12 [_Specularpower05]
Float 13 [_Glitterpower]
Vector 14 [_Color]
Vector 15 [_Normalmap_ST]
Vector 16 [_Glittercolor]
Float 17 [_Glitterymaskdotsscale]
Float 18 [_Glitteryspeed01]
Vector 19 [_Glittermap_ST]
Float 20 [_Glittercontrast13]
Float 21 [_Specularcontrast13]
Float 22 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
"3.0-!!ARBfp1.0
OPTION ARB_fragment_program_shadow;
PARAM c[26] = { program.local[0..22],
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
MAD R0.xy, fragment.texcoord[0], c[15], c[15].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[23].x, -c[23].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.w, R1.x, R1.y;
MUL R2.xyz, R0.y, fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.w, -R0, c[23].y;
RSQ R1.x, R1.x;
RSQ R0.w, R0.w;
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R1, R0;
ADD R1.xyz, -fragment.texcoord[1], c[0];
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R2, R2;
DP3 R2.w, R1, R1;
DP3 R1.w, R0, R0;
RSQ R2.w, R2.w;
MUL R4.xyz, R2.w, R1;
RSQ R1.w, R1.w;
MUL R1.xyz, R1.w, R0;
ADD R0.xyz, R1, R4;
RSQ R0.w, R0.w;
RCP R2.w, fragment.texcoord[6].w;
MUL R3.xyz, R0.w, R2;
DP3 R1.w, R0, R0;
RSQ R0.w, R1.w;
MUL R2.xyz, R0.w, R0;
DP3 R0.w, R3, R2;
MAD R0.xyz, fragment.texcoord[6], R2.w, c[6];
MAD R2.xyz, fragment.texcoord[6], R2.w, c[4];
MAX R1.w, R0, c[23].z;
TEX R0.x, R0, texture[3], SHADOW2D;
MOV R0.w, R0.x;
MAD R0.xyz, fragment.texcoord[6], R2.w, c[5];
TEX R0.x, R0, texture[3], SHADOW2D;
TEX R2.x, R2, texture[3], SHADOW2D;
MOV R0.y, R2.x;
MAD R2.xyz, fragment.texcoord[6], R2.w, c[3];
MOV R0.z, R0.x;
TEX R0.x, R2, texture[3], SHADOW2D;
MOV R2.w, c[25];
MUL R2.x, R2.w, c[9];
ADD R2.y, R2.x, c[23];
MOV R2.w, c[23].y;
ADD R2.x, R2.w, -c[2];
MAD R0, R0, R2.x, c[2].x;
DP4 R2.x, R0, c[24].x;
EX2 R2.y, R2.y;
POW R3.w, R1.w, R2.y;
RCP R0.z, fragment.texcoord[5].w;
MAD R0.zw, fragment.texcoord[5].xyxy, R0.z, c[23].w;
TEX R0.w, R0.zwzw, texture[1], 2D;
DP3 R1.w, fragment.texcoord[5], fragment.texcoord[5];
SLT R0.z, c[23], fragment.texcoord[5];
MUL R0.z, R0, R0.w;
TEX R1.w, R1.w, texture[2], 2D;
MUL R0.z, R0, R1.w;
MUL R0.z, R0, R2.x;
MOV R0.w, c[18].x;
MUL R1.w, R0, -c[25].z;
DP3 R0.x, fragment.texcoord[3], R4;
DP3 R0.y, fragment.texcoord[4], R4;
MUL R6.xy, R0, -c[18].x;
MAD R0.xy, R6, c[24].y, fragment.texcoord[0];
ADD R0.xy, R0, -c[23].w;
MUL R2.xy, R0.y, c[25];
MAD R0.xy, R0.x, c[24].zwzw, R2;
MUL R0.z, R0, c[23].x;
MUL R2.xyz, R0.z, c[7];
ADD R0.xy, R0, c[23].w;
ADD R1.w, R1, c[23].y;
MUL R0.xy, R0, c[17].x;
MUL R0.xy, R0, R1.w;
MUL R4.xy, R0, c[22].x;
MAD R6.zw, R4.xyxy, c[19].xyxy, c[19];
MAD R0.xy, fragment.texcoord[0], c[10], c[10].zwzw;
TEX R0.xyz, R0, texture[6], 2D;
MUL R0.xyz, R0, c[12].x;
MAD R4.xy, fragment.texcoord[0], c[8], c[8].zwzw;
MUL R5.xyz, R2, R3.w;
TEX R4.xyz, R4, texture[4], 2D;
POW R0.x, R0.x, c[21].x;
POW R0.z, R0.z, c[21].x;
POW R0.y, R0.y, c[21].x;
MAD R7.xyz, R4, -R0, R0;
TEX R0.xyz, R6.zwzw, texture[5], 2D;
ADD R0.xyz, -R0, c[23].y;
MAX R4.xyz, R0, R4;
MAD R0.w, R0, c[23], c[23].y;
MAD R6.xy, -R6, c[24].y, fragment.texcoord[0];
MUL R6.xy, R6, R0.w;
MUL R6.xy, R6, c[17].x;
MAD R0.xy, R6, c[19], c[19].zwzw;
DP3 R0.w, R3, R1;
MOV R6.xyz, c[16];
MAX R0.w, R0, c[23].z;
MUL R4.xyz, R4, c[11].x;
MUL R1.xyz, R0.w, R2;
ADD R1.w, R2, -c[11].x;
TEX R0.xyz, R0, texture[5], 2D;
MUL R6.xyz, R6, c[13].x;
MUL R0.xyz, R6, R0;
POW R0.x, R0.x, c[20].x;
POW R0.z, R0.z, c[20].x;
POW R0.y, R0.y, c[20].x;
MAD R0.xyz, R4, -R0, R0;
ADD R0.xyz, R0, R7;
MUL R0.xyz, R5, R0;
MAD R2.xyz, R1.w, R4, c[14];
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[23].z;
END
# 114 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 124 math, 11 textures
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
Vector 10 [_Specularglitter_ST]
Float 11 [_MasktransparencyDebug]
Float 12 [_Specularpower05]
Float 13 [_Glitterpower]
Vector 14 [_Color]
Vector 15 [_Normalmap_ST]
Vector 16 [_Glittercolor]
Float 17 [_Glitterymaskdotsscale]
Float 18 [_Glitteryspeed01]
Vector 19 [_Glittermap_ST]
Float 20 [_Glittercontrast13]
Float 21 [_Specularcontrast13]
Float 22 [_Maskadjust0515]
SetTexture 0 [_Normalmap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c23, 2.00000000, -1.00000000, 0.00000000, 1.00000000
def c24, 0.50000000, 0.25000000, 0.05000000, -0.50000000
def c25, 0.00159374, -0.99999875, -0.00159374, 0
def c26, -0.31830987, 1.00000000, 10.00000000, 0.50000000
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
dcl_texcoord6 v6
mad r1.xyz, -v1, c1.w, c1
dp3 r0.x, r1, r1
add r3.xyz, -v1, c0
rsq r0.x, r0.x
mul r2.xyz, r0.x, r1
dp3 r0.z, r3, r3
mad r0.xy, v0, c15, c15.zwzw
texld r1.yw, r0, s0
mad_pp r4.zw, r1.xywy, c23.x, c23.y
mul_pp r4.xy, r4.zwzw, r4.zwzw
add_pp_sat r1.w, r4.x, r4.y
rsq r0.z, r0.z
mul r0.xyz, r0.z, r3
mul r1.xyz, r4.w, v4
dp3 r0.w, v2, v2
add_pp r1.w, -r1, c23
add r3.xyz, r2, r0
mad r1.xyz, r4.z, v3, r1
rsq r0.w, r0.w
mul r4.xyz, r0.w, v2
rsq_pp r1.w, r1.w
rcp_pp r0.w, r1.w
mad r1.xyz, r0.w, r4, r1
dp3 r1.w, r1, r1
dp3 r0.w, r3, r3
rsq r0.w, r0.w
mul r4.xyz, r0.w, r3
rsq r1.w, r1.w
mul r3.xyz, r1.w, r1
dp3 r0.w, r3, r4
dp3 r1.x, v3, r0
dp3 r1.y, v4, r0
mov r0.x, c9
mad r0.x, r0, c26.z, c26.y
max r3.w, r0, c23.z
mul r1.xy, r1, -c18.x
mad r0.zw, r1.xyxy, c24.z, v0.xyxy
add r4.xy, r0.zwzw, c24.w
exp r2.w, r0.x
pow r0, r3.w, r2.w
mul r1.zw, r4.y, c25.xyxy
mad r0.zw, r4.x, c25.xyyz, r1
add r1.zw, r0, c24.x
mov r0.w, r0.x
mul r0.xy, r1.zwzw, c17.x
mov r0.z, c18.x
mad r0.z, r0, c26.w, c26.y
mad r1.xy, -r1, c24.z, v0
mul r1.xy, r1, r0.z
mov r1.z, c18.x
mad r0.z, r1, c26.x, c26.y
mul r1.zw, r1.xyxy, c17.x
mul r1.xy, r0, r0.z
mad r0.xy, r1.zwzw, c19, c19.zwzw
mov r1.z, c13.x
rcp r1.w, v6.w
texld r0.xyz, r0, s5
mul r4.xyz, c16, r1.z
mul r4.xyz, r4, r0
pow r6, r4.z, c20.x
mul r0.xy, r1, c22.x
mad r1.xy, r0, c19, c19.zwzw
pow r5, r4.x, c20.x
mov r4.x, r5
pow r5, r4.y, c20.x
mov r4.y, r5
mad r5.xyz, v6, r1.w, c6
texld r6.x, r5, s3
mad r7.xy, v0, c10, c10.zwzw
texld r5.xyz, r7, s6
mad r7.xyz, v6, r1.w, c4
mad r0.xy, v0, c8, c8.zwzw
texld r1.xyz, r1, s5
mul r5.xyz, r5, c12.x
texld r0.xyz, r0, s4
add r1.xyz, -r1, c23.w
max r1.xyz, r1, r0
mul r1.xyz, r1, c11.x
mov r4.z, r6
mov_pp r6.w, r6.x
mad r6.xyz, v6, r1.w, c5
texld r6.x, r6, s3
texld r7.x, r7, s3
mov_pp r6.y, r7.x
mad r7.xyz, v6, r1.w, c3
mov_pp r6.z, r6.x
mov r2.w, c2.x
add r1.w, c23, -r2
texld r6.x, r7, s3
mad r6, r6, r1.w, c2.x
dp4_pp r2.w, r6, c24.y
pow r6, r5.x, c21.x
rcp r1.w, v5.w
mad r7.xy, v5, r1.w, c24.x
texld r1.w, r7, s1
pow r7, r5.y, c21.x
dp3 r5.x, v5, v5
cmp r3.w, -v5.z, c23.z, c23
mad r4.xyz, r1, -r4, r4
texld r5.x, r5.x, s2
mul_pp r1.w, r3, r1
mul_pp r1.w, r1, r5.x
mov r5.x, r6
pow r6, r5.z, c21.x
mul_pp r1.w, r1, r2
mov r5.z, r6
mov r5.y, r7
mad r0.xyz, r0, -r5, r5
add r4.xyz, r4, r0
mul_pp r1.w, r1, c23.x
mul r0.xyz, r1.w, c7
mul r5.xyz, r0, r0.w
dp3 r1.w, r3, r2
mov r0.w, c11.x
max r1.w, r1, c23.z
add r0.w, c23, -r0
mul r4.xyz, r5, r4
mul r0.xyz, r1.w, r0
mad r1.xyz, r0.w, r1, c14
mad oC0.xyz, r0, r1, r4
mov_pp oC0.w, c23.z
"
}
SubProgram "d3d11 " {
// Stats: 93 math, 7 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
SetTexture 0 [_Normalmap] 2D 5
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 6
SetTexture 5 [_Specularglitter] 2D 4
SetTexture 6 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 336
Vector 16 [_ShadowOffsets0]
Vector 32 [_ShadowOffsets1]
Vector 48 [_ShadowOffsets2]
Vector 64 [_ShadowOffsets3]
Vector 144 [_LightColor0]
Vector 160 [_Mask_ST]
Float 176 [_Shininess]
Vector 192 [_Specularglitter_ST]
Float 208 [_MasktransparencyDebug]
Float 212 [_Specularpower05]
Float 216 [_Glitterpower]
Vector 224 [_Color]
Vector 240 [_Normalmap_ST]
Vector 272 [_Glittercolor]
Float 288 [_Glitterymaskdotsscale]
Float 292 [_Glitteryspeed01]
Vector 304 [_Glittermap_ST]
Float 320 [_Glittercontrast13]
Float 324 [_Specularcontrast13]
Float 328 [_Maskadjust0515]
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
eefiecedockbckebngodckagonfbdeainonhpkacabaaaaaaambaaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefclmaoaaaaeaaaaaaakpadaaaafjaaaaaeegiocaaa
aaaaaaaabfaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaiaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaa
agaaaaaagcbaaaadpcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
ahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaabcaaaaaaaceaaaaa
mnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaia
ebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaah
ccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaa
acaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaak
bcaabaaaaaaaaaaabkiacaaaaaaaaaaabcaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaa
aaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaabcaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaabdaaaaaaogikcaaaaaaaaaaabdaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaaaaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaadiaaaaajlcaabaaa
aaaaaaaakgikcaaaaaaaaaaaanaaaaaaegiicaaaaaaaaaaabbaaaaaadiaaaaah
lcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaa
aaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaa
agiacaaaaaaaaaaabeaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
apaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaa
adaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
acaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaabcaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaabcaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaa
diaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaabeaaaaaa
dcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaabdaaaaaa
ogikcaaaaaaaaaaabdaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaaeaaaaaaaagabaaaagaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaia
ebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaa
aaaaaaaaakaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
adaaaaaaaagabaaaadaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaafaaaaaaaagabaaaaeaaaaaa
diaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaanaaaaaa
cpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaabeaaaaaabjaaaaafhcaabaaaaeaaaaaa
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
apaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaa
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
aaaaaaaaalaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaa
abaaaaaabkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
bkaabaaaabaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaaj
ccaabaaaabaaaaaaakiacaiaebaaaaaaadaaaaaabiaaaaaaabeaaaaaaaaaiadp
aoaaaaahhcaabaaaadaaaaaaegbcbaaaahaaaaaapgbpbaaaahaaaaaaaaaaaaai
hcaabaaaaeaaaaaaegacbaaaadaaaaaaegiccaaaaaaaaaaaabaaaaaaehaaaaal
bcaabaaaaeaaaaaaegaabaaaaeaaaaaaaghabaaaagaaaaaaaagabaaaaaaaaaaa
ckaabaaaaeaaaaaaaaaaaaaihcaabaaaafaaaaaaegacbaaaadaaaaaaegiccaaa
aaaaaaaaacaaaaaaehaaaaalccaabaaaaeaaaaaaegaabaaaafaaaaaaaghabaaa
agaaaaaaaagabaaaaaaaaaaackaabaaaafaaaaaaaaaaaaaihcaabaaaafaaaaaa
egacbaaaadaaaaaaegiccaaaaaaaaaaaadaaaaaaaaaaaaaihcaabaaaadaaaaaa
egacbaaaadaaaaaaegiccaaaaaaaaaaaaeaaaaaaehaaaaalicaabaaaaeaaaaaa
egaabaaaadaaaaaaaghabaaaagaaaaaaaagabaaaaaaaaaaackaabaaaadaaaaaa
ehaaaaalecaabaaaaeaaaaaaegaabaaaafaaaaaaaghabaaaagaaaaaaaagabaaa
aaaaaaaackaabaaaafaaaaaadcaaaaakpcaabaaaadaaaaaaegaobaaaaeaaaaaa
fgafbaaaabaaaaaaagiacaaaadaaaaaabiaaaaaabbaaaaakccaabaaaabaaaaaa
egaobaaaadaaaaaaaceaaaaaaaaaiadoaaaaiadoaaaaiadoaaaaiadoaoaaaaah
mcaabaaaabaaaaaaagbebaaaagaaaaaapgbpbaaaagaaaaaaaaaaaaakmcaabaaa
abaaaaaakgaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaadpaaaaaadp
efaaaaajpcaabaaaadaaaaaaogakbaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaadbaaaaahecaabaaaabaaaaaaabeaaaaaaaaaaaaackbabaaaagaaaaaa
abaaaaahecaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaah
ecaabaaaabaaaaaadkaabaaaadaaaaaackaabaaaabaaaaaabaaaaaahicaabaaa
abaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaa
pgapbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahecaabaaa
abaaaaaackaabaaaabaaaaaaakaabaaaadaaaaaaapaaaaahccaabaaaabaaaaaa
kgakbaaaabaaaaaafgafbaaaabaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaa
abaaaaaaagijcaaaaaaaaaaaajaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaa
aaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaa
agaabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaa
adaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaanaaaaaa
abeaaaaaaaaaiadpdcaaaaakhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
acaaaaaaegiccaaaaaaaaaaaaoaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 113 math, 10 textures
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_Mask_ST]
Float 6 [_Shininess]
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
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
"3.0-!!ARBfp1.0
PARAM c[25] = { program.local[0..19],
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
MAD R0.xyz, R0.x, fragment.texcoord[3], R2;
MUL R1.xyz, R1.x, fragment.texcoord[2];
RCP R0.w, R0.w;
MAD R2.xyz, R0.w, R1, R0;
ADD R1.xyz, -fragment.texcoord[1], c[0];
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R1.w, R1, R1;
DP3 R0.w, R0, R0;
RSQ R1.w, R1.w;
MUL R4.xyz, R1.w, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R0;
ADD R0.xyz, R1, R4;
DP3 R0.w, R2, R2;
DP3 R1.w, R0, R0;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R2;
DP3 R1.x, R3, R1;
RSQ R1.w, R1.w;
MUL R0.xyz, R1.w, R0;
DP3 R0.x, R3, R0;
MOV R0.w, c[24].y;
MUL R0.y, R0.w, c[6].x;
ADD R0.w, R0.y, c[20].y;
MAX R1.w, R0.x, c[20].z;
EX2 R2.x, R0.w;
POW R1.w, R1.w, R2.x;
ADD R0.xyz, fragment.texcoord[6], c[21].xyyw;
TEX R0, R0, texture[1], CUBE;
DP4 R5.w, R0, c[22];
ADD R0.xyz, fragment.texcoord[6], c[21].yxyw;
TEX R0, R0, texture[1], CUBE;
DP4 R5.z, R0, c[22];
ADD R2.xyz, fragment.texcoord[6], c[21].yyxw;
TEX R2, R2, texture[1], CUBE;
DP4 R5.y, R2, c[22];
ADD R0.xyz, fragment.texcoord[6], c[21].x;
TEX R0, R0, texture[1], CUBE;
DP4 R5.x, R0, c[22];
DP3 R2.x, fragment.texcoord[6], fragment.texcoord[6];
RSQ R2.x, R2.x;
RCP R0.x, R2.x;
MUL R0.x, R0, c[2].w;
MAD R2, -R0.x, c[20].w, R5;
MOV R0.w, c[20].y;
CMP R2, R2, c[3].x, R0.w;
DP4 R0.y, R2, c[21].z;
DP3 R0.x, fragment.texcoord[5], fragment.texcoord[5];
TEX R2.w, R0.x, texture[2], 2D;
MUL R0.z, R2.w, R0.y;
DP3 R0.x, fragment.texcoord[3], R4;
DP3 R0.y, fragment.texcoord[4], R4;
MUL R6.xy, R0, -c[15].x;
MUL R0.xyz, R0.z, c[4];
MUL R2.xyz, R0, c[20].x;
MAD R4.xy, R6, c[21].w, fragment.texcoord[0];
ADD R0.xy, R4, -c[23].x;
MUL R5.xyz, R2, R1.w;
MUL R4.xy, R0.y, c[23].wyzw;
MAD R0.xy, R0.x, c[23].yzzw, R4;
MOV R1.w, c[15].x;
MUL R0.z, R1.w, -c[24].x;
ADD R0.xy, R0, c[23].x;
MUL R1.w, R1, c[23].x;
MAX R1.x, R1, c[20].z;
ADD R0.z, R0, c[20].y;
MUL R0.xy, R0, c[14].x;
MUL R4.xy, R0, R0.z;
MUL R6.zw, R4.xyxy, c[19].x;
MAD R0.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R0.xyz, R0, texture[5], 2D;
MUL R0.xyz, R0, c[9].x;
MAD R4.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R4.xyz, R4, texture[3], 2D;
POW R0.x, R0.x, c[18].x;
POW R0.z, R0.z, c[18].x;
POW R0.y, R0.y, c[18].x;
MAD R7.xyz, R4, -R0, R0;
MAD R0.xy, R6.zwzw, c[16], c[16].zwzw;
TEX R0.xyz, R0, texture[4], 2D;
ADD R0.xyz, -R0, c[20].y;
MAX R4.xyz, R0, R4;
MUL R4.xyz, R4, c[8].x;
MUL R1.xyz, R1.x, R2;
ADD R0.w, R0, -c[8].x;
ADD R1.w, R1, c[20].y;
MAD R6.xy, -R6, c[21].w, fragment.texcoord[0];
MUL R6.xy, R6, R1.w;
MUL R6.xy, R6, c[14].x;
MAD R0.xy, R6, c[16], c[16].zwzw;
MOV R6.xyz, c[13];
TEX R0.xyz, R0, texture[4], 2D;
MUL R6.xyz, R6, c[10].x;
MUL R0.xyz, R6, R0;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R0.xyz, R4, -R0, R0;
ADD R0.xyz, R0, R7;
MUL R0.xyz, R5, R0;
MAD R2.xyz, R0.w, R4, c[11];
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[20].z;
END
# 113 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 122 math, 10 textures
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_Mask_ST]
Float 6 [_Shininess]
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
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Specularglitter] 2D 5
"ps_3_0
dcl_2d s0
dcl_cube s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c20, 2.00000000, -1.00000000, 0.00000000, 0.00781250
def c21, 0.00781250, -0.00781250, 0.97000003, 0.25000000
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
mad r0.xyz, -v1, c1.w, c1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r4.xyz, r0.w, r0
add r2.xyz, -v1, c0
dp3 r0.z, r2, r2
mad r0.xy, v0, c12, c12.zwzw
texld r1.yw, r0, s0
rsq r0.z, r0.z
mul r0.xyz, r0.z, r2
mad_pp r2.xy, r1.wyzw, c20.x, c20.y
add r3.xyz, r4, r0
mul_pp r5.xy, r2, r2
mul r1.xyz, r2.y, v4
mad r2.xyz, r2.x, v3, r1
add_pp_sat r0.w, r5.x, r5.y
dp3 r1.w, r3, r3
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c22.x
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r2
dp3 r0.w, r1, r1
rsq r1.w, r1.w
mul r2.xyz, r1.w, r3
rsq r0.w, r0.w
mul r3.xyz, r0.w, r1
dp3 r0.w, r3, r2
max r2.z, r0.w, c20
dp3 r1.x, v3, r0
dp3 r1.y, v4, r0
mul r1.xy, r1, -c15.x
mad r0.xy, r1, c23.x, v0
add r2.xy, r0, c23.y
mov r0.z, c6.x
mad r0.z, r0, c25, c25.y
exp r2.w, r0.z
pow r0, r2.z, r2.w
mul r1.zw, r2.y, c23
mad r0.zw, r2.x, c24.xyxy, r1
add r0.zw, r0, c24.z
mov r2.w, r0.x
mul r0.xy, r0.zwzw, c14.x
mov r0.w, c15.x
mov r0.z, c15.x
mad r0.z, r0, c25.x, c25.y
mul r0.xy, r0, r0.z
mul r2.xy, r0, c19.x
mad r0.w, r0, c24.z, c24
mad r1.xy, -r1, c23.x, v0
mul r1.xy, r1, r0.w
mul r0.zw, r1.xyxy, c14.x
mad r0.xy, r0.zwzw, c16, c16.zwzw
mov r0.w, c10.x
texld r0.xyz, r0, s4
mul r1.xyz, c13, r0.w
mul r6.xyz, r1, r0
mad r0.xy, r2, c16, c16.zwzw
mad r1.xy, v0, c5, c5.zwzw
texld r0.xyz, r0, s4
texld r2.xyz, r1, s3
add r0.xyz, -r0, c22.x
max r1.xyz, r0, r2
pow r0, r6.x, c17.x
mul r5.xyz, r1, c8.x
pow r1, r6.y, c17.x
mov r1.x, r0
pow r0, r6.z, c17.x
mov r1.z, r0
add r6.xyz, v6, c21.xyyw
texld r0, r6, s1
dp4 r6.w, r0, c22
mad r7.xyz, r5, -r1, r1
add r0.xyz, v6, c21.yxyw
texld r0, r0, s1
dp4 r6.z, r0, c22
add r1.xyz, v6, c21.yyxw
texld r1, r1, s1
dp4 r6.y, r1, c22
dp3 r0.w, v6, v6
rsq r1.x, r0.w
add r0.xyz, v6, c20.w
texld r0, r0, s1
dp4 r6.x, r0, c22
rcp r1.x, r1.x
mul r0.x, r1, c2.w
mad r1.xy, v0, c7, c7.zwzw
mad r0, -r0.x, c21.z, r6
mov r1.w, c3.x
cmp r0, r0, c22.x, r1.w
dp4_pp r0.y, r0, c21.w
texld r1.xyz, r1, s5
mul r6.xyz, r1, c9.x
pow r1, r6.x, c18.x
mov r6.x, r1
pow r1, r6.y, c18.x
dp3 r0.x, v5, v5
texld r0.x, r0.x, s2
mul r3.w, r0.x, r0.y
pow r0, r6.z, c18.x
mov r6.z, r0
mov r6.y, r1
mad r1.xyz, r2, -r6, r6
mul r0.xyz, r3.w, c4
mul r0.xyz, r0, c20.x
dp3 r0.w, r3, r4
mov r1.w, c8.x
mul r2.xyz, r0, r2.w
add r1.xyz, r7, r1
max r0.w, r0, c20.z
mul r1.xyz, r2, r1
add r1.w, c22.x, -r1
mul r0.xyz, r0.w, r0
mad r2.xyz, r1.w, r5, c11
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c20.z
"
}
SubProgram "d3d11 " {
// Stats: 93 math, 10 textures
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
SetTexture 0 [_Normalmap] 2D 4
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_ShadowMapTexture] CUBE 0
SetTexture 3 [_Mask] 2D 2
SetTexture 4 [_Glittermap] 2D 5
SetTexture 5 [_Specularglitter] 2D 3
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_Specularglitter_ST]
Float 144 [_MasktransparencyDebug]
Float 148 [_Specularpower05]
Float 152 [_Glitterpower]
Vector 160 [_Color]
Vector 176 [_Normalmap_ST]
Vector 208 [_Glittercolor]
Float 224 [_Glitterymaskdotsscale]
Float 228 [_Glitteryspeed01]
Vector 240 [_Glittermap_ST]
Float 256 [_Glittercontrast13]
Float 260 [_Specularcontrast13]
Float 264 [_Maskadjust0515]
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
eefiecedbggilillgkdpmcffpllppoecdlnmiihkabaaaaaaambaaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefclmaoaaaaeaaaaaaakpadaaaafjaaaaaeegiocaaa
aaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaacaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fidaaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
fibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaad
hcbabaaaagaaaaaagcbaaaadhcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaaoaaaaaa
aceaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaa
baaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaaj
pcaabaaaacaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaa
dcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaa
acaaaaaaaaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalp
aaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaa
agiacaaaaaaaaaaaaoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaa
egiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaaaaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaadiaaaaaj
lcaabaaaaaaaaaaakgikcaaaaaaaaaaaajaaaaaaegiicaaaaaaaaaaaanaaaaaa
diaaaaahlcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaf
lcaabaaaaaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaa
aaaaaaaaagiacaaaaaaaaaaabaaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaa
aaaaaaaaapaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplp
allnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaa
aceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaa
egaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaai
dcaabaaaacaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaal
icaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdo
abeaaaaaaaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaa
acaaaaaadiaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaa
baaaaaaadcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaa
apaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaa
acaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaaaaaaaalhcaabaaaacaaaaaa
egacbaiaebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaadaaaaaaaagabaaaacaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
agiacaaaaaaaaaaaajaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaa
egambaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
efaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaafaaaaaaaagabaaa
adaaaaaadiaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaa
ajaaaaaacpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaa
aeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaa
aeaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaiaebaaaaaaaeaaaaaaegacbaaaaeaaaaaaaaaaaaahlcaabaaaaaaaaaaa
egambaaaaaaaaaaaegaibaaaadaaaaaadcaaaaamhcaabaaaadaaaaaapgipcaaa
acaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaa
abaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaa
kgakbaaaaaaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
ecaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaakgakbaaaaaaaaaaa
egbcbaaaadaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaa
aaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaafaaaaaa
egaabaaaafaaaaaaeghobaaaaaaaaaaaaagabaaaaeaaaaaadcaaaaapdcaabaaa
afaaaaaahgapbaaaafaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaagaaaaaa
fgafbaaaafaaaaaaegbcbaaaafaaaaaadcaaaaajhcaabaaaagaaaaaaagaabaaa
afaaaaaaegbcbaaaaeaaaaaaegacbaaaagaaaaaaapaaaaahecaabaaaaaaaaaaa
egaabaaaafaaaaaaegaabaaaafaaaaaaddaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiecaabaaaaaaaaaaackaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
dcaaaaajhcaabaaaaeaaaaaakgakbaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaa
agaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaeaaaaaa
eeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaaeaaaaaa
kgakbaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaaeaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaaeaaaaaa
egacbaaaadaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaadeaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaa
cpaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaabaaaaaa
akiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaaf
ccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaabkaabaaaabaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
baaaaaahccaabaaaabaaaaaaegbcbaaaahaaaaaaegbcbaaaahaaaaaaelaaaaaf
ccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaaiccaabaaaabaaaaaabkaabaaa
abaaaaaadkiacaaaacaaaaaaabaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaa
abaaaaaaabeaaaaaomfbhidpaaaaaaakhcaabaaaadaaaaaaegbcbaaaahaaaaaa
aceaaaaaaaaaaadmaaaaaadmaaaaaadmaaaaaaaaefaaaaajpcaabaaaadaaaaaa
egacbaaaadaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaabbaaaaakbcaabaaa
adaaaaaaegaobaaaadaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdhafidibdd
aaaaaaakhcaabaaaaeaaaaaaegbcbaaaahaaaaaaaceaaaaaaaaaaalmaaaaaalm
aaaaaadmaaaaaaaaefaaaaajpcaabaaaaeaaaaaaegacbaaaaeaaaaaaeghobaaa
acaaaaaaaagabaaaaaaaaaaabbaaaaakccaabaaaadaaaaaaegaobaaaaeaaaaaa
aceaaaaaaaaaiadpibiaiadlicabibdhafidibddaaaaaaakhcaabaaaaeaaaaaa
egbcbaaaahaaaaaaaceaaaaaaaaaaalmaaaaaadmaaaaaalmaaaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegacbaaaaeaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaa
bbaaaaakecaabaaaadaaaaaaegaobaaaaeaaaaaaaceaaaaaaaaaiadpibiaiadl
icabibdhafidibddaaaaaaakhcaabaaaaeaaaaaaegbcbaaaahaaaaaaaceaaaaa
aaaaaadmaaaaaalmaaaaaalmaaaaaaaaefaaaaajpcaabaaaaeaaaaaaegacbaaa
aeaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaabbaaaaakicaabaaaadaaaaaa
egaobaaaaeaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdhafidibdddbaaaaah
pcaabaaaadaaaaaaegaobaaaadaaaaaafgafbaaaabaaaaaadhaaaaanpcaabaaa
adaaaaaaegaobaaaadaaaaaaagiacaaaadaaaaaabiaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpbbaaaaakccaabaaaabaaaaaaegaobaaaadaaaaaa
aceaaaaaaaaaiadoaaaaiadoaaaaiadoaaaaiadobaaaaaahecaabaaaabaaaaaa
egbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaakgakbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaapaaaaahccaabaaaabaaaaaa
agaabaaaadaaaaaafgafbaaaabaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaa
abaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaa
aaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaa
agaabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaa
adaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaajaaaaaa
abeaaaaaaaaaiadpdcaaaaakhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
acaaaaaaegiccaaaaaaaaaaaakaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 115 math, 11 textures
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_Mask_ST]
Float 6 [_Shininess]
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
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
"3.0-!!ARBfp1.0
PARAM c[25] = { program.local[0..19],
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
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R0;
ADD R2.xyz, -fragment.texcoord[1], c[0];
DP3 R0.z, R2, R2;
MAD R0.xy, fragment.texcoord[0], c[12], c[12].zwzw;
TEX R0.yw, R0, texture[0], 2D;
MAD R3.xy, R0.wyzw, c[20].x, -c[20].y;
RSQ R0.z, R0.z;
MUL R2.xyz, R0.z, R2;
ADD R4.xyz, R1, R2;
DP3 R1.w, R4, R4;
RSQ R1.w, R1.w;
MUL R0.xyz, R3.y, fragment.texcoord[4];
MUL R5.xy, R3, R3;
MAD R3.xyz, R3.x, fragment.texcoord[3], R0;
ADD_SAT R0.x, R5, R5.y;
ADD R0.x, -R0, c[20].y;
RSQ R0.w, R0.x;
DP3 R0.y, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.y, R0.y;
MUL R4.xyz, R1.w, R4;
RCP R0.w, R0.w;
MUL R0.xyz, R0.y, fragment.texcoord[2];
MAD R0.xyz, R0.w, R0, R3;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R0;
DP3 R0.w, R3, R4;
DP3 R1.x, R3, R1;
ADD R4.xyz, fragment.texcoord[6], c[21].yxyw;
MAX R1.w, R0, c[20].z;
ADD R0.xyz, fragment.texcoord[6], c[21].xyyw;
TEX R0, R0, texture[1], CUBE;
DP4 R4.w, R0, c[22];
TEX R0, R4, texture[1], CUBE;
ADD R5.xyz, fragment.texcoord[6], c[21].yyxw;
DP4 R4.z, R0, c[22];
TEX R0, R5, texture[1], CUBE;
ADD R5.xyz, fragment.texcoord[6], c[21].x;
DP4 R4.y, R0, c[22];
TEX R0, R5, texture[1], CUBE;
DP4 R4.x, R0, c[22];
DP3 R2.w, fragment.texcoord[6], fragment.texcoord[6];
RSQ R0.y, R2.w;
MOV R0.x, c[24].y;
MUL R0.z, R0.x, c[6].x;
RCP R0.y, R0.y;
MUL R0.x, R0.y, c[2].w;
MAD R4, -R0.x, c[20].w, R4;
ADD R0.x, R0.z, c[20].y;
MOV R0.w, c[20].y;
CMP R4, R4, c[3].x, R0.w;
EX2 R0.x, R0.x;
POW R3.w, R1.w, R0.x;
DP3 R0.x, fragment.texcoord[5], fragment.texcoord[5];
DP4 R0.y, R4, c[21].z;
TEX R1.w, fragment.texcoord[5], texture[3], CUBE;
TEX R2.w, R0.x, texture[2], 2D;
MUL R0.x, R2.w, R1.w;
MUL R0.z, R0.x, R0.y;
DP3 R0.x, fragment.texcoord[3], R2;
DP3 R0.y, fragment.texcoord[4], R2;
MUL R6.xy, R0, -c[15].x;
MAD R4.xy, R6, c[21].w, fragment.texcoord[0];
MUL R0.xyz, R0.z, c[4];
MUL R2.xyz, R0, c[20].x;
ADD R4.xy, R4, -c[23].x;
MUL R0.xy, R4.y, c[23].wyzw;
MOV R1.w, c[15].x;
MUL R0.z, R1.w, -c[24].x;
MAD R0.xy, R4.x, c[23].yzzw, R0;
ADD R0.xy, R0, c[23].x;
MUL R1.w, R1, c[23].x;
MAX R1.x, R1, c[20].z;
MUL R5.xyz, R2, R3.w;
ADD R0.z, R0, c[20].y;
MUL R0.xy, R0, c[14].x;
MUL R4.xy, R0, R0.z;
MUL R6.zw, R4.xyxy, c[19].x;
MAD R0.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R0.xyz, R0, texture[6], 2D;
MUL R0.xyz, R0, c[9].x;
MAD R4.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R4.xyz, R4, texture[4], 2D;
POW R0.x, R0.x, c[18].x;
POW R0.z, R0.z, c[18].x;
POW R0.y, R0.y, c[18].x;
MAD R7.xyz, R4, -R0, R0;
MAD R0.xy, R6.zwzw, c[16], c[16].zwzw;
TEX R0.xyz, R0, texture[5], 2D;
ADD R0.xyz, -R0, c[20].y;
MAX R4.xyz, R0, R4;
MUL R4.xyz, R4, c[8].x;
MUL R1.xyz, R1.x, R2;
ADD R0.w, R0, -c[8].x;
ADD R1.w, R1, c[20].y;
MAD R6.xy, -R6, c[21].w, fragment.texcoord[0];
MUL R6.xy, R6, R1.w;
MUL R6.xy, R6, c[14].x;
MAD R0.xy, R6, c[16], c[16].zwzw;
MOV R6.xyz, c[13];
TEX R0.xyz, R0, texture[5], 2D;
MUL R6.xyz, R6, c[10].x;
MUL R0.xyz, R6, R0;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R0.xyz, R4, -R0, R0;
ADD R0.xyz, R0, R7;
MUL R0.xyz, R5, R0;
MAD R2.xyz, R0.w, R4, c[11];
MAD result.color.xyz, R1, R2, R0;
MOV result.color.w, c[20].z;
END
# 115 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 123 math, 11 textures
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
Vector 0 [_WorldSpaceCameraPos]
Vector 1 [_WorldSpaceLightPos0]
Vector 2 [_LightPositionRange]
Vector 3 [_LightShadowData]
Vector 4 [_LightColor0]
Vector 5 [_Mask_ST]
Float 6 [_Shininess]
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
SetTexture 1 [_ShadowMapTexture] CUBE 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
SetTexture 4 [_Mask] 2D 4
SetTexture 5 [_Glittermap] 2D 5
SetTexture 6 [_Specularglitter] 2D 6
"ps_3_0
dcl_2d s0
dcl_cube s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c20, 2.00000000, -1.00000000, 0.00000000, 0.00781250
def c21, 0.00781250, -0.00781250, 0.97000003, 0.25000000
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
mad r0.xyz, -v1, c1.w, c1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r4.xyz, r0.w, r0
add r2.xyz, -v1, c0
dp3 r0.z, r2, r2
mad r0.xy, v0, c12, c12.zwzw
texld r1.yw, r0, s0
rsq r0.z, r0.z
mul r0.xyz, r0.z, r2
mad_pp r2.xy, r1.wyzw, c20.x, c20.y
add r3.xyz, r4, r0
mul_pp r5.xy, r2, r2
mul r1.xyz, r2.y, v4
mad r2.xyz, r2.x, v3, r1
add_pp_sat r0.w, r5.x, r5.y
dp3 r1.w, r3, r3
dp3 r1.x, v2, v2
add_pp r0.w, -r0, c22.x
rsq r1.x, r1.x
rsq_pp r0.w, r0.w
rcp_pp r0.w, r0.w
mul r1.xyz, r1.x, v2
mad r1.xyz, r0.w, r1, r2
dp3 r0.w, r1, r1
rsq r1.w, r1.w
mul r2.xyz, r1.w, r3
rsq r0.w, r0.w
mul r3.xyz, r0.w, r1
dp3 r0.w, r3, r2
max r2.z, r0.w, c20
dp3 r1.x, v3, r0
dp3 r1.y, v4, r0
mul r1.xy, r1, -c15.x
mad r0.xy, r1, c23.x, v0
add r2.xy, r0, c23.y
mov r0.z, c6.x
mad r0.z, r0, c25, c25.y
exp r2.w, r0.z
pow r0, r2.z, r2.w
mul r1.zw, r2.y, c23
mad r0.zw, r2.x, c24.xyxy, r1
add r0.zw, r0, c24.z
mov r1.w, r0.x
mul r0.xy, r0.zwzw, c14.x
mov r0.w, c15.x
mov r0.z, c15.x
mad r0.z, r0, c25.x, c25.y
mul r0.xy, r0, r0.z
mul r2.xy, r0, c19.x
mad r0.w, r0, c24.z, c24
mad r1.xy, -r1, c23.x, v0
mul r1.xy, r1, r0.w
mul r0.zw, r1.xyxy, c14.x
mad r0.xy, r0.zwzw, c16, c16.zwzw
mov r0.w, c10.x
texld r0.xyz, r0, s5
mul r1.xyz, c13, r0.w
mul r6.xyz, r1, r0
mad r0.xy, r2, c16, c16.zwzw
mad r1.xy, v0, c5, c5.zwzw
texld r0.xyz, r0, s5
texld r1.xyz, r1, s4
add r0.xyz, -r0, c22.x
max r2.xyz, r0, r1
pow r0, r6.x, c17.x
mul r5.xyz, r2, c8.x
pow r2, r6.y, c17.x
mov r2.x, r0
pow r0, r6.z, c17.x
mov r2.z, r0
add r6.xyz, v6, c21.xyyw
texld r0, r6, s1
dp4 r7.w, r0, c22
mad r6.xyz, r5, -r2, r2
add r0.xyz, v6, c21.yxyw
texld r0, r0, s1
dp4 r7.z, r0, c22
add r2.xyz, v6, c21.yyxw
texld r2, r2, s1
dp4 r7.y, r2, c22
add r0.xyz, v6, c20.w
texld r0, r0, s1
dp3 r2.x, v6, v6
dp4 r7.x, r0, c22
rsq r2.x, r2.x
rcp r0.x, r2.x
mad r2.xy, v0, c7, c7.zwzw
mul r0.x, r0, c2.w
mad r0, -r0.x, c21.z, r7
texld r2.xyz, r2, s6
mov r2.w, c3.x
cmp r0, r0, c22.x, r2.w
dp4_pp r0.y, r0, c21.w
mul r7.xyz, r2, c9.x
pow r2, r7.x, c18.x
mov r7.x, r2
pow r2, r7.y, c18.x
dp3 r0.x, v5, v5
texld r0.w, v5, s3
texld r0.x, r0.x, s2
mul r0.x, r0, r0.w
mul r3.w, r0.x, r0.y
pow r0, r7.z, c18.x
mov r7.z, r0
mov r7.y, r2
mad r1.xyz, r1, -r7, r7
mul r0.xyz, r3.w, c4
mul r0.xyz, r0, c20.x
mul r2.xyz, r0, r1.w
add r1.xyz, r6, r1
dp3 r0.w, r3, r4
mov r1.w, c8.x
max r0.w, r0, c20.z
mul r1.xyz, r2, r1
add r1.w, c22.x, -r1
mul r0.xyz, r0.w, r0
mad r2.xyz, r1.w, r5, c11
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c20.z
"
}
SubProgram "d3d11 " {
// Stats: 94 math, 11 textures
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
SetTexture 0 [_Normalmap] 2D 5
SetTexture 1 [_LightTextureB0] 2D 2
SetTexture 2 [_LightTexture0] CUBE 1
SetTexture 3 [_ShadowMapTexture] CUBE 0
SetTexture 4 [_Mask] 2D 3
SetTexture 5 [_Glittermap] 2D 6
SetTexture 6 [_Specularglitter] 2D 4
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_Specularglitter_ST]
Float 144 [_MasktransparencyDebug]
Float 148 [_Specularpower05]
Float 152 [_Glitterpower]
Vector 160 [_Color]
Vector 176 [_Normalmap_ST]
Vector 208 [_Glittercolor]
Float 224 [_Glitterymaskdotsscale]
Float 228 [_Glitteryspeed01]
Vector 240 [_Glittermap_ST]
Float 256 [_Glittercontrast13]
Float 260 [_Specularcontrast13]
Float 264 [_Maskadjust0515]
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
eefiecedckdndldcjggcbcpkdolbpgjfghhahcffabaaaaaagibaaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcbiapaaaaeaaaaaaamgadaaaafjaaaaaeegiocaaa
aaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaacaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaafidaaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaa
agaaaaaagcbaaaadhcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
ahaaaaaadiaaaaaldcaabaaaaaaaaaaafgifcaaaaaaaaaaaaoaaaaaaaceaaaaa
mnmmemdnmnmmemlnaaaaaaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaia
ebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahecaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaah
ccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaa
acaaaaaaagafbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadcaaaaak
bcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaa
aaaaaaakdcaabaaaacaaaaaaogakbaaaacaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaaoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaaaaaaaaaeghobaaaafaaaaaaaagabaaaagaaaaaadiaaaaajlcaabaaa
aaaaaaaakgikcaaaaaaaaaaaajaaaaaaegiicaaaaaaaaaaaanaaaaaadiaaaaah
lcaabaaaaaaaaaaaegaibaaaadaaaaaaegambaaaaaaaaaaacpaaaaaflcaabaaa
aaaaaaaaegambaaaaaaaaaaadiaaaaailcaabaaaaaaaaaaaegambaaaaaaaaaaa
agiacaaaaaaaaaaabaaaaaaabjaaaaaflcaabaaaaaaaaaaaegambaaaaaaaaaaa
apaaaaakbcaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaadaaaaaaegaabaaaacaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaa
adaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
acaaaaaaegaabaaaacaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaaegaabaaaacaaaaaa
diaaaaaidcaabaaaacaaaaaaegaabaaaacaaaaaakgikcaaaaaaaaaaabaaaaaaa
dcaaaaaldcaabaaaacaaaaaaegaabaaaacaaaaaaegiacaaaaaaaaaaaapaaaaaa
ogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaafaaaaaaaagabaaaagaaaaaaaaaaaaalhcaabaaaacaaaaaaegacbaia
ebaaaaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaadaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
aeaaaaaaaagabaaaadaaaaaadeaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaajaaaaaadcaaaaaklcaabaaaaaaaaaaaegaibaaaacaaaaaaegambaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaagaaaaaaaagabaaaaeaaaaaa
diaaaaaihcaabaaaaeaaaaaaegacbaaaaeaaaaaafgifcaaaaaaaaaaaajaaaaaa
cpaaaaafhcaabaaaaeaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaaeaaaaaa
egacbaaaaeaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaaeaaaaaa
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
alaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaa
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
adaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaabbaaaaakbcaabaaaadaaaaaa
egaobaaaadaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdhafidibddaaaaaaak
hcaabaaaaeaaaaaaegbcbaaaahaaaaaaaceaaaaaaaaaaalmaaaaaalmaaaaaadm
aaaaaaaaefaaaaajpcaabaaaaeaaaaaaegacbaaaaeaaaaaaeghobaaaadaaaaaa
aagabaaaaaaaaaaabbaaaaakccaabaaaadaaaaaaegaobaaaaeaaaaaaaceaaaaa
aaaaiadpibiaiadlicabibdhafidibddaaaaaaakhcaabaaaaeaaaaaaegbcbaaa
ahaaaaaaaceaaaaaaaaaaalmaaaaaadmaaaaaalmaaaaaaaaefaaaaajpcaabaaa
aeaaaaaaegacbaaaaeaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaabbaaaaak
ecaabaaaadaaaaaaegaobaaaaeaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdh
afidibddaaaaaaakhcaabaaaaeaaaaaaegbcbaaaahaaaaaaaceaaaaaaaaaaadm
aaaaaalmaaaaaalmaaaaaaaaefaaaaajpcaabaaaaeaaaaaaegacbaaaaeaaaaaa
eghobaaaadaaaaaaaagabaaaaaaaaaaabbaaaaakicaabaaaadaaaaaaegaobaaa
aeaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdhafidibdddbaaaaahpcaabaaa
adaaaaaaegaobaaaadaaaaaafgafbaaaabaaaaaadhaaaaanpcaabaaaadaaaaaa
egaobaaaadaaaaaaagiacaaaadaaaaaabiaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpbbaaaaakccaabaaaabaaaaaaegaobaaaadaaaaaaaceaaaaa
aaaaiadoaaaaiadoaaaaiadoaaaaiadobaaaaaahecaabaaaabaaaaaaegbcbaaa
agaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaakgakbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegbcbaaa
agaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaadiaaaaahecaabaaaabaaaaaa
akaabaaaadaaaaaadkaabaaaaeaaaaaaapaaaaahccaabaaaabaaaaaakgakbaaa
abaaaaaafgafbaaaabaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaa
agijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaadaaaaaakgakbaaaaaaaaaaa
jgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaaagaabaaa
abaaaaaadiaaaaahhcaabaaaaaaaaaaaegadbaaaaaaaaaaaegacbaaaadaaaaaa
aaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaajaaaaaaabeaaaaa
aaaaiadpdcaaaaakhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaa
egiccaaaaaaaaaaaakaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
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