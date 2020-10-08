// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","tslib","../../core/JSONSupport","../../core/accessorSupport/decorators"],function(g,h,c,f,d){return function(e){function b(a){a=e.call(this,a)||this;a.visible=!0;return a}c.__extends(b,e);b.prototype.normalizeCtorArgs=function(a){a&&a.type&&(a=c.__assign({},a),delete a.type);return a};b.prototype.clone=function(){};c.__decorate([d.property({type:["line"],readOnly:!0,json:{read:!1,write:{ignoreOrigin:!0}}})],b.prototype,"type",void 0);c.__decorate([d.property({readOnly:!0})],
b.prototype,"visible",void 0);return b=c.__decorate([d.subclass("esri.symbols.callouts.Callout3D")],b)}(f.JSONSupport)});