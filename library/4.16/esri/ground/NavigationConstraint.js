// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","tslib","../core/JSONSupport","../core/accessorSupport/decorators"],function(b,e,c,g,f){Object.defineProperty(e,"__esModule",{value:!0});b=function(b){function a(a){a=b.call(this,a)||this;a.type="none";return a}c.__extends(a,b);d=a;a.prototype.clone=function(){return new d({type:this.type})};var d;c.__decorate([f.enumeration({none:"none",stayAbove:"stay-above"})],a.prototype,"type",void 0);return a=d=c.__decorate([f.subclass("esri.ground.NavigationConstraint")],a)}(g.JSONSupport);
e.NavigationConstraint=b});