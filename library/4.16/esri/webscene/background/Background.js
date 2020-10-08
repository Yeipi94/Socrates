// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports tslib ../../core/jsonMap ../../core/JSONSupport ../../core/accessorSupport/decorators".split(" "),function(k,l,c,g,h,e){var d=g.strict()({color:"color"});return function(f){function b(a){return f.call(this,a)||this}c.__extends(b,f);b.prototype.normalizeCtorArgs=function(a){a&&a.type&&(a=c.__assign({},a),delete a.type);return a};b.prototype.clone=function(){};c.__decorate([e.property({type:d.apiValues,readOnly:!0,json:{type:d.jsonValues,read:!1,write:d.write}})],b.prototype,
"type",void 0);return b=c.__decorate([e.subclass("esri.webscene.background.Background")],b)}(h.JSONSupport)});