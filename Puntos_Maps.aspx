<%@ Page Title="" Language="VB" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="false" CodeFile="Puntos_Maps.aspx.vb" Inherits="Puntos_Maps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	 <style>
      html,
      body,
      #viewDiv {
        padding: 0;
        margin: 0;
        height: 100%;
        width: 100%;
      }
    </style>

    <link
      rel="stylesheet"
      href="https://js.arcgis.com/4.16/esri/themes/light/main.css"
    />
    <script src="https://js.arcgis.com/4.16/"></script>

    <script>
		require([
			"esri/Map",
			"esri/layers/FeatureLayer",
			"esri/views/MapView",
			"esri/widgets/Legend"
		], function (Map, FeatureLayer, MapView, Legend) {
			// Create the map
			var map = new Map({
				basemap: "gray-vector"
			});

			// Create the MapView
			var view = new MapView({
				container: "viewDiv",
				map: map,
				center: [-100.288, 25.6307],
				zoom: 10
			});

			view.ui.add(new Legend({ view: view }), "bottom-left");

			/*************************************************************
			 * The PopupTemplate content is the text that appears inside the
			 * popup. {fieldName} can be used to reference the value of an
			 * attribute of the selected feature. HTML elements can be used
			 * to provide structure and styles within the content. The
			 * fieldInfos property is an array of objects (each object representing
			 * a field) that is use to format number fields and customize field
			 * aliases in the popup and legend.
			 **************************************************************/

			var template = {
				// autocasts as new PopupTemplate()
				title: "{NAME} in {COUNTY}",
				content: [
					{
						// It is also possible to set the fieldInfos outside of the content
						// directly in the popupTemplate. If no fieldInfos is specifically set
						// in the content, it defaults to whatever may be set within the popupTemplate.
						type: "fields",
						
					}
				]
			};

			// Reference the popupTemplate instance in the
			// popupTemplate property of FeatureLayer
			var featureLayer = new FeatureLayer({
				url:
					"https://services5.arcgis.com/JeTKcjIv5oa05fLI/arcgis/rest/services/survey123_71a6fe9b16ce45fb8a419a9763ea673e_stakeholder/FeatureServer",
				//"https://services5.arcgis.com/JeTKcjIv5oa05fLI/arcgis/rest/services/Distrito%20Seccion_1c165675/FeatureServer",
				//"https://services5.arcgis.com/JeTKcjIv5oa05fLI/arcgis/rest/services/Manzanas_NL_Socrates_region/FeatureServer",

				popupTemplate: template
			});
			map.add(featureLayer);
		});
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	    <div id="viewDiv"></div>

</asp:Content>

