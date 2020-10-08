// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports tslib ../../core/jsonMap ../../core/JSONSupport ../../core/lang ../../core/accessorSupport/decorators ../../geometry/Point ./DimensionalDefinition ./RasterFunction".split(" "),function(q,r,c,e,l,f,d,m,n,p){var g=e.strict()({MT_FIRST:"first",MT_LAST:"last",MT_MIN:"min",MT_MAX:"max",MT_MEAN:"mean",MT_BLEND:"blend",MT_SUM:"sum"}),h=e.strict()({esriMosaicNone:"none",esriMosaicCenter:"center",esriMosaicNadir:"nadir",esriMosaicViewpoint:"viewpoint",esriMosaicAttribute:"attribute",
esriMosaicLockRaster:"lock-raster",esriMosaicNorthwest:"northwest",esriMosaicSeamline:"seamline"});return function(e){function a(b){b=e.call(this,b)||this;b.ascending=!0;b.itemRenderingRule=null;b.lockRasterIds=null;b.method=null;b.multidimensionalDefinition=null;b.objectIds=null;b.operation=null;b.sortField=null;b.sortValue=null;b.viewpoint=null;b.where=null;return b}c.__extends(a,e);k=a;a.prototype.readAscending=function(b,a){return null!=a.ascending?a.ascending:null!=a.sortAscending?a.sortAscending:
!0};a.prototype.readMethod=function(b,a){b=a.mosaicMethod||a.defaultMosaicMethod;switch(b?b.toLowerCase().replace("esrimosaic",""):""){case "byattribute":case "attribute":b="esriMosaicAttribute";break;case "lockraster":b="esriMosaicLockRaster";break;case "center":b="esriMosaicCenter";break;case "northwest":b="esriMosaicNorthwest";break;case "nadir":b="esriMosaicNadir";break;case "viewpoint":b="esriMosaicViewpoint";break;case "seamline":b="esriMosaicSeamline";break;case "none":b="esriMosaicNone";break;
default:b="esriMosaicNone"}return h.fromJSON(b)};a.prototype.readOperation=function(b,a){b=a.mosaicOperation;a=a.mosaicOperator&&a.mosaicOperator.toLowerCase();a=b||(a?g.toJSON(a):null);return g.fromJSON(a)||"first"};a.prototype.castSortValue=function(a){return null==a||"string"===typeof a||"number"===typeof a?a:""+a};a.prototype.clone=function(){return new k({ascending:this.ascending,itemRenderingRule:f.clone(this.itemRenderingRule),lockRasterIds:f.clone(this.lockRasterIds),method:this.method,multidimensionalDefinition:f.clone(this.multidimensionalDefinition),
objectIds:f.clone(this.objectIds),operation:this.operation,sortField:this.sortField,sortValue:this.sortValue,viewpoint:f.clone(this.viewpoint),where:this.where})};var k;c.__decorate([d.property({type:Boolean,json:{write:!0}})],a.prototype,"ascending",void 0);c.__decorate([d.reader("ascending",["ascending","sortAscending"])],a.prototype,"readAscending",null);c.__decorate([d.property({type:p,json:{write:!0}})],a.prototype,"itemRenderingRule",void 0);c.__decorate([d.property({type:[Number],json:{write:{overridePolicy:function(){return{enabled:"lock-raster"===
this.method}}}}})],a.prototype,"lockRasterIds",void 0);c.__decorate([d.property({type:String,json:{type:h.jsonValues,write:{target:"mosaicMethod",writer:h.write}}})],a.prototype,"method",void 0);c.__decorate([d.reader("method",["mosaicMethod","defaultMosaicMethod"])],a.prototype,"readMethod",null);c.__decorate([d.property({type:[n],json:{write:!0}})],a.prototype,"multidimensionalDefinition",void 0);c.__decorate([d.property({type:[Number],json:{read:{source:"fids"},write:{target:"fids"}}})],a.prototype,
"objectIds",void 0);c.__decorate([d.property({json:{type:g.jsonValues,read:{reader:g.read},write:{target:"mosaicOperation",writer:g.write}}})],a.prototype,"operation",void 0);c.__decorate([d.reader("operation",["mosaicOperation","mosaicOperator"])],a.prototype,"readOperation",null);c.__decorate([d.property({type:String,json:{write:{overridePolicy:function(){return{enabled:"attribute"===this.method}}}}})],a.prototype,"sortField",void 0);c.__decorate([d.property({type:[String,Number],json:{write:{allowNull:!0,
overridePolicy:function(){return{enabled:"attribute"===this.method,allowNull:!0}}}}})],a.prototype,"sortValue",void 0);c.__decorate([d.cast("sortValue")],a.prototype,"castSortValue",null);c.__decorate([d.property({type:m,json:{write:!0}})],a.prototype,"viewpoint",void 0);c.__decorate([d.property({type:String,json:{write:!0}})],a.prototype,"where",void 0);return a=k=c.__decorate([d.subclass("esri.layers.support.MosaicRule")],a)}(l.JSONSupport)});