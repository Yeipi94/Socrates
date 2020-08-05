<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Geo.aspx.cs" Inherits="Geo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
                    div#map{
                        width:600px;
                        height:400px;
                    }
    </style>

<%--    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB6selYtcrPOsIPlyp4GpbZj7aKxJsVAJo&libraries=geometry"></script>--%>
    <script  src="http://maps.google.com/maps/api/js?key=AIzaSyB6selYtcrPOsIPlyp4GpbZj7aKxJsVAJo"></script>
    <script type="text/javascript">
		

		
    //$.ajax({
    //    url: "https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyCqxiI0iBwtCgKIXvN7dwLqqlZLCloDPgU",
    //    type:"GET",
    //    success:function(datos)
    //    {
    //        //utilizamos un iterador
    //        $.each(datos['results'][0]['address_components'], function(clave,valor)
    //        {
    //            if (valor['types'][0]=='country')
    //                {
    //                    alert(valor['long_name']);
    //                }
    //        })
    //    }
    //})
	</script>
    <script src="js/JavaScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1>Geolocalizacion</h1>
    <p id="location"></p>
    <p id="info"></p>
    <div  id="map">Loading...</div>
</asp:Content>

