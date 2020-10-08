// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","tslib","../../../../core/compilerUtils","../../../input/InputHandler"],function(e,g,h,k,l){Object.defineProperty(g,"__esModule",{value:!0});e=function(e){function f(a,d,c){var b=e.call(this,!0)||this;b.view=a;b.pointerType=d;b.registerIncoming("double-tap-drag",c,function(a){return b._handleDoubleTapDrag(a)});return b}h.__extends(f,e);f.prototype._handleDoubleTapDrag=function(a){var d=a.data;if(d.pointerType===this.pointerType){a.stopPropagation();var c=d.action;a=d.delta;
var b=this.view,d=b.mapViewNavigation;switch(c){case "begin":this._currentScale=this._startScale=c=b.scale;this._previousDelta=a;d.begin();break;case "update":if(this._previousDelta.y===a.y)break;this._previousDelta=a;a=this._startScale*Math.pow(1.015,a.y);d.setViewpointImmediate(a/this._currentScale);this._currentScale=a;break;case "end":c=b.constraints;b=c.effectiveLODs;if(!c.snapToZoom||!b){d.end();break}b=c.snapScale(this._currentScale);a=(0<a.y?Math.max(b,c.snapToPreviousScale(this._startScale)):
Math.min(b,c.snapToNextScale(this._startScale)))/this._currentScale;d.zoom(a);break;default:k.neverReached(c)}}};return f}(l.InputHandler);g.DoubleTapDragZoom=e});