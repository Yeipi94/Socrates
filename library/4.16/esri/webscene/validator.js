// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define(["require","exports","../libs/ajv/ajv.bundle","../support/validationUtilsAjv","./schema"],function(n,b,l,m,e){function c(a){return a?a+"_schema.json":"webScene_schema.json"}Object.defineProperty(b,"__esModule",{value:!0});var a=new l({allErrors:!0,extendRefs:!0});a.addSchema(e.json,c());b.validate=function(b,d){var k=c(d);if(!a.getSchema(k)){var f=e.json.definitions[c(d)];if(!f)throw Error("invalid schema name to validate against '"+d+"'");var g={},h;for(h in f)g[h]=f[h];g.definitions=e.json.definitions;
a.addSchema(g,k)}return a.validate(c(d),b)?[]:m.convertAjvErrors(a.errors)}});