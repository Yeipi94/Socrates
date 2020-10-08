// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports tslib ../core/Error ../core/MultiOriginJSONSupport ../core/promiseUtils ../core/scheduling ../core/accessorSupport/decorators ./Layer ./mixins/PortalLayer".split(" "),function(n,p,b,f,g,h,k,d,l,m){return function(e){function a(c){c=e.call(this,c)||this;c.resourceInfo=null;c.type="unknown";return c}b.__extends(a,e);a.prototype.initialize=function(){var c=this;this.addResolvingPromise(h.create(function(a,b){k.schedule(function(){var a=c.resourceInfo&&(c.resourceInfo.layerType||
c.resourceInfo.type),d="Unknown layer type";a&&(d+=" "+a);b(new f("layer:unknown-layer-type",d,{layerType:a}))})}))};a.prototype.read=function(a,b){e.prototype.read.call(this,{resourceInfo:a},b)};a.prototype.write=function(){return null};b.__decorate([d.property({readOnly:!0})],a.prototype,"resourceInfo",void 0);b.__decorate([d.property({type:["show","hide"]})],a.prototype,"listMode",void 0);b.__decorate([d.property({json:{read:!1},readOnly:!0,value:"unknown"})],a.prototype,"type",void 0);return a=
b.__decorate([d.subclass("esri.layers.UnknownLayer")],a)}(m.PortalLayer(g.MultiOriginJSONMixin(l)))});