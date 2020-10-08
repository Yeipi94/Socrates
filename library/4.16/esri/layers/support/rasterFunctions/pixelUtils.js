// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","../PixelBlock"],function(O,x,F){function M(a,c){a=Math.min(Math.max(a,-100),100);c=Math.min(Math.max(c,-100),100);var e,f,d=new Uint8Array(256);for(e=0;256>e;e++)0<a&&100>a?f=(200*e-25500+510*c)/(2*(100-a))+128:0>=a&&-100<a?f=(200*e-25500+510*c)*(100+a)/2E4+128:100===a?(f=200*e-25500+256*(100-a)+510*c,f=0<f?255:0):-100===a&&(f=128),d[e]=255<f?255:0>f?0:f;return d}function L(a,c,e,f,d,n,h,k){return{xmin:d<=e*a?0:d<e*a+a?d-e*a:a,ymin:n<=f*c?0:n<f*c+c?n-f*c:c,xmax:d+h<=e*
a?0:d+h<e*a+a?d+h-e*a:a,ymax:n+k<=f*c?0:n+k<f*c+c?n+k-f*c:c}}function N(a,c,e,f){var d=a.filter(function(a){return E(a)})[0];if(null==d)return null;var n=f?f.width:c.width;f=f?f.height:c.height;var h=d.width,k=d.height,g=c.width/h;c=c.height/k;var l=e?e.x:0;e=e?e.y:0;var b=d.pixelType,m=F.getPixelArrayConstructor(b),p=d.pixels.length,d=[],q,v,t,r,w,u,z,y,A,B;for(w=0;w<p;w++){v=new m(n*f);for(u=0;u<c;u++)for(z=0;z<g;z++)if(t=a[u*g+z])for(q=t.pixels[w],B=L(h,k,z,u,l,e,n,f),y=B.ymin;y<B.ymax;y++)for(t=
(u*k+y-e)*n+(z*h-l),r=y*h,A=B.xmin;A<B.xmax;A++)v[t+A]=q[r+A];d.push(v)}var x;if(a.some(function(a){return null==a||a.mask&&0<a.mask.length}))for(x=new Uint8Array(n*f),u=0;u<c;u++)for(z=0;z<g;z++)if(m=(t=a[u*g+z])?t.mask:null,B=L(h,k,z,u,l,e,n,f),m)for(y=B.ymin;y<B.ymax;y++)for(t=(u*k+y-e)*n+(z*h-l),r=y*h,A=B.xmin;A<B.xmax;A++)x[t+A]=m[r+A];else if(t)for(y=B.ymin;y<B.ymax;y++)for(t=(u*k+y-e)*n+(z*h-l),r=y*h,A=B.xmin;A<B.xmax;A++)x[t+A]=1;else for(y=B.ymin;y<B.ymax;y++)for(t=(u*k+y-e)*n+(z*h-l),r=
y*h,A=B.xmin;A<B.xmax;A++)x[t+A]=0;a=new F({width:n,height:f,pixels:d,pixelType:b,mask:x});a.updateStatistics();return a}Object.defineProperty(x,"__esModule",{value:!0});var E=function(a){return a&&"esri.layers.support.PixelBlock"===a.declaredClass&&a.pixels&&0<a.pixels.length};x.extractBands=function(a,c){if(!c||!E(a))return a;var e=a.pixels.length;return c&&c.some(function(a){return a>=e})||1===e&&1===c.length&&0===c[0]||e===c.length&&!c.some(function(a,c){return a!==c})?a:new F({pixelType:a.pixelType,
width:a.width,height:a.height,mask:a.mask,validPixelCount:a.validPixelCount,maskIsAlpha:a.maskIsAlpha,pixels:c.map(function(c){return a.pixels[c]}),statistics:a.statistics&&c.map(function(c){return a.statistics[c]})})};x.createColormapLUT=function(a){if(a){var c=a.colormap;if(c&&0!==c.length){var c=c.sort(function(a,b){return a[0]-b[0]}),e=0;0>c[0][0]&&(e=c[0][0]);var f=Math.max(256,c[c.length-1][0]-e+1),d=new Uint8Array(4*f),n=[],h=0,k=0,g=5===c[0].length;if(65536<f)return c.forEach(function(a){n[a[0]-
e]=g?a.slice(1):a.slice(1).concat([255])}),{indexed2DColormap:n,offset:e,alphaSpecified:g};if(a.fillUnspecified)for(a=c[k],h=a[0]-e;h<f;h++)d[4*h]=a[1],d[4*h+1]=a[2],d[4*h+2]=a[3],d[4*h+3]=g?a[4]:255,h===a[0]-e&&(a=k===c.length-1?a:c[++k]);else for(h=0;h<c.length;h++)a=c[h],k=4*(a[0]-e),d[k]=a[1],d[k+1]=a[2],d[k+2]=a[3],d[k+3]=g?a[4]:255;return{indexedColormap:d,offset:e,alphaSpecified:g}}}};x.colorize=function(a,c){if(!E(a)||!c&&(c.indexedColormap||c.indexed2DColormap))return a;var e=a.clone(),f=
e.pixels,d=e.mask,n=e.width*e.height;if(1!==f.length)return a;var h=c.indexedColormap;a=c.indexed2DColormap;var k=c.offset;c=c.alphaSpecified;var g=h.length-1,l=0,f=f[0],b=new Uint8Array(f.length),m=new Uint8Array(f.length),p=new Uint8Array(f.length),q=0;if(h)if(d)for(l=0;l<n;l++)d[l]&&(q=4*(f[l]-k),q<k||q>g?d[l]=0:(b[l]=h[q],m[l]=h[q+1],p[l]=h[q+2],d[l]=h[q+3]));else{d=new Uint8Array(n);for(l=0;l<n;l++)q=4*(f[l]-k),q<k||q>g?d[l]=0:(b[l]=h[q],m[l]=h[q+1],p[l]=h[q+2],d[l]=h[q+3]);e.mask=d}else if(d)for(l=
0;l<n;l++)d[l]&&(h=a[f[l]],b[l]=h[0],m[l]=h[1],p[l]=h[2],d[l]=h[3]);else{d=new Uint8Array(n);for(l=0;l<n;l++)h=a[f[l]],b[l]=h[0],m[l]=h[1],p[l]=h[2],d[l]=h[3];e.mask=d}e.pixels=[b,m,p];e.statistics=null;e.pixelType="u8";e.maskIsAlpha=c;return e};x.estimateStatisticsHistograms=function(a){if(!E(a))return null;a.statistics||a.updateStatistics();var c=a.pixels,e=a.mask,f=a.pixelType,d=a.statistics;a=a.width*a.height;var n=c.length,h,k,g,l,b,m=[],p=[],q,v,t;for(l=0;l<n;l++){q=new Uint32Array(256);t=c[l];
if("u8"===f)if(h=-.5,k=255.5,e)for(b=0;b<a;b++)e[b]&&q[t[b]]++;else for(b=0;b<a;b++)q[t[b]]++;else{h=d[l].minValue;k=d[l].maxValue;g=(k-h)/256;v=new Uint32Array(257);if(e)for(b=0;b<a;b++)e[b]&&v[Math.floor((t[b]-h)/g)]++;else for(b=0;b<a;b++)v[Math.floor((t[b]-h)/g)]++;for(b=0;255>b;b++)q[b]=v[b];q[255]=v[255]+v[256]}m.push({min:h,max:k,size:256,counts:q});for(b=t=v=g=0;256>b;b++)g+=q[b],v+=b*q[b];v/=g;for(b=0;256>b;b++)t+=q[b]*Math.pow(b-v,2);q=Math.sqrt(t/(g-1));g=(k-h)/256;b=(v+.5)*g+h;q*=g;p.push({min:h,
max:k,avg:b,stddev:q})}return{statistics:p,histograms:m}};x.createStretchLUT=function(a){var c=a.minCutOff,e=a.maxCutOff,f=a.gamma,d=a.pixelType,n=a.outMin||0,h=a.outMax||255;if(-1===["u8","u16","s8","s16"].indexOf(d))return null;var k=c.length,g,l=0;"s8"===d?l=-127:"s16"===d&&(l=-32767);var b=256;-1<["u16","s16"].indexOf(d)&&(b=65536);for(var m=[],p=h-n,d=0;d<k;d++)m[d]=e[d]-c[d];g=f&&f.length>=k;var q=[];if(g)for(d=0;d<k;d++)q[d]=1<f[d]?2<f[d]?6.5+Math.pow(f[d]-2,2.5):6.5+100*Math.pow(2-f[d],4):
1;var v,t=[],r,w,u;if(g)for(d=0;d<k;d++){u=[];for(g=0;g<b;g++)r=g+l,v=(r-c[d])/m[d],w=1,1<f[d]&&(w-=Math.pow(1/p,v*q[d])),u[g]=r<e[d]&&r>c[d]?Math.floor(w*p*Math.pow(v,1/f[d]))+n:r>=e[d]?h:n;t[d]=u}else for(d=0;d<k;d++){u=[];for(g=0;g<b;g++)r=g+l,u[g]=r<=c[d]?n:r>=e[d]?h:Math.floor((r-c[d])/m[d]*p)+n;t[d]=u}if(null!=a.contrastOffset)for(a=M(a.contrastOffset,a.brightnessOffset),d=0;d<k;d++)for(u=t[d],g=0;g<b;g++)u[g]=a[u[g]];return{lut:t,offset:l}};x.createContrastBrightnessLUT=M;x.stretch=function(a,
c){if(!E(a))return null;a=a.clone();var e=a.pixels,f=a.mask,d=c.minCutOff,n=c.maxCutOff,h=c.gamma,k=c.outMin||0;c=c.outMax||255;var g=a.width*a.height,l=e.length,b,m,p,q,v,t=c-k,r=[];for(b=0;b<l;b++)r[b]=n[b]-d[b];m=h&&h.length>=l;var w=[];if(m)for(b=0;b<l;b++)w[b]=1<h[b]?2<h[b]?6.5+Math.pow(h[b]-2,2.5):6.5+100*Math.pow(2-h[b],4):1;if(m)if(null!=f)for(m=0;m<g;m++){if(f[m])for(b=0;b<l;b++)p=e[b][m],v=(p-d[b])/r[b],q=1,1<h[b]&&(q-=Math.pow(1/t,v*w[b])),e[b][m]=p<n[b]&&p>d[b]?Math.floor(q*t*Math.pow(v,
1/h[b]))+k:p>=n[b]?c:k}else for(m=0;m<g;m++)for(b=0;b<l;b++)p=e[b][m],v=(p-d[b])/r[b],q=1,1<h[b]&&(q-=Math.pow(1/t,v*w[b])),e[b][m]=p<n[b]&&p>d[b]?Math.floor(q*t*Math.pow(v,1/h[b]))+k:p>=n[b]?c:k;else if(null!=f)for(m=0;m<g;m++){if(f[m])for(b=0;b<l;b++)p=e[b][m],e[b][m]=p<n[b]&&p>d[b]?Math.floor((p-d[b])/r[b]*t)+k:p>=n[b]?c:k}else for(m=0;m<g;m++)for(b=0;b<l;b++)p=e[b][m],e[b][m]=p<n[b]&&p>d[b]?Math.floor((p-d[b])/r[b]*t)+k:p>=n[b]?c:k;a.pixelType="u8";a.updateStatistics();return a};x.lookupPixels=
function(a,c){if(!E(a))return null;var e=a.pixels,f=a.mask,d=a.width*a.height,n=e.length,h=c.lut;c=c.offset;var k,g;h&&1===h[0].length&&(h=e.map(function(){return h}));var l=[],b,m,p;if(c)if(null==f)for(k=0;k<n;k++){b=e[k];m=h[k];p=new Uint8Array(d);for(g=0;g<d;g++)p[g]=m[b[g]-c];l.push(p)}else for(k=0;k<n;k++){b=e[k];m=h[k];p=new Uint8Array(d);for(g=0;g<d;g++)f[g]&&(p[g]=m[b[g]-c]);l.push(p)}else if(null==f)for(k=0;k<n;k++){b=e[k];m=h[k];p=new Uint8Array(d);for(g=0;g<d;g++)p[g]=m[b[g]];l.push(p)}else for(k=
0;k<n;k++){b=e[k];m=h[k];p=new Uint8Array(d);for(g=0;g<d;g++)f[g]&&(p[g]=m[b[g]]);l.push(p)}a=new F({width:a.width,height:a.height,pixels:l,mask:f,pixelType:"u8"});a.updateStatistics();return a};x.remapColor=function(a,c){if(!E(a))return null;a=a.clone();var e=a.width*a.height,f=c.length,d=Math.floor(f/2),n=c[Math.floor(d)],h=a.pixels[0],k,g,l,b,m,p,q=!1,v=new Uint8Array(e),t=new Uint8Array(e),r=new Uint8Array(e),w=a.mask,u=4===c[0].mappedColor.length;w||(w=new Uint8Array(e),w.fill(u?255:1),a.mask=
w);for(m=0;m<e;m++)if(w[m]){k=h[m];q=!1;p=d;g=n;l=0;for(b=f-1;1<b-l;){if(k===g.value){q=!0;break}k>g.value?l=p:b=p;p=Math.floor((l+b)/2);g=c[Math.floor(p)]}q||(k===c[l].value?(g=c[l],q=!0):k===c[b].value?(g=c[b],q=!0):k<c[l].value?(q=!1,g=null):k>c[l].value&&(k<c[b].value?(g=c[l],q=!0):b===f-1?(q=!1,g=null):(g=c[b],q=!0)));q?(v[m]=g.mappedColor[0],t[m]=g.mappedColor[1],r[m]=g.mappedColor[2],w[m]=g.mappedColor[3]):v[m]=t[m]=r[m]=w[m]=0}a.pixels=[v,t,r];a.mask=w;a.pixelType="u8";a.maskIsAlpha=u;return a};
x.getClipBounds=L;x.mosaicPixelData=function(a,c){if(!a||0===a.length)return null;var e=a.filter(function(a){return a.pixelBlock})[0];if(!e)return null;var f=(e.extent.xmax-e.extent.xmin)/e.pixelBlock.width,d=(e.extent.ymax-e.extent.ymin)/e.pixelBlock.height,n=.01*Math.min(f,d),h=a.sort(function(a,b){return Math.abs(a.extent.ymax-b.extent.ymax)>n?b.extent.ymax-a.extent.ymax:Math.abs(a.extent.xmin-b.extent.xmin)>n?a.extent.xmin-b.extent.xmin:0}),k=Math.min.apply(null,h.map(function(a){return a.extent.xmin})),
g=Math.min.apply(null,h.map(function(a){return a.extent.ymin})),l=Math.max.apply(null,h.map(function(a){return a.extent.xmax})),b=Math.max.apply(null,h.map(function(a){return a.extent.ymax}));a={x:Math.round((c.xmin-k)/f),y:Math.round((b-c.ymax)/d)};k={width:Math.round((l-k)/f),height:Math.round((b-g)/d)};f={width:Math.round((c.xmax-c.xmin)/f),height:Math.round((c.ymax-c.ymin)/d)};if(Math.round(k.width/e.pixelBlock.width)*Math.round(k.height/e.pixelBlock.height)!==h.length||0>a.x||0>a.y||k.width<
f.width||k.height<f.height)return null;e=h.map(function(a){return a.pixelBlock});e=N(e,k,a,f);return{extent:c,pixelBlock:e}};x.mosaic=N;x.setValidBoundary=function(a,c,e){if(!E(a))return null;var f=a.width,d=a.height,n=c.x;c=c.y;var h=e.width+n;e=e.height+c;if(0>n||0>c||h>f||e>d||0===n&&0===c&&h===f&&e===d)return a;a.mask||(a.mask=new Uint8Array(f*d));for(var k=a.mask,g=0;g<d;g++)for(var l=g*f,b=0;b<f;b++)k[l+b]=g<c||g>=e||b<n||b>=h?0:1;a.updateStatistics();return a};x.clip=function(a,c,e){if(!E(a))return null;
var f=c.x,d=c.y,n=c.x+e.width;c=c.x+e.height;if(c===a.height&&n===a.width)return a;for(var h=a.pixels,k=a.mask,g=a.width,l=g*a.height,b=h.length,m=[],p=0;p<b;p++){for(var q=h[p],v=F.createEmptyBand(a.pixelType,l),t=0,r=d;r<=c;r++)for(var w=r*g,u=f;u<=n;u++)v[t++]=q[w+u];m.push(v)}var z;if(k)for(z=new Uint8Array(e.width*e.height),t=0,r=d;r<=c;r++)for(w=r*g,u=f;u<=n;u++)z[t++]=k[w+u];a=new F({width:e.width,height:e.height,pixels:m,mask:z});a.updateStatistics();return a};x.approximateTransform=function(a,
c,e,f){if(!E(a))return null;var d=a.pixels,n=a.mask,h=a.pixelType,k=a.width,g=a.height;a=F.getPixelArrayConstructor(h);var l=d.length,b=c.width,m=c.height;c=f.cols;var p=f.rows,q=Math.ceil(b/c),v=Math.ceil(m/p),t=!1;for(f=0;f<e.length;f+=3)-1===e[f]&&-1===e[f+1]&&-1===e[f+2]&&(t=!0);var r,w,u,z,y,A,B,x=new Float32Array(b*m),J=new Float32Array(b*m),G=0,H,I;for(f=0;f<v;f++)for(var K=0;K<q;K++){r=12*(f*q+K);w=e[r];u=e[r+1];z=e[r+2];y=e[r+3];A=e[r+4];B=e[r+5];for(var C=0;C<p;C++){G=(f*p+C)*b+K*c;I=(C+
.5)/p;for(var D=0;D<C;D++)H=(D+.5)/c,x[G+D]=Math.round((w*H+u*I+z)*k-.5),J[G+D]=Math.round((y*H+A*I+B)*g-.5)}r+=6;w=e[r];u=e[r+1];z=e[r+2];y=e[r+3];A=e[r+4];B=e[r+5];for(C=0;C<p;C++)for(G=(f*p+C)*b+K*c,I=(C+.5)/p,D=C;D<c;D++)H=(D+.5)/c,x[G+D]=Math.round((w*H+u*I+z)*k-.5),J[G+D]=Math.round((y*H+A*I+B)*g-.5)}e=function(a,c){for(var d=0;d<m;d++){r=d*b;for(var e=0;e<b;e++)a[r]=t&&(0>x[r]||0>J[r])?0:c[x[r]+J[r]*k],r++}};g=[];for(f=0;f<l;f++)c=new a(b*m),e(c,d[f]),g.push(c);d=new F({width:b,height:m,pixelType:h,
pixels:g});if(n)d.mask=new Uint8Array(b*m),e(d.mask,n);else if(t)for(d.mask=new Uint8Array(b*m),f=0;f<b*m;f++)d.mask[f]=0>x[f]||0>J[f]?0:1;d.updateStatistics();return d}});