// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","tslib","../../core/Accessor","../../core/accessorSupport/decorators"],function(b,c,d,f,e){Object.defineProperty(c,"__esModule",{value:!0});b=function(b){function a(){var a=null!==b&&b.apply(this,arguments)||this;a.x=0;a.y=0;a.z=0;return a}d.__extends(a,b);c=a;a.prototype.clone=function(){return new c({x:this.x,y:this.y,z:this.z})};var c;d.__decorate([e.property({type:Number})],a.prototype,"x",void 0);d.__decorate([e.property({type:Number})],a.prototype,"y",void 0);d.__decorate([e.property({type:Number})],
a.prototype,"z",void 0);return a=c=d.__decorate([e.subclass("esri.symbols.support.Symbol3DAnchorPosition3D")],a)}(f);c.Symbol3DAnchorPosition3D=b;c.default=b});