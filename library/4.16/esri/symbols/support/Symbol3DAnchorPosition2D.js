// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","tslib","../../core/Accessor","../../core/accessorSupport/decorators"],function(b,a,d,f,e){Object.defineProperty(a,"__esModule",{value:!0});b=function(b){function c(){var a=null!==b&&b.apply(this,arguments)||this;a.x=0;a.y=0;return a}d.__extends(c,b);a=c;c.prototype.clone=function(){return new a({x:this.x,y:this.y})};var a;d.__decorate([e.property({type:Number})],c.prototype,"x",void 0);d.__decorate([e.property({type:Number})],c.prototype,"y",void 0);return c=a=d.__decorate([e.subclass("esri.symbols.support.Symbol3DAnchorPosition2D")],
c)}(f);a.Symbol3DAnchorPosition2D=b;a.default=b});