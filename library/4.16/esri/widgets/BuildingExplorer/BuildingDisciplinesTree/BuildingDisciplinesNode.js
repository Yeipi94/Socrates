// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See https://js.arcgis.com/4.16/esri/copyright.txt for details.
//>>built
define("require exports tslib ../../../core/watchUtils ../../../core/accessorSupport/decorators ../../Widget ../support/LayerTreeNode ../../support/widget".split(" "),function(t,u,e,n,h,p,q,f){var r={expand:"expand",collapse:"collapse",hideSublayer:"hideSublayer",showSublayer:"showSublayer"},d={base:"esri-building-disciplines-tree-node",root:"esri-building-disciplines-tree-node--root",leaf:"esri-building-disciplines-tree-node--leaf",label:"esri-building-disciplines-tree-node__label",checkbox:"esri-building-disciplines-tree-node__checkbox",
checkboxChecked:"esri-building-disciplines-tree-node__checkbox--checked esri-icon-check-mark",checkboxIndeterminate:"esri-building-disciplines-tree-node__checkbox--indeterminate esri-icon-minus",collapseToggle:"esri-building-disciplines-tree-node__collapse-toggle esri-icon-right",collapseToggleCollapsed:"esri-building-disciplines-tree-node__collapse-toggle--collapsed",children:"esri-building-disciplines-tree-node__children",level:function(d){return"esri-building-disciplines-tree-node--level-"+d}};
return function(m){function b(a){var c=m.call(this,a)||this;c.messages=r;c._childWidgets=[];c._updateChildWidgets=function(){c._destroyChildWidgets();c._childWidgets=c.node.children.toArray().reverse().map(function(a){return new k({node:a,messages:c.messages})})};return c}e.__extends(b,m);k=b;b.prototype.initialize=function(){this.own(n.on(this,"node.children","after-changes",this._updateChildWidgets,this._updateChildWidgets,this._updateChildWidgets),this.watch("messages",this._updateChildWidgets))};
b.prototype.destroy=function(){this._destroyChildWidgets()};b.prototype.render=function(){var a,c=this.node,b=c.isRoot,g=c.isLeaf;return c.isDiscipline&&g?[]:f.tsx("div",{key:c.id,class:this.classes(d.base,d.level(c.level),(a={},a[d.root]=b,a[d.leaf]=g,a)),bind:this,onkeydown:this._onKeydown,tabIndex:g?null:0,role:"treeitem","aria-expanded":c.collapsed?"false":"true"},f.tsx("label",{bind:this,class:d.label,onclick:this._onCheckboxToggle},this._renderCollapseToggle(),this._renderCheckbox(),f.tsx("span",
null,c.title)),this._renderChildren(c))};b.prototype._renderCheckbox=function(){var a,c,b,g=this.node.visible,l=!0===g,e=l?null===(c=this.messages)||void 0===c?void 0:c.hideSublayer:null===(b=this.messages)||void 0===b?void 0:b.showSublayer;return f.tsx("button",{bind:this,class:this.classes(d.checkbox,(a={},a[d.checkboxChecked]=l,a[d.checkboxIndeterminate]=null===g,a)),onclick:this._onCheckboxToggle,role:"checkbox","aria-checked":l?"true":"false","aria-label":e,title:e})};b.prototype._renderCollapseToggle=
function(){var a,c,b;if(!this.node.hasChildren)return[];var g=this.node.collapsed,e=g?null===(c=this.messages)||void 0===c?void 0:c.expand:null===(b=this.messages)||void 0===b?void 0:b.collapse;return f.tsx("div",{bind:this,class:this.classes(d.collapseToggle,(a={},a[d.collapseToggleCollapsed]=g,a)),onclick:this._onCollapseToggle,"aria-label":e,title:e})};b.prototype._renderChildren=function(a){return!a.hasChildren||a.collapsed?[]:f.tsx("div",{class:d.children},this._childWidgets.map(function(a){return a.render()}))};
b.prototype._onKeydown=function(a){switch(a.key){case "Space":case "Enter":if(!a.target.classList.contains(d.base))break;a.stopPropagation();this.node.toggleVisibility();break;case "ArrowLeft":a.stopPropagation();this.node.toggleCollapsed(f.isRTL()?!1:!0);break;case "ArrowRight":a.stopPropagation(),this.node.toggleCollapsed(f.isRTL()?!0:!1)}};b.prototype._onCheckboxToggle=function(a){a.preventDefault();a.stopPropagation();this.node.toggleVisibility()};b.prototype._onCollapseToggle=function(a){a.preventDefault();
a.stopPropagation();this.node.toggleCollapsed()};b.prototype._destroyChildWidgets=function(){this._childWidgets.forEach(function(a){return a.destroy()});this._childWidgets=[]};var k;e.__decorate([h.property({type:q.LayerTreeNode}),f.renderable(["node.hasChildren","node.isDiscipline","node.level","node.title","node.visible"])],b.prototype,"node",void 0);e.__decorate([h.property(),f.renderable()],b.prototype,"messages",void 0);e.__decorate([h.property(),f.renderable()],b.prototype,"_childWidgets",void 0);
return b=k=e.__decorate([h.subclass("esri.widgets.BuildingExplorer.BuildingDisciplinesTree.BuildingDisciplinesNode")],b)}(p)});