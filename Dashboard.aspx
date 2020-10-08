<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<script src="//unpkg.com/d3"></script>
	<style type="text/css">
        body{
            font-family: Avenir, sans-serif;
        }
       /* svg{
            border:1px solid #bbb;
        }*/
         #piechart{
            width: 100%; height: 500px;
        }

		 #map {
       height: 100%;
       width: 500px;
       overflow: hidden;
       float: left;
       border: thin solid #ff6a00;
       }
      #capture {
       height: 360px;
       width: 480px;
       overflow: hidden;
       float: left;
       background-color: #ECECFB;
       border: thin solid #ff6a00;
       border-left: none;
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
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
		google.charts.load('current', { 'packages': ['corechart'] });
		google.charts.setOnLoadCallback(drawChart);
		google.charts.setOnLoadCallback(chart2);
		google.charts.setOnLoadCallback(chart3);
		google.charts.setOnLoadCallback(chart4);


		function drawChart() {

			var datos = google.visualization.arrayToDataTable(<%=obtenerDatos()%>);
			var options = {
				backgroundColor: {
					fill: '#333',
					fillOpacity: 0.1,
				},
				is3D: true,
				legend: {
					position: "bottom",
					textStyle: {
						fontSize: 15,
						color: "#fff"
					},
				},
				slices: {
					0: { color: '#ffab00' },
					1: { color: '#00d25b' },
				},
				pieHole: 0.50,
			};
			var chart = new google.visualization.PieChart(document.getElementById('piechart'));
			chart.draw(datos, options);

		}
		function chart2() {

			var datos = google.visualization.arrayToDataTable(<%=Chart_Regiones()%>);
			 var options = {
				 //title: 'Distrito',
				 backgroundColor: {
					 fill: '#333',
					 fillOpacity: 0.1,
				 },
				 is3D: true,
				 legend: {
					 position: "bottom",
					 textStyle: {
						 fontSize: 15,
						 color: "#fff"
					 },
				 },
				 slices: {
					 0: { color: '#8f5fe8' },
					 1: { color: '#fc424a' },
				 },
				 pieHole: 0.50,
			 };
			var chart = new google.visualization.PieChart(document.getElementById('char_Region'));
			 chart.draw(datos, options);
        }
		function chart3() {

			var datos = google.visualization.arrayToDataTable(<%=Chart_Seccion()%>);
			 var options = {
				 //title: 'Distrito',
				 backgroundColor: {
					 fill: '#333',
					 fillOpacity: 0.1,
				 },
				 legend: {
					 position: "bottom",
					 textStyle: {
						 fontSize: 15,
						 color: "#fff"
					 },
				 },
				 is3D: true,
				 slices: {
					 0: { color: '#01caf1' },
					 1: { color: '#12151e' },
				 },
				 pieHole: 0.50,
			 };
			var chart = new google.visualization.PieChart(document.getElementById('chart_Seccion'));
			 chart.draw(datos, options);
		}
		function chart4() {

			var datos = google.visualization.arrayToDataTable(<%=Chart_Manzana()%>);
			var options = {
				//title: 'Distrito',
				backgroundColor: {
					fill: '#333',
					fillOpacity: 0.1,
				},
				is3D: true,
				legend: {
					position: "bottom",
					textStyle: {
						fontSize: 15,
						color: "#fff"
					},
				},
				slices: {
					0: { color: '#00d25b' },
					1: { color: '#0090e7' },
				},
				pieHole: 0.50,
			};
			var chart = new google.visualization.PieChart(document.getElementById('chart_Manzana'));
			chart.draw(datos, options);
		}


		function initMap() {
			const map = new google.maps.Map(document.getElementById("map"), {
				zoom: 11,
				center: { lat: 41.876, lng: -87.624 }
			});
			const ctaLayer = new google.maps.KmlLayer({
				url: "https://googlearchive.github.io/js-v2-samples/ggeoxml/cta.kml",
				map: map
			});
		}

	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


	<style>
		
	</style>
	
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="card">
				<div class="card-body">
					<div class="embed-container">
						<iframe src="https://ssolariss777.maps.arcgis.com/apps/instant/interactivelegend/index.html?appid=9fc0a77b04b648daa19c5a2ac2fb4c39" width="600" height="450" frameborder="0" style="border:0" allowfullscreen>No se admiten iFrames en esta página.</iframe>			
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">Avance por distrito</h4>
					<div id="piechart" class="mt-2" style="height:283px; width:100%;"></div>
				</div>
			</div>
		</div>
        <div class="col-lg-6 col-md-12">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">Avance por Region</h4>
					<div id="char_Region" class="mt-2" style="height:283px; width:100%;"></div>

				</div>
			</div>
		</div>
        <div class="col-lg-6 col-md-12">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">Avance por Seccion</h4>
					<div id="chart_Seccion" class="mt-2" style="height:283px; width:100%;"></div>
				</div>
			</div>
		</div>
        <div class="col-lg-6 col-md-12">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">Avance por Mananas</h4>
					<div id="chart_Manzana" class="mt-2" style="height:283px; width:100%;"></div>

				</div>
			</div>
		</div>
     <div class="col-md-12">
			<div class="card">
				<div class="card-body">
					<iframe id="map" src="https://www.google.com/maps/d/u/3/embed?mid=1W-Cu-4tpDzt8_d706OxEyxfIeK2bdw-u" style="width: 100%; height: 600px;"></iframe>
				</div>
			</div>
		</div>
	</div>

	
    

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">Avance Distrital</h4>
					<div class="row" runat="server" visible="false">

						<div class="table-responsive">
							<asp:GridView ID="GridView1" class="table-bordered no-wrap table table-sm mb-0" runat="server"  AutoGenerateColumns="false" DataKeyNames="fk_idEstado" DataSourceID="SqlDataSource1" PagerSettings-Position="Top"  HeaderStyle-CssClass="info">
								<HeaderStyle CssClass="bg-danger text-white" />
								<Columns>
									<asp:BoundField DataField="fk_idEstado" HeaderText="Distrito" ReadOnly="True" SortExpression="fk_idEstado" />
									<asp:BoundField DataField="Meta" HeaderText="Meta Completo" SortExpression="Meta" />
									<asp:BoundField DataField="Avance" HeaderText="Avance" SortExpression="Avance" />
									<asp:BoundField DataField="Faltante" HeaderText="Faltante" SortExpression="Faltante" />
									<asp:BoundField DataField="AvancePorciento" HeaderText="Avance %" SortExpression="AvancePorciento" />
									<asp:BoundField DataField="FaltantePorciento" HeaderText="Faltante %" SortExpression="FaltantePorciento" />
								</Columns>
								<HeaderStyle />
								<PagerSettings Mode="NumericFirstLast" Position="Bottom" FirstPageText="1" LastPageText="2" NextPageText="3" PreviousPageText="" Visible="false" />
								<PagerStyle VerticalAlign="Bottom" />
							</asp:GridView>
							<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SISTEM_ALIADOSConnectionString %>"></asp:SqlDataSource>
						</div>

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
                                <div class="row" runat="server">
                                     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                                     <div class="col-xs-12 col-lg-3">
                            <div class="form-group">
                                <label>Estados</label>
                                <asp:DropDownList ID="ddlEstad" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlEstad_SelectedIndexChanged"></asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="ddlEstad" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
                                <asp:CascadingDropDown ID="CascadingDropDown3" runat="server" Category="Estados" TargetControlID="ddlEstad" LoadingText="Cargando Estados.." ServicePath="../AutocompletarService.asmx" ServiceMethod="Get_Estados" PromptText="Selecciona"></asp:CascadingDropDown>

                            </div>
                        </div>
                        <div class="col-xs-12 col-lg-3">
                            <div class="form-group">
                                <label>Municipio</label>
                                <asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
