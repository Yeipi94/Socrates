// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports tslib ./Accessor ./Handles ./accessorSupport/decorators ../views/support/WatchUpdatingTracking".split(" "),function(g,e,c,h,k,f,l){Object.defineProperty(e,"__esModule",{value:!0});e.HandleOwnerMixin=function(d){return function(b){function a(){return null!==b&&b.apply(this,arguments)||this}c.__extends(a,b);a.prototype.destroy=function(){this.destroyed||(this.handles.destroy(),this.updatingHandles.destroy())};Object.defineProperty(a.prototype,"handles",{get:function(){return this._get("handles")||
new k},enumerable:!0,configurable:!0});Object.defineProperty(a.prototype,"updatingHandles",{get:function(){return this._get("updatingHandles")||new l.WatchUpdatingTracking},enumerable:!0,configurable:!0});c.__decorate([f.property({readOnly:!0})],a.prototype,"handles",null);c.__decorate([f.property({readOnly:!0})],a.prototype,"updatingHandles",null);return a=c.__decorate([f.subclass("esri.core.HandleOwner")],a)}(d)};g=function(d){function b(){return null!==d&&d.apply(this,arguments)||this}c.__extends(b,
d);return b=c.__decorate([f.subclass("esri.core.HandleOwner")],b)}(e.HandleOwnerMixin(h));e.HandleOwner=g});