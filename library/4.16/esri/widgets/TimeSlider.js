// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports tslib ../TimeInterval ../core/arrayUtils ../core/Collection ../core/compilerUtils ../core/Error ../core/events ../core/mathUtils ../core/maybe ../core/throttle ../core/watchUtils ../core/accessorSupport/decorators ../intl/date ../layers/support/timeUtils ./Slider ./Widget ./support/widget ./TimeSlider/TimeSliderViewModel".split(" "),function(N,O,e,a,A,G,w,B,H,I,l,J,C,f,u,D,K,L,d,E){var M=new G([{minor:new a({value:100,unit:"milliseconds"}),major:new a({value:1,unit:"seconds"}),
format:{second:"numeric"}},{minor:new a({value:500,unit:"milliseconds"}),major:new a({value:5,unit:"seconds"}),format:{second:"numeric"}},{minor:new a({value:1,unit:"seconds"}),major:new a({value:20,unit:"seconds"}),format:{minute:"numeric",second:"numeric"}},{minor:new a({value:2,unit:"seconds"}),major:new a({value:30,unit:"seconds"}),format:{minute:"numeric",second:"numeric"}},{minor:new a({value:10,unit:"seconds"}),major:new a({value:1,unit:"minutes"}),format:{minute:"numeric"}},{minor:new a({value:15,
unit:"seconds"}),major:new a({value:5,unit:"minutes"}),format:{hour:"numeric",minute:"numeric"}},{minor:new a({value:1,unit:"minutes"}),major:new a({value:20,unit:"minutes"}),format:{hour:"numeric",minute:"numeric"}},{minor:new a({value:5,unit:"minutes"}),major:new a({value:2,unit:"hours"}),format:{hour:"numeric",minute:"numeric"}},{minor:new a({value:15,unit:"minutes"}),major:new a({value:6,unit:"hours"}),format:{hour:"numeric",minute:"numeric"}},{minor:new a({value:1,unit:"hours"}),major:new a({value:1,
unit:"days"}),format:{day:"numeric",month:"short"}},{minor:new a({value:6,unit:"hours"}),major:new a({value:1,unit:"weeks"}),format:{day:"numeric",month:"short"}},{minor:new a({value:1,unit:"days"}),major:new a({value:1,unit:"months"}),format:{month:"long"}},{minor:new a({value:2,unit:"days"}),major:new a({value:1,unit:"months"}),format:{month:"short"}},{minor:new a({value:3,unit:"days"}),major:new a({value:1,unit:"months"}),format:{month:"short"}},{minor:new a({value:4,unit:"days"}),major:new a({value:3,
unit:"months"}),format:{month:"short",year:"numeric"}},{minor:new a({value:1,unit:"weeks"}),major:new a({value:1,unit:"years"}),format:{year:"numeric"}},{minor:new a({value:1,unit:"months"}),major:new a({value:1,unit:"years"}),format:{year:"numeric"}},{minor:new a({value:2,unit:"months"}),major:new a({value:2,unit:"years"}),format:{year:"numeric"}},{minor:new a({value:1,unit:"years"}),major:new a({value:1,unit:"decades"}),format:{year:"numeric"}},{minor:new a({value:2,unit:"years"}),major:new a({value:5,
unit:"decades"}),format:{year:"numeric"}},{minor:new a({value:5,unit:"decades"}),major:new a({value:10,unit:"centuries"}),format:{era:"short",year:"numeric"}},{minor:new a({value:1,unit:"centuries"}),major:new a({value:10,unit:"centuries"}),format:{era:"short",year:"numeric"}},{minor:new a({value:2,unit:"centuries"}),major:new a({value:20,unit:"centuries"}),format:{era:"short",year:"numeric"}},{minor:new a({value:5,unit:"centuries"}),major:new a({value:50,unit:"centuries"}),format:{era:"short",year:"numeric"}},
{minor:new a({value:10,unit:"centuries"}),major:new a({value:100,unit:"centuries"}),format:{era:"short",year:"numeric"}},{minor:new a({value:20,unit:"centuries"}),major:new a({value:200,unit:"centuries"}),format:{era:"short",year:"numeric"}},{minor:new a({value:50,unit:"centuries"}),major:new a({value:500,unit:"centuries"}),format:{era:"short",year:"numeric"}},{minor:new a({value:100,unit:"centuries"}),major:new a({value:1E3,unit:"centuries"}),format:{era:"short",year:"numeric"}},{minor:new a({value:200,
unit:"centuries"}),major:new a({value:1E3,unit:"centuries"}),format:{era:"short",year:"numeric"}},{minor:new a({value:500,unit:"centuries"}),major:new a({value:5E3,unit:"centuries"}),format:{era:"short",year:"numeric"}},{minor:new a({value:1E3,unit:"centuries"}),major:new a({value:1E4,unit:"centuries"}),format:{era:"short",year:"numeric"}}]);return function(a){function c(b,c){b=a.call(this,b,c)||this;b._slider=new K({precision:0,visibleElements:{rangeLabels:!1},rangeLabelInputsEnabled:!1});b._tickFormat=
null;b.disabled=!1;b.effectiveStops=null;b.fullTimeExtent=null;b.iconClass="esri-icon-time-clock";b.label=void 0;b.loop=!0;b.messages=null;b.messagesCommon=null;b.playRate=1E3;b.mode="time-window";b.stops={count:10};b.tickConfigs=null;b.timeExtent=null;b.timeVisible=!1;b.values=null;b.view=null;b.viewModel=new E;return b}e.__extends(c,a);c.prototype.initialize=function(){var b=this;this.own([this._slider.watch("values",function(a){var c,d=null===(c=b.values)||void 0===c?void 0:c.map(function(b){return b.getTime()});
A.equals(a,d)||b.set("values",a.map(function(b){return new Date(b)}))}),H.on(window,"resize",J.throttle(function(){return b.scheduleRender()},100)),C.init(this,"effectiveStops",function(){return b._updateSliderSteps()}),C.init(this,["stops","fullTimeExtent"],function(){return b._createDefaultValues()})]);this._validateTimeExtent()};c.prototype.destroy=function(){this.view=null;this._slider.destroy();this._tickFormat=null};Object.defineProperty(c.prototype,"interactive",{get:function(){return!this.disabled&&
this.viewModel&&"disabled"!==this.viewModel.state},enumerable:!0,configurable:!0});Object.defineProperty(c.prototype,"layout",{set:function(b){-1===["auto","compact","wide"].indexOf(b)&&(b="auto");this._set("layout",b)},enumerable:!0,configurable:!0});c.prototype.next=function(){};c.prototype.play=function(){};c.prototype.previous=function(){};c.prototype.stop=function(){return null};c.prototype.render=function(){var b=this._slider,a=this.domNode,c=this.effectiveStops,e=this.fullTimeExtent,f=this.interactive,
F=this.mode,k=this.tickConfigs,m=this.timeVisible,g=this.values,r=this.viewModel,p=this.messagesCommon;if(null!=e){var h=e.start,n=e.end;if(null!=h&&null!=n){var h=h.getTime(),q=n.getTime();if(n=b.min!==h||b.max!==q)b.min=h,b.max=q;if(null!=k)b.tickConfigs!==k&&(b.tickConfigs=k);else{var w=(q-h)/(b.trackElement?b.trackElement.offsetWidth:400),t=M.find(function(b){return b.minor.toMilliseconds()>3*w});if(k=this._tickFormat!==t&&null!=t)this._tickFormat=t;if(n||k)k={mode:"position",values:this._getTickPositions(t.minor),
labelsVisible:!1,tickCreatedFunction:function(b,a){a.classList.add("minorTick")}},h={mode:"position",values:this._getTickPositions(t.major),labelsVisible:!0,tickCreatedFunction:function(b,a){a.classList.add("majorTick")},labelFormatFunction:function(b){return u.formatDate(b,t.format)}},b.tickConfigs=[k,h]}}}k=g?g.map(function(b){return b.getTime()}):null;A.equals(b.values,k)||(b.values=k);b.disabled=!f;var h=e&&e.start,k=l.isSome(h)?this._formateDate(h):null,h=m&&l.isSome(h)?this._formateTime(h):
null,n=e&&e.end,e=l.isSome(n)?this._formateDate(n):null,n=m&&l.isSome(n)?this._formateTime(n):null,x=q=null,y=null,z=null;if(g&&0<g.length){var v=g[0],q=this._formateDate(v);m&&(x=this._formateTime(v))}"time-window"===F&&g&&1<g.length&&(v=g[1],y=this._formateDate(v),m&&(z=this._formateTime(v)));m=r.state;r="ready"===m;m="playing"===m;g=!f||0===c.length;c=d.tsx("div",{class:"esri-time-slider__animation"},d.tsx("button",{"aria-disabled":g?"true":"false","aria-label":m?p.control.stop:p.control.play,
bind:this,class:this.classes("esri-widget--button","esri-time-slider__animation-button",g&&"esri-button--disabled"),disabled:g,title:m?p.control.stop:p.control.play,onclick:this._playOrStopClick},d.tsx("div",{class:this.classes((r||g)&&"esri-icon-play",m&&"esri-icon-pause")})));r=d.tsx("div",{class:this.classes("esri-time-slider__time-extent",!f&&"esri-button--disabled")},l.isSome(q)&&d.tsx("div",{key:"start-date-group",class:"esri-time-slider__time-extent-group"},d.tsx("div",{key:"start-date",class:"esri-time-slider__time-extent-date"},
q),l.isSome(x)&&d.tsx("div",{key:"start-time",class:"esri-time-slider__time-extent-time"},x)),l.isSome(y)&&d.tsx("div",{key:"separator",class:"esri-time-slider__time-extent-separator"},"\u2013"),l.isSome(q)&&d.tsx("div",{key:"end-date-group",class:"esri-time-slider__time-extent-group"},d.tsx("div",{key:"end-date",class:"esri-time-slider__time-extent-date"},y),l.isSome(z)&&d.tsx("div",{key:"end-time",class:"esri-time-slider__time-extent-time"},z)));k=d.tsx("div",{class:this.classes("esri-time-slider__min",
!f&&"esri-button--disabled")},l.isSome(k)&&d.tsx("div",{key:"min-date",class:"esri-time-slider__min-date"},k),l.isSome(h)&&d.tsx("div",{key:"min-time"},h));b=d.tsx("div",{class:"esri-time-slider__slider"},b.render());e=d.tsx("div",{class:this.classes("esri-time-slider__max",!f&&"esri-button--disabled")},l.isSome(e)&&d.tsx("div",{key:"max-date",class:"esri-time-slider__max-date"},e),l.isSome(n)&&d.tsx("div",{key:"max-time"},n));h=d.tsx("div",{class:"esri-time-slider__previous"},d.tsx("button",{"aria-disabled":g?
"true":"false","aria-label":p.pagination.previous,bind:this,class:this.classes("esri-widget--button","esri-time-slider__previous-button",(m||g)&&"esri-button--disabled"),disabled:g,title:p.pagination.previous,onclick:this._previousClick},d.tsx("div",{class:"esri-icon-reverse"})));p=d.tsx("div",{class:"esri-time-slider__next"},d.tsx("button",{"aria-disabled":g?"true":"false","aria-label":p.pagination.next,bind:this,class:this.classes("esri-widget--button","esri-time-slider__next-button",(m||g)&&"esri-button--disabled"),
disabled:g,title:p.pagination.next,onclick:this._nextClick},d.tsx("div",{class:"esri-icon-forward"})));a="auto"===this.layout?858>a.clientWidth?"compact":"wide":this.layout;return d.tsx("div",{class:this.classes("esri-time-slider","esri-widget","esri-time-slider__mode--"+F,"esri-time-slider__layout--"+a,!f&&"esri-disabled")},"wide"===a&&d.tsx("div",{class:"esri-time-slider__row"},[c,r,k,b,e,h,p]),"compact"===a&&[d.tsx("div",{key:"time-slider-row-1",class:"esri-time-slider__row"},[r]),d.tsx("div",
{key:"time-slider-row-2",class:"esri-time-slider__row"},[b]),d.tsx("div",{key:"time-slider-row-3",class:"esri-time-slider__row"},[k,h,c,p,e])])};c.prototype._createDefaultValues=function(){var b=this.effectiveStops,a=this.mode,c=this.values;this.fullTimeExtent&&b&&a&&!c&&(this.values="time-window"===a?1<b.length?[b[0],b[1]]:null:0<b.length?[b[0]]:null)};c.prototype._getTickPositions=function(b){var a=this.fullTimeExtent,c=a.start,a=a.end,d=[],e=b.value;b=b.unit;for(var f=D.truncateDate(c,b);f.getTime()<=
a.getTime();)f.getTime()>=c.getTime()&&d.push(f.getTime()),f=D.offsetDate(f,e,b);return d};c.prototype._formateDate=function(a){return u.formatDate(a,u.convertDateFormatToIntlOptions("short-date"))};c.prototype._formateTime=function(a){return u.formatDate(a,u.convertDateFormatToIntlOptions("long-time"))};c.prototype._updateSliderSteps=function(){this._slider.steps=this.effectiveStops&&0<this.effectiveStops.length?this.effectiveStops.map(function(a){return a.getTime()}):null};c.prototype._validateTimeExtent=
function(){var a=this;if(this.fullTimeExtent&&this.mode&&this.values){if(!Array.isArray(this.values))throw new B("time-slider:invalid-values","Values must be an array of dates.");if(0===this.values.length||this.values.some(function(a){return!(a instanceof Date)}))throw new B("time-slider:invalid-values","Values must be an array of dates.");this.values=this.values.map(function(b){b=b.getTime();b=I.clamp(b,a.fullTimeExtent.start.getTime(),a.fullTimeExtent.end.getTime());return new Date(b)});switch(this.mode){case "instant":case "cumulative-from-start":case "cumulative-from-end":1<
this.values.length&&this.values.splice(1);break;case "time-window":1===this.values.length?this.values.push(this.fullTimeExtent.end):2<this.values.length&&this.values.splice(2);this.values.sort(function(a,b){return a.getTime()-b.getTime()});break;default:w.neverReached(this.mode)}}};c.prototype._playOrStopClick=function(){switch(this.viewModel.state){case "ready":this.viewModel.play();break;case "playing":this.viewModel.stop();break;case "disabled":break;default:w.neverReached(this.viewModel.state)}};
c.prototype._previousClick=function(){this.viewModel.previous()};c.prototype._nextClick=function(){this.viewModel.next()};e.__decorate([f.property()],c.prototype,"disabled",void 0);e.__decorate([f.aliasOf("viewModel.effectiveStops"),d.renderable()],c.prototype,"effectiveStops",void 0);e.__decorate([f.aliasOf("viewModel.fullTimeExtent"),d.renderable()],c.prototype,"fullTimeExtent",void 0);e.__decorate([f.property()],c.prototype,"iconClass",void 0);e.__decorate([f.property({dependsOn:["disabled","viewModel.state"],
readOnly:!0}),d.renderable()],c.prototype,"interactive",null);e.__decorate([f.property({aliasOf:{source:"messages.widgetLabel",overridable:!0}})],c.prototype,"label",void 0);e.__decorate([f.property({value:"auto"}),d.renderable()],c.prototype,"layout",null);e.__decorate([f.aliasOf("viewModel.loop")],c.prototype,"loop",void 0);e.__decorate([f.property(),d.renderable(),d.messageBundle("esri/widgets/TimeSlider/t9n/TimeSlider")],c.prototype,"messages",void 0);e.__decorate([f.property(),d.renderable(),
d.messageBundle("esri/t9n/common")],c.prototype,"messagesCommon",void 0);e.__decorate([f.aliasOf("viewModel.playRate")],c.prototype,"playRate",void 0);e.__decorate([f.aliasOf("viewModel.mode"),d.renderable()],c.prototype,"mode",void 0);e.__decorate([f.aliasOf("viewModel.stops")],c.prototype,"stops",void 0);e.__decorate([f.property(),d.renderable()],c.prototype,"tickConfigs",void 0);e.__decorate([f.aliasOf("viewModel.timeExtent")],c.prototype,"timeExtent",void 0);e.__decorate([f.property({nonNullable:!0}),
d.renderable()],c.prototype,"timeVisible",void 0);e.__decorate([f.aliasOf("viewModel.values"),d.renderable()],c.prototype,"values",void 0);e.__decorate([f.aliasOf("viewModel.view")],c.prototype,"view",void 0);e.__decorate([f.property({type:E}),d.renderable(["viewModel.state"])],c.prototype,"viewModel",void 0);e.__decorate([f.aliasOf("viewModel.next")],c.prototype,"next",null);e.__decorate([f.aliasOf("viewModel.play")],c.prototype,"play",null);e.__decorate([f.aliasOf("viewModel.previous")],c.prototype,
"previous",null);e.__decorate([f.aliasOf("viewModel.stop")],c.prototype,"stop",null);e.__decorate([d.accessibleHandler()],c.prototype,"_playOrStopClick",null);e.__decorate([d.accessibleHandler()],c.prototype,"_previousClick",null);e.__decorate([d.accessibleHandler()],c.prototype,"_nextClick",null);return c=e.__decorate([f.subclass("esri.widgets.TimeSlider")],c)}(L)});