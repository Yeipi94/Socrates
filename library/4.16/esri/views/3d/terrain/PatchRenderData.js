// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports ../../../core/arrayUtils ../../../core/mathUtils ../../../core/maybe ../../../core/libs/gl-matrix-2/vec2 ../../../core/libs/gl-matrix-2/vec2f64 ../../../core/libs/gl-matrix-2/vec4f64 ../../../geometry/support/aaBoundingBox ../support/buffer/glUtil ./PatchGeometryFactory ./TerrainConst ./TextureFader ./tileUtils ../webgl-engine/lib/DefaultVertexAttributeLocations ../../webgl/BufferObject ../../webgl/VertexArrayObject".split(" "),function(n,p,u,v,m,q,w,x,r,y,z,A,B,C,D,t,E){Object.defineProperty(p,
"__esModule",{value:!0});n=function(){function b(){var a=this;this.overlayTexOffset=w.vec2f64.create();this.geometryInfo={indices:null,vertexAttributes:null,boundingBox:r.empty(),numSurfaceIndices:0,numSkirtIndices:0,numWithoutSkirtIndices:0,numVertsPerRow:0,skirtLength:0,uvOffsetAndScale:x.vec4f64.create()};this._textureRef=new B.default(function(){return a.tile.surface.textureFadeDuration})}b.prototype.init=function(a){this.tile=a;this.clear();a=this.geometryInfo;a.indices=null;a.vertexAttributes=
null;r.empty(a.boundingBox);a.numSurfaceIndices=0;a.numSkirtIndices=0;a.numWithoutSkirtIndices=0;a.numVertsPerRow=0;this.geometryState={numVertsPerRow:0,samplerData:null,clippingArea:null,wireframe:!1};this.opacity=1;if(this.overlays){a=0;for(var b=this.overlays;a<b.length;a++){var c=b[a];c.renderTargetIds.color=null;c.renderTargetIds.highlight=null;c.renderTargetIds.water=null;c.renderTargetIds.occluded=null;q.vec2.set(c.texScale,1,1);q.vec2.set(c.texOffset,0,0)}}else for(this.overlays=[null,null],
a=0;2>a;a++)this.overlays[a]={renderTargetIds:{color:null,highlight:null,water:null,occluded:null},texScale:[1,1],texOffset:[0,0]};this.overlayOpacity=1;this.localOrigin=null};b.prototype.clear=function(){this.releaseGeometry();this.releaseTexture();this._textureRef.clear()};b.prototype.updateGeometry=function(a,b){if(!this._updateGeometryState(b))return!1;this._releaseGeometry();this._createGeometry(a);return!0};b.prototype.releaseGeometry=function(){return this._releaseGeometry()?(this.geometryState=
{numVertsPerRow:0,samplerData:null,clippingArea:null,wireframe:!1},!0):!1};b.prototype.ensureTexture=function(a,b){m.isSome(this._texture)&&this._texture.descriptor.width!==a&&this.releaseTexture();this._texture||(this._texture=b(),this.tile.setMemoryDirty());return this._texture};b.prototype.releaseTexture=function(){m.isSome(this._texture)&&(this._texture.release(),this._texture=null,this.tile.setMemoryDirty())};b.prototype._updateGeometryState=function(a){var b=this._getElevationInfo(),c=this.tile.level,
e=8>c?this.tile.numSubdivisionsAtLevel[c]+1:2;b.samplerData&&(e=this.tile.maxTesselation,e=v.clamp((e>>Math.max(c-b.maxTileLevel,A.ELEVATION_DESIRED_RESOLUTION_LEVEL-(this.tile.vlevel-c)))+1,2,e+1));c=this.tile.clippingArea;if(!this.tile.intersectsClippingArea||this.tile.isWithinClippingArea)c=null;var d=this.geometryState,f=!1;d.numVertsPerRow!==e&&(d.numVertsPerRow=e,f=!0);b.changed&&(d.samplerData=b.samplerData,f=!0);u.equals(d.clippingArea,c)||(d.clippingArea=c,f=!0);d.wireframe!==a&&(d.wireframe=
a,f=!0);return f};b.prototype._createGeometry=function(a){this.tile.createGeometry(this.geometryState,this.localOrigin);var b=this.geometryInfo.vertexAttributes,c=this.geometryInfo.indices,e=a.gl;this._vao=new E(a,D.Default3D,{geometry:y.glLayout(b.layout)},{geometry:t.createVertex(a,e.STATIC_DRAW,b.buffer)},t.createIndex(a,e.STATIC_DRAW,c))};b.prototype._releaseGeometry=function(){if(!this._vao)return!1;this._vao.dispose();this._vao=null;z.releaseGeometry(this.geometryInfo);return!0};Object.defineProperty(b.prototype,
"vao",{get:function(){return this._vao},enumerable:!0,configurable:!0});b.prototype.setTextureReference=function(a,b,c,e,d){void 0===d&&(d=0);a!==this._texture&&this.releaseTexture();this._textureRef.push(a,b,c,e,d)};Object.defineProperty(b.prototype,"textureReference",{get:function(){return this._textureRef.current},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,"nextTextureReference",{get:function(){return this._textureRef.next},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,
"textureFadeFactor",{get:function(){return this._textureRef.fadeFactor},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,"textureIsFading",{get:function(){return this._textureRef.isFading},enumerable:!0,configurable:!0});b.prototype._getElevationInfo=function(){for(var a=this.geometryState.samplerData,b=this.tile.layerInfo[0],c=b.length,e=Array(c),d=0,f=0,l=!1,k=0;k<c;k++){var h=b[k];if(h.upsampleInfo){var h=h.upsampleInfo.tile,g=h.layerInfo[0][k].data,g=g&&g.samplerData;a&&a[d]===
g||(l=!0);e[d++]=g;f=Math.max(f,h.lij[0])}else h.data&&(g=this.tile.surface.layerViewByIndex(k,0),C.fallsWithinLayer(this.tile,g.layer,!1)&&(g=h.data,a&&a[d]===g.samplerData||(l=!0),e[d++]=g.samplerData,f=this.tile.lij[0]))}a&&a.length!==d&&(l=!0);0<d?e.length=d:e=null;return{changed:l,samplerData:e,maxTileLevel:f}};Object.defineProperty(b.prototype,"estimatedGeometryMemoryUsage",{get:function(){return this.geometryInfo.indices.byteLength+this.geometryInfo.vertexAttributes.byteLength},enumerable:!0,
configurable:!0});Object.defineProperty(b.prototype,"textureDescriptor",{get:function(){return m.isSome(this._texture)?this._texture.descriptor:null},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,"test",{get:function(){return{hasTexture:null!=this._texture}},enumerable:!0,configurable:!0});return b}();p.PatchRenderData=n});