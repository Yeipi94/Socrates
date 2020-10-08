// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","../../../geometry/support/jsonUtils","../CurveHelper","../GeometryWalker"],function(l,m,n,r,p){Object.defineProperty(m,"__esModule",{value:!0});l=function(){function d(){}d.local=function(){null===d.instance&&(d.instance=new d);return d.instance};d.prototype.execute=function(a,b,f){return new t(a,b,f)};d.instance=null;return d}();m.EffectWave=l;var t=function(){function d(a,b,f){this._inputGeometries=a;this._height=(void 0!==b.amplitude?b.amplitude:2)*f;this._period=(void 0!==
b.period?b.period:3)*f;this._style=b.waveform;0>=this._height&&(this._height=Math.abs(this._height));0>=this._period&&(this._period=Math.abs(this._period));this._pattern=new p.DashPattern;this._pattern.addValue(this._period);this._pattern.addValue(this._period);this._walker=new p.GeometryWalker;this._walker.updateTolerance(f)}d.prototype.next=function(){for(var a=this._inputGeometries.next();a;){if(0===this._height||0===this._period)return a;if(n.isPolyline(a)){var b=this._processGeom(a.paths);if(b.length)return{paths:b}}if(n.isPolygon(a)&&
(a=this._processGeom(a.rings),a.length))return{rings:a};a=this._inputGeometries.next()}return null};d.prototype._processGeom=function(a){for(var b=[],f=0;f<a.length;f++){var c=a[f];if(this._walker.init(c,this._pattern))switch(this._style){default:b.push(this._constructCurve(c,!1));break;case "Square":b.push(this._constructSquare(c));break;case "Triangle":b.push(this._constructTriangle(c));break;case "Random":b.push(this._constructCurve(c,!0))}else b.push(c)}return b};d.prototype._constructCurve=function(a,
b){var f=new r.PathHelper,c=this._walker.calculatePathLength(a),e=Math.round(c/this._period);0===e&&(e=1);var d=this._period/16,l=1/(16*e+1),c=2*Math.PI*c/(c/e),e=2*Math.PI*Math.random(),m=2*Math.PI*Math.random(),n=2*Math.PI*Math.random(),p=.75-Math.random()/2,t=.75-Math.random()/2,h={};this._walker.curPointAndAngle(h);f.startPath(h.pt);for(var u=0;;)if(this._walker.nextPointAndAngle(d,h)){var q=u,u=u+l,g=void 0;if(b)var v=this._height/2*(1+.3*Math.sin(p*c*q+e)),g=v*Math.sin(c*q+m),g=g+v*Math.sin(t*
c*q+n),g=g/2;else g=.5*this._height*Math.sin(.5*c*q);f.lineTo([h.pt[0]-g*h.sa,h.pt[1]+g*h.ca])}else{f.lineTo(a[a.length-1]);break}return f.path()};d.prototype._constructSquare=function(a){var b=new r.PathHelper;a=this._walker.calculatePathLength(a);a=Math.round(a/this._period);0===a&&(a=1);for(a=!0;;){var f=!1;if(this._walker.curPositionIsValid()){var c={};this._walker.curPointAndAngle(c);var e={};if(this._walker.nextPointAndAngle(this._period,e)){var d={};this._walker.nextPointAndAngle(this._period,
d)&&(a?(b.startPath(c.pt),a=!1):b.lineTo(c.pt),b.lineTo([c.pt[0]-this._height/2*c.sa,c.pt[1]+this._height/2*c.ca]),b.lineTo([e.pt[0]-this._height/2*e.sa,e.pt[1]+this._height/2*e.ca]),b.lineTo([e.pt[0]+this._height/2*e.sa,e.pt[1]-this._height/2*e.ca]),b.lineTo([d.pt[0]+this._height/2*d.sa,d.pt[1]-this._height/2*d.ca]),f=!0)}}if(!f){b.lineTo(this._walker.getPathEnd());break}}return b.path()};d.prototype._constructTriangle=function(a){var b=new r.PathHelper;a=this._walker.calculatePathLength(a);a=Math.round(a/
this._period);0===a&&(a=1);for(a=!0;;){var d=!1;if(this._walker.curPositionIsValid()){var c={};this._walker.curPointAndAngle(c);var e={};if(this._walker.nextPointAndAngle(this._period/2,e)){var k={};this._walker.nextPointAndAngle(this._period,k)&&(this._walker.nextPosition(this._period/2)&&(a?(b.startPath(c.pt),a=!1):b.lineTo(c.pt),b.lineTo([e.pt[0]-this._height/2*e.sa,e.pt[1]+this._height/2*e.ca]),b.lineTo([k.pt[0]+this._height/2*k.sa,k.pt[1]-this._height/2*k.ca])),d=!0)}}if(!d){b.lineTo(this._walker.getPathEnd());
break}}return b.path()};return d}()});