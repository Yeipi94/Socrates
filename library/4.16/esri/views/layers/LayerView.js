// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports tslib ../../core/Accessor ../../core/Evented ../../core/HandleOwner ../../core/Identifiable ../../core/Logger ../../core/Promise ../../core/accessorSupport/decorators".split(" "),function(n,p,b,f,g,h,k,l,m,d){return function(e){function a(c){c=e.call(this,c)||this;c.layer=null;c.parent=null;return c}b.__extends(a,e);a.prototype.initialize=function(){var c=this;this.when().catch(function(a){if("layerview:create-error"!==a.name){var b=c.layer&&c.layer.id||"no id",d=c.layer&&
c.layer.title||"no title";l.getLogger(c.declaredClass).error("#resolve()","Failed to resolve layer view (layer title: '"+d+"', id: '"+b+"')",a);throw a;}})};a.prototype.destroy=function(){this.layer=this.parent=null};Object.defineProperty(a.prototype,"fullOpacity",{get:function(){var a=this.get("layer.opacity"),a=null==a?1:a,b=this.get("parent.fullOpacity");return a*(null==b?1:b)},enumerable:!0,configurable:!0});Object.defineProperty(a.prototype,"suspended",{get:function(){return!this.canResume()},
enumerable:!0,configurable:!0});Object.defineProperty(a.prototype,"suspendInfo",{get:function(){return this.getSuspendInfo()},enumerable:!0,configurable:!0});Object.defineProperty(a.prototype,"updating",{get:function(){return!!(this.updatingHandles&&this.updatingHandles.updating||this.isUpdating())},enumerable:!0,configurable:!0});Object.defineProperty(a.prototype,"visible",{get:function(){return!0===this.get("layer.visible")},set:function(a){void 0===a?this._clearOverride("visible"):this._override("visible",
a)},enumerable:!0,configurable:!0});a.prototype.canResume=function(){return!this.get("parent.suspended")&&this.get("view.ready")&&this.get("layer.loaded")&&this.visible||!1};a.prototype.getSuspendInfo=function(){var a=this.parent&&this.parent.suspended?this.parent.suspendInfo:{};this.view&&this.view.ready||(a.viewNotReady=!0);this.layer&&this.layer.loaded||(a.layerNotLoaded=!0);this.visible||(a.layerInvisible=!0);return a};a.prototype.isUpdating=function(){return!1};b.__decorate([d.property({dependsOn:["layer.opacity",
"parent.fullOpacity"]})],a.prototype,"fullOpacity",null);b.__decorate([d.property()],a.prototype,"layer",void 0);b.__decorate([d.property()],a.prototype,"parent",void 0);b.__decorate([d.property({readOnly:!0,dependsOn:["visible","layer.loaded","parent.suspended","view?.ready"]})],a.prototype,"suspended",null);b.__decorate([d.property({readOnly:!0,dependsOn:["visible","layer.loaded","parent.suspended","view?.ready"]})],a.prototype,"suspendInfo",null);b.__decorate([d.property({type:Boolean,dependsOn:["updatingHandles.updating"],
readOnly:!0})],a.prototype,"updating",null);b.__decorate([d.property({dependsOn:["layer.visible"]})],a.prototype,"visible",null);return a=b.__decorate([d.subclass("esri.views.layers.LayerView")],a)}(h.HandleOwnerMixin(k.IdentifiableMixin(m.EsriPromiseMixin(g.EventedMixin(f)))))});