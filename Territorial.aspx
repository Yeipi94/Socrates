<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Territorial.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="Territorial" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBbmMQ2Ma1uZKipVyBagGkaxAmd65aRXPg&libraries=places"></script>


	<style>
		#geomap {
			height: 500px;
			width: 100%;
		}

		table td {
			padding: 3px 5px;
			margin: 0;
		}

		a:link {
			text-decoration: none;
			cursor: pointer;
		}

		.td Header {
			background-color: #CEF6F5;
		}

		.DataBlock {
			max-width: 520px;
			min-width: 215px;
			max-height: 200px;
			overflow: auto;
			background-color: #fff;
		}

		.renderpart {
			z-index: 99999;
			position: absolute;
		}

		#geomap {
			width: 100%;
			height: 500px;
		}

		.embed-container {
			position: relative;
			padding-bottom: 80%;
			height: 0;
			max-width: 100%;
		}

			.embed-container iframe, .embed-container object, .embed-container iframe {
				position: absolute;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
			}

		small {
			position: absolute;
			z-index: 40;
			bottom: 0;
			margin-bottom: -15px;
		}

		@media screen and (min-width: 1045px) {
			.priority-5 {
				display: none;
			}

			.priority-6 {
				display: none;
			}

			.priority-7 {
				display: none;
			}

			.priority-8 {
				display: none;
			}

			.priority-9 {
				display: none;
			}

			.priority-10 {
				display: none;
			}

			.priority-11 {
				display: none;
			}

			.priority-12 {
				display: none;
			}

			.priority-13 {
				display: none;
			}

			.priority-14 {
				display: none;
			}
		}

		@media screen and (max-width: 1045px) and (min-width: 835px) {
			.priority-5 {
				display: none;
			}

			.priority-4 {
				display: none;
			}

			.priority-6 {
				display: none;
			}

			.priority-7 {
				display: none;
			}

			.priority-8 {
				display: none;
			}

			.priority-9 {
				display: none;
			}

			.priority-10 {
				display: none;
			}

			.priority-11 {
				display: none;
			}

			.priority-12 {
				display: none;
			}

			.priority-13 {
				display: none;
			}

			.priority-14 {
				display: none;
			}
		}

		@media screen and (max-width: 565px) and (min-width: 300px) {
			.priority-5 {
				display: none;
			}

			.priority-4 {
				display: none;
			}

			.priority-3 {
				display: none;
			}

			.priority-6 {
				display: none;
			}

			.priority-7 {
				display: none;
			}

			.priority-8 {
				display: none;
			}

			.priority-9 {
				display: none;
			}

			.priority-10 {
				display: none;
			}

			.priority-11 {
				display: none;
			}

			.priority-12 {
				display: none;
			}

			.priority-13 {
				display: none;
			}

			.priority-14 {
				display: none;
			}
		}

		@media screen and (max-width: 300px) {
			.priority-5 {
				display: none;
			}

			.priority-4 {
				display: none;
			}

			.priority-3 {
				display: none;
			}

			.priority-2 {
				display: none;
			}

			.priority-1 {
				font-size: 9px;
			}

			.priority-6 {
				display: none;
			}

			.priority-7 {
				display: none;
			}

			.priority-8 {
				display: none;
			}

			.priority-9 {
				display: none;
			}

			.priority-10 {
				display: none;
			}

			.priority-11 {
				display: none;
			}

			.priority-12 {
				display: none;
			}

			.priority-13 {
				display: none;
			}

			.priority-14 {
				display: none;
			}
		}
	</style>


	<script type="text/javascript">

		var geocoder;
		var map;
		var marker;
		var infoview;

		(function () {
			var content = document.getElementById("geolocation-test");

			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function (objPosition) {
					var initialLong = objPosition.coords.longitude;
					var initialLat = objPosition.coords.latitude;

					var latlng = new google.maps.LatLng(initialLat, initialLong);

					var options = {
						zoom: 17,
						styles: [
							{
								"stylers": [
									{
										"saturation": -5
									},
									{
										"lightness": -10
									}
								]
							},
							{
								"elementType": "geometry",
								"stylers": [
									{
										"color": "#1d2c4d"
									}
								]
							},
							{
								"elementType": "labels.text.fill",
								"stylers": [
									{
										"color": "#8ec3b9"
									}
								]
							},
							{
								"elementType": "labels.text.stroke",
								"stylers": [
									{
										"color": "#1a3646"
									}
								]
							},
							{
								"featureType": "administrative.country",
								"elementType": "geometry.stroke",
								"stylers": [
									{
										"color": "#4b6878"
									}
								]
							},
							{
								"featureType": "administrative.land_parcel",
								"elementType": "labels.text.fill",
								"stylers": [
									{
										"color": "#64779e"
									}
								]
							},
							{
								"featureType": "administrative.province",
								"elementType": "geometry.stroke",
								"stylers": [
									{
										"color": "#4b6878"
									}
								]
							},
							{
								"featureType": "landscape.man_made",
								"elementType": "geometry.stroke",
								"stylers": [
									{
										"color": "#334e87"
									}
								]
							},
							{
								"featureType": "landscape.natural",
								"elementType": "geometry",
								"stylers": [
									{
										"color": "#023e58"
									}
								]
							},
							{
								"featureType": "poi",
								"elementType": "geometry",
								"stylers": [
									{
										"color": "#283d6a"
									}
								]
							},
							{
								"featureType": "poi",
								"elementType": "labels.text.fill",
								"stylers": [
									{
										"color": "#6f9ba5"
									}
								]
							},
							{
								"featureType": "poi",
								"elementType": "labels.text.stroke",
								"stylers": [
									{
										"color": "#1d2c4d"
									}
								]
							},
							{
								"featureType": "poi.park",
								"elementType": "geometry.fill",
								"stylers": [
									{
										"color": "#023e58"
									}
								]
							},
							{
								"featureType": "poi.park",
								"elementType": "labels.text.fill",
								"stylers": [
									{
										"color": "#3C7680"
									}
								]
							},
							{
								"featureType": "road",
								"elementType": "geometry",
								"stylers": [
									{
										"color": "#304a7d"
									}
								]
							},
							{
								"featureType": "road",
								"elementType": "labels.text.fill",
								"stylers": [
									{
										"color": "#98a5be"
									}
								]
							},
							{
								"featureType": "road",
								"elementType": "labels.text.stroke",
								"stylers": [
									{
										"color": "#1d2c4d"
									}
								]
							},
							{
								"featureType": "road.highway",
								"elementType": "geometry",
								"stylers": [
									{
										"color": "#2c6675"
									}
								]
							},
							{
								"featureType": "road.highway",
								"elementType": "geometry.stroke",
								"stylers": [
									{
										"color": "#255763"
									}
								]
							},
							{
								"featureType": "road.highway",
								"elementType": "labels.text.fill",
								"stylers": [
									{
										"color": "#b0d5ce"
									}
								]
							},
							{
								"featureType": "road.highway",
								"elementType": "labels.text.stroke",
								"stylers": [
									{
										"color": "#023e58"
									}
								]
							},
							{
								"featureType": "transit",
								"elementType": "labels.text.fill",
								"stylers": [
									{
										"color": "#98a5be"
									}
								]
							},
							{
								"featureType": "transit",
								"elementType": "labels.text.stroke",
								"stylers": [
									{
										"color": "#1d2c4d"
									}
								]
							},
							{
								"featureType": "transit.line",
								"elementType": "geometry.fill",
								"stylers": [
									{
										"color": "#283d6a"
									}
								]
							},
							{
								"featureType": "transit.station",
								"elementType": "geometry",
								"stylers": [
									{
										"color": "#3a4762"
									}
								]
							},
							{
								"featureType": "water",
								"elementType": "geometry",
								"stylers": [
									{
										"color": "#0e1626"
									}
								]
							},
							{
								"featureType": "water",
								"elementType": "labels.text.fill",
								"stylers": [
									{
										"color": "#4e6d70"
									}
								]
							}
						],
						center: latlng,
						mapTypeId: google.maps.MapTypeId.ROADMAP
					};

					map = new google.maps.Map(document.getElementById("geomap"), options);

					geocoder = new google.maps.Geocoder();

					marker = new google.maps.Marker({
						map: map,
						draggable: true,
						position: latlng
					});

					google.maps.event.addListener(marker, "dragend", function () {
						var point = marker.getPosition();
						map.panTo(point);
						geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
							if (status == google.maps.GeocoderStatus.OK) {
								map.setCenter(results[0].geometry.location);
								marker.setPosition(results[0].geometry.location);
								$('.search_addr').val(results[0].formatted_address);
								$('.search_latitude').val(marker.getPosition().lat());
								$('.search_longitude').val(marker.getPosition().lng());
							}
						});
					});

					var input = document.getElementById('search_location');
					map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

					var autocomplete = new google.maps.places.Autocomplete(input);
					autocomplete.bindTo('bounds', map);

					autocomplete.addListener('place_changed', function () {
						marker.setVisible(false);
						var place = autocomplete.getPlace();
						if (!place.geometry) {
							window.alert("Autocomplete's returned place contains no geometry");
							return;
						}
						// If the place has a geometry, then present it on a map.
						if (place.geometry.viewport) {
							map.fitBounds(place.geometry.viewport);
						} else {
							map.setCenter(place.geometry.location);
							map.setZoom(17);
						}
						marker.setPosition(place.geometry.location);
						marker.setVisible(true);
					});

					var PostCodeid = '#search_location';
					$(function () {
						$(PostCodeid).autocomplete({
							source: function (request, response) {
								geocoder.geocode({
									'address': request.term
								}, function (results, status) {
									response($.map(results, function (item) {
										return {
											label: item.formatted_address,
											value: item.formatted_address,
											lat: item.geometry.location.lat(),
											lon: item.geometry.location.lng()
										};
									}));
								});
							},
							select: function (event, ui) {
								$('.search_addr').val(ui.item.value);
								$('.search_latitude').val(ui.item.lat);
								$('.search_longitude').val(ui.item.lon);
								var latlng = new google.maps.LatLng(ui.item.lat, ui.item.lon);
								marker.setPosition(latlng);
								initialize();
							}
						});
					});

                    /*
                     * Point location on google map
                     */
					$('.get_map').click(function (e) {
						var address = $(PostCodeid).val();
						geocoder.geocode({ 'address': address }, function (results, status) {
							if (status == google.maps.GeocoderStatus.OK) {
								map.setCenter(results[0].geometry.location);
								marker.setPosition(results[0].geometry.location);
								$('.search_addr').val(results[0].formatted_address);
								$('.search_latitude').val(marker.getPosition().lat());
								$('.search_longitude').val(marker.getPosition().lng());
							} else {
								alert("La localización no fue exitosa por la siguiente razón: " + status);
							}
						});
						e.preventDefault();
					});

					//Add listener to marker for reverse geocoding
					google.maps.event.addListener(marker, 'drag', function () {
						geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
							if (status == google.maps.GeocoderStatus.OK) {
								if (results[0]) {
									$('.search_addr').val(results[0].formatted_address);
									$('.search_latitude').val(marker.getPosition().lat());
									$('.search_longitude').val(marker.getPosition().lng());
								}
							}
						});
					});

				}, function (objPositionError) {
					switch (objPositionError.code) {
						case objPositionError.PERMISSION_DENIED:
							content.innerHTML = "No se ha permitido el acceso a la posición del usuario.";
							break;
						case objPositionError.POSITION_UNAVAILABLE:
							content.innerHTML = "No se ha podido acceder a la información de su posición.";
							break;
						case objPositionError.TIMEOUT:
							content.innerHTML = "El servicio ha tardado demasiado tiempo en responder.";
							break;
						default:
							content.innerHTML = "Error desconocido.";
					}
				}, {
					maximumAge: 75000,
					timeout: 15000
				});
			}
			else {
				content.innerHTML = "Su navegador no soporta la API de geolocalización.";
			}
		})();






		function SetContextKey() {

			$find('<%=AutoCompleteExtender1.ClientID %>').set_contextKey($get("<%=ddlEstados_Cat.ClientID %>").value);
		}

		function pageLoad() {

			$("#<%=ddlEstados_Cat.ClientID%>").select2({
				placeholder: "Seleccionar Estado",

			});


		}


		function GetID(source, eventArgs) {
			var HdnKey = eventArgs.get_value();
			document.getElementById('<%=txtAutocomplete.ClientID %>').value = HdnKey;

			alert(HdnKey);


		}


		function viaSeleccionada(source, eventArgs) {

		}



		function selectItem() {
			var comletionList = $find("IDExtensor").get_completionList();
			for (i = 0; i < comletionList.childNodes.length; i++) {
				var _value = comletionList.childNodes[i]._value;
				comletionList.childNodes[i]._value = _value.substring(_value.lastIndexOf('|') + 1);
				_value = _value.substring(0, _value.lastIndexOf('|'));
				comletionList.childNodes[i].innerHTML = _value.replace('|', '<br />');
			}
		}

		function tabular(e, obj) {
			tecla = (document.all) ? e.keyCode : e.which;
			if (tecla != 13) return;
			frm = obj.form;
			for (i = 0; i < frm.elements.length; i++)
				if (frm.elements[i] == obj) {
					if (i == frm.elements.length - 1) i = -1;
					if (i == frm.elements.length - 1) i = -1;
					break
				}
			frm.elements[i + 1].focus();
			frm.elements[i + 1].select();
			return false;
		}


	</script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div class="row">
		<div class="col-sm-12 col-md-12 col-lg-12">
			<div class="alert alert-danger alert-dismissible fade in" role="alert" id="msgError" runat="server" style="display: none; background-color: #ad0a0a; color: #fff"></div>
			<div id="Notificacion" runat="server" class="alert alert-success" role="alert">
				<i class="dripicons-checkmark mr-2"></i>Datos guardados con <strong>exito!</strong>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		</div>

	</div>

	<div class="row">
		<div class="col-xl-12">
			<div class="card">

				<ul class="nav nav-pills bg-nav-pills nav-justified mb-2" id="pills-tab" role="tablist">
					<li class="nav-item" role="presentation">
						<a href="#DatPer" id="DatPer-tab" data-toggle="pill" role="tab" aria-controls="DatPer" class="nav-link active" aria-selected="true"><span class="tab-justified">Datos Personales</span>
						</a>
					</li>
					<li class="nav-item" role="presentation">
						<a href="#Direccion" id="direccion-tab" data-toggle="pill" role="tab" aria-controls="Direccion" class="nav-link" aria-selected="false">
							<span class="tab-justified">Direccion</span>
						</a>
					</li>

				</ul>
				<div class="tab-content" id="pills-tabContent">
					<div class="tab-pane fade show active" id="DatPer" role="tabpanel" aria-labelledby="DatPer-tab">
						<div class="row">

							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<div class="col-sm-12 col-md-12 col-lg-12 m-auto">
											<div class="row">
												<div class="col-xs-3 col-lg-3">
													<div class="form-group">
														<label>Estados</label>
														<asp:DropDownList ID="ddlEstados_Cat" runat="server" CssClass="form-control" Width="100%">
															<asp:ListItem Text="Todos los Estados" Value="0"></asp:ListItem>
															<asp:ListItem Text="AGUASCALIENTES2" Value="1"></asp:ListItem>
															<asp:ListItem Text="BAJA CALIFORNIA" Value="2"></asp:ListItem>
															<asp:ListItem Text="BAJA CALIFORNIA SUR" Value="3"></asp:ListItem>
															<asp:ListItem Text="CAMPECHE" Value="4"></asp:ListItem>
															<asp:ListItem Text="COAHUILA DE ZARAGOZA" Value="5"></asp:ListItem>
															<asp:ListItem Text="COLIMA" Value="6"></asp:ListItem>
															<asp:ListItem Text="CHIAPAS" Value="7"></asp:ListItem>
															<asp:ListItem Text="CHIHUAHUA" Value="8"></asp:ListItem>
															<asp:ListItem Text="DISTRITO FEDERAL" Value="9"></asp:ListItem>
															<asp:ListItem Text="DURANGO" Value="10"></asp:ListItem>
															<asp:ListItem Text="GUANAJUATO" Value="11"></asp:ListItem>
															<asp:ListItem Text="GUERRERO" Value="12"></asp:ListItem>
															<asp:ListItem Text="HIDALGO" Value="13"></asp:ListItem>
															<asp:ListItem Text="JALISCO" Value="14"></asp:ListItem>
															<asp:ListItem Text="MEXICO" Value="15"></asp:ListItem>
															<asp:ListItem Text="MICHOACAN DE OCAMPO" Value="16"></asp:ListItem>
															<asp:ListItem Text="MORELOS" Value="17"></asp:ListItem>
															<asp:ListItem Text="NAYARIT" Value="18"></asp:ListItem>
															<asp:ListItem Text="NUEVO LEON" Value="19"></asp:ListItem>
															<asp:ListItem Text="OAXACA" Value="20"></asp:ListItem>
															<asp:ListItem Text="PUEBLA" Value="21"></asp:ListItem>
															<asp:ListItem Text="QUERETARO" Value="22"></asp:ListItem>
															<asp:ListItem Text="QUINTANA ROO" Value="23"></asp:ListItem>
															<asp:ListItem Text="SAN LUIS POTOSI" Value="24"></asp:ListItem>
															<asp:ListItem Text="SINALOA" Value="25"></asp:ListItem>
															<asp:ListItem Text="SONORA" Value="26"></asp:ListItem>
															<asp:ListItem Text="TABASCO" Value="27"></asp:ListItem>
															<asp:ListItem Text="TAMAULIPAS" Value="28"></asp:ListItem>
															<asp:ListItem Text="TLAXCALA" Value="29"></asp:ListItem>
															<asp:ListItem Text="VERACRUZ DE IGNACIO DE LA LLAVE" Value="30"></asp:ListItem>
															<asp:ListItem Text="YUCATAN" Value="31"></asp:ListItem>
															<asp:ListItem Text="ZACATECAS" Value="32"></asp:ListItem>
														</asp:DropDownList>
														<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="ddlEstados_Cat" ErrorMessage="Obligatorio." ForeColor="Red"></asp:RequiredFieldValidator>
													</div>
												</div>



												<div class="col-xs-9 col-lg-9" runat="server">
													<div class="form-group">
														<label>Nombre Completo</label>
														<asp:TextBox ID="txtAutocomplete" CssClass="form-control" runat="server" placeholder="Nombre Completo" onkeyup="SetContextKey()"></asp:TextBox>
														<cc1:AutoCompleteExtender ServiceMethod="Autocompletar"
															MinimumPrefixLength="2"
															CompletionInterval="200"
															EnableCaching="false"
															CompletionSetCount="3"
															TargetControlID="txtAutocomplete"
															UseContextKey="true"
															ID="AutoCompleteExtender1"
															runat="server"
															FirstRowSelected="false"
															OnClientPopulated="Employees_Populated"
															OnClientItemSelected="ClientItemSelected"
															ShowOnlyCurrentWordInCompletionListItem="true">
														</cc1:AutoCompleteExtender>
														<asp:HiddenField ID="hfCustomerId" runat="server" />


													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-4">
													<div class="form-group">
														<label>Clave Elector</label>
														<asp:TextBox ID="txtClaveE" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
														<small>
															<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtClaveE" CssClass="float-right" ErrorMessage="* Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator></small>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-4">
													<div class="form-group">
														<label>Nombre(s)</label>
														<asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
														<small>
															<asp:RequiredFieldValidator runat="server" ID="Rnombre" ControlToValidate="txtNombre" CssClass="float-right" ErrorMessage="* Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator></small>
													</div>
												</div>

												<div class="col-sm-12 col-md-6 col-lg-4">
													<div class="form-group">
														<label>Apellido Paterno</label>
														<asp:TextBox ID="txtApellidoPa" runat="server" CssClass="form-control"></asp:TextBox>
														<small>
															<asp:RequiredFieldValidator runat="server" ID="RApellidoP" ControlToValidate="txtApellidoPa" CssClass="float-right" ErrorMessage="* Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator></small>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-4">
													<div class="form-group">
														<label>Apellido Materno</label>
														<asp:TextBox ID="txtApellidoMa" runat="server" CssClass="form-control"></asp:TextBox>
														<small>
															<asp:RequiredFieldValidator runat="server" ID="RApellidoM" ControlToValidate="txtApellidoMa" CssClass="float-right" ErrorMessage="* Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator></small>
													</div>
												</div>

												<div class="col-sm-12 col-md-6 col-lg-4">
													<div class="form-group">
														<label>Teléfono</label>
														<asp:TextBox ID="txtTelefono" runat="server" class="form-control" TextMode="Number" MaxLength="10"></asp:TextBox>
														<small>
															<asp:RequiredFieldValidator runat="server" ID="RTeléfono" ControlToValidate="txtTelefono" CssClass="float-right" ErrorMessage="* Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator></small>
													</div>
												</div>

												<div class="col-sm-12 col-md-6 col-lg-4">
													<div class="form-group">
														<label>Afiliacion</label>
														<asp:TextBox ID="txtAfiliacion" runat="server" CssClass="form-control" placeholder="Afiliación"></asp:TextBox>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-4">
													<div class="form-group">
														<label>Calle</label>
														<asp:TextBox ID="txtCalle" runat="server" CssClass="form-control"></asp:TextBox>
														<small>
															<asp:RequiredFieldValidator runat="server" ID="RCalle" ControlToValidate="txtCalle" CssClass="float-right" ErrorMessage="* Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator></small>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-4">
													<div class="form-group">
														<label>Num Ext</label>
														<asp:TextBox ID="txtNumE" runat="server" CssClass="form-control"></asp:TextBox>
														<small>
															<asp:RequiredFieldValidator runat="server" ID="RNumE" ControlToValidate="txtNumE" CssClass="float-right" ErrorMessage="* Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator></small>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-4">
													<div class="form-group">
														<label>Num. Interior</label>
														<asp:TextBox ID="txtNumeroI" runat="server" CssClass="form-control"></asp:TextBox>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-4">
													<div class="form-group">
														<label>Codigo Postal</label>
														<asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" AutoPostBack="True" OnTextChanged="txtCodigo_TextChanged"></asp:TextBox>
														<small>
															<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtCodigo" CssClass="float-right" ErrorMessage="* Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator></small>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-4">
													<div class="form-group">
														<label>Municipio</label>
														<asp:TextBox ID="txtMunicipio" runat="server" CssClass="form-control" AutoPostBack="True"></asp:TextBox>
														<small>
															<asp:RequiredFieldValidator runat="server" ID="RMunicipio" ControlToValidate="txtMunicipio" CssClass="float-right" ErrorMessage="* Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator></small>

													</div>
												</div>


												<div class="col-sm-12 col-md-6 col-lg-4">
													<div class="form-group">
														<label>Colonia</label>
														<asp:TextBox ID="txtColonia" runat="server" CssClass="form-control" AutoPostBack="True"></asp:TextBox>
														<small>
															<asp:RequiredFieldValidator runat="server" ID="RColonia" ControlToValidate="txtColonia" CssClass="float-right" ErrorMessage="* Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator></small>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 col-lg-4">
													<div class="form-group">
														<label>Sección</label>
														<asp:TextBox ID="txtseccion" runat="server" CssClass="form-control" AutoPostBack="True" OnTextChanged="txtseccion_TextChanged"></asp:TextBox>
														<small>
															<asp:RequiredFieldValidator runat="server" ID="RSección" ControlToValidate="txtseccion" CssClass="float-right" ErrorMessage="* Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator></small>
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
						<div style="overflow: auto;">
							<div style="float: right;">
							</div>
						</div>
					</div>

					<%--TAB2--%>
					<div class="tab-pane fade" id="Direccion" role="tabpanel" aria-labelledby="direccion-tab">
						<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" ScriptMode="Debug"></asp:ScriptManager>
						<asp:UpdatePanel ID="upPanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">

							<ContentTemplate>
								<div class="row">
									<div class="col-sm-12 col-md-12">
										<div class="card">
											<div class="card-body">
												<div class="form-body">
													<div class="row">
														<div class="col-md-12 m-auto">
															<div class="row">







																<div class="col-xs-12 col-lg-2">
																	<div class="form-group">
																		<label>Tipo Asignación</label>
																		<asp:DropDownList ID="ddltipoA" runat="server" CssClass="form-control" Width="100%" AutoPostBack="true">
																			<asp:ListItem Text="Distrito" Value="1" Selected="true"></asp:ListItem>
																			<asp:ListItem Text="Sección" Value="2"></asp:ListItem>
																			<asp:ListItem Text="Manzana" Value="3"></asp:ListItem>
																		</asp:DropDownList>
																		<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="ddltipoA" ErrorMessage="Obligatorio." ForeColor="Red"></asp:RequiredFieldValidator>
																	</div>
																</div>


																<div class="col-xs-12 col-lg-3">
																	<div class="form-group">
																		<label>Estados</label>
																		<asp:DropDownList ID="ddlEstad" runat="server" CssClass="form-control"></asp:DropDownList>
																		<asp:CascadingDropDown ID="CascadingDropDown3" runat="server" Category="Estados" TargetControlID="ddlEstad" LoadingText="Cargando Estados.." ServicePath="../AutocompletarService.asmx" ServiceMethod="Get_ListEstado" PromptText="Seleccionar Estado"></asp:CascadingDropDown>

																	</div>
																</div>

																<div class="col-xs-12 col-lg-4">
																	<div class="form-group">
																		<label>Municipios</label>
																		<asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-control"></asp:DropDownList>
																		<asp:CascadingDropDown ID="StateCascading" runat="server" Category="Municipios" TargetControlID="ddlMunicipio" ParentControlID="ddlEstad" LoadingText="Cargando Municipios..." ServiceMethod="Get_ListMunicipio" ServicePath="../AutocompletarService.asmx" PromptText="Seleccionar Municipios"></asp:CascadingDropDown>
																		<asp:HiddenField ID="hfIdMunicipio" runat="server" Visible="false" Value="0" />
																	</div>
																</div>



																<div class="col-xs-12 col-lg-3" id="Distritos_D" runat="server">
																	<label>Distritos</label>
																	<div class="input-group">
																		<asp:DropDownList ID="ddlDistrito" runat="server" CssClass="form-control"></asp:DropDownList>
																	</div>
																	<asp:CascadingDropDown ID="CityCascading" runat="server" Category="Distritos" TargetControlID="ddlDistrito" ParentControlID="ddlMunicipio" LoadingText="Cargando Distritos..." ServiceMethod="Get_ListDistrito" ServicePath="../AutocompletarService.asmx" PromptText="Seleccionar Distritos"></asp:CascadingDropDown>
																</div>
																<div class="col-xs-12 col-lg-4" id="Div1" runat="server">
																	<label>Colonias</label>
																	<div class="input-group">
																		<asp:DropDownList ID="ddlColonias" runat="server" CssClass="form-control"></asp:DropDownList>
																	</div>
																	<asp:CascadingDropDown ID="CascadingDropDown5" runat="server" Category="colonias" TargetControlID="ddlColonias" ParentControlID="ddlDistrito" LoadingText="Cargando Colonias..." ServiceMethod="Get_ListColonias" ServicePath="../AutocompletarService.asmx" PromptText="Seleccionar Sección"></asp:CascadingDropDown>
																</div>





																<div class="col-xs-12 col-lg-4" id="sec_on" runat="server">
																	<label>Secciones</label>
																	<div class="input-group">
																		<asp:DropDownList ID="ddlSecciones" runat="server" CssClass="form-control"></asp:DropDownList>

																	</div>
																	<asp:CascadingDropDown ID="CascadingDropDown2" runat="server" Category="Secciones" TargetControlID="ddlSecciones" ParentControlID="ddlColonias" LoadingText="Cargando Secciones..." ServiceMethod="Get_ListSecciones" ServicePath="../AutocompletarService.asmx" PromptText="Seleccionar Sección"></asp:CascadingDropDown>
																</div>



																<div class="col-xs-12 col-lg-4" id="Manzanas" runat="server">
																	<label>Manzanas</label>
																	<div class="input-group">
																		<asp:DropDownList ID="ddlManzanas" runat="server" CssClass="form-control"></asp:DropDownList>
																	</div>
																	<asp:CascadingDropDown ID="CascadingDropDown4" runat="server" Category="Manzanas" TargetControlID="ddlManzanas" ParentControlID="ddlSecciones" LoadingText="Cargando Manzanas..." ServiceMethod="Get_ListManzanas" ServicePath="../AutocompletarService.asmx" PromptText="Seleccionar Manzanas"></asp:CascadingDropDown>
																</div>


															</div>

															
														</div>
													</div>

												</div>
											</div>
										</div>
										
										

									</div>
									</div>
								<asp:HiddenField ID="id" runat="server" Visible="false" />
							</ContentTemplate>
						</asp:UpdatePanel>
						<div class="row">
									<div class="col-sm-12 col-md-12">
										<div class="card">
											<div class="card-body">
												<div class="form-body">
													<div class="row">
														<div class="col-md-12 m-auto">
															<div class="row">
																<input type="text" id="search_location" class="form-control form-control-sm" placeholder="Buscar Dirección" style="width: 75%">
																<div id="geomap"></div>
															</div>
														</div>
													</div>

												</div>
											</div>
										</div>

										<div class="card">
											<div class="card-body">
												<div class="form-body">
													<div class="row">
														<div class="col-md-12 m-auto">
															<div class="row">
																<div class="col-xs-12 col-lg-12 col-md-12">
													<label>Ubicación</label>
													<asp:TextBox ID="txtUbicacionMaps" CssClass="search_addr form-control" runat="server"></asp:TextBox>
												</div>





												<div class="col-xs-12 col-lg-6 col-md-6">
													<div class="form-group">
														<label>Latitud</label>
														<asp:TextBox ID="cord1" runat="server" CssClass="search_latitude form-control" Width="100%"></asp:TextBox>
													</div>
												</div>
												<div class="col-xs-12 col-lg-6 col-md-6">
													<div class="form-group">
														<label>Longitud</label>

														<asp:TextBox ID="cord2" runat="server" CssClass="search_longitude form-control" Width="100%"></asp:TextBox>
													</div>
												</div>


												<div class="col-xs-12 col-lg-12 col-md-12" style="text-align: right">

													<asp:Button ID="Add_Registro" runat="server" CssClass="btn btn-primary" Text="Agregar" OnClick="btnRegistrar_Click" ValidationGroup="FrmRequerido" />
												</div>






												<div class="col-xs-12 col-lg-12 col-md-12" runat="server" visible="false">
													<asp:TextBox ID="valorAsigna" runat="server"></asp:TextBox>
													<button id="boton-cargar">Cargar elementos</button>
													<div class="embed-container">
														<iframe id="iframeID" width="100%" height="400%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" title="Distrito-Formulario" src="Map_BCS.html"></iframe>
													</div>

												</div>
															</div>
														</div>
													</div>

												</div>
											</div>
										</div>
										</div>
							</div>

						
					</div>

				</div>

			</div>

		</div>
	</div>











	<script>
		$(document).ready(function () {
			$('#boton-cargar').click(function () {

				/*Obtener datos almacenados*/
				var nombre = localStorage.getItem("Nombre");
				alert(nombre);
				/*Mostrar datos almacenados*/
				document.getElementById('<%=valorAsigna.ClientID %>').value = nombre;
				//document.getElementById("nombre").innerText = nombre;
			});
		});



		/*FUNCION PARA LLENAR CAJAS DE TEXTO DESPUES DE SELECCIONAR OPCION AUTOCOMPLETADO*/
		function ClientItemSelected(sender, e) {
			var row = e._item.parentElement;
			$get("<%=txtAutocomplete.ClientID %>").value = row.getElementsByTagName('td')[0].textContent;
			$get("<%=txtClaveE.ClientID %>").value = row.getElementsByTagName('td')[1].textContent;

			$get("<%=txtCalle.ClientID %>").value = row.getElementsByTagName('td')[3].textContent;
			$get("<%=txtNumE.ClientID %>").value = row.getElementsByTagName('td')[4].textContent;
			$get("<%=txtNombre.ClientID %>").value = row.getElementsByTagName('td')[5].textContent;
			$get("<%=txtApellidoPa.ClientID %>").value = row.getElementsByTagName('td')[6].textContent;
			$get("<%=txtApellidoMa.ClientID %>").value = row.getElementsByTagName('td')[7].textContent;

			$get("<%=txtAfiliacion.ClientID %>").value = row.getElementsByTagName('td')[8].textContent;
			$get("<%=txtNumeroI.ClientID %>").value = row.getElementsByTagName('td')[9].textContent;
			$get("<%=txtCodigo.ClientID %>").value = row.getElementsByTagName('td')[10].textContent;
			$get("<%=txtMunicipio.ClientID%>").value = row.getElementsByTagName('td')[11].textContent;
			$get("<%=txtColonia.ClientID %>").value = row.getElementsByTagName('td')[12].textContent;
			$get("<%=txtseccion.ClientID %>").value = row.getElementsByTagName('td')[13].textContent;


		}



		/*FUNCION PARA MOSTRAR RESULTADOS DE AUTOCOMPPLETADO EN UNA TABLA*/
		function Employees_Populated(sender, e) {
			var employees = sender.get_completionList().childNodes;
			var div = "<table id=\"contact-detail\" class=\"table no-wrap table-hover table-sm mb-0\">";
			div += "<thead class=\"bg-primary text-white\"><tr>"
				+ "<th class=\"priority-1\">Nombre Completo</th>"
				+ "<th class=\"priority-2\">Clave Elector</th>"
				+ "<th class=\"priority-3\">Fecha Nacimiento</th>"
				+ "<th  class=\"priority-4\">Calle</th>"
				+ "<th class=\"priority-5\">Numero Ext.</th>"
				+ "<th  class=\"priority-6\">Nombre.</th>"
				+ "<th  class=\"priority-7\">Apellido Pa.</th>"
				+ "<th  class=\"priority-8\">Apellido Ma.</th>"
				+ "<th  class=\"priority-9\">Partido Afiliación.</th>"
				+ "<th  class=\"priority-10\">Num. Int.</th>"
				+ "<th  class=\"priority-11\">CP.</th>"
				+ "<th  class=\"priority-12\">Municipio.</th>"
				+ "<th  class=\"priority-13\">Colonia.</th>"
				+ "<th  class=\"priority-14\">Sección.</th></tr>"
				+ "</thead >";
			for (var i = 0; i < employees.length; i++) {

				div += " <tbody><tr>" +
					"<td class=\"priority-1\">" + employees[i].innerHTML.split('-')[0] + "</td>"
					+ "<td class=\"priority-2\">" + employees[i].innerHTML.split('-')[1] + "</td>"
					+ "<td  class=\"priority-3\">" + employees[i].innerHTML.split('-')[2] + "</td>"
					+ "<td class=\"priority-4\">" + employees[i].innerHTML.split('-')[3] + "</td>"
					+ "<td class=\"priority-5\">" + employees[i].innerHTML.split('-')[4] + "</td>"
					+ "<td class=\"priority-6\">" + employees[i].innerHTML.split('-')[5] + "</td>"
					+ "<td class=\"priority-7\">" + employees[i].innerHTML.split('-')[6] + "</td>"
					+ "<td class=\"priority-8\">" + employees[i].innerHTML.split('-')[7] + "</td>"
					+ "<td class=\"priority-9\">" + employees[i].innerHTML.split('-')[8] + "</td>"
					+ "<td class=\"priority-10\">" + employees[i].innerHTML.split('-')[9] + "</td>"
					+ "<td class=\"priority-11\">" + employees[i].innerHTML.split('-')[10] + "</td>"
					+ "<td class=\"priority-12\">" + employees[i].innerHTML.split('-')[11] + "</td>"
					+ "<td class=\"priority-13\">" + employees[i].innerHTML.split('-')[12] + "</td>"
					+ "<td class=\"priority-14\">" + employees[i].innerHTML.split('-')[13] + "</td>"

					+ "</tr></tbody > ";
			}
			div += "</table>";
			sender._completionListElement.innerHTML = div;
		}

		


	</script>



</asp:Content>
