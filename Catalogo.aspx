<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Catalogo.aspx.cs" Inherits="Catalogo" %>

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

						<div class="table-responsive">
						<asp:GridView ID="Gw_ListaAsignacion" class="table-striped table-bordered no-wrap table table-sm mb-0 text-center" runat="server" OnPageIndexChanging="Gw_ListaAsignacion_PageIndexChanging" AutoGenerateColumns="false" DataKeyNames="clave_elector" PagerSettings-Position="Top" OnRowDataBound="Gw_ListaAsignacion_RowDataBound" OnSelectedIndexChanged="Gw_ListaAsignacion_SelectedIndexChanged" HeaderStyle-CssClass="info">
							<HeaderStyle CssClass="bg-danger text-white" />
							<Columns>
								<asp:BoundField DataField="clave_elector" HeaderText="Clave Elector" ReadOnly="True" SortExpression="clave_elector" />
								<asp:BoundField DataField="nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="nombre" />
								<asp:BoundField DataField="fecha_nac" HeaderText="Fecha Nac." SortExpression="fecha_nac" />
								<asp:BoundField DataField="calle" HeaderText="Calle" SortExpression="calle" />
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

					<%--<div class="row">
						<div class="table-responsive">
						



					<asp:GridView ID="grdAsignaciones" runat="server" CssClass="table-bordered no-wrap table table-sm mb-0" AutoGenerateColumns="false">
						<HeaderStyle CssClass="bg-danger text-white" />
                                            <Columns>
                                                   
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblHeaderid" runat="server" Text="id"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:HiddenField ID="hfIdMenu" Visible="false" runat="server" Value='<%#Eval("id") %>' />
                                                        <asp:Label ID="lblNombreMenu" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblHeaderRuta" runat="server" Text="Clave Elector"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRutaMenu" runat="server" Text='<%#Eval("clave_elector") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                               <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblHeaderRuta" runat="server" Text="Nombre"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRutaMenu" runat="server" Text='<%#Eval("nombre") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
												<asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblHeaderRuta" runat="server" Text="Apellido Paterno"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRutaMenu" runat="server" Text='<%#Eval("apellido_paterno") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
												<asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblHeaderRuta" runat="server" Text="Apellido Materno"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRutaMenu" runat="server" Text='<%#Eval("apellido_materno") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
												
                                               <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblHeaderRuta" runat="server" Text="Asignación"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRutaMenu" runat="server" Text='<%#Eval("fk_Catalogo_Asignado") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                               
                                            </Columns>
                                        </asp:GridView>
					</div>
					</div>
					--%>
				</div>
			</div>
		</div>

		<div class="col-sm-6 col-md-6 col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="embed-container">
						<iframe src="https://ssolariss777.maps.arcgis.com/apps/instant/interactivelegend/index.html?appid=9fc0a77b04b648daa19c5a2ac2fb4c39" width="100" height="400" frameborder="0" style="border: 0" allowfullscreen>No se admiten iFrames en esta página.</iframe>
					</div>
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

