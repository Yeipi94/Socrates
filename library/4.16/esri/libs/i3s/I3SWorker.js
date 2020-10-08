// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports ../../assets ../../core/has ../../core/promiseUtils @dojo/framework/shim/Promise".split(" "),function(d,b,f,g,e){function h(a){return f.getAssetUrl("esri/libs/i3s/"+a)}Object.defineProperty(b,"__esModule",{value:!0});b.getWorkerModule=function(){if(!a){var b=g("esri-wasm")?new Promise(function(c,a){d(["./i3s"],c,a)}):new Promise(function(a,b){d(["./i3s_nowasm"],a,b)});a=e.create(function(a){return b.then(function(b){var c=b({locateFile:h,onRuntimeInitialized:function(){return a(c)}});
delete c.then})}).catch(function(a){return e.reject(a)})}return a};var a});