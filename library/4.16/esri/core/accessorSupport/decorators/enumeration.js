// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","../../jsonMap","./property"],function(f,c,d,e){Object.defineProperty(c,"__esModule",{value:!0});c.enumeration=function(a,b){void 0===b&&(b={ignoreUnknown:!0});a=a instanceof d.JSONMap?a:new d.JSONMap(a,b);return e.property({type:b&&b.ignoreUnknown?a.apiValues:String,json:{type:a.jsonValues,read:{reader:a.read},write:{writer:a.write}}})}});