<%--                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="ddlMunicipio" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>--%>
                                <%--                                    <asp:CascadingDropDown ID="CascadingDropDown2" runat="server" Category="Municipio" TargetControlID="ddlMunicipio" LoadingText="Cargando Estados.." ParentControlID="ddlEstad"  ServicePath="../AutocompletarService.asmx" ServiceMethod="Get_Municipios" PromptText="Selecciona"></asp:CascadingDropDown>--%>
                            </div>
                        </div>
                                </div>
                       <%-- <div class="d-flex align-items-center mb-4">
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
                        </div>--%>
                         

                        <div class="table-responsive">
                            <asp:GridView ID="GvwMetas" class="table-bordered no-wrap table table-sm mb-0" runat="server" OnPageIndexChanging="GvwMetas_PageIndexChanging" AutoGenerateColumns="false" DataKeyNames="seccion" DataSourceID="SqlDataSource2" PagerSettings-Position="Top" OnRowDataBound="GvwMetas_RowDataBound" OnSelectedIndexChanged="GvwMetas_SelectedIndexChanged" HeaderStyle-CssClass="info">
                                <HeaderStyle CssClass="bg-danger text-white" />
                                <Columns>
                                    <asp:BoundField DataField="seccion" HeaderText="seccion" ReadOnly="True" SortExpression="seccion" />
                                    <asp:BoundField DataField="Meta" HeaderText="Meta Completo" SortExpression="Meta" />
                                    <asp:BoundField DataField="Avance" HeaderText="Avance" SortExpression="Avance" />
                                    <asp:BoundField DataField="Faltante" HeaderText="Faltante" SortExpression="Faltante" />
                                    <asp:BoundField DataField="AvancePorciento" HeaderText="Avance %" SortExpression="AvancePorciento" />
                                    <asp:BoundField DataField="FaltantePorciento" HeaderText="Faltante %" SortExpression="FaltantePorciento" />
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




	<script  type="text/javascript">
		var elements = document.getElementsByClassName('esri-feature-fields__field-data');

		for (var i = 0; i < elements.length; i++) {
			var element = elements[i];

			setCoordinates(element);
		}
	</script>





</asp:Content>

