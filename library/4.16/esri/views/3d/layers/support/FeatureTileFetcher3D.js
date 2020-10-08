// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports tslib ../../../../core/Accessor ../../../../core/arrayUtils ../../../../core/Handles ../../../../core/Logger ../../../../core/maybe ../../../../core/promiseUtils ../../../../core/scheduling ../../../../core/SetUtils ../../../../core/watchUtils ../../../../core/accessorSupport/decorators ../../../../geometry/support/aaBoundingRect ../../../../layers/graphics/dehydratedFeatures ../../../../tasks/support/QuantizationParameters ../../../../tasks/support/Query ./featureReference ./FeatureTile ../../terrain/tileUtils ../../../support/Scheduler".split(" "),
function(x,t,d,K,L,M,N,h,n,O,A,P,k,w,r,Q,B,C,D,R,S){function y(d){return"dummy-tile-full-extent"===d.id}function T(d){for(var b=0,a=0;a<d.length;a++){var c=d[a];c.features&&0<c.features.length&&c.alive&&(b=Math.max(b,c.descriptor.lij[0]))}return b}function E(d){return h.isNone(d)?new Set:A.SetFromValues(d.map(function(b){return b.name}))}function F(d,b){if(h.isNone(d)||h.isNone(b))return E(b);for(var a=new Set,c=0;c<b.length;c++){var l=b[c].name;d.has(l)&&a.add(l)}return a}Object.defineProperty(t,
"__esModule",{value:!0});var G=N.getLogger("esri.views.3d.layers.support.FeatureTileFetcher3D");x=function(q){function b(a){a=q.call(this,a)||this;a._useTileCount=!1;a.updating=!1;a.updatingTotal=0;a.updatingRemaining=0;a.expectedFeatureDiff=0;a.maximumNumberOfFeaturesExceeded=!1;a.maximumNumberOfFeaturesExceededThrottle=1E3;a.maximumNumberOfFeaturesExceededNext=0;a._fullRatio=1;a._farRatio=1;a.changes={updates:{adds:[],removes:[]},adds:[],removes:[]};a.handles=new M;a._dirty=!1;a.featureTiles=new Map;
a.displayingFeatureReferences=new Map;a.numDisplayingFeatureReferences=0;a.suspended=!0;a.pendingEdits=null;return a}d.__extends(b,q);Object.defineProperty(b.prototype,"maximumNumberOfFeatures",{set:function(a){a=a||Infinity;var c=this._get("maximumNumberOfFeatures");a===c||1>a||(this._set("maximumNumberOfFeatures",a),this.maximumFeaturesUpdated(c,a))},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,"memoryFactor",{set:function(a){this.memoryFactor!==a&&(this._set("memoryFactor",
a),this.setDirty())},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,"lodFactor",{set:function(a){this.lodFactor!==a&&(this._set("lodFactor",a),this.supportsResolution&&this.refetch())},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,"useTileCount",{get:function(){return this._useTileCount&&h.isSome(this.context.query.queryFeatureCount)},set:function(a){this._useTileCount=a;this.notifyChange("useTileCount")},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,
"memoryForUnusedFeatures",{get:function(){var a=0;this.featureTiles.forEach(function(c){return a+=c.estimatedUnusedSize});return a},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,"totalVertices",{get:function(){var a=0;this.featureTiles.forEach(function(c){return a+=c.numVertices});return a},enumerable:!0,configurable:!0});Object.defineProperty(b.prototype,"totalFeatures",{get:function(){var a=0;this.featureTiles.forEach(function(c){return a+=c.numFeatures});return a},enumerable:!0,
configurable:!0});Object.defineProperty(b.prototype,"filterExtent",{set:function(a){if(a&&this.context.tilingScheme&&!a.spatialReference.equals(this.context.tilingScheme.spatialReference))G.error("#filterExtent\x3d","extent needs to be in the same spatial reference as the tiling scheme");else{var c=this._get("filterExtent");c===a||c&&a&&c.equals(a)||(a=a?a.clone():null,this._set("filterExtent",a),this.reclip(a,c))}},enumerable:!0,configurable:!0});b.prototype.initialize=function(){var a=this;this.handles.add(P.on(this,
"tileDescriptors","change",function(){return a.setDirty()},function(){return a.setDirty()}));this.objectIdField=this.context.objectIdField;this.FeatureReferenceClass=this.context.capabilities.supportsMultipleResolutions?C.MultiFeatureReference:C.SingleFeatureReference;var c=this.context.scheduler;h.isSome(c)&&this.handles.add(c.registerTask(S.Task.FEATURE_TILE_FETCHER,function(c){return a.update(c)},function(){return a._dirty||0<a.maximumNumberOfFeaturesExceededNext}));this.setDirty()};b.prototype.destroy=
function(){var a=this;this.handles&&(this.handles.destroy(),this.handles=null);this.featureTiles.forEach(function(c){a.cancelFetchTile(c);a.removeTile(c)});this.featureTiles.clear();this.displayingFeatureReferences.clear();this.pendingEdits&&(this.pendingEdits.controller.abort(),this.pendingEdits=null)};Object.defineProperty(b.prototype,"paused",{get:function(){return this.suspended||!!this.pendingEdits},enumerable:!0,configurable:!0});b.prototype.restart=function(){var a=this;this.featureTiles.forEach(function(c){a.cancelFetchTile(c);
a.clearTile(c);a.resetFetchTile(c)});h.isSome(this.context.memoryCache)&&this.context.memoryCache.clear();this.setDirty()};b.prototype.refetch=function(){var a=this;this.featureTiles.forEach(function(c){a.cancelFetchTile(c);a.resetFetchTile(c)});h.isSome(this.context.memoryCache)&&this.context.memoryCache.clear();this.setDirty()};b.prototype.suspend=function(){this.suspended||(this.suspended=!0,this.pause(),this.setDirty())};b.prototype.resume=function(){this.suspended&&(this.suspended=!1,this.unpause())};
b.prototype.pause=function(){var a=this;this.paused&&(this.featureTiles.forEach(function(c){return a.cancelFetchTile(c)}),this.updated())};b.prototype.unpause=function(){this.paused||(this.setDirty(),this.updated())};Object.defineProperty(b.prototype,"availableFields",{get:function(){var a=null;this.featureTiles.forEach(function(c){c.displayingFeatures&&0!==c.displayingFeatures.length&&(h.isNone(a)?a=A.SetFromValues(L.keysOfSet(c.availableFields)):a.forEach(function(b){c.availableFields.has(b)||h.unwrap(a).delete(b)}))});
return h.isSome(a)?a:new Set},enumerable:!0,configurable:!0});b.prototype.applyEdits=function(a){var c=this;this.pendingEdits||(this.pendingEdits={edits:n.resolve(),count:0,controller:n.createAbortController()},this.pause());this.pendingEdits.count++;var b=this.pendingEdits.edits.then(function(){return a.result.catch(function(a){if(n.isAbortError(a))throw a;return null}).then(function(a){return a?(c.applyEditsDeleteFeatures(a.deletedFeatures),c.applyEditsAddUpdateFeatures(a.addedFeatures,a.updatedFeatures,
c.pendingEdits.controller.signal).then(function(){return a})):a}).then(function(a){0===--c.pendingEdits.count&&(c.pendingEdits=null,h.isSome(c.context.memoryCache)&&c.context.memoryCache.clear(),c.unpause(),c.updated());return a})});this.pendingEdits.edits=b;this.updated();return b};b.prototype.applyEditsDeleteFeatures=function(a){var c=this;if(0!==a.length){var b=new Set;a.forEach(function(a){return b.add(a.objectId)});this.featureTiles.forEach(function(a){if(a.features){var l=a.features.filter(function(a){return!b.has(r.getObjectId(a,
c.objectIdField))});l.length!==a.features.length&&(a.setFeatures(l,0,a.availableFields),c.invalidateCounts())}})}};b.prototype.applyEditsAddUpdateFeatures=function(a,c,b){return d.__awaiter(this,void 0,void 0,function(){var l,m,g,f=this;return d.__generator(this,function(e){switch(e.label){case 0:l=[];m=new Set;a.forEach(function(a){return l.push(a.objectId)});c.forEach(function(a){l.push(a.objectId);m.add(a.objectId)});if(0===l.length)return[2];g=[];this.featureTiles.forEach(function(a){(a=f.applyEditsAddUpdateTile(a,
l,m,b))&&g.push(a)});return[4,n.eachAlways(g)];case 1:return e.sent(),[2]}})})};b.prototype.applyEditsAddUpdateTile=function(a,c,b,e){return d.__awaiter(this,void 0,void 0,function(){var l,g,f,p,u,z,H,k=this;return d.__generator(this,function(m){switch(m.label){case 0:if(!a.features)return[2];l=this.createQuery(a);l.resultType=void 0;l.cacheHint=!1;l.objectIds=c;return[4,this.queryFeatures(l,e)];case 1:g=m.sent();f=null;0<b.size&&(p=a.features.filter(function(a){return!b.has(r.getObjectId(a,k.objectIdField))}),
p.length!==a.features.length&&(f=p));if(0<g.features.length)for(f||(f=a.features.slice()),u=0,z=g.features;u<z.length;u++)H=z[u],f.push(H);f&&(a.setFeatures(f,0,F(a.availableFields,g.fields)),this.invalidateCounts());return[2]}})})};b.prototype.queryFeatures=function(a,c){return this.context.query.queryFeaturesDehydrated(a,{signal:c,timeout:U})};b.prototype.setDirty=function(){this._dirty=!0;this.updated()};b.prototype.update=function(a){var c=this;this.maximumNumberOfFeaturesExceededNext&&performance.now()>=
this.maximumNumberOfFeaturesExceededNext&&this.updateMaximumNumberOfFeaturesExceeded();if(this._dirty&&this.constructed){this._dirty=!1;var b=this.getListOfTiles();this.markTilesNotAlive(b);if(a.run(function(){return c.addTiles(b,a)})&&a.run(function(){return c.filterExtentTiles(b,a)})&&a.run(function(){return c.removeTiles(b,a)})&&!a.done){var e=this.sortTiles(b);a.run(function(){return c.displayTiles(e,a)})&&a.run(function(){return c.fetchTiles(e,a)})&&a.run(function(){return c.updateMemoryEstimates(e,
a)})||this.setDirty();this.updated()}else this.setDirty()}};b.prototype.markTilesNotAlive=function(a){for(var c=0;c<a.length;c++)a[c].alive=!1};b.prototype.addTiles=function(a,c){var b=this;if(this.suspended)return!1;this.tileDescriptors.forEach(function(l){var e=b.featureTiles.get(l.id);e?e.alive=!0:c.done||(a.push(b.addTile(l)),c.madeProgress())});return c.hasProgressed};b.prototype.filterExtentTiles=function(a,c){for(var b=0;b<a.length;b++){var e=a[b];if(c.done)break;e.alive&&(e.filtered=!e.intersects(this.filterExtent),
e.filtered&&(this.clearTile(e),c.madeProgress()))}return c.hasProgressed};b.prototype.removeTiles=function(a,c){for(var b=a.length-1;0<=b&&!c.done;b--){var e=a[b];e.alive||(this.removeTile(e),b!==a.length-1&&(a[b]=a[a.length-1]),a.pop(),c.madeProgress())}return c.hasProgressed};b.prototype.sortTiles=function(a){a.sort(function(a,b){return a.descriptor.loadPriority-b.descriptor.loadPriority});return a};b.prototype.displayTiles=function(a,c){for(var b=this,e=this.updateRatio(a),m=function(a){if(!c.run(function(){var c=
1>b._fullRatio?e(a)*b._farRatio:1;a.reduceFeatures(c,b.memoryFactor,b.objectIdField)&&b.setDirty();return b.showTile(a)}))return g.setDirty(),"break"},g=this,f=0;f<a.length&&"break"!==m(a[f]);f++);return c.hasProgressed};b.prototype.fetchTiles=function(a,c){var b=this;if(this.paused)return!1;for(var e=!1,m=function(a){if(!a.needsFetching)return"continue";var b=h.isSome(g.context.memoryCache)?g.context.memoryCache.pop(a.id):null;if(h.isSome(b))return a.cache=b,g.setDirty(),g.scheduleUpdated(),c.madeProgress(),
"continue";if(g.needsNumFeatures(a)){var b=n.createAbortController(),l=g.fetchTileCount(a,b.signal);g._handleRequest(a,l,b,function(){return a.numFeatures=D.FAILED_FEATURE_COUNT});e=!0;c.madeProgress()}if(c.done)return{value:!0}},g=this,f=0;f<a.length;f++){var d=a[f],d=m(d);if("object"===typeof d)return d.value}if(e)return c.hasProgressed;for(var m=function(a){if(a.needsFetching){var e=n.createAbortController(),l=u.fetchTile(a,e.signal);u._handleRequest(a,l,e,function(c){a.setFeatures([],0,null);
b.invalidateCounts();a.featuresMissing=!1;b.context.logFetchError(G,c)});c.madeProgress();if(c.done)return{value:!0}}},u=this,f=0;f<a.length;f++)if(d=a[f],d=m(d),"object"===typeof d)return d.value;return c.hasProgressed};b.prototype.updateMemoryEstimates=function(a,c){var b=this;a.some(function(a){return c.run(function(){return a.updateMemoryEstimates()})?!1:(b.setDirty(),!0)});return c.hasProgressed};b.prototype.reclip=function(a,c){var b=this;this.constructed&&(this.featureTiles.forEach(function(e){e.displayingFeatures&&
0!==e.displayingFeatures.length&&(e.intersection(c,I),e.intersection(a,J),w.equals(I,J)||b.hideTileFeatures(e))}),this.featureTiles.forEach(function(a){return b.showTile(a)}),this.updated())};b.prototype.updated=function(){var a=this,c=0;this.paused||this.featureTiles.forEach(function(a){return a.isFetching?++c:0});var b=this._dirty||0<c||!!this.pendingEdits;this._set("updating",b);if(b){var e=b=0,d=0,g=0,f=0,p=0,u=this.displayingFeatureReferences.size/this.numDisplayingFeatureReferences;this.featureTiles.forEach(function(c){++d;
if(c.isFetching&&c.hasPreciseFeatureCount){var b=a.maximumFeaturesForTile(c)*(1-c.emptyFeatureRatio);p+=b-(c.displayingFeatures?c.displayingFeatures.length*u:0)}c.needsFetching?++f:0<c.numFeatures&&(++g,e+=c.numFeatures)});var f=f+c,k=0;e?(b=e,k=Math.min(f*e/g,e)):(b=d,k=f);p=Math.min(this.maximumNumberOfFeatures-this.features.length,p);this._set("updatingTotal",b);this._set("updatingRemaining",k);this._set("expectedFeatureDiff",p)}else this._set("updatingTotal",0),this._set("updatingRemaining",0),
this._set("expectedFeatureDiff",0);this.debugger&&this.debugger.update();this.updating||(this.maximumNumberOfFeaturesExceededNext=this.maximumNumberOfFeaturesExceededNext||performance.now()+this.maximumNumberOfFeaturesExceededThrottle)};b.prototype.updateMaximumNumberOfFeaturesExceeded=function(){if(!this.updating){var a=!1;this.featureTiles.forEach(function(c){a=a||c.perTileMaximumNumberOfFeaturesExceeded});this.maximumNumberOfFeaturesExceededNext=0;this._set("maximumNumberOfFeaturesExceeded",a)}};
b.prototype.updateRatio=function(a){for(var c=T(a),b=function(a){return 1/(1<<Math.max(0,c-a.descriptor.lij[0]))},e=0,d=0,g=0;g<a.length;g++)var f=a[g],p=f.numFeatures,e=e+p,d=d+p*b(f);this._fullRatio=Math.min(1,this.maximumNumberOfFeatures/e);this._farRatio=this.maximumNumberOfFeatures/d;this.scheduleUpdated();return b};b.prototype.maximumFeaturesUpdated=function(a,c){var b=this;a!==c&&(c>a&&this.featureTiles.forEach(function(a){if(a.featuresMissing){var c=b.maximumFeaturesForTile(a);a.features&&
(a.features.length>=c||5===a.fetchStatus)||(b.cancelFetchTile(a),b.resetFetchTile(a))}}),this.setDirty())};b.prototype.addTile=function(a){a=new D.FeatureTile(a);this.featureTiles.set(a.id,a);this.resetFetchTile(a);this.referenceDisplayingFeaturesFromRelatedTiles(a);return a};b.prototype.referenceDisplayingFeaturesFromRelatedTiles=function(a){var c=this,b=a.descriptor.resolution;this.featureTiles.forEach(function(e){if(e.displayingFeatures&&a!==e&&(!a.descriptor.lij||!e.descriptor.lij||R.tilesAreRelated(a.descriptor.lij,
e.descriptor.lij))){a.displayingFeatures=a.displayingFeatures||[];var l=0;for(e=e.displayingFeatures;l<e.length;l++){var d=e[l];a.displayingFeatures.push(d);d=c.displayingFeatureReferences.get(r.getObjectId(d,c.objectIdField));d.ref(d.feature,b);c.numDisplayingFeatureReferences++}}});a.featureLimit=a.displayingFeatures?a.displayingFeatures.length:0};b.prototype.removeTile=function(a){this.clearTile(a);this.featureTiles.delete(a.id)};b.prototype.resetFetchTile=function(a){a.filtered=!a.intersects(this.filterExtent);
a.filtered?a.needsFetching&&(a.fetchStatus=4):a.fetchStatus=0};b.prototype.cancelFetchTile=function(a){var c=a.requestController;h.isSome(c)&&(a.requestController=null,a.resetFetching(),c.abort())};b.prototype.fetchTileCount=function(a,c){return d.__awaiter(this,void 0,void 0,function(){var b;return d.__generator(this,function(e){switch(e.label){case 0:return b=a,[4,this.fetchCount(a,c)];case 1:return b.numFeatures=e.sent(),this.updateRatio(this.getListOfTiles()),[2,3===a.fetchStatus?1:0]}})})};b.prototype.fetchTile=
function(a,c){return d.__awaiter(this,void 0,void 0,function(){var b,e,m,g,f,p,k,h,q,n,v;return d.__generator(this,function(d){switch(d.label){case 0:b=this.maximumFeaturesForTile(a);if(0>=b)return a.setFeatures([],0,null),a.featuresMissing=!1,[2,4];e=this.getMaxRecordCount(a);m=Math.ceil(b/e);if(y(a)||!this.context.capabilities.supportsMaxRecordCountFactor||a.numFeatures<=b&&m>B.MAX_MAX_RECORD_COUNT_FACTOR)return[2,this.fetchPagedTile(a,c)];g=this.createQuery(a);g.maxRecordCountFactor=Math.ceil(b/
e);a.isRefetching&&a.features&&0<a.features.length&&(f=Math.ceil(a.features.length/(1-a.emptyFeatureRatio)/e),g.maxRecordCountFactor=Math.max(f+1,g.maxRecordCountFactor));return[4,this.queryFeatures(g,c)];case 1:return p=d.sent(),k=p.features,h=p.exceededTransferLimit,q=p.fields,n=h?g.maxRecordCountFactor>=B.MAX_MAX_RECORD_COUNT_FACTOR?5:4:5,a.featuresMissing=k.length<a.numFeatures||h,v=this._removeEmptyFeatures(k),a.setFeatures(k,v,E(q)),this.invalidateCounts(),[2,n]}})})};b.prototype.fetchCount=
function(a,c){return d.__awaiter(this,void 0,void 0,function(){return d.__generator(this,function(b){return[2,this.context.query.queryFeatureCount(this.createFeatureCountQuery(a),{signal:c})]})})};b.prototype.fetchPagedTile=function(a,c){return d.__awaiter(this,void 0,void 0,function(){var b,e,m,g,f,k,h,q,n,r,v,t,w;return d.__generator(this,function(d){switch(d.label){case 0:g=e=b=0,f=this.maximumFeaturesForTile(a)-g,k=this.getMaxRecordCount(a),h=null,d.label=1;case 1:return q=this.createQuery(a),
n=this.setPagingParameters(q,b,f,k),[4,this.queryFeatures(q,c)];case 2:return r=d.sent(),v=r.features,t=r.exceededTransferLimit,w=r.fields,n&&(b+=q.num),g+=v.length,e+=this._removeEmptyFeatures(v),a.featuresMissing=b<a.numFeatures||t,m=m?m.concat(v):v,h=F(h,w),a.setFeatures(m,e,h),this.invalidateCounts(),this.setDirty(),f=this.maximumFeaturesForTile(a)-g,!n||!t||0>=f?[2,t?4:5]:[3,1];case 3:return[2]}})})};b.prototype.createFeatureCountQuery=function(a){a=this.createQuery(a);this.context.capabilities.supportsCacheHint&&
(a.resultType=void 0,a.cacheHint=!0);return a};b.prototype.createQuery=function(a){var b=this.context.createQuery(),d=a.descriptor.extent;d&&(b.geometry=w.toExtent(d,this.context.tilingScheme.spatialReference));this.setResolutionParams(b,a);this.useTileQuery(a)?b.resultType="tile":this.context.capabilities.supportsCacheHint&&(b.cacheHint=!0);return b};b.prototype.setPagingParameters=function(a,b,d,e){if(!this.context.capabilities.supportsPagination)return!1;a.start=b;0<d&&this.context.capabilities.supportsMaxRecordCountFactor?
(a.maxRecordCountFactor=Math.ceil(d/e),a.num=Math.min(a.maxRecordCountFactor*e,d)):a.num=Math.min(e);return!0};b.prototype.getEffectiveTileResolution=function(a){if(null==a.descriptor.resolution)return null;var b="global"===this.context.viewingMode?this.context.tilingScheme.resolutionAtLevel(3):Infinity;return Math.min(a.descriptor.resolution,b)/this.lodFactor};Object.defineProperty(b.prototype,"supportsResolution",{get:function(){return this.context.capabilities.supportsMultipleResolutions&&"point"!==
this.context.geometryType},enumerable:!0,configurable:!0});b.prototype.setResolutionParams=function(a,b){this.supportsResolution&&(b=this.getEffectiveTileResolution(b),null!=b&&(this.context.capabilities.supportsQuantization?a.quantizationParameters=new Q.default({mode:"view",originPosition:"upper-left",tolerance:b,extent:this.context.fullExtent}):"polyline"===this.context.geometryType&&(a.maxAllowableOffset=b)))};b.prototype._removeEmptyFeatures=function(a){for(var b=a.length,d=0;d<a.length;)r.hasVertices(a[d].geometry)?
++d:(a[d]=a[a.length-1],--a.length);return b-a.length};b.prototype.needsNumFeatures=function(a){return this.useTileCount&&a.needsFeatureCount&&!y(a)};b.prototype.getMaxRecordCount=function(a){var b=this.context,d=b.tileMaxRecordCount,b=b.maxRecordCount;return this.useTileQuery(a)&&h.isSome(d)&&0<d&&this.context.capabilities.supportsResultType?d:h.isSome(b)&&0<b?b:V};b.prototype.useTileQuery=function(a){return y(a)&&this.context.capabilities.supportsCacheHint?!1:this.context.capabilities.supportsResultType};
b.prototype._handleRequest=function(a,b,d,e){var c=this;a.fetchStatus=a.needsRefetching?3:2;a.requestController=d;var g=!1;b.then(function(b){a.requestController=null;a.fetchStatus=b}).catch(function(b){a.requestController===d&&(a.requestController=null,a.fetchStatus=4);n.isAbortError(b)?g=!0:e(b)}).then(function(){g||c.setDirty();c.scheduleUpdated()})};b.prototype.scheduleUpdated=function(){var a=this;this.handles&&!this.handles.has("scheduleUpdated")&&this.handles.add(O.schedule(function(){a.handles.remove("scheduleUpdated");
a.updated()}),"scheduleUpdated")};b.prototype.showTile=function(a){if(a.displayingFeatures&&!a.needsDisplayUpdate)return!1;var b=a.features;if(0===a.featureLimit||!b)return b=a.displayingFeatures&&0<a.displayingFeatures.length,this.hideTileFeatures(a),a.displayingFeatures=[],b;var d=a.descriptor.resolution,e=this.changes.updates,k=this.changes.adds,g=Math.min(a.featureLimit,b.length);a.featureLimit=g;for(var f=0;f<g;++f){var h=b[f],q=r.getObjectId(h,this.objectIdField),n=this.displayingFeatureReferences.get(q);
n?(h=n.ref(h,d),h.oldVersion!==h.newVersion&&(e.removes.push(h.oldVersion),e.adds.push(h.newVersion))):(this.displayingFeatureReferences.set(q,new this.FeatureReferenceClass(h,d)),k.push(h));this.numDisplayingFeatureReferences++}this.hideTileFeatures(a);this.applyChanges();a.displayingFeatures=b.slice(0,g);return!0};b.prototype.hideTile=function(a){this.cancelFetchTile(a);this.hideTileFeatures(a)};b.prototype.hideTileFeatures=function(a){if(a.displayingFeatures){for(var b=this.changes.updates,d=this.changes.removes,
e=0,h=a.displayingFeatures;e<h.length;e++){var g=r.getObjectId(h[e],this.objectIdField),f=this.displayingFeatureReferences.get(g);f&&((f=f.unref(a.descriptor.resolution),this.numDisplayingFeatureReferences--,f)?f.oldVersion!==f.newVersion&&(null==f.newVersion?(this.displayingFeatureReferences.delete(g),d.push(f.oldVersion)):(b.adds.push(f.newVersion),b.removes.push(f.oldVersion))):console.error("Hiding unreferenced feature"))}this.applyChanges();a.displayingFeatures=null}};b.prototype.applyChanges=
function(){var a=this.changes.updates;0<a.removes.length&&(this.features.removeMany(a.removes),a.removes.length=0);0<a.adds.length&&(this.features.addMany(a.adds),a.adds.length=0);for(var a=this.changes.adds,b=this.changes.removes,d=Math.min(a.length,b.length),e=0;e<d;){var h=Math.min(e+W,d);this.features.addMany(a.slice(e,h));this.features.removeMany(b.slice(e,h));e=h}a.length>d&&this.features.addMany(0===e?a:a.slice(e));b.length>d&&this.features.removeMany(0===e?b:b.slice(e));a.length=0;b.length=
0};b.prototype.clearTile=function(a){this.hideTile(a);a.features&&h.isSome(this.context.memoryCache)&&this.context.memoryCache.put(a.id,a.cache,16+a.estimatedSize);a.setFeatures(null,0,null);this.invalidateCounts()};b.prototype.invalidateCounts=function(){this.notifyChange("totalVertices");this.notifyChange("totalFeatures");this.notifyChange("memoryForUnusedFeatures")};b.prototype.getListOfTiles=function(){var a=Array(this.featureTiles.size),b=0;this.featureTiles.forEach(function(c){return a[b++]=
c});return a};Object.defineProperty(b.prototype,"storedFeatures",{get:function(){return this.getListOfTiles().reduce(function(a,b){return a+(b.features?b.features.length:0)},0)},enumerable:!0,configurable:!0});b.prototype.maximumFeaturesForTile=function(a){var b=a.hasPreciseFeatureCount?a.numFeatures:Infinity;return Math.min(Math.ceil((a.hasPreciseFeatureCount?b:this.maximumNumberOfFeatures)*(1>this._fullRatio?this._farRatio:1)/(1-a.emptyFeatureRatio)),b)};Object.defineProperty(b.prototype,"test",
{get:function(){var a=this;return{update:function(b){return a.update(b)},getFeatureTileById:function(b){return a.featureTiles.get(b)},forEachFeatureTile:function(b){return a.featureTiles.forEach(b)}}},enumerable:!0,configurable:!0});d.__decorate([k.property({constructOnly:!0})],b.prototype,"features",void 0);d.__decorate([k.property()],b.prototype,"tileDescriptors",void 0);d.__decorate([k.property({value:Infinity})],b.prototype,"maximumNumberOfFeatures",null);d.__decorate([k.property({value:1})],
b.prototype,"memoryFactor",null);d.__decorate([k.property({value:1})],b.prototype,"lodFactor",null);d.__decorate([k.property({dependsOn:["context"]})],b.prototype,"useTileCount",null);d.__decorate([k.property({readOnly:!0})],b.prototype,"updating",void 0);d.__decorate([k.property({readOnly:!0})],b.prototype,"updatingTotal",void 0);d.__decorate([k.property({readOnly:!0})],b.prototype,"updatingRemaining",void 0);d.__decorate([k.property({readOnly:!0})],b.prototype,"expectedFeatureDiff",void 0);d.__decorate([k.property({readOnly:!0})],
b.prototype,"memoryForUnusedFeatures",null);d.__decorate([k.property({readOnly:!0})],b.prototype,"maximumNumberOfFeaturesExceeded",void 0);d.__decorate([k.property({constructOnly:!0})],b.prototype,"maximumNumberOfFeaturesExceededThrottle",void 0);d.__decorate([k.property({readOnly:!0})],b.prototype,"totalVertices",null);d.__decorate([k.property({readOnly:!0})],b.prototype,"totalFeatures",null);d.__decorate([k.property()],b.prototype,"filterExtent",null);d.__decorate([k.property({constructOnly:!0})],
b.prototype,"context",void 0);return b=d.__decorate([k.subclass("esri.views.3d.layers.support.FeatureTileFetcher3D")],b)}(K);t.FeatureTileFetcher3D=x;t.contextCapabilitiesFromLayer=function(d){var b=d.capabilities.query;a:switch(d.geometryType){case "polyline":d=!0;break a;case "polygon":d=d.capabilities&&d.capabilities.query&&d.capabilities.query.supportsQuantization;break a;default:d=!1}return{supportsMultipleResolutions:d,supportsPagination:!(!b||!b.supportsPagination),supportsResultType:!(!b||
!b.supportsResultType),supportsCacheHint:!(!b||!b.supportsCacheHint),supportsQuantization:!(!b||!b.supportsQuantization),supportsQuantizationEditMode:!(!b||!b.supportsQuantizationEditMode),supportsMaxRecordCountFactor:!(!b||!b.supportsMaxRecordCountFactor),supportsFormatPBF:!(!b||!b.supportsFormatPBF)}};var V=2E3,I=w.create(),J=w.create(),U=6E5,W=200;t.default=x});