// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports tslib ../../../core/Logger ../../../core/promiseUtils ../../../core/accessorSupport/decorators ../engine/BitmapContainer ./LayerView2D ./support/ExportStrategy ../../layers/LayerView ../../layers/RefreshableLayerView".split(" "),function(p,q,b,e,f,c,g,h,k,l,m){var n=e.getLogger("esri.views.2d.layers.BaseDynamicLayerView2D");return function(d){function a(){var a=null!==d&&d.apply(this,arguments)||this;a.container=new g.BitmapContainer;return a}b.__extends(a,d);a.prototype.hitTest=
function(){return null};a.prototype.update=function(a){this.strategy.update(a).catch(function(a){f.isAbortError(a)||n.error(a)});this.notifyChange("updating")};a.prototype.attach=function(){this.strategy=new k({container:this.container,fetchSource:this.fetchBitmapData.bind(this),requestUpdate:this.requestUpdate.bind(this)})};a.prototype.detach=function(){this.strategy.destroy();this.strategy=null;this.container.removeAllChildren()};a.prototype.moveStart=function(){};a.prototype.viewChange=function(){};
a.prototype.moveEnd=function(){this.requestUpdate()};a.prototype.fetchBitmapData=function(a,b,c){return this.layer.fetchImage(a,b,c,{timestamp:this.refreshTimestamp})};a.prototype.doRefresh=function(){return b.__awaiter(this,void 0,void 0,function(){return b.__generator(this,function(a){this.requestUpdate();return[2]})})};a.prototype.isUpdating=function(){return this.strategy.updating||this.updateRequested};b.__decorate([c.property()],a.prototype,"strategy",void 0);b.__decorate([c.property({dependsOn:["strategy.updating"]})],
a.prototype,"updating",void 0);return a=b.__decorate([c.subclass("esri.views.2d.layers.BaseDynamicLayerView2D")],a)}(m.RefreshableLayerView(h.LayerView2DMixin(l)))});