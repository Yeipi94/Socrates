// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","../../core/urlUtils","../Portal"],function(e,b,c,d){Object.defineProperty(b,"__esModule",{value:!0});b.createForItem=function(a){return{origin:"portal-item",url:c.urlToObject(a.itemUrl),portal:a.portal||d.getDefault(),portalItem:a,readResourcePaths:[]}}});