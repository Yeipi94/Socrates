// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","tslib","../../../../Graphic","../../../../core/accessorSupport/decorators"],function(e,f,b,h,g){Object.defineProperty(f,"__esModule",{value:!0});e=function(c){function a(a){return c.call(this,a)||this}b.__extends(a,c);d=a;a.prototype.clone=function(){return new d(this.cloneProperties())};a.prototype.cloneProperties=function(){var a=this.pointCloudMetadata;return b.__assign(b.__assign({},c.prototype.cloneProperties.call(this)),{pointCloudMetadata:a})};var d;b.__decorate([g.property({constructOnly:!0})],
a.prototype,"pointCloudMetadata",void 0);return a=d=b.__decorate([g.subclass("esri.views.3d.layers.i3s.PointGraphic")],a)}(h);f.PointGraphic=e});