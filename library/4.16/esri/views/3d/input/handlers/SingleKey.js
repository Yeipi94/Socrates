// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","tslib","../../../input/InputHandler"],function(a,d,e,f){Object.defineProperty(d,"__esModule",{value:!0});a=function(a){function b(g,b){var c=a.call(this,!0)||this;c.key=g;c.registerIncoming("key-down",b,function(a){return c._handleKeyDown(a)});return c}e.__extends(b,a);b.prototype._handleKeyDown=function(a){a.data.key===this.key&&(this.activate(),a.stopPropagation())};return b}(f.InputHandler);d.SingleKey=a});