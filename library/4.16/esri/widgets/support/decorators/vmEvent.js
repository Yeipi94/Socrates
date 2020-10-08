// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","./propUtils"],function(e,b,d){Object.defineProperty(b,"__esModule",{value:!0});b.vmEvent=function(c){return function(a){a.hasOwnProperty("_delegatedEventNames")||(a._delegatedEventNames=a._delegatedEventNames?a._delegatedEventNames.slice():[]);a=a._delegatedEventNames;var b=Array.isArray(c)?c:d.splitProps(c);a.push.apply(a,b)}}});