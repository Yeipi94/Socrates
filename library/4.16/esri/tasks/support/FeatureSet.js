// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports tslib ../../geometry ../../Graphic ../../core/jsonMap ../../core/JSONSupport ../../core/maybe ../../core/accessorSupport/decorators ../../geometry/SpatialReference ../../geometry/support/jsonUtils ../../layers/support/Field".split(" "),function(m,A,f,w,u,x,y,p,k,v,r,z){var t=new x.default({esriGeometryPoint:"point",esriGeometryMultipoint:"multipoint",esriGeometryPolyline:"polyline",esriGeometryPolygon:"polygon",esriGeometryEnvelope:"extent",mesh:"mesh"});m=function(m){function b(a){a=
m.call(this,a)||this;a.displayFieldName=null;a.exceededTransferLimit=!1;a.features=[];a.fields=null;a.geometryType=null;a.hasM=!1;a.hasZ=!1;a.queryGeometry=null;a.spatialReference=null;return a}f.__extends(b,m);b.prototype.readFeatures=function(a,c){c=v.fromJSON(c.spatialReference);for(var d=[],e=0;e<a.length;e++){var g=a[e],l=u.fromJSON(g),g=g.geometry&&g.geometry.spatialReference;p.isSome(l.geometry)&&!g&&(l.geometry.spatialReference=c);d.push(l)}return d};b.prototype.writeGeometryType=function(a,
c,d,e){if(a)t.write(a,c,d,e);else if(a=this.features)for(var g=0;g<a.length;g++){var l=a[g];if(l&&p.isSome(l.geometry)){t.write(l.geometry.type,c,d,e);break}}};b.prototype.writeSpatialReference=function(a,c){if(a)c.spatialReference=a.toJSON();else if(a=this.features)for(var d=0;d<a.length;d++){var e=a[d];e&&p.isSome(e.geometry)&&e.geometry.spatialReference&&(c.spatialReference=e.geometry.spatialReference.toJSON())}};b.prototype.toJSON=function(a){var c=this.write(null);if(c.features&&Array.isArray(a)&&
0<a.length)for(var d=0;d<c.features.length;d++){var e=c.features[d];if(e.geometry){var g=a&&a[d];e.geometry=g&&g.toJSON()||e.geometry}}return c};b.prototype.quantize=function(a){for(var c=a.scale,d=c[0],e=c[1],c=a.translate,g=c[0],l=c[1],c=this.features,b=this._getQuantizationFunction(this.geometryType,function(a){return Math.round((a-g)/d)},function(a){return Math.round((l-a)/e)}),n=0,h=c.length;n<h;n++)b(p.unwrap(c[n].geometry))||(c.splice(n,1),n--,h--);this.transform=a;return this};b.prototype.unquantize=
function(){var a=this.features,c=this.transform;if(!c)return this;for(var d=c.translate,e=d[0],g=d[1],c=c.scale,l=c[0],b=c[1],c=this._getHydrationFunction(this.geometryType,function(a){return a*l+e},function(a){return g-a*b}),d=0;d<a.length;d++){var n=a[d].geometry;p.isSome(n)&&c(n)}return this};b.prototype._quantizePoints=function(a,c,d){for(var e,g,l=[],b=0,n=a.length;b<n;b++){var h=a[b];if(0<b){var f=c(h[0]),h=d(h[1]);if(f!==e||h!==g)l.push([f-e,h-g]),e=f,g=h}else e=c(h[0]),g=d(h[1]),l.push([e,
g])}return 0<l.length?l:null};b.prototype._getQuantizationFunction=function(a,c,d){var e=this;return"point"===a?function(a){a.x=c(a.x);a.y=d(a.y);return a}:"polyline"===a||"polygon"===a?function(a){for(var g=r.isPolygon(a)?a.rings:a.paths,b=[],f=0,h=g.length;f<h;f++){var k=e._quantizePoints(g[f],c,d);k&&b.push(k)}return 0<b.length?(r.isPolygon(a)?a.rings=b:a.paths=b,a):null}:"multipoint"===a?function(a){var b;b=e._quantizePoints(a.points,c,d);return 0<b.length?(a.points=b,a):null}:"extent"===a?function(a){return a}:
null};b.prototype._getHydrationFunction=function(a,c,b){if("point"===a)return function(a){a.x=c(a.x);a.y=b(a.y)};if("polyline"===a||"polygon"===a)return function(a){a=r.isPolygon(a)?a.rings:a.paths;for(var e,d,f=0,k=a.length;f<k;f++)for(var h=a[f],m=0,p=h.length;m<p;m++){var q=h[m];0<m?(e+=q[0],d+=q[1]):(e=q[0],d=q[1]);q[0]=c(e);q[1]=b(d)}};if("extent"===a)return function(a){a.xmin=c(a.xmin);a.ymin=b(a.ymin);a.xmax=c(a.xmax);a.ymax=b(a.ymax)};if("multipoint"===a)return function(a){a=a.points;for(var d,
e,f=0,k=a.length;f<k;f++){var h=a[f];0<f?(d+=h[0],e+=h[1]):(d=h[0],e=h[1]);h[0]=c(d);h[1]=b(e)}}};f.__decorate([k.property({type:String,json:{write:!0}})],b.prototype,"displayFieldName",void 0);f.__decorate([k.property({type:Boolean,json:{write:{overridePolicy:function(a){return{enabled:a}}}}})],b.prototype,"exceededTransferLimit",void 0);f.__decorate([k.property({type:[u],json:{write:!0}})],b.prototype,"features",void 0);f.__decorate([k.reader("features")],b.prototype,"readFeatures",null);f.__decorate([k.property({type:[z],
json:{write:!0}})],b.prototype,"fields",void 0);f.__decorate([k.property({type:"point multipoint polyline polygon extent mesh".split(" "),json:{read:{reader:t.read}}})],b.prototype,"geometryType",void 0);f.__decorate([k.writer("geometryType")],b.prototype,"writeGeometryType",null);f.__decorate([k.property({type:Boolean,json:{write:{overridePolicy:function(a){return{enabled:a}}}}})],b.prototype,"hasM",void 0);f.__decorate([k.property({type:Boolean,json:{write:{overridePolicy:function(a){return{enabled:a}}}}})],
b.prototype,"hasZ",void 0);f.__decorate([k.property({types:w.geometryTypes,json:{read:r.fromJSON,write:!0}})],b.prototype,"queryGeometry",void 0);f.__decorate([k.property({type:v,json:{write:!0}})],b.prototype,"spatialReference",void 0);f.__decorate([k.writer("spatialReference")],b.prototype,"writeSpatialReference",null);f.__decorate([k.property({json:{write:!0}})],b.prototype,"transform",void 0);return b=f.__decorate([k.subclass("esri.tasks.support.FeatureSet")],b)}(y.JSONSupport);m.prototype.toJSON.isDefaultToJSON=
!0;(function(f){})(m||(m={}));return m});