// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","tslib","../../core/JSONSupport","../../core/accessorSupport/decorators"],function(b,a,d,f,e){Object.defineProperty(a,"__esModule",{value:!0});b=function(b){function c(){var a=null!==b&&b.apply(this,arguments)||this;a.title=null;return a}d.__extends(c,b);a=c;c.prototype.clone=function(){return new a({title:this.title})};var a;d.__decorate([e.property({type:String,json:{write:!0}})],c.prototype,"title",void 0);return c=a=d.__decorate([e.subclass("esri.renderers.support.LegendOptions")],
c)}(f.JSONSupport);a.LegendOptions=b;a.default=b});