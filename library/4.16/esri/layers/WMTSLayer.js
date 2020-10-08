// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports tslib ../request ../core/Collection ../core/Error ../core/Handles ../core/lang ../core/MultiOriginJSONSupport ../core/object ../core/promiseUtils ../core/SetUtils ../core/urlUtils ../core/accessorSupport/decorators ../geometry/Extent ./Layer ./WebTileLayer ./mixins/OperationalLayer ./mixins/PortalLayer ./mixins/RefreshableLayer ./mixins/ScaleRangeLayer ./support/TileInfo ./support/WMTSLayerInfo ./support/WMTSSublayer ./support/wmtsUtils".split(" "),function(K,L,d,k,q,r,l,m,
t,u,v,w,x,f,y,z,A,B,C,D,E,F,G,g,h){function H(d,c){return d.map(function(a){var b=new g;b.read(a,c);return b})}var p={"image/png":".png","image/png8":".png","image/png24":".png","image/png32":".png","image/jpg":".jpg","image/jpeg":".jpeg","image/gif":".gif","image/bmp":".bmp","image/tiff":".tif","image/jpgpng":"","image/jpegpng":"","image/unknown":""},I=w.SetFromValues("version service request layer style format tilematrixset tilematrix tilerow tilecol".split(" "));return function(n){function c(){for(var a=
[],b=0;b<arguments.length;b++)a[b]=arguments[b];var e=n.apply(this,a)||this;e._sublayersHandles=new l;e.copyright="";e.customParameters=null;e.customLayerParameters=null;e.fullExtent=null;e.operationalLayerType="WebTiledLayer";e.resourceInfo=null;e.serviceMode="RESTful";e.sublayers=null;e.type="wmts";e.version="1.0.0";e.watch("activeLayer",function(a,b){b&&(b.layer=null);a&&(a.layer=e)},!0);e.watch("sublayers",function(a,b){b&&(b.forEach(function(a){a.layer=null}),e._sublayersHandles.removeAll(),
e._sublayersHandles=null);a&&(a.forEach(function(a){a.layer=e}),e._sublayersHandles||(e._sublayersHandles=new l),e._sublayersHandles.add([a.on("after-add",function(a){a.item.layer=e}),a.on("after-remove",function(a){a.item.layer=null})]))},!0);return e}d.__extends(c,n);c.prototype.normalizeCtorArgs=function(a,b){return"string"===typeof a?d.__assign({url:a},b):a};c.prototype.load=function(a){var b=this;if("KVP"!==this.serviceMode&&"RESTful"!==this.serviceMode)console.error("WMTS mode could only be 'KVP' or 'RESTful'");
else return this.addResolvingPromise(this.loadFromPortal({supportedTypes:["WMTS"]},a).then(function(){return b._fetchService(a)}).catch(function(a){throw new r("wmtslayer:unsupported-service-data","Invalid response from the WMTS service.",{error:a});})),v.resolve(this)};Object.defineProperty(c.prototype,"activeLayer",{get:function(){return this._get("activeLayer")},set:function(a){this._set("activeLayer",a)},enumerable:!0,configurable:!0});c.prototype.readActiveLayerFromService=function(a,b,e){var c=
this,d;this.activeLayer?b.layers.some(function(a){return a.id===c.activeLayer.id?(d=a,!0):!1}):(this.activeLayer=new g,d=b.layers[0]);this.activeLayer.read(d,e);return this.activeLayer};c.prototype.readActiveLayerFromItemOrWebDoc=function(a,b){a=b.templateUrl;b=b.wmtsInfo;a=a?this._getLowerCasedUrlParams(a):null;var e=b&&b.layerIdentifier,c=null;(b=b&&b.tileMatrixSet)&&(Array.isArray(b)?b.length&&(c=b[0]):c=b);return new g({id:e,imageFormat:a&&a.format,styleId:a&&a.style,tileMatrixSetId:c})};c.prototype.writeActiveLayer=
function(a,b,c,J){a=this.activeLayer;b.templateUrl=this.getUrlTemplate(a.id,a.tileMatrixSetId,a.imageFormat,a.styleId);c=u.getDeepValue("tileMatrixSet.tileInfo",a);b.tileInfo=c?c.toJSON(J):null;b.wmtsInfo=d.__assign(d.__assign({},b.wmtsInfo),{layerIdentifier:a.id,tileMatrixSet:a.tileMatrixSetId})};c.prototype.readCustomParameters=function(a,b){return(a=b.wmtsInfo)?this._mergeParams(a.customParameters,a.url):null};Object.defineProperty(c.prototype,"fullExtents",{get:function(){var a=[];this.activeLayer.tileMatrixSets.forEach(function(b){b.fullExtent&&
a.push(b.fullExtent)});return a},enumerable:!0,configurable:!0});c.prototype.readServiceMode=function(a,b){return-1<b.templateUrl.indexOf("?")?"KVP":"RESTful"};c.prototype.readSublayersFromService=function(a,b,c){return H(b.layers,c)};Object.defineProperty(c.prototype,"supportedSpatialReferences",{get:function(){return this.activeLayer.tileMatrixSets.map(function(a){return a.tileInfo.spatialReference}).toArray()},enumerable:!0,configurable:!0});Object.defineProperty(c.prototype,"title",{get:function(){return"Layer"===
this._get("title")?this.activeLayer&&this.activeLayer.title:this._get("title")},set:function(a){this._set("title",a)},enumerable:!0,configurable:!0});Object.defineProperty(c.prototype,"url",{get:function(){return this._get("url")},set:function(a){a&&"/"===a.substr(-1)?this._set("url",a.slice(0,-1)):this._set("url",a)},enumerable:!0,configurable:!0});c.prototype.createWebTileLayer=function(a){var b=this.getUrlTemplate(this.activeLayer.id,this.activeLayer.tileMatrixSetId,this.activeLayer.imageFormat,
this.activeLayer.styleId),c=this._getTileMatrixSetById(a.tileMatrixSetId).tileInfo,d=a.fullExtent;a=new G.default({layerIdentifier:a.id,tileMatrixSet:a.tileMatrixSetId,url:this.url});this.customLayerParameters&&(a.customLayerParameters=this.customLayerParameters);this.customParameters&&(a.customParameters=this.customParameters);return new A({fullExtent:d,urlTemplate:b,tileInfo:c,wmtsInfo:a})};c.prototype.fetchTile=function(a,b,c){a=this.getTileUrl(a,b,c);return k(a,{responseType:"image"}).then(function(a){return a.data})};
c.prototype.findSublayerById=function(a){return this.sublayers.find(function(b){return b.id===a})};c.prototype.getTileUrl=function(a,b,c){var e=this._getTileMatrixSetById(this.activeLayer.tileMatrixSetId).tileInfo.lods[a];a=e?e.levelValue?e.levelValue:""+e.level:""+a;(e=this.resourceInfo?"":h.getTileUrlFromResourceUrls({dimensionMap:this.dimensionMap,layerMap:this.layerMap},this.activeLayer.id,this.activeLayer.tileMatrixSetId,this.activeLayer.imageFormat,this.activeLayer.styleId,a,b,c))||(e=this.getUrlTemplate(this.activeLayer.id,
this.activeLayer.tileMatrixSetId,this.activeLayer.imageFormat,this.activeLayer.styleId).replace(/\{level\}/gi,a).replace(/\{row\}/gi,""+b).replace(/\{col\}/gi,""+c));return e=this._appendCustomLayerParameters(e)};c.prototype.getUrlTemplate=function(a,b,c,d){if(!this.resourceInfo){var e=h.getTileUrlTemplateFromResourceUrls({dimensionMap:this.dimensionMap,layerMap:this.layerMap},a,b,d);if(e)return e}return"KVP"===this.serviceMode?this.url+"?SERVICE\x3dWMTS\x26VERSION\x3d"+this.version+"\x26REQUEST\x3dGetTile\x26LAYER\x3d"+
a+"\x26STYLE\x3d"+d+"\x26FORMAT\x3d"+c+"\x26TILEMATRIXSET\x3d"+b+"\x26TILEMATRIX\x3d{level}\x26TILEROW\x3d{row}\x26TILECOL\x3d{col}":"RESTful"===this.serviceMode?(e="",p[c.toLowerCase()]&&(e=p[c.toLowerCase()]),this.url+a+"/"+d+"/"+b+"/{level}/{row}/{col}"+e):""};c.prototype._fetchService=function(a){return d.__awaiter(this,void 0,void 0,function(){var b,c,f;return d.__generator(this,function(e){switch(e.label){case 0:if(!this.resourceInfo)return[3,1];"KVP"===this.resourceInfo.serviceMode&&(this.url+=
-1<this.url.indexOf("?")?"":"?");b={ssl:!1,data:this.resourceInfo};return[3,6];case 1:c=this._getCapabilitiesUrl(this.serviceMode),e.label=2;case 2:return e.trys.push([2,4,,6]),[4,k(c,d.__assign(d.__assign({},a),{responseType:"text"}))];case 3:return b=e.sent(),[3,6];case 4:return e.sent(),f="KVP"===this.serviceMode?"RESTful":"KVP",c=this._getCapabilitiesUrl(f),[4,k(c,d.__assign(d.__assign({},a),{responseType:"text"}))];case 5:return b=e.sent(),[3,6];case 6:return b.data=this.resourceInfo?h.parseResourceInfo(b.data):
h.parseCapabilities(b.data,{serviceMode:this.serviceMode,url:this.url}),b.data&&this.read(b.data,{origin:"service"}),[2]}})})};c.prototype._getTileMatrixSetById=function(a){return this.findSublayerById(this.activeLayer.id).tileMatrixSets.find(function(b){return b.id===a})};c.prototype._appendCustomParameters=function(a){if(this.customParameters)for(var b in this.customParameters)a+=(-1===a.indexOf("?")?"?":"\x26")+b+"\x3d"+encodeURIComponent(this.customParameters[b]);return a};c.prototype._appendCustomLayerParameters=
function(a){if(this.customLayerParameters||this.customParameters){var b=d.__assign(d.__assign({},m.clone(this.customParameters||{})),this.customLayerParameters),c;for(c in b)a+=(-1===a.indexOf("?")?"?":"\x26")+c+"\x3d"+encodeURIComponent(b[c])}return a};c.prototype._getCapabilitiesUrl=function(a){var b;this.url=this.url.split("?")[0];"KVP"===a?b=this.url+"?request\x3dGetCapabilities\x26service\x3dWMTS\x26version\x3d"+this.version:"RESTful"===a&&(b=this.url+"/"+this.version+"/WMTSCapabilities.xml");
return b=this._appendCustomParameters(b)};c.prototype._getLowerCasedUrlParams=function(a){if(!a)return null;var b=x.urlToObject(a).query;if(!b)return null;var c={};Object.keys(b).forEach(function(a){c[a.toLowerCase()]=b[a]});return c};c.prototype._mergeParams=function(a,b){var c=this._getLowerCasedUrlParams(b);c&&(b=Object.keys(c),b.length&&(a=a?m.clone(a):{},b.forEach(function(b){a.hasOwnProperty(b)||I.has(b)||(a[b]=c[b])})));return a};d.__decorate([f.property()],c.prototype,"dimensionMap",void 0);
d.__decorate([f.property()],c.prototype,"layerMap",void 0);d.__decorate([f.property({type:g,dependsOn:["sublayers"],json:{origins:{"web-document":{write:{ignoreOrigin:!0}}}}})],c.prototype,"activeLayer",null);d.__decorate([f.reader("service","activeLayer",["layers"])],c.prototype,"readActiveLayerFromService",null);d.__decorate([f.reader(["web-document","portal-item"],"activeLayer",["wmtsInfo"])],c.prototype,"readActiveLayerFromItemOrWebDoc",null);d.__decorate([f.writer(["web-document","portal-item"],
"activeLayer",{templateUrl:{type:String},tileInfo:{type:F},"wmtsInfo.layerIdentifier":{type:String},"wmtsInfo.tileMatrixSet":{type:String}})],c.prototype,"writeActiveLayer",null);d.__decorate([f.property({type:String,value:"",json:{write:!0}})],c.prototype,"copyright",void 0);d.__decorate([f.property({type:["show","hide"]})],c.prototype,"listMode",void 0);d.__decorate([f.property({json:{origins:{"web-document":{read:{source:["wmtsInfo.customParameters","wmtsInfo.url"]},write:{target:"wmtsInfo.customParameters"}},
"portal-item":{read:{source:["wmtsInfo.customParameters","wmtsInfo.url"]},write:{target:"wmtsInfo.customParameters"}}}}})],c.prototype,"customParameters",void 0);d.__decorate([f.reader("web-document","customParameters"),f.reader("portal-item","customParameters")],c.prototype,"readCustomParameters",null);d.__decorate([f.property({json:{origins:{"web-document":{read:{source:"wmtsInfo.customLayerParameters"},write:{target:"wmtsInfo.customLayerParameters"}},"portal-item":{read:{source:"wmtsInfo.customLayerParameters"},
write:{target:"wmtsInfo.customLayerParameters"}}}}})],c.prototype,"customLayerParameters",void 0);d.__decorate([f.property({type:y,json:{write:{ignoreOrigin:!0},origins:{"web-document":{read:{source:"fullExtent"}},"portal-item":{read:{source:"fullExtent"}}}}})],c.prototype,"fullExtent",void 0);d.__decorate([f.property({readOnly:!0,dependsOn:["activeLayer"]})],c.prototype,"fullExtents",null);d.__decorate([f.property({type:["WebTiledLayer"]})],c.prototype,"operationalLayerType",void 0);d.__decorate([f.property()],
c.prototype,"resourceInfo",void 0);d.__decorate([f.property()],c.prototype,"serviceMode",void 0);d.__decorate([f.reader(["portal-item","web-document"],"serviceMode",["templateUrl"])],c.prototype,"readServiceMode",null);d.__decorate([f.property({type:q.ofType(g)})],c.prototype,"sublayers",void 0);d.__decorate([f.reader("service","sublayers",["layers"])],c.prototype,"readSublayersFromService",null);d.__decorate([f.property({readOnly:!0,dependsOn:["activeLayer"]})],c.prototype,"supportedSpatialReferences",
null);d.__decorate([f.property({dependsOn:["activeLayer"],json:{read:{source:"title"}}})],c.prototype,"title",null);d.__decorate([f.property({json:{read:!1},readOnly:!0,value:"wmts"})],c.prototype,"type",void 0);d.__decorate([f.property({json:{origins:{service:{read:{source:"tileUrl"}},"web-document":{read:{source:"wmtsInfo.url"},write:{target:"wmtsInfo.url"}},"portal-item":{read:{source:"wmtsInfo.url"},write:{target:"wmtsInfo.url"}}}}})],c.prototype,"url",null);d.__decorate([f.property()],c.prototype,
"version",void 0);return c=d.__decorate([f.subclass("esri.layers.WMTSLayer")],c)}(D.RefreshableLayer(E.ScaleRangeLayer(B.OperationalLayer(C.PortalLayer(t.MultiOriginJSONMixin(z))))))});