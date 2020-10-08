// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports tslib ../../../Graphic ../../../core/Accessor ../../../core/Handles ../../../core/has ../../../core/mathUtils ../../../core/mathUtils ../../../core/scheduling ../../../core/accessorSupport/decorators ../../../core/libs/gl-matrix-2/vec2 ../../../core/libs/gl-matrix-2/vec3 ../../../core/libs/gl-matrix-2/vec3f64 ../../../core/libs/gl-matrix-2/vec4 ../../../core/libs/gl-matrix-2/vec4f64 ../../../geometry/Point ../../../geometry/support/aaBoundingRect ../../../layers/support/timeUtils ../../../symbols/SimpleMarkerSymbol ../state/utils/viewUtils ../support/animationUtils ../support/debugFlags ../support/earthUtils ../support/geometryUtils ../support/mathUtils ../support/projectionUtils ./OverlayRenderer ../webgl-engine/lib/Intersector ../webgl-engine/lib/localOrigin ../webgl-engine/parts/requireUtils ../../support/Scheduler".split(" "),
function(D,E,h,K,L,M,N,v,O,P,r,Q,t,y,u,F,R,e,S,T,U,V,z,W,X,G,x,Y,Z,H,aa,ba){function ca(e,b){for(var a=z.TESTS_DISABLE_UPDATE_THRESHOLDS?0:1E-5*Math.max(e[2]-e[0],e[3]-e[1],b[2]-b[0],b[3]-b[1]),c=0;4>c;c++)if(Math.abs(b[c]-e[c])>a)return!0;return!1}function I(e){e=e.renderTargets;return+e.color.valid|+e.colorWithoutRasterImage.valid<<1|+e.highlight.valid<<2|+e.water.valid<<3|+e.occluded.valid<<4}Object.defineProperty(E,"__esModule",{value:!0});var da=[[-.1,-2,3.9,2],[-.1,-3.9,3.9,.1],[-2,-3.9,2,.1],
[-3.9,-3.9,.1,.1],[-3.9,-2,.1,2],[-3.9,-.1,.1,3.9],[-2,-.1,2,3.9],[-.1,-.1,3.9,3.9]],B;D=function(A){function b(){var a=null!==A&&A.apply(this,arguments)||this;a._handles=new M;a._overlaySR=null;a._renderSR=null;a._overlaySREqualsRenderSR=!0;a._drapeSources=new Map;a._drapeTargets=new Set;a._overlays=null;a._drapeSourceTypes=[0,0];a._drapeTargetTypes=[0,0];a._renderedAltitude=0;a._placementDirty=!1;a._drawTexturesDirty=!1;a._drawTexturesAnimateDirty=!1;a._hasUnusedRenderTargets=!1;a._isSpherical=
!1;a._longitudeCyclical=null;a._latestOriginId=0;a._maxResolution=N("esri-mobile")?2048:4096;a._animationTimeLast=0;a._forceAnimation=!1;return a}h.__extends(b,A);Object.defineProperty(b.prototype,"updating",{get:function(){return this.needsUpdate()||this.renderer.updating},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,"hasHighlights",{get:function(){return this.renderer.hasHighlights},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,"rendersOccluded",{get:function(){return this.renderer.rendersOccluded},
enumerable:!0,configurable:!0});b.prototype.initialize=function(){var a=this;this._stage=this.view._stage;this.renderer=new Y.OverlayRenderer({renderView:this._stage.renderView});this._stage.renderView.updateLogicClients.add(this.renderer);this._drapeTargetTypes[0]++;this.renderer.onHasHighlightsChanged=function(){a.setDrawTexturesDirty();a.notifyChange("hasHighlights")};this.renderer.onRendersOccludedChanged=function(){a.setDrawTexturesDirty();a.notifyChange("rendersOccluded")};this.renderer.onContentChanged=
function(){a.setDrawTexturesDirty()};this.groundIntersector=new Z.Intersector(this.view.viewingMode);this.groundIntersector.options.backfacesTerrain=!0;this.groundIntersector.options.invisibleTerrain=!0;this.groundIntersector.options.hud=!1;this._handles.add([this.view.watch(["pointsOfInterest.renderPointOfView","pointsOfInterest.centerOnSurfaceFrequent.location","pixelRatio"],function(){return a.setOverlayPlacementDirty()}),this.terrainSurface.on("elevation-change",function(){return a.setOverlayPlacementDirty()}),
this.view.on("resize",function(){return a.setOverlayPlacementDirty()}),P.addFrameTask({preRender:function(c){a.renderer.commitChanges();a.hasOverlays()&&(a._dispatchRendererUpdate(c),a._drawOverlayTextures());a._hasUnusedRenderTargets&&a._collectUnusedRenderTargetMemory()}}),this.view.resourceController.scheduler.registerTask(ba.Task.OVERLAY_MANAGER,function(){return a.updateOverlays()},function(){return a.needsUpdate()}),this.view._stage.renderView.events.on("force-camera-for-screenshot",function(c){a.updateOverlays(c);
a._drawOverlayTextures()})])};b.prototype.destroy=function(){var a=this;this._drapeSources.forEach(function(c,d){return a._unregisterDrapeSource(d)});this._drapeTargets.forEach(function(c,d){return a._unregisterDrapeTarget(d)});this._drapeTargetTypes[0]--;this._disposeOverlays();this._stage.renderView.updateLogicClients.remove(this.renderer);this.renderer.dispose();this._handles&&(this._handles.destroy(),this._handles=null)};b.prototype.hasOverlays=function(){return!!this._overlays};b.prototype.setSpatialReference=
function(a,c){this._overlaySR=a;this._longitudeCyclical=null;if(a){if(this._renderSR=this.view.renderSpatialReference,this._overlaySREqualsRenderSR=this._overlaySR.equals(this._renderSR),this._isSpherical=c)this._longitudeCyclical=a.isWebMercator?new G.Cyclical(-2.0037508342787E7,2.0037508342787E7):new G.Cyclical(-180,180),this.renderer.longitudeCyclical=this._longitudeCyclical}else this._disposeOverlays();this.notifyChange("updating")};b.prototype.getGpuMemoryUsage=function(){return this.renderer.getGpuMemoryUsage()};
b.prototype.updateLayerViews=function(a){for(var c=this,d=0,g=this.view.allLayerViews.items;d<g.length;d++){var b=g[d];"drapeSourceType"in b&&!this._drapeSources.has(b)&&this._registerDrapeSource(b);"drapeTargetType"in b&&!this._drapeTargets.has(b)&&this._registerDrapeTarget(b)}this._drapeSources.forEach(function(d,g){a.has(g.uid)||c._unregisterDrapeSource(g)});this._drapeTargets.forEach(function(d){a.has(d.uid)||c._unregisterDrapeTarget(d)});this.renderer.updateLayerOrder();this.setDrawTexturesDirty()};
b.prototype._registerDrapeSource=function(a){var c=this,d=a.on("draped-data-change",function(){return c.setOverlayContentDirty()});this._drapeSourceTypes[a.drapeSourceType]++;this._drapeSources.set(a,[d]);this._overlays&&a.setDrapingExtent&&this._overlays.forEach(function(d,b){return c._updateDrapeSource(a,b,d)});this.setOverlayContentDirty()};b.prototype._updateDrapeSource=function(a,c,d){a.setDrapingExtent&&a.setDrapingExtent(c,d.extent,this._overlaySR,d.resolution,d.renderLocalOrigin,d.pixelRatio)};
b.prototype._unregisterDrapeSource=function(a){if(this._drapeSources.has(a)){var c=this._drapeSources.get(a);c&&c.forEach(function(a){return a.remove()});this._drapeSourceTypes[a.drapeSourceType]--;this._drapeSources.delete(a);this.setOverlayContentDirty()}};b.prototype._registerDrapeTarget=function(a){this._drapeTargets.add(a);this._updateDrapeTarget(a);this._drapeTargetTypes[a.drapeTargetType]++};b.prototype._updateDrapeTarget=function(a){var c=this;this._overlays&&this._overlays.forEach(function(d,
g){var b=d.renderTargets,f=c.needsColorWithoutRasterImage()?b.colorWithoutRasterImage:c.hasDrapedFeatures()?b.color:null,e=b.highlight,b=b.water;a.setDrapingTextures(g,d.extent,f&&f.valid?c.renderer.getRenderTargetTexture(f.id):null,e.valid?c.renderer.getRenderTargetTexture(e.id):null,b.valid?c.renderer.getRenderTargetTexture(b.id):null)})};b.prototype._unregisterDrapeTarget=function(a){this._drapeTargets.delete(a);this._drapeTargetTypes[a.drapeTargetType]--};b.prototype.setOverlayContentDirty=function(){this.setOverlayPlacementDirty();
this.setDrawTexturesDirty()};b.prototype.setOverlayPlacementDirty=function(){this._placementDirty=!0;this.notifyChange("updating")};b.prototype.updateOverlays=function(a){void 0===a&&(a=this.view.state.camera);if(this._overlaySR){var c;c=v.nextHighestPowerOfTwo(Math.max(a.fullWidth,a.fullHeight)+256);var d=Math.min(c,this._maxResolution);this._computeOverlayExtents(a,c,w);c=e.width(w.inner)/e.width(w.outer);this._initOverlays();a=this._updateOverlay(0,w.inner,d,1);d=this._updateOverlay(1,w.outer,
d,c);if(a||d)this.terrainSurface.updateTileOverlayParams(),this.setDrawTexturesDirty();this._placementDirty=!1;this.terrainSurface.updateOverlayOpacity();this.notifyChange("updating")}};b.prototype._updateOverlay=function(a,c,d,g){var b=this,f=this._overlays[a];if(!ca(c,f.extent)&&d===f.resolution&&f.pixelRatio===g)return!1;e.set(f.extent,c);f.resolution=d;f.pixelRatio=g;c=e.center(f.extent);f.renderLocalOrigin=H.fromValues(c[0],c[1],0,"OV_"+this._latestOriginId++);this._drapeSources.forEach(function(c,
d){return b._updateDrapeSource(d,a,f)});return!0};b.prototype.needsUpdate=function(){return this._placementDirty&&(0<this._drapeSources.size||0<this.view.graphics.length||z.OVERLAY_DRAW_DEBUG_TEXTURE)&&!!this._overlaySR&&!this._get("suspended")&&this.terrainSurface.ready};b.prototype.updateOpacity=function(a){return this._overlays?this._getAltitudeBasedOpacity(a,this._renderedAltitude):1};b.prototype._getAltitudeBasedOpacity=function(a,c){return 3.5*a<c?Math.sqrt(v.clamp((a-c/10)/(c/3.5-c/10),0,1)):
1};b.prototype.setTileParameters=function(a,c,d){if(this._overlays){var g=this._overlays[0],b=this._overlays[1];a=e.intersection(a.extent,a.surface.extent,J);this._rectInsideRect(a,g.extent)?(this._setTileOverlayData(a,g,c.overlays[0]),this._invalidateTileOverlayData(c.overlays[1])):this._rectanglesOverlap(a,g.extent)?(this._setTileOverlayData(a,g,c.overlays[0]),this._setTileOverlayData(a,b,c.overlays[1])):(this._rectanglesOverlap(a,b.extent)?this._setTileOverlayData(a,b,c.overlays[0]):this._invalidateTileOverlayData(c.overlays[0]),
this._invalidateTileOverlayData(c.overlays[1]))}else this._invalidateTileOverlayData(c.overlays[0]),this._invalidateTileOverlayData(c.overlays[1]);c.overlayOpacity=void 0!==d?d:1};b.prototype.overlayPixelSizeInMapUnits=function(a){if(!this._overlays)return 0;var c=this._overlays[0],d=this._overlays[1];a=this._pointIsInExtent(a,c.extent)?c:d;return(a.extent[2]-a.extent[0])/a.resolution};b.prototype._setTileOverlayData=function(a,c,d){var g=c.extent;d.texScale[0]=(a[2]-a[0])/(g[2]-g[0]);d.texScale[1]=
(a[3]-a[1])/(g[3]-g[1]);var b=a[0];if(this._longitudeCyclical){var b=this._longitudeCyclical.minimalMonotonic(g[0],b),f=this._longitudeCyclical.minimalMonotonic(g[0],a[2]);b>f&&(b=f-(a[2]-a[0]))}d.texOffset[0]=(b-g[0])/(g[2]-g[0]);d.texOffset[1]=(a[1]-g[1])/(g[3]-g[1]);a=c.renderTargets;d.renderTargetIds.color=a.color.valid?a.color.id:null;d.renderTargetIds.highlight=a.highlight.valid?a.highlight.id:null;d.renderTargetIds.water=a.water.valid?a.water.id:null;d.renderTargetIds.occluded=a.occluded.valid?
a.occluded.id:null};b.prototype._invalidateTileOverlayData=function(a){a.renderTargetIds.color=null;a.renderTargetIds.highlight=null;a.renderTargetIds.water=null;a.renderTargetIds.occluded=null};b.prototype._createEmptyOverlay=function(a){return{extent:e.create(),resolution:0,renderTargets:{color:{id:this.renderer.createRenderTarget("overlay"+a,!0),valid:!1,lastUsed:Infinity},colorWithoutRasterImage:{id:this.renderer.createRenderTarget("overlayWithoutRasterImage"+a,!0),valid:!1,lastUsed:Infinity},
highlight:{id:this.renderer.createRenderTarget("overlayHighlight"+a,!1),valid:!1,lastUsed:Infinity},water:{id:this.renderer.createRenderTarget("overlayWaterMask"+a,!0),valid:!1,lastUsed:Infinity},occluded:{id:this.renderer.createRenderTarget("overlayOccluded"+a,!0),valid:!1,lastUsed:Infinity}},renderLocalOrigin:H.fromValues(0,0,0,"O"),pixelRatio:1}};b.prototype._initOverlays=function(){this._overlays||(this._overlays=[this._createEmptyOverlay(0),this._createEmptyOverlay(1)])};b.prototype._disposeOverlays=
function(){var a=this;this._overlays&&(this._overlays.forEach(function(c){a.renderer.disposeRenderTarget(c.renderTargets.color.id);a.renderer.disposeRenderTarget(c.renderTargets.colorWithoutRasterImage.id);a.renderer.disposeRenderTarget(c.renderTargets.highlight.id);a.renderer.disposeRenderTarget(c.renderTargets.water.id);a.renderer.disposeRenderTarget(c.renderTargets.occluded.id)}),this._overlays=null)};b.prototype.hotReloadShaders=function(){return h.__awaiter(this,void 0,void 0,function(){return h.__generator(this,
function(a){switch(a.label){case 0:return aa.removeLoadedShaderModules(),[4,this.renderer.hotReloadShaders()];case 1:return a.sent(),this.updateOverlays(),this.needsUpdate(),[2]}})})};b.prototype.stopAnimationsAtTime=function(a){this.renderer.stopAnimationsAtTime(a);this._forceAnimation=!0};b.prototype._dispatchRendererUpdate=function(a){var c=S.Milliseconds(a.time-this._animationTimeLast);c<V.DESIRED_DRAPED_ANIMATION_MS&&!this._forceAnimation||(this._animationTimeLast=a.time,this.renderer.updateLogic({dt:c,
camera:this._stage.getCamera()})&&(this._drawTexturesAnimateDirty=!0))};b.prototype.setDrawTexturesDirty=function(){this._overlays?this._drawTexturesDirty=!0:this.setOverlayPlacementDirty()};b.prototype._intersectGroundFromView=function(a,c,d,b){d=this.view.sceneIntersectionHelper.getCenterRayWithSubpixelOffset(a,ea,c,d);c=d.origin;d=t.vec3.add(C,d.origin,d.direction);this.groundIntersector.reset(c,d);this.groundIntersector.intersect([],null,a);this.view.basemapTerrain.intersect(this.groundIntersector,
null,c,d);return this.groundIntersector.results.min.getIntersectionPoint(b)};b.prototype._findHorizonBasedPointOfInterest=function(a,c,d){var b=.5;if("global"===this.view.viewingMode){b=y.vec3f64.clone(a.eye);t.vec3.normalize(b,b);t.vec3.negate(b,b);c=t.vec3.length(c);c=Math.asin(c/t.vec3.length(a.eye));var e=Math.acos(t.vec3.dot(a.viewForward,b)),b=v.clamp((c-(e-.5*a.fovY))/a.fovY,0,1);c=v.clamp((-c-(e-.5*a.fovY))/a.fovY,0,1);b=1===b&&0===c?.5:c+.55*(b-c)}else b=F.vec4f64.fromValues(0,Math.tan(.5*
Math.PI-Math.acos(-a.viewForward[2])),1,0),b=u.vec4.transformMat4(b,b,a.projectionMatrix)[1],b=v.clamp(.5+.5*b,0,1),b=1===b||0===b?.5:0<a.eye[2]?.55*b:1-.55*(1-b);return this._intersectGroundFromView(a,.5,b,d)?!0:!1};b.prototype._computeOverlayExtents=function(a,c,b){var d=this.terrainSurface.extent,m=this.view.pointsOfInterest.centerOnSurfaceFrequent.renderLocation,f=y.vec3f64.create();this._findHorizonBasedPointOfInterest(a,m,f)||t.vec3.copy(f,m);this._renderedAltitude=this.view.renderCoordsHelper.getAltitude(a.eye);
var k=t.vec3.distance(a.eye,f),m=U.viewAngle(this.view.renderCoordsHelper,m,a.eye),m=Math.PI/2-Math.abs(m-Math.PI/2);if(z.OVERLAY_SHOW_CENTER){var n=new T({color:[255,0,0],outline:{color:[255,255,255],width:2}}),h=new R;x.vectorToPoint(f,this._renderSR,h,this._overlaySR);n=new K({geometry:h,symbol:n});void 0!==B&&this.view.graphics.remove(B);this.view.graphics.add(n);B=n}this._overlaySREqualsRenderSR||x.vectorToVector(f,this._renderSR,f,this._overlaySR);var k=c*a.perRenderPixelRatio*k/2,p=!1,n=Infinity;
this._isSpherical&&(this._overlaySR.isWebMercator?(k/=Math.cos(x.webMercator.y2lat(f[1])),n=this.terrainSurface.extent[3]):(p=!0,k/=W.metersPerDegree,n=90),k>=n&&(k=n,f[1]=0,this._overlaySR.isWebMercator&&(f[0]=0)));h=1;p&&(h=1/Math.max(.2,Math.cos(Math.abs(O.deg2rad(f[1])))),180<k*h&&(h=180/k));var p=Math.log(2)/12,k=Math.exp(Math.round(Math.log(k)/p)*p),p=k*h,l=.5*c/(32*p);c=.5*c/(32*k);f[0]=Math.round(f[0]*l)/l;f[1]=Math.round(f[1]*c)/c;c=b.inner;c[0]=f[0]-p;c[1]=f[1]-k;c[2]=f[0]+p;c[3]=f[1]+k;
this._isSpherical&&this._shiftExtentToFitBounds(c,Infinity,n);b=b.outer;e.set(b,c);6*p>d[2]-d[0]?e.set(b,d):m<=.25*Math.PI?(b[0]-=p,b[1]-=k,b[2]+=p,b[3]+=k):(x.vectorToVector(a.eye,this._renderSR,C,this._overlaySR),Q.vec2.subtract(q,f,C),a=-Math.atan2(q[1],q[0])+.125*Math.PI,0>a&&(a+=2*Math.PI),u.vec4.scale(q,da[Math.floor(a/(.25*Math.PI))],2*k),q[0]*=h,q[2]*=h,u.vec4.add(b,b,q));this._isSpherical&&(b[0]=this._longitudeCyclical.clamp(b[0]),b[2]=this._longitudeCyclical.clamp(b[2]),b[1]=Math.max(b[1],
-n),b[3]=Math.min(b[3],n));!this._isSpherical&&d&&(a=e.intersection(c,d,J),d=e.intersection(b,d,fa),e.contains(a,d)&&(b[2]=b[0],b[3]=b[1]))};b.prototype._drawOverlayTextures=function(){var a=this;if(this._drawTexturesDirty||this._drawTexturesAnimateDirty){var c=this._drawOverlay(0),b=this._drawOverlay(1);0!==c&&0!==b||this.terrainSurface.updateTileOverlayParams();this._collectUnusedRenderTargetMemory();this._drapeTargets.forEach(function(c){return a._updateDrapeTarget(c)});this._drawTexturesDirty?
(this._drawTexturesAnimateDirty=this._drawTexturesDirty=!1,this.terrainSurface.requestRender(),this.terrainSurface.setPendingUpdates()):(this._drawTexturesAnimateDirty=!1,this.terrainSurface.requestRender(0))}};b.prototype._setupGeometryViewsCyclical=function(a,c,b){this._setupGeometryViewsDirect(a,c,b);var d=.001*this._longitudeCyclical.range;if(c[0]-d<=this._longitudeCyclical.min){var m=a.views[a.numViews++];u.vec4.set(m.viewport,0,0,b,b);e.offset(c,this._longitudeCyclical.range,0,m.extent)}c[2]+
d>=this._longitudeCyclical.max&&(m=a.views[a.numViews++],u.vec4.set(m.viewport,0,0,b,b),e.offset(c,-this._longitudeCyclical.range,0,m.extent))};b.prototype._setupGeometryViewsDirect=function(a,c,b){a.numViews=1;a=a.views[0];e.set(a.extent,c);u.vec4.set(a.viewport,0,0,b,b)};b.prototype._drawOverlay=function(a){var c=this._overlays[a],b=I(c),g=c.extent,e=c.resolution,f=c.pixelRatio;this._longitudeCyclical?this._setupGeometryViewsCyclical(l,g,e):this._setupGeometryViewsDirect(l,g,e);l.width=e;l.height=
e;l.pixelRatio=f*this.view.state.camera.pixelRatio;l.index=a;a=this.renderer;g=c.renderTargets;g.color.valid=a.draw(g.color.id,l);g.highlight.valid=a.drawHighlights(g.highlight.id,l);g.water.valid=a.drawNormals(g.water.id,l);g.occluded.valid=a.drawOccluded(g.occluded.id,l);g.colorWithoutRasterImage.valid=this.needsColorWithoutRasterImage()&&a.drawWithoutRasterImage(g.colorWithoutRasterImage.id,l);c=I(c);return b^c?0:1};b.prototype.needsColorWithoutRasterImage=function(){return 0<this._drapeSourceTypes[0]&&
0<this._drapeSourceTypes[1]&&0<this._drapeTargetTypes[1]};b.prototype.hasDrapedFeatures=function(){return 0<this._drapeSourceTypes[1]};b.prototype._collectUnusedRenderTargetMemory=function(){var a=performance.now();this._hasUnusedRenderTargets=!1;for(var b=0,d=this._overlays;b<d.length;b++){var e=d[b],h;for(h in e.renderTargets){var f=e.renderTargets[h];f.valid?f.lastUsedTimestamp=a:a-f.lastUsedTimestamp>ga?(this.renderer.disposeRenderTargetMemory(f.id),f.lastUsedTimestamp=Infinity):Infinity>f.lastUsedTimestamp&&
(this._hasUnusedRenderTargets=!0)}}};b.prototype._rectanglesOverlap=function(a,b){return this._longitudeCyclical?(this._longitudeCyclical.contains(b[0],b[2],a[0])||this._longitudeCyclical.contains(b[0],b[2],a[2])||this._longitudeCyclical.contains(a[0],a[2],b[0]))&&!(a[1]>b[3]||a[3]<b[1]):e.intersects(a,b)};b.prototype._rectInsideRect=function(a,b){return this._longitudeCyclical?this._longitudeCyclical.contains(b[0],b[2],a[0])&&this._longitudeCyclical.contains(b[0],b[2],a[2])&&a[1]>b[1]&&a[3]<b[3]:
e.contains(b,a)};b.prototype._pointIsInExtent=function(a,b){if(this._longitudeCyclical)return this._longitudeCyclical.contains(b[0],b[2],a.x)&&a.y>=b[1]&&a.y<=b[3];var c=a.x;a=a.y;return c>b[0]&&c<b[2]&&a>b[1]&&a<b[3]};b.prototype._shiftExtentToFitBounds=function(a,b,d){var c=0,h=0;a[0]<-b?c=a[0]+b:a[2]>b&&(c=b-a[2]);a[1]<-d?h=a[1]+d:a[3]>d&&(h=d-a[3]);e.offset(a,c,h)};Object.defineProperty(b.prototype,"test",{get:function(){return{overlays:this._overlays,renderer:this.renderer}},enumerable:!0,configurable:!0});
h.__decorate([r.property()],b.prototype,"renderer",void 0);h.__decorate([r.property()],b.prototype,"view",void 0);h.__decorate([r.property()],b.prototype,"terrainSurface",void 0);h.__decorate([r.property({readOnly:!0,aliasOf:"terrainSurface.suspended"})],b.prototype,"suspended",void 0);h.__decorate([r.property({readOnly:!0,dependsOn:["terrainSurface.ready","suspended","renderer.updating"]})],b.prototype,"updating",null);h.__decorate([r.property({type:Boolean})],b.prototype,"hasHighlights",null);h.__decorate([r.property({type:Boolean})],
b.prototype,"rendersOccluded",null);return b=h.__decorate([r.subclass("esri.views.3d.terrain.OverlayManager")],b)}(L);E.OverlayManager=D;var ga=1E3,l={width:0,height:0,pixelRatio:0,views:[{viewport:e.create(),extent:e.create()},{viewport:e.create(),extent:e.create()},{viewport:e.create(),extent:e.create()}],numViews:0,index:0},q=F.vec4f64.create(),C=y.vec3f64.create(),w={inner:e.create(),outer:e.create()},J=e.create(),fa=e.create(),ea=X.ray.create()});