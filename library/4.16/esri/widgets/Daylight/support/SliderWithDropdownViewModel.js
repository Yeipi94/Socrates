// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","tslib","../../../core/accessorSupport/decorators","../../Slider/SliderViewModel"],function(c,e,b,d,f){Object.defineProperty(e,"__esModule",{value:!0});c=function(c){function a(a){a=c.call(this,a)||this;a.items=null;a.currentIndex=0;a.isDropdownOpen=!1;return a}b.__extends(a,c);Object.defineProperty(a.prototype,"currentItem",{get:function(){return null!==this.items&&null!==this.currentIndex&&this.currentIndex<this.items.length?this.items[this.currentIndex]:null},enumerable:!0,
configurable:!0});a.prototype.selectItem=function(a){this.currentIndex=a;this.isDropdownOpen=!1};a.prototype.toggle=function(){this.isDropdownOpen=!this.isDropdownOpen};b.__decorate([d.property()],a.prototype,"items",void 0);b.__decorate([d.property()],a.prototype,"currentIndex",void 0);b.__decorate([d.property({dependsOn:["currentIndex","items"]})],a.prototype,"currentItem",null);b.__decorate([d.property()],a.prototype,"isDropdownOpen",void 0);return a=b.__decorate([d.subclass("esri.widgets.Daylight.SliderWithDropdown")],
a)}(f);e.SliderWithDropdownViewModel=c});