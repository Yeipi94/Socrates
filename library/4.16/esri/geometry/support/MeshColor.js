// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","tslib","../../core/JSONSupport","../../core/accessorSupport/decorators"],function(b,c,d,f,e){Object.defineProperty(c,"__esModule",{value:!0});b=function(b){function a(a){return b.call(this,a)||this}d.__extends(a,b);a.prototype.clone=function(){throw Error("not implemented");};d.__decorate([e.property({readOnly:!0,json:{read:!1,write:{isRequired:!0,ignoreOrigin:!0,enabled:!0}}})],a.prototype,"type",void 0);return a=d.__decorate([e.subclass("esri.geometry.support.MeshColor")],
a)}(f.JSONSupport);c.MeshColor=b;c.default=b});