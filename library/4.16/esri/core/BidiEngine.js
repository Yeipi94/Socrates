// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","./bidiEngineTables"],function(F,G,e){function x(b,a,f,e,c){var g=b;void 0===a&&(a=c.defInFormat);void 0===f&&(f=c.defOutFormat);void 0===e&&(e=c.defSwap);if(a!==f){var d=a.substring(0,1),h=f.substring(0,1),l;l=a.substring(1,4);var k=f.substring(1,4);"C"===l.charAt(0)&&(l=A(g),l="ltr"===l||"rtl"===l?l.toUpperCase():"L"===a.charAt(2)?"LTR":"RTL",a=d+l);"C"===k.charAt(0)&&(l=A(g),"rtl"===l?k="RTL":"ltr"===l?(g=g.split(""),g.reverse(),l=A(g.join("")),k=l.toUpperCase()):k=
"L"===f.charAt(2)?"LTR":"RTL",f=h+k)}if(a===f)return b;h=a.substring(0,1);g=a.substring(1,4);d=f.substring(0,1);k=f.substring(1,4);c.inFormat=a;c.outFormat=f;c.swap=e;if("L"===h&&"VLTR"===f){if("LTR"===g)return c.dir=w,u(b,c);if("RTL"===g)return c.dir=y,u(b,c)}if("V"===h&&"V"===d)return c.dir="RTL"===g?y:w,D(b,c);if("L"===h&&"VRTL"===f)return c.dir="LTR"===g?w:y,b=u(b,c),D(b);if("VLTR"===a&&"LLTR"===f)return c.dir=w,u(b,c);if("V"===h&&"L"===d&&g!==k)return b=D(b),"RTL"===g?x(b,"LLTR","VLTR",e,c):
x(b,"LRTL","VRTL",e,c);if("VRTL"===a&&"LRTL"===f)return x(b,"LRTL","VRTL",e,c);"L"===h&&"L"===d&&(a=c.swap,c.swap=a.substr(0,1)+"N","RTL"===g?(c.dir=y,b=u(b,c),c.swap="N"+a.substr(1,2),c.dir=w,b=u(b,c)):(c.dir=w,b=u(b,c),c.swap="N"+a.substr(1,2),b=x(b,"VLTR","LRTL",c.swap,c)));return b}function A(b){return(b=/[A-Za-z\u05d0-\u065f\u066a-\u06ef\u06fa-\u07ff\ufb1d-\ufdff\ufe70-\ufefc]/.exec(b))?"z">=b[0]?"ltr":"rtl":""}function u(b,a){b=b.split("");var f=[];H(b,f,a);if(0!==a.hiLevel&&a.swap.substr(0,
1)!==a.swap.substr(1,2))for(var h=0;h<b.length;h++)if(1===f[h]){var c=h,g;b:{g=b[h];for(var d=void 0,t=0,l=e.SwapTable.length-1;t<=l;)if(d=Math.floor((t+l)/2),g<e.SwapTable[d][0])l=d-1;else if(g>e.SwapTable[d][0])t=d+1;else{g=e.SwapTable[d][1];break b}}b[c]=g}I(2,b,f,a);I(1,b,f,a);B=f;return b.join("")}function H(b,a,f){var h=b.length,c=f.dir?e.impTabRtl:e.impTabLtr,g=null,d=null,t=null,g=0,d=d=null,l=-1,k=d=null,p=[],m=[];f.hiLevel=f.dir;f.lastArabic=!1;f.hasUbatAl=!1;f.hasUbatB=!1;f.hasUbatS=!1;
for(d=0;d<h;d++){var k=d,t=b[d].charCodeAt(0),n=e.MasterTable[t>>8];p[k]=n<e.TBBASE?n:e.UnicodeTable[n-e.TBBASE][t&255]}for(k=0;k<h;k++){m[k]=d=P(b,p,m,k,f);g=c[g][d];d=g&240;g&=15;a[k]=t=c[g][Q];if(0<d){if(16===d)for(d=l;d<k;d++)a[d]=1;l=-1}if(d=c[g][R])-1===l&&(l=k);else if(-1<l){for(d=l;d<k;d++)a[d]=t;l=-1}p[k]===e.UBAT_B&&(a[k]=0);f.hiLevel|=t}if(f.hasUbatS)for(b=0;b<h;b++)if(p[b]===e.UBAT_S)for(a[b]=f.dir,c=b-1;0<=c;c--)if(p[c]===e.UBAT_WS)a[c]=f.dir;else break}function D(b,a){b=b.split("");
if(a){var f=[];H(b,f,a);B=f}b.reverse();q.reverse();return b.join("")}function J(b){for(var a=0;a<e.ArabicAlefBetIntervalsBegine.length;a++)if(b>=e.ArabicAlefBetIntervalsBegine[a]&&b<=e.ArabicAlefBetIntervalsEnd[a])return!0;return!1}function K(b,a,f,e){for(;a*f<e&&z(b[a]);)a+=f;return a*f<e&&J(b[a])?!0:!1}function I(b,a,f,e){if(!(e.hiLevel<b))if(1!==b||e.dir!==y||e.hasUbatB){e=a.length;for(var c=0,g,d,h;c<e;){if(f[c]>=b){for(g=c+1;g<e&&f[g]>=b;)g++;for(d=g-1;c<d;c++,d--)h=a[c],a[c]=a[d],a[d]=h,h=
q[c],q[c]=q[d],q[d]=h;c=g}c++}}else a.reverse(),q.reverse()}function P(b,a,f,h,c){return{UBAT_L:function(){c.lastArabic=!1;return e.UBAT_L},UBAT_R:function(){c.lastArabic=!1;return e.UBAT_R},UBAT_ON:function(){return e.UBAT_ON},UBAT_AN:function(){return e.UBAT_AN},UBAT_EN:function(){return c.lastArabic?e.UBAT_AN:e.UBAT_EN},UBAT_AL:function(){c.lastArabic=!0;c.hasUbatAl=!0;return e.UBAT_R},UBAT_WS:function(){return e.UBAT_ON},UBAT_CS:function(){var b,d;if(1>h||h+1>=a.length||(b=f[h-1])!==e.UBAT_EN&&
b!==e.UBAT_AN||(d=a[h+1])!==e.UBAT_EN&&d!==e.UBAT_AN)return e.UBAT_ON;c.lastArabic&&(d=e.UBAT_AN);return d===b?d:e.UBAT_ON},UBAT_ES:function(){return(0<h?f[h-1]:e.UBAT_B)===e.UBAT_EN&&h+1<a.length&&a[h+1]===e.UBAT_EN?e.UBAT_EN:e.UBAT_ON},UBAT_ET:function(){if(0<h&&f[h-1]===e.UBAT_EN)return e.UBAT_EN;if(c.lastArabic)return e.UBAT_ON;for(var b=h+1,d=a.length;b<d&&a[b]===e.UBAT_ET;)b++;return b<d&&a[b]===e.UBAT_EN?e.UBAT_EN:e.UBAT_ON},UBAT_NSM:function(){if("VLTR"===c.inFormat){for(var g=a.length,d=
h+1;d<g&&a[d]===e.UBAT_NSM;)d++;if(d<g&&(g=b[h].charCodeAt[0],d=a[d],(1425<=g&&2303>=g||64286===g)&&(d===e.UBAT_R||d===e.UBAT_AL)))return e.UBAT_R}return 1>h||a[h-1]===e.UBAT_B?e.UBAT_ON:f[h-1]},UBAT_B:function(){c.lastArabic=!0;c.hasUbatB=!0;return c.dir},UBAT_S:function(){c.hasUbatS=!0;return e.UBAT_ON},UBAT_LRE:function(){c.lastArabic=!1;return e.UBAT_ON},UBAT_RLE:function(){c.lastArabic=!1;return e.UBAT_ON},UBAT_LRO:function(){c.lastArabic=!1;return e.UBAT_ON},UBAT_RLO:function(){c.lastArabic=
!1;return e.UBAT_ON},UBAT_PDF:function(){c.lastArabic=!1;return e.UBAT_ON},UBAT_BN:function(){return e.UBAT_ON}}[e.TYPES_NAMES[a[h]]]()}function E(b,a){for(var f=0;f<e.BaseForm.length;f++)if(b===e.BaseForm[f])return a[f];return b}function z(b){return"\u064b"<=b&&"\u0655">=b?!0:!1}function L(b){return"L"===b?"LTR":"R"===b?"RTL":"C"===b?"CLR":"D"===b?"CRL":""}function M(b,a){for(var f=0;f<e.AlefTable.length;f++)if(b===e.AlefTable[f])return a[f];return b}function N(b,a,e,h){for(var c=0;c<b.length;c++)if(b[c]>
a||!e&&b[c]===a)b[c]+=h}Object.defineProperty(G,"__esModule",{value:!0});F=function(){function b(){this.inputFormat="ILYNN";this.outputFormat="VLNNN";this.sourceToTarget=[];this.targetToSource=[];this.levels=[]}b.prototype.bidiTransform=function(a,b,h){this.sourceToTarget=[];this.targetToSource=[];if(!a)return"";var c=this.sourceToTarget,g=this.targetToSource,d=a.length;q=[];B=[];for(var f=0;f<d;f++)c[f]=f,g[f]=f,q[f]=f;if(!this.checkParameters(b,h))return a;b=this.inputFormat;h=this.outputFormat;
var c=a,c=S,f=L(b.charAt(1)),g=L(h.charAt(1)),l="I"===b.charAt(0)?"L":b.charAt(0),d="I"===h.charAt(0)?"L":h.charAt(0),f=l+f,g=d+g,d=b.charAt(2)+h.charAt(2);c.defInFormat=f;c.defOutFormat=g;c.defSwap=d;a=x(a,f,g,d,c);c=!1;if("R"===h.charAt(1))c=!0;else if("C"===h.charAt(1)||"D"===h.charAt(1))c="rtl"===this.checkContextual(a);g=this.sourceToTarget=q;d=Array(g.length);for(f=0;f<g.length;f++)d[g[f]]=f;C=this.targetToSource=d;if(b.charAt(3)===h.charAt(3))c=a;else if("S"===h.charAt(3))if(b=c,h=!0,0===a.length)c=
"";else{void 0===b&&(b=!0);void 0===h&&(h=!0);a=String(a);a=a.split("");var k=0,g=1,c=a.length;b||(k=a.length-1,g=-1,c=1);for(var d=c,f=h,p=0,c=[],l=0;k*g<d;k+=g)if(J(a[k])||z(a[k])){var m;if(m="\u0644"===a[k])b:{for(var n=a,r=k+g,v=g,u=d;r*v<u&&z(n[r]);)r+=v;m=" ";if(r*v<u)for(m=n[r],n=0;n<e.AlefTable.length;n++)if(e.AlefTable[n]===m){m=!0;break b}m=!1}if(m){a[k]=0===p?M(a[k+g],e.LamAlefInialTableFE):M(a[k+g],e.LamAlefMedialTableFE);k+=g;p=a;m=k;n=g;for(r=d;m*n<r&&z(p[m]);)m+=n;m*n<r&&(p[m]=" ");
f&&(c[l]=k,l++);p=0}else{m=a[k];if(1===p){n=k;if(K(a,k+g,g,d))b:for(r=a[k],v=0;v<e.BaseForm.length;v++){if(r===e.BaseForm[v]){r=e.MedialForm[v];break b}}else r=E(a[k],e.FinalForm);a[n]=r}else!0===K(a,k+g,g,d)?a[k]=E(a[k],e.InitialForm):a[k]=E(a[k],e.IsolatedForm);z(m)||(p=1);b:{for(n=0;n<e.StandAlonForm.length;n++)if(e.StandAlonForm[n]===m){m=!0;break b}m=!1}!0===m&&(p=0)}}else p=0;g="";for(d=0;d<a.length;d++){if(f=h){b:{for(f=0;f<c.length;f++)if(c[f]===d)break b;f=-1}f=-1<f}f?(N(C,d,!b,-1),q.splice(d,
1)):g+=a[d]}c=g}else if(b=a,h=c,a=!0,0===b.length)c="";else for(void 0===a&&(a=!0),void 0===h&&(h=!0),b=String(b),c="",g=b.split(""),d=0;d<b.length;d++)f=!1,"\ufe70"<=g[d]&&"\ufeff">g[d]?(l=b.charCodeAt(d),"\ufef5"<=g[d]&&"\ufefc">=g[d]?(h?(0<d&&a&&" "===g[d-1]?c=c.substring(0,c.length-1)+"\u0644":(c+="\u0644",f=!0),c+=e.AlefTable[(l-65269)/2]):(c+=e.AlefTable[(l-65269)/2],c+="\u0644",d+1<b.length&&a&&" "===g[d+1]?d++:f=!0),f&&(N(C,d,!0,1),q.splice(d,0,q[d]))):c+=e.FETo06Table[l-65136]):c+=g[d];this.sourceToTarget=
q;this.targetToSource=C;this.levels=B;return c};b.prototype._inputFormatSetter=function(a){if(!O.test(a))throw Error("dojox/string/BidiEngine: the bidi layout string is wrong!");this.inputFormat=a};b.prototype._outputFormatSetter=function(a){if(!O.test(a))throw Error("dojox/string/BidiEngine: the bidi layout string is wrong!");this.outputFormat=a};b.prototype.checkParameters=function(a,b){a?this._inputFormatSetter(a):a=this.inputFormat;b?this._outputFormatSetter(b):b=this.outputFormat;return a===
b?!1:!0};b.prototype.checkContextual=function(a){a=A(a);if("ltr"!==a&&"rtl"!==a){try{a=document.dir.toLowerCase()}catch(f){}"ltr"!==a&&"rtl"!==a&&(a="ltr")}return a};b.prototype.hasBidiChar=function(a){return T.test(a)};return b}();G.default=F;var q=[],C=[],B=[],S={dir:0,defInFormat:"LLTR",defoutFormat:"VLTR",defSwap:"YN",inFormat:"LLTR",outFormat:"VLTR",swap:"YN",hiLevel:0,lastArabic:!1,hasUbatAl:!1,hasBlockSep:!1,hasSegSep:!1,defOutFormat:""},Q=5,R=6,w=0,y=1,O=/^[(I|V)][(L|R|C|D)][(Y|N)][(S|N)][N]$/,
T=/[\u0591-\u06ff\ufb1d-\ufefc]/});