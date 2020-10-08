// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","tslib","../../../../core/libs/gl-matrix-2/vec4f64"],function(b,d,e,f){Object.defineProperty(d,"__esModule",{value:!0});b=function(){return function(b,c){this.id=b;this.mbs=c;this.isComputedObb=!1;this.renderMbs=f.vec4f64.fromArray([0,0,0,-1])}}();d.NodeBase=b;b=function(b){function c(a,c,d,e,f,g,h,k,l,m){a=b.call(this,a,d)||this;a.index=c;a.childCount=e;a.level=f;a.resources=g;a.version=h;a.lodMetric=k;a.maxError=l;a.numFeatures=m;a.failed=!1;a.cacheState=0;a.vertexCount=
0;a.memory=0;return a}e.__extends(c,b);return c}(b);d.Node=b});