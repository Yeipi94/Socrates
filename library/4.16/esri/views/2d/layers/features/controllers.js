// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","../../../../core/Error","../../../../core/promiseUtils","@dojo/framework/shim/Promise"],function(c,a,d,e){Object.defineProperty(a,"__esModule",{value:!0});a.loadControllerModule=function(a){switch(a){case "on-demand":return new Promise(function(a,b){c(["./controllers/OnDemandController"],a,b)});case "stream":return new Promise(function(a,b){c(["./controllers/StreamController"],a,b)});default:return e.reject(new d("mapview-controller:bad-type","Unable to create controller for unknown type: "+
a))}}});