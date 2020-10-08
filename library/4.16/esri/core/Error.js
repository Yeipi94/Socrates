// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports tslib ./lang ./Logger ./Message".split(" "),function(c,m,g,h,k,l){c=function(c){function b(a,d,e){var f=c.call(this,a,d,e)||this;return f instanceof b?f:new b(a,d,e)}g.__extends(b,c);b.prototype.toJSON=function(){if(null!=this.details)try{var a=h.clone(this.details);return{name:this.name,message:this.message,details:a}}catch(d){throw k.getLogger("esri.core.Error").error(d),d;}return{name:this.name,message:this.message,details:this.details}};b.fromJSON=function(a){return new b(a.name,
a.message,a.details)};return b}(l);c.prototype.type="error";return c});