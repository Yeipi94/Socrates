// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","tslib","../../core/JSONSupport","../../core/accessorSupport/decorators"],function(a,c,d,f,e){Object.defineProperty(c,"__esModule",{value:!0});a=function(a){function b(){var b=null!==a&&a.apply(this,arguments)||this;b.type=null;return b}d.__extends(b,a);d.__decorate([e.property({type:["selection","cluster"],readOnly:!0,json:{read:!1,write:!0}})],b.prototype,"type",void 0);return b=d.__decorate([e.subclass("esri.layers.support.FeatureReduction")],b)}(f.JSONSupport);c.FeatureReduction=
a;c.default=a});