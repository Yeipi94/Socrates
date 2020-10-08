// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","tslib","../../shaderModules/interfaces"],function(h,a,c,d){Object.defineProperty(a,"__esModule",{value:!0});a.AlignPixel=function(b){var a=d.glsl(e||(e=c.__makeTemplateObject(["\n    vec4 alignToPixelCenter(vec4 clipCoord, vec2 widthHeight) {\n      vec2 xy \x3d vec2(0.500123) + 0.5 * clipCoord.xy / clipCoord.w;\n      vec2 pixelSz \x3d vec2(1.0) / widthHeight;\n      vec2 ij \x3d (floor(xy * widthHeight) + vec2(0.5)) * pixelSz;\n      vec2 result \x3d (ij * 2.0 - vec2(1.0)) * clipCoord.w;\n      return vec4(result, clipCoord.zw);\n    }\n  "],
["\n    vec4 alignToPixelCenter(vec4 clipCoord, vec2 widthHeight) {\n      vec2 xy \x3d vec2(0.500123) + 0.5 * clipCoord.xy / clipCoord.w;\n      vec2 pixelSz \x3d vec2(1.0) / widthHeight;\n      vec2 ij \x3d (floor(xy * widthHeight) + vec2(0.5)) * pixelSz;\n      vec2 result \x3d (ij * 2.0 - vec2(1.0)) * clipCoord.w;\n      return vec4(result, clipCoord.zw);\n    }\n  "]))),g=d.glsl(f||(f=c.__makeTemplateObject(["\n\n    vec4 alignToPixelOrigin(vec4 clipCoord, vec2 widthHeight) {\n      vec2 xy \x3d vec2(0.5) + 0.5 * clipCoord.xy / clipCoord.w;\n      vec2 pixelSz \x3d vec2(1.0) / widthHeight;\n      vec2 ij \x3d floor((xy + 0.5 * pixelSz) * widthHeight) * pixelSz;\n      vec2 result \x3d (ij * 2.0 - vec2(1.0)) * clipCoord.w;\n      return vec4(result, clipCoord.zw);\n    }\n  "],
["\n\n    vec4 alignToPixelOrigin(vec4 clipCoord, vec2 widthHeight) {\n      vec2 xy \x3d vec2(0.5) + 0.5 * clipCoord.xy / clipCoord.w;\n      vec2 pixelSz \x3d vec2(1.0) / widthHeight;\n      vec2 ij \x3d floor((xy + 0.5 * pixelSz) * widthHeight) * pixelSz;\n      vec2 result \x3d (ij * 2.0 - vec2(1.0)) * clipCoord.w;\n      return vec4(result, clipCoord.zw);\n    }\n  "])));b.vertex.code.add(a);b.vertex.code.add(g);b.fragment.code.add(a);b.fragment.code.add(g)};var e,f});