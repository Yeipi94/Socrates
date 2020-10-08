// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","../../../../core/maybe","./lineGraphicVisualElementUtils","./pointGraphicVisualElementUtils"],function(f,b,c,d,e){Object.defineProperty(b,"__esModule",{value:!0});b.createVisualElements=function(a){switch(c.unwrap(a.graphic.geometry).type){case "point":return e.createVisualElements(a);case "polygon":case "polyline":return d.createVisualElements(a);default:return null}}});