//>>built
define(["dojo","dojox","dojox/math/BigInteger"],function(v,w){function A(a,b){return a&b}function u(a,b){return a|b}function x(a,b){return a^b}function y(a,b){return a&~b}function p(){}function z(a){return a}function r(a){this.r2=k();this.q3=k();m.ONE._dlShiftTo(2*a.t,this.r2);this.mu=this.r2.divide(a);this.m=a}v.experimental("dojox.math.BigInteger-ext");var m=w.math.BigInteger,k=m._nbi,t=m._nbv,B=m._nbits,C=m._Montgomery;p.prototype.convert=z;p.prototype.revert=z;p.prototype.mulTo=function(a,b,c){a._multiplyTo(b,
c)};p.prototype.sqrTo=function(a,b){a._squareTo(b)};r.prototype.convert=function(a){if(0>a.s||a.t>2*this.m.t)return a.mod(this.m);if(0>a.compareTo(this.m))return a;var b=k();a._copyTo(b);this.reduce(b);return b};r.prototype.revert=function(a){return a};r.prototype.reduce=function(a){a._drShiftTo(this.m.t-1,this.r2);a.t>this.m.t+1&&(a.t=this.m.t+1,a._clamp());this.mu._multiplyUpperTo(this.r2,this.m.t+1,this.q3);for(this.m._multiplyLowerTo(this.q3,this.m.t+1,this.r2);0>a.compareTo(this.r2);)a._dAddOffset(1,
this.m.t+1);for(a._subTo(this.r2,a);0<=a.compareTo(this.m);)a._subTo(this.m,a)};r.prototype.mulTo=function(a,b,c){a._multiplyTo(b,c);this.reduce(c)};r.prototype.sqrTo=function(a,b){a._squareTo(b);this.reduce(b)};var l=[2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113,127,131,137,139,149,151,157,163,167,173,179,181,191,193,197,199,211,223,227,229,233,239,241,251,257,263,269,271,277,281,283,293,307,311,313,317,331,337,347,349,353,359,367,373,379,383,389,397,
401,409,419,421,431,433,439,443,449,457,461,463,467,479,487,491,499,503,509],D=67108864/l[l.length-1];v.extend(m,{_chunkSize:function(a){return Math.floor(Math.LN2*this._DB/Math.log(a))},_toRadix:function(a){null==a&&(a=10);if(0==this.signum()||2>a||36<a)return"0";var b=this._chunkSize(a),b=Math.pow(a,b),c=t(b),d=k(),e=k(),g="";for(this._divRemTo(c,d,e);0<d.signum();)g=(b+e.intValue()).toString(a).substr(1)+g,d._divRemTo(c,d,e);return e.intValue().toString(a)+g},_fromRadix:function(a,b){this._fromInt(0);
null==b&&(b=10);for(var c=this._chunkSize(b),d=Math.pow(b,c),e=!1,g=0,f=0,h=0;h<a.length;++h){var k=this._intAt(a,h);0>k?"-"==a.charAt(h)&&0==this.signum()&&(e=!0):(f=b*f+k,++g>=c&&(this._dMultiply(d),this._dAddOffset(f,0),f=g=0))}0<g&&(this._dMultiply(Math.pow(b,g)),this._dAddOffset(f,0));e&&m.ZERO._subTo(this,this)},_fromNumber:function(a,b,c){if("number"==typeof b)if(2>a)this._fromInt(1);else for(this._fromNumber(a,c),this.testBit(a-1)||this._bitwiseTo(m.ONE.shiftLeft(a-1),u,this),this._isEven()&&
this._dAddOffset(1,0);!this.isProbablePrime(b);)this._dAddOffset(2,0),this.bitLength()>a&&this._subTo(m.ONE.shiftLeft(a-1),this);else{c=[];var d=a&7;c.length=(a>>3)+1;b.nextBytes(c);c[0]=0<d?c[0]&(1<<d)-1:0;this._fromString(c,256)}},_bitwiseTo:function(a,b,c){var d,e,g=Math.min(a.t,this.t);for(d=0;d<g;++d)c[d]=b(this[d],a[d]);if(a.t<this.t){e=a.s&this._DM;for(d=g;d<this.t;++d)c[d]=b(this[d],e);c.t=this.t}else{e=this.s&this._DM;for(d=g;d<a.t;++d)c[d]=b(e,a[d]);c.t=a.t}c.s=b(this.s,a.s);c._clamp()},
_changeBit:function(a,b){a=m.ONE.shiftLeft(a);this._bitwiseTo(a,b,a);return a},_addTo:function(a,b){for(var c=0,d=0,e=Math.min(a.t,this.t);c<e;)d+=this[c]+a[c],b[c++]=d&this._DM,d>>=this._DB;if(a.t<this.t){for(d+=a.s;c<this.t;)d+=this[c],b[c++]=d&this._DM,d>>=this._DB;d+=this.s}else{for(d+=this.s;c<a.t;)d+=a[c],b[c++]=d&this._DM,d>>=this._DB;d+=a.s}b.s=0>d?-1:0;0<d?b[c++]=d:-1>d&&(b[c++]=this._DV+d);b.t=c;b._clamp()},_dMultiply:function(a){this[this.t]=this.am(0,a-1,this,0,0,this.t);++this.t;this._clamp()},
_dAddOffset:function(a,b){for(;this.t<=b;)this[this.t++]=0;for(this[b]+=a;this[b]>=this._DV;)this[b]-=this._DV,++b>=this.t&&(this[this.t++]=0),++this[b]},_multiplyLowerTo:function(a,b,c){var d=Math.min(this.t+a.t,b);c.s=0;for(c.t=d;0<d;)c[--d]=0;var e;for(e=c.t-this.t;d<e;++d)c[d+this.t]=this.am(0,a[d],c,d,0,this.t);for(e=Math.min(a.t,b);d<e;++d)this.am(0,a[d],c,d,0,b-d);c._clamp()},_multiplyUpperTo:function(a,b,c){--b;var d=c.t=this.t+a.t-b;for(c.s=0;0<=--d;)c[d]=0;for(d=Math.max(b-this.t,0);d<a.t;++d)c[this.t+
d-b]=this.am(b-d,a[d],c,0,0,this.t+d-b);c._clamp();c._drShiftTo(1,c)},_modInt:function(a){if(0>=a)return 0;var b=this._DV%a,c=0>this.s?a-1:0;if(0<this.t)if(0==b)c=this[0]%a;else for(var d=this.t-1;0<=d;--d)c=(b*c+this[d])%a;return c},_millerRabin:function(a){var b=this.subtract(m.ONE),c=b.getLowestSetBit();if(0>=c)return!1;var d=b.shiftRight(c);a=a+1>>1;a>l.length&&(a=l.length);for(var e=k(),g=0;g<a;++g){e._fromInt(l[g]);var f=e.modPow(d,this);if(0!=f.compareTo(m.ONE)&&0!=f.compareTo(b)){for(var h=
1;h++<c&&0!=f.compareTo(b);)if(f=f.modPowInt(2,this),0==f.compareTo(m.ONE))return!1;if(0!=f.compareTo(b))return!1}}return!0},clone:function(){var a=k();this._copyTo(a);return a},intValue:function(){if(0>this.s){if(1==this.t)return this[0]-this._DV;if(0==this.t)return-1}else{if(1==this.t)return this[0];if(0==this.t)return 0}return(this[1]&(1<<32-this._DB)-1)<<this._DB|this[0]},byteValue:function(){return 0==this.t?this.s:this[0]<<24>>24},shortValue:function(){return 0==this.t?this.s:this[0]<<16>>16},
signum:function(){return 0>this.s?-1:0>=this.t||1==this.t&&0>=this[0]?0:1},toByteArray:function(){var a=this.t,b=[];b[0]=this.s;var c=this._DB-a*this._DB%8,d,e=0;if(0<a--)for(c<this._DB&&(d=this[a]>>c)!=(this.s&this._DM)>>c&&(b[e++]=d|this.s<<this._DB-c);0<=a;)if(8>c?(d=(this[a]&(1<<c)-1)<<8-c,d|=this[--a]>>(c+=this._DB-8)):(d=this[a]>>(c-=8)&255,0>=c&&(c+=this._DB,--a)),0!=(d&128)&&(d|=-256),0==e&&(this.s&128)!=(d&128)&&++e,0<e||d!=this.s)b[e++]=d;return b},equals:function(a){return 0==this.compareTo(a)},
min:function(a){return 0>this.compareTo(a)?this:a},max:function(a){return 0<this.compareTo(a)?this:a},and:function(a){var b=k();this._bitwiseTo(a,A,b);return b},or:function(a){var b=k();this._bitwiseTo(a,u,b);return b},xor:function(a){var b=k();this._bitwiseTo(a,x,b);return b},andNot:function(a){var b=k();this._bitwiseTo(a,y,b);return b},not:function(){for(var a=k(),b=0;b<this.t;++b)a[b]=this._DM&~this[b];a.t=this.t;a.s=~this.s;return a},shiftLeft:function(a){var b=k();0>a?this._rShiftTo(-a,b):this._lShiftTo(a,
b);return b},shiftRight:function(a){var b=k();0>a?this._lShiftTo(-a,b):this._rShiftTo(a,b);return b},getLowestSetBit:function(){for(var a=0;a<this.t;++a)if(0!=this[a]){var b=a*this._DB;a=this[a];if(0==a)a=-1;else{var c=0;0==(a&65535)&&(a>>=16,c+=16);0==(a&255)&&(a>>=8,c+=8);0==(a&15)&&(a>>=4,c+=4);0==(a&3)&&(a>>=2,c+=2);0==(a&1)&&++c;a=c}return b+a}return 0>this.s?this.t*this._DB:-1},bitCount:function(){for(var a=0,b=this.s&this._DM,c=0;c<this.t;++c){for(var d=this[c]^b,e=0;0!=d;)d&=d-1,++e;a+=e}return a},
testBit:function(a){var b=Math.floor(a/this._DB);return b>=this.t?0!=this.s:0!=(this[b]&1<<a%this._DB)},setBit:function(a){return this._changeBit(a,u)},clearBit:function(a){return this._changeBit(a,y)},flipBit:function(a){return this._changeBit(a,x)},add:function(a){var b=k();this._addTo(a,b);return b},subtract:function(a){var b=k();this._subTo(a,b);return b},multiply:function(a){var b=k();this._multiplyTo(a,b);return b},divide:function(a){var b=k();this._divRemTo(a,b,null);return b},remainder:function(a){var b=
k();this._divRemTo(a,null,b);return b},divideAndRemainder:function(a){var b=k(),c=k();this._divRemTo(a,b,c);return[b,c]},modPow:function(a,b){var c=a.bitLength(),d,e=t(1);if(0>=c)return e;d=18>c?1:48>c?3:144>c?4:768>c?5:6;b=8>c?new Classic(b):b._isEven()?new r(b):new C(b);var g=[],f=3,h=d-1,m=(1<<d)-1;g[1]=b.convert(this);if(1<d)for(c=k(),b.sqrTo(g[1],c);f<=m;)g[f]=k(),b.mulTo(c,g[f-2],g[f]),f+=2;for(var l=a.t-1,q,p=!0,n=k(),c=B(a[l])-1;0<=l;){c>=h?q=a[l]>>c-h&m:(q=(a[l]&(1<<c+1)-1)<<h-c,0<l&&(q|=
a[l-1]>>this._DB+c-h));for(f=d;0==(q&1);)q>>=1,--f;0>(c-=f)&&(c+=this._DB,--l);if(p)g[q]._copyTo(e),p=!1;else{for(;1<f;)b.sqrTo(e,n),b.sqrTo(n,e),f-=2;0<f?b.sqrTo(e,n):(f=e,e=n,n=f);b.mulTo(n,g[q],e)}for(;0<=l&&0==(a[l]&1<<c);)b.sqrTo(e,n),f=e,e=n,n=f,0>--c&&(c=this._DB-1,--l)}return b.revert(e)},modInverse:function(a){var b=a._isEven();if(this._isEven()&&b||0==a.signum())return m.ZERO;for(var c=a.clone(),d=this.clone(),e=t(1),g=t(0),f=t(0),h=t(1);0!=c.signum();){for(;c._isEven();)c._rShiftTo(1,c),
b?(e._isEven()&&g._isEven()||(e._addTo(this,e),g._subTo(a,g)),e._rShiftTo(1,e)):g._isEven()||g._subTo(a,g),g._rShiftTo(1,g);for(;d._isEven();)d._rShiftTo(1,d),b?(f._isEven()&&h._isEven()||(f._addTo(this,f),h._subTo(a,h)),f._rShiftTo(1,f)):h._isEven()||h._subTo(a,h),h._rShiftTo(1,h);0<=c.compareTo(d)?(c._subTo(d,c),b&&e._subTo(f,e),g._subTo(h,g)):(d._subTo(c,d),b&&f._subTo(e,f),h._subTo(g,h))}if(0!=d.compareTo(m.ONE))return m.ZERO;if(0<=h.compareTo(a))return h.subtract(a);if(0>h.signum())h._addTo(a,
h);else return h;return 0>h.signum()?h.add(a):h},pow:function(a){return this._exp(a,new p)},gcd:function(a){var b=0>this.s?this.negate():this.clone();a=0>a.s?a.negate():a.clone();if(0>b.compareTo(a)){var c=b,b=a;a=c}var c=b.getLowestSetBit(),d=a.getLowestSetBit();if(0>d)return b;c<d&&(d=c);0<d&&(b._rShiftTo(d,b),a._rShiftTo(d,a));for(;0<b.signum();)0<(c=b.getLowestSetBit())&&b._rShiftTo(c,b),0<(c=a.getLowestSetBit())&&a._rShiftTo(c,a),0<=b.compareTo(a)?(b._subTo(a,b),b._rShiftTo(1,b)):(a._subTo(b,
a),a._rShiftTo(1,a));0<d&&a._lShiftTo(d,a);return a},isProbablePrime:function(a){var b,c=this.abs();if(1==c.t&&c[0]<=l[l.length-1]){for(b=0;b<l.length;++b)if(c[0]==l[b])return!0;return!1}if(c._isEven())return!1;for(b=1;b<l.length;){for(var d=l[b],e=b+1;e<l.length&&d<D;)d*=l[e++];for(d=c._modInt(d);b<e;)if(0==d%l[b++])return!1}return c._millerRabin(a)}});return w.math.BigInteger});