<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<script src="//unpkg.com/d3"></script>
	<style type="text/css">
        body{
            font-family: Avenir, sans-serif;
        }
        svg{
            border:1px solid #bbb;
        }
         #piechart{
            width: 100%; height: 500px;
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
                title: 'Distrito',
               
				slices: {
					0: { color: '#ff4f70' },
					1: { color: '#edf2f6' },
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
				
				 slices: {
					 0: { color: '#22ca80' },
					 1: { color: '#edf2f6' },
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
				 
				 slices: {
					 0: { color: '#5f76e8' },
					 1: { color: '#edf2f6' },
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
				 
				 slices: {
					 0: { color: '#01caf1' },
					 1: { color: '#edf2f6' },
				 },
				 pieHole: 0.50,
			 };
			var chart = new google.visualization.PieChart(document.getElementById('chart_Manzana'));
			 chart.draw(datos, options);
		 }
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 
    <div class="row">
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






   


</asp:Content>

