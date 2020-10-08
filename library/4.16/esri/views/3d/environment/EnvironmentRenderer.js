// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports tslib ../../../core/Accessor ../../../core/compilerUtils ../../../core/Handles ../../../core/watchUtils ../../../core/accessorSupport/decorators ./PanoramicAtmosphere ./RealisticAtmosphere ./SimpleAtmosphere ./Stars".split(" "),function(r,t,c,h,k,l,e,d,m,g,n,p){var q=[14,15];return function(f){function b(){var a=null!==f&&f.apply(this,arguments)||this;a._handles=new l;a._initContext=null;a._pendingAtmosphere=null;a._atmosphere=null;a._stars=null;return a}c.__extends(b,f);Object.defineProperty(b.prototype,
"canRender",{get:function(){return!(!this.view.basemapTerrain||!this.view.basemapTerrain.renderer.canRender)||"global"!==this.view.viewingMode},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,"updating",{get:function(){return null!=this._pendingAtmosphere},enumerable:!0,configurable:!0});b.prototype.initialize=function(){this.view._stage.addRenderPlugin(q,this)};b.prototype.destroy=function(){this._pendingAtmosphere&&(this._pendingAtmosphere.destroy(),this._pendingAtmosphere=null);
this._atmosphere&&(this._atmosphere.destroy(),this._atmosphere=null);this._stars&&(this._stars.destroy(),this._stars=null);this._handles&&this._handles.removeAll();this.view&&(this.view._stage.removeRenderPlugin(this),this._set("view",null))};b.prototype.initializeRenderContext=function(a){this._initContext=a;this._techniqueRepository=this._initContext.shaderTechniqueRep;this.setup()};b.prototype.setup=function(){var a=this;this._handles.add(e.when(this.view,"basemapTerrain",function(){return a._updateBasemapTerrain()},
!0));this._handles.add([e.init(this.view,["viewingMode","environment.atmosphereEnabled","environment.atmosphere.quality"],function(){return a._updateAtmosphere()},!0),e.init(this.view,"environment.starsEnabled",function(){return a._updateStars()},!0)])};b.prototype.uninitializeRenderContext=function(){this._stars&&(this._stars.uninitializeRenderContext(),this._stars.destroy(),this._stars=null);this._atmosphere&&(this._atmosphere.uninitializeRenderContext(),this._atmosphere.destroy(),this._atmosphere=
null)};b.prototype.render=function(a){var b=!0;this._stars&&this._stars.canRender&&(b=this._stars.render(a)&&b);this._atmosphere&&this._atmosphere.canRender&&(b=this._atmosphere.render(a)&&b);return b};b.prototype._setNeedsRender=function(){this._initContext&&this._initContext.requestRender()};b.prototype._updateStars=function(){var a=this.view.get("environment.starsEnabled")||!1;a&&!this._stars?(this._stars=new p(this.view),this._stars.initializeRenderContext(this._initContext),this._setNeedsRender()):
!a&&this._stars&&(this._stars.destroy(),this._stars=null,this._setNeedsRender())};b.prototype._updateAtmosphere=function(){var a=this,b=this._getAtmosphereType();if(this.atmosphereType!==b)if(this.atmosphereType=b,this._pendingAtmosphere&&(this._pendingAtmosphere!==this._atmosphere&&this._pendingAtmosphere.destroy(),this._pendingAtmosphere=null),b=this._getAtmosphereClass()){var c=new b(this.view,this._techniqueRepository);c.initializeRenderContext(this._initContext);null==this._atmosphere&&(this._atmosphere=
c,this._setNeedsRender());this._pendingAtmosphere=c;c.when().then(function(){a._pendingAtmosphere!==a._atmosphere&&(a._atmosphere.destroy(),a._atmosphere=a._pendingAtmosphere);a._pendingAtmosphere=null;a._setNeedsRender();a._updateBasemapTerrain()}).catch(function(){a._pendingAtmosphere===c&&(a._pendingAtmosphere=null)})}else this._atmosphere&&(this._atmosphere.destroy(),this._atmosphere=null,this._setNeedsRender()),this._updateBasemapTerrain()};b.prototype._getAtmosphereClass=function(){var a=this._getAtmosphereType();
if(this.atmosphereClassFromType)return this.atmosphereClassFromType(a);switch(a){case "none":return null;case "realistic":return g.RealisticAtmosphere;case "panoramic":return m;case "simple":return n;default:k.neverReached(a)}};b.prototype._getAtmosphereType=function(){var a=this.view.get("environment.atmosphereEnabled"),b=this.view.get("environment.atmosphere.quality");return a&&null!=b?"local"===this.view.viewingMode?"panoramic":"high"===b&&g.RealisticAtmosphere.isSupported(this._initContext)?"realistic":
"simple":"none"};b.prototype._updateBasemapTerrain=function(){var a=this.view.basemapTerrain;a&&(a.velvetOverground=null!=this._atmosphere&&"simple"===this.atmosphereType)};Object.defineProperty(b.prototype,"test",{get:function(){return{atmosphere:this._atmosphere}},enumerable:!0,configurable:!0});c.__decorate([d.property({constructOnly:!0})],b.prototype,"view",void 0);c.__decorate([d.property({constructOnly:!0})],b.prototype,"atmosphereClassFromType",void 0);c.__decorate([d.property({dependsOn:["_pendingAtmosphere"]})],
b.prototype,"updating",null);c.__decorate([d.property()],b.prototype,"_pendingAtmosphere",void 0);return b=c.__decorate([d.subclass("esri.views.3d.environment.EnvironmentRenderer")],b)}(h)});