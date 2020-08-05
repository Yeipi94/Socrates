<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Buscador_Maps.aspx.cs" Inherits="Buscador_Maps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://js.arcgis.com/4.15/esri/themes/light/main.css">
  <script src="https://js.arcgis.com/4.15/"></script>

    <script>
		require([
			"esri/Map",
			"esri/views/MapView"
		], function (Map, MapView) {

			var map = new Map({
				basemap: "topo-vector"
			});

			var view = new MapView({
				container: "viewDiv",
				map: map,
				center: [-118.80500, 34.02700], // longitude, latitude
				zoom: 13
			});
		});
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div id="viewDiv"></div>

    
</asp:Content>


