<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Geo.aspx.cs" Inherits="Geo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
                    div#map{
                        width:600px;
                        height:400px;
                    }
    </style>

    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBbmMQ2Ma1uZKipVyBagGkaxAmd65aRXPg&callback&libraries=geometry"></script>


	


<%--    <script  src="http://maps.google.com/maps/api/js?key=AIzaSyBbmMQ2Ma1uZKipVyBagGkaxAmd65aRXPg&callback"></script>--%>
    <script type="text/javascript">
		

		
  //  $.ajax({
		//url: "https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyBbmMQ2Ma1uZKipVyBagGkaxAmd65aRXPg&callback",
  //      type:"GET",
  //      success:function(datos)
  //      {
  //          //utilizamos un iterador
  //          $.each(datos['results'][0]['address_components'], function(clave,valor)
  //          {
  //              if (valor['types'][0]=='country')
  //                  {
  //                      alert(valor['long_name']);
  //                  }
  //          })
  //      }
  //  })

		var trackId = null;
		var locations = [];
		function displayLocation(position) {
			var latitude = position.coords.latitude;
			var longitude = position.coords.longitude;
			var accuracy = position.coords.accuracy;
			var timestamp = position.coords.timestamp;

			var googleLoc = new google.maps.LatLng(
				position.coords.latitude,
				position.coords.longitude);

			locations.push(googleLoc);


			//Cordenadas del dispositivo
			var pLocation = document.getElementById("location");
			pLocation.innerHTML += latitude + "," + longitude + "<br>";

			var pInfo = document.getElementById("info");
			var date = new Date(position.timestamp);
			pInfo.innerHTML += "Location  timestamp:" + position.coords.accuracy + "meters<br>";
			if (position.coords.altitude) {
				pInfo.innerHTML += "Altitude:" + position.coords.altitude;
			}
			else {
				console.log("Altitud: " + position.coords.altitude);
			}

			showMap(position.coords);
		}

		function showMap(coords) {
			var googleLatLong = new google.maps.LatLng(coords.latitude, coords.longitude);
			var mapOption = {
				zoom: 11,
				center: google.maps.mapT
			}
		}
		//en caso de error 
		function displayError(error) {
			var errors = ["Unknow error", "Permisos denegado por el usuario", "Posicion no valida", "Tiempo de error"];
			var message = errors[error.code];
			console.warn("Error in getting your location: " + message, error.message);
		}
		//function trackMe() {
		//    trackId = navigator.geolocation.watchPosition(displayLocation, displayError);
		//}
		//function clearTracking() {
		//    if (trackId) {
		//        navigator.geolocation.clearWatch(trackId);
		//        trackId = null;
		//	}
		//}
		//function computeTotalDistance() {
		//    var totalDistance = 0;
		//    if (locations.length > 1) {
		//        for (var i = 1; i < locations.length; i++) {
		//            totalDistance += google.maps.geometry.spherical.com
		//		}
		//	}
		//    return 0;
		//}

		window.onload = function () {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(displayLocation, displayError);

			} else {
				alert("Disculpe, el Buscador no soporta la geolocalización");
			}
		}


	</script>
<%--    <script src="js/JavaScript.js"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1>Geolocalizacion</h1>
    <p id="location"></p>
    <p id="info"></p>
    <div  id="map">Loading...</div>

	
</asp:Content>

