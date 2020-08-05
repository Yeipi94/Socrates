<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Catalogo.aspx.cs" Inherits="Catalogo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="DataTables/DataTables-1.10.21/css/buttons.dataTables.min.css" rel="stylesheet" />
	<script src="path/to/chartjs/dist/Chart.js"></script>

	<style type="text/css">
		#Select1 {
			height: 16px;
		}

		.showHide {
			cursor: pointer;
		}
	</style>

	<script type="text/javascript">


		function pageLoad() {
			$("#<%=ddlEstado.ClientID%>").select2({
				placeholder: "Seleccionar Estado",

			});
			$("#<%=ddlMunicipio.ClientID%>").select2({
				placeholder: "Seleccionar Estado",

			});
			$("#<%=ddlColonia.ClientID%>").select2({
				placeholder: "Seleccionar Estado",

			});
			$("#<%=ddlEstatus.ClientID%>").select2({
				placeholder: "Seleccionar Estado",

			});
		}


	</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	
			<div class="row">
				<div class="alert alert-danger alert-dismissible fade in" role="alert" id="msgError" runat="server" style="display: none; background-color: #ad0a0a; color: #fff"></div>
				<canvas id="goodCanvas1" width="400" height="100" aria-label="Hello ARIA World" role="img"></canvas>

				<div class="col-sm-12 col-md-12 col-lg-12">
					<div class="card">
						<div class="card-body">


							<div class="row">
								<div class="col-7 align-self-center">
									<h4 class="card-title mb-3">ASIGNACIÓN TERRITORIAL</h4>

								</div>
								<div class="col-5 align-self-center">
									<div class="customize-input float-right">
										<button type="button" title="Asignaciones" class="btn btn-primary" data-target="#Asignaciones" data-toggle="modal"><span class='fas fa-plus'></span>Nuevo</button>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-12 col-md-6 col-lg-3">

									<div class="form-group">
										<label>Estados</label>
										<asp:DropDownList ID="ddlEstado" runat="server" CssClass="js-example-basic-single" Width="100%" OnSelectedIndexChanged="MunicipioSeleccionado" AutoPostBack="true"></asp:DropDownList>
									</div>
								</div>
								<div class="col-sm-12 col-md-6 col-lg-3">
									<div class="form-group">
										<label>Municipios</label>
										<asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="js-example-basic-single" Width="100%" AutoPostBack="true" OnSelectedIndexChanged="ColoniaSeleccionar"></asp:DropDownList>
									</div>
								</div>
								<div class="col-sm-12 col-md-6 col-lg-3">
									<div class="form-group">
										<label>Colonias</label>
										<asp:DropDownList ID="ddlColonia" runat="server" CssClass="js-example-basic-single" Width="100%"></asp:DropDownList>
									</div>
								</div>
								<div class="col-sm-12 col-md-6 col-lg-3">
									<div class="form-group">
										<label>Estatus</label>
										<asp:DropDownList ID="ddlEstatus" runat="server" CssClass="js-example-basic-single" Width="100%" OnTextChanged="DdlNivel_TextChanged"></asp:DropDownList>
									</div>
								</div>

								<div class="input-group">
									<div class="input-group-btn">
										<asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" OnClick="btnBuscar_Click1" Text="Buscar" />

										<%--								<button type="button" class="btn btn-primary" id="btnactualizar">Buscar</button>--%>
									</div>
								</div>
							</div>


							<div class="table-responsive">
								<table id="tbl_personas" class="table table-striped table-bordered no-wrap">
									<thead>
										<tr>
											<th>Clave Elector</th>
											<th>Nombre Completo</th>
											<th>Colonia</th>
											<th>Municipio</th>
											<th>Entidad</th>
											<%--                                    <th>Acciones</th>--%>
										</tr>
									</thead>
									<%--<tfoot>
											<tr>
												<th>Clave Elector</th>
												<th>Nombre Completo</th>
												<th>Colonia</th>
												<th>Municipio</th>
												<th>Entidad</th>
											</tr>
										</tfoot>--%>
									<%-- <tbody id="tbl_body_table">
                                <!-- DATA POR MEDIO DE AJAX-->
                            </tbody>--%>
									<tbody>
										<!-- DATA POR MEDIO DE AJAX-->
									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>


			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Avance Secciones</h4>
							<div class="row" runat="server" visible="false">
								<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

								<div class="col-xs-12 col-lg-3">
									<div class="form-group">
										<label>Distritales</label>
										<%-- <asp:DropDownList ID="ddlEstad" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlEstad_SelectedIndexChanged"></asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="ddlEstad" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
                                <asp:CascadingDropDown ID="CascadingDropDown3" runat="server" Category="Estados" TargetControlID="ddlEstad" LoadingText="Cargando Estados.." ServicePath="../AutocompletarService.asmx" ServiceMethod="Get_Estados" PromptText="Selecciona"></asp:CascadingDropDown>--%>
									</div>
								</div>
								<div class="col-xs-12 col-lg-3">
									<div class="form-group">
										<label>Municipio</label>
										<asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
										<%--                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="ddlMunicipio" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>--%>
										<%--                                    <asp:CascadingDropDown ID="CascadingDropDown2" runat="server" Category="Municipio" TargetControlID="ddlMunicipio" LoadingText="Cargando Estados.." ParentControlID="ddlEstad"  ServicePath="../AutocompletarService.asmx" ServiceMethod="Get_Municipios" PromptText="Selecciona"></asp:CascadingDropDown>--%>
									</div>
								</div>
							</div>
							<div class="d-flex align-items-center mb-4">
								<h4 class="card-title">Meta | Sección</h4>
								<div class="ml-auto">
									<div class="dropdown sub-dropdown">
										<button class="btn btn-link text-muted dropdown-toggle" type="button"
											id="dd1" data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">
											<i data-feather="more-vertical"></i>
										</button>
										<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd1">
											<a class="dropdown-item" href="#">Insert</a>
											<a class="dropdown-item" href="#">Update</a>
											<a class="dropdown-item" href="#">Delete</a>
										</div>
									</div>
								</div>
							</div>


							<div class="table-responsive">
								<asp:GridView ID="Gw_ListaAsignacion" class="table-bordered no-wrap table table-sm mb-0" runat="server" OnPageIndexChanging="Gw_ListaAsignacion_PageIndexChanging" AutoGenerateColumns="false" DataKeyNames="clave_elector" PagerSettings-Position="Top" OnRowDataBound="Gw_ListaAsignacion_RowDataBound" OnSelectedIndexChanged="Gw_ListaAsignacion_SelectedIndexChanged" HeaderStyle-CssClass="info">
									<HeaderStyle CssClass="bg-danger text-white" />
									<Columns>
										<asp:BoundField DataField="clave_elector" HeaderText="seccion" ReadOnly="True" SortExpression="nombre" />
										<asp:BoundField DataField="nombre" HeaderText="seccion" ReadOnly="True" SortExpression="nombre" />
										<asp:BoundField DataField="fecha_nac" HeaderText="Avance" SortExpression="fecha_nac" />
										<asp:BoundField DataField="calle" HeaderText="Faltante" SortExpression="calle" />
										<asp:BoundField DataField="num_ext" HeaderText="Num. Exterior" SortExpression="num_ext" />
										<asp:BoundField DataField="colonia" HeaderText="Colonia" SortExpression="colonia" />
									</Columns>
									<HeaderStyle />
									<PagerSettings Mode="NumericFirstLast" Position="Bottom" FirstPageText="1" LastPageText="2" NextPageText="3" PreviousPageText="" Visible="false" />
									<PagerStyle VerticalAlign="Bottom" />
								</asp:GridView>
								<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SISTEM_ALIADOSConnectionString %>"></asp:SqlDataSource>
							</div>


						</div>
					</div>
				</div>
			</div>



			<div class="row">


				<div class="col-8" runat="server" visible="false">
					<div class="card">

						<div class="card-body">

							<div class="">
								<b class="label label-danger">Haga clic para mostrar u ocultar columna: </b>
								<div class="btn-group">


									<a class="showHide btn waves-effect waves-light btn btn-success" data-columnindex="0">Distrito</a>
									<a class="showHide btn waves-effect waves-light btn btn-success" data-columnindex="1">Nombre</a>
									<a class="showHide btn waves-effect waves-light btn btn-success" data-columnindex="2">Appellido Pa.</a>
									<a class="showHide btn waves-effect waves-light btn btn-success" data-columnindex="3">Apellido Ma</a>
								</div>
							</div>
							<br />
							<div class="box-body table-responsive">
								<table id="studentTable" class="table table-bordered table-hover text-center">
									<thead>
										<tr>
											<th>Distrito</th>
											<th>Nombre</th>
											<th>Apellido Pa.</th>
											<th>Apellido Ma.</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>id_Distrital</th>
											<th>nombre</th>
											<th>apellido_paterno</th>
											<th>apellido_materno</th>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>


				<canvas id="myChart" width="400" height="400"></canvas>


			</div>
	

	<script src="js/List_Personas.js"></script>


	<%--
    
    PONER EN CONTRO TIPO CAJA DE TEXTO
    onchange="javascript:Changed( this );"--%>
	<script src="js/Catalogos.js"></script>
	<script type="text/javascript">

		//function ListaDistritos() {

		//	var obj = JSON.stringify({
		//		id: JSON.stringify(data[0]),
		//		Estado: $("#ddlEstado").val(),
		//		municipio: $("#ddlMunicipio").val(),
		//		colonia: $("#ddlColonia").val(),
		//	});

		//	$.ajax({
		//		type: "POST",
		//		url: "../Catalogos.asmx/ListarPersonas",
		//		data: obj,
		//		dataType: "json",
		//		contentType: 'application/json; charset=utf-8',

		//		success: function (data) {

		//			var datatableVariable = $('#tbl_personas').DataTable({

		//				data: data,

		//				columns: [

		//					{ 'data': 'clave' },
		//					{ 'data': 'Nombre_Comp' },
		//					{ 'data': 'colonia' },
		//					{ 'data': 'municipio' },
		//					{ 'data': 'entidad' },
		//					//{ 'data': 'Estado' },
		//					//{ 'data': 'Ver' }


		//				],
		//				"language": {
		//					"url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
		//				}

		//			});


		//		}
		//	});
		//}




		//$("#btnactualizar").click(function (e) {
		//	e.preventDefault();
		//	ListaDistritos();


		//	var id_Estado = $.trim($("[id*=ddlEstado]").val());
		//	var id_Municipio = $.trim($("[id*=ddlMunicipio]").val());
		//	var id_Colonia = $.trim($("[id*=ddlColonia]").val());
		//	alert("Hola" + id_Estado);
		//});

		//$(function () {
		//	$("[id*=btnBuscar]").click(function () {
		//		var id_Estado = $.trim($("[id*=ddlEstado]").val());
		//		var id_Municipio = $.trim($("[id*=ddlMunicipio]").val());
		//		var id_Colonia = $.trim($("[id*=ddlColonia]").val());
		//		$.ajax({
		//			type: "POST",
		//			url: "../Catalogos.asmx/ListarPersonas",
		//			data: "{ id_Estado: '" + id_Estado + "', id_Municipio: " + id_Municipio + "',id_Colonia: " + id_Colonia + "}",

		//			contentType: "application/json; charset=utf-8",
		//			dataType: "json",
		//			success: function (r) {
		//				alert("Enviado");
		//			},
		//			error: function (r) {
		//				alert(r.responseText);
		//			},
		//			failure: function (r) {
		//				alert(r.responseText);
		//			}
		//		});
		//		return false;
		//	});
		//});


		var ctx = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
				datasets: [{
					label: '# of Votes',
					data: [12, 19, 3, 5, 2, 3],
					backgroundColor: [
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)'
					],
					borderColor: [
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)'
					],
					borderWidth: 1
				}]
			},
			options: {
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true
						}
					}]
				}
			}
		});


	</script>
</asp:Content>

