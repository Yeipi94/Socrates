// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports"],function(e,b){Object.defineProperty(b,"__esModule",{value:!0});b.findSelectedItem=function(b,d){var a,c=null===(a=b.layer)||void 0===a?void 0:a.uid;return c&&d.find(function(b){var a;return(null===(a=b.layer)||void 0===a?void 0:a.uid)===c})}});