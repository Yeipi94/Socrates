<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Catalogo.aspx.cs" Inherits="Catalogo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="DataTables/DataTables-1.10.21/css/buttons.dataTables.min.css" rel="stylesheet" />
	<script src="path/to/chartjs/dist/Chart.js"></script>

	<link rel="stylesheet" href="https://www.example.com/arcgis_js_api/library/4.16/dijit/themes/claro/claro.css" />
    <link rel="stylesheet" href="https://www.example.com/arcgis_js_api/library/4.16/esri/themes/light/main.css" />



	<style type="text/css">
		#Select1 {
			height: 16px;
		}

		.showHide {
			cursor: pointer;
		}

		#viewDiv {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
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
	</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	

	<div class="row">
		<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" ScriptMode="Debug"></asp:ScriptManager>
		<div class="alert alert-danger alert-dismissible fade in" role="alert" id="msgError" runat="server" style="display: none; background-color: #ad0a0a; color: #fff"></div>

		<div class="col-sm-6 col-md-6 col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-7 align-self-center">
							<h4 class="card-title mb-3">DISTRITOS ASIGNADOS</h4>
						</div>
						<div class="col-5 align-self-center">
							<div class="customize-input float-right">
<%--								<button type="button" title="Asignaciones" class="btn btn-primary" data-target="#Asignaciones" data-toggle="modal"><span class='fas fa-plus' onclick="BtnExportToExcel_Click"></span>Nuevo</button>--%>
								<asp:Button ID="btnExportToExcel" CssClass="btn btn-primary" runat="server" OnClick="BtnExportToExcel_Click" Text="Exportar a excel" />
							</div>
						</div>
					</div>
					
					

					<div class="row" runat="server">
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

						<div class="table-responsive" style="width: 100%; height: auto; max-height: 400px; overflow-y: scroll">
						<asp:GridView ID="Gw_ListaAsignacion" class="table-striped table-bordered no-wrap table table-sm mb-0 text-center" runat="server" OnPageIndexChanging="Gw_ListaAsignacion_PageIndexChanging" AutoGenerateColumns="false" DataKeyNames="id" PagerSettings-Position="Top" OnRowDataBound="Gw_ListaAsignacion_RowDataBound" OnSelectedIndexChanged="Gw_ListaAsignacion_SelectedIndexChanged" HeaderStyle-CssClass="info">
							<HeaderStyle CssClass="bg-danger text-white" />
							<Columns>
								<asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="false" />
								<asp:BoundField DataField="nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="nombre" />
								<asp:BoundField DataField="fecha_nac" HeaderText="Fecha Nac." SortExpression="fecha_nac" Visible="false" />
								<asp:BoundField DataField="calle" HeaderText="Calle" SortExpression="calle" />
								<asp:BoundField DataField="num_ext" HeaderText="Num. Exterior" SortExpression="num_ext" />
								<asp:BoundField DataField="colonia" HeaderText="Colonia" SortExpression="colonia" />
								<asp:BoundField DataField="d_estado" HeaderText="Estado" SortExpression="d_estado" />
								<asp:BoundField DataField="municipio" HeaderText="Municipio" SortExpression="municipio" />
								<asp:BoundField DataField="distrito_local" HeaderText="Distrito" SortExpression="distrito_local" />
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

		<div class="col-sm-6 col-md-6 col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="embed-container">
						<iframe width="500" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" title="Distrito-Formulario" src="//ssolariss777.maps.arcgis.com/apps/Embed/index.html?webmap=a71bca54920f45a9a025024e6ca9d822&extent=-103.7274,23.9196,-95.614,28.0027&home=true&zoom=true&previewImage=false&scale=true&search=true&searchextent=true&details=true&legendlayers=true&active_panel=details&disable_scroll=true&theme=light"></iframe>					</div>
				</div>
			</div>
		</div>
	</div>

	



	 <asp:HiddenField ID="hfIdEmpleado" runat="server" Visible="false" Value="0" />

	<%--
    
    PONER EN CONTRO TIPO CAJA DE TEXTO
    onchange="javascript:Changed( this );"--%>
	<script src="js/Catalogos.js"></script>
	<script src="js/List_Personas.js"></script>
	<script type="text/javascript">

	

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

