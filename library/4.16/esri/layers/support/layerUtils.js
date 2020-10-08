// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports"],function(l,b){Object.defineProperty(b,"__esModule",{value:!0});b.isTiledLayer=function(a){return a&&"base-tile"===a.type||"tile"===a.type||"elevation"===a.type||"imagery-tile"===a.type||"base-elevation"===a.type||"open-street-map"===a.type||"web-tile"===a.type||"wmts"===a.type||"vector-tile"===a.type};b.isBaseLayer=function(a){return a.parent&&"esri.Basemap"===a.parent.declaredClass&&-1<a.parent.baseLayers.indexOf(a)};b.serializeLayerDefinitions=function(a){var c=/[:;]/,
h=[],b=!1;if(a&&(a.forEach(function(a,d){h.push([d,a]);!b&&c.test(a)&&(b=!0)}),0<h.length)){a=void 0;if(b){var e={};h.forEach(function(a){e[a[0]]=a[1]});a=JSON.stringify(e)}else{var d=[];h.forEach(function(a){d.push(a[0]+":"+a[1])});a=d.join(";")}return a}return null};b.serializeTimeOptions=function(a){if(a){var c=[];a.forEach(function(a,b){c.push('"'+b+'":'+JSON.stringify(a))});if(c.length)return"{"+c.join(",")+"}"}};b.getLayersForScale=function(a,c){var b=[];if(0<a&&c)for(var k=function(d){if(0<=
c[d].parentLayerId&&-1===b.indexOf(c[d].parentLayerId)&&c.some(function(a){return a.id===c[d].parentLayerId}))return"continue";if(0<=c[d].id){var e=!0,f=c[d].maxScale,g=c[d].minScale;if(0<f||0<g)0<f&&0<g?e=f<=a&&a<=g:0<f?e=f<=a:0<g&&(e=a<=g);e&&b.push(c[d].id)}},e=0;e<c.length;e++)k(e);return b};b.areLabelsVisible=function(a){return!0===a.labelsVisible&&null!=a.labelingInfo&&0<a.labelingInfo.length}});