// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports tslib ../../rasterRenderers ../../core/colorUtils ../../core/JSONSupport ../../core/Logger ../../core/accessorSupport/decorators ../../layers/support/RasterInfo ../../layers/support/rasterFunctions/pixelUtils ../../layers/support/rasterFunctions/surfaceUtils ../support/colorRampUtils".split(" "),function(D,E,g,v,z,A,B,r,C,l,u,w){var x=B.getLogger("esri.renderers.support.RasterSymbolizer");return function(y){function f(a){return y.call(this,a)||this}g.__extends(f,y);f.prototype.readRenderer=
function(a,b,e){return v.read(a,e)};f.prototype.bind=function(){if(!this.renderer)return!1;this.lookup={rendererJson:{}};var a;switch(this.renderer.type){case "unique-value":a=this._updateUVRenderer(this.renderer);break;case "raster-colormap":a=this._updateColormapRenderer(this.renderer);break;case "raster-stretch":a=this._updateStretchRenderer(this.renderer);break;case "class-breaks":a=this._updateClassBreaksRenderer(this.renderer);break;case "raster-shaded-relief":a=this._updateShadedReliefRenderer(this.renderer)}return a};
f.prototype.symbolize=function(a){var b=a&&a.pixelBlock;if(!this.isValidPixelBlock(b))return b;if(a.simpleStretchParams&&"raster-stretch"===this.renderer.type)return this.simpleStretch(b,a.simpleStretchParams);try{3<b.pixels.length&&(b=l.extractBands(b,[0,1,2]));var e=void 0;switch(this.renderer.type){case "unique-value":case "raster-colormap":e=this._symbolize_colormap(b);break;case "class-breaks":e=this._symbolize_classBreaks(b);break;case "raster-stretch":e=this._symbolize_stretch(b,a.bandIds);
break;case "raster-shaded-relief":var c=a.extent,e=this._symbolize_shadedRelief(b,{isGCS:c.spatialReference.isGeographic,resolution:{x:(c.xmax-c.xmin)/b.width,y:(c.ymax-c.ymin)/b.height}})}return e}catch(k){return x.error("symbolize",k.message),b}};f.prototype.simpleStretch=function(a,b){if(!this.isValidPixelBlock(a))return a;try{return 3<a.pixels.length&&(a=l.extractBands(a,[0,1,2])),l.stretch(a,b)}catch(e){return x.error("symbolize",e.message),a}};f.prototype.generateWebGLParameters=function(a){if(-1<
["unique-value","raster-colormap","class-breaks"].indexOf(this.renderer.type)){var b=this.lookup.colormapLut;return{colormap:b.indexedColormap,colormapOffset:b.offset,type:"lut"}}var b=a.pixelBlock,e=a.isGCS,c=a.resolution;a=a.bandIds;return"raster-stretch"===this.renderer.type?this.generateStretchWebGLParams(b,this.renderer,a):"raster-shaded-relief"===this.renderer.type?this.generateShadedReliefWebGLParams(this.renderer,e,c):null};f.prototype._isLUTChanged=function(a){if(!this.lookup||!this.lookup.rendererJson)return!0;
if("colorRamp"in this.renderer){var b=this.renderer.colorRamp;if(a)return JSON.stringify(b.toJSON())!==JSON.stringify(this.lookup.rendererJson.colorRamp);a=g.__assign({},this.renderer.toJSON());b=g.__assign({},this.lookup.rendererJson);a.colorRamp=null;b.colorRamp=null}return JSON.stringify(this.renderer.toJSON())!==JSON.stringify(this.lookup.rendererJson)};f.prototype._symbolize_colormap=function(a){return this._isLUTChanged()&&!this.bind()?a:l.colorize(a,this.lookup.colormapLut)};f.prototype._symbolize_classBreaks=
function(a){var b=-1<["u8","u16","s8","s16"].indexOf(this.rasterInfo.pixelType);return this._isLUTChanged()&&!this.bind()?a:b?l.colorize(a,this.lookup.colormapLut):l.remapColor(a,this.lookup.remapLut)};f.prototype._symbolize_stretch=function(a,b){var e=this.rasterInfo,c=e.pixelType,k=e.bandCount,e=this.renderer,d=-1<["u8","u16","s8","s16"].indexOf(c),h,t=e.gamma,f=e.useGamma;if(d){if(e.dynamicRangeAdjustment)d=this.getStretchCutoff(e,a,b),h=l.createStretchLUT(g.__assign(g.__assign({pixelType:c},d),
{gamma:f?t:null}));else{if(this._isLUTChanged()&&(c=this.bind(),!c))return a;h=this.lookup?this.lookup.stretchLut:null}if(!h)return a;1<k&&(null===b||void 0===b?void 0:b.length)===a.pixels.length&&(null===h||void 0===h?void 0:h.lut.length)===k&&(h={lut:b.map(function(a){return h.lut[a]}),offset:h.offset});b=l.lookupPixels(a,h)}else d=this.getStretchCutoff(e,a,b),b=l.stretch(a,g.__assign(g.__assign({},d),{gamma:f?t:null}));if(e.colorRamp){if(this._isLUTChanged(!0)&&(c=this.bind(),!c))return a;b=l.colorize(b,
this.lookup.colormapLut)}return b};f.prototype._symbolize_shadedRelief=function(a,b){var e=this.renderer;b=g.__assign(g.__assign({},e.toJSON()),b);b=u.hillshade(a,b);if(!e.colorRamp||this._isLUTChanged(!0)&&!this.bind())return b;e=this.lookup?this.lookup.hsvMap:null;if(!e)return b;u.tintHillshade(b,a,e,this.rasterInfo.statistics[0]);return b};f.prototype._updateUVRenderer=function(a){var b=this.rasterInfo,e=b.bandCount,c=b.attributeTable,k=b.statistics,b=-1<["u8","s8"].indexOf(b.pixelType)&&k&&null!=
k[0].min&&null!=k[0].max;if(1!==e||!c&&!b)return!1;var d=a.field;if(!d)return!1;var h=[];if(c){var t=c.fields.filter(function(a){return"value"===a.name.toLowerCase()})[0];if(!t)return!1;c.features.forEach(function(b){var c=a.uniqueValueInfos.filter(function(a){return String(a.value)===String(b.attributes[d])})[0];(c=c&&c.symbol&&c.symbol.color)&&h.push([b.attributes[t.name],c.r,c.g,c.b,1<c.a?c.a:Math.round(255*c.a)])})}else{if("value"!==d.toLowerCase())return!1;a.uniqueValueInfos.forEach(function(a){var b=
a&&a.symbol&&a.symbol.color;b&&h.push([parseInt(a.value,10),b.r,b.g,b.b,1<b.a?b.a:Math.round(255*b.a)])})}if(0===h.length)return!1;e=l.createColormapLUT({colormap:h});this.lookup={rendererJson:a.toJSON(),colormapLut:e};return this.canRenderInWebGL=!0};f.prototype._updateColormapRenderer=function(a){var b=a.extractColormap();if(!b||0===b.length)return!1;b=l.createColormapLUT({colormap:b});this.lookup={rendererJson:a.toJSON(),colormapLut:b};return this.canRenderInWebGL=!0};f.prototype._updateShadedReliefRenderer=
function(a){if("elevation"!==this.rasterInfo.dataType)return!1;if(a.colorRamp){for(var b=w.convertColorRampToColormap(a.colorRamp,256),b=l.createColormapLUT({colormap:b}),e=[],c=b.indexedColormap,k=0;k<c.length;k+=4){var d=z.toHSV({r:c[k],g:c[k+1],b:c[k+2]});e.push([d.h/60,d.s/100,255*d.v/100])}this.lookup={rendererJson:a.toJSON(),colormapLut:b,hsvMap:e}}else this.lookup=null;return this.canRenderInWebGL=!0};f.prototype._updateClassBreaksRenderer=function(a){var b=-1<["u8","u16","s8","s16"].indexOf(this.rasterInfo.pixelType),
e=a.classBreakInfos;if(!e||0===e.length)return!1;var c=e.sort(function(a,b){return a.minValue-b.minValue}),e=c[c.length-1];if(!b)return b=c.map(function(a){return{value:a.minValue,mappedColor:[a.symbol.color.r,a.symbol.color.g,a.symbol.color.b,1<a.symbol.color.a?a.symbol.color.a:Math.round(255*a.symbol.color.a)]}}),b.push({value:e.maxValue,mappedColor:[e.symbol.color.g,e.symbol.color.b,1<e.symbol.color.a?e.symbol.color.a:Math.round(255*e.symbol.color.a)]}),this.lookup={rendererJson:a.toJSON(),remapLut:b},
this.canRenderInWebGL=!1,!0;var k=[],d,h=0;c.forEach(function(a){d=Math.ceil(a.minValue);h=Math.floor(a.maxValue);for(var b=d;b<h;b++)k.push([b,a.symbol.color.r,a.symbol.color.g,a.symbol.color.b,1<a.symbol.color.a?a.symbol.color.a:Math.round(255*a.symbol.color.a)])});k.push([e.maxValue,e.symbol.color.r,e.symbol.color.g,e.symbol.color.b,1<e.symbol.color.a?e.symbol.color.a:Math.round(255*e.symbol.color.a)]);b=l.createColormapLUT({colormap:k,fillUnspecified:!1});this.lookup={rendererJson:a.toJSON(),
colormapLut:b};return this.canRenderInWebGL=!0};f.prototype._updateStretchRenderer=function(a){if(!(a.statistics||this.rasterInfo.statistics||a.dynamicRangeAdjustment))return!1;var b=a.histograms||this.rasterInfo.histograms;if(!a.dynamicRangeAdjustment&&"percent-clip"===a.stretchType&&!b)return!1;var e=a.gamma,c=a.useGamma,b=a.colorRamp,k=this.rasterInfo.pixelType;if(!a.dynamicRangeAdjustment&&-1<["u8","u16","s8","s16"].indexOf(k)){var d=this.getStretchCutoff(a),e=l.createStretchLUT(g.__assign(g.__assign({pixelType:k},
d),{gamma:c?e:null}));this.lookup={rendererJson:a.toJSON(),stretchLut:e}}b&&(b=w.convertColorRampToColormap(b,256),this.lookup||(this.lookup={rendererJson:a.toJSON()}),this.lookup.colormapLut=l.createColormapLUT({colormap:b}),this.lookup.rendererJson=a.toJSON());return this.canRenderInWebGL=!0};f.prototype.getStretchCutoff=function(a,b,e){var c,k,d=a.stretchType;a.dynamicRangeAdjustment?"min-max"===d&&b.statistics?c=b.statistics.map(function(a){return[a.minValue,a.maxValue,0,0]}):(k=l.estimateStatisticsHistograms(b),
c=k.statistics,k=k.histograms):(c=a.statistics&&0<a.statistics.length?a.statistics:this.rasterInfo.statistics,k=a.histograms||this.rasterInfo.histograms);var h=c||k?(c||k).length:this.rasterInfo.bandCount;b=[];var f=[],g,p,q,m,n;c[0]instanceof Array||(c=c.map(function(a){return[a.min,a.max,a.avg,a.stddev]}));switch(d){case "none":for(d=0;d<h;d++)b[d]="u8"===this.rasterInfo.pixelType?0:c?c[d][0]:0,f[d]="u8"===this.rasterInfo.pixelType?255:c?c[d][1]:255;break;case "min-max":for(d=0;d<h;d++)b[d]=c[d][0],
f[d]=c[d][1];break;case "standard-deviation":for(d=0;d<h;d++)b[d]=c[d][2]-a.numberOfStandardDeviations*c[d][3],f[d]=c[d][2]+a.numberOfStandardDeviations*c[d][3],b[d]<c[d][0]&&(b[d]=c[d][0]),f[d]>c[d][1]&&(f[d]=c[d][1]);break;case "percent-clip":for(d=0;d<k.length;d++){c=k[d];q=new Uint32Array(c.size);p=c.counts;g=0;h=(c.max-c.min)/c.size;m=-.5===c.min&&1===h?.5:0;for(n=0;n<c.size;n++)g+=p[n],q[n]=g;p=a.minPercent*g/100;for(n=0;n<c.size;n++)if(q[n]>p){b[d]=c.min+h*(n+m);break}p=(1-a.maxPercent/100)*
g;for(n=c.size-2;0<=n;n--)if(q[n]<p){f[d]=c.min+h*(n+2-m);break}}break;default:for(d=0;d<h;d++)b[d]=c[d][0],f[d]=c[d][1]}return this.getSelectedBandCutoffs({minCutOff:b,maxCutOff:f,outMax:a.outputMax||255,outMin:a.outputMin||0},e)};f.prototype.getSelectedBandCutoffs=function(a,b){if(null==b||0===b.length)return a;var e=Math.max.apply(null,b),c=a.minCutOff,f=a.maxCutOff,d=a.outMin,h=a.outMax;return c.length===b.length||c.length<=e?a:{minCutOff:b.map(function(a){return c[a]}),maxCutOff:b.map(function(a){return f[a]}),
outMin:d,outMax:h}};f.prototype.generateStretchWebGLParams=function(a,b,e){var c=null,f=null,d=this.lookup&&this.lookup.colormapLut;b.colorRamp&&d&&(c=d.indexedColormap,f=d.offset);var d=b.gamma,h=!!(b.useGamma&&d&&d.some(function(a){return 1!==a})),g=this.getStretchCutoff(b,a,e);b=g.minCutOff;var l=g.maxCutOff,p=g.outMin,g=g.outMax;a&&a.pixels&&2===a.pixels.length&&(a=a.clone(),a.statistics=[a.statistics[0]],a.pixels=[a.pixels[0]]);a=Math.min(3,e&&e.length||a&&a.getPlaneCount()||this.rasterInfo.bandCount);
e=new Float32Array(a);var q=c||h?1:255,m;for(m=0;m<a;m++)e[m]=(g-p)/(l[m]-b[m])/q;var n=new Float32Array(a);if(h)for(m=0;m<a;m++)n[m]=1<d[m]?2<d[m]?6.5+Math.pow(d[m]-2,2.5):6.5+100*Math.pow(2-d[m],4):1;return{bandCount:a,outMin:p/q,outMax:g/q,minCutOff:b,maxCutOff:l,factor:e,useGamma:h,gamma:h?d:[1,1,1],gammaCorrection:h?n:[1,1,1],colormap:c,colormapOffset:f,type:"stretch"}};f.prototype.generateShadedReliefWebGLParams=function(a,b,e){var c=null,f=null,d=this.lookup&&this.lookup.colormapLut;a.colorRamp&&
d&&(c=d.indexedColormap,f=d.offset);b=g.__assign(g.__assign({},a.toJSON()),{isGCS:b,resolution:e});b=u.calculateHillshadeParams(b);e=this.rasterInfo.statistics[0];return g.__assign(g.__assign({},b),{minValue:e.min,maxValue:e.max,hillshadeType:"traditional"===a.hillshadeType?0:1,type:"hillshade",colormap:c,colormapOffset:f})};f.prototype.isValidPixelBlock=function(a){return!!(a&&a.pixels&&0<a.pixels.length&&0!==a.validPixelCount)};g.__decorate([r.property({types:v.rasterRendererTypes,json:{write:!0}})],
f.prototype,"renderer",void 0);g.__decorate([r.reader("renderer")],f.prototype,"readRenderer",null);g.__decorate([r.property({type:C,json:{write:!0}})],f.prototype,"rasterInfo",void 0);g.__decorate([r.property({json:{write:!0}})],f.prototype,"lookup",void 0);g.__decorate([r.property({})],f.prototype,"canRenderInWebGL",void 0);return f=g.__decorate([r.subclass("esri.renderers.support.RasterSymbolizer")],f)}(A.JSONSupport)});