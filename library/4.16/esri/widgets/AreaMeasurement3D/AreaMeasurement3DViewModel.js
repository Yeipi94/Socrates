// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports tslib ../../core/Handles ../../core/Logger ../../core/promiseUtils ../../core/unitUtils ../../core/watchUtils ../../core/accessorSupport/decorators ../../views/3d/interactive/measurementTools/areaMeasurement3D/AreaMeasurement3DTool ../support/commonProperties ../support/InteractiveToolViewModel".split(" "),function(r,t,c,h,k,l,e,m,d,n,p,q){var f=k.getLogger("esri.widgets.AreaMeasurement3D.AreaMeasurement3DViewModel");return function(g){function a(b){b=g.call(this,b)||this;
b.supportedViewType="3d";b._handles=new h;b._userUnitOptions=null;b._userUnit=null;b.tool=null;return b}c.__extends(a,g);a.prototype.initialize=function(){var b=this;this._handles.add([m.init(this,"unit",function(a){b.tool&&(b.tool.model.unit=a)})])};a.prototype.destroy=function(){this._handles&&(this._handles.destroy(),this._handles=null)};Object.defineProperty(a.prototype,"state",{get:function(){return this.isDisabled?"disabled":this.tool?this.tool.state:"ready"},enumerable:!0,configurable:!0});
Object.defineProperty(a.prototype,"measurement",{get:function(){if(!this.tool||this.isDisabled)return null;var b=this.tool.model,a=b.measurementMode,c=b.measurementData,d=b.validMeasurement,e=(c=0===("euclidean"===a?c.intersectingSegments:c.geodesicIntersectingSegments).size)?d?"available":"unavailable":"invalid";return{mode:a,area:{text:c&&d?b.areaLabel:null,state:e},perimeterLength:{text:c&&d?b.perimeterLengthLabel:null,state:e}}},enumerable:!0,configurable:!0});Object.defineProperty(a.prototype,
"unitOptions",{get:function(){return this._filteredOrAllUnits(this._userUnitOptions)},set:function(b){this._userUnitOptions=b;this._set("unitOptions",this._filteredOrAllUnits(this._userUnitOptions))},enumerable:!0,configurable:!0});Object.defineProperty(a.prototype,"unit",{get:function(){return this._userUnit?this._userUnit=this._findSelectableUnit(this._userUnit,this.defaultUnit):this._findSelectableUnit(this.defaultUnit)},set:function(b){this._userUnit=b?this._findSelectableUnit(b,this._userUnit):
null;this.notifyChange("unit")},enumerable:!0,configurable:!0});a.prototype.start=function(){return this.createTool()};a.prototype.clear=function(){this.removeTool()};a.prototype.newMeasurement=function(){l.ignoreAbortErrors(this.start())};a.prototype.clearMeasurement=function(){this.clear()};a.prototype.createToolParams=function(){var b=this;return{toolConstructor:n,constructorArguments:function(){return{unit:b.unit}}}};a.prototype.logUnsupportedError=function(){f.error("AreaMeasurement3D widget is not implemented for MapView")};
a.prototype.logError=function(){for(var b=[],a=0;a<arguments.length;a++)b[a]=arguments[a];f.error.apply(f,b)};a.prototype._findSelectableUnit=function(b,a){var c=this.unitOptions;return-1!==c.indexOf(b)?b:a?this._findSelectableUnit(a):c[0]};a.prototype._filteredOrAllUnits=function(a){if(!a)return e.measurementAreaUnits.slice();a=a.filter(function(a){return-1!==e.measurementAreaUnits.indexOf(a)});return 0===a.length?e.measurementAreaUnits.slice():a};c.__decorate([d.property({dependsOn:["isDisabled",
"tool.state"],readOnly:!0})],a.prototype,"state",null);c.__decorate([d.property({dependsOn:"view.ready tool.model.area tool.model.geodesicArea tool.model.areaLabel tool.model.perimeterLength tool.model.geodesicPerimeterLength tool.model.perimeterLengthLabel tool.model.measurementMode tool.model.measurementData".split(" "),readOnly:!0})],a.prototype,"measurement",null);c.__decorate([d.property({constructOnly:!0})],a.prototype,"tool",void 0);c.__decorate([d.property(p.defaultUnitPropertyMetadata)],
a.prototype,"defaultUnit",void 0);c.__decorate([d.property({dependsOn:["view.spatialReference"]})],a.prototype,"unitOptions",null);c.__decorate([d.property({dependsOn:["unitOptions","defaultUnit"]})],a.prototype,"unit",null);c.__decorate([d.property()],a.prototype,"clearMeasurement",null);return a=c.__decorate([d.subclass("esri.widgets.AreaMeasurement3D.AreaMeasurement3DViewModel")],a)}(q.InteractiveToolViewModel)});