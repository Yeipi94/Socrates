<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Territorial.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="Territorial" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

	<script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places'></script>
	<script src="../dist/locationpicker.jquery.min.js"></script>
	<script src="../src/angularLocationpicker.jquery.js"></script>


<%--	<script type="text/html" src="https://maps.googleapis.com/maps/api/place/details/json?placeid=ChIJrTLr-GyuEmsRBfy61i59si0&key=AIzaSyCxW-VPfw8x42DIwrfQ9gL8sh-iu42QhCY"></script>--%>



	<style>
		#map {
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
	</style>
	<script type="text/javascript">


		/*FUNCION PARA LLENAR CAJAS DE TEXTO DESPUES DE SELECCIONAR OPCION AUTOCOMPLETADO*/
		function ClientItemSelected(sender, e) {
			var row = e._item.parentElement;
			$get("<%=txtClaveE.ClientID %>").value = row.getElementsByTagName('td')[1].textContent;


		}

		/*FUNCION PARA MOSTRAR RESULTADOS DE AUTOCOMPPLETADO EN UNA TABLA*/
		function Employees_Populated(sender, e) {
			var employees = sender.get_completionList().childNodes;
			var div = "<table class=\"table table-sm mb-0\">";
			div += "<thead><tr><th>Nombre Completo</th><th>Clave Elector</th><th>Fecha Nacimiento</th><th>Calle</th><th>Numero Ext.</th></tr> </thead>";
			for (var i = 0; i < employees.length; i++) {

				div += " <tbody><tr><td>" + employees[i].innerHTML.split('-')[0] + "</td><td>" + employees[i].innerHTML.split('-')[1] + "</td><td>" + employees[i].innerHTML.split('-')[2] + "</td><td>" + employees[i].innerHTML.split('-')[3] + "</td><td>" + employees[i].innerHTML.split('-')[4] + "</td></tr></tbody>";
			}
			div += "</table>";
			sender._completionListElement.innerHTML = div;
		}

		function load() {
			if (GBrowserIsCompatible()) {
				var map = new GMap2(document.getElementById("map"));
				map.setCenter(new GLatLng(37.4419, -122.1419), 13);
			}
		}




		function SetContextKey() {

			$find('<%=AutoCompleteExtender1.ClientID %>').set_contextKey($get("<%=ddlEstados_Cat.ClientID %>").value);
		}

		function pageLoad() {
			$("#<%=ddlEstados_Cat.ClientID%>").select2({
				placeholder: "Seleccionar Estado",

			});


			$("#<%=cord1.ClientID%>").select2({
				placeholder: "Y",

			});
			$("#<%=cord2.ClientID%>").select2({
				placeholder: "X",

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
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBbmMQ2Ma1uZKipVyBagGkaxAmd65aRXPg&callback=initMap&libraries=places">
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


	<div class="col-xl-12">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title mb-3">ASIGNACIÓN TERRITORIAL</h4>

				<%--NAVEGACION TABS--%>
				<ul class="nav nav-pills bg-nav-pills nav-justified mb-2">
					<li class="nav-item">
						<a href="#DatPer" aria-expanded="true"
							class="nav-link rounded-0 active">
							<span class="tab-justified">Datos Personales</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="#Direccion" aria-expanded="false"
							class="nav-link rounded-0">
							<span class="tab-justified">Direccion</span>
						</a>
					</li>

				</ul>
				<%--CONTENIDO TABS--%>
				<div class="tab-content" id="regTab">
					<div class="tab-pane show active" id="DatPer">

						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<div class="col-sm-12 col-md-12 col-lg-12 m-auto">
											<div class="row">
												<%--CONTENIDO 1--%>
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
														<asp:TextBox ID="txtAutocomplete" CssClass="form-control" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="true" placeholder="Nombre Completo" onkeyup="SetContextKey()"></asp:TextBox>
														<cc1:AutoCompleteExtender ServiceMethod="Autocompletar"
															MinimumPrefixLength="2"
															CompletionInterval="200"
															EnableCaching="false"
															CompletionSetCount="10"
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
														<asp:TextBox ID="txtClaveE" runat="server" CssClass="form-control"></asp:TextBox>
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
														<label>Fecha Nac.</label>
														<asp:TextBox ID="txtFechaN" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
														<small>
															<asp:RequiredFieldValidator runat="server" ID="RFechaN" ControlToValidate="txtFechaN" CssClass="float-right" ErrorMessage="* Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator></small>
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

					</div>
					<div class="tab-pane" id="Direccion">
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


																<%--CONTENIDO 2--%>








																<div class="col-xs-12 col-lg-4">
																	<div class="form-group">
																		<label>Estados</label>
																		<asp:DropDownList ID="ddlEstad" runat="server" CssClass="form-control"></asp:DropDownList>
																		<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator8" ControlToValidate="ddlEstad" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
																		<asp:CascadingDropDown ID="CascadingDropDown3" runat="server" Category="Estados" TargetControlID="ddlEstad" LoadingText="Cargando Estados.." ServicePath="../AutocompletarService.asmx" ServiceMethod="Get_ListEstado" PromptText="Seleccionar Estado"></asp:CascadingDropDown>

																	</div>
																</div>

																<div class="col-xs-12 col-lg-4">
																	<div class="form-group">
																		<label>Municipios</label>
																		<asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-control"></asp:DropDownList>
																		<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" ControlToValidate="ddlMunicipio" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
																		<asp:CascadingDropDown ID="StateCascading" runat="server" Category="Municipios" TargetControlID="ddlMunicipio" ParentControlID="ddlEstad" LoadingText="Cargando Municipios..." ServiceMethod="Get_ListMunicipio" ServicePath="../AutocompletarService.asmx" PromptText="Seleccionar Municipios"></asp:CascadingDropDown>

																	</div>
																</div>

																<div class="col-xs-12 col-lg-4">
																	<label>Distritos</label>
																	<div class="input-group">
																		<asp:DropDownList ID="ddlDistrito" runat="server" CssClass="form-control"></asp:DropDownList>


																	</div>
																	<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator10" ControlToValidate="ddlDistrito" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
																	<asp:CascadingDropDown ID="CityCascading" runat="server" Category="Distritos" TargetControlID="ddlDistrito" ParentControlID="ddlMunicipio" LoadingText="Cargando Distritos..." ServiceMethod="Get_ListDistrito" ServicePath="../AutocompletarService.asmx" PromptText="Seleccionar Distritos"></asp:CascadingDropDown>
																</div>





																<div class="col-xs-12 col-lg-4" id="Regiones" runat="server">
																	<label>Regiones</label>
																	<div class="input-group">
																		<asp:DropDownList ID="ddlRegiones" runat="server" CssClass="form-control"></asp:DropDownList>


																	</div>
																	<%--						<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator11" ControlToValidate="ddlRegiones" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="Regional"></asp:RequiredFieldValidator>--%>
																	<asp:CascadingDropDown ID="CascadingDropDown1" runat="server" Category="Regiones" TargetControlID="ddlRegiones" ParentControlID="ddlDistrito" LoadingText="Cargando Regiones..." ServiceMethod="Get_ListRegiones" ServicePath="../AutocompletarService.asmx" PromptText="Seleccionar Regiones"></asp:CascadingDropDown>
																</div>
																<div class="col-xs-12 col-lg-4" id="sec_on" runat="server">
																	<label>Secciones</label>
																	<div class="input-group">
																		<asp:DropDownList ID="ddlSecciones" runat="server" CssClass="form-control"></asp:DropDownList>

																	</div>
																	<%--						<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator12" ControlToValidate="ddlSecciones" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="Seccional"></asp:RequiredFieldValidator>--%>
																	<asp:CascadingDropDown ID="CascadingDropDown2" runat="server" Category="Secciones" TargetControlID="ddlSecciones" ParentControlID="ddlRegiones" LoadingText="Cargando Secciones..." ServiceMethod="Get_ListSecciones" ServicePath="../AutocompletarService.asmx" PromptText="Seleccionar Sección"></asp:CascadingDropDown>
																</div>
																<div class="col-xs-12 col-lg-4" id="Manzanas" runat="server">
																	<label>Manzanas</label>
																	<div class="input-group">
																		<asp:DropDownList ID="ddlManzanas" runat="server" CssClass="form-control"></asp:DropDownList>
																	</div>
																	<%--                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator13" ControlToValidate="ddlManzanas" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="Manzanero"></asp:RequiredFieldValidator>--%>
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

							</ContentTemplate>
						</asp:UpdatePanel>
						<div class="row">
							<div class="col-sm-12 col-md-12">
								<div class="card">
									<div class="card-body">
										<div class="row">
											<div class="col-xs-12 col-lg-6 col-md-12">
												<label>Ubicación</label>
												<asp:TextBox ID="txtUbicacionMaps" CssClass="form-control" runat="server"></asp:TextBox>
											</div>
											<div class="col-xs-12 col-lg-3 col-md-6">
												<div class="form-group">
													<label>Latitud</label>

													<asp:TextBox ID="cord1" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
												</div>
											</div>
											<div class="col-xs-12 col-lg-3 col-md-6">
												<div class="form-group">
													<label>Longitud</label>

													<asp:TextBox ID="cord2" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
												</div>
											</div>


										</div>

										<%--											<div id="map2"></div>--%>
										<div class="row">
											<div id="locationpickerOptions2" style="width: 100%; height: 400px;"></div>
											<div class="clearfix">&nbsp;</div>
										</div>

									</div>
								</div>
							</div>

						</div>

						<div class="col-12">
						</div>

					</div>
				</div>
				<%--BOTONES--%>
				<div>
					<div style="overflow: auto;">
						<div style="float: right;">
							<button type="button" class="btn btn-dark" id="prevBtn" onclick="nextPrev(-1)">Anterior</button>
							<button type="button" class="btn waves-effect waves-light btn-primary" id="nextBtn" onclick="nextPrev(1)">Siguiente</button>
							<asp:Button ID="Add_Registro" runat="server" CssClass="btn btn-dark" Text="Agregar" OnClick="btnRegistrar_Click" ValidationGroup="FrmRequerido" />
						</div>
						<%--<div class="modal-footer">
								<button type="button" class="btn btn-primary" onclick="return confirm('¿Esta seguro que desea cancelar?')" data-dismiss="modal">Close</button>
								
							</div>--%>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-sm-12 col-md-12 col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<%--<h6>Haga clic para mostrar u ocultar columna: </h6>
								<div class="btn-list">
									<button type="button" class="showHide btn waves-effect waves-light btn-success" data-columnindex="0">Distrito</button>
									<button type="button" class="showHide btn waves-effect waves-light btn-success" data-columnindex="1">Nombre</button>
									<button type="button" class="showHide btn waves-effect waves-light btn-success" data-columnindex="2">Appellido Pa.</button>
									<button type="button" class="showHide btn waves-effect waves-light btn-success" data-columnindex="3">Apellido Ma</button>
								</div>
								<br />--%>
					<div class="table-responsive">
						<table id="studentTable" class="table table-striped table-bordered no-wrap" data-order='[[ 0, "asc" ]]' data-page-length='25'>
							<thead>
								<tr>
									<th>Distrito</th>
									<th>Nombre</th>
									<th>Apellido Pa.</th>
									<th>Apellido Ma.</th>
									<%--						Y/th>--%>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>id_Distrital</th>
									<th>nombre</th>
									<th>apellido_paterno</th>
									<th>apellido_materno</th>
									<%--<th>
											<button type = "button" value = "Actualizar" title = "Actualizar" class= "btn btn-primary btn-circle" data-target="#imodal" data-toggle="modal" > <i class="far fa-edit"></i></button ><button type="button" value="Eliminar" title="Eliminar" class="btn btn-danger btn-circle"><i class="fas fa-eraser" aria-hidden="true"></i></button>
										</th>--%>
								</tr>
							</tfoot>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>


	<div class="col-sm-12 col-md-12 col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<h4 class="card-title">Estadistica Secciones 2009</h4>
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label>Lista Top 25% Gral.</label>
								<asp:TextBox ID="txtgral2009" runat="server" class="form-control" Enabled="false"></asp:TextBox>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>Top 25% votos</label>
								<asp:TextBox ID="txtporciento2009" runat="server" class="form-control" Enabled="false"></asp:TextBox>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>Top 25% vs 2°Lug.</label>
								<asp:TextBox ID="txtdif2009" runat="server" class="form-control" Enabled="false"></asp:TextBox>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>"Meta 3 de 3"</label>
								<asp:TextBox ID="txtcond2009" runat="server" class="form-control" Enabled="false"></asp:TextBox>
							</div>
						</div>
					</div>
					<h4 class="card-title">Estadistica Secciones 2015</h4>
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label>Lista Top 25% Gral.</label>
								<asp:TextBox ID="txtgral2015" runat="server" class="form-control" Enabled="false"></asp:TextBox>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>Top 25% votos</label>
								<asp:TextBox ID="txtporciento2015" runat="server" class="form-control" Enabled="false"></asp:TextBox>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>Top 25% vs 2°Lug.</label>
								<asp:TextBox ID="txtdif2015" runat="server" class="form-control" Enabled="false"></asp:TextBox>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>"Meta 3 de 3"</label>
								<asp:TextBox ID="txtcond2015" runat="server" class="form-control" Enabled="false"></asp:TextBox>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-12 col-md-12 col-lg-12" runat="server" visible="false">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div style="width: 100%; height: auto; max-height: 400px; overflow-y: scroll" class="table-responsive">
						<asp:GridView ID="GvwMonterrey" class="table table-striped table-bordered no-wrap" runat="server" OnPageIndexChanging="GvwMonterrey_PageIndexChanging" AutoGenerateColumns="false" DataKeyNames="id" DataSourceID="SqlDataSource1" PagerSettings-Position="Top" OnRowDataBound="GvwMonterrey_RowDataBound" OnSelectedIndexChanged="GvwMonterrey_SelectedIndexChanged" HeaderStyle-CssClass="info" ShowHeader="true">
							<HeaderStyle CssClass="bg-danger text-white" />
							<Columns>
								<asp:TemplateField>
									<HeaderTemplate>
										<asp:Label ID="lblHeaderAsignar" runat="server" Text="Estado"></asp:Label>
									</HeaderTemplate>
									<ItemTemplate>
										<asp:CheckBox ID="chkSeleccionar" runat="server" Checked="true" />
									</ItemTemplate>
								</asp:TemplateField>
								<asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="false" />
								<%--                                <asp:BoundField DataField="clave_elector" HeaderText="Clave elector" SortExpression="clave_elector" />--%>
								<asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
								<asp:BoundField DataField="apellido_paterno" HeaderText="Apellido Pa." SortExpression="apellido_paterno" />
								<asp:BoundField DataField="apellido_materno" HeaderText="Apellido Ma." SortExpression="apellido_materno" />
								<asp:BoundField DataField="colonia" HeaderText="Colonia." SortExpression="colonia" />
								<%--                                <asp:BoundField DataField="estado" HeaderText="estado" SortExpression="estado" />--%>
								<%--                                <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-rounded btn-danger" ShowSelectButton="true" />--%>
							</Columns>
							<HeaderStyle />
							<PagerSettings Mode="NumericFirstLast" Position="Bottom" FirstPageText="1" LastPageText="2" NextPageText="3" PreviousPageText="" Visible="false" />
							<PagerStyle VerticalAlign="Bottom" />
						</asp:GridView>
						<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SISTEM_ALIADOSConnectionString %>" OnSelected="SqlDataSource1_Selected"></asp:SqlDataSource>
					</div>

				</div>
			</div>
		</div>
	</div>



















	<script>


		$('#locationpickerOptions2').locationpicker({
			radius: 5,
			location: {
				latitude: 25.6438666,
				longitude: -100.2769715
			},
			enableAutocomplete: true,
			inputBinding: {
				latitudeInput: $('#<%=cord1.ClientID%>'),
				longitudeInput: $('#<%=cord2.ClientID%>'),
				locationNameInput: $('#<%=txtUbicacionMaps.ClientID%>')
			},

			onchanged: function (currentLocation, radius, isMarkerDropped) {
				var Latitud = parseFloat($get('<%=cord1.ClientID %>').value);
				var Longitud = parseFloat($get("<%=cord2.ClientID %>").value);
				var mty = { lat: Latitud, lng: Longitud };

			}


		});
		$('#nextBtn').on('show.bs.locationpickerOptions2', function () {
			$('#locationpickerOptions2').locationpicker('autosize');
		});



		$(document).ready(function () {
			$('.js-example-basic-single').select2();
		});




	</script>
	<script src="js/Tabs.js"></script>
	<script src="js/Catalogos.js"></script>



</asp:Content>
