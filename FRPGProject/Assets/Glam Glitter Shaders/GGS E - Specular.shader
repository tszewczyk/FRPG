// Compiled shader for all platforms, uncompressed size: 934.0KB

Shader "Spaventacorvi/Glam Glitter E - Specular" {
Properties {
 _Color ("Main color", Color) = (0.705882,0.705882,0.705882,1)
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _Shininess ("Shininess", Range(0,1)) = 0.3
 _Fakelight ("Fake light", Range(0,0.1)) = 0
 _Reflectioncubemap ("Reflection cubemap", CUBE) = "_Skybox" {}
 _Reflectioncubemappower ("Reflection cubemap power", Range(0,1)) = 0
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
 //       d3d11 : 75 avg math (73..77), 6 avg texture (6..7)
 //        d3d9 : 100 avg math (97..104), 6 avg texture (6..7)
 //      opengl : 88 avg math (86..90), 6 avg texture (6..7)
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  lowp vec3 tmpvar_9;
  tmpvar_9 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_9;
  highp mat2 tmpvar_10;
  tmpvar_10[0].x = -0.999999;
  tmpvar_10[0].y = 0.00159255;
  tmpvar_10[1].x = -0.00159255;
  tmpvar_10[1].y = -0.999999;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_11 = texture2D (_Mask, P_12);
  node_1540_2 = tmpvar_11;
  highp vec2 P_13;
  P_13 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_10) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_14;
  arg0_14 = (1.0 - texture2D (_Glittermap, P_13).xyz);
  highp vec3 tmpvar_15;
  tmpvar_15 = (max (arg0_14, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_16;
  tmpvar_16 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_15) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_17);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture2D (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_4, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_23.xyz * _Color.xyz) + tmpvar_17) + ((1.0 - _MasktransparencyDebug) * tmpvar_15))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_6 + lightDirection_3)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  lowp vec3 tmpvar_9;
  tmpvar_9 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_9;
  highp mat2 tmpvar_10;
  tmpvar_10[0].x = -0.999999;
  tmpvar_10[0].y = 0.00159255;
  tmpvar_10[1].x = -0.00159255;
  tmpvar_10[1].y = -0.999999;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_11 = texture2D (_Mask, P_12);
  node_1540_2 = tmpvar_11;
  highp vec2 P_13;
  P_13 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_10) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_14;
  arg0_14 = (1.0 - texture2D (_Glittermap, P_13).xyz);
  highp vec3 tmpvar_15;
  tmpvar_15 = (max (arg0_14, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_16;
  tmpvar_16 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_15) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_17);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture2D (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_4, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_23.xyz * _Color.xyz) + tmpvar_17) + ((1.0 - _MasktransparencyDebug) * tmpvar_15))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_6 + lightDirection_3)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  lowp vec3 tmpvar_9;
  tmpvar_9 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_9;
  highp mat2 tmpvar_10;
  tmpvar_10[0].x = -0.999999;
  tmpvar_10[0].y = 0.00159255;
  tmpvar_10[1].x = -0.00159255;
  tmpvar_10[1].y = -0.999999;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_11 = texture (_Mask, P_12);
  node_1540_2 = tmpvar_11;
  highp vec2 P_13;
  P_13 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_10) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_14;
  arg0_14 = (1.0 - texture (_Glittermap, P_13).xyz);
  highp vec3 tmpvar_15;
  tmpvar_15 = (max (arg0_14, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_15) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_17);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_4, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_23.xyz * _Color.xyz) + tmpvar_17) + ((1.0 - _MasktransparencyDebug) * tmpvar_15))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_6 + lightDirection_3)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  lowp vec3 tmpvar_9;
  tmpvar_9 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_9;
  highp mat2 tmpvar_10;
  tmpvar_10[0].x = -0.999999;
  tmpvar_10[0].y = 0.00159255;
  tmpvar_10[1].x = -0.00159255;
  tmpvar_10[1].y = -0.999999;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_11 = texture2D (_Mask, P_12);
  node_1540_2 = tmpvar_11;
  highp vec2 P_13;
  P_13 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_10) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_14;
  arg0_14 = (1.0 - texture2D (_Glittermap, P_13).xyz);
  highp vec3 tmpvar_15;
  tmpvar_15 = (max (arg0_14, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_16;
  tmpvar_16 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_15) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_17);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture2D (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_4, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_23.xyz * _Color.xyz) + tmpvar_17) + ((1.0 - _MasktransparencyDebug) * tmpvar_15))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_6 + lightDirection_3)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  lowp vec3 tmpvar_9;
  tmpvar_9 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_9;
  highp mat2 tmpvar_10;
  tmpvar_10[0].x = -0.999999;
  tmpvar_10[0].y = 0.00159255;
  tmpvar_10[1].x = -0.00159255;
  tmpvar_10[1].y = -0.999999;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_11 = texture2D (_Mask, P_12);
  node_1540_2 = tmpvar_11;
  highp vec2 P_13;
  P_13 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_10) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_14;
  arg0_14 = (1.0 - texture2D (_Glittermap, P_13).xyz);
  highp vec3 tmpvar_15;
  tmpvar_15 = (max (arg0_14, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_16;
  tmpvar_16 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_15) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_17);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture2D (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_4, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_23.xyz * _Color.xyz) + tmpvar_17) + ((1.0 - _MasktransparencyDebug) * tmpvar_15))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_6 + lightDirection_3)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  lowp vec3 tmpvar_9;
  tmpvar_9 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_9;
  highp mat2 tmpvar_10;
  tmpvar_10[0].x = -0.999999;
  tmpvar_10[0].y = 0.00159255;
  tmpvar_10[1].x = -0.00159255;
  tmpvar_10[1].y = -0.999999;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_11 = texture (_Mask, P_12);
  node_1540_2 = tmpvar_11;
  highp vec2 P_13;
  P_13 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_10) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_14;
  arg0_14 = (1.0 - texture (_Glittermap, P_13).xyz);
  highp vec3 tmpvar_15;
  tmpvar_15 = (max (arg0_14, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_15) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_17);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_4, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_23.xyz * _Color.xyz) + tmpvar_17) + ((1.0 - _MasktransparencyDebug) * tmpvar_15))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_6 + lightDirection_3)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  lowp vec3 tmpvar_9;
  tmpvar_9 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_9;
  highp mat2 tmpvar_10;
  tmpvar_10[0].x = -0.999999;
  tmpvar_10[0].y = 0.00159255;
  tmpvar_10[1].x = -0.00159255;
  tmpvar_10[1].y = -0.999999;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_11 = texture2D (_Mask, P_12);
  node_1540_2 = tmpvar_11;
  highp vec2 P_13;
  P_13 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_10) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_14;
  arg0_14 = (1.0 - texture2D (_Glittermap, P_13).xyz);
  highp vec3 tmpvar_15;
  tmpvar_15 = (max (arg0_14, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_16;
  tmpvar_16 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_15) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_17);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture2D (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_4, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_23.xyz * _Color.xyz) + tmpvar_17) + ((1.0 - _MasktransparencyDebug) * tmpvar_15))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_6 + lightDirection_3)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  lowp vec3 tmpvar_9;
  tmpvar_9 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_9;
  highp mat2 tmpvar_10;
  tmpvar_10[0].x = -0.999999;
  tmpvar_10[0].y = 0.00159255;
  tmpvar_10[1].x = -0.00159255;
  tmpvar_10[1].y = -0.999999;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_11 = texture2D (_Mask, P_12);
  node_1540_2 = tmpvar_11;
  highp vec2 P_13;
  P_13 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_10) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_14;
  arg0_14 = (1.0 - texture2D (_Glittermap, P_13).xyz);
  highp vec3 tmpvar_15;
  tmpvar_15 = (max (arg0_14, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_16;
  tmpvar_16 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_15) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_17);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture2D (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_4, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_23.xyz * _Color.xyz) + tmpvar_17) + ((1.0 - _MasktransparencyDebug) * tmpvar_15))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_6 + lightDirection_3)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  lowp vec3 tmpvar_9;
  tmpvar_9 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_9;
  highp mat2 tmpvar_10;
  tmpvar_10[0].x = -0.999999;
  tmpvar_10[0].y = 0.00159255;
  tmpvar_10[1].x = -0.00159255;
  tmpvar_10[1].y = -0.999999;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_11 = texture (_Mask, P_12);
  node_1540_2 = tmpvar_11;
  highp vec2 P_13;
  P_13 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_10) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_14;
  arg0_14 = (1.0 - texture (_Glittermap, P_13).xyz);
  highp vec3 tmpvar_15;
  tmpvar_15 = (max (arg0_14, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_15) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_17);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_4, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_23.xyz * _Color.xyz) + tmpvar_17) + ((1.0 - _MasktransparencyDebug) * tmpvar_15))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_6 + lightDirection_3)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float tmpvar_11;
  mediump float lightShadowDataX_12;
  highp float dist_13;
  lowp float tmpvar_14;
  tmpvar_14 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = _LightShadowData.x;
  lightShadowDataX_12 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (float((dist_13 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_12);
  tmpvar_11 = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_11 * 2.0);
  attenuation_3 = tmpvar_17;
  highp mat2 tmpvar_18;
  tmpvar_18[0].x = -0.999999;
  tmpvar_18[0].y = 0.00159255;
  tmpvar_18[1].x = -0.00159255;
  tmpvar_18[1].y = -0.999999;
  lowp vec4 tmpvar_19;
  highp vec2 P_20;
  P_20 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_19 = texture2D (_Mask, P_20);
  node_1540_2 = tmpvar_19;
  highp vec2 P_21;
  P_21 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_18) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_22;
  arg0_22 = (1.0 - texture2D (_Glittermap, P_21).xyz);
  highp vec3 tmpvar_23;
  tmpvar_23 = (max (arg0_22, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureCube (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture2D (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture2D (_Specularglitter, P_29);
  highp vec3 tmpvar_30;
  tmpvar_30 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_23) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_25);
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture2D (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_31.xyz * _Color.xyz) + tmpvar_25) + ((1.0 - _MasktransparencyDebug) * tmpvar_23))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x * 2.0);
  attenuation_3 = tmpvar_11;
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
  tmpvar_18 = textureCube (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_20 = texture2D (_Glittermap, P_21);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_22 = texture2D (_Specularglitter, P_23);
  highp vec3 tmpvar_24;
  tmpvar_24 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_19);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_25 = texture2D (_MainTex, P_26);
  highp vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_25.xyz * _Color.xyz) + tmpvar_19) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_24)) + (tmpvar_24 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float tmpvar_11;
  mediump float lightShadowDataX_12;
  highp float dist_13;
  lowp float tmpvar_14;
  tmpvar_14 = textureProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = _LightShadowData.x;
  lightShadowDataX_12 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (float((dist_13 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_12);
  tmpvar_11 = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_11 * 2.0);
  attenuation_3 = tmpvar_17;
  highp mat2 tmpvar_18;
  tmpvar_18[0].x = -0.999999;
  tmpvar_18[0].y = 0.00159255;
  tmpvar_18[1].x = -0.00159255;
  tmpvar_18[1].y = -0.999999;
  lowp vec4 tmpvar_19;
  highp vec2 P_20;
  P_20 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_19 = texture (_Mask, P_20);
  node_1540_2 = tmpvar_19;
  highp vec2 P_21;
  P_21 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_18) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_22;
  arg0_22 = (1.0 - texture (_Glittermap, P_21).xyz);
  highp vec3 tmpvar_23;
  tmpvar_23 = (max (arg0_22, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture (_Specularglitter, P_29);
  highp vec3 tmpvar_30;
  tmpvar_30 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_23) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_25);
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_31.xyz * _Color.xyz) + tmpvar_25) + ((1.0 - _MasktransparencyDebug) * tmpvar_23))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float tmpvar_11;
  mediump float lightShadowDataX_12;
  highp float dist_13;
  lowp float tmpvar_14;
  tmpvar_14 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = _LightShadowData.x;
  lightShadowDataX_12 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (float((dist_13 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_12);
  tmpvar_11 = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_11 * 2.0);
  attenuation_3 = tmpvar_17;
  highp mat2 tmpvar_18;
  tmpvar_18[0].x = -0.999999;
  tmpvar_18[0].y = 0.00159255;
  tmpvar_18[1].x = -0.00159255;
  tmpvar_18[1].y = -0.999999;
  lowp vec4 tmpvar_19;
  highp vec2 P_20;
  P_20 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_19 = texture2D (_Mask, P_20);
  node_1540_2 = tmpvar_19;
  highp vec2 P_21;
  P_21 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_18) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_22;
  arg0_22 = (1.0 - texture2D (_Glittermap, P_21).xyz);
  highp vec3 tmpvar_23;
  tmpvar_23 = (max (arg0_22, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureCube (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture2D (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture2D (_Specularglitter, P_29);
  highp vec3 tmpvar_30;
  tmpvar_30 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_23) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_25);
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture2D (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_31.xyz * _Color.xyz) + tmpvar_25) + ((1.0 - _MasktransparencyDebug) * tmpvar_23))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x * 2.0);
  attenuation_3 = tmpvar_11;
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
  tmpvar_18 = textureCube (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_20 = texture2D (_Glittermap, P_21);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_22 = texture2D (_Specularglitter, P_23);
  highp vec3 tmpvar_24;
  tmpvar_24 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_19);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_25 = texture2D (_MainTex, P_26);
  highp vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_25.xyz * _Color.xyz) + tmpvar_19) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_24)) + (tmpvar_24 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float tmpvar_11;
  mediump float lightShadowDataX_12;
  highp float dist_13;
  lowp float tmpvar_14;
  tmpvar_14 = textureProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = _LightShadowData.x;
  lightShadowDataX_12 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (float((dist_13 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_12);
  tmpvar_11 = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_11 * 2.0);
  attenuation_3 = tmpvar_17;
  highp mat2 tmpvar_18;
  tmpvar_18[0].x = -0.999999;
  tmpvar_18[0].y = 0.00159255;
  tmpvar_18[1].x = -0.00159255;
  tmpvar_18[1].y = -0.999999;
  lowp vec4 tmpvar_19;
  highp vec2 P_20;
  P_20 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_19 = texture (_Mask, P_20);
  node_1540_2 = tmpvar_19;
  highp vec2 P_21;
  P_21 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_18) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_22;
  arg0_22 = (1.0 - texture (_Glittermap, P_21).xyz);
  highp vec3 tmpvar_23;
  tmpvar_23 = (max (arg0_22, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture (_Specularglitter, P_29);
  highp vec3 tmpvar_30;
  tmpvar_30 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_23) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_25);
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_31.xyz * _Color.xyz) + tmpvar_25) + ((1.0 - _MasktransparencyDebug) * tmpvar_23))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float tmpvar_11;
  mediump float lightShadowDataX_12;
  highp float dist_13;
  lowp float tmpvar_14;
  tmpvar_14 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = _LightShadowData.x;
  lightShadowDataX_12 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (float((dist_13 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_12);
  tmpvar_11 = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_11 * 2.0);
  attenuation_3 = tmpvar_17;
  highp mat2 tmpvar_18;
  tmpvar_18[0].x = -0.999999;
  tmpvar_18[0].y = 0.00159255;
  tmpvar_18[1].x = -0.00159255;
  tmpvar_18[1].y = -0.999999;
  lowp vec4 tmpvar_19;
  highp vec2 P_20;
  P_20 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_19 = texture2D (_Mask, P_20);
  node_1540_2 = tmpvar_19;
  highp vec2 P_21;
  P_21 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_18) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_22;
  arg0_22 = (1.0 - texture2D (_Glittermap, P_21).xyz);
  highp vec3 tmpvar_23;
  tmpvar_23 = (max (arg0_22, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureCube (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture2D (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture2D (_Specularglitter, P_29);
  highp vec3 tmpvar_30;
  tmpvar_30 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_23) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_25);
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture2D (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_31.xyz * _Color.xyz) + tmpvar_25) + ((1.0 - _MasktransparencyDebug) * tmpvar_23))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x * 2.0);
  attenuation_3 = tmpvar_11;
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
  tmpvar_18 = textureCube (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_20 = texture2D (_Glittermap, P_21);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_22 = texture2D (_Specularglitter, P_23);
  highp vec3 tmpvar_24;
  tmpvar_24 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_19);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_25 = texture2D (_MainTex, P_26);
  highp vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_25.xyz * _Color.xyz) + tmpvar_19) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_24)) + (tmpvar_24 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float tmpvar_11;
  mediump float lightShadowDataX_12;
  highp float dist_13;
  lowp float tmpvar_14;
  tmpvar_14 = textureProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = _LightShadowData.x;
  lightShadowDataX_12 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (float((dist_13 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_12);
  tmpvar_11 = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_11 * 2.0);
  attenuation_3 = tmpvar_17;
  highp mat2 tmpvar_18;
  tmpvar_18[0].x = -0.999999;
  tmpvar_18[0].y = 0.00159255;
  tmpvar_18[1].x = -0.00159255;
  tmpvar_18[1].y = -0.999999;
  lowp vec4 tmpvar_19;
  highp vec2 P_20;
  P_20 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_19 = texture (_Mask, P_20);
  node_1540_2 = tmpvar_19;
  highp vec2 P_21;
  P_21 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_18) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_22;
  arg0_22 = (1.0 - texture (_Glittermap, P_21).xyz);
  highp vec3 tmpvar_23;
  tmpvar_23 = (max (arg0_22, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture (_Specularglitter, P_29);
  highp vec3 tmpvar_30;
  tmpvar_30 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_23) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_25);
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_31.xyz * _Color.xyz) + tmpvar_25) + ((1.0 - _MasktransparencyDebug) * tmpvar_23))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  lowp vec3 tmpvar_9;
  tmpvar_9 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_9;
  highp mat2 tmpvar_10;
  tmpvar_10[0].x = -0.999999;
  tmpvar_10[0].y = 0.00159255;
  tmpvar_10[1].x = -0.00159255;
  tmpvar_10[1].y = -0.999999;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_11 = texture2D (_Mask, P_12);
  node_1540_2 = tmpvar_11;
  highp vec2 P_13;
  P_13 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_10) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_14;
  arg0_14 = (1.0 - texture2D (_Glittermap, P_13).xyz);
  highp vec3 tmpvar_15;
  tmpvar_15 = (max (arg0_14, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_16;
  tmpvar_16 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_15) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_17);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture2D (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_4, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_23.xyz * _Color.xyz) + tmpvar_17) + ((1.0 - _MasktransparencyDebug) * tmpvar_15))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_6 + lightDirection_3)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  lowp vec3 tmpvar_9;
  tmpvar_9 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_9;
  highp mat2 tmpvar_10;
  tmpvar_10[0].x = -0.999999;
  tmpvar_10[0].y = 0.00159255;
  tmpvar_10[1].x = -0.00159255;
  tmpvar_10[1].y = -0.999999;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_11 = texture2D (_Mask, P_12);
  node_1540_2 = tmpvar_11;
  highp vec2 P_13;
  P_13 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_10) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_14;
  arg0_14 = (1.0 - texture2D (_Glittermap, P_13).xyz);
  highp vec3 tmpvar_15;
  tmpvar_15 = (max (arg0_14, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_16;
  tmpvar_16 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture2D (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture2D (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_15) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_17);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture2D (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_4, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_23.xyz * _Color.xyz) + tmpvar_17) + ((1.0 - _MasktransparencyDebug) * tmpvar_15))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_6 + lightDirection_3)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  lowp vec3 tmpvar_9;
  tmpvar_9 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_3 = tmpvar_9;
  highp mat2 tmpvar_10;
  tmpvar_10[0].x = -0.999999;
  tmpvar_10[0].y = 0.00159255;
  tmpvar_10[1].x = -0.00159255;
  tmpvar_10[1].y = -0.999999;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_11 = texture (_Mask, P_12);
  node_1540_2 = tmpvar_11;
  highp vec2 P_13;
  P_13 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_10) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_14;
  arg0_14 = (1.0 - texture (_Glittermap, P_13).xyz);
  highp vec3 tmpvar_15;
  tmpvar_15 = (max (arg0_14, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_18 = texture (_Glittermap, P_19);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_20 = texture (_Specularglitter, P_21);
  highp vec3 tmpvar_22;
  tmpvar_22 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_15) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_17);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_23 = texture (_MainTex, P_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = (((((max (0.0, dot (tmpvar_4, lightDirection_3)) * (2.0 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_23.xyz * _Color.xyz) + tmpvar_17) + ((1.0 - _MasktransparencyDebug) * tmpvar_15))) + (((2.0 * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_6 + lightDirection_3)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_22)) + (tmpvar_22 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float tmpvar_11;
  mediump float lightShadowDataX_12;
  highp float dist_13;
  lowp float tmpvar_14;
  tmpvar_14 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = _LightShadowData.x;
  lightShadowDataX_12 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (float((dist_13 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_12);
  tmpvar_11 = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_11 * 2.0);
  attenuation_3 = tmpvar_17;
  highp mat2 tmpvar_18;
  tmpvar_18[0].x = -0.999999;
  tmpvar_18[0].y = 0.00159255;
  tmpvar_18[1].x = -0.00159255;
  tmpvar_18[1].y = -0.999999;
  lowp vec4 tmpvar_19;
  highp vec2 P_20;
  P_20 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_19 = texture2D (_Mask, P_20);
  node_1540_2 = tmpvar_19;
  highp vec2 P_21;
  P_21 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_18) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_22;
  arg0_22 = (1.0 - texture2D (_Glittermap, P_21).xyz);
  highp vec3 tmpvar_23;
  tmpvar_23 = (max (arg0_22, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureCube (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture2D (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture2D (_Specularglitter, P_29);
  highp vec3 tmpvar_30;
  tmpvar_30 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_23) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_25);
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture2D (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_31.xyz * _Color.xyz) + tmpvar_25) + ((1.0 - _MasktransparencyDebug) * tmpvar_23))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float tmpvar_11;
  tmpvar_11 = (texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x * 2.0);
  attenuation_3 = tmpvar_11;
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
  tmpvar_18 = textureCube (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_20 = texture2D (_Glittermap, P_21);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_22 = texture2D (_Specularglitter, P_23);
  highp vec3 tmpvar_24;
  tmpvar_24 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_19);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_25 = texture2D (_MainTex, P_26);
  highp vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_25.xyz * _Color.xyz) + tmpvar_19) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_24)) + (tmpvar_24 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float tmpvar_11;
  mediump float lightShadowDataX_12;
  highp float dist_13;
  lowp float tmpvar_14;
  tmpvar_14 = textureProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = _LightShadowData.x;
  lightShadowDataX_12 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = max (float((dist_13 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_12);
  tmpvar_11 = tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_17 = (tmpvar_11 * 2.0);
  attenuation_3 = tmpvar_17;
  highp mat2 tmpvar_18;
  tmpvar_18[0].x = -0.999999;
  tmpvar_18[0].y = 0.00159255;
  tmpvar_18[1].x = -0.00159255;
  tmpvar_18[1].y = -0.999999;
  lowp vec4 tmpvar_19;
  highp vec2 P_20;
  P_20 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_19 = texture (_Mask, P_20);
  node_1540_2 = tmpvar_19;
  highp vec2 P_21;
  P_21 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_18) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_22;
  arg0_22 = (1.0 - texture (_Glittermap, P_21).xyz);
  highp vec3 tmpvar_23;
  tmpvar_23 = (max (arg0_22, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_26 = texture (_Glittermap, P_27);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_28 = texture (_Specularglitter, P_29);
  highp vec3 tmpvar_30;
  tmpvar_30 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_23) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_25);
  lowp vec4 tmpvar_31;
  highp vec2 P_32;
  P_32 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_31 = texture (_MainTex, P_32);
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_31.xyz * _Color.xyz) + tmpvar_25) + ((1.0 - _MasktransparencyDebug) * tmpvar_23))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_30)) + (tmpvar_30 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float shadow_11;
  lowp float tmpvar_12;
  tmpvar_12 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  highp float tmpvar_13;
  tmpvar_13 = (_LightShadowData.x + (tmpvar_12 * (1.0 - _LightShadowData.x)));
  shadow_11 = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (shadow_11 * 2.0);
  attenuation_3 = tmpvar_14;
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
  tmpvar_21 = textureCube (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_21.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_23 = texture2D (_Glittermap, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_25 = texture2D (_Specularglitter, P_26);
  highp vec3 tmpvar_27;
  tmpvar_27 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_23.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_25.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_22);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_28 = texture2D (_MainTex, P_29);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_28.xyz * _Color.xyz) + tmpvar_22) + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float shadow_11;
  mediump float tmpvar_12;
  tmpvar_12 = texture (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  shadow_11 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_LightShadowData.x + (shadow_11 * (1.0 - _LightShadowData.x)));
  shadow_11 = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (shadow_11 * 2.0);
  attenuation_3 = tmpvar_14;
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
  tmpvar_21 = texture (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_21.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_23 = texture (_Glittermap, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_25 = texture (_Specularglitter, P_26);
  highp vec3 tmpvar_27;
  tmpvar_27 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_23.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_25.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_22);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_28 = texture (_MainTex, P_29);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_28.xyz * _Color.xyz) + tmpvar_22) + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float shadow_11;
  lowp float tmpvar_12;
  tmpvar_12 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  highp float tmpvar_13;
  tmpvar_13 = (_LightShadowData.x + (tmpvar_12 * (1.0 - _LightShadowData.x)));
  shadow_11 = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (shadow_11 * 2.0);
  attenuation_3 = tmpvar_14;
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
  tmpvar_21 = textureCube (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_21.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_23 = texture2D (_Glittermap, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_25 = texture2D (_Specularglitter, P_26);
  highp vec3 tmpvar_27;
  tmpvar_27 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_23.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_25.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_22);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_28 = texture2D (_MainTex, P_29);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_28.xyz * _Color.xyz) + tmpvar_22) + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float shadow_11;
  mediump float tmpvar_12;
  tmpvar_12 = texture (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  shadow_11 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_LightShadowData.x + (shadow_11 * (1.0 - _LightShadowData.x)));
  shadow_11 = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (shadow_11 * 2.0);
  attenuation_3 = tmpvar_14;
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
  tmpvar_21 = texture (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_21.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_23 = texture (_Glittermap, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_25 = texture (_Specularglitter, P_26);
  highp vec3 tmpvar_27;
  tmpvar_27 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_23.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_25.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_22);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_28 = texture (_MainTex, P_29);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_28.xyz * _Color.xyz) + tmpvar_22) + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float shadow_11;
  lowp float tmpvar_12;
  tmpvar_12 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  highp float tmpvar_13;
  tmpvar_13 = (_LightShadowData.x + (tmpvar_12 * (1.0 - _LightShadowData.x)));
  shadow_11 = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (shadow_11 * 2.0);
  attenuation_3 = tmpvar_14;
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
  tmpvar_21 = textureCube (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_21.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_23 = texture2D (_Glittermap, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_25 = texture2D (_Specularglitter, P_26);
  highp vec3 tmpvar_27;
  tmpvar_27 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_23.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_25.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_22);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_28 = texture2D (_MainTex, P_29);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_28.xyz * _Color.xyz) + tmpvar_22) + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float shadow_11;
  mediump float tmpvar_12;
  tmpvar_12 = texture (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  shadow_11 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_LightShadowData.x + (shadow_11 * (1.0 - _LightShadowData.x)));
  shadow_11 = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (shadow_11 * 2.0);
  attenuation_3 = tmpvar_14;
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
  tmpvar_21 = texture (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_21.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_23 = texture (_Glittermap, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_25 = texture (_Specularglitter, P_26);
  highp vec3 tmpvar_27;
  tmpvar_27 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_23.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_25.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_22);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_28 = texture (_MainTex, P_29);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_28.xyz * _Color.xyz) + tmpvar_22) + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float shadow_11;
  lowp float tmpvar_12;
  tmpvar_12 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  highp float tmpvar_13;
  tmpvar_13 = (_LightShadowData.x + (tmpvar_12 * (1.0 - _LightShadowData.x)));
  shadow_11 = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (shadow_11 * 2.0);
  attenuation_3 = tmpvar_14;
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
  tmpvar_21 = textureCube (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_21.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_23 = texture2D (_Glittermap, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_25 = texture2D (_Specularglitter, P_26);
  highp vec3 tmpvar_27;
  tmpvar_27 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_23.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_25.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_22);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_28 = texture2D (_MainTex, P_29);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_28.xyz * _Color.xyz) + tmpvar_22) + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_8;
  highp vec3 i_9;
  i_9 = -(tmpvar_7);
  tmpvar_8 = (i_9 - (2.0 * (dot (tmpvar_5, i_9) * tmpvar_5)));
  lowp vec3 tmpvar_10;
  tmpvar_10 = normalize(_WorldSpaceLightPos0.xyz);
  lightDirection_4 = tmpvar_10;
  lowp float shadow_11;
  mediump float tmpvar_12;
  tmpvar_12 = texture (_ShadowMapTexture, xlv_TEXCOORD5.xyz);
  shadow_11 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_LightShadowData.x + (shadow_11 * (1.0 - _LightShadowData.x)));
  shadow_11 = tmpvar_13;
  lowp float tmpvar_14;
  tmpvar_14 = (shadow_11 * 2.0);
  attenuation_3 = tmpvar_14;
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
  tmpvar_21 = texture (_Reflectioncubemap, tmpvar_8);
  highp vec3 tmpvar_22;
  tmpvar_22 = (tmpvar_21.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_23;
  highp vec2 P_24;
  P_24 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_6 * tmpvar_7).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  tmpvar_23 = texture (_Glittermap, P_24);
  lowp vec4 tmpvar_25;
  highp vec2 P_26;
  P_26 = ((xlv_TEXCOORD0 * _Specularglitter_ST.xy) + _Specularglitter_ST.zw);
  tmpvar_25 = texture (_Specularglitter, P_26);
  highp vec3 tmpvar_27;
  tmpvar_27 = ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_23.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_20) + mix (pow ((tmpvar_25.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_22);
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_28 = texture (_MainTex, P_29);
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((((max (0.0, dot (tmpvar_5, lightDirection_4)) * (attenuation_3 * _LightColor0.xyz)) + (glstate_lightmodel_ambient.xyz * 2.0)) * (((tmpvar_28.xyz * _Color.xyz) + tmpvar_22) + ((1.0 - _MasktransparencyDebug) * tmpvar_20))) + (((floor(attenuation_3) * _LightColor0.xyz) * pow (max (0.0, dot (normalize((tmpvar_7 + lightDirection_4)), tmpvar_5)), exp2(((_Shininess * 10.0) + 1.0)))) * tmpvar_27)) + (tmpvar_27 * _Fakelight));
  tmpvar_1 = tmpvar_30;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 86 math, 6 textures
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
Float 12 [_Reflectioncubemappower]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Mask] 2D 0
SetTexture 1 [_Glittermap] 2D 1
SetTexture 2 [_Reflectioncubemap] CUBE 2
SetTexture 3 [_Specularglitter] 2D 3
SetTexture 4 [_MainTex] 2D 4
"3.0-!!ARBfp1.0
PARAM c[24] = { state.lightmodel.ambient,
		program.local[1..20],
		{ 0, 2, 1, 0.050000001 },
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
ADD R0.xyz, -fragment.texcoord[1], c[1];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R4.xyz, R0.w, R0;
MOV R0.w, c[16].x;
MUL R0.z, R0.w, -c[23].x;
DP3 R0.x, R4, fragment.texcoord[3];
DP3 R0.y, fragment.texcoord[4], R4;
MUL R2.xy, R0, -c[16].x;
MAD R0.xy, R2, c[21].w, fragment.texcoord[0];
ADD R0.xy, R0, -c[22].x;
MUL R1.xy, R0.y, c[22].wyzw;
MAD R0.xy, R0.x, c[22].yzzw, R1;
ADD R0.xy, R0, c[22].x;
ADD R0.z, R0, c[21];
MUL R0.xy, R0, c[15].x;
MUL R0.xy, R0, R0.z;
MUL R0.xy, R0, c[20].x;
MAD R0.xy, R0, c[17], c[17].zwzw;
TEX R0.xyz, R0, texture[1], 2D;
ADD R1.xyz, -R0, c[21].z;
MUL R0.x, R0.w, c[22];
ADD R1.w, R0.x, c[21].z;
MAD R0.zw, -R2.xyxy, c[21].w, fragment.texcoord[0].xyxy;
MUL R2.xy, R0.zwzw, R1.w;
MAD R0.xy, fragment.texcoord[0], c[4], c[4].zwzw;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R3.xy, R2, c[15].x;
TEX R0.xyz, R0, texture[0], 2D;
MAX R2.xyz, R1, R0;
MAD R1.xy, R3, c[17], c[17].zwzw;
MOV R3.xyz, c[14];
MUL R3.xyz, R3, c[10].x;
TEX R1.xyz, R1, texture[1], 2D;
MUL R1.xyz, R3, R1;
MUL R3.xyz, R2, c[8].x;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, fragment.texcoord[2];
DP3 R0.w, R2, -R4;
POW R1.x, R1.x, c[18].x;
POW R1.z, R1.z, c[18].x;
POW R1.y, R1.y, c[18].x;
MAD R5.xyz, R3, -R1, R1;
MAD R1.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R1.xyz, R1, texture[3], 2D;
MUL R1.xyz, R1, c[9].x;
POW R1.x, R1.x, c[19].x;
POW R1.z, R1.z, c[19].x;
POW R1.y, R1.y, c[19].x;
MAD R0.xyz, R0, -R1, R1;
ADD R5.xyz, R5, R0;
MUL R0.xyz, R2, R0.w;
MAD R0.xyz, -R0, c[21].y, -R4;
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, c[2];
ADD R4.xyz, R1, R4;
DP3 R1.w, R4, R4;
RSQ R1.w, R1.w;
TEX R0.xyz, R0, texture[2], CUBE;
MUL R0.xyz, R0, c[12].x;
ADD R5.xyz, R0, R5;
MOV R0.w, c[23].y;
MUL R4.xyz, R1.w, R4;
MUL R0.w, R0, c[5].x;
ADD R1.w, R0, c[21].z;
DP3 R0.w, R2, R4;
MUL R6.xyz, R5, c[13].x;
EX2 R1.w, R1.w;
MAX R0.w, R0, c[21].x;
POW R0.w, R0.w, R1.w;
MUL R4.xyz, R0.w, c[3];
DP3 R0.w, R2, R1;
MAX R1.x, R0.w, c[21];
MOV R0.w, c[21].z;
MUL R1.xyz, R1.x, c[3];
MUL R5.xyz, R4, R5;
MAD R7.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R4.xyz, R7, texture[4], 2D;
MAD R0.xyz, R4, c[11], R0;
ADD R0.w, R0, -c[8].x;
MAD R0.xyz, R0.w, R3, R0;
ADD R1.xyz, R1, c[0];
MAD R0.xyz, R1, R0, R5;
MAD result.color.xyz, R0, c[21].y, R6;
MOV result.color.w, c[21].z;
END
# 86 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 97 math, 6 textures
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
Float 12 [_Reflectioncubemappower]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Mask] 2D 0
SetTexture 1 [_Glittermap] 2D 1
SetTexture 2 [_Reflectioncubemap] CUBE 2
SetTexture 3 [_Specularglitter] 2D 3
SetTexture 4 [_MainTex] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
dcl_2d s4
def c21, 0.00000000, 1.00000000, 0.05000000, -0.50000000
def c22, 0.00159374, -0.99999875, -0.00159374, 0.50000000
def c23, -0.31830987, 1.00000000, 2.00000000, 10.00000000
def c24, 0.50000000, 1.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
add r0.xyz, -v1, c1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r2.xyz, r0.w, r0
dp3 r0.x, r2, v3
dp3 r0.y, v4, r2
mul r1.xy, r0, -c16.x
mad r0.xy, r1, c21.z, v0
add r0.xy, r0, c21.w
mul r0.zw, r0.y, c22.xyxy
mad r0.zw, r0.x, c22.xyyz, r0
mov r0.x, c16
add r0.zw, r0, c22.w
mad r1.z, r0.x, c23.x, c23.y
mul r0.xy, r0.zwzw, c15.x
mul r0.xy, r0, r1.z
mad r1.zw, -r1.xyxy, c21.z, v0.xyxy
mul r0.xy, r0, c20.x
mad r0.xy, r0, c17, c17.zwzw
texld r0.xyz, r0, s1
mov r0.w, c16.x
mad r0.w, r0, c24.x, c24.y
mul r3.xy, r1.zwzw, r0.w
mov r0.w, c10.x
mad r1.xy, v0, c4, c4.zwzw
mul r3.xy, r3, c15.x
mad r3.xy, r3, c17, c17.zwzw
texld r1.xyz, r1, s0
add r0.xyz, -r0, c21.y
max r0.xyz, r0, r1
mul r4.xyz, c14, r0.w
texld r3.xyz, r3, s1
mul r5.xyz, r4, r3
pow r3, r5.x, c18.x
mul r4.xyz, r0, c8.x
pow r0, r5.y, c18.x
mov r3.y, r0
pow r0, r5.z, c18.x
mad r0.xy, v0, c7, c7.zwzw
texld r5.xyz, r0, s3
mul r6.xyz, r5, c9.x
mov r3.z, r0
pow r0, r6.y, c19.x
mad r5.xyz, r4, -r3, r3
pow r3, r6.x, c19.x
mov r3.y, r0
pow r0, r6.z, c19.x
dp3_pp r0.x, c2, c2
mov r3.z, r0
mad r3.xyz, r1, -r3, r3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, c2
add r1.xyz, r0, r2
dp3 r1.w, r1, r1
rsq r1.w, r1.w
mul r1.xyz, r1.w, r1
dp3 r0.w, v2, v2
add r5.xyz, r5, r3
rsq r0.w, r0.w
mul r3.xyz, r0.w, v2
dp3 r0.w, r3, r1
mov r1.w, c5.x
mad r1.x, r1.w, c23.w, c23.y
max r2.w, r0, c21.x
dp3 r0.w, r3, -r2
mul r6.xyz, r3, r0.w
exp r3.w, r1.x
pow r1, r2.w, r3.w
mad r2.xyz, -r6, c23.z, -r2
mov r0.w, r1.x
texld r1.xyz, r2, s2
mad r5.xyz, r1, c12.x, r5
mul r2.xyz, r0.w, c3
dp3 r0.w, r3, r0
mul r6.xyz, r5, c13.x
mul r2.xyz, r2, r5
mad r5.xy, v0, c6, c6.zwzw
texld r0.xyz, r5, s4
mul r1.xyz, r1, c12.x
mad r1.xyz, r0, c11, r1
max r0.x, r0.w, c21
mov r0.w, c8.x
mul r0.xyz, r0.x, c3
add r0.w, c21.y, -r0
mad r1.xyz, r0.w, r4, r1
add r0.xyz, r0, c0
mad r0.xyz, r0, r1, r2
mad oC0.xyz, r0, c23.z, r6
mov_pp oC0.w, c21.y
"
}
SubProgram "d3d11 " {
// Stats: 73 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Mask] 2D 0
SetTexture 1 [_Glittermap] 2D 4
SetTexture 2 [_Reflectioncubemap] CUBE 3
SetTexture 3 [_Specularglitter] 2D 2
SetTexture 4 [_MainTex] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 32 [_Mask_ST]
Float 48 [_Shininess]
Vector 64 [_MainTex_ST]
Vector 80 [_Specularglitter_ST]
Float 96 [_MasktransparencyDebug]
Float 100 [_Specularpower05]
Float 104 [_Glitterpower]
Vector 112 [_Color]
Float 128 [_Reflectioncubemappower]
Float 132 [_Fakelight]
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
eefiecedjgeeglcddnmfojkbpfkfiifndgopmnjmabaaaaaagmamaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcemalaaaa
eaaaaaaandacaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
agaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaakaaaaaaabeaaaaa
aaaaaadpabeaaaaaaaaaiadpdiaaaaalgcaabaaaaaaaaaaafgifcaaaaaaaaaaa
akaaaaaaaceaaaaaaaaaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaajhcaabaaa
abaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaa
acaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaa
dcaaaaajpcaabaaaadaaaaaafgakbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaa
abaaaaaadiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaadaaaaaa
aaaaaaakdcaabaaaadaaaaaaogakbaaaadaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaakaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaeaaaaaadiaaaaajhcaabaaa
aaaaaaaakgikcaaaaaaaaaaaagaaaaaaegiccaaaaaaaaaaaajaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaaaaaaaacpaaaaafhcaabaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
agiacaaaaaaaaaaaamaaaaaabjaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
apaaaaakbcaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaadaaaaaaegaabaaa
aeaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
adaaaaaaegaabaaaadaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaadaaaaaapgapbaaaabaaaaaaegaabaaaadaaaaaa
diaaaaaidcaabaaaadaaaaaaegaabaaaadaaaaaakgikcaaaaaaaaaaaamaaaaaa
dcaaaaaldcaabaaaadaaaaaaegaabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaa
ogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaabaaaaaaaagabaaaaeaaaaaaaaaaaaalhcaabaaaadaaaaaaegacbaia
ebaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaacaaaaaaogikcaaa
aaaaaaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadeaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaaaaeaaaaaadiaaaaaihcaabaaaadaaaaaaegacbaaaadaaaaaaagiacaaa
aaaaaaaaagaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaia
ebaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaaefaaaaaj
pcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaa
diaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaaagaaaaaa
cpaaaaafhcaabaaaafaaaaaaegacbaaaafaaaaaadiaaaaaihcaabaaaafaaaaaa
egacbaaaafaaaaaafgifcaaaaaaaaaaaamaaaaaabjaaaaafhcaabaaaafaaaaaa
egacbaaaafaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaia
ebaaaaaaafaaaaaaegacbaaaafaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaaeaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaabaaaaaaiicaabaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaaegacbaaaaeaaaaaaaaaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaacaaaaaa
egacbaaaaeaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
efaaaaajpcaabaaaacaaaaaaegacbaaaacaaaaaaeghobaaaacaaaaaaaagabaaa
adaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaa
aiaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
agiacaaaaaaaaaaaaiaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaaihcaabaaaafaaaaaapgapbaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaafaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaa
afaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakccaabaaa
abaaaaaaakiacaaaaaaaaaaaadaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadp
bjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaabkaabaaaabaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaaaaaaaaajocaabaaaabaaaaaaagijcaaaaaaaaaaaabaaaaaaagijcaaa
aaaaaaaaabaaaaaadiaaaaahhcaabaaaaeaaaaaaagaabaaaabaaaaaajgahbaaa
abaaaaaadiaaaaahhcaabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaeaaaaaa
ogikcaaaaaaaaaaaaeaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaeaaaaaaaagabaaaabaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaa
afaaaaaaegiccaaaaaaaaaaaahaaaaaaegacbaaaacaaaaaaaaaaaaajbcaabaaa
abaaaaaaakiacaiaebaaaaaaaaaaaaaaagaaaaaaabeaaaaaaaaaiadpdcaaaaaj
hcaabaaaacaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaa
aaaaaaajhcaabaaaadaaaaaaegiccaaaadaaaaaaaeaaaaaaegiccaaaadaaaaaa
aeaaaaaadcaaaaajhcaabaaaabaaaaaapgapbaaaaaaaaaaajgahbaaaabaaaaaa
egacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaadcaaaaakhccabaaaaaaaaaaaegacbaaaaaaaaaaa
fgifcaaaaaaaaaaaaiaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaiadpdoaaaaab"
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
// Stats: 86 math, 6 textures
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
Float 12 [_Reflectioncubemappower]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Mask] 2D 0
SetTexture 1 [_Glittermap] 2D 1
SetTexture 2 [_Reflectioncubemap] CUBE 2
SetTexture 3 [_Specularglitter] 2D 3
SetTexture 4 [_MainTex] 2D 4
"3.0-!!ARBfp1.0
PARAM c[24] = { state.lightmodel.ambient,
		program.local[1..20],
		{ 0, 2, 1, 0.050000001 },
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
ADD R0.xyz, -fragment.texcoord[1], c[1];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R4.xyz, R0.w, R0;
MOV R0.w, c[16].x;
MUL R0.z, R0.w, -c[23].x;
DP3 R0.x, R4, fragment.texcoord[3];
DP3 R0.y, fragment.texcoord[4], R4;
MUL R2.xy, R0, -c[16].x;
MAD R0.xy, R2, c[21].w, fragment.texcoord[0];
ADD R0.xy, R0, -c[22].x;
MUL R1.xy, R0.y, c[22].wyzw;
MAD R0.xy, R0.x, c[22].yzzw, R1;
ADD R0.xy, R0, c[22].x;
ADD R0.z, R0, c[21];
MUL R0.xy, R0, c[15].x;
MUL R0.xy, R0, R0.z;
MUL R0.xy, R0, c[20].x;
MAD R0.xy, R0, c[17], c[17].zwzw;
TEX R0.xyz, R0, texture[1], 2D;
ADD R1.xyz, -R0, c[21].z;
MUL R0.x, R0.w, c[22];
ADD R1.w, R0.x, c[21].z;
MAD R0.zw, -R2.xyxy, c[21].w, fragment.texcoord[0].xyxy;
MUL R2.xy, R0.zwzw, R1.w;
MAD R0.xy, fragment.texcoord[0], c[4], c[4].zwzw;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R3.xy, R2, c[15].x;
TEX R0.xyz, R0, texture[0], 2D;
MAX R2.xyz, R1, R0;
MAD R1.xy, R3, c[17], c[17].zwzw;
MOV R3.xyz, c[14];
MUL R3.xyz, R3, c[10].x;
TEX R1.xyz, R1, texture[1], 2D;
MUL R1.xyz, R3, R1;
MUL R3.xyz, R2, c[8].x;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, fragment.texcoord[2];
DP3 R0.w, R2, -R4;
POW R1.x, R1.x, c[18].x;
POW R1.z, R1.z, c[18].x;
POW R1.y, R1.y, c[18].x;
MAD R5.xyz, R3, -R1, R1;
MAD R1.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R1.xyz, R1, texture[3], 2D;
MUL R1.xyz, R1, c[9].x;
POW R1.x, R1.x, c[19].x;
POW R1.z, R1.z, c[19].x;
POW R1.y, R1.y, c[19].x;
MAD R0.xyz, R0, -R1, R1;
ADD R5.xyz, R5, R0;
MUL R0.xyz, R2, R0.w;
MAD R0.xyz, -R0, c[21].y, -R4;
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, c[2];
ADD R4.xyz, R1, R4;
DP3 R1.w, R4, R4;
RSQ R1.w, R1.w;
TEX R0.xyz, R0, texture[2], CUBE;
MUL R0.xyz, R0, c[12].x;
ADD R5.xyz, R0, R5;
MOV R0.w, c[23].y;
MUL R4.xyz, R1.w, R4;
MUL R0.w, R0, c[5].x;
ADD R1.w, R0, c[21].z;
DP3 R0.w, R2, R4;
MUL R6.xyz, R5, c[13].x;
EX2 R1.w, R1.w;
MAX R0.w, R0, c[21].x;
POW R0.w, R0.w, R1.w;
MUL R4.xyz, R0.w, c[3];
DP3 R0.w, R2, R1;
MAX R1.x, R0.w, c[21];
MOV R0.w, c[21].z;
MUL R1.xyz, R1.x, c[3];
MUL R5.xyz, R4, R5;
MAD R7.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R4.xyz, R7, texture[4], 2D;
MAD R0.xyz, R4, c[11], R0;
ADD R0.w, R0, -c[8].x;
MAD R0.xyz, R0.w, R3, R0;
ADD R1.xyz, R1, c[0];
MAD R0.xyz, R1, R0, R5;
MAD result.color.xyz, R0, c[21].y, R6;
MOV result.color.w, c[21].z;
END
# 86 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 97 math, 6 textures
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
Float 12 [_Reflectioncubemappower]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Mask] 2D 0
SetTexture 1 [_Glittermap] 2D 1
SetTexture 2 [_Reflectioncubemap] CUBE 2
SetTexture 3 [_Specularglitter] 2D 3
SetTexture 4 [_MainTex] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
dcl_2d s4
def c21, 0.00000000, 1.00000000, 0.05000000, -0.50000000
def c22, 0.00159374, -0.99999875, -0.00159374, 0.50000000
def c23, -0.31830987, 1.00000000, 2.00000000, 10.00000000
def c24, 0.50000000, 1.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
add r0.xyz, -v1, c1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r2.xyz, r0.w, r0
dp3 r0.x, r2, v3
dp3 r0.y, v4, r2
mul r1.xy, r0, -c16.x
mad r0.xy, r1, c21.z, v0
add r0.xy, r0, c21.w
mul r0.zw, r0.y, c22.xyxy
mad r0.zw, r0.x, c22.xyyz, r0
mov r0.x, c16
add r0.zw, r0, c22.w
mad r1.z, r0.x, c23.x, c23.y
mul r0.xy, r0.zwzw, c15.x
mul r0.xy, r0, r1.z
mad r1.zw, -r1.xyxy, c21.z, v0.xyxy
mul r0.xy, r0, c20.x
mad r0.xy, r0, c17, c17.zwzw
texld r0.xyz, r0, s1
mov r0.w, c16.x
mad r0.w, r0, c24.x, c24.y
mul r3.xy, r1.zwzw, r0.w
mov r0.w, c10.x
mad r1.xy, v0, c4, c4.zwzw
mul r3.xy, r3, c15.x
mad r3.xy, r3, c17, c17.zwzw
texld r1.xyz, r1, s0
add r0.xyz, -r0, c21.y
max r0.xyz, r0, r1
mul r4.xyz, c14, r0.w
texld r3.xyz, r3, s1
mul r5.xyz, r4, r3
pow r3, r5.x, c18.x
mul r4.xyz, r0, c8.x
pow r0, r5.y, c18.x
mov r3.y, r0
pow r0, r5.z, c18.x
mad r0.xy, v0, c7, c7.zwzw
texld r5.xyz, r0, s3
mul r6.xyz, r5, c9.x
mov r3.z, r0
pow r0, r6.y, c19.x
mad r5.xyz, r4, -r3, r3
pow r3, r6.x, c19.x
mov r3.y, r0
pow r0, r6.z, c19.x
dp3_pp r0.x, c2, c2
mov r3.z, r0
mad r3.xyz, r1, -r3, r3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, c2
add r1.xyz, r0, r2
dp3 r1.w, r1, r1
rsq r1.w, r1.w
mul r1.xyz, r1.w, r1
dp3 r0.w, v2, v2
add r5.xyz, r5, r3
rsq r0.w, r0.w
mul r3.xyz, r0.w, v2
dp3 r0.w, r3, r1
mov r1.w, c5.x
mad r1.x, r1.w, c23.w, c23.y
max r2.w, r0, c21.x
dp3 r0.w, r3, -r2
mul r6.xyz, r3, r0.w
exp r3.w, r1.x
pow r1, r2.w, r3.w
mad r2.xyz, -r6, c23.z, -r2
mov r0.w, r1.x
texld r1.xyz, r2, s2
mad r5.xyz, r1, c12.x, r5
mul r2.xyz, r0.w, c3
dp3 r0.w, r3, r0
mul r6.xyz, r5, c13.x
mul r2.xyz, r2, r5
mad r5.xy, v0, c6, c6.zwzw
texld r0.xyz, r5, s4
mul r1.xyz, r1, c12.x
mad r1.xyz, r0, c11, r1
max r0.x, r0.w, c21
mov r0.w, c8.x
mul r0.xyz, r0.x, c3
add r0.w, c21.y, -r0
mad r1.xyz, r0.w, r4, r1
add r0.xyz, r0, c0
mad r0.xyz, r0, r1, r2
mad oC0.xyz, r0, c23.z, r6
mov_pp oC0.w, c21.y
"
}
SubProgram "d3d11 " {
// Stats: 73 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Mask] 2D 0
SetTexture 1 [_Glittermap] 2D 4
SetTexture 2 [_Reflectioncubemap] CUBE 3
SetTexture 3 [_Specularglitter] 2D 2
SetTexture 4 [_MainTex] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 32 [_Mask_ST]
Float 48 [_Shininess]
Vector 64 [_MainTex_ST]
Vector 80 [_Specularglitter_ST]
Float 96 [_MasktransparencyDebug]
Float 100 [_Specularpower05]
Float 104 [_Glitterpower]
Vector 112 [_Color]
Float 128 [_Reflectioncubemappower]
Float 132 [_Fakelight]
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
eefiecedjgeeglcddnmfojkbpfkfiifndgopmnjmabaaaaaagmamaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcemalaaaa
eaaaaaaandacaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
agaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaakaaaaaaabeaaaaa
aaaaaadpabeaaaaaaaaaiadpdiaaaaalgcaabaaaaaaaaaaafgifcaaaaaaaaaaa
akaaaaaaaceaaaaaaaaaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaajhcaabaaa
abaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaa
acaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaa
dcaaaaajpcaabaaaadaaaaaafgakbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaa
abaaaaaadiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaadaaaaaa
aaaaaaakdcaabaaaadaaaaaaogakbaaaadaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaakaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaeaaaaaadiaaaaajhcaabaaa
aaaaaaaakgikcaaaaaaaaaaaagaaaaaaegiccaaaaaaaaaaaajaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaaaaaaaacpaaaaafhcaabaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
agiacaaaaaaaaaaaamaaaaaabjaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
apaaaaakbcaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaadaaaaaaegaabaaa
aeaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
adaaaaaaegaabaaaadaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaadaaaaaapgapbaaaabaaaaaaegaabaaaadaaaaaa
diaaaaaidcaabaaaadaaaaaaegaabaaaadaaaaaakgikcaaaaaaaaaaaamaaaaaa
dcaaaaaldcaabaaaadaaaaaaegaabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaa
ogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaabaaaaaaaagabaaaaeaaaaaaaaaaaaalhcaabaaaadaaaaaaegacbaia
ebaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaacaaaaaaogikcaaa
aaaaaaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadeaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaaaaeaaaaaadiaaaaaihcaabaaaadaaaaaaegacbaaaadaaaaaaagiacaaa
aaaaaaaaagaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaia
ebaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaaefaaaaaj
pcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaa
diaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaaagaaaaaa
cpaaaaafhcaabaaaafaaaaaaegacbaaaafaaaaaadiaaaaaihcaabaaaafaaaaaa
egacbaaaafaaaaaafgifcaaaaaaaaaaaamaaaaaabjaaaaafhcaabaaaafaaaaaa
egacbaaaafaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaia
ebaaaaaaafaaaaaaegacbaaaafaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaaeaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaabaaaaaaiicaabaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaaegacbaaaaeaaaaaaaaaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaacaaaaaa
egacbaaaaeaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
efaaaaajpcaabaaaacaaaaaaegacbaaaacaaaaaaeghobaaaacaaaaaaaagabaaa
adaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaa
aiaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
agiacaaaaaaaaaaaaiaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaaihcaabaaaafaaaaaapgapbaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaafaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaa
afaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakccaabaaa
abaaaaaaakiacaaaaaaaaaaaadaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadp
bjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaabkaabaaaabaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaaaaaaaaajocaabaaaabaaaaaaagijcaaaaaaaaaaaabaaaaaaagijcaaa
aaaaaaaaabaaaaaadiaaaaahhcaabaaaaeaaaaaaagaabaaaabaaaaaajgahbaaa
abaaaaaadiaaaaahhcaabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaeaaaaaa
ogikcaaaaaaaaaaaaeaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaeaaaaaaaagabaaaabaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaa
afaaaaaaegiccaaaaaaaaaaaahaaaaaaegacbaaaacaaaaaaaaaaaaajbcaabaaa
abaaaaaaakiacaiaebaaaaaaaaaaaaaaagaaaaaaabeaaaaaaaaaiadpdcaaaaaj
hcaabaaaacaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaa
aaaaaaajhcaabaaaadaaaaaaegiccaaaadaaaaaaaeaaaaaaegiccaaaadaaaaaa
aeaaaaaadcaaaaajhcaabaaaabaaaaaapgapbaaaaaaaaaaajgahbaaaabaaaaaa
egacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaadcaaaaakhccabaaaaaaaaaaaegacbaaaaaaaaaaa
fgifcaaaaaaaaaaaaiaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaiadpdoaaaaab"
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
// Stats: 86 math, 6 textures
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
Float 12 [_Reflectioncubemappower]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Mask] 2D 0
SetTexture 1 [_Glittermap] 2D 1
SetTexture 2 [_Reflectioncubemap] CUBE 2
SetTexture 3 [_Specularglitter] 2D 3
SetTexture 4 [_MainTex] 2D 4
"3.0-!!ARBfp1.0
PARAM c[24] = { state.lightmodel.ambient,
		program.local[1..20],
		{ 0, 2, 1, 0.050000001 },
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
ADD R0.xyz, -fragment.texcoord[1], c[1];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R4.xyz, R0.w, R0;
MOV R0.w, c[16].x;
MUL R0.z, R0.w, -c[23].x;
DP3 R0.x, R4, fragment.texcoord[3];
DP3 R0.y, fragment.texcoord[4], R4;
MUL R2.xy, R0, -c[16].x;
MAD R0.xy, R2, c[21].w, fragment.texcoord[0];
ADD R0.xy, R0, -c[22].x;
MUL R1.xy, R0.y, c[22].wyzw;
MAD R0.xy, R0.x, c[22].yzzw, R1;
ADD R0.xy, R0, c[22].x;
ADD R0.z, R0, c[21];
MUL R0.xy, R0, c[15].x;
MUL R0.xy, R0, R0.z;
MUL R0.xy, R0, c[20].x;
MAD R0.xy, R0, c[17], c[17].zwzw;
TEX R0.xyz, R0, texture[1], 2D;
ADD R1.xyz, -R0, c[21].z;
MUL R0.x, R0.w, c[22];
ADD R1.w, R0.x, c[21].z;
MAD R0.zw, -R2.xyxy, c[21].w, fragment.texcoord[0].xyxy;
MUL R2.xy, R0.zwzw, R1.w;
MAD R0.xy, fragment.texcoord[0], c[4], c[4].zwzw;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R3.xy, R2, c[15].x;
TEX R0.xyz, R0, texture[0], 2D;
MAX R2.xyz, R1, R0;
MAD R1.xy, R3, c[17], c[17].zwzw;
MOV R3.xyz, c[14];
MUL R3.xyz, R3, c[10].x;
TEX R1.xyz, R1, texture[1], 2D;
MUL R1.xyz, R3, R1;
MUL R3.xyz, R2, c[8].x;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, fragment.texcoord[2];
DP3 R0.w, R2, -R4;
POW R1.x, R1.x, c[18].x;
POW R1.z, R1.z, c[18].x;
POW R1.y, R1.y, c[18].x;
MAD R5.xyz, R3, -R1, R1;
MAD R1.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R1.xyz, R1, texture[3], 2D;
MUL R1.xyz, R1, c[9].x;
POW R1.x, R1.x, c[19].x;
POW R1.z, R1.z, c[19].x;
POW R1.y, R1.y, c[19].x;
MAD R0.xyz, R0, -R1, R1;
ADD R5.xyz, R5, R0;
MUL R0.xyz, R2, R0.w;
MAD R0.xyz, -R0, c[21].y, -R4;
DP3 R0.w, c[2], c[2];
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, c[2];
ADD R4.xyz, R1, R4;
DP3 R1.w, R4, R4;
RSQ R1.w, R1.w;
TEX R0.xyz, R0, texture[2], CUBE;
MUL R0.xyz, R0, c[12].x;
ADD R5.xyz, R0, R5;
MOV R0.w, c[23].y;
MUL R4.xyz, R1.w, R4;
MUL R0.w, R0, c[5].x;
ADD R1.w, R0, c[21].z;
DP3 R0.w, R2, R4;
MUL R6.xyz, R5, c[13].x;
EX2 R1.w, R1.w;
MAX R0.w, R0, c[21].x;
POW R0.w, R0.w, R1.w;
MUL R4.xyz, R0.w, c[3];
DP3 R0.w, R2, R1;
MAX R1.x, R0.w, c[21];
MOV R0.w, c[21].z;
MUL R1.xyz, R1.x, c[3];
MUL R5.xyz, R4, R5;
MAD R7.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R4.xyz, R7, texture[4], 2D;
MAD R0.xyz, R4, c[11], R0;
ADD R0.w, R0, -c[8].x;
MAD R0.xyz, R0.w, R3, R0;
ADD R1.xyz, R1, c[0];
MAD R0.xyz, R1, R0, R5;
MAD result.color.xyz, R0, c[21].y, R6;
MOV result.color.w, c[21].z;
END
# 86 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 97 math, 6 textures
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
Float 12 [_Reflectioncubemappower]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_Mask] 2D 0
SetTexture 1 [_Glittermap] 2D 1
SetTexture 2 [_Reflectioncubemap] CUBE 2
SetTexture 3 [_Specularglitter] 2D 3
SetTexture 4 [_MainTex] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
dcl_2d s4
def c21, 0.00000000, 1.00000000, 0.05000000, -0.50000000
def c22, 0.00159374, -0.99999875, -0.00159374, 0.50000000
def c23, -0.31830987, 1.00000000, 2.00000000, 10.00000000
def c24, 0.50000000, 1.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
add r0.xyz, -v1, c1
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r2.xyz, r0.w, r0
dp3 r0.x, r2, v3
dp3 r0.y, v4, r2
mul r1.xy, r0, -c16.x
mad r0.xy, r1, c21.z, v0
add r0.xy, r0, c21.w
mul r0.zw, r0.y, c22.xyxy
mad r0.zw, r0.x, c22.xyyz, r0
mov r0.x, c16
add r0.zw, r0, c22.w
mad r1.z, r0.x, c23.x, c23.y
mul r0.xy, r0.zwzw, c15.x
mul r0.xy, r0, r1.z
mad r1.zw, -r1.xyxy, c21.z, v0.xyxy
mul r0.xy, r0, c20.x
mad r0.xy, r0, c17, c17.zwzw
texld r0.xyz, r0, s1
mov r0.w, c16.x
mad r0.w, r0, c24.x, c24.y
mul r3.xy, r1.zwzw, r0.w
mov r0.w, c10.x
mad r1.xy, v0, c4, c4.zwzw
mul r3.xy, r3, c15.x
mad r3.xy, r3, c17, c17.zwzw
texld r1.xyz, r1, s0
add r0.xyz, -r0, c21.y
max r0.xyz, r0, r1
mul r4.xyz, c14, r0.w
texld r3.xyz, r3, s1
mul r5.xyz, r4, r3
pow r3, r5.x, c18.x
mul r4.xyz, r0, c8.x
pow r0, r5.y, c18.x
mov r3.y, r0
pow r0, r5.z, c18.x
mad r0.xy, v0, c7, c7.zwzw
texld r5.xyz, r0, s3
mul r6.xyz, r5, c9.x
mov r3.z, r0
pow r0, r6.y, c19.x
mad r5.xyz, r4, -r3, r3
pow r3, r6.x, c19.x
mov r3.y, r0
pow r0, r6.z, c19.x
dp3_pp r0.x, c2, c2
mov r3.z, r0
mad r3.xyz, r1, -r3, r3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, c2
add r1.xyz, r0, r2
dp3 r1.w, r1, r1
rsq r1.w, r1.w
mul r1.xyz, r1.w, r1
dp3 r0.w, v2, v2
add r5.xyz, r5, r3
rsq r0.w, r0.w
mul r3.xyz, r0.w, v2
dp3 r0.w, r3, r1
mov r1.w, c5.x
mad r1.x, r1.w, c23.w, c23.y
max r2.w, r0, c21.x
dp3 r0.w, r3, -r2
mul r6.xyz, r3, r0.w
exp r3.w, r1.x
pow r1, r2.w, r3.w
mad r2.xyz, -r6, c23.z, -r2
mov r0.w, r1.x
texld r1.xyz, r2, s2
mad r5.xyz, r1, c12.x, r5
mul r2.xyz, r0.w, c3
dp3 r0.w, r3, r0
mul r6.xyz, r5, c13.x
mul r2.xyz, r2, r5
mad r5.xy, v0, c6, c6.zwzw
texld r0.xyz, r5, s4
mul r1.xyz, r1, c12.x
mad r1.xyz, r0, c11, r1
max r0.x, r0.w, c21
mov r0.w, c8.x
mul r0.xyz, r0.x, c3
add r0.w, c21.y, -r0
mad r1.xyz, r0.w, r4, r1
add r0.xyz, r0, c0
mad r0.xyz, r0, r1, r2
mad oC0.xyz, r0, c23.z, r6
mov_pp oC0.w, c21.y
"
}
SubProgram "d3d11 " {
// Stats: 73 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_Mask] 2D 0
SetTexture 1 [_Glittermap] 2D 4
SetTexture 2 [_Reflectioncubemap] CUBE 3
SetTexture 3 [_Specularglitter] 2D 2
SetTexture 4 [_MainTex] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 32 [_Mask_ST]
Float 48 [_Shininess]
Vector 64 [_MainTex_ST]
Vector 80 [_Specularglitter_ST]
Float 96 [_MasktransparencyDebug]
Float 100 [_Specularpower05]
Float 104 [_Glitterpower]
Vector 112 [_Color]
Float 128 [_Reflectioncubemappower]
Float 132 [_Fakelight]
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
eefiecedjgeeglcddnmfojkbpfkfiifndgopmnjmabaaaaaagmamaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcemalaaaa
eaaaaaaandacaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
agaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaakaaaaaaabeaaaaa
aaaaaadpabeaaaaaaaaaiadpdiaaaaalgcaabaaaaaaaaaaafgifcaaaaaaaaaaa
akaaaaaaaceaaaaaaaaaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaajhcaabaaa
abaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaa
acaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaa
dcaaaaajpcaabaaaadaaaaaafgakbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaa
abaaaaaadiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaadaaaaaa
aaaaaaakdcaabaaaadaaaaaaogakbaaaadaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaakaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaeaaaaaadiaaaaajhcaabaaa
aaaaaaaakgikcaaaaaaaaaaaagaaaaaaegiccaaaaaaaaaaaajaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaaaaaaaacpaaaaafhcaabaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
agiacaaaaaaaaaaaamaaaaaabjaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
apaaaaakbcaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaadaaaaaaegaabaaa
aeaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
adaaaaaaegaabaaaadaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaadaaaaaapgapbaaaabaaaaaaegaabaaaadaaaaaa
diaaaaaidcaabaaaadaaaaaaegaabaaaadaaaaaakgikcaaaaaaaaaaaamaaaaaa
dcaaaaaldcaabaaaadaaaaaaegaabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaa
ogikcaaaaaaaaaaaalaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaabaaaaaaaagabaaaaeaaaaaaaaaaaaalhcaabaaaadaaaaaaegacbaia
ebaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaacaaaaaaogikcaaa
aaaaaaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadeaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaaaaeaaaaaadiaaaaaihcaabaaaadaaaaaaegacbaaaadaaaaaaagiacaaa
aaaaaaaaagaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaia
ebaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaaefaaaaaj
pcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaa
diaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaaagaaaaaa
cpaaaaafhcaabaaaafaaaaaaegacbaaaafaaaaaadiaaaaaihcaabaaaafaaaaaa
egacbaaaafaaaaaafgifcaaaaaaaaaaaamaaaaaabjaaaaafhcaabaaaafaaaaaa
egacbaaaafaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaia
ebaaaaaaafaaaaaaegacbaaaafaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaaeaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaabaaaaaaiicaabaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaaegacbaaaaeaaaaaaaaaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaacaaaaaa
egacbaaaaeaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
efaaaaajpcaabaaaacaaaaaaegacbaaaacaaaaaaeghobaaaacaaaaaaaagabaaa
adaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaa
aiaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
agiacaaaaaaaaaaaaiaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaaihcaabaaaafaaaaaapgapbaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaafaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaa
afaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakccaabaaa
abaaaaaaakiacaaaaaaaaaaaadaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadp
bjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaabkaabaaaabaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaaaaaaaaajocaabaaaabaaaaaaagijcaaaaaaaaaaaabaaaaaaagijcaaa
aaaaaaaaabaaaaaadiaaaaahhcaabaaaaeaaaaaaagaabaaaabaaaaaajgahbaaa
abaaaaaadiaaaaahhcaabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaeaaaaaa
ogikcaaaaaaaaaaaaeaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaeaaaaaaaagabaaaabaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaa
afaaaaaaegiccaaaaaaaaaaaahaaaaaaegacbaaaacaaaaaaaaaaaaajbcaabaaa
abaaaaaaakiacaiaebaaaaaaaaaaaaaaagaaaaaaabeaaaaaaaaaiadpdcaaaaaj
hcaabaaaacaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaa
aaaaaaajhcaabaaaadaaaaaaegiccaaaadaaaaaaaeaaaaaaegiccaaaadaaaaaa
aeaaaaaadcaaaaajhcaabaaaabaaaaaapgapbaaaaaaaaaaajgahbaaaabaaaaaa
egacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaadcaaaaakhccabaaaaaaaaaaaegacbaaaaaaaaaaa
fgifcaaaaaaaaaaaaiaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaiadpdoaaaaab"
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
// Stats: 90 math, 7 textures
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
Float 12 [_Reflectioncubemappower]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Reflectioncubemap] CUBE 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"3.0-!!ARBfp1.0
PARAM c[24] = { state.lightmodel.ambient,
		program.local[1..20],
		{ 0, 2, 1, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
ADD R1.xyz, -fragment.texcoord[1], c[1];
DP3 R0.x, R1, R1;
RSQ R0.x, R0.x;
MUL R1.xyz, R0.x, R1;
MOV R4.xyz, c[14];
MUL R4.xyz, R4, c[10].x;
DP3 R0.x, R1, fragment.texcoord[3];
DP3 R0.y, fragment.texcoord[4], R1;
MUL R3.xy, R0, -c[16].x;
MAD R0.xy, R3, c[21].w, fragment.texcoord[0];
ADD R0.zw, R0.xyxy, -c[22].x;
MUL R0.xy, R0.w, c[22].wyzw;
MAD R2.xy, R0.z, c[22].yzzw, R0;
MOV R0.w, c[16].x;
MUL R0.x, R0.w, -c[23];
ADD R2.xy, R2, c[22].x;
MAD R3.zw, fragment.texcoord[0].xyxy, c[4].xyxy, c[4];
MUL R2.xy, R2, c[15].x;
ADD R0.x, R0, c[21].z;
MUL R0.xy, R2, R0.x;
MUL R0.xy, R0, c[20].x;
MAD R0.xy, R0, c[17], c[17].zwzw;
TEX R0.xyz, R0, texture[2], 2D;
ADD R2.xyz, -R0, c[21].z;
MUL R0.x, R0.w, c[22];
MAD R0.zw, -R3.xyxy, c[21].w, fragment.texcoord[0].xyxy;
ADD R0.x, R0, c[21].z;
MUL R3.xy, R0.zwzw, R0.x;
TEX R0.xyz, R3.zwzw, texture[1], 2D;
MAX R2.xyz, R2, R0;
MUL R3.xy, R3, c[15].x;
MAD R3.xy, R3, c[17], c[17].zwzw;
TEX R3.xyz, R3, texture[2], 2D;
MUL R3.xyz, R4, R3;
MAD R4.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R4.xyz, R4, texture[4], 2D;
MUL R4.xyz, R4, c[9].x;
MUL R2.xyz, R2, c[8].x;
POW R4.x, R4.x, c[19].x;
POW R4.z, R4.z, c[19].x;
POW R4.y, R4.y, c[19].x;
MAD R0.xyz, R0, -R4, R4;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
POW R3.x, R3.x, c[18].x;
POW R3.y, R3.y, c[18].x;
POW R3.z, R3.z, c[18].x;
MAD R3.xyz, R2, -R3, R3;
ADD R5.xyz, R3, R0;
RSQ R0.x, R0.w;
DP3 R0.w, c[2], c[2];
RSQ R1.w, R0.w;
MUL R3.xyz, R1.w, c[2];
MUL R0.xyz, R0.x, fragment.texcoord[2];
DP3 R0.w, -R1, R0;
MUL R4.xyz, R0, R0.w;
ADD R6.xyz, R1, R3;
MAD R1.xyz, -R4, c[21].y, -R1;
DP3 R0.w, R6, R6;
TEX R1.xyz, R1, texture[3], CUBE;
MUL R4.xyz, R1, c[12].x;
ADD R1.xyz, R5, R4;
RSQ R0.w, R0.w;
MUL R6.xyz, R0.w, R6;
DP3 R0.w, R0, R6;
MAD R6.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R6.xyz, R6, texture[5], 2D;
MAD R4.xyz, R6, c[11], R4;
MOV R1.w, c[23].y;
MAX R2.w, R0, c[21].x;
MUL R0.w, R1, c[5].x;
ADD R1.w, R0, c[21].z;
TXP R5.x, fragment.texcoord[5], texture[0], 2D;
MUL R0.w, R5.x, c[21].y;
EX2 R1.w, R1.w;
FLR R3.w, R0;
POW R1.w, R2.w, R1.w;
MUL R5.xyz, R3.w, c[3];
MUL R5.xyz, R5, R1.w;
DP3 R1.w, R0, R3;
MOV R6.xy, c[21].yzzw;
ADD R0.x, R6.y, -c[8];
MAD R0.xyz, R2, R0.x, R4;
MUL R5.xyz, R1, R5;
MAX R1.w, R1, c[21].x;
MUL R2.xyz, R6.x, c[0];
MUL R3.xyz, R0.w, c[3];
MAD R2.xyz, R1.w, R3, R2;
MAD R0.xyz, R2, R0, R5;
MAD result.color.xyz, R1, c[13].x, R0;
MOV result.color.w, c[21].z;
END
# 90 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 104 math, 7 textures
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
Float 12 [_Reflectioncubemappower]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Reflectioncubemap] CUBE 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
dcl_2d s5
def c21, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c22, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c23, -0.31830987, 1.00000000, 0.00000000, 2.00000000
def c24, 10.00000000, 1.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
add r1.xyz, -v1, c1
dp3 r0.x, r1, r1
rsq r0.x, r0.x
mul r0.xyz, r0.x, r1
mov r0.w, c16.x
dp3 r1.x, r0, v3
dp3 r1.y, r0, v4
mul r1.xy, r1, -c16.x
mad r1.zw, r1.xyxy, c21.x, v0.xyxy
add r2.xy, r1.zwzw, c21.y
mul r1.zw, r2.y, c21
mad r1.zw, r2.x, c22.xyxy, r1
add r1.zw, r1, c22.z
mov r2.x, c16
mad r0.w, r0, c22.z, c22
mad r1.xy, -r1, c21.x, v0
mul r1.xy, r1, r0.w
mov r0.w, c10.x
mul r3.xyz, c14, r0.w
mul r1.xy, r1, c15.x
dp3_pp r0.w, c2, c2
mad r2.x, r2, c23, c23.y
mul r1.zw, r1, c15.x
mul r1.zw, r1, r2.x
mul r2.xy, r1.zwzw, c20.x
mad r1.xy, r1, c17, c17.zwzw
texld r1.xyz, r1, s2
mul r3.xyz, r3, r1
mad r1.xy, r2, c17, c17.zwzw
pow r4, r3.x, c18.x
pow r5, r3.y, c18.x
mov r3.x, r4
mad r2.xy, v0, c4, c4.zwzw
texld r1.xyz, r1, s2
texld r2.xyz, r2, s1
add r1.xyz, -r1, c22.w
max r1.xyz, r1, r2
mul r1.xyz, r1, c8.x
mad r4.xy, v0, c7, c7.zwzw
mov r3.y, r5
texld r5.xyz, r4, s4
mul r5.xyz, r5, c9.x
pow r4, r3.z, c18.x
pow r6, r5.x, c19.x
mov r3.z, r4
pow r4, r5.z, c19.x
mov r5.x, r6
pow r6, r5.y, c19.x
mad r3.xyz, r1, -r3, r3
mov r5.z, r4
mov r5.y, r6
mad r2.xyz, r2, -r5, r5
add r4.xyz, r3, r2
rsq_pp r0.w, r0.w
mul_pp r2.xyz, r0.w, c2
dp3 r1.w, v2, v2
rsq r0.w, r1.w
mul r3.xyz, r0.w, v2
add r5.xyz, r0, r2
dp3 r1.w, r3, -r0
mul r6.xyz, r3, r1.w
dp3 r0.w, r5, r5
rsq r0.w, r0.w
mul r5.xyz, r0.w, r5
dp3 r1.w, r3, r5
mov r0.w, c5.x
mad r0.w, r0, c24.x, c24.y
mad r0.xyz, -r6, c23.w, -r0
exp r2.w, r0.w
texldp r5.x, v5, s0
mul_pp r0.w, r5.x, c23
max r1.w, r1, c23.z
pow r5, r1.w, r2.w
frc r1.w, r0
add r2.w, r0, -r1
mov r1.w, r5.x
mul r5.xyz, r2.w, c3
mul r6.xyz, r5, r1.w
texld r5.xyz, r0, s3
mad r0.xyz, r5, c12.x, r4
mul r4.xyz, r0, r6
mad r6.xy, v0, c6, c6.zwzw
mov r1.w, c8.x
add r1.w, c22, -r1
mul r5.xyz, r5, c12.x
texld r6.xyz, r6, s5
mad r5.xyz, r6, c11, r5
mad r1.xyz, r1, r1.w, r5
dp3 r1.w, r3, r2
mov r2.xyz, c0
max r1.w, r1, c23.z
mul r2.xyz, c23.w, r2
mul r3.xyz, r0.w, c3
mad r2.xyz, r1.w, r3, r2
mad r1.xyz, r2, r1, r4
mad oC0.xyz, r0, c13.x, r1
mov_pp oC0.w, c22
"
}
SubProgram "d3d11 " {
// Stats: 77 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 5
SetTexture 3 [_Reflectioncubemap] CUBE 4
SetTexture 4 [_Specularglitter] 2D 3
SetTexture 5 [_MainTex] 2D 2
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Float 192 [_Reflectioncubemappower]
Float 196 [_Fakelight]
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
eefiecedfmfbpjokkphmkbpjhalnlbhihccfdnegabaaaaaadianaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcaaamaaaaeaaaaaaaaaadaaaa
fjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaad
aagabaaaafaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafidaaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
agaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaa
aaaaaadpabeaaaaaaaaaiadpdiaaaaalgcaabaaaaaaaaaaafgifcaaaaaaaaaaa
aoaaaaaaaceaaaaaaaaaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaajhcaabaaa
abaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaa
acaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaa
dcaaaaajpcaabaaaadaaaaaafgakbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaa
abaaaaaadiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaadaaaaaa
aaaaaaakdcaabaaaadaaaaaaogakbaaaadaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaaoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaafaaaaaadiaaaaajhcaabaaa
aaaaaaaakgikcaaaaaaaaaaaakaaaaaaegiccaaaaaaaaaaaanaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaaaaaaaacpaaaaafhcaabaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
agiacaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
apaaaaakbcaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaadaaaaaaegaabaaa
aeaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
adaaaaaaegaabaaaadaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaadaaaaaapgapbaaaabaaaaaaegaabaaaadaaaaaa
diaaaaaidcaabaaaadaaaaaaegaabaaaadaaaaaakgikcaaaaaaaaaaabaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegaabaaaadaaaaaaegiacaaaaaaaaaaaapaaaaaa
ogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaacaaaaaaaagabaaaafaaaaaaaaaaaaalhcaabaaaadaaaaaaegacbaia
ebaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaadeaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaaaaeaaaaaadiaaaaaihcaabaaaadaaaaaaegacbaaaadaaaaaaagiacaaa
aaaaaaaaakaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaia
ebaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaaj
pcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaaeaaaaaaaagabaaaadaaaaaa
diaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaaakaaaaaa
cpaaaaafhcaabaaaafaaaaaaegacbaaaafaaaaaadiaaaaaihcaabaaaafaaaaaa
egacbaaaafaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaafaaaaaa
egacbaaaafaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaia
ebaaaaaaafaaaaaaegacbaaaafaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaaeaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaabaaaaaaiicaabaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaaegacbaaaaeaaaaaaaaaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaacaaaaaa
egacbaaaaeaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
efaaaaajpcaabaaaacaaaaaaegacbaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
aeaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaa
amaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
agiacaaaaaaaaaaaamaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaaihcaabaaaafaaaaaapgapbaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaafaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaa
afaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakccaabaaa
abaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadp
bjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaabkaabaaaabaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaaaoaaaaahgcaabaaaabaaaaaaagbbbaaaagaaaaaapgbpbaaaagaaaaaa
efaaaaajpcaabaaaaeaaaaaajgafbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaaaaaaaaahccaabaaaabaaaaaaakaabaaaaeaaaaaaakaabaaaaeaaaaaa
ebaaaaafecaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaaihcaabaaaaeaaaaaa
fgafbaaaabaaaaaaegiccaaaaaaaaaaaafaaaaaadiaaaaaiocaabaaaabaaaaaa
kgakbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaabaaaaaa
agaabaaaabaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaa
afaaaaaaegaabaaaafaaaaaaeghobaaaafaaaaaaaagabaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegacbaaaafaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaa
acaaaaaaaaaaaaajicaabaaaabaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaa
abeaaaaaaaaaiadpdcaaaaajhcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaacaaaaaaaaaaaaajhcaabaaaadaaaaaaegiccaaaadaaaaaa
aeaaaaaaegiccaaaadaaaaaaaeaaaaaadcaaaaajhcaabaaaadaaaaaapgapbaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaa
egacbaaaadaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
aaaaaaaaegacbaaaaaaaaaaafgifcaaaaaaaaaaaamaaaaaaegacbaaaabaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
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
// Stats: 90 math, 7 textures
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
Float 12 [_Reflectioncubemappower]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Reflectioncubemap] CUBE 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"3.0-!!ARBfp1.0
PARAM c[24] = { state.lightmodel.ambient,
		program.local[1..20],
		{ 0, 2, 1, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
ADD R1.xyz, -fragment.texcoord[1], c[1];
DP3 R0.x, R1, R1;
RSQ R0.x, R0.x;
MUL R1.xyz, R0.x, R1;
MOV R4.xyz, c[14];
MUL R4.xyz, R4, c[10].x;
DP3 R0.x, R1, fragment.texcoord[3];
DP3 R0.y, fragment.texcoord[4], R1;
MUL R3.xy, R0, -c[16].x;
MAD R0.xy, R3, c[21].w, fragment.texcoord[0];
ADD R0.zw, R0.xyxy, -c[22].x;
MUL R0.xy, R0.w, c[22].wyzw;
MAD R2.xy, R0.z, c[22].yzzw, R0;
MOV R0.w, c[16].x;
MUL R0.x, R0.w, -c[23];
ADD R2.xy, R2, c[22].x;
MAD R3.zw, fragment.texcoord[0].xyxy, c[4].xyxy, c[4];
MUL R2.xy, R2, c[15].x;
ADD R0.x, R0, c[21].z;
MUL R0.xy, R2, R0.x;
MUL R0.xy, R0, c[20].x;
MAD R0.xy, R0, c[17], c[17].zwzw;
TEX R0.xyz, R0, texture[2], 2D;
ADD R2.xyz, -R0, c[21].z;
MUL R0.x, R0.w, c[22];
MAD R0.zw, -R3.xyxy, c[21].w, fragment.texcoord[0].xyxy;
ADD R0.x, R0, c[21].z;
MUL R3.xy, R0.zwzw, R0.x;
TEX R0.xyz, R3.zwzw, texture[1], 2D;
MAX R2.xyz, R2, R0;
MUL R3.xy, R3, c[15].x;
MAD R3.xy, R3, c[17], c[17].zwzw;
TEX R3.xyz, R3, texture[2], 2D;
MUL R3.xyz, R4, R3;
MAD R4.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R4.xyz, R4, texture[4], 2D;
MUL R4.xyz, R4, c[9].x;
MUL R2.xyz, R2, c[8].x;
POW R4.x, R4.x, c[19].x;
POW R4.z, R4.z, c[19].x;
POW R4.y, R4.y, c[19].x;
MAD R0.xyz, R0, -R4, R4;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
POW R3.x, R3.x, c[18].x;
POW R3.y, R3.y, c[18].x;
POW R3.z, R3.z, c[18].x;
MAD R3.xyz, R2, -R3, R3;
ADD R5.xyz, R3, R0;
RSQ R0.x, R0.w;
DP3 R0.w, c[2], c[2];
RSQ R1.w, R0.w;
MUL R3.xyz, R1.w, c[2];
MUL R0.xyz, R0.x, fragment.texcoord[2];
DP3 R0.w, -R1, R0;
MUL R4.xyz, R0, R0.w;
ADD R6.xyz, R1, R3;
MAD R1.xyz, -R4, c[21].y, -R1;
DP3 R0.w, R6, R6;
TEX R1.xyz, R1, texture[3], CUBE;
MUL R4.xyz, R1, c[12].x;
ADD R1.xyz, R5, R4;
RSQ R0.w, R0.w;
MUL R6.xyz, R0.w, R6;
DP3 R0.w, R0, R6;
MAD R6.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R6.xyz, R6, texture[5], 2D;
MAD R4.xyz, R6, c[11], R4;
MOV R1.w, c[23].y;
MAX R2.w, R0, c[21].x;
MUL R0.w, R1, c[5].x;
ADD R1.w, R0, c[21].z;
TXP R5.x, fragment.texcoord[5], texture[0], 2D;
MUL R0.w, R5.x, c[21].y;
EX2 R1.w, R1.w;
FLR R3.w, R0;
POW R1.w, R2.w, R1.w;
MUL R5.xyz, R3.w, c[3];
MUL R5.xyz, R5, R1.w;
DP3 R1.w, R0, R3;
MOV R6.xy, c[21].yzzw;
ADD R0.x, R6.y, -c[8];
MAD R0.xyz, R2, R0.x, R4;
MUL R5.xyz, R1, R5;
MAX R1.w, R1, c[21].x;
MUL R2.xyz, R6.x, c[0];
MUL R3.xyz, R0.w, c[3];
MAD R2.xyz, R1.w, R3, R2;
MAD R0.xyz, R2, R0, R5;
MAD result.color.xyz, R1, c[13].x, R0;
MOV result.color.w, c[21].z;
END
# 90 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 104 math, 7 textures
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
Float 12 [_Reflectioncubemappower]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Reflectioncubemap] CUBE 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
dcl_2d s5
def c21, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c22, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c23, -0.31830987, 1.00000000, 0.00000000, 2.00000000
def c24, 10.00000000, 1.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
add r1.xyz, -v1, c1
dp3 r0.x, r1, r1
rsq r0.x, r0.x
mul r0.xyz, r0.x, r1
mov r0.w, c16.x
dp3 r1.x, r0, v3
dp3 r1.y, r0, v4
mul r1.xy, r1, -c16.x
mad r1.zw, r1.xyxy, c21.x, v0.xyxy
add r2.xy, r1.zwzw, c21.y
mul r1.zw, r2.y, c21
mad r1.zw, r2.x, c22.xyxy, r1
add r1.zw, r1, c22.z
mov r2.x, c16
mad r0.w, r0, c22.z, c22
mad r1.xy, -r1, c21.x, v0
mul r1.xy, r1, r0.w
mov r0.w, c10.x
mul r3.xyz, c14, r0.w
mul r1.xy, r1, c15.x
dp3_pp r0.w, c2, c2
mad r2.x, r2, c23, c23.y
mul r1.zw, r1, c15.x
mul r1.zw, r1, r2.x
mul r2.xy, r1.zwzw, c20.x
mad r1.xy, r1, c17, c17.zwzw
texld r1.xyz, r1, s2
mul r3.xyz, r3, r1
mad r1.xy, r2, c17, c17.zwzw
pow r4, r3.x, c18.x
pow r5, r3.y, c18.x
mov r3.x, r4
mad r2.xy, v0, c4, c4.zwzw
texld r1.xyz, r1, s2
texld r2.xyz, r2, s1
add r1.xyz, -r1, c22.w
max r1.xyz, r1, r2
mul r1.xyz, r1, c8.x
mad r4.xy, v0, c7, c7.zwzw
mov r3.y, r5
texld r5.xyz, r4, s4
mul r5.xyz, r5, c9.x
pow r4, r3.z, c18.x
pow r6, r5.x, c19.x
mov r3.z, r4
pow r4, r5.z, c19.x
mov r5.x, r6
pow r6, r5.y, c19.x
mad r3.xyz, r1, -r3, r3
mov r5.z, r4
mov r5.y, r6
mad r2.xyz, r2, -r5, r5
add r4.xyz, r3, r2
rsq_pp r0.w, r0.w
mul_pp r2.xyz, r0.w, c2
dp3 r1.w, v2, v2
rsq r0.w, r1.w
mul r3.xyz, r0.w, v2
add r5.xyz, r0, r2
dp3 r1.w, r3, -r0
mul r6.xyz, r3, r1.w
dp3 r0.w, r5, r5
rsq r0.w, r0.w
mul r5.xyz, r0.w, r5
dp3 r1.w, r3, r5
mov r0.w, c5.x
mad r0.w, r0, c24.x, c24.y
mad r0.xyz, -r6, c23.w, -r0
exp r2.w, r0.w
texldp r5.x, v5, s0
mul_pp r0.w, r5.x, c23
max r1.w, r1, c23.z
pow r5, r1.w, r2.w
frc r1.w, r0
add r2.w, r0, -r1
mov r1.w, r5.x
mul r5.xyz, r2.w, c3
mul r6.xyz, r5, r1.w
texld r5.xyz, r0, s3
mad r0.xyz, r5, c12.x, r4
mul r4.xyz, r0, r6
mad r6.xy, v0, c6, c6.zwzw
mov r1.w, c8.x
add r1.w, c22, -r1
mul r5.xyz, r5, c12.x
texld r6.xyz, r6, s5
mad r5.xyz, r6, c11, r5
mad r1.xyz, r1, r1.w, r5
dp3 r1.w, r3, r2
mov r2.xyz, c0
max r1.w, r1, c23.z
mul r2.xyz, c23.w, r2
mul r3.xyz, r0.w, c3
mad r2.xyz, r1.w, r3, r2
mad r1.xyz, r2, r1, r4
mad oC0.xyz, r0, c13.x, r1
mov_pp oC0.w, c22
"
}
SubProgram "d3d11 " {
// Stats: 77 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 5
SetTexture 3 [_Reflectioncubemap] CUBE 4
SetTexture 4 [_Specularglitter] 2D 3
SetTexture 5 [_MainTex] 2D 2
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Float 192 [_Reflectioncubemappower]
Float 196 [_Fakelight]
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
eefiecedfmfbpjokkphmkbpjhalnlbhihccfdnegabaaaaaadianaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcaaamaaaaeaaaaaaaaaadaaaa
fjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaad
aagabaaaafaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafidaaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
agaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaa
aaaaaadpabeaaaaaaaaaiadpdiaaaaalgcaabaaaaaaaaaaafgifcaaaaaaaaaaa
aoaaaaaaaceaaaaaaaaaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaajhcaabaaa
abaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaa
acaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaa
dcaaaaajpcaabaaaadaaaaaafgakbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaa
abaaaaaadiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaadaaaaaa
aaaaaaakdcaabaaaadaaaaaaogakbaaaadaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaaoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaafaaaaaadiaaaaajhcaabaaa
aaaaaaaakgikcaaaaaaaaaaaakaaaaaaegiccaaaaaaaaaaaanaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaaaaaaaacpaaaaafhcaabaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
agiacaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
apaaaaakbcaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaadaaaaaaegaabaaa
aeaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
adaaaaaaegaabaaaadaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaadaaaaaapgapbaaaabaaaaaaegaabaaaadaaaaaa
diaaaaaidcaabaaaadaaaaaaegaabaaaadaaaaaakgikcaaaaaaaaaaabaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegaabaaaadaaaaaaegiacaaaaaaaaaaaapaaaaaa
ogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaacaaaaaaaagabaaaafaaaaaaaaaaaaalhcaabaaaadaaaaaaegacbaia
ebaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaadeaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaaaaeaaaaaadiaaaaaihcaabaaaadaaaaaaegacbaaaadaaaaaaagiacaaa
aaaaaaaaakaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaia
ebaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaaj
pcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaaeaaaaaaaagabaaaadaaaaaa
diaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaaakaaaaaa
cpaaaaafhcaabaaaafaaaaaaegacbaaaafaaaaaadiaaaaaihcaabaaaafaaaaaa
egacbaaaafaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaafaaaaaa
egacbaaaafaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaia
ebaaaaaaafaaaaaaegacbaaaafaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaaeaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaabaaaaaaiicaabaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaaegacbaaaaeaaaaaaaaaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaacaaaaaa
egacbaaaaeaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
efaaaaajpcaabaaaacaaaaaaegacbaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
aeaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaa
amaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
agiacaaaaaaaaaaaamaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaaihcaabaaaafaaaaaapgapbaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaafaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaa
afaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakccaabaaa
abaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadp
bjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaabkaabaaaabaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaaaoaaaaahgcaabaaaabaaaaaaagbbbaaaagaaaaaapgbpbaaaagaaaaaa
efaaaaajpcaabaaaaeaaaaaajgafbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaaaaaaaaahccaabaaaabaaaaaaakaabaaaaeaaaaaaakaabaaaaeaaaaaa
ebaaaaafecaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaaihcaabaaaaeaaaaaa
fgafbaaaabaaaaaaegiccaaaaaaaaaaaafaaaaaadiaaaaaiocaabaaaabaaaaaa
kgakbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaabaaaaaa
agaabaaaabaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaa
afaaaaaaegaabaaaafaaaaaaeghobaaaafaaaaaaaagabaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegacbaaaafaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaa
acaaaaaaaaaaaaajicaabaaaabaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaa
abeaaaaaaaaaiadpdcaaaaajhcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaacaaaaaaaaaaaaajhcaabaaaadaaaaaaegiccaaaadaaaaaa
aeaaaaaaegiccaaaadaaaaaaaeaaaaaadcaaaaajhcaabaaaadaaaaaapgapbaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaa
egacbaaaadaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
aaaaaaaaegacbaaaaaaaaaaafgifcaaaaaaaaaaaamaaaaaaegacbaaaabaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
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
// Stats: 90 math, 7 textures
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
Float 12 [_Reflectioncubemappower]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Reflectioncubemap] CUBE 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"3.0-!!ARBfp1.0
PARAM c[24] = { state.lightmodel.ambient,
		program.local[1..20],
		{ 0, 2, 1, 0.050000001 },
		{ 0.5, -0.99999875, -0.001592548, 0.001592548 },
		{ 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
ADD R1.xyz, -fragment.texcoord[1], c[1];
DP3 R0.x, R1, R1;
RSQ R0.x, R0.x;
MUL R1.xyz, R0.x, R1;
MOV R4.xyz, c[14];
MUL R4.xyz, R4, c[10].x;
DP3 R0.x, R1, fragment.texcoord[3];
DP3 R0.y, fragment.texcoord[4], R1;
MUL R3.xy, R0, -c[16].x;
MAD R0.xy, R3, c[21].w, fragment.texcoord[0];
ADD R0.zw, R0.xyxy, -c[22].x;
MUL R0.xy, R0.w, c[22].wyzw;
MAD R2.xy, R0.z, c[22].yzzw, R0;
MOV R0.w, c[16].x;
MUL R0.x, R0.w, -c[23];
ADD R2.xy, R2, c[22].x;
MAD R3.zw, fragment.texcoord[0].xyxy, c[4].xyxy, c[4];
MUL R2.xy, R2, c[15].x;
ADD R0.x, R0, c[21].z;
MUL R0.xy, R2, R0.x;
MUL R0.xy, R0, c[20].x;
MAD R0.xy, R0, c[17], c[17].zwzw;
TEX R0.xyz, R0, texture[2], 2D;
ADD R2.xyz, -R0, c[21].z;
MUL R0.x, R0.w, c[22];
MAD R0.zw, -R3.xyxy, c[21].w, fragment.texcoord[0].xyxy;
ADD R0.x, R0, c[21].z;
MUL R3.xy, R0.zwzw, R0.x;
TEX R0.xyz, R3.zwzw, texture[1], 2D;
MAX R2.xyz, R2, R0;
MUL R3.xy, R3, c[15].x;
MAD R3.xy, R3, c[17], c[17].zwzw;
TEX R3.xyz, R3, texture[2], 2D;
MUL R3.xyz, R4, R3;
MAD R4.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R4.xyz, R4, texture[4], 2D;
MUL R4.xyz, R4, c[9].x;
MUL R2.xyz, R2, c[8].x;
POW R4.x, R4.x, c[19].x;
POW R4.z, R4.z, c[19].x;
POW R4.y, R4.y, c[19].x;
MAD R0.xyz, R0, -R4, R4;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
POW R3.x, R3.x, c[18].x;
POW R3.y, R3.y, c[18].x;
POW R3.z, R3.z, c[18].x;
MAD R3.xyz, R2, -R3, R3;
ADD R5.xyz, R3, R0;
RSQ R0.x, R0.w;
DP3 R0.w, c[2], c[2];
RSQ R1.w, R0.w;
MUL R3.xyz, R1.w, c[2];
MUL R0.xyz, R0.x, fragment.texcoord[2];
DP3 R0.w, -R1, R0;
MUL R4.xyz, R0, R0.w;
ADD R6.xyz, R1, R3;
MAD R1.xyz, -R4, c[21].y, -R1;
DP3 R0.w, R6, R6;
TEX R1.xyz, R1, texture[3], CUBE;
MUL R4.xyz, R1, c[12].x;
ADD R1.xyz, R5, R4;
RSQ R0.w, R0.w;
MUL R6.xyz, R0.w, R6;
DP3 R0.w, R0, R6;
MAD R6.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R6.xyz, R6, texture[5], 2D;
MAD R4.xyz, R6, c[11], R4;
MOV R1.w, c[23].y;
MAX R2.w, R0, c[21].x;
MUL R0.w, R1, c[5].x;
ADD R1.w, R0, c[21].z;
TXP R5.x, fragment.texcoord[5], texture[0], 2D;
MUL R0.w, R5.x, c[21].y;
EX2 R1.w, R1.w;
FLR R3.w, R0;
POW R1.w, R2.w, R1.w;
MUL R5.xyz, R3.w, c[3];
MUL R5.xyz, R5, R1.w;
DP3 R1.w, R0, R3;
MOV R6.xy, c[21].yzzw;
ADD R0.x, R6.y, -c[8];
MAD R0.xyz, R2, R0.x, R4;
MUL R5.xyz, R1, R5;
MAX R1.w, R1, c[21].x;
MUL R2.xyz, R6.x, c[0];
MUL R3.xyz, R0.w, c[3];
MAD R2.xyz, R1.w, R3, R2;
MAD R0.xyz, R2, R0, R5;
MAD result.color.xyz, R1, c[13].x, R0;
MOV result.color.w, c[21].z;
END
# 90 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 104 math, 7 textures
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
Float 12 [_Reflectioncubemappower]
Float 13 [_Fakelight]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Reflectioncubemap] CUBE 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
dcl_2d s5
def c21, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c22, -0.99999875, -0.00159374, 0.50000000, 1.00000000
def c23, -0.31830987, 1.00000000, 0.00000000, 2.00000000
def c24, 10.00000000, 1.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
add r1.xyz, -v1, c1
dp3 r0.x, r1, r1
rsq r0.x, r0.x
mul r0.xyz, r0.x, r1
mov r0.w, c16.x
dp3 r1.x, r0, v3
dp3 r1.y, r0, v4
mul r1.xy, r1, -c16.x
mad r1.zw, r1.xyxy, c21.x, v0.xyxy
add r2.xy, r1.zwzw, c21.y
mul r1.zw, r2.y, c21
mad r1.zw, r2.x, c22.xyxy, r1
add r1.zw, r1, c22.z
mov r2.x, c16
mad r0.w, r0, c22.z, c22
mad r1.xy, -r1, c21.x, v0
mul r1.xy, r1, r0.w
mov r0.w, c10.x
mul r3.xyz, c14, r0.w
mul r1.xy, r1, c15.x
dp3_pp r0.w, c2, c2
mad r2.x, r2, c23, c23.y
mul r1.zw, r1, c15.x
mul r1.zw, r1, r2.x
mul r2.xy, r1.zwzw, c20.x
mad r1.xy, r1, c17, c17.zwzw
texld r1.xyz, r1, s2
mul r3.xyz, r3, r1
mad r1.xy, r2, c17, c17.zwzw
pow r4, r3.x, c18.x
pow r5, r3.y, c18.x
mov r3.x, r4
mad r2.xy, v0, c4, c4.zwzw
texld r1.xyz, r1, s2
texld r2.xyz, r2, s1
add r1.xyz, -r1, c22.w
max r1.xyz, r1, r2
mul r1.xyz, r1, c8.x
mad r4.xy, v0, c7, c7.zwzw
mov r3.y, r5
texld r5.xyz, r4, s4
mul r5.xyz, r5, c9.x
pow r4, r3.z, c18.x
pow r6, r5.x, c19.x
mov r3.z, r4
pow r4, r5.z, c19.x
mov r5.x, r6
pow r6, r5.y, c19.x
mad r3.xyz, r1, -r3, r3
mov r5.z, r4
mov r5.y, r6
mad r2.xyz, r2, -r5, r5
add r4.xyz, r3, r2
rsq_pp r0.w, r0.w
mul_pp r2.xyz, r0.w, c2
dp3 r1.w, v2, v2
rsq r0.w, r1.w
mul r3.xyz, r0.w, v2
add r5.xyz, r0, r2
dp3 r1.w, r3, -r0
mul r6.xyz, r3, r1.w
dp3 r0.w, r5, r5
rsq r0.w, r0.w
mul r5.xyz, r0.w, r5
dp3 r1.w, r3, r5
mov r0.w, c5.x
mad r0.w, r0, c24.x, c24.y
mad r0.xyz, -r6, c23.w, -r0
exp r2.w, r0.w
texldp r5.x, v5, s0
mul_pp r0.w, r5.x, c23
max r1.w, r1, c23.z
pow r5, r1.w, r2.w
frc r1.w, r0
add r2.w, r0, -r1
mov r1.w, r5.x
mul r5.xyz, r2.w, c3
mul r6.xyz, r5, r1.w
texld r5.xyz, r0, s3
mad r0.xyz, r5, c12.x, r4
mul r4.xyz, r0, r6
mad r6.xy, v0, c6, c6.zwzw
mov r1.w, c8.x
add r1.w, c22, -r1
mul r5.xyz, r5, c12.x
texld r6.xyz, r6, s5
mad r5.xyz, r6, c11, r5
mad r1.xyz, r1, r1.w, r5
dp3 r1.w, r3, r2
mov r2.xyz, c0
max r1.w, r1, c23.z
mul r2.xyz, c23.w, r2
mul r3.xyz, r0.w, c3
mad r2.xyz, r1.w, r3, r2
mad r1.xyz, r2, r1, r4
mad oC0.xyz, r0, c13.x, r1
mov_pp oC0.w, c22
"
}
SubProgram "d3d11 " {
// Stats: 77 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 5
SetTexture 3 [_Reflectioncubemap] CUBE 4
SetTexture 4 [_Specularglitter] 2D 3
SetTexture 5 [_MainTex] 2D 2
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Float 192 [_Reflectioncubemappower]
Float 196 [_Fakelight]
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
eefiecedfmfbpjokkphmkbpjhalnlbhihccfdnegabaaaaaadianaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcaaamaaaaeaaaaaaaaaadaaaa
fjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaad
aagabaaaafaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafidaaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
agaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaa
aaaaaadpabeaaaaaaaaaiadpdiaaaaalgcaabaaaaaaaaaaafgifcaaaaaaaaaaa
aoaaaaaaaceaaaaaaaaaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaajhcaabaaa
abaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaa
acaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaa
dcaaaaajpcaabaaaadaaaaaafgakbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaa
abaaaaaadiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaadaaaaaa
aaaaaaakdcaabaaaadaaaaaaogakbaaaadaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaaoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaafaaaaaadiaaaaajhcaabaaa
aaaaaaaakgikcaaaaaaaaaaaakaaaaaaegiccaaaaaaaaaaaanaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaaaaaaaacpaaaaafhcaabaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
agiacaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
apaaaaakbcaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaadaaaaaaegaabaaa
aeaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
adaaaaaaegaabaaaadaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaadaaaaaapgapbaaaabaaaaaaegaabaaaadaaaaaa
diaaaaaidcaabaaaadaaaaaaegaabaaaadaaaaaakgikcaaaaaaaaaaabaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegaabaaaadaaaaaaegiacaaaaaaaaaaaapaaaaaa
ogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaacaaaaaaaagabaaaafaaaaaaaaaaaaalhcaabaaaadaaaaaaegacbaia
ebaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaadeaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaaaaeaaaaaadiaaaaaihcaabaaaadaaaaaaegacbaaaadaaaaaaagiacaaa
aaaaaaaaakaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaia
ebaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaaj
pcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaaeaaaaaaaagabaaaadaaaaaa
diaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaaakaaaaaa
cpaaaaafhcaabaaaafaaaaaaegacbaaaafaaaaaadiaaaaaihcaabaaaafaaaaaa
egacbaaaafaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaafaaaaaa
egacbaaaafaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaia
ebaaaaaaafaaaaaaegacbaaaafaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaaeaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaabaaaaaaiicaabaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaaegacbaaaaeaaaaaaaaaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaacaaaaaa
egacbaaaaeaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
efaaaaajpcaabaaaacaaaaaaegacbaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
aeaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaa
amaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
agiacaaaaaaaaaaaamaaaaaabaaaaaajicaabaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaaihcaabaaaafaaaaaapgapbaaaabaaaaaaegiccaaaacaaaaaa
aaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaafaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaa
afaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakccaabaaa
abaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadp
bjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaabkaabaaaabaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaaaoaaaaahgcaabaaaabaaaaaaagbbbaaaagaaaaaapgbpbaaaagaaaaaa
efaaaaajpcaabaaaaeaaaaaajgafbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaaaaaaaaahccaabaaaabaaaaaaakaabaaaaeaaaaaaakaabaaaaeaaaaaa
ebaaaaafecaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaaihcaabaaaaeaaaaaa
fgafbaaaabaaaaaaegiccaaaaaaaaaaaafaaaaaadiaaaaaiocaabaaaabaaaaaa
kgakbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaabaaaaaa
agaabaaaabaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaa
afaaaaaaegaabaaaafaaaaaaeghobaaaafaaaaaaaagabaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegacbaaaafaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaa
acaaaaaaaaaaaaajicaabaaaabaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaa
abeaaaaaaaaaiadpdcaaaaajhcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaa
adaaaaaaegacbaaaacaaaaaaaaaaaaajhcaabaaaadaaaaaaegiccaaaadaaaaaa
aeaaaaaaegiccaaaadaaaaaaaeaaaaaadcaaaaajhcaabaaaadaaaaaapgapbaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaa
egacbaaaadaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
aaaaaaaaegacbaaaaaaaaaaafgifcaaaaaaaaaaaamaaaaaaegacbaaaabaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
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
 //       d3d11 : 79 avg math (72..89), 8 avg texture (6..12)
 //        d3d9 : 107 avg math (98..118), 8 avg texture (6..12)
 //      opengl : 96 avg math (85..110), 8 avg texture (6..12)
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
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp float tmpvar_11;
  tmpvar_11 = (texture2D (_LightTexture0, vec2(tmpvar_10)).w * 2.0);
  attenuation_3 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_13;
  tmpvar_13[0].x = -0.999999;
  tmpvar_13[0].y = 0.00159255;
  tmpvar_13[1].x = -0.00159255;
  tmpvar_13[1].y = -0.999999;
  lowp vec4 tmpvar_14;
  highp vec2 P_15;
  P_15 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_14 = texture2D (_Mask, P_15);
  node_1540_2 = tmpvar_14;
  highp vec2 P_16;
  P_16 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_13) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_17;
  arg0_17 = (1.0 - texture2D (_Glittermap, P_16).xyz);
  highp vec3 tmpvar_18;
  tmpvar_18 = (max (arg0_17, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_19;
  tmpvar_19 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_27.xyz = (((max (0.0, dot (tmpvar_4, tmpvar_9)) * tmpvar_12) * (((tmpvar_25.xyz * _Color.xyz) + tmpvar_20) + ((1.0 - _MasktransparencyDebug) * tmpvar_18))) + ((tmpvar_12 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_9)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_18) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_20)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp float tmpvar_11;
  tmpvar_11 = (texture2D (_LightTexture0, vec2(tmpvar_10)).w * 2.0);
  attenuation_3 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_13;
  tmpvar_13[0].x = -0.999999;
  tmpvar_13[0].y = 0.00159255;
  tmpvar_13[1].x = -0.00159255;
  tmpvar_13[1].y = -0.999999;
  lowp vec4 tmpvar_14;
  highp vec2 P_15;
  P_15 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_14 = texture2D (_Mask, P_15);
  node_1540_2 = tmpvar_14;
  highp vec2 P_16;
  P_16 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_13) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_17;
  arg0_17 = (1.0 - texture2D (_Glittermap, P_16).xyz);
  highp vec3 tmpvar_18;
  tmpvar_18 = (max (arg0_17, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_19;
  tmpvar_19 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_27.xyz = (((max (0.0, dot (tmpvar_4, tmpvar_9)) * tmpvar_12) * (((tmpvar_25.xyz * _Color.xyz) + tmpvar_20) + ((1.0 - _MasktransparencyDebug) * tmpvar_18))) + ((tmpvar_12 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_9)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_18) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_20)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp float tmpvar_11;
  tmpvar_11 = (texture (_LightTexture0, vec2(tmpvar_10)).w * 2.0);
  attenuation_3 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_13;
  tmpvar_13[0].x = -0.999999;
  tmpvar_13[0].y = 0.00159255;
  tmpvar_13[1].x = -0.00159255;
  tmpvar_13[1].y = -0.999999;
  lowp vec4 tmpvar_14;
  highp vec2 P_15;
  P_15 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_14 = texture (_Mask, P_15);
  node_1540_2 = tmpvar_14;
  highp vec2 P_16;
  P_16 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_13) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_17;
  arg0_17 = (1.0 - texture (_Glittermap, P_16).xyz);
  highp vec3 tmpvar_18;
  tmpvar_18 = (max (arg0_17, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_27.xyz = (((max (0.0, dot (tmpvar_4, tmpvar_9)) * tmpvar_12) * (((tmpvar_25.xyz * _Color.xyz) + tmpvar_20) + ((1.0 - _MasktransparencyDebug) * tmpvar_18))) + ((tmpvar_12 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_9)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_18) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_20)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = (2.0 * _LightColor0.xyz);
  highp mat2 tmpvar_10;
  tmpvar_10[0].x = -0.999999;
  tmpvar_10[0].y = 0.00159255;
  tmpvar_10[1].x = -0.00159255;
  tmpvar_10[1].y = -0.999999;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_11 = texture2D (_Mask, P_12);
  node_1540_2 = tmpvar_11;
  highp vec2 P_13;
  P_13 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_10) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_14;
  arg0_14 = (1.0 - texture2D (_Glittermap, P_13).xyz);
  highp vec3 tmpvar_15;
  tmpvar_15 = (max (arg0_14, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_16;
  tmpvar_16 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_24.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_9) * (((tmpvar_22.xyz * _Color.xyz) + tmpvar_17) + ((1.0 - _MasktransparencyDebug) * tmpvar_15))) + ((tmpvar_9 * pow (max (0.0, dot (normalize((tmpvar_5 + tmpvar_8)), tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_15) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_17)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = (2.0 * _LightColor0.xyz);
  highp mat2 tmpvar_10;
  tmpvar_10[0].x = -0.999999;
  tmpvar_10[0].y = 0.00159255;
  tmpvar_10[1].x = -0.00159255;
  tmpvar_10[1].y = -0.999999;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_11 = texture2D (_Mask, P_12);
  node_1540_2 = tmpvar_11;
  highp vec2 P_13;
  P_13 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_10) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_14;
  arg0_14 = (1.0 - texture2D (_Glittermap, P_13).xyz);
  highp vec3 tmpvar_15;
  tmpvar_15 = (max (arg0_14, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_16;
  tmpvar_16 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_24.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_9) * (((tmpvar_22.xyz * _Color.xyz) + tmpvar_17) + ((1.0 - _MasktransparencyDebug) * tmpvar_15))) + ((tmpvar_9 * pow (max (0.0, dot (normalize((tmpvar_5 + tmpvar_8)), tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_15) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_17)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = (2.0 * _LightColor0.xyz);
  highp mat2 tmpvar_10;
  tmpvar_10[0].x = -0.999999;
  tmpvar_10[0].y = 0.00159255;
  tmpvar_10[1].x = -0.00159255;
  tmpvar_10[1].y = -0.999999;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_11 = texture (_Mask, P_12);
  node_1540_2 = tmpvar_11;
  highp vec2 P_13;
  P_13 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_10) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_14;
  arg0_14 = (1.0 - texture (_Glittermap, P_13).xyz);
  highp vec3 tmpvar_15;
  tmpvar_15 = (max (arg0_14, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_18;
  highp vec2 P_19;
  P_19 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_24.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_9) * (((tmpvar_22.xyz * _Color.xyz) + tmpvar_17) + ((1.0 - _MasktransparencyDebug) * tmpvar_15))) + ((tmpvar_9 * pow (max (0.0, dot (normalize((tmpvar_5 + tmpvar_8)), tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_18.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_15) + mix (pow ((tmpvar_20.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_17)));
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
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp vec4 tmpvar_9;
  highp vec2 P_10;
  P_10 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_9 = texture2D (_LightTexture0, P_10);
  highp float tmpvar_11;
  tmpvar_11 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_LightTextureB0, vec2(tmpvar_11));
  highp vec3 tmpvar_13;
  tmpvar_13 = ((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_9.w) * tmpvar_12.w) * 2.0) * _LightColor0.xyz);
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
  P_17 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_14) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_18;
  arg0_18 = (1.0 - texture2D (_Glittermap, P_17).xyz);
  highp vec3 tmpvar_19;
  tmpvar_19 = (max (arg0_18, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_20;
  tmpvar_20 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_20.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_28.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_13) * (((tmpvar_26.xyz * _Color.xyz) + tmpvar_21) + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + ((tmpvar_13 * pow (max (0.0, dot (normalize((tmpvar_5 + tmpvar_8)), tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_22.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_19) + mix (pow ((tmpvar_24.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_21)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp vec4 tmpvar_9;
  highp vec2 P_10;
  P_10 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_9 = texture2D (_LightTexture0, P_10);
  highp float tmpvar_11;
  tmpvar_11 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_LightTextureB0, vec2(tmpvar_11));
  highp vec3 tmpvar_13;
  tmpvar_13 = ((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_9.w) * tmpvar_12.w) * 2.0) * _LightColor0.xyz);
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
  P_17 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_14) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_18;
  arg0_18 = (1.0 - texture2D (_Glittermap, P_17).xyz);
  highp vec3 tmpvar_19;
  tmpvar_19 = (max (arg0_18, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_20;
  tmpvar_20 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_20.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_28.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_13) * (((tmpvar_26.xyz * _Color.xyz) + tmpvar_21) + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + ((tmpvar_13 * pow (max (0.0, dot (normalize((tmpvar_5 + tmpvar_8)), tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_22.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_19) + mix (pow ((tmpvar_24.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_21)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp vec4 tmpvar_9;
  highp vec2 P_10;
  P_10 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_9 = texture (_LightTexture0, P_10);
  highp float tmpvar_11;
  tmpvar_11 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_LightTextureB0, vec2(tmpvar_11));
  highp vec3 tmpvar_13;
  tmpvar_13 = ((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_9.w) * tmpvar_12.w) * 2.0) * _LightColor0.xyz);
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
  P_17 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_14) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_18;
  arg0_18 = (1.0 - texture (_Glittermap, P_17).xyz);
  highp vec3 tmpvar_19;
  tmpvar_19 = (max (arg0_18, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_20.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_22;
  highp vec2 P_23;
  P_23 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_28.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_13) * (((tmpvar_26.xyz * _Color.xyz) + tmpvar_21) + ((1.0 - _MasktransparencyDebug) * tmpvar_19))) + ((tmpvar_13 * pow (max (0.0, dot (normalize((tmpvar_5 + tmpvar_8)), tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_22.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_19) + mix (pow ((tmpvar_24.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_21)));
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
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp float tmpvar_11;
  tmpvar_11 = ((texture2D (_LightTextureB0, vec2(tmpvar_10)).w * textureCube (_LightTexture0, xlv_TEXCOORD5).w) * 2.0);
  attenuation_3 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_13;
  tmpvar_13[0].x = -0.999999;
  tmpvar_13[0].y = 0.00159255;
  tmpvar_13[1].x = -0.00159255;
  tmpvar_13[1].y = -0.999999;
  lowp vec4 tmpvar_14;
  highp vec2 P_15;
  P_15 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_14 = texture2D (_Mask, P_15);
  node_1540_2 = tmpvar_14;
  highp vec2 P_16;
  P_16 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_13) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_17;
  arg0_17 = (1.0 - texture2D (_Glittermap, P_16).xyz);
  highp vec3 tmpvar_18;
  tmpvar_18 = (max (arg0_17, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_19;
  tmpvar_19 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_27.xyz = (((max (0.0, dot (tmpvar_4, tmpvar_9)) * tmpvar_12) * (((tmpvar_25.xyz * _Color.xyz) + tmpvar_20) + ((1.0 - _MasktransparencyDebug) * tmpvar_18))) + ((tmpvar_12 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_9)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_18) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_20)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp float tmpvar_11;
  tmpvar_11 = ((texture2D (_LightTextureB0, vec2(tmpvar_10)).w * textureCube (_LightTexture0, xlv_TEXCOORD5).w) * 2.0);
  attenuation_3 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_13;
  tmpvar_13[0].x = -0.999999;
  tmpvar_13[0].y = 0.00159255;
  tmpvar_13[1].x = -0.00159255;
  tmpvar_13[1].y = -0.999999;
  lowp vec4 tmpvar_14;
  highp vec2 P_15;
  P_15 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_14 = texture2D (_Mask, P_15);
  node_1540_2 = tmpvar_14;
  highp vec2 P_16;
  P_16 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_13) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_17;
  arg0_17 = (1.0 - texture2D (_Glittermap, P_16).xyz);
  highp vec3 tmpvar_18;
  tmpvar_18 = (max (arg0_17, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_19;
  tmpvar_19 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_27.xyz = (((max (0.0, dot (tmpvar_4, tmpvar_9)) * tmpvar_12) * (((tmpvar_25.xyz * _Color.xyz) + tmpvar_20) + ((1.0 - _MasktransparencyDebug) * tmpvar_18))) + ((tmpvar_12 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_9)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_18) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_20)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp float tmpvar_11;
  tmpvar_11 = ((texture (_LightTextureB0, vec2(tmpvar_10)).w * texture (_LightTexture0, xlv_TEXCOORD5).w) * 2.0);
  attenuation_3 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_13;
  tmpvar_13[0].x = -0.999999;
  tmpvar_13[0].y = 0.00159255;
  tmpvar_13[1].x = -0.00159255;
  tmpvar_13[1].y = -0.999999;
  lowp vec4 tmpvar_14;
  highp vec2 P_15;
  P_15 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_14 = texture (_Mask, P_15);
  node_1540_2 = tmpvar_14;
  highp vec2 P_16;
  P_16 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_13) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_17;
  arg0_17 = (1.0 - texture (_Glittermap, P_16).xyz);
  highp vec3 tmpvar_18;
  tmpvar_18 = (max (arg0_17, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_19.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_21;
  highp vec2 P_22;
  P_22 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_27.xyz = (((max (0.0, dot (tmpvar_4, tmpvar_9)) * tmpvar_12) * (((tmpvar_25.xyz * _Color.xyz) + tmpvar_20) + ((1.0 - _MasktransparencyDebug) * tmpvar_18))) + ((tmpvar_12 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_9)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_21.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_18) + mix (pow ((tmpvar_23.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_20)));
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
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_10;
  tmpvar_10 = (texture2D (_LightTexture0, xlv_TEXCOORD5).w * 2.0);
  attenuation_3 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (attenuation_3 * _LightColor0.xyz);
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
  tmpvar_18 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_26.xyz = (((max (0.0, dot (tmpvar_4, tmpvar_9)) * tmpvar_11) * (((tmpvar_24.xyz * _Color.xyz) + tmpvar_19) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + ((tmpvar_11 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_9)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_19)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_10;
  tmpvar_10 = (texture2D (_LightTexture0, xlv_TEXCOORD5).w * 2.0);
  attenuation_3 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (attenuation_3 * _LightColor0.xyz);
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
  tmpvar_18 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_26.xyz = (((max (0.0, dot (tmpvar_4, tmpvar_9)) * tmpvar_11) * (((tmpvar_24.xyz * _Color.xyz) + tmpvar_19) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + ((tmpvar_11 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_9)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_19)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_10;
  tmpvar_10 = (texture (_LightTexture0, xlv_TEXCOORD5).w * 2.0);
  attenuation_3 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (attenuation_3 * _LightColor0.xyz);
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
  tmpvar_18 = texture (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_26.xyz = (((max (0.0, dot (tmpvar_4, tmpvar_9)) * tmpvar_11) * (((tmpvar_24.xyz * _Color.xyz) + tmpvar_19) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + ((tmpvar_11 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_9)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_19)));
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
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_10 = texture2D (_LightTexture0, P_11);
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTextureB0, vec2(tmpvar_12));
  lowp float tmpvar_14;
  mediump float shadow_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6);
  highp float tmpvar_17;
  if ((tmpvar_16.x < (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))) {
    tmpvar_17 = _LightShadowData.x;
  } else {
    tmpvar_17 = 1.0;
  };
  shadow_15 = tmpvar_17;
  tmpvar_14 = shadow_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_10.w) * tmpvar_13.w) * tmpvar_14) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_19;
  tmpvar_19[0].x = -0.999999;
  tmpvar_19[0].y = 0.00159255;
  tmpvar_19[1].x = -0.00159255;
  tmpvar_19[1].y = -0.999999;
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_20 = texture2D (_Mask, P_21);
  node_1540_2 = tmpvar_20;
  highp vec2 P_22;
  P_22 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_19) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_23;
  arg0_23 = (1.0 - texture2D (_Glittermap, P_22).xyz);
  highp vec3 tmpvar_24;
  tmpvar_24 = (max (arg0_23, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_25;
  tmpvar_25 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_27;
  highp vec2 P_28;
  P_28 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_33.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_18) * (((tmpvar_31.xyz * _Color.xyz) + tmpvar_26) + ((1.0 - _MasktransparencyDebug) * tmpvar_24))) + ((tmpvar_18 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_24) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_26)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_10 = texture2D (_LightTexture0, P_11);
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTextureB0, vec2(tmpvar_12));
  lowp float tmpvar_14;
  mediump float shadow_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6);
  highp float tmpvar_17;
  if ((tmpvar_16.x < (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))) {
    tmpvar_17 = _LightShadowData.x;
  } else {
    tmpvar_17 = 1.0;
  };
  shadow_15 = tmpvar_17;
  tmpvar_14 = shadow_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_10.w) * tmpvar_13.w) * tmpvar_14) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_19;
  tmpvar_19[0].x = -0.999999;
  tmpvar_19[0].y = 0.00159255;
  tmpvar_19[1].x = -0.00159255;
  tmpvar_19[1].y = -0.999999;
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_20 = texture2D (_Mask, P_21);
  node_1540_2 = tmpvar_20;
  highp vec2 P_22;
  P_22 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_19) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_23;
  arg0_23 = (1.0 - texture2D (_Glittermap, P_22).xyz);
  highp vec3 tmpvar_24;
  tmpvar_24 = (max (arg0_23, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_25;
  tmpvar_25 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_27;
  highp vec2 P_28;
  P_28 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_33.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_18) * (((tmpvar_31.xyz * _Color.xyz) + tmpvar_26) + ((1.0 - _MasktransparencyDebug) * tmpvar_24))) + ((tmpvar_18 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_24) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_26)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_10 = texture (_LightTexture0, P_11);
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_LightTextureB0, vec2(tmpvar_12));
  lowp float tmpvar_14;
  mediump float shadow_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = textureProj (_ShadowMapTexture, xlv_TEXCOORD6);
  highp float tmpvar_17;
  if ((tmpvar_16.x < (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))) {
    tmpvar_17 = _LightShadowData.x;
  } else {
    tmpvar_17 = 1.0;
  };
  shadow_15 = tmpvar_17;
  tmpvar_14 = shadow_15;
  highp vec3 tmpvar_18;
  tmpvar_18 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_10.w) * tmpvar_13.w) * tmpvar_14) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_19;
  tmpvar_19[0].x = -0.999999;
  tmpvar_19[0].y = 0.00159255;
  tmpvar_19[1].x = -0.00159255;
  tmpvar_19[1].y = -0.999999;
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_20 = texture (_Mask, P_21);
  node_1540_2 = tmpvar_20;
  highp vec2 P_22;
  P_22 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_19) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_23;
  arg0_23 = (1.0 - texture (_Glittermap, P_22).xyz);
  highp vec3 tmpvar_24;
  tmpvar_24 = (max (arg0_23, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_27;
  highp vec2 P_28;
  P_28 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_33.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_18) * (((tmpvar_31.xyz * _Color.xyz) + tmpvar_26) + ((1.0 - _MasktransparencyDebug) * tmpvar_24))) + ((tmpvar_18 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_24) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_26)));
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
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp vec4 tmpvar_9;
  highp vec2 P_10;
  P_10 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_9 = texture2D (_LightTexture0, P_10);
  highp float tmpvar_11;
  tmpvar_11 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_LightTextureB0, vec2(tmpvar_11));
  lowp float tmpvar_13;
  mediump float shadow_14;
  lowp float tmpvar_15;
  tmpvar_15 = shadow2DProjEXT (_ShadowMapTexture, xlv_TEXCOORD6);
  shadow_14 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = (_LightShadowData.x + (shadow_14 * (1.0 - _LightShadowData.x)));
  shadow_14 = tmpvar_16;
  tmpvar_13 = shadow_14;
  highp vec3 tmpvar_17;
  tmpvar_17 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_9.w) * tmpvar_12.w) * tmpvar_13) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_18;
  tmpvar_18[0].x = -0.999999;
  tmpvar_18[0].y = 0.00159255;
  tmpvar_18[1].x = -0.00159255;
  tmpvar_18[1].y = -0.999999;
  lowp vec4 tmpvar_19;
  highp vec2 P_20;
  P_20 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_19 = texture2D (_Mask, P_20);
  node_1540_2 = tmpvar_19;
  highp vec2 P_21;
  P_21 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_18) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_22;
  arg0_22 = (1.0 - texture2D (_Glittermap, P_21).xyz);
  highp vec3 tmpvar_23;
  tmpvar_23 = (max (arg0_22, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_17) * (((tmpvar_30.xyz * _Color.xyz) + tmpvar_25) + ((1.0 - _MasktransparencyDebug) * tmpvar_23))) + ((tmpvar_17 * pow (max (0.0, dot (normalize((tmpvar_5 + tmpvar_8)), tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_23) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_25)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp vec4 tmpvar_9;
  highp vec2 P_10;
  P_10 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_9 = texture (_LightTexture0, P_10);
  highp float tmpvar_11;
  tmpvar_11 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_LightTextureB0, vec2(tmpvar_11));
  lowp float tmpvar_13;
  mediump float shadow_14;
  mediump float tmpvar_15;
  tmpvar_15 = textureProj (_ShadowMapTexture, xlv_TEXCOORD6);
  highp float tmpvar_16;
  tmpvar_16 = (_LightShadowData.x + (tmpvar_15 * (1.0 - _LightShadowData.x)));
  shadow_14 = tmpvar_16;
  tmpvar_13 = shadow_14;
  highp vec3 tmpvar_17;
  tmpvar_17 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_9.w) * tmpvar_12.w) * tmpvar_13) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_18;
  tmpvar_18[0].x = -0.999999;
  tmpvar_18[0].y = 0.00159255;
  tmpvar_18[1].x = -0.00159255;
  tmpvar_18[1].y = -0.999999;
  lowp vec4 tmpvar_19;
  highp vec2 P_20;
  P_20 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_19 = texture (_Mask, P_20);
  node_1540_2 = tmpvar_19;
  highp vec2 P_21;
  P_21 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_18) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_22;
  arg0_22 = (1.0 - texture (_Glittermap, P_21).xyz);
  highp vec3 tmpvar_23;
  tmpvar_23 = (max (arg0_22, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_17) * (((tmpvar_30.xyz * _Color.xyz) + tmpvar_25) + ((1.0 - _MasktransparencyDebug) * tmpvar_23))) + ((tmpvar_17 * pow (max (0.0, dot (normalize((tmpvar_5 + tmpvar_8)), tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_23) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_25)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_10;
  mediump float lightShadowDataX_11;
  highp float dist_12;
  lowp float tmpvar_13;
  tmpvar_13 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_12 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = _LightShadowData.x;
  lightShadowDataX_11 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (float((dist_12 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_11);
  tmpvar_10 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_10 * 2.0);
  attenuation_3 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_18;
  tmpvar_18[0].x = -0.999999;
  tmpvar_18[0].y = 0.00159255;
  tmpvar_18[1].x = -0.00159255;
  tmpvar_18[1].y = -0.999999;
  lowp vec4 tmpvar_19;
  highp vec2 P_20;
  P_20 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_19 = texture2D (_Mask, P_20);
  node_1540_2 = tmpvar_19;
  highp vec2 P_21;
  P_21 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_18) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_22;
  arg0_22 = (1.0 - texture2D (_Glittermap, P_21).xyz);
  highp vec3 tmpvar_23;
  tmpvar_23 = (max (arg0_22, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz * _Reflectioncubemappower);
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
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_4, tmpvar_9)) * tmpvar_17) * (((tmpvar_30.xyz * _Color.xyz) + tmpvar_25) + ((1.0 - _MasktransparencyDebug) * tmpvar_23))) + ((tmpvar_17 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_9)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_23) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_25)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_10;
  tmpvar_10 = (texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x * 2.0);
  attenuation_3 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (attenuation_3 * _LightColor0.xyz);
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
  tmpvar_18 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_26.xyz = (((max (0.0, dot (tmpvar_4, tmpvar_9)) * tmpvar_11) * (((tmpvar_24.xyz * _Color.xyz) + tmpvar_19) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + ((tmpvar_11 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_9)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_19)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_10;
  mediump float lightShadowDataX_11;
  highp float dist_12;
  lowp float tmpvar_13;
  tmpvar_13 = textureProj (_ShadowMapTexture, xlv_TEXCOORD5).x;
  dist_12 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = _LightShadowData.x;
  lightShadowDataX_11 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (float((dist_12 > (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w))), lightShadowDataX_11);
  tmpvar_10 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = (tmpvar_10 * 2.0);
  attenuation_3 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_18;
  tmpvar_18[0].x = -0.999999;
  tmpvar_18[0].y = 0.00159255;
  tmpvar_18[1].x = -0.00159255;
  tmpvar_18[1].y = -0.999999;
  lowp vec4 tmpvar_19;
  highp vec2 P_20;
  P_20 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_19 = texture (_Mask, P_20);
  node_1540_2 = tmpvar_19;
  highp vec2 P_21;
  P_21 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_18) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_22;
  arg0_22 = (1.0 - texture (_Glittermap, P_21).xyz);
  highp vec3 tmpvar_23;
  tmpvar_23 = (max (arg0_22, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz * _Reflectioncubemappower);
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
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_4, tmpvar_9)) * tmpvar_17) * (((tmpvar_30.xyz * _Color.xyz) + tmpvar_25) + ((1.0 - _MasktransparencyDebug) * tmpvar_23))) + ((tmpvar_17 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_9)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_23) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_25)));
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
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_10;
  mediump float lightShadowDataX_11;
  highp float dist_12;
  lowp float tmpvar_13;
  tmpvar_13 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  dist_12 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = _LightShadowData.x;
  lightShadowDataX_11 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (float((dist_12 > (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))), lightShadowDataX_11);
  tmpvar_10 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = ((texture2D (_LightTexture0, xlv_TEXCOORD5).w * tmpvar_10) * 2.0);
  attenuation_3 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_18;
  tmpvar_18[0].x = -0.999999;
  tmpvar_18[0].y = 0.00159255;
  tmpvar_18[1].x = -0.00159255;
  tmpvar_18[1].y = -0.999999;
  lowp vec4 tmpvar_19;
  highp vec2 P_20;
  P_20 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_19 = texture2D (_Mask, P_20);
  node_1540_2 = tmpvar_19;
  highp vec2 P_21;
  P_21 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_18) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_22;
  arg0_22 = (1.0 - texture2D (_Glittermap, P_21).xyz);
  highp vec3 tmpvar_23;
  tmpvar_23 = (max (arg0_22, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz * _Reflectioncubemappower);
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
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_4, tmpvar_9)) * tmpvar_17) * (((tmpvar_30.xyz * _Color.xyz) + tmpvar_25) + ((1.0 - _MasktransparencyDebug) * tmpvar_23))) + ((tmpvar_17 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_9)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_23) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_25)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_10;
  tmpvar_10 = ((texture2D (_LightTexture0, xlv_TEXCOORD5).w * texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x) * 2.0);
  attenuation_3 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (attenuation_3 * _LightColor0.xyz);
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
  tmpvar_18 = textureCube (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_18.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_26.xyz = (((max (0.0, dot (tmpvar_4, tmpvar_9)) * tmpvar_11) * (((tmpvar_24.xyz * _Color.xyz) + tmpvar_19) + ((1.0 - _MasktransparencyDebug) * tmpvar_17))) + ((tmpvar_11 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_9)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_20.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_17) + mix (pow ((tmpvar_22.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_19)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_7;
  highp vec3 i_8;
  i_8 = -(tmpvar_6);
  tmpvar_7 = (i_8 - (2.0 * (dot (tmpvar_4, i_8) * tmpvar_4)));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp float tmpvar_10;
  mediump float lightShadowDataX_11;
  highp float dist_12;
  lowp float tmpvar_13;
  tmpvar_13 = textureProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  dist_12 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = _LightShadowData.x;
  lightShadowDataX_11 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = max (float((dist_12 > (xlv_TEXCOORD6.z / xlv_TEXCOORD6.w))), lightShadowDataX_11);
  tmpvar_10 = tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_16 = ((texture (_LightTexture0, xlv_TEXCOORD5).w * tmpvar_10) * 2.0);
  attenuation_3 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (attenuation_3 * _LightColor0.xyz);
  highp mat2 tmpvar_18;
  tmpvar_18[0].x = -0.999999;
  tmpvar_18[0].y = 0.00159255;
  tmpvar_18[1].x = -0.00159255;
  tmpvar_18[1].y = -0.999999;
  lowp vec4 tmpvar_19;
  highp vec2 P_20;
  P_20 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_19 = texture (_Mask, P_20);
  node_1540_2 = tmpvar_19;
  highp vec2 P_21;
  P_21 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_5 * tmpvar_6).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_18) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_22;
  arg0_22 = (1.0 - texture (_Glittermap, P_21).xyz);
  highp vec3 tmpvar_23;
  tmpvar_23 = (max (arg0_22, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Reflectioncubemap, tmpvar_7);
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz * _Reflectioncubemappower);
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
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_4, tmpvar_9)) * tmpvar_17) * (((tmpvar_30.xyz * _Color.xyz) + tmpvar_25) + ((1.0 - _MasktransparencyDebug) * tmpvar_23))) + ((tmpvar_17 * pow (max (0.0, dot (normalize((tmpvar_6 + tmpvar_9)), tmpvar_4)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_23) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_25)));
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
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_LightTexture0, vec2(tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec4 packDist_13;
  lowp vec4 tmpvar_14;
  tmpvar_14 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  packDist_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (packDist_13, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp float tmpvar_16;
  if ((tmpvar_15 < tmpvar_12)) {
    tmpvar_16 = _LightShadowData.x;
  } else {
    tmpvar_16 = 1.0;
  };
  highp vec3 tmpvar_17;
  tmpvar_17 = (((tmpvar_11.w * tmpvar_16) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_18;
  tmpvar_18[0].x = -0.999999;
  tmpvar_18[0].y = 0.00159255;
  tmpvar_18[1].x = -0.00159255;
  tmpvar_18[1].y = -0.999999;
  lowp vec4 tmpvar_19;
  highp vec2 P_20;
  P_20 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_19 = texture2D (_Mask, P_20);
  node_1540_2 = tmpvar_19;
  highp vec2 P_21;
  P_21 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_18) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_22;
  arg0_22 = (1.0 - texture2D (_Glittermap, P_21).xyz);
  highp vec3 tmpvar_23;
  tmpvar_23 = (max (arg0_22, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_17) * (((tmpvar_30.xyz * _Color.xyz) + tmpvar_25) + ((1.0 - _MasktransparencyDebug) * tmpvar_23))) + ((tmpvar_17 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_23) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_25)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_LightTexture0, vec2(tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec4 packDist_13;
  lowp vec4 tmpvar_14;
  tmpvar_14 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  packDist_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (packDist_13, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp float tmpvar_16;
  if ((tmpvar_15 < tmpvar_12)) {
    tmpvar_16 = _LightShadowData.x;
  } else {
    tmpvar_16 = 1.0;
  };
  highp vec3 tmpvar_17;
  tmpvar_17 = (((tmpvar_11.w * tmpvar_16) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_18;
  tmpvar_18[0].x = -0.999999;
  tmpvar_18[0].y = 0.00159255;
  tmpvar_18[1].x = -0.00159255;
  tmpvar_18[1].y = -0.999999;
  lowp vec4 tmpvar_19;
  highp vec2 P_20;
  P_20 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_19 = texture2D (_Mask, P_20);
  node_1540_2 = tmpvar_19;
  highp vec2 P_21;
  P_21 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_18) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_22;
  arg0_22 = (1.0 - texture2D (_Glittermap, P_21).xyz);
  highp vec3 tmpvar_23;
  tmpvar_23 = (max (arg0_22, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_17) * (((tmpvar_30.xyz * _Color.xyz) + tmpvar_25) + ((1.0 - _MasktransparencyDebug) * tmpvar_23))) + ((tmpvar_17 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_23) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_25)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_LightTexture0, vec2(tmpvar_10));
  highp float tmpvar_12;
  tmpvar_12 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec4 packDist_13;
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture (_ShadowMapTexture, xlv_TEXCOORD6);
  packDist_13 = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (packDist_13, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp float tmpvar_16;
  if ((tmpvar_15 < tmpvar_12)) {
    tmpvar_16 = _LightShadowData.x;
  } else {
    tmpvar_16 = 1.0;
  };
  highp vec3 tmpvar_17;
  tmpvar_17 = (((tmpvar_11.w * tmpvar_16) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_18;
  tmpvar_18[0].x = -0.999999;
  tmpvar_18[0].y = 0.00159255;
  tmpvar_18[1].x = -0.00159255;
  tmpvar_18[1].y = -0.999999;
  lowp vec4 tmpvar_19;
  highp vec2 P_20;
  P_20 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_19 = texture (_Mask, P_20);
  node_1540_2 = tmpvar_19;
  highp vec2 P_21;
  P_21 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_18) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_22;
  arg0_22 = (1.0 - texture (_Glittermap, P_21).xyz);
  highp vec3 tmpvar_23;
  tmpvar_23 = (max (arg0_22, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_24.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_26;
  highp vec2 P_27;
  P_27 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_32.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_17) * (((tmpvar_30.xyz * _Color.xyz) + tmpvar_25) + ((1.0 - _MasktransparencyDebug) * tmpvar_23))) + ((tmpvar_17 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_26.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_23) + mix (pow ((tmpvar_28.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_25)));
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
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_LightTextureB0, vec2(tmpvar_10));
  lowp vec4 tmpvar_12;
  tmpvar_12 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  highp float tmpvar_13;
  tmpvar_13 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec4 packDist_14;
  lowp vec4 tmpvar_15;
  tmpvar_15 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  packDist_14 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (packDist_14, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp float tmpvar_17;
  if ((tmpvar_16 < tmpvar_13)) {
    tmpvar_17 = _LightShadowData.x;
  } else {
    tmpvar_17 = 1.0;
  };
  highp vec3 tmpvar_18;
  tmpvar_18 = ((((tmpvar_11.w * tmpvar_12.w) * tmpvar_17) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_19;
  tmpvar_19[0].x = -0.999999;
  tmpvar_19[0].y = 0.00159255;
  tmpvar_19[1].x = -0.00159255;
  tmpvar_19[1].y = -0.999999;
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_20 = texture2D (_Mask, P_21);
  node_1540_2 = tmpvar_20;
  highp vec2 P_22;
  P_22 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_19) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_23;
  arg0_23 = (1.0 - texture2D (_Glittermap, P_22).xyz);
  highp vec3 tmpvar_24;
  tmpvar_24 = (max (arg0_23, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_25;
  tmpvar_25 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_27;
  highp vec2 P_28;
  P_28 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_33.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_18) * (((tmpvar_31.xyz * _Color.xyz) + tmpvar_26) + ((1.0 - _MasktransparencyDebug) * tmpvar_24))) + ((tmpvar_18 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_24) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_26)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_LightTextureB0, vec2(tmpvar_10));
  lowp vec4 tmpvar_12;
  tmpvar_12 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  highp float tmpvar_13;
  tmpvar_13 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec4 packDist_14;
  lowp vec4 tmpvar_15;
  tmpvar_15 = textureCube (_ShadowMapTexture, xlv_TEXCOORD6);
  packDist_14 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (packDist_14, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp float tmpvar_17;
  if ((tmpvar_16 < tmpvar_13)) {
    tmpvar_17 = _LightShadowData.x;
  } else {
    tmpvar_17 = 1.0;
  };
  highp vec3 tmpvar_18;
  tmpvar_18 = ((((tmpvar_11.w * tmpvar_12.w) * tmpvar_17) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_19;
  tmpvar_19[0].x = -0.999999;
  tmpvar_19[0].y = 0.00159255;
  tmpvar_19[1].x = -0.00159255;
  tmpvar_19[1].y = -0.999999;
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_20 = texture2D (_Mask, P_21);
  node_1540_2 = tmpvar_20;
  highp vec2 P_22;
  P_22 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_19) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_23;
  arg0_23 = (1.0 - texture2D (_Glittermap, P_22).xyz);
  highp vec3 tmpvar_24;
  tmpvar_24 = (max (arg0_23, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_25;
  tmpvar_25 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_27;
  highp vec2 P_28;
  P_28 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_33.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_18) * (((tmpvar_31.xyz * _Color.xyz) + tmpvar_26) + ((1.0 - _MasktransparencyDebug) * tmpvar_24))) + ((tmpvar_18 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_24) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_26)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_LightTextureB0, vec2(tmpvar_10));
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_LightTexture0, xlv_TEXCOORD5);
  highp float tmpvar_13;
  tmpvar_13 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec4 packDist_14;
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture (_ShadowMapTexture, xlv_TEXCOORD6);
  packDist_14 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (packDist_14, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp float tmpvar_17;
  if ((tmpvar_16 < tmpvar_13)) {
    tmpvar_17 = _LightShadowData.x;
  } else {
    tmpvar_17 = 1.0;
  };
  highp vec3 tmpvar_18;
  tmpvar_18 = ((((tmpvar_11.w * tmpvar_12.w) * tmpvar_17) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_19;
  tmpvar_19[0].x = -0.999999;
  tmpvar_19[0].y = 0.00159255;
  tmpvar_19[1].x = -0.00159255;
  tmpvar_19[1].y = -0.999999;
  lowp vec4 tmpvar_20;
  highp vec2 P_21;
  P_21 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_20 = texture (_Mask, P_21);
  node_1540_2 = tmpvar_20;
  highp vec2 P_22;
  P_22 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_19) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_23;
  arg0_23 = (1.0 - texture (_Glittermap, P_22).xyz);
  highp vec3 tmpvar_24;
  tmpvar_24 = (max (arg0_23, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_27;
  highp vec2 P_28;
  P_28 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_33.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_18) * (((tmpvar_31.xyz * _Color.xyz) + tmpvar_26) + ((1.0 - _MasktransparencyDebug) * tmpvar_24))) + ((tmpvar_18 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_27.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_24) + mix (pow ((tmpvar_29.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_26)));
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
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_10 = texture2D (_LightTexture0, P_11);
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTextureB0, vec2(tmpvar_12));
  lowp float tmpvar_14;
  mediump vec4 shadows_15;
  highp vec4 shadowVals_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD6.xyz / xlv_TEXCOORD6.w);
  highp vec2 P_18;
  P_18 = (tmpvar_17.xy + _ShadowOffsets[0].xy);
  lowp float tmpvar_19;
  tmpvar_19 = texture2D (_ShadowMapTexture, P_18).x;
  shadowVals_16.x = tmpvar_19;
  highp vec2 P_20;
  P_20 = (tmpvar_17.xy + _ShadowOffsets[1].xy);
  lowp float tmpvar_21;
  tmpvar_21 = texture2D (_ShadowMapTexture, P_20).x;
  shadowVals_16.y = tmpvar_21;
  highp vec2 P_22;
  P_22 = (tmpvar_17.xy + _ShadowOffsets[2].xy);
  lowp float tmpvar_23;
  tmpvar_23 = texture2D (_ShadowMapTexture, P_22).x;
  shadowVals_16.z = tmpvar_23;
  highp vec2 P_24;
  P_24 = (tmpvar_17.xy + _ShadowOffsets[3].xy);
  lowp float tmpvar_25;
  tmpvar_25 = texture2D (_ShadowMapTexture, P_24).x;
  shadowVals_16.w = tmpvar_25;
  bvec4 tmpvar_26;
  tmpvar_26 = lessThan (shadowVals_16, tmpvar_17.zzzz);
  highp vec4 tmpvar_27;
  tmpvar_27 = _LightShadowData.xxxx;
  highp float tmpvar_28;
  if (tmpvar_26.x) {
    tmpvar_28 = tmpvar_27.x;
  } else {
    tmpvar_28 = 1.0;
  };
  highp float tmpvar_29;
  if (tmpvar_26.y) {
    tmpvar_29 = tmpvar_27.y;
  } else {
    tmpvar_29 = 1.0;
  };
  highp float tmpvar_30;
  if (tmpvar_26.z) {
    tmpvar_30 = tmpvar_27.z;
  } else {
    tmpvar_30 = 1.0;
  };
  highp float tmpvar_31;
  if (tmpvar_26.w) {
    tmpvar_31 = tmpvar_27.w;
  } else {
    tmpvar_31 = 1.0;
  };
  highp vec4 tmpvar_32;
  tmpvar_32.x = tmpvar_28;
  tmpvar_32.y = tmpvar_29;
  tmpvar_32.z = tmpvar_30;
  tmpvar_32.w = tmpvar_31;
  shadows_15 = tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = dot (shadows_15, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_14 = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_10.w) * tmpvar_13.w) * tmpvar_14) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_35;
  tmpvar_35[0].x = -0.999999;
  tmpvar_35[0].y = 0.00159255;
  tmpvar_35[1].x = -0.00159255;
  tmpvar_35[1].y = -0.999999;
  lowp vec4 tmpvar_36;
  highp vec2 P_37;
  P_37 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_36 = texture2D (_Mask, P_37);
  node_1540_2 = tmpvar_36;
  highp vec2 P_38;
  P_38 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_35) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_39;
  arg0_39 = (1.0 - texture2D (_Glittermap, P_38).xyz);
  highp vec3 tmpvar_40;
  tmpvar_40 = (max (arg0_39, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_41;
  tmpvar_41 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_42;
  tmpvar_42 = (tmpvar_41.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_43;
  highp vec2 P_44;
  P_44 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_49.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_34) * (((tmpvar_47.xyz * _Color.xyz) + tmpvar_42) + ((1.0 - _MasktransparencyDebug) * tmpvar_40))) + ((tmpvar_34 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_43.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_40) + mix (pow ((tmpvar_45.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_42)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_10 = texture2D (_LightTexture0, P_11);
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_LightTextureB0, vec2(tmpvar_12));
  lowp float tmpvar_14;
  mediump vec4 shadows_15;
  highp vec4 shadowVals_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD6.xyz / xlv_TEXCOORD6.w);
  highp vec2 P_18;
  P_18 = (tmpvar_17.xy + _ShadowOffsets[0].xy);
  lowp float tmpvar_19;
  tmpvar_19 = texture2D (_ShadowMapTexture, P_18).x;
  shadowVals_16.x = tmpvar_19;
  highp vec2 P_20;
  P_20 = (tmpvar_17.xy + _ShadowOffsets[1].xy);
  lowp float tmpvar_21;
  tmpvar_21 = texture2D (_ShadowMapTexture, P_20).x;
  shadowVals_16.y = tmpvar_21;
  highp vec2 P_22;
  P_22 = (tmpvar_17.xy + _ShadowOffsets[2].xy);
  lowp float tmpvar_23;
  tmpvar_23 = texture2D (_ShadowMapTexture, P_22).x;
  shadowVals_16.z = tmpvar_23;
  highp vec2 P_24;
  P_24 = (tmpvar_17.xy + _ShadowOffsets[3].xy);
  lowp float tmpvar_25;
  tmpvar_25 = texture2D (_ShadowMapTexture, P_24).x;
  shadowVals_16.w = tmpvar_25;
  bvec4 tmpvar_26;
  tmpvar_26 = lessThan (shadowVals_16, tmpvar_17.zzzz);
  highp vec4 tmpvar_27;
  tmpvar_27 = _LightShadowData.xxxx;
  highp float tmpvar_28;
  if (tmpvar_26.x) {
    tmpvar_28 = tmpvar_27.x;
  } else {
    tmpvar_28 = 1.0;
  };
  highp float tmpvar_29;
  if (tmpvar_26.y) {
    tmpvar_29 = tmpvar_27.y;
  } else {
    tmpvar_29 = 1.0;
  };
  highp float tmpvar_30;
  if (tmpvar_26.z) {
    tmpvar_30 = tmpvar_27.z;
  } else {
    tmpvar_30 = 1.0;
  };
  highp float tmpvar_31;
  if (tmpvar_26.w) {
    tmpvar_31 = tmpvar_27.w;
  } else {
    tmpvar_31 = 1.0;
  };
  highp vec4 tmpvar_32;
  tmpvar_32.x = tmpvar_28;
  tmpvar_32.y = tmpvar_29;
  tmpvar_32.z = tmpvar_30;
  tmpvar_32.w = tmpvar_31;
  shadows_15 = tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = dot (shadows_15, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_14 = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_10.w) * tmpvar_13.w) * tmpvar_14) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_35;
  tmpvar_35[0].x = -0.999999;
  tmpvar_35[0].y = 0.00159255;
  tmpvar_35[1].x = -0.00159255;
  tmpvar_35[1].y = -0.999999;
  lowp vec4 tmpvar_36;
  highp vec2 P_37;
  P_37 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_36 = texture2D (_Mask, P_37);
  node_1540_2 = tmpvar_36;
  highp vec2 P_38;
  P_38 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_35) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_39;
  arg0_39 = (1.0 - texture2D (_Glittermap, P_38).xyz);
  highp vec3 tmpvar_40;
  tmpvar_40 = (max (arg0_39, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_41;
  tmpvar_41 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_42;
  tmpvar_42 = (tmpvar_41.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_43;
  highp vec2 P_44;
  P_44 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_49.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_34) * (((tmpvar_47.xyz * _Color.xyz) + tmpvar_42) + ((1.0 - _MasktransparencyDebug) * tmpvar_40))) + ((tmpvar_34 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_43.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_40) + mix (pow ((tmpvar_45.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_42)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_10 = texture (_LightTexture0, P_11);
  highp float tmpvar_12;
  tmpvar_12 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_LightTextureB0, vec2(tmpvar_12));
  lowp float tmpvar_14;
  mediump vec4 shadows_15;
  highp vec4 shadowVals_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD6.xyz / xlv_TEXCOORD6.w);
  highp vec2 P_18;
  P_18 = (tmpvar_17.xy + _ShadowOffsets[0].xy);
  lowp float tmpvar_19;
  tmpvar_19 = texture (_ShadowMapTexture, P_18).x;
  shadowVals_16.x = tmpvar_19;
  highp vec2 P_20;
  P_20 = (tmpvar_17.xy + _ShadowOffsets[1].xy);
  lowp float tmpvar_21;
  tmpvar_21 = texture (_ShadowMapTexture, P_20).x;
  shadowVals_16.y = tmpvar_21;
  highp vec2 P_22;
  P_22 = (tmpvar_17.xy + _ShadowOffsets[2].xy);
  lowp float tmpvar_23;
  tmpvar_23 = texture (_ShadowMapTexture, P_22).x;
  shadowVals_16.z = tmpvar_23;
  highp vec2 P_24;
  P_24 = (tmpvar_17.xy + _ShadowOffsets[3].xy);
  lowp float tmpvar_25;
  tmpvar_25 = texture (_ShadowMapTexture, P_24).x;
  shadowVals_16.w = tmpvar_25;
  bvec4 tmpvar_26;
  tmpvar_26 = lessThan (shadowVals_16, tmpvar_17.zzzz);
  highp vec4 tmpvar_27;
  tmpvar_27 = _LightShadowData.xxxx;
  highp float tmpvar_28;
  if (tmpvar_26.x) {
    tmpvar_28 = tmpvar_27.x;
  } else {
    tmpvar_28 = 1.0;
  };
  highp float tmpvar_29;
  if (tmpvar_26.y) {
    tmpvar_29 = tmpvar_27.y;
  } else {
    tmpvar_29 = 1.0;
  };
  highp float tmpvar_30;
  if (tmpvar_26.z) {
    tmpvar_30 = tmpvar_27.z;
  } else {
    tmpvar_30 = 1.0;
  };
  highp float tmpvar_31;
  if (tmpvar_26.w) {
    tmpvar_31 = tmpvar_27.w;
  } else {
    tmpvar_31 = 1.0;
  };
  highp vec4 tmpvar_32;
  tmpvar_32.x = tmpvar_28;
  tmpvar_32.y = tmpvar_29;
  tmpvar_32.z = tmpvar_30;
  tmpvar_32.w = tmpvar_31;
  shadows_15 = tmpvar_32;
  mediump float tmpvar_33;
  tmpvar_33 = dot (shadows_15, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_14 = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_10.w) * tmpvar_13.w) * tmpvar_14) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_35;
  tmpvar_35[0].x = -0.999999;
  tmpvar_35[0].y = 0.00159255;
  tmpvar_35[1].x = -0.00159255;
  tmpvar_35[1].y = -0.999999;
  lowp vec4 tmpvar_36;
  highp vec2 P_37;
  P_37 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_36 = texture (_Mask, P_37);
  node_1540_2 = tmpvar_36;
  highp vec2 P_38;
  P_38 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_35) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_39;
  arg0_39 = (1.0 - texture (_Glittermap, P_38).xyz);
  highp vec3 tmpvar_40;
  tmpvar_40 = (max (arg0_39, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_41;
  tmpvar_41 = texture (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_42;
  tmpvar_42 = (tmpvar_41.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_43;
  highp vec2 P_44;
  P_44 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_49.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_34) * (((tmpvar_47.xyz * _Color.xyz) + tmpvar_42) + ((1.0 - _MasktransparencyDebug) * tmpvar_40))) + ((tmpvar_34 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_43.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_40) + mix (pow ((tmpvar_45.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_42)));
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
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp vec4 tmpvar_9;
  highp vec2 P_10;
  P_10 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_9 = texture2D (_LightTexture0, P_10);
  highp float tmpvar_11;
  tmpvar_11 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_LightTextureB0, vec2(tmpvar_11));
  lowp float tmpvar_13;
  mediump vec4 shadows_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD6.xyz / xlv_TEXCOORD6.w);
  highp vec3 coord_16;
  coord_16 = (tmpvar_15 + _ShadowOffsets[0].xyz);
  lowp float tmpvar_17;
  tmpvar_17 = shadow2DEXT (_ShadowMapTexture, coord_16);
  shadows_14.x = tmpvar_17;
  highp vec3 coord_18;
  coord_18 = (tmpvar_15 + _ShadowOffsets[1].xyz);
  lowp float tmpvar_19;
  tmpvar_19 = shadow2DEXT (_ShadowMapTexture, coord_18);
  shadows_14.y = tmpvar_19;
  highp vec3 coord_20;
  coord_20 = (tmpvar_15 + _ShadowOffsets[2].xyz);
  lowp float tmpvar_21;
  tmpvar_21 = shadow2DEXT (_ShadowMapTexture, coord_20);
  shadows_14.z = tmpvar_21;
  highp vec3 coord_22;
  coord_22 = (tmpvar_15 + _ShadowOffsets[3].xyz);
  lowp float tmpvar_23;
  tmpvar_23 = shadow2DEXT (_ShadowMapTexture, coord_22);
  shadows_14.w = tmpvar_23;
  highp vec4 tmpvar_24;
  tmpvar_24 = (_LightShadowData.xxxx + (shadows_14 * (1.0 - _LightShadowData.xxxx)));
  shadows_14 = tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = dot (shadows_14, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_13 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_9.w) * tmpvar_12.w) * tmpvar_13) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_27;
  tmpvar_27[0].x = -0.999999;
  tmpvar_27[0].y = 0.00159255;
  tmpvar_27[1].x = -0.00159255;
  tmpvar_27[1].y = -0.999999;
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_28 = texture2D (_Mask, P_29);
  node_1540_2 = tmpvar_28;
  highp vec2 P_30;
  P_30 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_27) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_31;
  arg0_31 = (1.0 - texture2D (_Glittermap, P_30).xyz);
  highp vec3 tmpvar_32;
  tmpvar_32 = (max (arg0_31, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_33;
  tmpvar_33 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_34;
  tmpvar_34 = (tmpvar_33.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_35;
  highp vec2 P_36;
  P_36 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_41.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_26) * (((tmpvar_39.xyz * _Color.xyz) + tmpvar_34) + ((1.0 - _MasktransparencyDebug) * tmpvar_32))) + ((tmpvar_26 * pow (max (0.0, dot (normalize((tmpvar_5 + tmpvar_8)), tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_35.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_32) + mix (pow ((tmpvar_37.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_34)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  lowp vec4 tmpvar_9;
  highp vec2 P_10;
  P_10 = ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5);
  tmpvar_9 = texture (_LightTexture0, P_10);
  highp float tmpvar_11;
  tmpvar_11 = dot (xlv_TEXCOORD5.xyz, xlv_TEXCOORD5.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_LightTextureB0, vec2(tmpvar_11));
  lowp float tmpvar_13;
  mediump vec4 shadows_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD6.xyz / xlv_TEXCOORD6.w);
  highp vec3 coord_16;
  coord_16 = (tmpvar_15 + _ShadowOffsets[0].xyz);
  mediump float tmpvar_17;
  tmpvar_17 = texture (_ShadowMapTexture, coord_16);
  shadows_14.x = tmpvar_17;
  highp vec3 coord_18;
  coord_18 = (tmpvar_15 + _ShadowOffsets[1].xyz);
  mediump float tmpvar_19;
  tmpvar_19 = texture (_ShadowMapTexture, coord_18);
  shadows_14.y = tmpvar_19;
  highp vec3 coord_20;
  coord_20 = (tmpvar_15 + _ShadowOffsets[2].xyz);
  mediump float tmpvar_21;
  tmpvar_21 = texture (_ShadowMapTexture, coord_20);
  shadows_14.z = tmpvar_21;
  highp vec3 coord_22;
  coord_22 = (tmpvar_15 + _ShadowOffsets[3].xyz);
  mediump float tmpvar_23;
  tmpvar_23 = texture (_ShadowMapTexture, coord_22);
  shadows_14.w = tmpvar_23;
  highp vec4 tmpvar_24;
  tmpvar_24 = (_LightShadowData.xxxx + (shadows_14 * (1.0 - _LightShadowData.xxxx)));
  shadows_14 = tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = dot (shadows_14, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_13 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (((((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_9.w) * tmpvar_12.w) * tmpvar_13) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_27;
  tmpvar_27[0].x = -0.999999;
  tmpvar_27[0].y = 0.00159255;
  tmpvar_27[1].x = -0.00159255;
  tmpvar_27[1].y = -0.999999;
  lowp vec4 tmpvar_28;
  highp vec2 P_29;
  P_29 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_28 = texture (_Mask, P_29);
  node_1540_2 = tmpvar_28;
  highp vec2 P_30;
  P_30 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_27) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_31;
  arg0_31 = (1.0 - texture (_Glittermap, P_30).xyz);
  highp vec3 tmpvar_32;
  tmpvar_32 = (max (arg0_31, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_34;
  tmpvar_34 = (tmpvar_33.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_35;
  highp vec2 P_36;
  P_36 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_41.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_26) * (((tmpvar_39.xyz * _Color.xyz) + tmpvar_34) + ((1.0 - _MasktransparencyDebug) * tmpvar_32))) + ((tmpvar_26 * pow (max (0.0, dot (normalize((tmpvar_5 + tmpvar_8)), tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_35.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_32) + mix (pow ((tmpvar_37.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_34)));
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
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_LightTexture0, vec2(tmpvar_10));
  highp float tmpvar_12;
  mediump vec4 shadows_13;
  highp vec4 shadowVals_14;
  highp float tmpvar_15;
  tmpvar_15 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec3 vec_16;
  vec_16 = (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125));
  highp vec4 packDist_17;
  lowp vec4 tmpvar_18;
  tmpvar_18 = textureCube (_ShadowMapTexture, vec_16);
  packDist_17 = tmpvar_18;
  shadowVals_14.x = dot (packDist_17, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_19;
  vec_19 = (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125));
  highp vec4 packDist_20;
  lowp vec4 tmpvar_21;
  tmpvar_21 = textureCube (_ShadowMapTexture, vec_19);
  packDist_20 = tmpvar_21;
  shadowVals_14.y = dot (packDist_20, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_22;
  vec_22 = (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125));
  highp vec4 packDist_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureCube (_ShadowMapTexture, vec_22);
  packDist_23 = tmpvar_24;
  shadowVals_14.z = dot (packDist_23, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_25;
  vec_25 = (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125));
  highp vec4 packDist_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = textureCube (_ShadowMapTexture, vec_25);
  packDist_26 = tmpvar_27;
  shadowVals_14.w = dot (packDist_26, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  bvec4 tmpvar_28;
  tmpvar_28 = lessThan (shadowVals_14, vec4(tmpvar_15));
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
  shadows_13 = tmpvar_34;
  mediump float tmpvar_35;
  tmpvar_35 = dot (shadows_13, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_12 = tmpvar_35;
  highp vec3 tmpvar_36;
  tmpvar_36 = (((tmpvar_11.w * tmpvar_12) * 2.0) * _LightColor0.xyz);
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
  P_40 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_37) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_41;
  arg0_41 = (1.0 - texture2D (_Glittermap, P_40).xyz);
  highp vec3 tmpvar_42;
  tmpvar_42 = (max (arg0_41, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_43;
  tmpvar_43 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_44;
  tmpvar_44 = (tmpvar_43.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_45;
  highp vec2 P_46;
  P_46 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_51.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_36) * (((tmpvar_49.xyz * _Color.xyz) + tmpvar_44) + ((1.0 - _MasktransparencyDebug) * tmpvar_42))) + ((tmpvar_36 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_45.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_42) + mix (pow ((tmpvar_47.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_44)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_LightTexture0, vec2(tmpvar_10));
  highp float tmpvar_12;
  mediump vec4 shadows_13;
  highp vec4 shadowVals_14;
  highp float tmpvar_15;
  tmpvar_15 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec3 vec_16;
  vec_16 = (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125));
  highp vec4 packDist_17;
  lowp vec4 tmpvar_18;
  tmpvar_18 = textureCube (_ShadowMapTexture, vec_16);
  packDist_17 = tmpvar_18;
  shadowVals_14.x = dot (packDist_17, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_19;
  vec_19 = (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125));
  highp vec4 packDist_20;
  lowp vec4 tmpvar_21;
  tmpvar_21 = textureCube (_ShadowMapTexture, vec_19);
  packDist_20 = tmpvar_21;
  shadowVals_14.y = dot (packDist_20, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_22;
  vec_22 = (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125));
  highp vec4 packDist_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureCube (_ShadowMapTexture, vec_22);
  packDist_23 = tmpvar_24;
  shadowVals_14.z = dot (packDist_23, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_25;
  vec_25 = (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125));
  highp vec4 packDist_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = textureCube (_ShadowMapTexture, vec_25);
  packDist_26 = tmpvar_27;
  shadowVals_14.w = dot (packDist_26, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  bvec4 tmpvar_28;
  tmpvar_28 = lessThan (shadowVals_14, vec4(tmpvar_15));
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
  shadows_13 = tmpvar_34;
  mediump float tmpvar_35;
  tmpvar_35 = dot (shadows_13, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_12 = tmpvar_35;
  highp vec3 tmpvar_36;
  tmpvar_36 = (((tmpvar_11.w * tmpvar_12) * 2.0) * _LightColor0.xyz);
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
  P_40 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_37) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_41;
  arg0_41 = (1.0 - texture2D (_Glittermap, P_40).xyz);
  highp vec3 tmpvar_42;
  tmpvar_42 = (max (arg0_41, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_43;
  tmpvar_43 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_44;
  tmpvar_44 = (tmpvar_43.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_45;
  highp vec2 P_46;
  P_46 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_51.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_36) * (((tmpvar_49.xyz * _Color.xyz) + tmpvar_44) + ((1.0 - _MasktransparencyDebug) * tmpvar_42))) + ((tmpvar_36 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_45.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_42) + mix (pow ((tmpvar_47.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_44)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_LightTexture0, vec2(tmpvar_10));
  highp float tmpvar_12;
  mediump vec4 shadows_13;
  highp vec4 shadowVals_14;
  highp float tmpvar_15;
  tmpvar_15 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec3 vec_16;
  vec_16 = (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125));
  highp vec4 packDist_17;
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture (_ShadowMapTexture, vec_16);
  packDist_17 = tmpvar_18;
  shadowVals_14.x = dot (packDist_17, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_19;
  vec_19 = (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125));
  highp vec4 packDist_20;
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture (_ShadowMapTexture, vec_19);
  packDist_20 = tmpvar_21;
  shadowVals_14.y = dot (packDist_20, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_22;
  vec_22 = (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125));
  highp vec4 packDist_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture (_ShadowMapTexture, vec_22);
  packDist_23 = tmpvar_24;
  shadowVals_14.z = dot (packDist_23, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_25;
  vec_25 = (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125));
  highp vec4 packDist_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture (_ShadowMapTexture, vec_25);
  packDist_26 = tmpvar_27;
  shadowVals_14.w = dot (packDist_26, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  bvec4 tmpvar_28;
  tmpvar_28 = lessThan (shadowVals_14, vec4(tmpvar_15));
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
  shadows_13 = tmpvar_34;
  mediump float tmpvar_35;
  tmpvar_35 = dot (shadows_13, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_12 = tmpvar_35;
  highp vec3 tmpvar_36;
  tmpvar_36 = (((tmpvar_11.w * tmpvar_12) * 2.0) * _LightColor0.xyz);
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
  P_40 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_37) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_41;
  arg0_41 = (1.0 - texture (_Glittermap, P_40).xyz);
  highp vec3 tmpvar_42;
  tmpvar_42 = (max (arg0_41, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_43;
  tmpvar_43 = texture (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_44;
  tmpvar_44 = (tmpvar_43.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_45;
  highp vec2 P_46;
  P_46 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_51.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_36) * (((tmpvar_49.xyz * _Color.xyz) + tmpvar_44) + ((1.0 - _MasktransparencyDebug) * tmpvar_42))) + ((tmpvar_36 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_45.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_42) + mix (pow ((tmpvar_47.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_44)));
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
uniform sampler2D _MainTex;
uniform highp vec4 _MainTex_ST;
uniform sampler2D _Specularglitter;
uniform highp vec4 _Specularglitter_ST;
uniform highp float _MasktransparencyDebug;
uniform highp float _Specularpower05;
uniform highp float _Glitterpower;
uniform highp vec4 _Color;
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_LightTextureB0, vec2(tmpvar_10));
  lowp vec4 tmpvar_12;
  tmpvar_12 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  highp float tmpvar_13;
  mediump vec4 shadows_14;
  highp vec4 shadowVals_15;
  highp float tmpvar_16;
  tmpvar_16 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec3 vec_17;
  vec_17 = (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125));
  highp vec4 packDist_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = textureCube (_ShadowMapTexture, vec_17);
  packDist_18 = tmpvar_19;
  shadowVals_15.x = dot (packDist_18, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_20;
  vec_20 = (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125));
  highp vec4 packDist_21;
  lowp vec4 tmpvar_22;
  tmpvar_22 = textureCube (_ShadowMapTexture, vec_20);
  packDist_21 = tmpvar_22;
  shadowVals_15.y = dot (packDist_21, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_23;
  vec_23 = (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125));
  highp vec4 packDist_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = textureCube (_ShadowMapTexture, vec_23);
  packDist_24 = tmpvar_25;
  shadowVals_15.z = dot (packDist_24, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_26;
  vec_26 = (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125));
  highp vec4 packDist_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = textureCube (_ShadowMapTexture, vec_26);
  packDist_27 = tmpvar_28;
  shadowVals_15.w = dot (packDist_27, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  bvec4 tmpvar_29;
  tmpvar_29 = lessThan (shadowVals_15, vec4(tmpvar_16));
  highp vec4 tmpvar_30;
  tmpvar_30 = _LightShadowData.xxxx;
  highp float tmpvar_31;
  if (tmpvar_29.x) {
    tmpvar_31 = tmpvar_30.x;
  } else {
    tmpvar_31 = 1.0;
  };
  highp float tmpvar_32;
  if (tmpvar_29.y) {
    tmpvar_32 = tmpvar_30.y;
  } else {
    tmpvar_32 = 1.0;
  };
  highp float tmpvar_33;
  if (tmpvar_29.z) {
    tmpvar_33 = tmpvar_30.z;
  } else {
    tmpvar_33 = 1.0;
  };
  highp float tmpvar_34;
  if (tmpvar_29.w) {
    tmpvar_34 = tmpvar_30.w;
  } else {
    tmpvar_34 = 1.0;
  };
  highp vec4 tmpvar_35;
  tmpvar_35.x = tmpvar_31;
  tmpvar_35.y = tmpvar_32;
  tmpvar_35.z = tmpvar_33;
  tmpvar_35.w = tmpvar_34;
  shadows_14 = tmpvar_35;
  mediump float tmpvar_36;
  tmpvar_36 = dot (shadows_14, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_13 = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = ((((tmpvar_11.w * tmpvar_12.w) * tmpvar_13) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_38;
  tmpvar_38[0].x = -0.999999;
  tmpvar_38[0].y = 0.00159255;
  tmpvar_38[1].x = -0.00159255;
  tmpvar_38[1].y = -0.999999;
  lowp vec4 tmpvar_39;
  highp vec2 P_40;
  P_40 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_39 = texture2D (_Mask, P_40);
  node_1540_2 = tmpvar_39;
  highp vec2 P_41;
  P_41 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_38) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_42;
  arg0_42 = (1.0 - texture2D (_Glittermap, P_41).xyz);
  highp vec3 tmpvar_43;
  tmpvar_43 = (max (arg0_42, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_44;
  tmpvar_44 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_45;
  tmpvar_45 = (tmpvar_44.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_46;
  highp vec2 P_47;
  P_47 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_52.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_37) * (((tmpvar_50.xyz * _Color.xyz) + tmpvar_45) + ((1.0 - _MasktransparencyDebug) * tmpvar_43))) + ((tmpvar_37 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_46.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_43) + mix (pow ((tmpvar_48.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_45)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_LightTextureB0, vec2(tmpvar_10));
  lowp vec4 tmpvar_12;
  tmpvar_12 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  highp float tmpvar_13;
  mediump vec4 shadows_14;
  highp vec4 shadowVals_15;
  highp float tmpvar_16;
  tmpvar_16 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec3 vec_17;
  vec_17 = (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125));
  highp vec4 packDist_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = textureCube (_ShadowMapTexture, vec_17);
  packDist_18 = tmpvar_19;
  shadowVals_15.x = dot (packDist_18, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_20;
  vec_20 = (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125));
  highp vec4 packDist_21;
  lowp vec4 tmpvar_22;
  tmpvar_22 = textureCube (_ShadowMapTexture, vec_20);
  packDist_21 = tmpvar_22;
  shadowVals_15.y = dot (packDist_21, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_23;
  vec_23 = (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125));
  highp vec4 packDist_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = textureCube (_ShadowMapTexture, vec_23);
  packDist_24 = tmpvar_25;
  shadowVals_15.z = dot (packDist_24, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_26;
  vec_26 = (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125));
  highp vec4 packDist_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = textureCube (_ShadowMapTexture, vec_26);
  packDist_27 = tmpvar_28;
  shadowVals_15.w = dot (packDist_27, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  bvec4 tmpvar_29;
  tmpvar_29 = lessThan (shadowVals_15, vec4(tmpvar_16));
  highp vec4 tmpvar_30;
  tmpvar_30 = _LightShadowData.xxxx;
  highp float tmpvar_31;
  if (tmpvar_29.x) {
    tmpvar_31 = tmpvar_30.x;
  } else {
    tmpvar_31 = 1.0;
  };
  highp float tmpvar_32;
  if (tmpvar_29.y) {
    tmpvar_32 = tmpvar_30.y;
  } else {
    tmpvar_32 = 1.0;
  };
  highp float tmpvar_33;
  if (tmpvar_29.z) {
    tmpvar_33 = tmpvar_30.z;
  } else {
    tmpvar_33 = 1.0;
  };
  highp float tmpvar_34;
  if (tmpvar_29.w) {
    tmpvar_34 = tmpvar_30.w;
  } else {
    tmpvar_34 = 1.0;
  };
  highp vec4 tmpvar_35;
  tmpvar_35.x = tmpvar_31;
  tmpvar_35.y = tmpvar_32;
  tmpvar_35.z = tmpvar_33;
  tmpvar_35.w = tmpvar_34;
  shadows_14 = tmpvar_35;
  mediump float tmpvar_36;
  tmpvar_36 = dot (shadows_14, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_13 = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = ((((tmpvar_11.w * tmpvar_12.w) * tmpvar_13) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_38;
  tmpvar_38[0].x = -0.999999;
  tmpvar_38[0].y = 0.00159255;
  tmpvar_38[1].x = -0.00159255;
  tmpvar_38[1].y = -0.999999;
  lowp vec4 tmpvar_39;
  highp vec2 P_40;
  P_40 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_39 = texture2D (_Mask, P_40);
  node_1540_2 = tmpvar_39;
  highp vec2 P_41;
  P_41 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_38) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_42;
  arg0_42 = (1.0 - texture2D (_Glittermap, P_41).xyz);
  highp vec3 tmpvar_43;
  tmpvar_43 = (max (arg0_42, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_44;
  tmpvar_44 = textureCube (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_45;
  tmpvar_45 = (tmpvar_44.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_46;
  highp vec2 P_47;
  P_47 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_52.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_37) * (((tmpvar_50.xyz * _Color.xyz) + tmpvar_45) + ((1.0 - _MasktransparencyDebug) * tmpvar_43))) + ((tmpvar_37 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_46.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_43) + mix (pow ((tmpvar_48.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_45)));
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
uniform lowp samplerCube _Reflectioncubemap;
uniform highp float _Reflectioncubemappower;
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
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize(xlv_TEXCOORD2);
  highp mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD3.x;
  tmpvar_4[0].y = xlv_TEXCOORD4.x;
  tmpvar_4[0].z = tmpvar_3.x;
  tmpvar_4[1].x = xlv_TEXCOORD3.y;
  tmpvar_4[1].y = xlv_TEXCOORD4.y;
  tmpvar_4[1].z = tmpvar_3.y;
  tmpvar_4[2].x = xlv_TEXCOORD3.z;
  tmpvar_4[2].y = xlv_TEXCOORD4.z;
  tmpvar_4[2].z = tmpvar_3.z;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD1.xyz));
  highp vec3 tmpvar_6;
  highp vec3 i_7;
  i_7 = -(tmpvar_5);
  tmpvar_6 = (i_7 - (2.0 * (dot (tmpvar_3, i_7) * tmpvar_3)));
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz), _WorldSpaceLightPos0.www));
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_5 + tmpvar_8));
  highp float tmpvar_10;
  tmpvar_10 = dot (xlv_TEXCOORD5, xlv_TEXCOORD5);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_LightTextureB0, vec2(tmpvar_10));
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_LightTexture0, xlv_TEXCOORD5);
  highp float tmpvar_13;
  mediump vec4 shadows_14;
  highp vec4 shadowVals_15;
  highp float tmpvar_16;
  tmpvar_16 = ((sqrt(dot (xlv_TEXCOORD6, xlv_TEXCOORD6)) * _LightPositionRange.w) * 0.97);
  highp vec3 vec_17;
  vec_17 = (xlv_TEXCOORD6 + vec3(0.0078125, 0.0078125, 0.0078125));
  highp vec4 packDist_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture (_ShadowMapTexture, vec_17);
  packDist_18 = tmpvar_19;
  shadowVals_15.x = dot (packDist_18, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_20;
  vec_20 = (xlv_TEXCOORD6 + vec3(-0.0078125, -0.0078125, 0.0078125));
  highp vec4 packDist_21;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture (_ShadowMapTexture, vec_20);
  packDist_21 = tmpvar_22;
  shadowVals_15.y = dot (packDist_21, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_23;
  vec_23 = (xlv_TEXCOORD6 + vec3(-0.0078125, 0.0078125, -0.0078125));
  highp vec4 packDist_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture (_ShadowMapTexture, vec_23);
  packDist_24 = tmpvar_25;
  shadowVals_15.z = dot (packDist_24, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  highp vec3 vec_26;
  vec_26 = (xlv_TEXCOORD6 + vec3(0.0078125, -0.0078125, -0.0078125));
  highp vec4 packDist_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture (_ShadowMapTexture, vec_26);
  packDist_27 = tmpvar_28;
  shadowVals_15.w = dot (packDist_27, vec4(1.0, 0.00392157, 1.53787e-05, 6.03086e-08));
  bvec4 tmpvar_29;
  tmpvar_29 = lessThan (shadowVals_15, vec4(tmpvar_16));
  highp vec4 tmpvar_30;
  tmpvar_30 = _LightShadowData.xxxx;
  highp float tmpvar_31;
  if (tmpvar_29.x) {
    tmpvar_31 = tmpvar_30.x;
  } else {
    tmpvar_31 = 1.0;
  };
  highp float tmpvar_32;
  if (tmpvar_29.y) {
    tmpvar_32 = tmpvar_30.y;
  } else {
    tmpvar_32 = 1.0;
  };
  highp float tmpvar_33;
  if (tmpvar_29.z) {
    tmpvar_33 = tmpvar_30.z;
  } else {
    tmpvar_33 = 1.0;
  };
  highp float tmpvar_34;
  if (tmpvar_29.w) {
    tmpvar_34 = tmpvar_30.w;
  } else {
    tmpvar_34 = 1.0;
  };
  highp vec4 tmpvar_35;
  tmpvar_35.x = tmpvar_31;
  tmpvar_35.y = tmpvar_32;
  tmpvar_35.z = tmpvar_33;
  tmpvar_35.w = tmpvar_34;
  shadows_14 = tmpvar_35;
  mediump float tmpvar_36;
  tmpvar_36 = dot (shadows_14, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_13 = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = ((((tmpvar_11.w * tmpvar_12.w) * tmpvar_13) * 2.0) * _LightColor0.xyz);
  highp mat2 tmpvar_38;
  tmpvar_38[0].x = -0.999999;
  tmpvar_38[0].y = 0.00159255;
  tmpvar_38[1].x = -0.00159255;
  tmpvar_38[1].y = -0.999999;
  lowp vec4 tmpvar_39;
  highp vec2 P_40;
  P_40 = ((xlv_TEXCOORD0 * _Mask_ST.xy) + _Mask_ST.zw);
  tmpvar_39 = texture (_Mask, P_40);
  node_1540_2 = tmpvar_39;
  highp vec2 P_41;
  P_41 = (((((((((((_Glitteryspeed01 * -0.05) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) - vec2(0.5, 0.5)) * tmpvar_38) + vec2(0.5, 0.5)) * _Glitterymaskdotsscale) * (1.0 - (_Glitteryspeed01 / 3.14159))) * _Maskadjust0515) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
  lowp vec3 arg0_42;
  arg0_42 = (1.0 - texture (_Glittermap, P_41).xyz);
  highp vec3 tmpvar_43;
  tmpvar_43 = (max (arg0_42, node_1540_2.xyz) * _MasktransparencyDebug);
  lowp vec4 tmpvar_44;
  tmpvar_44 = texture (_Reflectioncubemap, tmpvar_6);
  highp vec3 tmpvar_45;
  tmpvar_45 = (tmpvar_44.xyz * _Reflectioncubemappower);
  lowp vec4 tmpvar_46;
  highp vec2 P_47;
  P_47 = (((((((0.05 * _Glitteryspeed01) * (tmpvar_4 * tmpvar_5).xy) + xlv_TEXCOORD0) * ((_Glitteryspeed01 / 2.0) + 1.0)) * _Glitterymaskdotsscale) * _Glittermap_ST.xy) + _Glittermap_ST.zw);
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
  tmpvar_52.xyz = (((max (0.0, dot (tmpvar_3, tmpvar_8)) * tmpvar_37) * (((tmpvar_50.xyz * _Color.xyz) + tmpvar_45) + ((1.0 - _MasktransparencyDebug) * tmpvar_43))) + ((tmpvar_37 * pow (max (0.0, dot (tmpvar_9, tmpvar_3)), exp2(((_Shininess * 10.0) + 1.0)))) * ((mix (pow (((_Glitterpower * _Glittercolor.xyz) * tmpvar_46.xyz), vec3(_Glittercontrast13)), vec3(0.0, 0.0, 0.0), tmpvar_43) + mix (pow ((tmpvar_48.xyz * _Specularpower05), vec3(_Specularcontrast13)), vec3(0.0, 0.0, 0.0), node_1540_2.xyz)) + tmpvar_45)));
  tmpvar_1 = tmpvar_52;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 88 math, 7 textures
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
Float 11 [_Reflectioncubemappower]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Reflectioncubemap] CUBE 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"3.0-!!ARBfp1.0
PARAM c[22] = { program.local[0..18],
		{ 0, 2, 1, 0.050000001 },
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
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R5.xyz, R0.w, R0;
MOV R0.w, c[14].x;
MUL R0.z, R0.w, -c[21].x;
MUL R0.w, R0, c[20].x;
DP3 R0.x, R5, fragment.texcoord[3];
DP3 R0.y, fragment.texcoord[4], R5;
MUL R3.xy, R0, -c[14].x;
MAD R0.xy, R3, c[19].w, fragment.texcoord[0];
ADD R0.xy, R0, -c[20].x;
MUL R1.xy, R0.y, c[20].wyzw;
MAD R0.xy, R0.x, c[20].yzzw, R1;
ADD R0.xy, R0, c[20].x;
ADD R0.z, R0, c[19];
MUL R0.xy, R0, c[13].x;
MUL R0.xy, R0, R0.z;
MUL R1.xy, R0, c[18].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[6].xyxy, c[6];
TEX R0.xyz, R1.zwzw, texture[4], 2D;
MUL R0.xyz, R0, c[8].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[3].xyxy, c[3];
TEX R2.xyz, R1.zwzw, texture[1], 2D;
MAD R1.xy, R1, c[15], c[15].zwzw;
TEX R1.xyz, R1, texture[2], 2D;
ADD R1.xyz, -R1, c[19].z;
ADD R0.w, R0, c[19].z;
MAD R3.xy, -R3, c[19].w, fragment.texcoord[0];
MUL R3.xy, R3, R0.w;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R3.xy, R3, c[13].x;
RSQ R0.w, R0.w;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R0.xyz, R2, -R0, R0;
MAX R2.xyz, R1, R2;
MAD R1.xy, R3, c[15], c[15].zwzw;
MUL R4.xyz, R2, c[7].x;
MUL R2.xyz, R0.w, fragment.texcoord[2];
DP3 R0.w, R2, -R5;
MOV R3.xyz, c[12];
MUL R6.xyz, R2, R0.w;
MUL R3.xyz, R3, c[9].x;
TEX R1.xyz, R1, texture[2], 2D;
MUL R1.xyz, R3, R1;
POW R1.x, R1.x, c[16].x;
POW R1.z, R1.z, c[16].x;
POW R1.y, R1.y, c[16].x;
MAD R1.xyz, R4, -R1, R1;
ADD R3.xyz, R1, R0;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, R0;
ADD R0.xyz, R1, R5;
DP3 R1.x, R2, R1;
DP3 R0.w, R0, R0;
MAD R5.xyz, -R6, c[19].y, -R5;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.y, R2, R0;
TEX R5.xyz, R5, texture[3], CUBE;
MUL R5.xyz, R5, c[11].x;
ADD R7.xyz, R5, R3;
MOV R0.x, c[21].y;
MAX R1.w, R0.y, c[19].x;
MUL R0.y, R0.x, c[4].x;
DP3 R0.x, fragment.texcoord[5], fragment.texcoord[5];
ADD R0.y, R0, c[19].z;
TEX R0.w, R0.x, texture[0], 2D;
EX2 R2.w, R0.y;
MUL R0.xyz, R0.w, c[2];
MUL R3.xyz, R0, c[19].y;
POW R0.w, R1.w, R2.w;
MUL R6.xyz, R3, R0.w;
MAD R0.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R0.xyz, R0, texture[5], 2D;
MOV R0.w, c[19].z;
MAX R1.x, R1, c[19];
MUL R6.xyz, R6, R7;
MAD R0.xyz, R0, c[10], R5;
ADD R0.w, R0, -c[7].x;
MAD R0.xyz, R0.w, R4, R0;
MUL R1.xyz, R1.x, R3;
MAD result.color.xyz, R1, R0, R6;
MOV result.color.w, c[19].x;
END
# 88 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 100 math, 7 textures
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
Float 11 [_Reflectioncubemappower]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Reflectioncubemap] CUBE 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
dcl_2d s5
def c19, 0.00000000, 2.00000000, 1.00000000, 0.05000000
def c20, -0.50000000, 0.00159374, -0.99999875, -0.00159374
def c21, 0.50000000, -0.31830987, 1.00000000, 10.00000000
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
add r1.xyz, -v1, c0
dp3 r0.x, r1, r1
rsq r0.x, r0.x
mul r1.xyz, r0.x, r1
dp3 r0.w, v4, r1
dp3 r0.z, r1, v3
mul r3.zw, r0, -c14.x
mad r2.xy, r3.zwzw, c19.w, v0
add r5.xy, r2, c20.x
mul r3.xy, r5.y, c20.yzzw
mad r3.xy, r5.x, c20.zwzw, r3
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s4
mul r0.xyz, r0, c8.x
pow r2, r0.y, c17.x
pow r4, r0.x, c17.x
mov r0.x, r4
pow r4, r0.z, c17.x
mov r0.y, r2
mad r2.xy, v0, c3, c3.zwzw
mov r0.w, c14.x
add r3.xy, r3, c21.x
mov r0.z, r4
texld r2.xyz, r2, s1
mad r0.xyz, r2, -r0, r0
mad r0.w, r0, c21.y, c21.z
mul r3.xy, r3, c13.x
mul r3.xy, r3, r0.w
mov r0.w, c14.x
mul r3.xy, r3, c18.x
mad r3.xy, r3, c15, c15.zwzw
texld r4.xyz, r3, s2
mad r0.w, r0, c21.x, c21.z
mad r3.zw, -r3, c19.w, v0.xyxy
mul r3.zw, r3, r0.w
mul r3.zw, r3, c13.x
mov r0.w, c9.x
mad r3.xy, r3.zwzw, c15, c15.zwzw
mul r5.xyz, c12, r0.w
texld r3.xyz, r3, s2
mul r3.xyz, r5, r3
add r5.xyz, -r4, c19.z
max r2.xyz, r5, r2
pow r4, r3.x, c16.x
pow r5, r3.y, c16.x
mov r3.x, r4
pow r4, r3.z, c16.x
mul r2.xyz, r2, c7.x
mov r3.z, r4
mov r3.y, r5
mad r3.xyz, r2, -r3, r3
add r4.xyz, r3, r0
mad r3.xyz, -v1, c1.w, c1
dp3 r0.x, r3, r3
rsq r0.w, r0.x
mul r3.xyz, r0.w, r3
dp3 r0.y, v2, v2
rsq r0.y, r0.y
mul r0.xyz, r0.y, v2
dp3 r0.w, r0, -r1
mul r5.xyz, r0, r0.w
add r6.xyz, r3, r1
dp3 r0.w, r6, r6
mad r1.xyz, -r5, c19.y, -r1
texld r1.xyz, r1, s3
mad r5.xyz, r1, c11.x, r4
rsq r0.w, r0.w
mul r4.xyz, r0.w, r6
dp3 r1.w, r0, r4
dp3 r0.y, r0, r3
mov r0.w, c4.x
mad r0.w, r0, c21, c21.z
dp3 r4.x, v5, v5
texld r4.x, r4.x, s0
mul r4.xyz, r4.x, c2
mov r0.x, c7
exp r0.w, r0.w
max r1.w, r1, c19.x
pow r6, r1.w, r0.w
mov r0.w, r6.x
mul r4.xyz, r4, c19.y
mul r6.xyz, r4, r0.w
mul r5.xyz, r6, r5
mad r6.xy, v0, c5, c5.zwzw
max r0.w, r0.y, c19.x
mul r1.xyz, r1, c11.x
texld r6.xyz, r6, s5
mad r1.xyz, r6, c10, r1
add r0.x, c19.z, -r0
mad r0.xyz, r0.x, r2, r1
mul r1.xyz, r0.w, r4
mad oC0.xyz, r1, r0, r5
mov_pp oC0.w, c19.x
"
}
SubProgram "d3d11 " {
// Stats: 74 math, 7 textures
Keywords { "POINT" "SHADOWS_OFF" }
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 5
SetTexture 3 [_Reflectioncubemap] CUBE 4
SetTexture 4 [_Specularglitter] 2D 3
SetTexture 5 [_MainTex] 2D 2
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Float 192 [_Reflectioncubemappower]
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
eefiecedbaomddbclejhcfckgoongaleifabphnnabaaaaaameamaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcimalaaaaeaaaaaaaodacaaaa
fjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafidaaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaadcaaaaakbcaabaaaaaaaaaaa
bkiacaaaaaaaaaaaaoaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaal
gcaabaaaaaaaaaaafgifcaaaaaaaaaaaaoaaaaaaaceaaaaaaaaaaaaamnmmemdn
mnmmemlnaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaa
adaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaa
egbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaadaaaaaafgakbaaa
aaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadiaaaaahdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegaabaaaadaaaaaaaaaaaaakdcaabaaaadaaaaaaogakbaaa
adaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaaldcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaa
apaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaa
aagabaaaafaaaaaadiaaaaajhcaabaaaaaaaaaaakgikcaaaaaaaaaaaakaaaaaa
egiccaaaaaaaaaaaanaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaeaaaaaa
egacbaaaaaaaaaaacpaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaagiacaaaaaaaaaaabaaaaaaabjaaaaaf
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaapaaaaakbcaabaaaaeaaaaaaegaabaaa
adaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaa
aeaaaaaaegaabaaaadaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaa
aaaaaaakdcaabaaaadaaaaaaegaabaaaaeaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaadaaaaaaegaabaaaadaaaaaaagiacaaa
aaaaaaaaaoaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaa
aoaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaaadaaaaaa
pgapbaaaabaaaaaaegaabaaaadaaaaaadiaaaaaidcaabaaaadaaaaaaegaabaaa
adaaaaaakgikcaaaaaaaaaaabaaaaaaadcaaaaaldcaabaaaadaaaaaaegaabaaa
adaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaaj
pcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaacaaaaaaaagabaaaafaaaaaa
aaaaaaalhcaabaaaadaaaaaaegacbaiaebaaaaaaadaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaa
aeaaaaaaegaabaaaaeaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadeaaaaah
hcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaa
adaaaaaaegacbaaaadaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaakhcaabaaa
aaaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaajaaaaaa
ogikcaaaaaaaaaaaajaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaeaaaaaaaagabaaaadaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaa
afaaaaaafgifcaaaaaaaaaaaakaaaaaacpaaaaafhcaabaaaafaaaaaaegacbaaa
afaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaa
baaaaaaabjaaaaafhcaabaaaafaaaaaaegacbaaaafaaaaaadcaaaaakhcaabaaa
aeaaaaaaegacbaaaaeaaaaaaegacbaiaebaaaaaaafaaaaaaegacbaaaafaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaah
icaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaaeaaaaaapgapbaaaabaaaaaa
egbcbaaaadaaaaaabaaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
egacbaaaaeaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaa
abaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaaaeaaaaaapgapbaiaebaaaaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaegacbaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaadcaaaaakhcaabaaaaaaaaaaa
egacbaaaacaaaaaaagiacaaaaaaaaaaaamaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaamaaaaaadcaaaaam
hcaabaaaafaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaafaaaaaa
egacbaaaafaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaafaaaaaapgapbaaaabaaaaaaegacbaaaafaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaafaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaafaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaadeaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaa
ahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaabkaabaaa
abaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaabaaaaaahccaabaaa
abaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaaeaaaaaa
fgafbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaa
abaaaaaaakaabaaaaeaaaaaaakaabaaaaeaaaaaadiaaaaaiocaabaaaabaaaaaa
fgafbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaaeaaaaaa
agaabaaaabaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
aaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaeaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaa
aaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaeaaaaaaeghobaaaafaaaaaaaagabaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaa
aaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaa
aaaaiadpdcaaaaajhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaa
egacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
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
// Stats: 85 math, 6 textures
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
Float 11 [_Reflectioncubemappower]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_Mask] 2D 0
SetTexture 1 [_Glittermap] 2D 1
SetTexture 2 [_Reflectioncubemap] CUBE 2
SetTexture 3 [_Specularglitter] 2D 3
SetTexture 4 [_MainTex] 2D 4
"3.0-!!ARBfp1.0
PARAM c[22] = { program.local[0..18],
		{ 0, 2, 1, 0.050000001 },
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
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MOV R4.xyz, c[12];
DP3 R1.x, R0, fragment.texcoord[3];
DP3 R1.y, fragment.texcoord[4], R0;
MUL R3.xy, R1, -c[14].x;
MAD R1.xy, R3, c[19].w, fragment.texcoord[0];
ADD R1.xy, R1, -c[20].x;
MUL R1.zw, R1.y, c[20].xywy;
MAD R1.xy, R1.x, c[20].yzzw, R1.zwzw;
MOV R0.w, c[14].x;
MUL R1.z, R0.w, -c[21].x;
ADD R1.xy, R1, c[20].x;
MUL R0.w, R0, c[20].x;
ADD R1.z, R1, c[19];
MUL R1.xy, R1, c[13].x;
MUL R1.xy, R1, R1.z;
MUL R1.xy, R1, c[18].x;
MAD R1.xy, R1, c[15], c[15].zwzw;
TEX R1.xyz, R1, texture[1], 2D;
ADD R2.xyz, -R1, c[19].z;
MAD R1.zw, -R3.xyxy, c[19].w, fragment.texcoord[0].xyxy;
ADD R0.w, R0, c[19].z;
MUL R3.xy, R1.zwzw, R0.w;
MAD R1.xy, fragment.texcoord[0], c[3], c[3].zwzw;
TEX R1.xyz, R1, texture[0], 2D;
MUL R3.xy, R3, c[13].x;
MAD R3.xy, R3, c[15], c[15].zwzw;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MAX R2.xyz, R2, R1;
TEX R3.xyz, R3, texture[1], 2D;
MUL R4.xyz, R4, c[9].x;
MUL R4.xyz, R4, R3;
MUL R3.xyz, R2, c[7].x;
MAD R2.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R2.xyz, R2, texture[3], 2D;
MUL R2.xyz, R2, c[8].x;
POW R2.x, R2.x, c[17].x;
POW R2.z, R2.z, c[17].x;
POW R2.y, R2.y, c[17].x;
MAD R1.xyz, R1, -R2, R2;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, fragment.texcoord[2];
DP3 R1.w, R2, -R0;
POW R4.x, R4.x, c[16].x;
POW R4.y, R4.y, c[16].x;
POW R4.z, R4.z, c[16].x;
MAD R4.xyz, R3, -R4, R4;
ADD R5.xyz, R4, R1;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R4.xyz, R2, R1.w;
MAD R4.xyz, -R4, c[19].y, -R0;
MUL R1.xyz, R0.w, R1;
ADD R0.xyz, R1, R0;
DP3 R0.w, R0, R0;
RSQ R1.w, R0.w;
MUL R0.xyz, R1.w, R0;
DP3 R0.x, R2, R0;
TEX R4.xyz, R4, texture[2], CUBE;
MUL R4.xyz, R4, c[11].x;
MOV R0.w, c[21].y;
MUL R0.w, R0, c[4].x;
ADD R0.y, R0.w, c[19].z;
MOV R0.zw, c[19].xyyz;
ADD R6.xyz, R4, R5;
MAX R0.x, R0, c[19];
EX2 R0.y, R0.y;
POW R1.w, R0.x, R0.y;
MUL R0.xyz, R0.z, c[2];
MUL R5.xyz, R0, R1.w;
DP3 R1.w, R2, R1;
MAX R1.w, R1, c[19].x;
MUL R6.xyz, R5, R6;
MAD R7.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R5.xyz, R7, texture[4], 2D;
MAD R1.xyz, R5, c[10], R4;
ADD R0.w, R0, -c[7].x;
MAD R1.xyz, R0.w, R3, R1;
MUL R0.xyz, R1.w, R0;
MAD result.color.xyz, R0, R1, R6;
MOV result.color.w, c[19].x;
END
# 85 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 98 math, 6 textures
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
Float 11 [_Reflectioncubemappower]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_Mask] 2D 0
SetTexture 1 [_Glittermap] 2D 1
SetTexture 2 [_Reflectioncubemap] CUBE 2
SetTexture 3 [_Specularglitter] 2D 3
SetTexture 4 [_MainTex] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
dcl_2d s4
def c19, 0.00000000, 2.00000000, 1.00000000, 0.05000000
def c20, -0.50000000, 0.00159374, -0.99999875, -0.00159374
def c21, 0.50000000, -0.31830987, 1.00000000, 10.00000000
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
add r0.xyz, -v1, c0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r4.xyz, r0.w, r0
dp3 r0.x, r4, v3
dp3 r0.y, v4, r4
mul r1.xy, r0, -c14.x
mad r0.xy, r1, c19.w, v0
add r0.xy, r0, c20.x
mul r0.zw, r0.y, c20.xyyz
mad r0.zw, r0.x, c20, r0
mov r0.x, c14
add r0.zw, r0, c21.x
mad r1.z, r0.x, c21.y, c21
mul r0.xy, r0.zwzw, c13.x
mul r0.xy, r0, r1.z
mul r0.xy, r0, c18.x
mad r0.xy, r0, c15, c15.zwzw
texld r0.xyz, r0, s1
add r2.xyz, -r0, c19.z
mad r0.zw, -r1.xyxy, c19.w, v0.xyxy
mov r0.x, c14
mad r1.x, r0, c21, c21.z
mul r0.zw, r0, r1.x
mul r3.xy, r0.zwzw, c13.x
mad r0.xy, v0, c3, c3.zwzw
texld r1.xyz, r0, s0
max r0.xyz, r2, r1
mad r2.xy, r3, c15, c15.zwzw
mov r0.w, c9.x
mul r5.xyz, r0, c7.x
texld r2.xyz, r2, s1
mul r3.xyz, c12, r0.w
mul r3.xyz, r3, r2
pow r2, r3.x, c16.x
pow r0, r3.y, c16.x
mov r3.x, r2
mov r3.y, r0
pow r0, r3.z, c16.x
mov r3.z, r0
mad_pp r2.xyz, -v1, c1.w, c1
dp3_pp r0.x, r2, r2
rsq_pp r0.x, r0.x
mul_pp r2.xyz, r0.x, r2
mad r7.xyz, r5, -r3, r3
add r3.xyz, r2, r4
dp3 r0.w, r3, r3
rsq r1.w, r0.w
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s3
mul r8.xyz, r0, c8.x
mul r6.xyz, r1.w, r3
pow r0, r8.x, c17.x
pow r3, r8.y, c17.x
mov r3.x, r0
pow r0, r8.z, c17.x
mov r3.z, r0
mad r1.xyz, r1, -r3, r3
add r3.xyz, r7, r1
mov r1.y, c4.x
mad r1.w, r1.y, c21, c21.z
dp3 r0.x, v2, v2
rsq r0.x, r0.x
mul r0.xyz, r0.x, v2
dp3 r0.w, r0, r6
dp3 r1.x, r0, -r4
mul r1.xyz, r0, r1.x
dp3 r0.x, r0, r2
mad r4.xyz, -r1, c19.y, -r4
texld r4.xyz, r4, s2
max r0.w, r0, c19.x
exp r2.w, r1.w
pow r1, r0.w, r2.w
mov r0.w, r1.x
mov r6.xyz, c2
mul r1.xyz, c19.y, r6
mul r6.xyz, r1, r0.w
mad r3.xyz, r4, c11.x, r3
mul r3.xyz, r6, r3
max r0.w, r0.x, c19.x
mov r0.y, c7.x
mul r6.xyz, r4, c11.x
mad r7.xy, v0, c5, c5.zwzw
texld r4.xyz, r7, s4
mad r4.xyz, r4, c10, r6
add r0.x, c19.z, -r0.y
mad r0.xyz, r0.x, r5, r4
mul r1.xyz, r0.w, r1
mad oC0.xyz, r1, r0, r3
mov_pp oC0.w, c19.x
"
}
SubProgram "d3d11 " {
// Stats: 72 math, 6 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
SetTexture 0 [_Mask] 2D 0
SetTexture 1 [_Glittermap] 2D 4
SetTexture 2 [_Reflectioncubemap] CUBE 3
SetTexture 3 [_Specularglitter] 2D 2
SetTexture 4 [_MainTex] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
Vector 32 [_Mask_ST]
Float 48 [_Shininess]
Vector 64 [_MainTex_ST]
Vector 80 [_Specularglitter_ST]
Float 96 [_MasktransparencyDebug]
Float 100 [_Specularpower05]
Float 104 [_Glitterpower]
Vector 112 [_Color]
Float 128 [_Reflectioncubemappower]
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
eefiecedammbkkdpohbclljlebgcocalidphpgjmabaaaaaacmamaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcamalaaaa
eaaaaaaamdacaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaadcaaaaakbcaabaaaaaaaaaaa
bkiacaaaaaaaaaaaakaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaal
gcaabaaaaaaaaaaafgifcaaaaaaaaaaaakaaaaaaaceaaaaaaaaaaaaamnmmemdn
mnmmemlnaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaa
adaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaa
egbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaadaaaaaafgakbaaa
aaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadiaaaaahdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegaabaaaadaaaaaaaaaaaaakdcaabaaaadaaaaaaogakbaaa
adaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaaldcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaa
alaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaa
aagabaaaaeaaaaaadiaaaaajhcaabaaaaaaaaaaakgikcaaaaaaaaaaaagaaaaaa
egiccaaaaaaaaaaaajaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaeaaaaaa
egacbaaaaaaaaaaacpaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaagiacaaaaaaaaaaaamaaaaaabjaaaaaf
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaapaaaaakbcaabaaaaeaaaaaaegaabaaa
adaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaa
aeaaaaaaegaabaaaadaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaa
aaaaaaakdcaabaaaadaaaaaaegaabaaaaeaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaadaaaaaaegaabaaaadaaaaaaagiacaaa
aaaaaaaaakaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaa
akaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaaadaaaaaa
pgapbaaaabaaaaaaegaabaaaadaaaaaadiaaaaaidcaabaaaadaaaaaaegaabaaa
adaaaaaakgikcaaaaaaaaaaaamaaaaaadcaaaaaldcaabaaaadaaaaaaegaabaaa
adaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaaefaaaaaj
pcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaabaaaaaaaagabaaaaeaaaaaa
aaaaaaalhcaabaaaadaaaaaaegacbaiaebaaaaaaadaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaacaaaaaaogikcaaaaaaaaaaaacaaaaaaefaaaaajpcaabaaa
aeaaaaaaegaabaaaaeaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadeaaaaah
hcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaa
adaaaaaaegacbaaaadaaaaaaagiacaaaaaaaaaaaagaaaaaadcaaaaakhcaabaaa
aaaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaafaaaaaa
ogikcaaaaaaaaaaaafaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaadaaaaaaaagabaaaacaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaa
afaaaaaafgifcaaaaaaaaaaaagaaaaaacpaaaaafhcaabaaaafaaaaaaegacbaaa
afaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaa
amaaaaaabjaaaaafhcaabaaaafaaaaaaegacbaaaafaaaaaadcaaaaakhcaabaaa
aeaaaaaaegacbaaaaeaaaaaaegacbaiaebaaaaaaafaaaaaaegacbaaaafaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaah
icaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaaeaaaaaapgapbaaaabaaaaaa
egbcbaaaadaaaaaabaaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
egacbaaaaeaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaa
abaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaaaeaaaaaapgapbaiaebaaaaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaegacbaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaadcaaaaakhcaabaaaaaaaaaaa
egacbaaaacaaaaaaagiacaaaaaaaaaaaaiaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaaiaaaaaadcaaaaam
hcaabaaaafaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaafaaaaaa
egacbaaaafaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaafaaaaaapgapbaaaabaaaaaaegacbaaaafaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaafaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaafaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaadeaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaa
adaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaabkaabaaa
abaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaaaaaaaaajocaabaaa
abaaaaaaagijcaaaaaaaaaaaabaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaah
hcaabaaaaeaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaaeaaaaaaaagabaaaabaaaaaa
dcaaaaakhcaabaaaacaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaaahaaaaaa
egacbaaaacaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaa
agaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 93 math, 8 textures
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
Float 11 [_Reflectioncubemappower]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Reflectioncubemap] CUBE 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"3.0-!!ARBfp1.0
PARAM c[22] = { program.local[0..18],
		{ 0, 0.5, 2, 1 },
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
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R0;
MOV R0.w, c[14].x;
MUL R0.z, R0.w, -c[21].x;
DP3 R0.x, R3, fragment.texcoord[3];
DP3 R0.y, fragment.texcoord[4], R3;
MUL R4.xy, R0, -c[14].x;
MAD R0.xy, R4, c[20].x, fragment.texcoord[0];
ADD R0.xy, R0, -c[19].y;
MUL R1.xy, R0.y, c[20].wyzw;
MAD R0.xy, R0.x, c[20].yzzw, R1;
ADD R0.xy, R0, c[19].y;
ADD R0.z, R0, c[19].w;
MUL R0.xy, R0, c[13].x;
MUL R0.xy, R0, R0.z;
MUL R0.xy, R0, c[18].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[6].xyxy, c[6];
MAD R1.xy, R0, c[15], c[15].zwzw;
TEX R0.xyz, R1.zwzw, texture[5], 2D;
MUL R0.xyz, R0, c[8].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[3].xyxy, c[3];
TEX R2.xyz, R1.zwzw, texture[2], 2D;
TEX R1.xyz, R1, texture[3], 2D;
ADD R1.xyz, -R1, c[19].w;
MAD R0.w, R0, c[19].y, c[19];
MAD R4.xy, -R4, c[20].x, fragment.texcoord[0];
MUL R4.xy, R4, R0.w;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R4.xy, R4, c[13].x;
RSQ R0.w, R0.w;
DP3 R3.w, fragment.texcoord[5], fragment.texcoord[5];
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R0.xyz, R2, -R0, R0;
MAX R2.xyz, R1, R2;
MAD R1.xy, R4, c[15], c[15].zwzw;
MOV R4.xyz, c[12];
MUL R4.xyz, R4, c[9].x;
TEX R1.xyz, R1, texture[3], 2D;
MUL R1.xyz, R4, R1;
MUL R2.xyz, R2, c[7].x;
POW R1.x, R1.x, c[16].x;
POW R1.z, R1.z, c[16].x;
POW R1.y, R1.y, c[16].x;
MAD R1.xyz, R2, -R1, R1;
ADD R4.xyz, R1, R0;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R1.w, R0, R0;
RSQ R0.w, R1.w;
MUL R0.xyz, R0.w, R0;
ADD R5.xyz, R0, R3;
DP3 R1.w, R1, -R3;
MUL R6.xyz, R1, R1.w;
DP3 R0.y, R1, R0;
MAD R3.xyz, -R6, c[19].z, -R3;
DP3 R0.w, R5, R5;
RSQ R0.w, R0.w;
MUL R5.xyz, R0.w, R5;
DP3 R1.w, R1, R5;
RCP R0.w, fragment.texcoord[5].w;
MAD R5.xy, fragment.texcoord[5], R0.w, c[19].y;
TEX R0.w, R5, texture[0], 2D;
TEX R3.xyz, R3, texture[4], CUBE;
MUL R3.xyz, R3, c[11].x;
SLT R2.w, c[19].x, fragment.texcoord[5].z;
MUL R2.w, R2, R0;
MOV R0.w, c[21].y;
MUL R4.w, R0, c[4].x;
TEX R0.w, R3.w, texture[1], 2D;
MUL R0.w, R2, R0;
MUL R0.w, R0, c[19].z;
MUL R6.xyz, R0.w, c[2];
MAX R0.w, R0.y, c[19].x;
ADD R3.w, R4, c[19];
MAD R5.xy, fragment.texcoord[0], c[5], c[5].zwzw;
MOV R0.x, c[19].w;
ADD R4.xyz, R3, R4;
TEX R5.xyz, R5, texture[6], 2D;
MAX R1.w, R1, c[19].x;
EX2 R2.w, R3.w;
POW R1.w, R1.w, R2.w;
MUL R7.xyz, R6, R1.w;
MUL R4.xyz, R7, R4;
MAD R3.xyz, R5, c[10], R3;
ADD R0.x, R0, -c[7];
MAD R0.xyz, R0.x, R2, R3;
MUL R1.xyz, R0.w, R6;
MAD result.color.xyz, R1, R0, R4;
MOV result.color.w, c[19].x;
END
# 93 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 105 math, 8 textures
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
Float 11 [_Reflectioncubemappower]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Reflectioncubemap] CUBE 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_cube s4
dcl_2d s5
dcl_2d s6
def c19, 0.00000000, 1.00000000, 0.50000000, 2.00000000
def c20, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c21, -0.99999875, -0.00159374, -0.31830987, 1.00000000
def c22, 10.00000000, 1.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
add r0.xyz, -v1, c0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r1.xyz, r0.w, r0
mad r2.xy, v0, c6, c6.zwzw
texld r2.xyz, r2, s5
mul r4.xyz, r2, c8.x
pow r2, r4.y, c17.x
pow r3, r4.x, c17.x
mov r4.y, r2
mov r4.x, r3
pow r3, r4.z, c17.x
mad r2.xy, v0, c3, c3.zwzw
mov r1.w, c14.x
mov r4.z, r3
texld r2.xyz, r2, s2
mad r3.xyz, r2, -r4, r4
dp3 r0.y, v4, r1
dp3 r0.x, r1, v3
mul r0.xy, r0, -c14.x
mad r0.zw, r0.xyxy, c20.x, v0.xyxy
add r5.xy, r0.zwzw, c20.y
mul r0.zw, r5.y, c20
mad r0.zw, r5.x, c21.xyxy, r0
add r0.zw, r0, c19.z
mad r1.w, r1, c21.z, c21
mul r0.zw, r0, c13.x
mul r0.zw, r0, r1.w
mov r1.w, c14.x
mul r0.zw, r0, c18.x
mad r1.w, r1, c19.z, c19.y
mad r0.xy, -r0, c20.x, v0
mul r4.xy, r0, r1.w
mad r0.xy, r0.zwzw, c15, c15.zwzw
mov r0.w, c9.x
mul r4.xy, r4, c13.x
mad r4.xy, r4, c15, c15.zwzw
mul r5.xyz, c12, r0.w
texld r4.xyz, r4, s3
mul r4.xyz, r5, r4
texld r0.xyz, r0, s3
add r5.xyz, -r0, c19.y
pow r0, r4.x, c16.x
max r2.xyz, r5, r2
mul r5.xyz, r2, c7.x
pow r2, r4.y, c16.x
mov r4.x, r0
pow r0, r4.z, c16.x
dp3 r0.w, v2, v2
mov r4.z, r0
mov r4.y, r2
mad r0.xyz, r5, -r4, r4
add r2.xyz, r0, r3
mad r0.xyz, -v1, c1.w, c1
dp3 r1.w, r0, r0
rsq r0.w, r0.w
mul r3.xyz, r0.w, v2
dp3 r0.w, r3, -r1
rsq r1.w, r1.w
mul r4.xyz, r1.w, r0
mov r1.w, c7.x
add r0.xyz, r4, r1
mul r6.xyz, r3, r0.w
dp3 r0.w, r0, r0
mad r1.xyz, -r6, c19.w, -r1
texld r1.xyz, r1, s4
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r0.x, r3, r0
max r0.y, r0.x, c19.x
mov r0.w, c4.x
mad r0.z, r0.w, c22.x, c22.y
rcp r0.x, v5.w
mad r7.xy, v5, r0.x, c19.z
texld r0.w, r7, s0
dp3 r0.x, v5, v5
mad r6.xyz, r1, c11.x, r2
exp r0.z, r0.z
pow r2, r0.y, r0.z
cmp r0.y, -v5.z, c19.x, c19
mul_pp r0.y, r0, r0.w
texld r0.x, r0.x, s1
mul_pp r0.x, r0.y, r0
mul_pp r0.x, r0, c19.w
mov r0.w, r2.x
mul r0.xyz, r0.x, c2
mul r2.xyz, r0, r0.w
mul r2.xyz, r2, r6
dp3 r0.w, r3, r4
max r0.w, r0, c19.x
mul r6.xyz, r1, c11.x
mad r7.xy, v0, c5, c5.zwzw
texld r1.xyz, r7, s6
mad r1.xyz, r1, c10, r6
add r1.w, c19.y, -r1
mad r1.xyz, r1.w, r5, r1
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r1, r2
mov_pp oC0.w, c19.x
"
}
SubProgram "d3d11 " {
// Stats: 79 math, 8 textures
Keywords { "SPOT" "SHADOWS_OFF" }
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 6
SetTexture 4 [_Reflectioncubemap] CUBE 5
SetTexture 5 [_Specularglitter] 2D 4
SetTexture 6 [_MainTex] 2D 3
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Float 192 [_Reflectioncubemappower]
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
eefiecedlgeaenncjahoejajlegdaeheekhpchbjabaaaaaajmanaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcgeamaaaaeaaaaaaabjadaaaa
fjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafidaaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaa
ffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaaagaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacagaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaa
aaaaaaaaaoaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaalgcaabaaa
aaaaaaaafgifcaaaaaaaaaaaaoaaaaaaaceaaaaaaaaaaaaamnmmemdnmnmmemln
aaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaa
abaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaa
egbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaa
afaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaadaaaaaafgakbaaaaaaaaaaa
egaebaaaadaaaaaaegbebaaaabaaaaaadiaaaaahdcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegaabaaaadaaaaaaaaaaaaakdcaabaaaadaaaaaaogakbaaaadaaaaaa
aceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaa
egaabaaaaaaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaaldcaabaaaaaaaaaaa
egaabaaaaaaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaa
efaaaaajpcaabaaaaeaaaaaaegaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaa
agaaaaaadiaaaaajhcaabaaaaaaaaaaakgikcaaaaaaaaaaaakaaaaaaegiccaaa
aaaaaaaaanaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaa
aaaaaaaacpaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaagiacaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaapaaaaakbcaabaaaaeaaaaaaegaabaaaadaaaaaa
aceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaaaeaaaaaa
egaabaaaadaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaak
dcaabaaaadaaaaaaegaabaaaaeaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaadiaaaaaidcaabaaaadaaaaaaegaabaaaadaaaaaaagiacaaaaaaaaaaa
aoaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaaaoaaaaaa
abeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaaadaaaaaapgapbaaa
abaaaaaaegaabaaaadaaaaaadiaaaaaidcaabaaaadaaaaaaegaabaaaadaaaaaa
kgikcaaaaaaaaaaabaaaaaaadcaaaaaldcaabaaaadaaaaaaegaabaaaadaaaaaa
egiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaadaaaaaaeghobaaaadaaaaaaaagabaaaagaaaaaaaaaaaaal
hcaabaaaadaaaaaaegacbaiaebaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaa
aaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaeaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadeaaaaahhcaabaaa
adaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaadaaaaaa
egacbaaaadaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaakhcaabaaaaaaaaaaa
egacbaaaadaaaaaaegacbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaal
dcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaa
afaaaaaaaagabaaaaeaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaa
fgifcaaaaaaaaaaaakaaaaaacpaaaaafhcaabaaaafaaaaaaegacbaaaafaaaaaa
diaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaabaaaaaaa
bjaaaaafhcaabaaaafaaaaaaegacbaaaafaaaaaadcaaaaakhcaabaaaaeaaaaaa
egacbaaaaeaaaaaaegacbaiaebaaaaaaafaaaaaaegacbaaaafaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaahicaabaaa
abaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhcaabaaaaeaaaaaapgapbaaaabaaaaaaegbcbaaa
adaaaaaabaaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaaacaaaaaaegacbaaa
aeaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaa
dcaaaaalhcaabaaaacaaaaaaegacbaaaaeaaaaaapgapbaiaebaaaaaaabaaaaaa
egacbaiaebaaaaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaegacbaaaacaaaaaa
eghobaaaaeaaaaaaaagabaaaafaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
acaaaaaaagiacaaaaaaaaaaaamaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaamaaaaaadcaaaaamhcaabaaa
afaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaa
acaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaa
afaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
afaaaaaapgapbaaaabaaaaaaegacbaaaafaaaaaadcaaaaajhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaafaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaafaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
bcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaadeaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaa
abeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaabkaabaaa
abaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaabkaabaaaabaaaaaa
bjaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaaaoaaaaahgcaabaaaabaaaaaa
agbbbaaaagaaaaaapgbpbaaaagaaaaaaaaaaaaakgcaabaaaabaaaaaafgagbaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaadpaaaaaadpaaaaaaaaefaaaaajpcaabaaa
aeaaaaaajgafbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadbaaaaah
ccaabaaaabaaaaaaabeaaaaaaaaaaaaackbabaaaagaaaaaaabaaaaahccaabaaa
abaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahccaabaaaabaaaaaa
dkaabaaaaeaaaaaabkaabaaaabaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaa
agaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaaeaaaaaakgakbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaaapaaaaahccaabaaaabaaaaaafgafbaaa
abaaaaaaagaabaaaaeaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaa
agijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaaeaaaaaaagaabaaaabaaaaaa
jgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaajgahbaaa
abaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaa
dcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaa
eghobaaaagaaaaaaaagabaaaadaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaa
aeaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaaaaaaaaajicaabaaa
aaaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaaaaaaiadpdcaaaaaj
hcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 90 math, 8 textures
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
Float 11 [_Reflectioncubemappower]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_LightTextureB0] 2D 0
SetTexture 1 [_LightTexture0] CUBE 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Reflectioncubemap] CUBE 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"3.0-!!ARBfp1.0
PARAM c[22] = { program.local[0..18],
		{ 0, 2, 1, 0.050000001 },
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
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R0;
MOV R0.w, c[14].x;
MUL R0.z, R0.w, -c[21].x;
MUL R0.w, R0, c[20].x;
DP3 R0.x, R3, fragment.texcoord[3];
DP3 R0.y, fragment.texcoord[4], R3;
MUL R4.xy, R0, -c[14].x;
MAD R0.xy, R4, c[19].w, fragment.texcoord[0];
ADD R0.xy, R0, -c[20].x;
MUL R1.xy, R0.y, c[20].wyzw;
MAD R0.xy, R0.x, c[20].yzzw, R1;
ADD R0.xy, R0, c[20].x;
ADD R0.z, R0, c[19];
MUL R0.xy, R0, c[13].x;
MUL R0.xy, R0, R0.z;
MUL R1.xy, R0, c[18].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[6].xyxy, c[6];
TEX R0.xyz, R1.zwzw, texture[5], 2D;
MUL R0.xyz, R0, c[8].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[3].xyxy, c[3];
TEX R2.xyz, R1.zwzw, texture[2], 2D;
MAD R1.xy, R1, c[15], c[15].zwzw;
TEX R1.xyz, R1, texture[3], 2D;
ADD R1.xyz, -R1, c[19].z;
ADD R0.w, R0, c[19].z;
MAD R4.xy, -R4, c[19].w, fragment.texcoord[0];
MUL R4.xy, R4, R0.w;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R4.xy, R4, c[13].x;
RSQ R0.w, R0.w;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R0.xyz, R2, -R0, R0;
MAX R2.xyz, R1, R2;
MAD R1.xy, R4, c[15], c[15].zwzw;
MOV R4.xyz, c[12];
MUL R4.xyz, R4, c[9].x;
TEX R1.xyz, R1, texture[3], 2D;
MUL R1.xyz, R4, R1;
MUL R2.xyz, R2, c[7].x;
POW R1.x, R1.x, c[16].x;
POW R1.z, R1.z, c[16].x;
POW R1.y, R1.y, c[16].x;
MAD R1.xyz, R2, -R1, R1;
ADD R4.xyz, R1, R0;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
MUL R1.xyz, R0.w, fragment.texcoord[2];
DP3 R1.w, R0, R0;
RSQ R0.w, R1.w;
MUL R0.xyz, R0.w, R0;
ADD R5.xyz, R0, R3;
DP3 R1.w, R1, -R3;
MUL R6.xyz, R1, R1.w;
DP3 R0.y, R1, R0;
MAD R3.xyz, -R6, c[19].y, -R3;
DP3 R0.w, R5, R5;
RSQ R0.w, R0.w;
MUL R5.xyz, R0.w, R5;
DP3 R1.w, R1, R5;
MAX R2.w, R1, c[19].x;
TEX R3.xyz, R3, texture[4], CUBE;
MUL R3.xyz, R3, c[11].x;
MOV R0.w, c[21].y;
MUL R0.w, R0, c[4].x;
ADD R3.w, R0, c[19].z;
DP3 R1.w, fragment.texcoord[5], fragment.texcoord[5];
MOV R0.x, c[19].z;
ADD R4.xyz, R3, R4;
TEX R1.w, R1.w, texture[0], 2D;
TEX R0.w, fragment.texcoord[5], texture[1], CUBE;
MUL R0.w, R1, R0;
MUL R5.xyz, R0.w, c[2];
MUL R6.xyz, R5, c[19].y;
EX2 R1.w, R3.w;
POW R0.w, R2.w, R1.w;
MUL R7.xyz, R6, R0.w;
MAX R0.w, R0.y, c[19].x;
MAD R5.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R5.xyz, R5, texture[6], 2D;
MUL R4.xyz, R7, R4;
MAD R3.xyz, R5, c[10], R3;
ADD R0.x, R0, -c[7];
MAD R0.xyz, R0.x, R2, R3;
MUL R1.xyz, R0.w, R6;
MAD result.color.xyz, R1, R0, R4;
MOV result.color.w, c[19].x;
END
# 90 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 101 math, 8 textures
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
Float 11 [_Reflectioncubemappower]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_LightTextureB0] 2D 0
SetTexture 1 [_LightTexture0] CUBE 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Reflectioncubemap] CUBE 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"ps_3_0
dcl_2d s0
dcl_cube s1
dcl_2d s2
dcl_2d s3
dcl_cube s4
dcl_2d s5
dcl_2d s6
def c19, 0.00000000, 2.00000000, 1.00000000, 0.05000000
def c20, -0.50000000, 0.00159374, -0.99999875, -0.00159374
def c21, 0.50000000, -0.31830987, 1.00000000, 10.00000000
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
add r1.xyz, -v1, c0
dp3 r0.x, r1, r1
rsq r0.x, r0.x
mul r1.xyz, r0.x, r1
dp3 r0.w, v4, r1
dp3 r0.z, r1, v3
mul r3.zw, r0, -c14.x
mad r2.xy, r3.zwzw, c19.w, v0
add r5.xy, r2, c20.x
mul r3.xy, r5.y, c20.yzzw
mad r3.xy, r5.x, c20.zwzw, r3
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s5
mul r0.xyz, r0, c8.x
pow r2, r0.y, c17.x
pow r4, r0.x, c17.x
mov r0.x, r4
pow r4, r0.z, c17.x
mov r0.y, r2
mad r2.xy, v0, c3, c3.zwzw
mov r0.w, c14.x
add r3.xy, r3, c21.x
mov r0.z, r4
texld r2.xyz, r2, s2
mad r0.xyz, r2, -r0, r0
mad r0.w, r0, c21.y, c21.z
mul r3.xy, r3, c13.x
mul r3.xy, r3, r0.w
mov r0.w, c14.x
mul r3.xy, r3, c18.x
mad r3.xy, r3, c15, c15.zwzw
texld r4.xyz, r3, s3
mad r0.w, r0, c21.x, c21.z
mad r3.zw, -r3, c19.w, v0.xyxy
mul r3.zw, r3, r0.w
mul r3.zw, r3, c13.x
mov r0.w, c9.x
mad r3.xy, r3.zwzw, c15, c15.zwzw
mul r5.xyz, c12, r0.w
texld r3.xyz, r3, s3
mul r3.xyz, r5, r3
add r5.xyz, -r4, c19.z
max r2.xyz, r5, r2
pow r5, r3.y, c16.x
pow r4, r3.x, c16.x
mov r3.x, r4
pow r4, r3.z, c16.x
mul r2.xyz, r2, c7.x
mov r3.z, r4
mov r3.y, r5
mad r3.xyz, r2, -r3, r3
add r4.xyz, r3, r0
mad r3.xyz, -v1, c1.w, c1
dp3 r0.w, r3, r3
rsq r1.w, r0.w
mul r3.xyz, r1.w, r3
dp3 r0.x, v2, v2
rsq r0.x, r0.x
mul r0.xyz, r0.x, v2
dp3 r0.w, r0, -r1
mul r6.xyz, r0, r0.w
add r5.xyz, r3, r1
mad r1.xyz, -r6, c19.y, -r1
dp3 r0.w, r5, r5
rsq r1.w, r0.w
mul r5.xyz, r1.w, r5
dp3 r1.w, r0, r5
dp3 r0.y, r0, r3
texld r1.xyz, r1, s4
mad r4.xyz, r1, c11.x, r4
mov r0.w, c4.x
mad r0.w, r0, c21, c21.z
dp3 r6.x, v5, v5
mov r0.x, c7
exp r0.w, r0.w
max r1.w, r1, c19.x
pow r5, r1.w, r0.w
texld r6.x, r6.x, s0
texld r0.w, v5, s1
mul r0.w, r6.x, r0
mul r6.xyz, r0.w, c2
mov r0.w, r5.x
mul r5.xyz, r6, c19.y
mul r6.xyz, r5, r0.w
mul r4.xyz, r6, r4
mad r6.xy, v0, c5, c5.zwzw
max r0.w, r0.y, c19.x
mul r1.xyz, r1, c11.x
texld r6.xyz, r6, s6
mad r1.xyz, r6, c10, r1
add r0.x, c19.z, -r0
mad r0.xyz, r0.x, r2, r1
mul r1.xyz, r0.w, r5
mad oC0.xyz, r1, r0, r4
mov_pp oC0.w, c19.x
"
}
SubProgram "d3d11 " {
// Stats: 74 math, 8 textures
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
SetTexture 0 [_LightTextureB0] 2D 1
SetTexture 1 [_LightTexture0] CUBE 0
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 6
SetTexture 4 [_Reflectioncubemap] CUBE 5
SetTexture 5 [_Specularglitter] 2D 4
SetTexture 6 [_MainTex] 2D 3
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Float 192 [_Reflectioncubemappower]
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
eefiecedggpnjnejkidhmldoflecihmjjeekpaajabaaaaaaaeanaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmmalaaaaeaaaaaaapdacaaaa
fjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafidaaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaa
ffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacagaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaa
aaaaaaaaaoaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaalgcaabaaa
aaaaaaaafgifcaaaaaaaaaaaaoaaaaaaaceaaaaaaaaaaaaamnmmemdnmnmmemln
aaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaa
abaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaa
egbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaa
afaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaadaaaaaafgakbaaaaaaaaaaa
egaebaaaadaaaaaaegbebaaaabaaaaaadiaaaaahdcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegaabaaaadaaaaaaaaaaaaakdcaabaaaadaaaaaaogakbaaaadaaaaaa
aceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaa
egaabaaaaaaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaaldcaabaaaaaaaaaaa
egaabaaaaaaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaa
efaaaaajpcaabaaaaeaaaaaaegaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaa
agaaaaaadiaaaaajhcaabaaaaaaaaaaakgikcaaaaaaaaaaaakaaaaaaegiccaaa
aaaaaaaaanaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaa
aaaaaaaacpaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaagiacaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaapaaaaakbcaabaaaaeaaaaaaegaabaaaadaaaaaa
aceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaaaeaaaaaa
egaabaaaadaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaak
dcaabaaaadaaaaaaegaabaaaaeaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaadiaaaaaidcaabaaaadaaaaaaegaabaaaadaaaaaaagiacaaaaaaaaaaa
aoaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaaaoaaaaaa
abeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaaadaaaaaapgapbaaa
abaaaaaaegaabaaaadaaaaaadiaaaaaidcaabaaaadaaaaaaegaabaaaadaaaaaa
kgikcaaaaaaaaaaabaaaaaaadcaaaaaldcaabaaaadaaaaaaegaabaaaadaaaaaa
egiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaa
adaaaaaaegaabaaaadaaaaaaeghobaaaadaaaaaaaagabaaaagaaaaaaaaaaaaal
hcaabaaaadaaaaaaegacbaiaebaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaa
aaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaeaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadeaaaaahhcaabaaa
adaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaaadaaaaaa
egacbaaaadaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaakhcaabaaaaaaaaaaa
egacbaaaadaaaaaaegacbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaal
dcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaa
afaaaaaaaagabaaaaeaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaa
fgifcaaaaaaaaaaaakaaaaaacpaaaaafhcaabaaaafaaaaaaegacbaaaafaaaaaa
diaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaabaaaaaaa
bjaaaaafhcaabaaaafaaaaaaegacbaaaafaaaaaadcaaaaakhcaabaaaaeaaaaaa
egacbaaaaeaaaaaaegacbaiaebaaaaaaafaaaaaaegacbaaaafaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaahicaabaaa
abaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhcaabaaaaeaaaaaapgapbaaaabaaaaaaegbcbaaa
adaaaaaabaaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaaacaaaaaaegacbaaa
aeaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaa
dcaaaaalhcaabaaaacaaaaaaegacbaaaaeaaaaaapgapbaiaebaaaaaaabaaaaaa
egacbaiaebaaaaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaegacbaaaacaaaaaa
eghobaaaaeaaaaaaaagabaaaafaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
acaaaaaaagiacaaaaaaaaaaaamaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaamaaaaaadcaaaaamhcaabaaa
afaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaa
acaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaa
afaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
afaaaaaapgapbaaaabaaaaaaegacbaaaafaaaaaadcaaaaajhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaafaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaafaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
bcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaadeaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaa
abeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaabkaabaaa
abaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaabkaabaaaabaaaaaa
bjaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaabaaaaaahccaabaaaabaaaaaa
egbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaaeaaaaaafgafbaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaafaaaaaa
egbcbaaaagaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaapaaaaahccaabaaa
abaaaaaaagaabaaaaeaaaaaapgapbaaaafaaaaaadiaaaaaiocaabaaaabaaaaaa
fgafbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaaeaaaaaa
agaabaaaabaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
aaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaeaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaa
aaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaeaaaaaaeghobaaaagaaaaaaaagabaaaadaaaaaadcaaaaakhcaabaaa
acaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaa
aaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaa
aaaaiadpdcaaaaajhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaa
egacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
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
// Stats: 87 math, 7 textures
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
Float 11 [_Reflectioncubemappower]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Reflectioncubemap] CUBE 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"3.0-!!ARBfp1.0
PARAM c[22] = { program.local[0..18],
		{ 0, 2, 1, 0.050000001 },
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
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R5.xyz, R0.w, R0;
MOV R0.w, c[14].x;
MUL R0.z, R0.w, -c[21].x;
MUL R0.w, R0, c[20].x;
DP3 R0.x, R5, fragment.texcoord[3];
DP3 R0.y, fragment.texcoord[4], R5;
MUL R3.xy, R0, -c[14].x;
MAD R0.xy, R3, c[19].w, fragment.texcoord[0];
ADD R0.xy, R0, -c[20].x;
MUL R1.xy, R0.y, c[20].wyzw;
MAD R0.xy, R0.x, c[20].yzzw, R1;
ADD R0.xy, R0, c[20].x;
ADD R0.z, R0, c[19];
MUL R0.xy, R0, c[13].x;
MUL R0.xy, R0, R0.z;
MUL R1.xy, R0, c[18].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[6].xyxy, c[6];
TEX R0.xyz, R1.zwzw, texture[4], 2D;
MUL R0.xyz, R0, c[8].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[3].xyxy, c[3];
TEX R2.xyz, R1.zwzw, texture[1], 2D;
MAD R1.xy, R1, c[15], c[15].zwzw;
TEX R1.xyz, R1, texture[2], 2D;
ADD R1.xyz, -R1, c[19].z;
ADD R0.w, R0, c[19].z;
MAD R3.xy, -R3, c[19].w, fragment.texcoord[0];
MUL R3.xy, R3, R0.w;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R3.xy, R3, c[13].x;
RSQ R0.w, R0.w;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R0.xyz, R2, -R0, R0;
MAX R2.xyz, R1, R2;
MAD R1.xy, R3, c[15], c[15].zwzw;
MUL R4.xyz, R2, c[7].x;
MUL R2.xyz, R0.w, fragment.texcoord[2];
DP3 R1.w, R2, -R5;
MOV R3.xyz, c[12];
MUL R6.xyz, R2, R1.w;
MUL R3.xyz, R3, c[9].x;
TEX R1.xyz, R1, texture[2], 2D;
MUL R1.xyz, R3, R1;
POW R1.x, R1.x, c[16].x;
POW R1.z, R1.z, c[16].x;
POW R1.y, R1.y, c[16].x;
MAD R1.xyz, R4, -R1, R1;
ADD R3.xyz, R1, R0;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R1.x, R0, R0;
RSQ R0.w, R1.x;
MUL R1.xyz, R0.w, R0;
ADD R0.xyz, R1, R5;
DP3 R1.x, R2, R1;
MAD R5.xyz, -R6, c[19].y, -R5;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, R2, R0;
MOV R0.w, c[21].y;
MUL R0.y, R0.w, c[4].x;
MAX R1.w, R0.x, c[19].x;
ADD R0.x, R0.y, c[19].z;
TEX R5.xyz, R5, texture[3], CUBE;
MUL R5.xyz, R5, c[11].x;
ADD R7.xyz, R5, R3;
TEX R0.w, fragment.texcoord[5], texture[0], 2D;
EX2 R2.w, R0.x;
MUL R0.xyz, R0.w, c[2];
MUL R3.xyz, R0, c[19].y;
POW R0.w, R1.w, R2.w;
MUL R6.xyz, R3, R0.w;
MAD R0.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R0.xyz, R0, texture[5], 2D;
MOV R0.w, c[19].z;
MAX R1.x, R1, c[19];
MUL R6.xyz, R6, R7;
MAD R0.xyz, R0, c[10], R5;
ADD R0.w, R0, -c[7].x;
MAD R0.xyz, R0.w, R4, R0;
MUL R1.xyz, R1.x, R3;
MAD result.color.xyz, R1, R0, R6;
MOV result.color.w, c[19].x;
END
# 87 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 99 math, 7 textures
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
Float 11 [_Reflectioncubemappower]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Reflectioncubemap] CUBE 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
dcl_2d s5
def c19, 0.00000000, 2.00000000, 1.00000000, 0.05000000
def c20, -0.50000000, 0.00159374, -0.99999875, -0.00159374
def c21, 0.50000000, -0.31830987, 1.00000000, 10.00000000
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xy
add r1.xyz, -v1, c0
dp3 r0.x, r1, r1
rsq r0.x, r0.x
mul r1.xyz, r0.x, r1
dp3 r0.w, v4, r1
dp3 r0.z, r1, v3
mul r3.zw, r0, -c14.x
mad r2.xy, r3.zwzw, c19.w, v0
add r5.xy, r2, c20.x
mul r3.xy, r5.y, c20.yzzw
mad r3.xy, r5.x, c20.zwzw, r3
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s4
mul r0.xyz, r0, c8.x
pow r2, r0.y, c17.x
pow r4, r0.x, c17.x
mov r0.x, r4
pow r4, r0.z, c17.x
mov r0.y, r2
mad r2.xy, v0, c3, c3.zwzw
mov r0.w, c14.x
add r3.xy, r3, c21.x
mov r0.z, r4
texld r2.xyz, r2, s1
mad r0.xyz, r2, -r0, r0
mad r0.w, r0, c21.y, c21.z
mul r3.xy, r3, c13.x
mul r3.xy, r3, r0.w
mov r0.w, c14.x
mul r3.xy, r3, c18.x
mad r3.xy, r3, c15, c15.zwzw
texld r4.xyz, r3, s2
mad r0.w, r0, c21.x, c21.z
mad r3.zw, -r3, c19.w, v0.xyxy
mul r3.zw, r3, r0.w
mul r3.zw, r3, c13.x
mov r0.w, c9.x
mad r3.xy, r3.zwzw, c15, c15.zwzw
mul r5.xyz, c12, r0.w
texld r3.xyz, r3, s2
mul r3.xyz, r5, r3
add r5.xyz, -r4, c19.z
max r2.xyz, r5, r2
pow r4, r3.x, c16.x
pow r5, r3.y, c16.x
mov r3.x, r4
pow r4, r3.z, c16.x
mul r2.xyz, r2, c7.x
mov r3.z, r4
mov r3.y, r5
mad r3.xyz, r2, -r3, r3
add r4.xyz, r3, r0
mad_pp r3.xyz, -v1, c1.w, c1
dp3_pp r0.w, r3, r3
rsq_pp r1.w, r0.w
mul_pp r3.xyz, r1.w, r3
dp3 r0.x, v2, v2
rsq r0.x, r0.x
mul r0.xyz, r0.x, v2
dp3 r0.w, r0, -r1
mul r5.xyz, r0, r0.w
add r6.xyz, r3, r1
dp3 r0.w, r6, r6
rsq r1.w, r0.w
mad r1.xyz, -r5, c19.y, -r1
texld r1.xyz, r1, s3
mad r5.xyz, r1, c11.x, r4
mul r4.xyz, r1.w, r6
dp3 r1.w, r0, r4
dp3 r0.y, r0, r3
mov r0.w, c4.x
mad r0.w, r0, c21, c21.z
mov r0.x, c7
exp r0.w, r0.w
max r1.w, r1, c19.x
pow r4, r1.w, r0.w
texld r0.w, v5, s0
mul r6.xyz, r0.w, c2
mov r0.w, r4.x
mul r4.xyz, r6, c19.y
mul r6.xyz, r4, r0.w
mul r5.xyz, r6, r5
mad r6.xy, v0, c5, c5.zwzw
max r0.w, r0.y, c19.x
mul r1.xyz, r1, c11.x
texld r6.xyz, r6, s5
mad r1.xyz, r6, c10, r1
add r0.x, c19.z, -r0
mad r0.xyz, r0.x, r2, r1
mul r1.xyz, r0.w, r4
mad oC0.xyz, r1, r0, r5
mov_pp oC0.w, c19.x
"
}
SubProgram "d3d11 " {
// Stats: 73 math, 7 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 5
SetTexture 3 [_Reflectioncubemap] CUBE 4
SetTexture 4 [_Specularglitter] 2D 3
SetTexture 5 [_MainTex] 2D 2
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Float 192 [_Reflectioncubemappower]
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
eefiecedlcddgfekkejjfniicfdennjpgaelakkiabaaaaaakiamaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefchaalaaaaeaaaaaaanmacaaaa
fjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafidaaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaadcaaaaakbcaabaaaaaaaaaaa
bkiacaaaaaaaaaaaaoaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaal
gcaabaaaaaaaaaaafgifcaaaaaaaaaaaaoaaaaaaaceaaaaaaaaaaaaamnmmemdn
mnmmemlnaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaa
adaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaa
egbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaadaaaaaafgakbaaa
aaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadiaaaaahdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegaabaaaadaaaaaaaaaaaaakdcaabaaaadaaaaaaogakbaaa
adaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaaldcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaa
apaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaa
aagabaaaafaaaaaadiaaaaajhcaabaaaaaaaaaaakgikcaaaaaaaaaaaakaaaaaa
egiccaaaaaaaaaaaanaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaeaaaaaa
egacbaaaaaaaaaaacpaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaagiacaaaaaaaaaaabaaaaaaabjaaaaaf
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaapaaaaakbcaabaaaaeaaaaaaegaabaaa
adaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaa
aeaaaaaaegaabaaaadaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaa
aaaaaaakdcaabaaaadaaaaaaegaabaaaaeaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaadaaaaaaegaabaaaadaaaaaaagiacaaa
aaaaaaaaaoaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaa
aoaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaaadaaaaaa
pgapbaaaabaaaaaaegaabaaaadaaaaaadiaaaaaidcaabaaaadaaaaaaegaabaaa
adaaaaaakgikcaaaaaaaaaaabaaaaaaadcaaaaaldcaabaaaadaaaaaaegaabaaa
adaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaaj
pcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaacaaaaaaaagabaaaafaaaaaa
aaaaaaalhcaabaaaadaaaaaaegacbaiaebaaaaaaadaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaa
aeaaaaaaegaabaaaaeaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadeaaaaah
hcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaa
adaaaaaaegacbaaaadaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaakhcaabaaa
aaaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaajaaaaaa
ogikcaaaaaaaaaaaajaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaeaaaaaaaagabaaaadaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaa
afaaaaaafgifcaaaaaaaaaaaakaaaaaacpaaaaafhcaabaaaafaaaaaaegacbaaa
afaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaa
baaaaaaabjaaaaafhcaabaaaafaaaaaaegacbaaaafaaaaaadcaaaaakhcaabaaa
aeaaaaaaegacbaaaaeaaaaaaegacbaiaebaaaaaaafaaaaaaegacbaaaafaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaah
icaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaaeaaaaaapgapbaaaabaaaaaa
egbcbaaaadaaaaaabaaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
egacbaaaaeaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaa
abaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaaaeaaaaaapgapbaiaebaaaaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaegacbaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaadcaaaaakhcaabaaaaaaaaaaa
egacbaaaacaaaaaaagiacaaaaaaaaaaaamaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaamaaaaaadcaaaaam
hcaabaaaafaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaafaaaaaa
egacbaaaafaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaafaaaaaapgapbaaaabaaaaaaegacbaaaafaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaafaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaafaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaadeaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaa
ahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaabkaabaaa
abaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaaefaaaaajpcaabaaa
aeaaaaaaogbkbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaah
ccaabaaaabaaaaaadkaabaaaaeaaaaaadkaabaaaaeaaaaaadiaaaaaiocaabaaa
abaaaaaafgafbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaa
aeaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaeaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaa
aeaaaaaaegaabaaaaeaaaaaaeghobaaaafaaaaaaaagabaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaa
acaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaa
abeaaaaaaaaaiadpdcaaaaajhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
adaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
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
// Stats: 98 math, 9 textures
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
Float 12 [_Reflectioncubemappower]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Reflectioncubemap] CUBE 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"3.0-!!ARBfp1.0
PARAM c[23] = { program.local[0..19],
		{ 0, 0.5, 1, 2 },
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
MAD R2.zw, fragment.texcoord[0].xyxy, c[4].xyxy, c[4];
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
TEX R3.xyz, R2.zwzw, texture[3], 2D;
DP3 R1.x, R0, fragment.texcoord[3];
DP3 R1.y, fragment.texcoord[4], R0;
MUL R4.xy, R1, -c[15].x;
MAD R1.xy, R4, c[21].x, fragment.texcoord[0];
ADD R1.xy, R1, -c[20].y;
MUL R1.zw, R1.y, c[21].xywy;
MAD R1.xy, R1.x, c[21].yzzw, R1.zwzw;
MOV R0.w, c[15].x;
MUL R1.z, R0.w, -c[22].x;
ADD R1.xy, R1, c[20].y;
ADD R1.z, R1, c[20];
MUL R1.xy, R1, c[14].x;
MUL R1.xy, R1, R1.z;
MUL R1.xy, R1, c[19].x;
MAD R2.xy, R1, c[16], c[16].zwzw;
MAD R1.zw, fragment.texcoord[0].xyxy, c[7].xyxy, c[7];
TEX R1.xyz, R1.zwzw, texture[6], 2D;
MUL R1.xyz, R1, c[9].x;
TEX R2.xyz, R2, texture[4], 2D;
ADD R2.xyz, -R2, c[20].z;
MAD R0.w, R0, c[20].y, c[20].z;
MAD R4.xy, -R4, c[21].x, fragment.texcoord[0];
MUL R4.xy, R4, R0.w;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R4.xy, R4, c[14].x;
RSQ R0.w, R0.w;
POW R1.x, R1.x, c[18].x;
POW R1.z, R1.z, c[18].x;
POW R1.y, R1.y, c[18].x;
MAD R1.xyz, R3, -R1, R1;
MAX R3.xyz, R2, R3;
MAD R2.xy, R4, c[16], c[16].zwzw;
MOV R4.xyz, c[13];
MUL R4.xyz, R4, c[10].x;
TEX R2.xyz, R2, texture[4], 2D;
MUL R2.xyz, R4, R2;
MUL R3.xyz, R3, c[8].x;
POW R2.x, R2.x, c[17].x;
POW R2.z, R2.z, c[17].x;
POW R2.y, R2.y, c[17].x;
MAD R2.xyz, R3, -R2, R2;
ADD R6.xyz, R2, R1;
MUL R2.xyz, R0.w, fragment.texcoord[2];
DP3 R0.w, R2, -R0;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R1.w, R1, R1;
RSQ R1.w, R1.w;
MUL R1.xyz, R1.w, R1;
DP3 R1.w, fragment.texcoord[5], fragment.texcoord[5];
ADD R5.xyz, R1, R0;
MUL R4.xyz, R2, R0.w;
DP3 R0.w, R5, R5;
MAD R0.xyz, -R4, c[20].w, -R0;
TEX R0.xyz, R0, texture[5], CUBE;
MUL R4.xyz, R0, c[12].x;
RSQ R0.w, R0.w;
MUL R5.xyz, R0.w, R5;
DP3 R0.y, R2, R5;
MAX R0.z, R0.y, c[20].x;
RCP R0.x, fragment.texcoord[5].w;
MAD R0.xy, fragment.texcoord[5], R0.x, c[20].y;
TEX R0.w, R0, texture[0], 2D;
SLT R0.x, c[20], fragment.texcoord[5].z;
MUL R0.x, R0, R0.w;
TEX R1.w, R1.w, texture[1], 2D;
MUL R0.y, R0.x, R1.w;
TXP R0.x, fragment.texcoord[6], texture[2], 2D;
RCP R0.w, fragment.texcoord[6].w;
MAD R1.w, -fragment.texcoord[6].z, R0, R0.x;
MOV R0.x, c[22].y;
MOV R0.w, c[20].z;
MUL R2.w, R0.x, c[5].x;
CMP R0.x, R1.w, c[2], R0.w;
MUL R0.x, R0.y, R0;
ADD R1.w, R2, c[20].z;
EX2 R0.y, R1.w;
POW R1.w, R0.z, R0.y;
MUL R0.x, R0, c[20].w;
MUL R0.xyz, R0.x, c[3];
MUL R5.xyz, R0, R1.w;
DP3 R1.w, R2, R1;
ADD R6.xyz, R4, R6;
MAX R1.w, R1, c[20].x;
MUL R6.xyz, R5, R6;
MAD R7.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R5.xyz, R7, texture[7], 2D;
MAD R1.xyz, R5, c[11], R4;
ADD R0.w, R0, -c[8].x;
MAD R1.xyz, R0.w, R3, R1;
MUL R0.xyz, R1.w, R0;
MAD result.color.xyz, R0, R1, R6;
MOV result.color.w, c[20].x;
END
# 98 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 110 math, 9 textures
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
Float 12 [_Reflectioncubemappower]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Reflectioncubemap] CUBE 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_cube s5
dcl_2d s6
dcl_2d s7
def c20, 0.00000000, 1.00000000, 0.50000000, 2.00000000
def c21, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c22, -0.99999875, -0.00159374, -0.31830987, 1.00000000
def c23, 10.00000000, 1.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
dcl_texcoord6 v6
add r0.xyz, -v1, c0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r1.xyz, r0.w, r0
mad r2.xy, v0, c7, c7.zwzw
texld r2.xyz, r2, s6
mul r4.xyz, r2, c9.x
pow r2, r4.y, c18.x
pow r3, r4.x, c18.x
mov r4.y, r2
mov r4.x, r3
pow r3, r4.z, c18.x
mad r2.xy, v0, c4, c4.zwzw
mov r1.w, c15.x
mov r4.z, r3
texld r2.xyz, r2, s3
mad r3.xyz, r2, -r4, r4
dp3 r0.y, v4, r1
dp3 r0.x, r1, v3
mul r0.xy, r0, -c15.x
mad r0.zw, r0.xyxy, c21.x, v0.xyxy
add r5.xy, r0.zwzw, c21.y
mul r0.zw, r5.y, c21
mad r0.zw, r5.x, c22.xyxy, r0
add r0.zw, r0, c20.z
mad r1.w, r1, c22.z, c22
mul r0.zw, r0, c14.x
mul r0.zw, r0, r1.w
mov r1.w, c15.x
mul r0.zw, r0, c19.x
mad r1.w, r1, c20.z, c20.y
mad r0.xy, -r0, c21.x, v0
mul r4.xy, r0, r1.w
mad r0.xy, r0.zwzw, c16, c16.zwzw
mov r0.w, c10.x
mul r4.xy, r4, c14.x
mad r4.xy, r4, c16, c16.zwzw
mul r5.xyz, c13, r0.w
texld r4.xyz, r4, s4
mul r4.xyz, r5, r4
texld r0.xyz, r0, s4
add r5.xyz, -r0, c20.y
pow r0, r4.x, c17.x
max r2.xyz, r5, r2
mul r5.xyz, r2, c8.x
pow r2, r4.y, c17.x
mov r4.x, r0
pow r0, r4.z, c17.x
dp3 r0.w, v2, v2
mov r4.z, r0
mov r4.y, r2
mad r0.xyz, r5, -r4, r4
add r3.xyz, r0, r3
mad r0.xyz, -v1, c1.w, c1
rsq r0.w, r0.w
mul r2.xyz, r0.w, v2
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mul r4.xyz, r0.w, r0
dp3 r1.w, r2, -r1
mul r6.xyz, r2, r1.w
add r0.xyz, r4, r1
mad r1.xyz, -r6, c20.w, -r1
texld r1.xyz, r1, s5
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r0.x, r2, r0
mov r1.w, c5.x
mad r0.w, r1, c23.x, c23.y
mov r1.w, c8.x
mad r6.xyz, r1, c12.x, r3
exp r0.y, r0.w
max r0.x, r0, c20
pow r3, r0.x, r0.y
texldp r0.x, v6, s2
rcp r0.y, v6.w
mad r0.y, -v6.z, r0, r0.x
mov r0.z, c2.x
cmp r0.y, r0, c20, r0.z
rcp r0.x, v5.w
mad r7.xy, v5, r0.x, c20.z
texld r0.w, r7, s0
dp3 r0.x, v5, v5
cmp r0.z, -v5, c20.x, c20.y
mul_pp r0.z, r0, r0.w
texld r0.x, r0.x, s1
mul_pp r0.x, r0.z, r0
mul_pp r0.x, r0, r0.y
mul_pp r0.x, r0, c20.w
mov r0.w, r3.x
mul r0.xyz, r0.x, c3
mul r3.xyz, r0, r0.w
mul r3.xyz, r3, r6
dp3 r0.w, r2, r4
max r0.w, r0, c20.x
mul r6.xyz, r1, c12.x
mad r7.xy, v0, c6, c6.zwzw
texld r1.xyz, r7, s7
mad r1.xyz, r1, c11, r6
add r1.w, c20.y, -r1
mad r1.xyz, r1.w, r5, r1
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r1, r3
mov_pp oC0.w, c20.x
"
}
SubProgram "d3d11 " {
// Stats: 82 math, 9 textures
Keywords { "SPOT" "SHADOWS_DEPTH" }
SetTexture 0 [_LightTexture0] 2D 1
SetTexture 1 [_LightTextureB0] 2D 2
SetTexture 2 [_ShadowMapTexture] 2D 0
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 7
SetTexture 5 [_Reflectioncubemap] CUBE 6
SetTexture 6 [_Specularglitter] 2D 5
SetTexture 7 [_MainTex] 2D 4
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Float 192 [_Reflectioncubemappower]
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
eefiecedcibhcgbiopadmdfbhaajndofhnclgelgabaaaaaaimaoaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcdmanaaaaeaaaaaaaepadaaaafjaaaaaeegiocaaa
aaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafidaaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaa
agaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaaagaaaaaa
gcbaaaadpcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaa
dcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaiadpdiaaaaalgcaabaaaaaaaaaaafgifcaaaaaaaaaaaaoaaaaaa
aceaaaaaaaaaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaa
baaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaaj
pcaabaaaadaaaaaafgakbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaa
diaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaadaaaaaaaaaaaaak
dcaabaaaadaaaaaaogakbaaaadaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaa
aoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaa
apaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaa
aaaaaaaaeghobaaaaeaaaaaaaagabaaaahaaaaaadiaaaaajhcaabaaaaaaaaaaa
kgikcaaaaaaaaaaaakaaaaaaegiccaaaaaaaaaaaanaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaaaaaaaaacpaaaaafhcaabaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaagiacaaa
aaaaaaaabaaaaaaabjaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaaapaaaaak
bcaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaa
aaaaaaaaapaaaaakccaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaallnnalk
olpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaadaaaaaaegaabaaaaeaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaadaaaaaa
egaabaaaadaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaalicaabaaaabaaaaaa
bkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadp
diaaaaahdcaabaaaadaaaaaapgapbaaaabaaaaaaegaabaaaadaaaaaadiaaaaai
dcaabaaaadaaaaaaegaabaaaadaaaaaakgikcaaaaaaaaaaabaaaaaaadcaaaaal
dcaabaaaadaaaaaaegaabaaaadaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaa
aaaaaaaaapaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
aeaaaaaaaagabaaaahaaaaaaaaaaaaalhcaabaaaadaaaaaaegacbaiaebaaaaaa
adaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaa
aeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaadaaaaaa
aagabaaaadaaaaaadeaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaa
aeaaaaaadiaaaaaihcaabaaaadaaaaaaegacbaaaadaaaaaaagiacaaaaaaaaaaa
akaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaajpcaabaaa
afaaaaaaegaabaaaafaaaaaaeghobaaaagaaaaaaaagabaaaafaaaaaadiaaaaai
hcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaaakaaaaaacpaaaaaf
hcaabaaaafaaaaaaegacbaaaafaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaa
afaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaafaaaaaaegacbaaa
afaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaiaebaaaaaa
afaaaaaaegacbaaaafaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
aeaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaabaaaaaaiicaabaaaabaaaaaa
egacbaiaebaaaaaaacaaaaaaegacbaaaaeaaaaaaaaaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaa
aeaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaacaaaaaaefaaaaaj
pcaabaaaacaaaaaaegacbaaaacaaaaaaeghobaaaafaaaaaaaagabaaaagaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaamaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaamaaaaaadcaaaaamhcaabaaaafaaaaaapgipcaaaacaaaaaaaaaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaa
abaaaaaaegacbaaaafaaaaaaegacbaaaafaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhcaabaaaafaaaaaapgapbaaaabaaaaaaegacbaaa
afaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaafaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaa
afaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakccaabaaa
abaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadp
bjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaabkaabaaaabaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaaaoaaaaahgcaabaaaabaaaaaaagbbbaaaagaaaaaapgbpbaaaagaaaaaa
aaaaaaakgcaabaaaabaaaaaafgagbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaadp
aaaaaadpaaaaaaaaefaaaaajpcaabaaaaeaaaaaajgafbaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaabaaaaaadbaaaaahccaabaaaabaaaaaaabeaaaaaaaaaaaaa
ckbabaaaagaaaaaaabaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaa
aaaaiadpdiaaaaahccaabaaaabaaaaaadkaabaaaaeaaaaaabkaabaaaabaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaaj
pcaabaaaaeaaaaaakgakbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaa
diaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaakaabaaaaeaaaaaaaoaaaaah
hcaabaaaaeaaaaaaegbcbaaaahaaaaaapgbpbaaaahaaaaaaefaaaaajpcaabaaa
afaaaaaaegaabaaaaeaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaadbaaaaah
ecaabaaaabaaaaaaakaabaaaafaaaaaackaabaaaaeaaaaaadhaaaaakecaabaaa
abaaaaaackaabaaaabaaaaaaakiacaaaadaaaaaabiaaaaaaabeaaaaaaaaaiadp
apaaaaahccaabaaaabaaaaaafgafbaaaabaaaaaakgakbaaaabaaaaaadiaaaaai
ocaabaaaabaaaaaafgafbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaah
hcaabaaaaeaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaahaaaaaaaagabaaaaeaaaaaa
dcaaaaakhcaabaaaacaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaaalaaaaaa
egacbaaaacaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaa
akaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 97 math, 9 textures
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
Float 12 [_Reflectioncubemappower]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Reflectioncubemap] CUBE 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"3.0-!!ARBfp1.0
OPTION ARB_fragment_program_shadow;
PARAM c[23] = { program.local[0..19],
		{ 0, 0.5, 1, 2 },
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
MAD R2.zw, fragment.texcoord[0].xyxy, c[4].xyxy, c[4];
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
TEX R3.xyz, R2.zwzw, texture[3], 2D;
DP3 R1.x, R0, fragment.texcoord[3];
DP3 R1.y, fragment.texcoord[4], R0;
MUL R4.xy, R1, -c[15].x;
MAD R1.xy, R4, c[21].x, fragment.texcoord[0];
ADD R1.xy, R1, -c[20].y;
MUL R1.zw, R1.y, c[21].xywy;
MAD R1.xy, R1.x, c[21].yzzw, R1.zwzw;
MOV R0.w, c[15].x;
MUL R1.z, R0.w, -c[22].x;
ADD R1.xy, R1, c[20].y;
ADD R1.z, R1, c[20];
MUL R1.xy, R1, c[14].x;
MUL R1.xy, R1, R1.z;
MUL R1.xy, R1, c[19].x;
MAD R2.xy, R1, c[16], c[16].zwzw;
MAD R1.zw, fragment.texcoord[0].xyxy, c[7].xyxy, c[7];
TEX R1.xyz, R1.zwzw, texture[6], 2D;
MUL R1.xyz, R1, c[9].x;
TEX R2.xyz, R2, texture[4], 2D;
ADD R2.xyz, -R2, c[20].z;
MAD R0.w, R0, c[20].y, c[20].z;
MAD R4.xy, -R4, c[21].x, fragment.texcoord[0];
MUL R4.xy, R4, R0.w;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R4.xy, R4, c[14].x;
RSQ R0.w, R0.w;
POW R1.x, R1.x, c[18].x;
POW R1.z, R1.z, c[18].x;
POW R1.y, R1.y, c[18].x;
MAD R1.xyz, R3, -R1, R1;
MAX R3.xyz, R2, R3;
MAD R2.xy, R4, c[16], c[16].zwzw;
MOV R4.xyz, c[13];
MUL R4.xyz, R4, c[10].x;
TEX R2.xyz, R2, texture[4], 2D;
MUL R2.xyz, R4, R2;
MUL R3.xyz, R3, c[8].x;
POW R2.x, R2.x, c[17].x;
POW R2.z, R2.z, c[17].x;
POW R2.y, R2.y, c[17].x;
MAD R2.xyz, R3, -R2, R2;
ADD R6.xyz, R2, R1;
MUL R2.xyz, R0.w, fragment.texcoord[2];
DP3 R0.w, R2, -R0;
MAD R1.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R1.w, R1, R1;
RSQ R1.w, R1.w;
MUL R1.xyz, R1.w, R1;
DP3 R1.w, fragment.texcoord[5], fragment.texcoord[5];
ADD R5.xyz, R1, R0;
MUL R4.xyz, R2, R0.w;
DP3 R0.w, R5, R5;
MAD R0.xyz, -R4, c[20].w, -R0;
TEX R0.xyz, R0, texture[5], CUBE;
MUL R4.xyz, R0, c[12].x;
RSQ R0.w, R0.w;
MUL R5.xyz, R0.w, R5;
DP3 R0.y, R2, R5;
MAX R0.z, R0.y, c[20].x;
RCP R0.x, fragment.texcoord[5].w;
MAD R0.xy, fragment.texcoord[5], R0.x, c[20].y;
TEX R0.w, R0, texture[0], 2D;
SLT R0.x, c[20], fragment.texcoord[5].z;
MUL R0.x, R0, R0.w;
TEX R1.w, R1.w, texture[1], 2D;
MUL R0.y, R0.x, R1.w;
MOV R0.x, c[22].y;
MOV R0.w, c[20].z;
ADD R1.w, R0, -c[2].x;
MUL R2.w, R0.x, c[5].x;
TXP R0.x, fragment.texcoord[6], texture[2], SHADOW2D;
MAD R0.x, R0, R1.w, c[2];
MUL R0.x, R0.y, R0;
ADD R1.w, R2, c[20].z;
EX2 R0.y, R1.w;
POW R1.w, R0.z, R0.y;
MUL R0.x, R0, c[20].w;
MUL R0.xyz, R0.x, c[3];
MUL R5.xyz, R0, R1.w;
DP3 R1.w, R2, R1;
ADD R6.xyz, R4, R6;
MAX R1.w, R1, c[20].x;
MUL R6.xyz, R5, R6;
MAD R7.xy, fragment.texcoord[0], c[6], c[6].zwzw;
TEX R5.xyz, R7, texture[7], 2D;
MAD R1.xyz, R5, c[11], R4;
ADD R0.w, R0, -c[8].x;
MAD R1.xyz, R0.w, R3, R1;
MUL R0.xyz, R1.w, R0;
MAD result.color.xyz, R0, R1, R6;
MOV result.color.w, c[20].x;
END
# 97 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 109 math, 9 textures
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
Float 12 [_Reflectioncubemappower]
Vector 13 [_Glittercolor]
Float 14 [_Glitterymaskdotsscale]
Float 15 [_Glitteryspeed01]
Vector 16 [_Glittermap_ST]
Float 17 [_Glittercontrast13]
Float 18 [_Specularcontrast13]
Float 19 [_Maskadjust0515]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Reflectioncubemap] CUBE 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_cube s5
dcl_2d s6
dcl_2d s7
def c20, 0.00000000, 1.00000000, 0.50000000, 2.00000000
def c21, 0.05000000, -0.50000000, 0.00159374, -0.99999875
def c22, -0.99999875, -0.00159374, -0.31830987, 1.00000000
def c23, 10.00000000, 1.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
dcl_texcoord6 v6
add r0.xyz, -v1, c0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r1.xyz, r0.w, r0
mad r2.xy, v0, c7, c7.zwzw
texld r2.xyz, r2, s6
mul r4.xyz, r2, c9.x
pow r2, r4.y, c18.x
pow r3, r4.x, c18.x
mov r4.y, r2
mov r4.x, r3
pow r3, r4.z, c18.x
mad r2.xy, v0, c4, c4.zwzw
mov r1.w, c15.x
mov r4.z, r3
texld r2.xyz, r2, s3
mad r3.xyz, r2, -r4, r4
dp3 r0.y, v4, r1
dp3 r0.x, r1, v3
mul r0.xy, r0, -c15.x
mad r0.zw, r0.xyxy, c21.x, v0.xyxy
add r5.xy, r0.zwzw, c21.y
mul r0.zw, r5.y, c21
mad r0.zw, r5.x, c22.xyxy, r0
add r0.zw, r0, c20.z
mad r1.w, r1, c22.z, c22
mul r0.zw, r0, c14.x
mul r0.zw, r0, r1.w
mov r1.w, c15.x
mul r0.zw, r0, c19.x
mad r1.w, r1, c20.z, c20.y
mad r0.xy, -r0, c21.x, v0
mul r4.xy, r0, r1.w
mad r0.xy, r0.zwzw, c16, c16.zwzw
mov r0.w, c10.x
mul r4.xy, r4, c14.x
mad r4.xy, r4, c16, c16.zwzw
mul r5.xyz, c13, r0.w
texld r4.xyz, r4, s4
mul r4.xyz, r5, r4
texld r0.xyz, r0, s4
add r5.xyz, -r0, c20.y
pow r0, r4.x, c17.x
max r2.xyz, r5, r2
mul r5.xyz, r2, c8.x
pow r2, r4.y, c17.x
mov r4.x, r0
pow r0, r4.z, c17.x
dp3 r0.w, v2, v2
mov r4.z, r0
mov r4.y, r2
mad r0.xyz, r5, -r4, r4
add r3.xyz, r0, r3
mad r0.xyz, -v1, c1.w, c1
rsq r0.w, r0.w
mul r2.xyz, r0.w, v2
dp3 r1.w, r0, r0
rsq r0.w, r1.w
mul r4.xyz, r0.w, r0
dp3 r1.w, r2, -r1
mul r6.xyz, r2, r1.w
add r0.xyz, r4, r1
mad r1.xyz, -r6, c20.w, -r1
texld r1.xyz, r1, s5
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r0.x, r2, r0
mov r1.w, c5.x
mad r0.w, r1, c23.x, c23.y
rcp r0.z, v5.w
mad r7.xy, v5, r0.z, c20.z
exp r0.y, r0.w
texld r0.w, r7, s0
cmp r0.z, -v5, c20.x, c20.y
mov r1.w, c8.x
mad r6.xyz, r1, c12.x, r3
max r0.x, r0, c20
pow r3, r0.x, r0.y
mov r0.x, c2
add r0.y, c20, -r0.x
texldp r0.x, v6, s2
mad r0.y, r0.x, r0, c2.x
dp3 r0.x, v5, v5
mul_pp r0.z, r0, r0.w
texld r0.x, r0.x, s1
mul_pp r0.x, r0.z, r0
mul_pp r0.x, r0, r0.y
mul_pp r0.x, r0, c20.w
mov r0.w, r3.x
mul r0.xyz, r0.x, c3
mul r3.xyz, r0, r0.w
mul r3.xyz, r3, r6
dp3 r0.w, r2, r4
max r0.w, r0, c20.x
mul r6.xyz, r1, c12.x
mad r7.xy, v0, c6, c6.zwzw
texld r1.xyz, r7, s7
mad r1.xyz, r1, c11, r6
add r1.w, c20.y, -r1
mad r1.xyz, r1.w, r5, r1
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r1, r3
mov_pp oC0.w, c20.x
"
}
SubProgram "d3d11 " {
// Stats: 83 math, 8 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
SetTexture 0 [_LightTexture0] 2D 1
SetTexture 1 [_LightTextureB0] 2D 2
SetTexture 2 [_Mask] 2D 3
SetTexture 3 [_Glittermap] 2D 7
SetTexture 4 [_Reflectioncubemap] CUBE 6
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 4
SetTexture 7 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Float 192 [_Reflectioncubemappower]
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
eefiecedjfhcnpkiecgjnieaemfmmnapjhaehdpdabaaaaaajmaoaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcemanaaaaeaaaaaaafdadaaaafjaaaaaeegiocaaa
aaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaiaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafidaaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaa
agaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaaagaaaaaa
gcbaaaadpcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaa
dcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaiadpdiaaaaalgcaabaaaaaaaaaaafgifcaaaaaaaaaaaaoaaaaaa
aceaaaaaaaaaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaa
baaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaaj
pcaabaaaadaaaaaafgakbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaa
diaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaadaaaaaaaaaaaaak
dcaabaaaadaaaaaaogakbaaaadaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaa
aoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaa
apaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaa
aaaaaaaaeghobaaaadaaaaaaaagabaaaahaaaaaadiaaaaajhcaabaaaaaaaaaaa
kgikcaaaaaaaaaaaakaaaaaaegiccaaaaaaaaaaaanaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaaaaaaaaacpaaaaafhcaabaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaagiacaaa
aaaaaaaabaaaaaaabjaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaaapaaaaak
bcaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaa
aaaaaaaaapaaaaakccaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaallnnalk
olpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaadaaaaaaegaabaaaaeaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaadaaaaaa
egaabaaaadaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaalicaabaaaabaaaaaa
bkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadp
diaaaaahdcaabaaaadaaaaaapgapbaaaabaaaaaaegaabaaaadaaaaaadiaaaaai
dcaabaaaadaaaaaaegaabaaaadaaaaaakgikcaaaaaaaaaaabaaaaaaadcaaaaal
dcaabaaaadaaaaaaegaabaaaadaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaa
aaaaaaaaapaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
adaaaaaaaagabaaaahaaaaaaaaaaaaalhcaabaaaadaaaaaaegacbaiaebaaaaaa
adaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaa
aeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaacaaaaaa
aagabaaaadaaaaaadeaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaa
aeaaaaaadiaaaaaihcaabaaaadaaaaaaegacbaaaadaaaaaaagiacaaaaaaaaaaa
akaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaajpcaabaaa
afaaaaaaegaabaaaafaaaaaaeghobaaaafaaaaaaaagabaaaafaaaaaadiaaaaai
hcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaaakaaaaaacpaaaaaf
hcaabaaaafaaaaaaegacbaaaafaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaa
afaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaafaaaaaaegacbaaa
afaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaiaebaaaaaa
afaaaaaaegacbaaaafaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
aeaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaabaaaaaaiicaabaaaabaaaaaa
egacbaiaebaaaaaaacaaaaaaegacbaaaaeaaaaaaaaaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaa
aeaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaacaaaaaaefaaaaaj
pcaabaaaacaaaaaaegacbaaaacaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaamaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaamaaaaaadcaaaaamhcaabaaaafaaaaaapgipcaaaacaaaaaaaaaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaa
abaaaaaaegacbaaaafaaaaaaegacbaaaafaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhcaabaaaafaaaaaapgapbaaaabaaaaaaegacbaaa
afaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaafaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaa
afaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakccaabaaa
abaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadp
bjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaabkaabaaaabaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaaaoaaaaahgcaabaaaabaaaaaaagbbbaaaagaaaaaapgbpbaaaagaaaaaa
aaaaaaakgcaabaaaabaaaaaafgagbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaadp
aaaaaadpaaaaaaaaefaaaaajpcaabaaaaeaaaaaajgafbaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaabaaaaaadbaaaaahccaabaaaabaaaaaaabeaaaaaaaaaaaaa
ckbabaaaagaaaaaaabaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaa
aaaaiadpdiaaaaahccaabaaaabaaaaaadkaabaaaaeaaaaaabkaabaaaabaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaaj
pcaabaaaaeaaaaaakgakbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaa
diaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaakaabaaaaeaaaaaaaoaaaaah
hcaabaaaaeaaaaaaegbcbaaaahaaaaaapgbpbaaaahaaaaaaehaaaaalecaabaaa
abaaaaaaegaabaaaaeaaaaaaaghabaaaahaaaaaaaagabaaaaaaaaaaackaabaaa
aeaaaaaaaaaaaaajicaabaaaabaaaaaaakiacaiaebaaaaaaadaaaaaabiaaaaaa
abeaaaaaaaaaiadpdcaaaaakecaabaaaabaaaaaackaabaaaabaaaaaadkaabaaa
abaaaaaaakiacaaaadaaaaaabiaaaaaaapaaaaahccaabaaaabaaaaaafgafbaaa
abaaaaaakgakbaaaabaaaaaadiaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaa
agijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaaeaaaaaaagaabaaaabaaaaaa
jgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaajgahbaaa
abaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaa
dcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaa
eghobaaaagaaaaaaaagabaaaaeaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaa
aeaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaaaaaaaaajicaabaaa
aaaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaaaaaaiadpdcaaaaaj
hcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 87 math, 7 textures
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
Float 11 [_Reflectioncubemappower]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Reflectioncubemap] CUBE 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"3.0-!!ARBfp1.0
PARAM c[22] = { program.local[0..18],
		{ 0, 2, 1, 0.050000001 },
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
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R5.xyz, R0.w, R0;
MOV R0.w, c[14].x;
MUL R0.z, R0.w, -c[21].x;
MUL R0.w, R0, c[20].x;
DP3 R0.x, R5, fragment.texcoord[3];
DP3 R0.y, fragment.texcoord[4], R5;
MUL R3.xy, R0, -c[14].x;
MAD R0.xy, R3, c[19].w, fragment.texcoord[0];
ADD R0.xy, R0, -c[20].x;
MUL R1.xy, R0.y, c[20].wyzw;
MAD R0.xy, R0.x, c[20].yzzw, R1;
ADD R0.xy, R0, c[20].x;
ADD R0.z, R0, c[19];
MUL R0.xy, R0, c[13].x;
MUL R0.xy, R0, R0.z;
MUL R1.xy, R0, c[18].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[6].xyxy, c[6];
TEX R0.xyz, R1.zwzw, texture[4], 2D;
MUL R0.xyz, R0, c[8].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[3].xyxy, c[3];
TEX R2.xyz, R1.zwzw, texture[1], 2D;
MAD R1.xy, R1, c[15], c[15].zwzw;
TEX R1.xyz, R1, texture[2], 2D;
ADD R1.xyz, -R1, c[19].z;
ADD R0.w, R0, c[19].z;
MAD R3.xy, -R3, c[19].w, fragment.texcoord[0];
MUL R3.xy, R3, R0.w;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R3.xy, R3, c[13].x;
RSQ R0.w, R0.w;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R0.xyz, R2, -R0, R0;
MAX R2.xyz, R1, R2;
MAD R1.xy, R3, c[15], c[15].zwzw;
MUL R4.xyz, R2, c[7].x;
MUL R2.xyz, R0.w, fragment.texcoord[2];
DP3 R1.w, R2, -R5;
MOV R3.xyz, c[12];
MUL R3.xyz, R3, c[9].x;
TEX R1.xyz, R1, texture[2], 2D;
MUL R1.xyz, R3, R1;
MUL R6.xyz, R2, R1.w;
POW R1.x, R1.x, c[16].x;
POW R1.z, R1.z, c[16].x;
POW R1.y, R1.y, c[16].x;
MAD R1.xyz, R4, -R1, R1;
ADD R3.xyz, R1, R0;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R1.x, R0, R0;
RSQ R0.w, R1.x;
MUL R1.xyz, R0.w, R0;
ADD R0.xyz, R1, R5;
DP3 R1.x, R2, R1;
MAD R5.xyz, -R6, c[19].y, -R5;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, R2, R0;
MAX R0.y, R0.x, c[19].x;
MOV R0.w, c[21].y;
MUL R0.z, R0.w, c[4].x;
TEX R5.xyz, R5, texture[3], CUBE;
MUL R5.xyz, R5, c[11].x;
ADD R0.z, R0, c[19];
TXP R0.x, fragment.texcoord[5], texture[0], 2D;
EX2 R0.z, R0.z;
MOV R0.w, c[19].z;
POW R0.z, R0.y, R0.z;
ADD R7.xyz, R5, R3;
MUL R0.x, R0, c[19].y;
MUL R3.xyz, R0.x, c[2];
MUL R6.xyz, R3, R0.z;
MAD R0.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R0.xyz, R0, texture[5], 2D;
MAX R1.x, R1, c[19];
MUL R6.xyz, R6, R7;
MAD R0.xyz, R0, c[10], R5;
ADD R0.w, R0, -c[7].x;
MAD R0.xyz, R0.w, R4, R0;
MUL R1.xyz, R1.x, R3;
MAD result.color.xyz, R1, R0, R6;
MOV result.color.w, c[19].x;
END
# 87 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 99 math, 7 textures
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
Float 11 [_Reflectioncubemappower]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 2
SetTexture 3 [_Reflectioncubemap] CUBE 3
SetTexture 4 [_Specularglitter] 2D 4
SetTexture 5 [_MainTex] 2D 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
dcl_2d s5
def c19, 0.00000000, 2.00000000, 1.00000000, 0.05000000
def c20, -0.50000000, 0.00159374, -0.99999875, -0.00159374
def c21, 0.50000000, -0.31830987, 1.00000000, 10.00000000
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
add r1.xyz, -v1, c0
dp3 r0.x, r1, r1
rsq r0.x, r0.x
mul r1.xyz, r0.x, r1
dp3 r0.w, v4, r1
dp3 r0.z, r1, v3
mul r3.zw, r0, -c14.x
mad r2.xy, r3.zwzw, c19.w, v0
add r5.xy, r2, c20.x
mul r3.xy, r5.y, c20.yzzw
mad r3.xy, r5.x, c20.zwzw, r3
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s4
mul r0.xyz, r0, c8.x
pow r2, r0.y, c17.x
pow r4, r0.x, c17.x
mov r0.x, r4
pow r4, r0.z, c17.x
mov r0.y, r2
mad r2.xy, v0, c3, c3.zwzw
mov r0.w, c14.x
add r3.xy, r3, c21.x
mov r0.z, r4
texld r2.xyz, r2, s1
mad r0.xyz, r2, -r0, r0
mad r0.w, r0, c21.y, c21.z
mul r3.xy, r3, c13.x
mul r3.xy, r3, r0.w
mov r0.w, c14.x
mul r3.xy, r3, c18.x
mad r3.xy, r3, c15, c15.zwzw
texld r4.xyz, r3, s2
mad r0.w, r0, c21.x, c21.z
mad r3.zw, -r3, c19.w, v0.xyxy
mul r3.zw, r3, r0.w
mul r3.zw, r3, c13.x
mov r0.w, c9.x
mad r3.xy, r3.zwzw, c15, c15.zwzw
mul r5.xyz, c12, r0.w
texld r3.xyz, r3, s2
mul r3.xyz, r5, r3
add r5.xyz, -r4, c19.z
max r2.xyz, r5, r2
pow r4, r3.x, c16.x
pow r5, r3.y, c16.x
mov r3.x, r4
pow r4, r3.z, c16.x
mul r2.xyz, r2, c7.x
mov r3.z, r4
mov r3.y, r5
mad r3.xyz, r2, -r3, r3
add r4.xyz, r3, r0
mad_pp r3.xyz, -v1, c1.w, c1
dp3_pp r0.w, r3, r3
rsq_pp r1.w, r0.w
mul_pp r3.xyz, r1.w, r3
dp3 r0.x, v2, v2
rsq r0.x, r0.x
mul r0.xyz, r0.x, v2
dp3 r0.w, r0, -r1
mul r5.xyz, r0, r0.w
add r6.xyz, r3, r1
dp3 r0.w, r6, r6
rsq r1.w, r0.w
mad r1.xyz, -r5, c19.y, -r1
texld r1.xyz, r1, s3
mad r5.xyz, r1, c11.x, r4
mul r4.xyz, r1.w, r6
dp3 r1.w, r0, r4
dp3 r0.y, r0, r3
mov r0.w, c4.x
mad r0.w, r0, c21, c21.z
mov r0.x, c7
exp r0.w, r0.w
max r1.w, r1, c19.x
pow r4, r1.w, r0.w
texldp r6.x, v5, s0
mov r0.w, r4.x
mul_pp r1.w, r6.x, c19.y
mul r4.xyz, r1.w, c2
mul r6.xyz, r4, r0.w
mul r5.xyz, r6, r5
mad r6.xy, v0, c5, c5.zwzw
max r0.w, r0.y, c19.x
mul r1.xyz, r1, c11.x
texld r6.xyz, r6, s5
mad r1.xyz, r6, c10, r1
add r0.x, c19.z, -r0
mad r0.xyz, r0.x, r2, r1
mul r1.xyz, r0.w, r4
mad oC0.xyz, r1, r0, r5
mov_pp oC0.w, c19.x
"
}
SubProgram "d3d11 " {
// Stats: 74 math, 7 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_Mask] 2D 1
SetTexture 2 [_Glittermap] 2D 5
SetTexture 3 [_Reflectioncubemap] CUBE 4
SetTexture 4 [_Specularglitter] 2D 3
SetTexture 5 [_MainTex] 2D 2
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Float 192 [_Reflectioncubemappower]
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
eefiecedmpbighdkdcahdllepdfbecdbafjhjfkmabaaaaaameamaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcimalaaaaeaaaaaaaodacaaaa
fjaaaaaeegiocaaaaaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafidaaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadlcbabaaaagaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaadcaaaaakbcaabaaaaaaaaaaa
bkiacaaaaaaaaaaaaoaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaal
gcaabaaaaaaaaaaafgifcaaaaaaaaaaaaoaaaaaaaceaaaaaaaaaaaaamnmmemdn
mnmmemlnaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaa
adaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaa
egbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaadaaaaaafgakbaaa
aaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadiaaaaahdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegaabaaaadaaaaaaaaaaaaakdcaabaaaadaaaaaaogakbaaa
adaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaaldcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaa
apaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaa
aagabaaaafaaaaaadiaaaaajhcaabaaaaaaaaaaakgikcaaaaaaaaaaaakaaaaaa
egiccaaaaaaaaaaaanaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaeaaaaaa
egacbaaaaaaaaaaacpaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaagiacaaaaaaaaaaabaaaaaaabjaaaaaf
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaapaaaaakbcaabaaaaeaaaaaaegaabaaa
adaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaa
aeaaaaaaegaabaaaadaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaa
aaaaaaakdcaabaaaadaaaaaaegaabaaaaeaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaadaaaaaaegaabaaaadaaaaaaagiacaaa
aaaaaaaaaoaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaa
aoaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaaadaaaaaa
pgapbaaaabaaaaaaegaabaaaadaaaaaadiaaaaaidcaabaaaadaaaaaaegaabaaa
adaaaaaakgikcaaaaaaaaaaabaaaaaaadcaaaaaldcaabaaaadaaaaaaegaabaaa
adaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaaj
pcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaacaaaaaaaagabaaaafaaaaaa
aaaaaaalhcaabaaaadaaaaaaegacbaiaebaaaaaaadaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaa
aeaaaaaaegaabaaaaeaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadeaaaaah
hcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaa
adaaaaaaegacbaaaadaaaaaaagiacaaaaaaaaaaaakaaaaaadcaaaaakhcaabaaa
aaaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaajaaaaaa
ogikcaaaaaaaaaaaajaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaaeaaaaaaaagabaaaadaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaa
afaaaaaafgifcaaaaaaaaaaaakaaaaaacpaaaaafhcaabaaaafaaaaaaegacbaaa
afaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaa
baaaaaaabjaaaaafhcaabaaaafaaaaaaegacbaaaafaaaaaadcaaaaakhcaabaaa
aeaaaaaaegacbaaaaeaaaaaaegacbaiaebaaaaaaafaaaaaaegacbaaaafaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaah
icaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaaeaaaaaapgapbaaaabaaaaaa
egbcbaaaadaaaaaabaaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
egacbaaaaeaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaa
abaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaaaeaaaaaapgapbaiaebaaaaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaegacbaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaadcaaaaakhcaabaaaaaaaaaaa
egacbaaaacaaaaaaagiacaaaaaaaaaaaamaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaamaaaaaadcaaaaam
hcaabaaaafaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaafaaaaaa
egacbaaaafaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaafaaaaaapgapbaaaabaaaaaaegacbaaaafaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaafaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaafaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaadeaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaa
ahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaabkaabaaa
abaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaaaoaaaaahgcaabaaa
abaaaaaaagbbbaaaagaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaaaeaaaaaa
jgafbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaa
abaaaaaaakaabaaaaeaaaaaaakaabaaaaeaaaaaadiaaaaaiocaabaaaabaaaaaa
fgafbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaaeaaaaaa
agaabaaaabaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
aaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaeaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaa
aaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaeaaaaaaeghobaaaafaaaaaaaagabaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaa
aaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaa
aaaaiadpdcaaaaajhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaa
egacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
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
// Stats: 89 math, 8 textures
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
Float 11 [_Reflectioncubemappower]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Reflectioncubemap] CUBE 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"3.0-!!ARBfp1.0
PARAM c[22] = { program.local[0..18],
		{ 0, 2, 1, 0.050000001 },
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
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R4.xyz, R0.w, R0;
MOV R0.w, c[14].x;
MUL R0.z, R0.w, -c[21].x;
MUL R0.w, R0, c[20].x;
DP3 R0.x, R4, fragment.texcoord[3];
DP3 R0.y, fragment.texcoord[4], R4;
MUL R3.xy, R0, -c[14].x;
MAD R0.xy, R3, c[19].w, fragment.texcoord[0];
ADD R0.xy, R0, -c[20].x;
MUL R1.xy, R0.y, c[20].wyzw;
MAD R0.xy, R0.x, c[20].yzzw, R1;
ADD R0.xy, R0, c[20].x;
ADD R0.z, R0, c[19];
MUL R0.xy, R0, c[13].x;
MUL R0.xy, R0, R0.z;
MUL R1.xy, R0, c[18].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[6].xyxy, c[6];
TEX R0.xyz, R1.zwzw, texture[5], 2D;
MUL R0.xyz, R0, c[8].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[3].xyxy, c[3];
TEX R2.xyz, R1.zwzw, texture[2], 2D;
MAD R1.xy, R1, c[15], c[15].zwzw;
TEX R1.xyz, R1, texture[3], 2D;
ADD R1.xyz, -R1, c[19].z;
ADD R0.w, R0, c[19].z;
MAD R3.xy, -R3, c[19].w, fragment.texcoord[0];
MUL R3.xy, R3, R0.w;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R3.xy, R3, c[13].x;
RSQ R0.w, R0.w;
POW R0.x, R0.x, c[17].x;
POW R0.z, R0.z, c[17].x;
POW R0.y, R0.y, c[17].x;
MAD R0.xyz, R2, -R0, R0;
MAX R2.xyz, R1, R2;
MAD R1.xy, R3, c[15], c[15].zwzw;
MOV R3.xyz, c[12];
MUL R3.xyz, R3, c[9].x;
TEX R1.xyz, R1, texture[3], 2D;
MUL R1.xyz, R3, R1;
MUL R3.xyz, R2, c[7].x;
MUL R2.xyz, R0.w, fragment.texcoord[2];
DP3 R1.w, R2, -R4;
MUL R6.xyz, R2, R1.w;
POW R1.x, R1.x, c[16].x;
POW R1.z, R1.z, c[16].x;
POW R1.y, R1.y, c[16].x;
MAD R1.xyz, R3, -R1, R1;
ADD R5.xyz, R1, R0;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R1.x, R0, R0;
RSQ R0.w, R1.x;
MUL R1.xyz, R0.w, R0;
ADD R0.xyz, R1, R4;
DP3 R1.x, R2, R1;
MAD R4.xyz, -R6, c[19].y, -R4;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, R2, R0;
MOV R0.w, c[21].y;
MUL R0.y, R0.w, c[4].x;
MAX R1.w, R0.x, c[19].x;
TEX R4.xyz, R4, texture[4], CUBE;
MUL R4.xyz, R4, c[11].x;
ADD R0.y, R0, c[19].z;
TEX R0.w, fragment.texcoord[5], texture[1], 2D;
TXP R0.x, fragment.texcoord[6], texture[0], 2D;
MUL R0.x, R0.w, R0;
EX2 R0.w, R0.y;
MUL R0.xyz, R0.x, c[2];
MUL R6.xyz, R0, c[19].y;
POW R0.w, R1.w, R0.w;
MUL R7.xyz, R6, R0.w;
ADD R5.xyz, R4, R5;
MAD R0.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R0.xyz, R0, texture[6], 2D;
MOV R0.w, c[19].z;
MAX R1.x, R1, c[19];
MUL R5.xyz, R7, R5;
MAD R0.xyz, R0, c[10], R4;
ADD R0.w, R0, -c[7].x;
MAD R0.xyz, R0.w, R3, R0;
MUL R1.xyz, R1.x, R6;
MAD result.color.xyz, R1, R0, R5;
MOV result.color.w, c[19].x;
END
# 89 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 100 math, 8 textures
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
Float 11 [_Reflectioncubemappower]
Vector 12 [_Glittercolor]
Float 13 [_Glitterymaskdotsscale]
Float 14 [_Glitteryspeed01]
Vector 15 [_Glittermap_ST]
Float 16 [_Glittercontrast13]
Float 17 [_Specularcontrast13]
Float 18 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Reflectioncubemap] CUBE 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_cube s4
dcl_2d s5
dcl_2d s6
def c19, 0.00000000, 2.00000000, 1.00000000, 0.05000000
def c20, -0.50000000, 0.00159374, -0.99999875, -0.00159374
def c21, 0.50000000, -0.31830987, 1.00000000, 10.00000000
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xy
dcl_texcoord6 v6
add r1.xyz, -v1, c0
dp3 r0.x, r1, r1
rsq r0.x, r0.x
mul r1.xyz, r0.x, r1
dp3 r0.w, v4, r1
dp3 r0.z, r1, v3
mul r3.zw, r0, -c14.x
mad r2.xy, r3.zwzw, c19.w, v0
add r5.xy, r2, c20.x
mul r3.xy, r5.y, c20.yzzw
mad r3.xy, r5.x, c20.zwzw, r3
mad r0.xy, v0, c6, c6.zwzw
texld r0.xyz, r0, s5
mul r0.xyz, r0, c8.x
pow r2, r0.y, c17.x
pow r4, r0.x, c17.x
mov r0.x, r4
pow r4, r0.z, c17.x
mov r0.y, r2
mad r2.xy, v0, c3, c3.zwzw
mov r0.w, c14.x
add r3.xy, r3, c21.x
mov r0.z, r4
texld r2.xyz, r2, s2
mad r0.xyz, r2, -r0, r0
mad r0.w, r0, c21.y, c21.z
mul r3.xy, r3, c13.x
mul r3.xy, r3, r0.w
mov r0.w, c14.x
mul r3.xy, r3, c18.x
mad r3.xy, r3, c15, c15.zwzw
texld r4.xyz, r3, s3
mad r0.w, r0, c21.x, c21.z
mad r3.zw, -r3, c19.w, v0.xyxy
mul r3.zw, r3, r0.w
mul r3.zw, r3, c13.x
mov r0.w, c9.x
mad r3.xy, r3.zwzw, c15, c15.zwzw
mul r5.xyz, c12, r0.w
texld r3.xyz, r3, s3
mul r3.xyz, r5, r3
add r5.xyz, -r4, c19.z
max r2.xyz, r5, r2
pow r5, r3.y, c16.x
pow r4, r3.x, c16.x
mov r3.x, r4
pow r4, r3.z, c16.x
mul r2.xyz, r2, c7.x
mov r3.z, r4
mov r3.y, r5
mad r3.xyz, r2, -r3, r3
add r4.xyz, r3, r0
mad_pp r3.xyz, -v1, c1.w, c1
dp3_pp r0.w, r3, r3
rsq_pp r1.w, r0.w
mul_pp r3.xyz, r1.w, r3
dp3 r0.x, v2, v2
rsq r0.x, r0.x
mul r0.xyz, r0.x, v2
dp3 r0.w, r0, -r1
mul r6.xyz, r0, r0.w
add r5.xyz, r3, r1
mad r1.xyz, -r6, c19.y, -r1
dp3 r0.w, r5, r5
rsq r1.w, r0.w
mul r5.xyz, r1.w, r5
dp3 r1.w, r0, r5
dp3 r0.y, r0, r3
texld r1.xyz, r1, s4
mad r4.xyz, r1, c11.x, r4
mov r0.w, c4.x
mad r0.w, r0, c21, c21.z
mov r0.x, c7
exp r0.w, r0.w
max r1.w, r1, c19.x
pow r5, r1.w, r0.w
texldp r6.x, v6, s0
texld r0.w, v5, s1
mul r0.w, r0, r6.x
mul r6.xyz, r0.w, c2
mov r0.w, r5.x
mul r5.xyz, r6, c19.y
mul r6.xyz, r5, r0.w
mul r4.xyz, r6, r4
mad r6.xy, v0, c5, c5.zwzw
max r0.w, r0.y, c19.x
mul r1.xyz, r1, c11.x
texld r6.xyz, r6, s6
mad r1.xyz, r6, c10, r1
add r0.x, c19.z, -r0
mad r0.xyz, r0.x, r2, r1
mul r1.xyz, r0.w, r5
mad oC0.xyz, r1, r0, r4
mov_pp oC0.w, c19.x
"
}
SubProgram "d3d11 " {
// Stats: 74 math, 8 textures
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
SetTexture 0 [_LightTexture0] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 6
SetTexture 4 [_Reflectioncubemap] CUBE 5
SetTexture 5 [_Specularglitter] 2D 4
SetTexture 6 [_MainTex] 2D 3
ConstBuffer "$Globals" 336
Vector 144 [_LightColor0]
Vector 160 [_Mask_ST]
Float 176 [_Shininess]
Vector 192 [_MainTex_ST]
Vector 208 [_Specularglitter_ST]
Float 224 [_MasktransparencyDebug]
Float 228 [_Specularpower05]
Float 232 [_Glitterpower]
Vector 240 [_Color]
Float 256 [_Reflectioncubemappower]
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
eefiecedabjlkipkgladkdecbjekfaamihkmegmhabaaaaaacianaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaaneaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaagaaaaaaapalaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcnialaaaaeaaaaaaapgacaaaafjaaaaaeegiocaaa
aaaaaaaabfaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaaagaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafidaaaae
aahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaae
aahabaaaagaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadlcbabaaaagaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaadcaaaaakbcaabaaaaaaaaaaa
bkiacaaaaaaaaaaabcaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdiaaaaal
gcaabaaaaaaaaaaafgifcaaaaaaaaaaabcaaaaaaaceaaaaaaaaaaaaamnmmemdn
mnmmemlnaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaa
adaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaadaaaaaa
egbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaajpcaabaaaadaaaaaafgakbaaa
aaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaadiaaaaahdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegaabaaaadaaaaaaaaaaaaakdcaabaaaadaaaaaaogakbaaa
adaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaabcaaaaaadcaaaaaldcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaabdaaaaaaogikcaaaaaaaaaaa
bdaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaaaaaaaaeghobaaaadaaaaaa
aagabaaaagaaaaaadiaaaaajhcaabaaaaaaaaaaakgikcaaaaaaaaaaaaoaaaaaa
egiccaaaaaaaaaaabbaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaeaaaaaa
egacbaaaaaaaaaaacpaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaagiacaaaaaaaaaaabeaaaaaabjaaaaaf
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaapaaaaakbcaabaaaaeaaaaaaegaabaaa
adaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaaaaaaaaaaapaaaaakccaabaaa
aeaaaaaaegaabaaaadaaaaaaaceaaaaaallnnalkolpphplpaaaaaaaaaaaaaaaa
aaaaaaakdcaabaaaadaaaaaaegaabaaaaeaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaadaaaaaaegaabaaaadaaaaaaagiacaaa
aaaaaaaabcaaaaaadcaaaaalicaabaaaabaaaaaabkiacaiaebaaaaaaaaaaaaaa
bcaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadpdiaaaaahdcaabaaaadaaaaaa
pgapbaaaabaaaaaaegaabaaaadaaaaaadiaaaaaidcaabaaaadaaaaaaegaabaaa
adaaaaaakgikcaaaaaaaaaaabeaaaaaadcaaaaaldcaabaaaadaaaaaaegaabaaa
adaaaaaaegiacaaaaaaaaaaabdaaaaaaogikcaaaaaaaaaaabdaaaaaaefaaaaaj
pcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaadaaaaaaaagabaaaagaaaaaa
aaaaaaalhcaabaaaadaaaaaaegacbaiaebaaaaaaadaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaaefaaaaajpcaabaaa
aeaaaaaaegaabaaaaeaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadeaaaaah
hcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaaeaaaaaadiaaaaaihcaabaaa
adaaaaaaegacbaaaadaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaakhcaabaaa
aaaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaanaaaaaa
ogikcaaaaaaaaaaaanaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaa
eghobaaaafaaaaaaaagabaaaaeaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaa
afaaaaaafgifcaaaaaaaaaaaaoaaaaaacpaaaaafhcaabaaaafaaaaaaegacbaaa
afaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaa
beaaaaaabjaaaaafhcaabaaaafaaaaaaegacbaaaafaaaaaadcaaaaakhcaabaaa
aeaaaaaaegacbaaaaeaaaaaaegacbaiaebaaaaaaafaaaaaaegacbaaaafaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaabaaaaaah
icaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaaeaaaaaapgapbaaaabaaaaaa
egbcbaaaadaaaaaabaaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
egacbaaaaeaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaa
abaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaaaeaaaaaapgapbaiaebaaaaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaegacbaaa
acaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaadcaaaaakhcaabaaaaaaaaaaa
egacbaaaacaaaaaaagiacaaaaaaaaaaabaaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaabaaaaaaadcaaaaam
hcaabaaaafaaaaaapgipcaaaacaaaaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaa
egiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaafaaaaaa
egacbaaaafaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaafaaaaaapgapbaaaabaaaaaaegacbaaaafaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaafaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaafaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahicaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaadeaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaakccaabaaaabaaaaaaakiacaaaaaaaaaaa
alaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadpbjaaaaafccaabaaaabaaaaaa
bkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaabkaabaaa
abaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaaaoaaaaahgcaabaaa
abaaaaaaagbbbaaaagaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaaaeaaaaaa
jgafbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaa
afaaaaaaogbkbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaapaaaaah
ccaabaaaabaaaaaapgapbaaaafaaaaaaagaabaaaaeaaaaaadiaaaaaiocaabaaa
abaaaaaafgafbaaaabaaaaaaagijcaaaaaaaaaaaajaaaaaadiaaaaahhcaabaaa
aeaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaeaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaa
aeaaaaaaegaabaaaaeaaaaaaeghobaaaagaaaaaaaagabaaaadaaaaaadcaaaaak
hcaabaaaacaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaaapaaaaaaegacbaaa
acaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaaoaaaaaa
abeaaaaaaaaaiadpdcaaaaajhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
adaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
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
// Stats: 97 math, 8 textures
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
Float 13 [_Reflectioncubemappower]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Reflectioncubemap] CUBE 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"3.0-!!ARBfp1.0
PARAM c[25] = { program.local[0..20],
		{ 0, 0.97000003, 1, 2 },
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
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R4.xyz, R0.w, R0;
MOV R0.w, c[16].x;
MUL R0.z, R0.w, -c[24];
MUL R0.w, R0, c[23].y;
DP3 R0.x, R4, fragment.texcoord[3];
DP3 R0.y, fragment.texcoord[4], R4;
MUL R3.xy, R0, -c[16].x;
MAD R0.xy, R3, c[23].x, fragment.texcoord[0];
ADD R0.xy, R0, -c[23].y;
MUL R1.xy, R0.y, c[24];
MAD R0.xy, R0.x, c[23].zwzw, R1;
ADD R0.xy, R0, c[23].y;
ADD R0.z, R0, c[21];
MUL R0.xy, R0, c[15].x;
MUL R0.xy, R0, R0.z;
MUL R1.xy, R0, c[20].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[8].xyxy, c[8];
TEX R0.xyz, R1.zwzw, texture[5], 2D;
MUL R0.xyz, R0, c[10].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[5].xyxy, c[5];
TEX R2.xyz, R1.zwzw, texture[2], 2D;
MAD R1.xy, R1, c[17], c[17].zwzw;
TEX R1.xyz, R1, texture[3], 2D;
ADD R1.xyz, -R1, c[21].z;
ADD R0.w, R0, c[21].z;
MAD R3.xy, -R3, c[23].x, fragment.texcoord[0];
MUL R3.xy, R3, R0.w;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R3.xy, R3, c[15].x;
RSQ R0.w, R0.w;
POW R0.x, R0.x, c[19].x;
POW R0.z, R0.z, c[19].x;
POW R0.y, R0.y, c[19].x;
MAD R0.xyz, R2, -R0, R0;
MAX R2.xyz, R1, R2;
MAD R1.xy, R3, c[17], c[17].zwzw;
MOV R3.xyz, c[14];
MUL R3.xyz, R3, c[11].x;
TEX R1.xyz, R1, texture[3], 2D;
MUL R1.xyz, R3, R1;
MUL R3.xyz, R2, c[9].x;
MUL R2.xyz, R0.w, fragment.texcoord[2];
DP3 R0.w, R2, -R4;
MUL R6.xyz, R2, R0.w;
POW R1.x, R1.x, c[18].x;
POW R1.z, R1.z, c[18].x;
POW R1.y, R1.y, c[18].x;
MAD R1.xyz, R3, -R1, R1;
ADD R5.xyz, R1, R0;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, R0;
ADD R0.xyz, R1, R4;
DP3 R0.w, R0, R0;
MAD R4.xyz, -R6, c[21].w, -R4;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.y, R2, R0;
DP3 R0.x, fragment.texcoord[6], fragment.texcoord[6];
RSQ R2.w, R0.x;
MAX R1.w, R0.y, c[21].x;
TEX R0, fragment.texcoord[6], texture[0], CUBE;
DP4 R0.y, R0, c[22];
RCP R2.w, R2.w;
MUL R0.x, R2.w, c[2].w;
MAD R0.y, -R0.x, c[21], R0;
MOV R0.w, c[21].z;
CMP R0.y, R0, c[3].x, R0.w;
MOV R0.x, c[24].w;
MUL R0.z, R0.x, c[6].x;
DP3 R0.x, fragment.texcoord[5], fragment.texcoord[5];
TEX R2.w, R0.x, texture[1], 2D;
TEX R4.xyz, R4, texture[4], CUBE;
MUL R4.xyz, R4, c[13].x;
ADD R5.xyz, R4, R5;
ADD R0.z, R0, c[21];
MUL R0.x, R2.w, R0.y;
EX2 R2.w, R0.z;
MUL R0.xyz, R0.x, c[4];
POW R1.w, R1.w, R2.w;
MUL R0.xyz, R0, c[21].w;
MUL R6.xyz, R0, R1.w;
DP3 R1.w, R2, R1;
MAX R1.w, R1, c[21].x;
MUL R6.xyz, R6, R5;
MAD R7.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R5.xyz, R7, texture[6], 2D;
MAD R1.xyz, R5, c[12], R4;
ADD R0.w, R0, -c[9].x;
MAD R1.xyz, R0.w, R3, R1;
MUL R0.xyz, R1.w, R0;
MAD result.color.xyz, R0, R1, R6;
MOV result.color.w, c[21].x;
END
# 97 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 109 math, 8 textures
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
Float 13 [_Reflectioncubemappower]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Reflectioncubemap] CUBE 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"ps_3_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_cube s4
dcl_2d s5
dcl_2d s6
def c21, 0.00000000, 0.97000003, 2.00000000, 1.00000000
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
add r1.xyz, -v1, c0
dp3 r0.x, r1, r1
rsq r0.x, r0.x
mul r1.xyz, r0.x, r1
dp3 r0.w, v4, r1
dp3 r0.z, r1, v3
mul r3.zw, r0, -c16.x
mad r2.xy, r3.zwzw, c23.x, v0
add r5.xy, r2, c23.y
mul r3.xy, r5.y, c23.zwzw
mad r3.xy, r5.x, c24, r3
mad r0.xy, v0, c8, c8.zwzw
texld r0.xyz, r0, s5
mul r0.xyz, r0, c10.x
pow r2, r0.y, c19.x
pow r4, r0.x, c19.x
mov r0.x, r4
pow r4, r0.z, c19.x
mov r0.y, r2
mad r2.xy, v0, c5, c5.zwzw
mov r0.w, c16.x
add r3.xy, r3, c24.z
mov r0.z, r4
texld r2.xyz, r2, s2
mad r0.xyz, r2, -r0, r0
mad r0.w, r0, c25.x, c25.y
mul r3.xy, r3, c15.x
mul r3.xy, r3, r0.w
mov r0.w, c16.x
mul r3.xy, r3, c20.x
mad r3.xy, r3, c17, c17.zwzw
texld r4.xyz, r3, s3
mad r0.w, r0, c24.z, c24
mad r3.zw, -r3, c23.x, v0.xyxy
mul r3.zw, r3, r0.w
mul r3.zw, r3, c15.x
mov r0.w, c11.x
mad r3.xy, r3.zwzw, c17, c17.zwzw
mul r5.xyz, c14, r0.w
texld r3.xyz, r3, s3
mul r3.xyz, r5, r3
add r5.xyz, -r4, c21.w
max r2.xyz, r5, r2
pow r5, r3.y, c18.x
pow r4, r3.x, c18.x
mov r3.x, r4
pow r4, r3.z, c18.x
mul r2.xyz, r2, c9.x
mov r3.z, r4
mov r3.y, r5
mad r3.xyz, r2, -r3, r3
add r4.xyz, r3, r0
mad r3.xyz, -v1, c1.w, c1
dp3 r0.x, r3, r3
rsq r0.w, r0.x
mul r3.xyz, r0.w, r3
dp3 r0.y, v2, v2
rsq r0.y, r0.y
mul r0.xyz, r0.y, v2
dp3 r0.w, r0, -r1
mul r6.xyz, r0, r0.w
add r5.xyz, r3, r1
mad r1.xyz, -r6, c21.z, -r1
dp3 r0.w, r5, r5
rsq r0.w, r0.w
mul r5.xyz, r0.w, r5
dp3 r1.w, r0, r5
dp3 r0.y, r0, r3
texld r1.xyz, r1, s4
mad r4.xyz, r1, c13.x, r4
mov r0.w, c6.x
mad r0.w, r0, c25.z, c25.y
mov r0.x, c9
texld r6, v6, s0
max r1.w, r1, c21.x
exp r0.w, r0.w
pow r5, r1.w, r0.w
dp3 r2.w, v6, v6
rsq r0.w, r2.w
rcp r1.w, r0.w
dp4 r0.w, r6, c22
mul r1.w, r1, c2
mad r1.w, -r1, c21.y, r0
mov r0.w, c3.x
dp3 r6.x, v5, v5
texld r6.x, r6.x, s1
cmp r0.w, r1, c21, r0
mul r0.w, r6.x, r0
mul r6.xyz, r0.w, c4
mov r0.w, r5.x
mul r5.xyz, r6, c21.z
mul r6.xyz, r5, r0.w
mul r4.xyz, r6, r4
mad r6.xy, v0, c7, c7.zwzw
max r0.w, r0.y, c21.x
mul r1.xyz, r1, c13.x
texld r6.xyz, r6, s6
mad r1.xyz, r6, c12, r1
add r0.x, c21.w, -r0
mad r0.xyz, r0.x, r2, r1
mul r1.xyz, r0.w, r5
mad oC0.xyz, r1, r0, r4
mov_pp oC0.w, c21.x
"
}
SubProgram "d3d11 " {
// Stats: 80 math, 8 textures
Keywords { "POINT" "SHADOWS_CUBE" }
SetTexture 0 [_LightTexture0] 2D 1
SetTexture 1 [_ShadowMapTexture] CUBE 0
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 6
SetTexture 4 [_Reflectioncubemap] CUBE 5
SetTexture 5 [_Specularglitter] 2D 4
SetTexture 6 [_MainTex] 2D 3
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Float 192 [_Reflectioncubemappower]
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
eefiecedolnikkdcpgplaebcmlfaggphkakaedcoabaaaaaabaaoaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcmaamaaaaeaaaaaaadaadaaaafjaaaaaeegiocaaa
aaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaacaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafidaaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaa
agaaaaaagcbaaaadhcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
agaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaa
aaaaaadpabeaaaaaaaaaiadpdiaaaaalgcaabaaaaaaaaaaafgifcaaaaaaaaaaa
aoaaaaaaaceaaaaaaaaaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaajhcaabaaa
abaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaa
acaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaa
dcaaaaajpcaabaaaadaaaaaafgakbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaa
abaaaaaadiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaadaaaaaa
aaaaaaakdcaabaaaadaaaaaaogakbaaaadaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaaoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaagaaaaaadiaaaaajhcaabaaa
aaaaaaaakgikcaaaaaaaaaaaakaaaaaaegiccaaaaaaaaaaaanaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaaaaaaaacpaaaaafhcaabaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
agiacaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
apaaaaakbcaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaadaaaaaaegaabaaa
aeaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
adaaaaaaegaabaaaadaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaadaaaaaapgapbaaaabaaaaaaegaabaaaadaaaaaa
diaaaaaidcaabaaaadaaaaaaegaabaaaadaaaaaakgikcaaaaaaaaaaabaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegaabaaaadaaaaaaegiacaaaaaaaaaaaapaaaaaa
ogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaadaaaaaaaagabaaaagaaaaaaaaaaaaalhcaabaaaadaaaaaaegacbaia
ebaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaadeaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaaaaeaaaaaadiaaaaaihcaabaaaadaaaaaaegacbaaaadaaaaaaagiacaaa
aaaaaaaaakaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaia
ebaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaaj
pcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaafaaaaaaaagabaaaaeaaaaaa
diaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaaakaaaaaa
cpaaaaafhcaabaaaafaaaaaaegacbaaaafaaaaaadiaaaaaihcaabaaaafaaaaaa
egacbaaaafaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaafaaaaaa
egacbaaaafaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaia
ebaaaaaaafaaaaaaegacbaaaafaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaaeaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaabaaaaaaiicaabaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaaegacbaaaaeaaaaaaaaaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaacaaaaaa
egacbaaaaeaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
efaaaaajpcaabaaaacaaaaaaegacbaaaacaaaaaaeghobaaaaeaaaaaaaagabaaa
afaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaa
amaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
agiacaaaaaaaaaaaamaaaaaadcaaaaamhcaabaaaafaaaaaapgipcaaaacaaaaaa
aaaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaah
icaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaafaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaafaaaaaapgapbaaaabaaaaaa
egacbaaaafaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaafaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaa
egacbaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaaeaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaak
ccaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaacaebabeaaaaa
aaaaiadpbjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaabkaabaaaabaaaaaabjaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaahaaaaaaegbcbaaa
ahaaaaaaelaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaaiccaabaaa
abaaaaaabkaabaaaabaaaaaadkiacaaaacaaaaaaabaaaaaadiaaaaahccaabaaa
abaaaaaabkaabaaaabaaaaaaabeaaaaaomfbhidpefaaaaajpcaabaaaaeaaaaaa
egbcbaaaahaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaabbaaaaakecaabaaa
abaaaaaaegaobaaaaeaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdhafidibdd
dbaaaaahccaabaaaabaaaaaackaabaaaabaaaaaabkaabaaaabaaaaaadhaaaaak
ccaabaaaabaaaaaabkaabaaaabaaaaaaakiacaaaadaaaaaabiaaaaaaabeaaaaa
aaaaiadpbaaaaaahecaabaaaabaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaa
efaaaaajpcaabaaaaeaaaaaakgakbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaaapaaaaahccaabaaaabaaaaaaagaabaaaaeaaaaaafgafbaaaabaaaaaa
diaaaaaiocaabaaaabaaaaaafgafbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaa
diaaaaahhcaabaaaaeaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaaldcaabaaaaeaaaaaa
egbabaaaabaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
efaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaagaaaaaaaagabaaa
adaaaaaadcaaaaakhcaabaaaacaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaa
alaaaaaaegacbaaaacaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaa
aaaaaaaaakaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaacaaaaaapgapbaaa
aaaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 99 math, 9 textures
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
Float 13 [_Reflectioncubemappower]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Reflectioncubemap] CUBE 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"3.0-!!ARBfp1.0
PARAM c[25] = { program.local[0..20],
		{ 0, 0.97000003, 1, 2 },
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
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R4.xyz, R0.w, R0;
MOV R0.w, c[16].x;
MUL R0.z, R0.w, -c[24];
MUL R0.w, R0, c[23].y;
DP3 R0.x, R4, fragment.texcoord[3];
DP3 R0.y, fragment.texcoord[4], R4;
MUL R3.xy, R0, -c[16].x;
MAD R0.xy, R3, c[23].x, fragment.texcoord[0];
ADD R0.xy, R0, -c[23].y;
MUL R1.xy, R0.y, c[24];
MAD R0.xy, R0.x, c[23].zwzw, R1;
ADD R0.xy, R0, c[23].y;
ADD R0.z, R0, c[21];
MUL R0.xy, R0, c[15].x;
MUL R0.xy, R0, R0.z;
MUL R1.xy, R0, c[20].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[8].xyxy, c[8];
TEX R0.xyz, R1.zwzw, texture[6], 2D;
MUL R0.xyz, R0, c[10].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[5].xyxy, c[5];
TEX R2.xyz, R1.zwzw, texture[3], 2D;
MAD R1.xy, R1, c[17], c[17].zwzw;
TEX R1.xyz, R1, texture[4], 2D;
ADD R1.xyz, -R1, c[21].z;
ADD R0.w, R0, c[21].z;
MAD R3.xy, -R3, c[23].x, fragment.texcoord[0];
MUL R3.xy, R3, R0.w;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R3.xy, R3, c[15].x;
RSQ R0.w, R0.w;
MOV R2.w, c[21].z;
POW R0.x, R0.x, c[19].x;
POW R0.z, R0.z, c[19].x;
POW R0.y, R0.y, c[19].x;
MAD R0.xyz, R2, -R0, R0;
MAX R2.xyz, R1, R2;
MAD R1.xy, R3, c[17], c[17].zwzw;
MOV R3.xyz, c[14];
MUL R3.xyz, R3, c[11].x;
TEX R1.xyz, R1, texture[4], 2D;
MUL R1.xyz, R3, R1;
MUL R3.xyz, R2, c[9].x;
POW R1.x, R1.x, c[18].x;
POW R1.z, R1.z, c[18].x;
POW R1.y, R1.y, c[18].x;
MAD R1.xyz, R3, -R1, R1;
ADD R5.xyz, R1, R0;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R1.x, R0, R0;
RSQ R1.w, R1.x;
MUL R1.xyz, R0.w, fragment.texcoord[2];
MUL R2.xyz, R1.w, R0;
DP3 R0.w, R1, -R4;
MUL R6.xyz, R1, R0.w;
ADD R0.xyz, R2, R4;
DP3 R0.w, R0, R0;
MAD R4.xyz, -R6, c[21].w, -R4;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.y, R1, R0;
DP3 R0.x, fragment.texcoord[6], fragment.texcoord[6];
RSQ R1.w, R0.x;
MAX R3.w, R0.y, c[21].x;
TEX R0, fragment.texcoord[6], texture[0], CUBE;
DP4 R0.y, R0, c[22];
RCP R1.w, R1.w;
MUL R0.x, R1.w, c[2].w;
MAD R0.x, -R0, c[21].y, R0.y;
MOV R0.y, c[24].w;
MUL R0.z, R0.y, c[6].x;
DP3 R0.y, fragment.texcoord[5], fragment.texcoord[5];
TEX R4.xyz, R4, texture[5], CUBE;
MUL R4.xyz, R4, c[13].x;
TEX R1.w, R0.y, texture[1], 2D;
TEX R0.w, fragment.texcoord[5], texture[2], CUBE;
MUL R0.y, R1.w, R0.w;
ADD R0.z, R0, c[21];
EX2 R0.w, R0.z;
CMP R0.x, R0, c[3], R2.w;
MUL R0.x, R0.y, R0;
MUL R0.xyz, R0.x, c[4];
ADD R5.xyz, R4, R5;
POW R0.w, R3.w, R0.w;
MUL R0.xyz, R0, c[21].w;
MUL R6.xyz, R0, R0.w;
DP3 R0.w, R1, R2;
MAX R0.w, R0, c[21].x;
MUL R6.xyz, R6, R5;
MAD R7.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R5.xyz, R7, texture[7], 2D;
MAD R1.xyz, R5, c[12], R4;
ADD R1.w, R2, -c[9].x;
MAD R1.xyz, R1.w, R3, R1;
MUL R0.xyz, R0.w, R0;
MAD result.color.xyz, R0, R1, R6;
MOV result.color.w, c[21].x;
END
# 99 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 110 math, 9 textures
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
Float 13 [_Reflectioncubemappower]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Reflectioncubemap] CUBE 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"ps_3_0
dcl_cube s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
dcl_2d s4
dcl_cube s5
dcl_2d s6
dcl_2d s7
def c21, 0.00000000, 0.97000003, 2.00000000, 1.00000000
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
add r1.xyz, -v1, c0
dp3 r0.x, r1, r1
rsq r0.x, r0.x
mul r1.xyz, r0.x, r1
dp3 r0.w, v4, r1
dp3 r0.z, r1, v3
mul r3.zw, r0, -c16.x
mad r2.xy, r3.zwzw, c23.x, v0
add r5.xy, r2, c23.y
mul r3.xy, r5.y, c23.zwzw
mad r3.xy, r5.x, c24, r3
mad r0.xy, v0, c8, c8.zwzw
texld r0.xyz, r0, s6
mul r0.xyz, r0, c10.x
pow r2, r0.y, c19.x
pow r4, r0.x, c19.x
mov r0.x, r4
pow r4, r0.z, c19.x
mov r0.y, r2
mad r2.xy, v0, c5, c5.zwzw
mov r0.w, c16.x
add r3.xy, r3, c24.z
mov r0.z, r4
texld r2.xyz, r2, s3
mad r0.xyz, r2, -r0, r0
mad r0.w, r0, c25.x, c25.y
mul r3.xy, r3, c15.x
mul r3.xy, r3, r0.w
mov r0.w, c16.x
mul r3.xy, r3, c20.x
mad r3.xy, r3, c17, c17.zwzw
texld r4.xyz, r3, s4
mad r0.w, r0, c24.z, c24
mad r3.zw, -r3, c23.x, v0.xyxy
mul r3.zw, r3, r0.w
mul r3.zw, r3, c15.x
mov r0.w, c11.x
mad r3.xy, r3.zwzw, c17, c17.zwzw
mul r5.xyz, c14, r0.w
texld r3.xyz, r3, s4
mul r3.xyz, r5, r3
add r5.xyz, -r4, c21.w
max r2.xyz, r5, r2
pow r5, r3.y, c18.x
pow r4, r3.x, c18.x
mov r3.x, r4
pow r4, r3.z, c18.x
mul r2.xyz, r2, c9.x
mov r3.z, r4
mov r3.y, r5
mad r3.xyz, r2, -r3, r3
add r4.xyz, r3, r0
mad r3.xyz, -v1, c1.w, c1
dp3 r0.w, r3, r3
rsq r1.w, r0.w
mul r3.xyz, r1.w, r3
dp3 r0.x, v2, v2
rsq r0.x, r0.x
mul r0.xyz, r0.x, v2
dp3 r0.w, r0, -r1
mul r6.xyz, r0, r0.w
add r5.xyz, r3, r1
mad r1.xyz, -r6, c21.z, -r1
dp3 r0.w, r5, r5
rsq r1.w, r0.w
mul r5.xyz, r1.w, r5
dp3 r1.w, r0, r5
dp3 r0.y, r0, r3
texld r1.xyz, r1, s5
mad r4.xyz, r1, c13.x, r4
mov r0.w, c6.x
mad r0.w, r0, c25.z, c25.y
mov r0.x, c9
texld r6, v6, s0
exp r0.w, r0.w
max r1.w, r1, c21.x
pow r5, r1.w, r0.w
dp4 r1.w, r6, c22
dp3 r0.w, v6, v6
rsq r0.w, r0.w
rcp r2.w, r0.w
mul r2.w, r2, c2
dp3 r6.x, v5, v5
mov r0.w, c3.x
mad r1.w, -r2, c21.y, r1
cmp r1.w, r1, c21, r0
texld r6.x, r6.x, s1
texld r0.w, v5, s2
mul r0.w, r6.x, r0
mul r0.w, r0, r1
mul r6.xyz, r0.w, c4
mov r0.w, r5.x
mul r5.xyz, r6, c21.z
mul r6.xyz, r5, r0.w
mul r4.xyz, r6, r4
mad r6.xy, v0, c7, c7.zwzw
max r0.w, r0.y, c21.x
mul r1.xyz, r1, c13.x
texld r6.xyz, r6, s7
mad r1.xyz, r6, c12, r1
add r0.x, c21.w, -r0
mad r0.xyz, r0.x, r2, r1
mul r1.xyz, r0.w, r5
mad oC0.xyz, r1, r0, r4
mov_pp oC0.w, c21.x
"
}
SubProgram "d3d11 " {
// Stats: 81 math, 9 textures
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
SetTexture 0 [_LightTextureB0] 2D 2
SetTexture 1 [_LightTexture0] CUBE 1
SetTexture 2 [_ShadowMapTexture] CUBE 0
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 7
SetTexture 5 [_Reflectioncubemap] CUBE 6
SetTexture 6 [_Specularglitter] 2D 5
SetTexture 7 [_MainTex] 2D 4
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Float 192 [_Reflectioncubemappower]
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
eefiecedpeolakmfmhkamapiomceokbncmapchleabaaaaaagmaoaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcbmanaaaaeaaaaaaaehadaaaafjaaaaaeegiocaaa
aaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaacaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafidaaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafidaaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaa
agaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaa
gcbaaaadhcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaa
dcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaiadpdiaaaaalgcaabaaaaaaaaaaafgifcaaaaaaaaaaaaoaaaaaa
aceaaaaaaaaaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaa
baaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaaj
pcaabaaaadaaaaaafgakbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaa
diaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaadaaaaaaaaaaaaak
dcaabaaaadaaaaaaogakbaaaadaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaa
aoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaa
apaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaa
aaaaaaaaeghobaaaaeaaaaaaaagabaaaahaaaaaadiaaaaajhcaabaaaaaaaaaaa
kgikcaaaaaaaaaaaakaaaaaaegiccaaaaaaaaaaaanaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaaaaaaaaacpaaaaafhcaabaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaagiacaaa
aaaaaaaabaaaaaaabjaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaaapaaaaak
bcaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaa
aaaaaaaaapaaaaakccaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaallnnalk
olpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaadaaaaaaegaabaaaaeaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaadaaaaaa
egaabaaaadaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaalicaabaaaabaaaaaa
bkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadp
diaaaaahdcaabaaaadaaaaaapgapbaaaabaaaaaaegaabaaaadaaaaaadiaaaaai
dcaabaaaadaaaaaaegaabaaaadaaaaaakgikcaaaaaaaaaaabaaaaaaadcaaaaal
dcaabaaaadaaaaaaegaabaaaadaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaa
aaaaaaaaapaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
aeaaaaaaaagabaaaahaaaaaaaaaaaaalhcaabaaaadaaaaaaegacbaiaebaaaaaa
adaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaa
aeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaadaaaaaa
aagabaaaadaaaaaadeaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaa
aeaaaaaadiaaaaaihcaabaaaadaaaaaaegacbaaaadaaaaaaagiacaaaaaaaaaaa
akaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaajpcaabaaa
afaaaaaaegaabaaaafaaaaaaeghobaaaagaaaaaaaagabaaaafaaaaaadiaaaaai
hcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaaakaaaaaacpaaaaaf
hcaabaaaafaaaaaaegacbaaaafaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaa
afaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaafaaaaaaegacbaaa
afaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaiaebaaaaaa
afaaaaaaegacbaaaafaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
aeaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaabaaaaaaiicaabaaaabaaaaaa
egacbaiaebaaaaaaacaaaaaaegacbaaaaeaaaaaaaaaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaa
aeaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaacaaaaaaefaaaaaj
pcaabaaaacaaaaaaegacbaaaacaaaaaaeghobaaaafaaaaaaaagabaaaagaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaamaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaamaaaaaadcaaaaamhcaabaaaafaaaaaapgipcaaaacaaaaaaaaaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaa
abaaaaaaegacbaaaafaaaaaaegacbaaaafaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhcaabaaaafaaaaaapgapbaaaabaaaaaaegacbaaa
afaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaafaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaa
afaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakccaabaaa
abaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadp
bjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaabkaabaaaabaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaahaaaaaaegbcbaaaahaaaaaa
elaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaaiccaabaaaabaaaaaa
bkaabaaaabaaaaaadkiacaaaacaaaaaaabaaaaaadiaaaaahccaabaaaabaaaaaa
bkaabaaaabaaaaaaabeaaaaaomfbhidpefaaaaajpcaabaaaaeaaaaaaegbcbaaa
ahaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaabbaaaaakecaabaaaabaaaaaa
egaobaaaaeaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdhafidibdddbaaaaah
ccaabaaaabaaaaaackaabaaaabaaaaaabkaabaaaabaaaaaadhaaaaakccaabaaa
abaaaaaabkaabaaaabaaaaaaakiacaaaadaaaaaabiaaaaaaabeaaaaaaaaaiadp
baaaaaahecaabaaaabaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaaj
pcaabaaaaeaaaaaakgakbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
efaaaaajpcaabaaaafaaaaaaegbcbaaaagaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaadiaaaaahecaabaaaabaaaaaaakaabaaaaeaaaaaadkaabaaaafaaaaaa
apaaaaahccaabaaaabaaaaaakgakbaaaabaaaaaafgafbaaaabaaaaaadiaaaaai
ocaabaaaabaaaaaafgafbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaah
hcaabaaaaeaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaeaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaahaaaaaaaagabaaaaeaaaaaa
dcaaaaakhcaabaaaacaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaaalaaaaaa
egacbaaaacaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaa
akaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
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
// Stats: 109 math, 12 textures
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
Float 16 [_Reflectioncubemappower]
Vector 17 [_Glittercolor]
Float 18 [_Glitterymaskdotsscale]
Float 19 [_Glitteryspeed01]
Vector 20 [_Glittermap_ST]
Float 21 [_Glittercontrast13]
Float 22 [_Specularcontrast13]
Float 23 [_Maskadjust0515]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Reflectioncubemap] CUBE 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"3.0-!!ARBfp1.0
PARAM c[27] = { program.local[0..23],
		{ 0, 0.5, 1, 0.25 },
		{ 2, 0.050000001, -0.99999875, -0.001592548 },
		{ 0.001592548, -0.99999875, 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R5.xyz, R0.w, R0;
MOV R0.w, c[19].x;
MUL R0.z, R0.w, -c[26];
RCP R3.w, fragment.texcoord[6].w;
DP3 R0.x, R5, fragment.texcoord[3];
DP3 R0.y, fragment.texcoord[4], R5;
MUL R3.xy, R0, -c[19].x;
MAD R0.xy, R3, c[25].y, fragment.texcoord[0];
ADD R0.xy, R0, -c[24].y;
MUL R1.xy, R0.y, c[26];
MAD R0.xy, R0.x, c[25].zwzw, R1;
ADD R0.xy, R0, c[24].y;
ADD R0.z, R0, c[24];
MUL R0.xy, R0, c[18].x;
MUL R0.xy, R0, R0.z;
MUL R0.xy, R0, c[23].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[11].xyxy, c[11];
MAD R1.xy, R0, c[20], c[20].zwzw;
TEX R0.xyz, R1.zwzw, texture[6], 2D;
MUL R0.xyz, R0, c[13].x;
MAD R1.zw, fragment.texcoord[0].xyxy, c[8].xyxy, c[8];
TEX R2.xyz, R1.zwzw, texture[3], 2D;
TEX R1.xyz, R1, texture[4], 2D;
ADD R1.xyz, -R1, c[24].z;
MAD R0.w, R0, c[24].y, c[24].z;
MAD R3.xy, -R3, c[25].y, fragment.texcoord[0];
MUL R3.xy, R3, R0.w;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R3.xy, R3, c[18].x;
RSQ R0.w, R0.w;
POW R0.x, R0.x, c[22].x;
POW R0.z, R0.z, c[22].x;
POW R0.y, R0.y, c[22].x;
MAD R0.xyz, R2, -R0, R0;
MAX R2.xyz, R1, R2;
MAD R1.xy, R3, c[20], c[20].zwzw;
MUL R4.xyz, R2, c[12].x;
MUL R2.xyz, R0.w, fragment.texcoord[2];
DP3 R0.w, R2, -R5;
MOV R3.xyz, c[17];
MUL R6.xyz, R2, R0.w;
MUL R3.xyz, R3, c[14].x;
TEX R1.xyz, R1, texture[4], 2D;
MUL R1.xyz, R3, R1;
POW R1.x, R1.x, c[21].x;
POW R1.z, R1.z, c[21].x;
POW R1.y, R1.y, c[21].x;
MAD R1.xyz, R4, -R1, R1;
ADD R1.xyz, R1, R0;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R1.w, R0, R0;
RSQ R1.w, R1.w;
MUL R3.xyz, R1.w, R0;
ADD R0.xyz, R3, R5;
DP3 R0.w, R0, R0;
MAD R5.xyz, -R6, c[25].x, -R5;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, R2, R0;
MAX R2.w, R0.x, c[24].x;
MAD R0.xy, fragment.texcoord[6], R3.w, c[6];
TEX R0.x, R0, texture[2], 2D;
MOV R1.w, R0.x;
MAD R0.xy, fragment.texcoord[6], R3.w, c[4];
TEX R5.xyz, R5, texture[5], CUBE;
MUL R5.xyz, R5, c[16].x;
ADD R6.xyz, R5, R1;
MAD R0.zw, fragment.texcoord[6].xyxy, R3.w, c[5].xyxy;
TEX R1.x, R0.zwzw, texture[2], 2D;
TEX R0.x, R0, texture[2], 2D;
MOV R1.z, R1.x;
MAD R0.zw, fragment.texcoord[6].xyxy, R3.w, c[3].xyxy;
TEX R1.x, R0.zwzw, texture[2], 2D;
MOV R1.y, R0.x;
MAD R0, -fragment.texcoord[6].z, R3.w, R1;
MOV R1.w, c[24].z;
CMP R0, R0, c[2].x, R1.w;
DP4 R0.x, R0, c[24].w;
RCP R1.x, fragment.texcoord[5].w;
MAD R1.xy, fragment.texcoord[5], R1.x, c[24].y;
TEX R0.w, R1, texture[0], 2D;
SLT R0.y, c[24].x, fragment.texcoord[5].z;
MUL R0.z, R0.y, R0.w;
MOV R0.y, c[26].w;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
MUL R1.x, R0.y, c[9];
TEX R0.w, R0.w, texture[1], 2D;
MUL R0.y, R0.z, R0.w;
MUL R0.x, R0.y, R0;
ADD R0.z, R1.x, c[24];
EX2 R0.y, R0.z;
POW R0.w, R2.w, R0.y;
MUL R0.x, R0, c[25];
MUL R0.xyz, R0.x, c[7];
MUL R1.xyz, R0, R0.w;
DP3 R0.w, R2, R3;
MAX R0.w, R0, c[24].x;
MUL R6.xyz, R1, R6;
MAD R7.xy, fragment.texcoord[0], c[10], c[10].zwzw;
TEX R1.xyz, R7, texture[7], 2D;
MAD R1.xyz, R1, c[15], R5;
ADD R1.w, R1, -c[12].x;
MAD R1.xyz, R1.w, R4, R1;
MUL R0.xyz, R0.w, R0;
MAD result.color.xyz, R0, R1, R6;
MOV result.color.w, c[24].x;
END
# 109 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 118 math, 12 textures
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
Float 16 [_Reflectioncubemappower]
Vector 17 [_Glittercolor]
Float 18 [_Glitterymaskdotsscale]
Float 19 [_Glitteryspeed01]
Vector 20 [_Glittermap_ST]
Float 21 [_Glittercontrast13]
Float 22 [_Specularcontrast13]
Float 23 [_Maskadjust0515]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Reflectioncubemap] CUBE 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_cube s5
dcl_2d s6
dcl_2d s7
def c24, 0.00000000, 1.00000000, 0.50000000, 0.25000000
def c25, 2.00000000, 0.05000000, -0.50000000, 0
def c26, 0.00159374, -0.99999875, -0.00159374, 0
def c27, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
dcl_texcoord6 v6
add r0.xyz, -v1, c0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mov r0.w, c19.x
dp3 r1.x, r0, v3
dp3 r1.y, v4, r0
mul r1.xy, r1, -c19.x
mad r1.zw, r1.xyxy, c25.y, v0.xyxy
add r1.zw, r1, c25.z
mul r2.xy, r1.w, c26
mad r1.zw, r1.z, c26.xyyz, r2.xyxy
mad r2.xy, -r1, c25.y, v0
add r1.zw, r1, c24.z
mov r1.x, c19
mad r1.x, r1, c24.z, c24.y
mul r2.xy, r2, r1.x
mul r1.zw, r1, c18.x
mad r0.w, r0, c27.x, c27.y
mul r1.xy, r1.zwzw, r0.w
mul r1.zw, r2.xyxy, c18.x
mul r2.xy, r1, c23.x
mad r1.xy, r1.zwzw, c20, c20.zwzw
mov r0.w, c14.x
mul r3.xyz, c17, r0.w
texld r1.xyz, r1, s4
mul r4.xyz, r3, r1
mad r1.xy, r2, c20, c20.zwzw
pow r3, r4.x, c21.x
mov r4.x, r3
mad r2.xy, v0, c8, c8.zwzw
texld r1.xyz, r1, s4
dp3 r0.w, v2, v2
texld r2.xyz, r2, s3
add r1.xyz, -r1, c24.y
max r1.xyz, r1, r2
mul r5.xyz, r1, c12.x
pow r1, r4.y, c21.x
mad r3.xy, v0, c11, c11.zwzw
mov r4.y, r1
texld r1.xyz, r3, s6
mul r6.xyz, r1, c13.x
pow r3, r4.z, c21.x
pow r1, r6.x, c22.x
mov r4.z, r3
pow r3, r6.y, c22.x
mov r6.x, r1
pow r1, r6.z, c22.x
mov r6.z, r1
mad r1.xyz, -v1, c1.w, c1
mov r6.y, r3
dp3 r1.w, r1, r1
rsq r1.w, r1.w
mad r2.xyz, r2, -r6, r6
mul r3.xyz, r1.w, r1
add r6.xyz, r3, r0
mad r4.xyz, r5, -r4, r4
add r4.xyz, r4, r2
rsq r0.w, r0.w
mul r2.xyz, r0.w, v2
dp3 r0.w, r2, -r0
mul r1.xyz, r2, r0.w
dp3 r1.w, r6, r6
rsq r0.w, r1.w
mad r1.xyz, -r1, c25.x, -r0
rcp r1.w, v6.w
mul r0.xyz, r0.w, r6
dp3 r0.x, r2, r0
texld r1.xyz, r1, s5
mad r6.xyz, r1, c16.x, r4
max r0.z, r0.x, c24.x
mov r0.y, c9.x
mad r0.x, r0.y, c27.z, c27.y
exp r0.w, r0.x
pow r4, r0.z, r0.w
mad r0.xy, v6, r1.w, c6
texld r0.x, r0, s2
mad r7.xy, v6, r1.w, c5
mov r0.w, r0.x
texld r0.x, r7, s2
mad r7.xy, v6, r1.w, c4
mov r0.z, r0.x
texld r0.x, r7, s2
mad r7.xy, v6, r1.w, c3
mov r0.y, r0.x
texld r0.x, r7, s2
mad r0, -v6.z, r1.w, r0
rcp r1.w, v5.w
mad r7.xy, v5, r1.w, c24.z
mov r2.w, c2.x
cmp r0, r0, c24.y, r2.w
dp4_pp r0.z, r0, c24.w
texld r0.w, r7, s0
dp3 r0.x, v5, v5
cmp r0.y, -v5.z, c24.x, c24
mov r1.w, c12.x
mul_pp r0.y, r0, r0.w
texld r0.x, r0.x, s1
mul_pp r0.x, r0.y, r0
mul_pp r0.x, r0, r0.z
mul_pp r0.x, r0, c25
mov r0.w, r4.x
mul r0.xyz, r0.x, c7
mul r4.xyz, r0, r0.w
mul r4.xyz, r4, r6
dp3 r0.w, r2, r3
max r0.w, r0, c24.x
mul r6.xyz, r1, c16.x
mad r7.xy, v0, c10, c10.zwzw
texld r1.xyz, r7, s7
mad r1.xyz, r1, c15, r6
add r1.w, c24.y, -r1
mad r1.xyz, r1.w, r5, r1
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r1, r4
mov_pp oC0.w, c24.x
"
}
SubProgram "d3d11 " {
// Stats: 87 math, 12 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
SetTexture 0 [_LightTexture0] 2D 1
SetTexture 1 [_LightTextureB0] 2D 2
SetTexture 2 [_ShadowMapTexture] 2D 0
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 7
SetTexture 5 [_Reflectioncubemap] CUBE 6
SetTexture 6 [_Specularglitter] 2D 5
SetTexture 7 [_MainTex] 2D 4
ConstBuffer "$Globals" 336
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
Float 256 [_Reflectioncubemappower]
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
eefiecedaelbnliebdeeddmodajepbkfhpcjbinoabaaaaaaoiapaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcjiaoaaaaeaaaaaaakgadaaaafjaaaaaeegiocaaa
aaaaaaaabfaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafidaaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaa
agaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaaagaaaaaa
gcbaaaadpcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaa
dcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaabcaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaiadpdiaaaaalgcaabaaaaaaaaaaafgifcaaaaaaaaaaabcaaaaaa
aceaaaaaaaaaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaa
baaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaaj
pcaabaaaadaaaaaafgakbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaa
diaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaadaaaaaaaaaaaaak
dcaabaaaadaaaaaaogakbaaaadaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaa
bcaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaa
bdaaaaaaogikcaaaaaaaaaaabdaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaa
aaaaaaaaeghobaaaaeaaaaaaaagabaaaahaaaaaadiaaaaajhcaabaaaaaaaaaaa
kgikcaaaaaaaaaaaaoaaaaaaegiccaaaaaaaaaaabbaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaaaaaaaaacpaaaaafhcaabaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaagiacaaa
aaaaaaaabeaaaaaabjaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaaapaaaaak
bcaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaa
aaaaaaaaapaaaaakccaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaallnnalk
olpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaadaaaaaaegaabaaaaeaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaadaaaaaa
egaabaaaadaaaaaaagiacaaaaaaaaaaabcaaaaaadcaaaaalicaabaaaabaaaaaa
bkiacaiaebaaaaaaaaaaaaaabcaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadp
diaaaaahdcaabaaaadaaaaaapgapbaaaabaaaaaaegaabaaaadaaaaaadiaaaaai
dcaabaaaadaaaaaaegaabaaaadaaaaaakgikcaaaaaaaaaaabeaaaaaadcaaaaal
dcaabaaaadaaaaaaegaabaaaadaaaaaaegiacaaaaaaaaaaabdaaaaaaogikcaaa
aaaaaaaabdaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
aeaaaaaaaagabaaaahaaaaaaaaaaaaalhcaabaaaadaaaaaaegacbaiaebaaaaaa
adaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaa
aeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaa
akaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaadaaaaaa
aagabaaaadaaaaaadeaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaa
aeaaaaaadiaaaaaihcaabaaaadaaaaaaegacbaaaadaaaaaaagiacaaaaaaaaaaa
aoaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaanaaaaaaogikcaaaaaaaaaaaanaaaaaaefaaaaajpcaabaaa
afaaaaaaegaabaaaafaaaaaaeghobaaaagaaaaaaaagabaaaafaaaaaadiaaaaai
hcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaaaoaaaaaacpaaaaaf
hcaabaaaafaaaaaaegacbaaaafaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaa
afaaaaaafgifcaaaaaaaaaaabeaaaaaabjaaaaafhcaabaaaafaaaaaaegacbaaa
afaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaiaebaaaaaa
afaaaaaaegacbaaaafaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
aeaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaabaaaaaaiicaabaaaabaaaaaa
egacbaiaebaaaaaaacaaaaaaegacbaaaaeaaaaaaaaaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaa
aeaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaacaaaaaaefaaaaaj
pcaabaaaacaaaaaaegacbaaaacaaaaaaeghobaaaafaaaaaaaagabaaaagaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaabaaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaabaaaaaaadcaaaaamhcaabaaaafaaaaaapgipcaaaacaaaaaaaaaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaa
abaaaaaaegacbaaaafaaaaaaegacbaaaafaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhcaabaaaafaaaaaapgapbaaaabaaaaaaegacbaaa
afaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaafaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaa
afaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakccaabaaa
abaaaaaaakiacaaaaaaaaaaaalaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadp
bjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaabkaabaaaabaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaaaoaaaaahocaabaaaabaaaaaaagbjbaaaahaaaaaapgbpbaaaahaaaaaa
aaaaaaaidcaabaaaaeaaaaaajgafbaaaabaaaaaaegiacaaaaaaaaaaaabaaaaaa
efaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaacaaaaaaaagabaaa
aaaaaaaaaaaaaaaidcaabaaaafaaaaaajgafbaaaabaaaaaaegiacaaaaaaaaaaa
acaaaaaaefaaaaajpcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaacaaaaaa
aagabaaaaaaaaaaadgaaaaafccaabaaaaeaaaaaaakaabaaaafaaaaaaaaaaaaai
dcaabaaaafaaaaaajgafbaaaabaaaaaaegiacaaaaaaaaaaaadaaaaaaefaaaaaj
pcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaa
dgaaaaafecaabaaaaeaaaaaaakaabaaaafaaaaaaaaaaaaaigcaabaaaabaaaaaa
fgagbaaaabaaaaaaagibcaaaaaaaaaaaaeaaaaaaefaaaaajpcaabaaaafaaaaaa
jgafbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaadgaaaaaficaabaaa
aeaaaaaaakaabaaaafaaaaaadbaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaa
pgapbaaaabaaaaaadhaaaaanpcaabaaaaeaaaaaaegaobaaaaeaaaaaaagiacaaa
adaaaaaabiaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpbbaaaaak
ccaabaaaabaaaaaaegaobaaaaeaaaaaaaceaaaaaaaaaiadoaaaaiadoaaaaiado
aaaaiadoaoaaaaahmcaabaaaabaaaaaaagbebaaaagaaaaaapgbpbaaaagaaaaaa
aaaaaaakmcaabaaaabaaaaaakgaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaadpaaaaaadpefaaaaajpcaabaaaaeaaaaaaogakbaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaabaaaaaadbaaaaahecaabaaaabaaaaaaabeaaaaaaaaaaaaa
ckbabaaaagaaaaaaabaaaaahecaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaa
aaaaiadpdiaaaaahecaabaaaabaaaaaadkaabaaaaeaaaaaackaabaaaabaaaaaa
baaaaaahicaabaaaabaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaaj
pcaabaaaaeaaaaaapgapbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaa
diaaaaahecaabaaaabaaaaaackaabaaaabaaaaaaakaabaaaaeaaaaaaapaaaaah
ccaabaaaabaaaaaakgakbaaaabaaaaaafgafbaaaabaaaaaadiaaaaaiocaabaaa
abaaaaaafgafbaaaabaaaaaaagijcaaaaaaaaaaaajaaaaaadiaaaaahhcaabaaa
aeaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaeaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaa
aeaaaaaaegaabaaaaeaaaaaaeghobaaaahaaaaaaaagabaaaaeaaaaaadcaaaaak
hcaabaaaacaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaaapaaaaaaegacbaaa
acaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaaoaaaaaa
abeaaaaaaaaaiadpdcaaaaajhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
adaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
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
// Stats: 109 math, 12 textures
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
Float 16 [_Reflectioncubemappower]
Vector 17 [_Glittercolor]
Float 18 [_Glitterymaskdotsscale]
Float 19 [_Glitteryspeed01]
Vector 20 [_Glittermap_ST]
Float 21 [_Glittercontrast13]
Float 22 [_Specularcontrast13]
Float 23 [_Maskadjust0515]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Reflectioncubemap] CUBE 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"3.0-!!ARBfp1.0
OPTION ARB_fragment_program_shadow;
PARAM c[27] = { program.local[0..23],
		{ 0, 0.5, 1, 0.25 },
		{ 2, 0.050000001, -0.99999875, -0.001592548 },
		{ 0.001592548, -0.99999875, 0.31830987, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
MOV R4.xyz, c[17];
RCP R2.w, fragment.texcoord[6].w;
DP3 R1.x, R0, fragment.texcoord[3];
DP3 R1.y, fragment.texcoord[4], R0;
MUL R3.xy, R1, -c[19].x;
MAD R1.xy, R3, c[25].y, fragment.texcoord[0];
ADD R1.xy, R1, -c[24].y;
MUL R1.zw, R1.y, c[26].xyxy;
MAD R1.xy, R1.x, c[25].zwzw, R1.zwzw;
MOV R0.w, c[19].x;
MUL R1.z, R0.w, -c[26];
ADD R1.xy, R1, c[24].y;
ADD R1.z, R1, c[24];
MUL R1.xy, R1, c[18].x;
MUL R1.xy, R1, R1.z;
MUL R1.xy, R1, c[23].x;
MAD R1.xy, R1, c[20], c[20].zwzw;
TEX R1.xyz, R1, texture[4], 2D;
ADD R2.xyz, -R1, c[24].z;
MAD R1.zw, -R3.xyxy, c[25].y, fragment.texcoord[0].xyxy;
MAD R0.w, R0, c[24].y, c[24].z;
MUL R3.xy, R1.zwzw, R0.w;
MAD R1.xy, fragment.texcoord[0], c[8], c[8].zwzw;
TEX R1.xyz, R1, texture[3], 2D;
MUL R3.xy, R3, c[18].x;
MAD R3.xy, R3, c[20], c[20].zwzw;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MAX R2.xyz, R2, R1;
MUL R4.xyz, R4, c[14].x;
TEX R3.xyz, R3, texture[4], 2D;
MUL R3.xyz, R4, R3;
MUL R4.xyz, R2, c[12].x;
MAD R2.xy, fragment.texcoord[0], c[11], c[11].zwzw;
TEX R2.xyz, R2, texture[6], 2D;
MUL R2.xyz, R2, c[13].x;
POW R2.x, R2.x, c[22].x;
POW R2.z, R2.z, c[22].x;
POW R2.y, R2.y, c[22].x;
MAD R1.xyz, R1, -R2, R2;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, fragment.texcoord[2];
DP3 R1.w, R2, -R0;
MUL R5.xyz, R2, R1.w;
MAD R5.xyz, -R5, c[25].x, -R0;
TEX R5.xyz, R5, texture[5], CUBE;
MUL R5.xyz, R5, c[16].x;
POW R3.x, R3.x, c[21].x;
POW R3.y, R3.y, c[21].x;
POW R3.z, R3.z, c[21].x;
MAD R3.xyz, R4, -R3, R3;
ADD R1.xyz, R3, R1;
MAD R3.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R3, R3;
RSQ R0.w, R0.w;
MUL R3.xyz, R0.w, R3;
ADD R0.xyz, R3, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R6.xyz, R0.w, R0;
DP3 R0.w, R2, R6;
MAD R0.xyz, fragment.texcoord[6], R2.w, c[6];
ADD R1.yzw, R5.xxyz, R1.xxyz;
MAD R6.xyz, fragment.texcoord[6], R2.w, c[4];
TEX R1.x, R6, texture[2], SHADOW2D;
MAD R6.xyz, fragment.texcoord[6], R2.w, c[3];
TEX R0.x, R0, texture[2], SHADOW2D;
MAX R3.w, R0, c[24].x;
MOV R0.w, R0.x;
MAD R0.xyz, fragment.texcoord[6], R2.w, c[5];
TEX R0.x, R0, texture[2], SHADOW2D;
MOV R0.z, R0.x;
MOV R0.y, R1.x;
MOV R2.w, c[24].z;
TEX R0.x, R6, texture[2], SHADOW2D;
RCP R1.x, fragment.texcoord[5].w;
ADD R4.w, R2, -c[2].x;
MAD R0, R0, R4.w, c[2].x;
DP4 R0.x, R0, c[24].w;
MAD R6.xy, fragment.texcoord[5], R1.x, c[24].y;
TEX R0.w, R6, texture[0], 2D;
SLT R0.y, c[24].x, fragment.texcoord[5].z;
MUL R0.z, R0.y, R0.w;
MOV R0.y, c[26].w;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
MUL R1.x, R0.y, c[9];
TEX R0.w, R0.w, texture[1], 2D;
MUL R0.y, R0.z, R0.w;
MUL R0.x, R0.y, R0;
ADD R0.z, R1.x, c[24];
EX2 R0.y, R0.z;
POW R0.w, R3.w, R0.y;
MUL R0.x, R0, c[25];
MUL R0.xyz, R0.x, c[7];
MUL R6.xyz, R0, R0.w;
MUL R6.xyz, R6, R1.yzww;
MAD R7.xy, fragment.texcoord[0], c[10], c[10].zwzw;
TEX R1.xyz, R7, texture[7], 2D;
DP3 R0.w, R2, R3;
MAX R0.w, R0, c[24].x;
MAD R1.xyz, R1, c[15], R5;
ADD R1.w, R2, -c[12].x;
MAD R1.xyz, R1.w, R4, R1;
MUL R0.xyz, R0.w, R0;
MAD result.color.xyz, R0, R1, R6;
MOV result.color.w, c[24].x;
END
# 109 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 118 math, 12 textures
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
Float 16 [_Reflectioncubemappower]
Vector 17 [_Glittercolor]
Float 18 [_Glitterymaskdotsscale]
Float 19 [_Glitteryspeed01]
Vector 20 [_Glittermap_ST]
Float 21 [_Glittercontrast13]
Float 22 [_Specularcontrast13]
Float 23 [_Maskadjust0515]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Reflectioncubemap] CUBE 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_cube s5
dcl_2d s6
dcl_2d s7
def c24, 0.00000000, 1.00000000, 0.50000000, 0.25000000
def c25, 2.00000000, 0.05000000, -0.50000000, 0
def c26, 0.00159374, -0.99999875, -0.00159374, 0
def c27, -0.31830987, 1.00000000, 10.00000000, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
dcl_texcoord6 v6
rcp r2.w, v6.w
add r0.xyz, -v1, c0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mov r0.w, c19.x
dp3 r1.x, r0, v3
dp3 r1.y, v4, r0
mul r1.xy, r1, -c19.x
mad r1.zw, r1.xyxy, c25.y, v0.xyxy
add r1.zw, r1, c25.z
mul r2.xy, r1.w, c26
mad r1.zw, r1.z, c26.xyyz, r2.xyxy
mad r2.xy, -r1, c25.y, v0
add r1.zw, r1, c24.z
mov r1.x, c19
mad r1.x, r1, c24.z, c24.y
mul r2.xy, r2, r1.x
mul r1.zw, r1, c18.x
mad r0.w, r0, c27.x, c27.y
mul r1.xy, r1.zwzw, r0.w
mul r1.zw, r2.xyxy, c18.x
mul r2.xy, r1, c23.x
mad r1.xy, r1.zwzw, c20, c20.zwzw
mov r0.w, c14.x
texld r1.xyz, r1, s4
mul r3.xyz, c17, r0.w
mul r4.xyz, r3, r1
mad r1.xy, r2, c20, c20.zwzw
pow r3, r4.x, c21.x
mov r4.x, r3
mad r2.xy, v0, c8, c8.zwzw
texld r1.xyz, r1, s4
texld r2.xyz, r2, s3
add r1.xyz, -r1, c24.y
max r1.xyz, r1, r2
mul r6.xyz, r1, c12.x
pow r1, r4.y, c21.x
mad r3.xy, v0, c11, c11.zwzw
mov r4.y, r1
texld r1.xyz, r3, s6
mul r5.xyz, r1, c13.x
pow r3, r4.z, c21.x
pow r1, r5.x, c22.x
mov r4.z, r3
pow r3, r5.y, c22.x
mov r5.x, r1
pow r1, r5.z, c22.x
mov r5.z, r1
mad r1.xyz, -v1, c1.w, c1
dp3 r0.w, r1, r1
rsq r1.w, r0.w
mov r5.y, r3
mad r2.xyz, r2, -r5, r5
mad r4.xyz, r6, -r4, r4
dp3 r0.w, v2, v2
rsq r0.w, r0.w
mul r3.xyz, r0.w, v2
mul r5.xyz, r1.w, r1
add r4.xyz, r4, r2
add r2.xyz, r5, r0
dp3 r1.x, r2, r2
rsq r1.w, r1.x
dp3 r0.w, r3, -r0
mul r1.xyz, r3, r0.w
mul r2.xyz, r1.w, r2
dp3 r0.w, r3, r2
mad r0.xyz, -r1, c25.x, -r0
texld r2.xyz, r0, s5
mov r0.x, c9
mad r1.x, r0, c27.z, c27.y
mad r0.xyz, v6, r2.w, c6
mad r1.yzw, r2.xxyz, c16.x, r4.xxyz
max r0.w, r0, c24.x
exp r1.x, r1.x
pow r4, r0.w, r1.x
texld r0.x, r0, s2
mov_pp r0.w, r0.x
mad r0.xyz, v6, r2.w, c5
texld r0.x, r0, s2
mad r7.xyz, v6, r2.w, c4
texld r1.x, r7, s2
mov_pp r0.z, r0.x
mov_pp r0.y, r1.x
mov r0.x, c2
add r1.x, c24.y, -r0
mad r7.xyz, v6, r2.w, c3
texld r0.x, r7, s2
mad r0, r0, r1.x, c2.x
dp4_pp r0.z, r0, c24.w
rcp r1.x, v5.w
mad r7.xy, v5, r1.x, c24.z
texld r0.w, r7, s0
dp3 r0.x, v5, v5
cmp r0.y, -v5.z, c24.x, c24
mul_pp r0.y, r0, r0.w
texld r0.x, r0.x, s1
mul_pp r0.x, r0.y, r0
mul_pp r0.x, r0, r0.z
mul_pp r0.x, r0, c25
mov r0.w, r4.x
mul r0.xyz, r0.x, c7
mul r4.xyz, r0, r0.w
mul r1.xyz, r4, r1.yzww
dp3 r0.w, r3, r5
mov r1.w, c12.x
max r0.w, r0, c24.x
mul r4.xyz, r2, c16.x
mad r7.xy, v0, c10, c10.zwzw
texld r2.xyz, r7, s7
mad r2.xyz, r2, c15, r4
add r1.w, c24.y, -r1
mad r2.xyz, r1.w, r6, r2
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c24.x
"
}
SubProgram "d3d11 " {
// Stats: 88 math, 8 textures
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
SetTexture 0 [_LightTexture0] 2D 1
SetTexture 1 [_LightTextureB0] 2D 2
SetTexture 2 [_Mask] 2D 3
SetTexture 3 [_Glittermap] 2D 7
SetTexture 4 [_Reflectioncubemap] CUBE 6
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 4
SetTexture 7 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 336
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
Float 256 [_Reflectioncubemappower]
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
eefiecedcmcgmepgonkgkmadjbclcicngfbdlkinabaaaaaamiapaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefchiaoaaaaeaaaaaaajoadaaaafjaaaaaeegiocaaa
aaaaaaaabfaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaiaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafidaaaaeaahabaaa
aeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaa
agaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaaagaaaaaa
gcbaaaadpcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacahaaaaaa
dcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaabcaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaiadpdiaaaaalgcaabaaaaaaaaaaafgifcaaaaaaaaaaabcaaaaaa
aceaaaaaaaaaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaa
baaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaaj
pcaabaaaadaaaaaafgakbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaa
diaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaadaaaaaaaaaaaaak
dcaabaaaadaaaaaaogakbaaaadaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaa
bcaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaa
bdaaaaaaogikcaaaaaaaaaaabdaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaa
aaaaaaaaeghobaaaadaaaaaaaagabaaaahaaaaaadiaaaaajhcaabaaaaaaaaaaa
kgikcaaaaaaaaaaaaoaaaaaaegiccaaaaaaaaaaabbaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaaaaaaaaacpaaaaafhcaabaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaagiacaaa
aaaaaaaabeaaaaaabjaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaaapaaaaak
bcaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaa
aaaaaaaaapaaaaakccaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaallnnalk
olpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaadaaaaaaegaabaaaaeaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaadaaaaaa
egaabaaaadaaaaaaagiacaaaaaaaaaaabcaaaaaadcaaaaalicaabaaaabaaaaaa
bkiacaiaebaaaaaaaaaaaaaabcaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadp
diaaaaahdcaabaaaadaaaaaapgapbaaaabaaaaaaegaabaaaadaaaaaadiaaaaai
dcaabaaaadaaaaaaegaabaaaadaaaaaakgikcaaaaaaaaaaabeaaaaaadcaaaaal
dcaabaaaadaaaaaaegaabaaaadaaaaaaegiacaaaaaaaaaaabdaaaaaaogikcaaa
aaaaaaaabdaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
adaaaaaaaagabaaaahaaaaaaaaaaaaalhcaabaaaadaaaaaaegacbaiaebaaaaaa
adaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaa
aeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaa
akaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaacaaaaaa
aagabaaaadaaaaaadeaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaa
aeaaaaaadiaaaaaihcaabaaaadaaaaaaegacbaaaadaaaaaaagiacaaaaaaaaaaa
aoaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaanaaaaaaogikcaaaaaaaaaaaanaaaaaaefaaaaajpcaabaaa
afaaaaaaegaabaaaafaaaaaaeghobaaaafaaaaaaaagabaaaafaaaaaadiaaaaai
hcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaaaoaaaaaacpaaaaaf
hcaabaaaafaaaaaaegacbaaaafaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaa
afaaaaaafgifcaaaaaaaaaaabeaaaaaabjaaaaafhcaabaaaafaaaaaaegacbaaa
afaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaiaebaaaaaa
afaaaaaaegacbaaaafaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
aeaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaabaaaaaaiicaabaaaabaaaaaa
egacbaiaebaaaaaaacaaaaaaegacbaaaaeaaaaaaaaaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaa
aeaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaacaaaaaaefaaaaaj
pcaabaaaacaaaaaaegacbaaaacaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaabaaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaabaaaaaaadcaaaaamhcaabaaaafaaaaaapgipcaaaacaaaaaaaaaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaa
abaaaaaaegacbaaaafaaaaaaegacbaaaafaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhcaabaaaafaaaaaapgapbaaaabaaaaaaegacbaaa
afaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaafaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaa
afaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakccaabaaa
abaaaaaaakiacaaaaaaaaaaaalaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadp
bjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaabkaabaaaabaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaaaaaaaaajccaabaaaabaaaaaaakiacaiaebaaaaaaadaaaaaabiaaaaaa
abeaaaaaaaaaiadpaoaaaaahhcaabaaaaeaaaaaaegbcbaaaahaaaaaapgbpbaaa
ahaaaaaaaaaaaaaihcaabaaaafaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaa
abaaaaaaehaaaaalbcaabaaaafaaaaaaegaabaaaafaaaaaaaghabaaaahaaaaaa
aagabaaaaaaaaaaackaabaaaafaaaaaaaaaaaaaihcaabaaaagaaaaaaegacbaaa
aeaaaaaaegiccaaaaaaaaaaaacaaaaaaehaaaaalccaabaaaafaaaaaaegaabaaa
agaaaaaaaghabaaaahaaaaaaaagabaaaaaaaaaaackaabaaaagaaaaaaaaaaaaai
hcaabaaaagaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaaadaaaaaaaaaaaaai
hcaabaaaaeaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaaaeaaaaaaehaaaaal
icaabaaaafaaaaaaegaabaaaaeaaaaaaaghabaaaahaaaaaaaagabaaaaaaaaaaa
ckaabaaaaeaaaaaaehaaaaalecaabaaaafaaaaaaegaabaaaagaaaaaaaghabaaa
ahaaaaaaaagabaaaaaaaaaaackaabaaaagaaaaaadcaaaaakpcaabaaaaeaaaaaa
egaobaaaafaaaaaafgafbaaaabaaaaaaagiacaaaadaaaaaabiaaaaaabbaaaaak
ccaabaaaabaaaaaaegaobaaaaeaaaaaaaceaaaaaaaaaiadoaaaaiadoaaaaiado
aaaaiadoaoaaaaahmcaabaaaabaaaaaaagbebaaaagaaaaaapgbpbaaaagaaaaaa
aaaaaaakmcaabaaaabaaaaaakgaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaadpaaaaaadpefaaaaajpcaabaaaaeaaaaaaogakbaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaabaaaaaadbaaaaahecaabaaaabaaaaaaabeaaaaaaaaaaaaa
ckbabaaaagaaaaaaabaaaaahecaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaa
aaaaiadpdiaaaaahecaabaaaabaaaaaadkaabaaaaeaaaaaackaabaaaabaaaaaa
baaaaaahicaabaaaabaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaaj
pcaabaaaaeaaaaaapgapbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaa
diaaaaahecaabaaaabaaaaaackaabaaaabaaaaaaakaabaaaaeaaaaaaapaaaaah
ccaabaaaabaaaaaakgakbaaaabaaaaaafgafbaaaabaaaaaadiaaaaaiocaabaaa
abaaaaaafgafbaaaabaaaaaaagijcaaaaaaaaaaaajaaaaaadiaaaaahhcaabaaa
aeaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaeaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaaefaaaaajpcaabaaa
aeaaaaaaegaabaaaaeaaaaaaeghobaaaagaaaaaaaagabaaaaeaaaaaadcaaaaak
hcaabaaaacaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaaapaaaaaaegacbaaa
acaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaaoaaaaaa
abeaaaaaaaaaiadpdcaaaaajhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
adaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
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
// Stats: 108 math, 11 textures
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
Float 13 [_Reflectioncubemappower]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Reflectioncubemap] CUBE 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"3.0-!!ARBfp1.0
PARAM c[26] = { program.local[0..20],
		{ 0, 0.97000003, 0.0078125, -0.0078125 },
		{ 1, 0.0039215689, 1.53787e-005, 6.0308629e-008 },
		{ 0.25, 2, 0.050000001, 0.5 },
		{ -0.99999875, -0.001592548, 0.001592548, 0.31830987 },
		{ 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
ADD R1.xyz, -fragment.texcoord[1], c[0];
DP3 R0.x, R1, R1;
RSQ R0.x, R0.x;
MUL R2.xyz, R0.x, R1;
DP3 R0.x, R2, fragment.texcoord[3];
DP3 R0.y, fragment.texcoord[4], R2;
MUL R4.xy, R0, -c[16].x;
MAD R0.xy, R4, c[23].z, fragment.texcoord[0];
ADD R0.zw, R0.xyxy, -c[23].w;
MUL R0.xy, R0.w, c[24].zxzw;
MAD R1.xy, R0.z, c[24], R0;
MOV R0.w, c[16].x;
MUL R0.x, R0.w, -c[24].w;
ADD R1.xy, R1, c[23].w;
MUL R0.w, R0, c[23];
MAD R3.zw, fragment.texcoord[0].xyxy, c[5].xyxy, c[5];
ADD R0.x, R0, c[22];
MUL R1.xy, R1, c[15].x;
MUL R1.xy, R1, R0.x;
MUL R3.xy, R1, c[20].x;
MAD R0.xy, fragment.texcoord[0], c[8], c[8].zwzw;
TEX R0.xyz, R0, texture[5], 2D;
MUL R1.xyz, R0, c[10].x;
TEX R0.xyz, R3.zwzw, texture[2], 2D;
MAD R3.xy, R3, c[17], c[17].zwzw;
TEX R3.xyz, R3, texture[3], 2D;
ADD R3.xyz, -R3, c[22].x;
MAX R3.xyz, R3, R0;
ADD R0.w, R0, c[22].x;
MAD R4.xy, -R4, c[23].z, fragment.texcoord[0];
MUL R4.xy, R4, R0.w;
MUL R4.xy, R4, c[15].x;
MUL R3.xyz, R3, c[9].x;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
POW R1.x, R1.x, c[19].x;
POW R1.z, R1.z, c[19].x;
POW R1.y, R1.y, c[19].x;
MAD R1.xyz, R0, -R1, R1;
MAD R0.xy, R4, c[17], c[17].zwzw;
MOV R4.xyz, c[14];
MUL R4.xyz, R4, c[11].x;
TEX R0.xyz, R0, texture[3], 2D;
MUL R0.xyz, R4, R0;
POW R0.x, R0.x, c[18].x;
POW R0.z, R0.z, c[18].x;
POW R0.y, R0.y, c[18].x;
MAD R0.xyz, R3, -R0, R0;
ADD R4.xyz, R0, R1;
RSQ R1.x, R0.w;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R0.w, R0, R0;
RSQ R1.w, R0.w;
MUL R0.xyz, R1.w, R0;
MUL R1.xyz, R1.x, fragment.texcoord[2];
DP3 R0.w, R1, -R2;
DP3 R1.w, fragment.texcoord[6], fragment.texcoord[6];
RSQ R1.w, R1.w;
RCP R2.w, R1.w;
MUL R6.xyz, R1, R0.w;
ADD R5.xyz, R0, R2;
MAD R2.xyz, -R6, c[23].y, -R2;
DP3 R0.w, R5, R5;
RSQ R0.w, R0.w;
MUL R6.xyz, R0.w, R5;
DP3 R0.w, R1, R6;
TEX R2.xyz, R2, texture[4], CUBE;
MUL R2.xyz, R2, c[13].x;
ADD R5.xyz, fragment.texcoord[6], c[21].zwww;
TEX R5, R5, texture[0], CUBE;
DP4 R5.w, R5, c[22];
ADD R5.xyz, fragment.texcoord[6], c[21].wwzw;
TEX R7, R5, texture[0], CUBE;
DP4 R5.y, R7, c[22];
ADD R6.xyz, fragment.texcoord[6], c[21].wzww;
TEX R6, R6, texture[0], CUBE;
DP4 R5.z, R6, c[22];
ADD R6.xyz, fragment.texcoord[6], c[21].z;
TEX R6, R6, texture[0], CUBE;
DP4 R5.x, R6, c[22];
MUL R2.w, R2, c[2];
MAD R5, -R2.w, c[21].y, R5;
MOV R1.w, c[22].x;
CMP R5, R5, c[3].x, R1.w;
DP4 R4.w, R5, c[23].x;
MOV R2.w, c[25].x;
MUL R2.w, R2, c[6].x;
DP3 R5.x, fragment.texcoord[5], fragment.texcoord[5];
ADD R3.w, R2, c[22].x;
TEX R2.w, R5.x, texture[1], 2D;
MUL R4.w, R2, R4;
MUL R5.xyz, R4.w, c[4];
MUL R5.xyz, R5, c[23].y;
ADD R4.xyz, R2, R4;
MAX R0.w, R0, c[21].x;
EX2 R2.w, R3.w;
POW R0.w, R0.w, R2.w;
MUL R6.xyz, R5, R0.w;
DP3 R0.w, R1, R0;
MAX R1.x, R0.w, c[21];
MUL R4.xyz, R6, R4;
MAD R7.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R6.xyz, R7, texture[6], 2D;
MAD R0.xyz, R6, c[12], R2;
ADD R0.w, R1, -c[9].x;
MAD R0.xyz, R0.w, R3, R0;
MUL R1.xyz, R1.x, R5;
MAD result.color.xyz, R1, R0, R4;
MOV result.color.w, c[21].x;
END
# 108 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 117 math, 11 textures
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
Float 13 [_Reflectioncubemappower]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 3
SetTexture 4 [_Reflectioncubemap] CUBE 4
SetTexture 5 [_Specularglitter] 2D 5
SetTexture 6 [_MainTex] 2D 6
"ps_3_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_cube s4
dcl_2d s5
dcl_2d s6
def c21, 0.00000000, 0.00781250, -0.00781250, 0.97000003
def c22, 1.00000000, 0.00392157, 0.00001538, 0.00000006
def c23, 0.25000000, 2.00000000, 0.05000000, -0.50000000
def c24, 0.00159374, -0.99999875, -0.00159374, 0.50000000
def c25, -0.31830987, 1.00000000, 10.00000000, 0.50000000
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
add r0.xyz, -v1, c0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
mov r0.w, c16.x
dp3 r1.x, r0, v3
dp3 r1.y, v4, r0
mul r1.xy, r1, -c16.x
mad r1.zw, r1.xyxy, c23.z, v0.xyxy
add r1.zw, r1, c23.w
mul r2.xy, r1.w, c24
mad r1.zw, r1.z, c24.xyyz, r2.xyxy
mad r2.xy, -r1, c23.z, v0
add r1.zw, r1, c24.w
mov r1.x, c16
mad r1.x, r1, c25.w, c25.y
mul r2.xy, r2, r1.x
mul r1.zw, r1, c15.x
mad r0.w, r0, c25.x, c25.y
mul r1.xy, r1.zwzw, r0.w
mul r1.zw, r2.xyxy, c15.x
mul r2.xy, r1, c20.x
mad r1.xy, r1.zwzw, c17, c17.zwzw
mov r0.w, c11.x
mul r3.xyz, c14, r0.w
texld r1.xyz, r1, s3
mul r4.xyz, r3, r1
mad r1.xy, r2, c17, c17.zwzw
pow r3, r4.x, c18.x
mov r4.x, r3
mad r2.xy, v0, c5, c5.zwzw
texld r1.xyz, r1, s3
dp3 r0.w, v2, v2
texld r2.xyz, r2, s2
add r1.xyz, -r1, c22.x
max r1.xyz, r1, r2
mul r5.xyz, r1, c9.x
pow r1, r4.y, c18.x
mad r3.xy, v0, c8, c8.zwzw
mov r4.y, r1
texld r1.xyz, r3, s5
mul r6.xyz, r1, c10.x
pow r3, r4.z, c18.x
pow r1, r6.x, c19.x
mov r4.z, r3
pow r3, r6.y, c19.x
mov r6.x, r1
pow r1, r6.z, c19.x
mov r6.z, r1
mov r6.y, r3
mad r1.xyz, r2, -r6, r6
mad r2.xyz, -v1, c1.w, c1
mad r4.xyz, r5, -r4, r4
dp3 r1.w, r2, r2
rsq r0.w, r0.w
mul r3.xyz, r0.w, v2
add r1.xyz, r4, r1
rsq r1.w, r1.w
mul r4.xyz, r1.w, r2
add r6.xyz, r4, r0
dp3 r0.w, r3, -r0
mul r2.xyz, r3, r0.w
dp3 r1.w, r6, r6
mad r2.xyz, -r2, c23.y, -r0
rsq r0.w, r1.w
mul r0.xyz, r0.w, r6
texld r2.xyz, r2, s4
dp3 r0.x, r3, r0
mad r7.xyz, r2, c13.x, r1
mov r0.y, c6.x
mad r0.w, r0.y, c25.z, c25.y
max r1.x, r0, c21
exp r1.y, r0.w
pow r6, r1.x, r1.y
add r0.xyz, v6, c21.yzzw
texld r0, r0, s0
dp4 r8.w, r0, c22
add r0.xyz, v6, c21.zyzw
texld r0, r0, s0
dp4 r8.z, r0, c22
add r1.xyz, v6, c21.zzyw
texld r1, r1, s0
dp4 r8.y, r1, c22
add r0.xyz, v6, c21.y
texld r0, r0, s0
dp3 r1.x, v6, v6
rsq r1.x, r1.x
dp4 r8.x, r0, c22
rcp r0.x, r1.x
mul r0.x, r0, c2.w
mad r0, -r0.x, c21.w, r8
mov r1.x, c3
cmp r1, r0, c22.x, r1.x
dp4_pp r0.y, r1, c23.x
mov r0.w, r6.x
dp3 r0.x, v5, v5
texld r0.x, r0.x, s1
mul r0.x, r0, r0.y
mul r0.xyz, r0.x, c4
mul r0.xyz, r0, c23.y
mul r1.xyz, r0, r0.w
mul r1.xyz, r1, r7
dp3 r0.w, r3, r4
mov r1.w, c9.x
max r0.w, r0, c21.x
mul r6.xyz, r2, c13.x
mad r7.xy, v0, c7, c7.zwzw
texld r2.xyz, r7, s6
mad r2.xyz, r2, c12, r6
add r1.w, c22.x, -r1
mad r2.xyz, r1.w, r5, r2
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c21.x
"
}
SubProgram "d3d11 " {
// Stats: 88 math, 11 textures
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
SetTexture 0 [_LightTexture0] 2D 1
SetTexture 1 [_ShadowMapTexture] CUBE 0
SetTexture 2 [_Mask] 2D 2
SetTexture 3 [_Glittermap] 2D 6
SetTexture 4 [_Reflectioncubemap] CUBE 5
SetTexture 5 [_Specularglitter] 2D 4
SetTexture 6 [_MainTex] 2D 3
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Float 192 [_Reflectioncubemappower]
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
eefiecedlcjbkaedociklnaeliddlammgbgebmgeabaaaaaamiapaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefchiaoaaaaeaaaaaaajoadaaaafjaaaaaeegiocaaa
aaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaacaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafidaaaaeaahabaaaaeaaaaaaffffaaaafibiaaae
aahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaa
agaaaaaagcbaaaadhcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
agaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaa
aaaaaadpabeaaaaaaaaaiadpdiaaaaalgcaabaaaaaaaaaaafgifcaaaaaaaaaaa
aoaaaaaaaceaaaaaaaaaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaajhcaabaaa
abaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaa
acaaaaaabaaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaa
dcaaaaajpcaabaaaadaaaaaafgakbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaa
abaaaaaadiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaadaaaaaa
aaaaaaakdcaabaaaadaaaaaaogakbaaaadaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaa
aaaaaaaaaoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaagaaaaaadiaaaaajhcaabaaa
aaaaaaaakgikcaaaaaaaaaaaakaaaaaaegiccaaaaaaaaaaaanaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaaaaaaaacpaaaaafhcaabaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
agiacaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
apaaaaakbcaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaolpphplpallnnadk
aaaaaaaaaaaaaaaaapaaaaakccaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaa
allnnalkolpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaadaaaaaaegaabaaa
aeaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaa
adaaaaaaegaabaaaadaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaalicaabaaa
abaaaaaabkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdoabeaaaaa
aaaaiadpdiaaaaahdcaabaaaadaaaaaapgapbaaaabaaaaaaegaabaaaadaaaaaa
diaaaaaidcaabaaaadaaaaaaegaabaaaadaaaaaakgikcaaaaaaaaaaabaaaaaaa
dcaaaaaldcaabaaaadaaaaaaegaabaaaadaaaaaaegiacaaaaaaaaaaaapaaaaaa
ogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaa
eghobaaaadaaaaaaaagabaaaagaaaaaaaaaaaaalhcaabaaaadaaaaaaegacbaia
ebaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaal
dcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaadeaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaaaaeaaaaaadiaaaaaihcaabaaaadaaaaaaegacbaaaadaaaaaaagiacaaa
aaaaaaaaakaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaia
ebaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaa
abaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaaj
pcaabaaaafaaaaaaegaabaaaafaaaaaaeghobaaaafaaaaaaaagabaaaaeaaaaaa
diaaaaaihcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaaakaaaaaa
cpaaaaafhcaabaaaafaaaaaaegacbaaaafaaaaaadiaaaaaihcaabaaaafaaaaaa
egacbaaaafaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaafaaaaaa
egacbaaaafaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaia
ebaaaaaaafaaaaaaegacbaaaafaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hcaabaaaaeaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaabaaaaaaiicaabaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaaegacbaaaaeaaaaaaaaaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaacaaaaaa
egacbaaaaeaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
efaaaaajpcaabaaaacaaaaaaegacbaaaacaaaaaaeghobaaaaeaaaaaaaagabaaa
afaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaa
amaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
agiacaaaaaaaaaaaamaaaaaadcaaaaamhcaabaaaafaaaaaapgipcaaaacaaaaaa
aaaaaaaaegbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaah
icaabaaaabaaaaaaegacbaaaafaaaaaaegacbaaaafaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaafaaaaaapgapbaaaabaaaaaa
egacbaaaafaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaafaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaa
egacbaaaafaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaaeaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaak
ccaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaacaebabeaaaaa
aaaaiadpbjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaabkaabaaaabaaaaaabjaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaahaaaaaaegbcbaaa
ahaaaaaaelaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaaiccaabaaa
abaaaaaabkaabaaaabaaaaaadkiacaaaacaaaaaaabaaaaaadiaaaaahccaabaaa
abaaaaaabkaabaaaabaaaaaaabeaaaaaomfbhidpaaaaaaakhcaabaaaaeaaaaaa
egbcbaaaahaaaaaaaceaaaaaaaaaaadmaaaaaadmaaaaaadmaaaaaaaaefaaaaaj
pcaabaaaaeaaaaaaegacbaaaaeaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
bbaaaaakbcaabaaaaeaaaaaaegaobaaaaeaaaaaaaceaaaaaaaaaiadpibiaiadl
icabibdhafidibddaaaaaaakhcaabaaaafaaaaaaegbcbaaaahaaaaaaaceaaaaa
aaaaaalmaaaaaalmaaaaaadmaaaaaaaaefaaaaajpcaabaaaafaaaaaaegacbaaa
afaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaabbaaaaakccaabaaaaeaaaaaa
egaobaaaafaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdhafidibddaaaaaaak
hcaabaaaafaaaaaaegbcbaaaahaaaaaaaceaaaaaaaaaaalmaaaaaadmaaaaaalm
aaaaaaaaefaaaaajpcaabaaaafaaaaaaegacbaaaafaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaabbaaaaakecaabaaaaeaaaaaaegaobaaaafaaaaaaaceaaaaa
aaaaiadpibiaiadlicabibdhafidibddaaaaaaakhcaabaaaafaaaaaaegbcbaaa
ahaaaaaaaceaaaaaaaaaaadmaaaaaalmaaaaaalmaaaaaaaaefaaaaajpcaabaaa
afaaaaaaegacbaaaafaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaabbaaaaak
icaabaaaaeaaaaaaegaobaaaafaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdh
afidibdddbaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaafgafbaaaabaaaaaa
dhaaaaanpcaabaaaaeaaaaaaegaobaaaaeaaaaaaagiacaaaadaaaaaabiaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpbbaaaaakccaabaaaabaaaaaa
egaobaaaaeaaaaaaaceaaaaaaaaaiadoaaaaiadoaaaaiadoaaaaiadobaaaaaah
ecaabaaaabaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaa
aeaaaaaakgakbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaapaaaaah
ccaabaaaabaaaaaaagaabaaaaeaaaaaafgafbaaaabaaaaaadiaaaaaiocaabaaa
abaaaaaafgafbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaa
aeaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaeaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaa
aeaaaaaaegaabaaaaeaaaaaaeghobaaaagaaaaaaaagabaaaadaaaaaadcaaaaak
hcaabaaaacaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaa
acaaaaaaaaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaa
abeaaaaaaaaaiadpdcaaaaajhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
adaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
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
// Stats: 110 math, 12 textures
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
Float 13 [_Reflectioncubemappower]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Reflectioncubemap] CUBE 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"3.0-!!ARBfp1.0
PARAM c[26] = { program.local[0..20],
		{ 0, 0.97000003, 0.0078125, -0.0078125 },
		{ 1, 0.0039215689, 1.53787e-005, 6.0308629e-008 },
		{ 0.25, 2, 0.050000001, 0.5 },
		{ -0.99999875, -0.001592548, 0.001592548, 0.31830987 },
		{ 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
ADD R0.xyz, -fragment.texcoord[1], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R5.xyz, R0.w, R0;
MOV R0.w, c[16].x;
MUL R0.z, R0.w, -c[24].w;
MUL R0.w, R0, c[23];
DP3 R0.x, R5, fragment.texcoord[3];
DP3 R0.y, fragment.texcoord[4], R5;
MUL R3.xy, R0, -c[16].x;
MAD R0.xy, R3, c[23].z, fragment.texcoord[0];
ADD R0.xy, R0, -c[23].w;
MUL R1.xy, R0.y, c[24].zxzw;
MAD R0.xy, R0.x, c[24], R1;
ADD R0.xy, R0, c[23].w;
ADD R0.z, R0, c[22].x;
MUL R0.xy, R0, c[15].x;
MUL R0.xy, R0, R0.z;
MUL R3.zw, R0.xyxy, c[20].x;
MAD R1.xy, fragment.texcoord[0], c[8], c[8].zwzw;
TEX R0.xyz, R1, texture[6], 2D;
MUL R0.xyz, R0, c[10].x;
MAD R1.xy, fragment.texcoord[0], c[5], c[5].zwzw;
TEX R2.xyz, R1, texture[3], 2D;
POW R0.x, R0.x, c[19].x;
POW R0.z, R0.z, c[19].x;
POW R0.y, R0.y, c[19].x;
MAD R1.xyz, R2, -R0, R0;
MAD R0.xy, R3.zwzw, c[17], c[17].zwzw;
TEX R0.xyz, R0, texture[4], 2D;
ADD R0.xyz, -R0, c[22].x;
MAX R2.xyz, R0, R2;
MUL R4.xyz, R2, c[9].x;
ADD R0.w, R0, c[22].x;
MAD R3.xy, -R3, c[23].z, fragment.texcoord[0];
MUL R3.xy, R3, R0.w;
MUL R3.xy, R3, c[15].x;
MAD R0.xy, R3, c[17], c[17].zwzw;
MOV R3.xyz, c[14];
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, fragment.texcoord[2];
MUL R3.xyz, R3, c[11].x;
TEX R0.xyz, R0, texture[4], 2D;
MUL R0.xyz, R3, R0;
MOV R3.w, c[22].x;
POW R0.x, R0.x, c[18].x;
POW R0.z, R0.z, c[18].x;
POW R0.y, R0.y, c[18].x;
MAD R0.xyz, R4, -R0, R0;
ADD R1.xyz, R0, R1;
MAD R0.xyz, -fragment.texcoord[1], c[1].w, c[1];
DP3 R1.w, R0, R0;
RSQ R0.w, R1.w;
MUL R3.xyz, R0.w, R0;
ADD R0.xyz, R3, R5;
DP3 R1.w, R2, -R5;
MUL R6.xyz, R2, R1.w;
MAD R5.xyz, -R6, c[23].y, -R5;
DP3 R0.w, R0, R0;
TEX R5.xyz, R5, texture[5], CUBE;
MUL R5.xyz, R5, c[13].x;
RSQ R0.w, R0.w;
ADD R6.xyz, R5, R1;
MUL R1.xyz, R0.w, R0;
DP3 R1.x, R2, R1;
MAX R2.w, R1.x, c[21].x;
ADD R0.xyz, fragment.texcoord[6], c[21].zwww;
TEX R0, R0, texture[0], CUBE;
DP4 R7.w, R0, c[22];
ADD R0.xyz, fragment.texcoord[6], c[21].wzww;
TEX R0, R0, texture[0], CUBE;
DP4 R7.z, R0, c[22];
ADD R1.xyz, fragment.texcoord[6], c[21].wwzw;
TEX R1, R1, texture[0], CUBE;
DP4 R7.y, R1, c[22];
ADD R0.xyz, fragment.texcoord[6], c[21].z;
TEX R0, R0, texture[0], CUBE;
DP3 R1.x, fragment.texcoord[6], fragment.texcoord[6];
DP4 R7.x, R0, c[22];
RSQ R1.x, R1.x;
RCP R0.x, R1.x;
MUL R0.x, R0, c[2].w;
MAD R0, -R0.x, c[21].y, R7;
CMP R0, R0, c[3].x, R3.w;
DP4 R0.y, R0, c[23].x;
MOV R1.x, c[25];
MUL R0.z, R1.x, c[6].x;
DP3 R0.x, fragment.texcoord[5], fragment.texcoord[5];
TEX R1.w, R0.x, texture[1], 2D;
TEX R0.w, fragment.texcoord[5], texture[2], CUBE;
MUL R0.x, R1.w, R0.w;
ADD R0.z, R0, c[22].x;
EX2 R0.w, R0.z;
MUL R0.x, R0, R0.y;
MUL R0.xyz, R0.x, c[4];
POW R0.w, R2.w, R0.w;
MUL R0.xyz, R0, c[23].y;
MUL R1.xyz, R0, R0.w;
DP3 R0.w, R2, R3;
MAX R0.w, R0, c[21].x;
MUL R6.xyz, R1, R6;
MAD R7.xy, fragment.texcoord[0], c[7], c[7].zwzw;
TEX R1.xyz, R7, texture[7], 2D;
MAD R1.xyz, R1, c[12], R5;
ADD R1.w, R3, -c[9].x;
MAD R1.xyz, R1.w, R4, R1;
MUL R0.xyz, R0.w, R0;
MAD result.color.xyz, R0, R1, R6;
MOV result.color.w, c[21].x;
END
# 110 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 117 math, 12 textures
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
Float 13 [_Reflectioncubemappower]
Vector 14 [_Glittercolor]
Float 15 [_Glitterymaskdotsscale]
Float 16 [_Glitteryspeed01]
Vector 17 [_Glittermap_ST]
Float 18 [_Glittercontrast13]
Float 19 [_Specularcontrast13]
Float 20 [_Maskadjust0515]
SetTexture 0 [_ShadowMapTexture] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 4
SetTexture 5 [_Reflectioncubemap] CUBE 5
SetTexture 6 [_Specularglitter] 2D 6
SetTexture 7 [_MainTex] 2D 7
"ps_3_0
dcl_cube s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
dcl_2d s4
dcl_cube s5
dcl_2d s6
dcl_2d s7
def c21, 0.00000000, 0.00781250, -0.00781250, 0.97000003
def c22, 1.00000000, 0.00392157, 0.00001538, 0.00000006
def c23, 0.25000000, 2.00000000, 0.05000000, -0.50000000
def c24, 0.00159374, -0.99999875, -0.00159374, 0.50000000
def c25, -0.31830987, 1.00000000, 10.00000000, 0.50000000
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
add r0.xyz, -v1, c0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r2.xyz, r0.w, r0
dp3 r0.w, v4, r2
dp3 r0.z, r2, v3
mul r4.xy, r0.zwzw, -c16.x
mad r1.xy, r4, c23.z, v0
add r5.xy, r1, c23.w
mad r0.xy, v0, c8, c8.zwzw
texld r0.xyz, r0, s6
mul r3.xyz, r0, c10.x
pow r1, r3.x, c19.x
pow r0, r3.y, c19.x
mov r0.x, r1
pow r1, r3.z, c19.x
mul r4.zw, r5.y, c24.xyxy
mov r0.z, r1
mad r1.xy, v0, c5, c5.zwzw
texld r1.xyz, r1, s3
mad r3.xyz, r1, -r0, r0
mad r0.zw, r5.x, c24.xyyz, r4
mov r0.x, c16
add r0.zw, r0, c24.w
mad r1.w, r0.x, c25.x, c25.y
mul r0.xy, r0.zwzw, c15.x
mul r0.xy, r0, r1.w
mov r0.z, c16.x
mad r1.w, r0.z, c25, c25.y
mad r0.zw, -r4.xyxy, c23.z, v0.xyxy
mul r0.zw, r0, r1.w
mul r4.xy, r0.zwzw, c15.x
mov r0.w, c11.x
mul r0.xy, r0, c20.x
mad r0.xy, r0, c17, c17.zwzw
mad r4.xy, r4, c17, c17.zwzw
mul r5.xyz, c14, r0.w
texld r4.xyz, r4, s4
mul r4.xyz, r5, r4
texld r0.xyz, r0, s4
add r5.xyz, -r0, c22.x
pow r0, r4.x, c18.x
max r1.xyz, r5, r1
mul r5.xyz, r1, c9.x
pow r1, r4.y, c18.x
mov r4.x, r0
pow r0, r4.z, c18.x
dp3 r0.w, v2, v2
mov r4.z, r0
mov r4.y, r1
mad r0.xyz, r5, -r4, r4
add r1.xyz, r0, r3
mad r0.xyz, -v1, c1.w, c1
dp3 r1.w, r0, r0
rsq r0.w, r0.w
mul r3.xyz, r0.w, v2
dp3 r0.w, r3, -r2
rsq r1.w, r1.w
mul r4.xyz, r1.w, r0
mul r6.xyz, r3, r0.w
add r0.xyz, r4, r2
mad r2.xyz, -r6, c23.y, -r2
texld r2.xyz, r2, s5
dp3 r0.w, r0, r0
mad r7.xyz, r2, c13.x, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r0
dp3 r1.x, r3, r1
max r2.w, r1.x, c21.x
add r0.xyz, v6, c21.yzzw
texld r0, r0, s0
dp4 r6.w, r0, c22
add r0.xyz, v6, c21.zyzw
texld r0, r0, s0
dp4 r6.z, r0, c22
add r1.xyz, v6, c21.zzyw
texld r1, r1, s0
dp4 r6.y, r1, c22
add r0.xyz, v6, c21.y
texld r0, r0, s0
dp3 r1.x, v6, v6
dp4 r6.x, r0, c22
rsq r1.x, r1.x
rcp r0.x, r1.x
mov r1.x, c6
mad r1.y, r1.x, c25.z, c25
mul r0.x, r0, c2.w
mad r0, -r0.x, c21.w, r6
exp r3.w, r1.y
mov r1.x, c3
cmp r1, r0, c22.x, r1.x
pow r0, r2.w, r3.w
dp4_pp r0.z, r1, c23.x
dp3 r1.x, v5, v5
mov r1.w, c9.x
texld r0.w, v5, s2
texld r1.x, r1.x, s1
mul r0.y, r1.x, r0.w
mul r0.y, r0, r0.z
mul r1.xyz, r0.y, c4
mov r0.w, r0.x
mul r0.xyz, r1, c23.y
mul r1.xyz, r0, r0.w
mul r1.xyz, r1, r7
dp3 r0.w, r3, r4
max r0.w, r0, c21.x
mul r6.xyz, r2, c13.x
mad r7.xy, v0, c7, c7.zwzw
texld r2.xyz, r7, s7
mad r2.xyz, r2, c12, r6
add r1.w, c22.x, -r1
mad r2.xyz, r1.w, r5, r2
mul r0.xyz, r0.w, r0
mad oC0.xyz, r0, r2, r1
mov_pp oC0.w, c21.x
"
}
SubProgram "d3d11 " {
// Stats: 89 math, 12 textures
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
SetTexture 0 [_LightTextureB0] 2D 2
SetTexture 1 [_LightTexture0] CUBE 1
SetTexture 2 [_ShadowMapTexture] CUBE 0
SetTexture 3 [_Mask] 2D 3
SetTexture 4 [_Glittermap] 2D 7
SetTexture 5 [_Reflectioncubemap] CUBE 6
SetTexture 6 [_Specularglitter] 2D 5
SetTexture 7 [_MainTex] 2D 4
ConstBuffer "$Globals" 272
Vector 80 [_LightColor0]
Vector 96 [_Mask_ST]
Float 112 [_Shininess]
Vector 128 [_MainTex_ST]
Vector 144 [_Specularglitter_ST]
Float 160 [_MasktransparencyDebug]
Float 164 [_Specularpower05]
Float 168 [_Glitterpower]
Vector 176 [_Color]
Float 192 [_Reflectioncubemappower]
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
eefiecednnijeboaoiepaflgfinpilhlcmkcjjghabaaaaaacebaaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcneaoaaaaeaaaaaaalfadaaaafjaaaaaeegiocaaa
aaaaaaaabbaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaacaaaaaafjaaaaaeegiocaaaadaaaaaabjaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafidaaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaafidaaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaa
agaaaaaaffffaaaafibiaaaeaahabaaaahaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaa
gcbaaaadhcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaa
dcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaaoaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaiadpdiaaaaalgcaabaaaaaaaaaaafgifcaaaaaaaaaaaaoaaaaaa
aceaaaaaaaaaaaaamnmmemdnmnmmemlnaaaaaaaaaaaaaaajhcaabaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaadaaaaaaegbcbaaaaeaaaaaaegacbaaaacaaaaaa
baaaaaahccaabaaaadaaaaaaegbcbaaaafaaaaaaegacbaaaacaaaaaadcaaaaaj
pcaabaaaadaaaaaafgakbaaaaaaaaaaaegaebaaaadaaaaaaegbebaaaabaaaaaa
diaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaadaaaaaaaaaaaaak
dcaabaaaadaaaaaaogakbaaaadaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaa
aoaaaaaadcaaaaaldcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaa
apaaaaaaogikcaaaaaaaaaaaapaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaa
aaaaaaaaeghobaaaaeaaaaaaaagabaaaahaaaaaadiaaaaajhcaabaaaaaaaaaaa
kgikcaaaaaaaaaaaakaaaaaaegiccaaaaaaaaaaaanaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaaaaaaaaacpaaaaafhcaabaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaagiacaaa
aaaaaaaabaaaaaaabjaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaaapaaaaak
bcaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaolpphplpallnnadkaaaaaaaa
aaaaaaaaapaaaaakccaabaaaaeaaaaaaegaabaaaadaaaaaaaceaaaaaallnnalk
olpphplpaaaaaaaaaaaaaaaaaaaaaaakdcaabaaaadaaaaaaegaabaaaaeaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaaidcaabaaaadaaaaaa
egaabaaaadaaaaaaagiacaaaaaaaaaaaaoaaaaaadcaaaaalicaabaaaabaaaaaa
bkiacaiaebaaaaaaaaaaaaaaaoaaaaaaabeaaaaaidpjkcdoabeaaaaaaaaaiadp
diaaaaahdcaabaaaadaaaaaapgapbaaaabaaaaaaegaabaaaadaaaaaadiaaaaai
dcaabaaaadaaaaaaegaabaaaadaaaaaakgikcaaaaaaaaaaabaaaaaaadcaaaaal
dcaabaaaadaaaaaaegaabaaaadaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaa
aaaaaaaaapaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
aeaaaaaaaagabaaaahaaaaaaaaaaaaalhcaabaaaadaaaaaaegacbaiaebaaaaaa
adaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaaldcaabaaa
aeaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaaadaaaaaa
aagabaaaadaaaaaadeaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaa
aeaaaaaadiaaaaaihcaabaaaadaaaaaaegacbaaaadaaaaaaagiacaaaaaaaaaaa
akaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaiaebaaaaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaaldcaabaaaafaaaaaaegbabaaaabaaaaaa
egiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaaefaaaaajpcaabaaa
afaaaaaaegaabaaaafaaaaaaeghobaaaagaaaaaaaagabaaaafaaaaaadiaaaaai
hcaabaaaafaaaaaaegacbaaaafaaaaaafgifcaaaaaaaaaaaakaaaaaacpaaaaaf
hcaabaaaafaaaaaaegacbaaaafaaaaaadiaaaaaihcaabaaaafaaaaaaegacbaaa
afaaaaaafgifcaaaaaaaaaaabaaaaaaabjaaaaafhcaabaaaafaaaaaaegacbaaa
afaaaaaadcaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaaegacbaiaebaaaaaa
afaaaaaaegacbaaaafaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaa
aeaaaaaapgapbaaaabaaaaaaegbcbaaaadaaaaaabaaaaaaiicaabaaaabaaaaaa
egacbaiaebaaaaaaacaaaaaaegacbaaaaeaaaaaaaaaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaa
aeaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaacaaaaaaefaaaaaj
pcaabaaaacaaaaaaegacbaaaacaaaaaaeghobaaaafaaaaaaaagabaaaagaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegacbaaaacaaaaaaagiacaaaaaaaaaaaamaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaagiacaaa
aaaaaaaaamaaaaaadcaaaaamhcaabaaaafaaaaaapgipcaaaacaaaaaaaaaaaaaa
egbcbaiaebaaaaaaacaaaaaaegiccaaaacaaaaaaaaaaaaaabaaaaaahicaabaaa
abaaaaaaegacbaaaafaaaaaaegacbaaaafaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaahhcaabaaaafaaaaaapgapbaaaabaaaaaaegacbaaa
afaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaafaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaa
afaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
baaaaaahicaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakccaabaaa
abaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaacaebabeaaaaaaaaaiadp
bjaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaabkaabaaaabaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaahaaaaaaegbcbaaaahaaaaaa
elaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaaiccaabaaaabaaaaaa
bkaabaaaabaaaaaadkiacaaaacaaaaaaabaaaaaadiaaaaahccaabaaaabaaaaaa
bkaabaaaabaaaaaaabeaaaaaomfbhidpaaaaaaakhcaabaaaaeaaaaaaegbcbaaa
ahaaaaaaaceaaaaaaaaaaadmaaaaaadmaaaaaadmaaaaaaaaefaaaaajpcaabaaa
aeaaaaaaegacbaaaaeaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaabbaaaaak
bcaabaaaaeaaaaaaegaobaaaaeaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdh
afidibddaaaaaaakhcaabaaaafaaaaaaegbcbaaaahaaaaaaaceaaaaaaaaaaalm
aaaaaalmaaaaaadmaaaaaaaaefaaaaajpcaabaaaafaaaaaaegacbaaaafaaaaaa
eghobaaaacaaaaaaaagabaaaaaaaaaaabbaaaaakccaabaaaaeaaaaaaegaobaaa
afaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdhafidibddaaaaaaakhcaabaaa
afaaaaaaegbcbaaaahaaaaaaaceaaaaaaaaaaalmaaaaaadmaaaaaalmaaaaaaaa
efaaaaajpcaabaaaafaaaaaaegacbaaaafaaaaaaeghobaaaacaaaaaaaagabaaa
aaaaaaaabbaaaaakecaabaaaaeaaaaaaegaobaaaafaaaaaaaceaaaaaaaaaiadp
ibiaiadlicabibdhafidibddaaaaaaakhcaabaaaafaaaaaaegbcbaaaahaaaaaa
aceaaaaaaaaaaadmaaaaaalmaaaaaalmaaaaaaaaefaaaaajpcaabaaaafaaaaaa
egacbaaaafaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaabbaaaaakicaabaaa
aeaaaaaaegaobaaaafaaaaaaaceaaaaaaaaaiadpibiaiadlicabibdhafidibdd
dbaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaafgafbaaaabaaaaaadhaaaaan
pcaabaaaaeaaaaaaegaobaaaaeaaaaaaagiacaaaadaaaaaabiaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpbbaaaaakccaabaaaabaaaaaaegaobaaa
aeaaaaaaaceaaaaaaaaaiadoaaaaiadoaaaaiadoaaaaiadobaaaaaahecaabaaa
abaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaaeaaaaaa
kgakbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaa
afaaaaaaegbcbaaaagaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaah
ecaabaaaabaaaaaaakaabaaaaeaaaaaadkaabaaaafaaaaaaapaaaaahccaabaaa
abaaaaaakgakbaaaabaaaaaafgafbaaaabaaaaaadiaaaaaiocaabaaaabaaaaaa
fgafbaaaabaaaaaaagijcaaaaaaaaaaaafaaaaaadiaaaaahhcaabaaaaeaaaaaa
agaabaaaabaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
aaaaaaaajgahbaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaeaaaaaadcaaaaaldcaabaaaaeaaaaaaegbabaaaabaaaaaaegiacaaa
aaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaaeaaaaaaeghobaaaahaaaaaaaagabaaaaeaaaaaadcaaaaakhcaabaaa
acaaaaaaegacbaaaaeaaaaaaegiccaaaaaaaaaaaalaaaaaaegacbaaaacaaaaaa
aaaaaaajicaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaakaaaaaaabeaaaaa
aaaaiadpdcaaaaajhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaa
egacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
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