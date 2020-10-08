// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","../CIMCursor","../CIMOperators"],function(a,b,d,e){Object.defineProperty(b,"__esModule",{value:!0});a=function(){function a(){}a.getPlacement=function(a,b,f){var c=e.getPlacementOperator(b);if(!c)return null;a=d.cloneAndDecodeGeometry(a);return c.execute(a,b,f)};return a}();b.CIMMarkerPlacementHelper=a});