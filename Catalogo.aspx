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




</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	

	<div class="row">
		<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" ScriptMode="Debug"></asp:ScriptManager>
		<div class="alert alert-danger alert-dismissible fade in" role="alert" id="msgError" runat="server" style="display: none; background-color: #ad0a0a; color: #fff"></div>

		<div class="col-sm-12 col-md-12 col-lg-12">
			<div class="card">
				<div class="card-body">


					<div class="row">
						<div class="col-7 align-self-center">
							<h4 class="card-title mb-3">DISTRITOS ASIGNADOS</h4>

						</div>
						<div class="col-5 align-self-center">
							<div class="customize-input float-right">
								<button type="button" title="Asignaciones" class="btn btn-primary" data-target="#Asignaciones" data-toggle="modal"><span class='fas fa-plus'></span>Nuevo</button>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-xs-12 col-lg-6">
							<div class="form-group">
								<label>Estados</label>
								<asp:DropDownList ID="ddlEstad" runat="server" CssClass="form-control"></asp:DropDownList>
								<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator8" ControlToValidate="ddlEstad" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
								<asp:CascadingDropDown ID="CascadingDropDown3" runat="server" Category="Estados" TargetControlID="ddlEstad" LoadingText="Cargando Estados.." ServicePath="../AutocompletarService.asmx" ServiceMethod="Get_ListEstado" PromptText="Seleccionar Estado"></asp:CascadingDropDown>

							</div>
						</div>

						<div class="col-xs-12 col-lg-6">
							<div class="form-group">
								<label>Municipios</label>
								<asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-control"></asp:DropDownList>
								<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" ControlToValidate="ddlMunicipio" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
								<asp:CascadingDropDown ID="StateCascading" runat="server" Category="Municipios" TargetControlID="ddlMunicipio" ParentControlID="ddlEstad" LoadingText="Cargando Municipios..." ServiceMethod="Get_ListMunicipio" ServicePath="../AutocompletarService.asmx" PromptText="Seleccionar Municipios"></asp:CascadingDropDown>

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








	<%--
    
    PONER EN CONTRO TIPO CAJA DE TEXTO
    onchange="javascript:Changed( this );"--%>
	<script src="js/Catalogos.js"></script>
	<script src="js/List_Personas.js"></script>
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

