// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports"],function(c,d){Object.defineProperty(d,"__esModule",{value:!0});c=function(){function b(){this.name="";this.nodes=[]}b.prototype.addNode=function(a){if(0<=this.nodes.indexOf(a))throw Error("Node already added");this.nodes.push(a)};b.prototype.forEachNode=function(a){this.nodes.forEach(a)};return b}();d.Scene=c});