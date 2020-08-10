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
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable(<%=obtenerDatos()%>);

        var options = {
            title: 'Distrito',
			slices: {
				0: { color: 'rgb(255, 79, 112)' },
				1: { color: 'rgb(1, 202, 241)' },
            },
            pieHole: 0.50,
            
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

          chart.draw(data, options);

		  var percent = 0;
		  // start the animation loop
		  var handler = setInterval(function () {
			  // values increment
			  percent += 1;
			  // apply new values
			  data.setValue(0, 1, percent);
			  data.setValue(1, 1, 100 - percent);
			  // update the pie
			  chart.draw(data, options);
			  // check if we have reached the desired value
			  if (percent > handler)
				  // stop the loop
				  clearInterval(handler);
		  }, 30);
      }
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 
    <div class="row">
		<div class="col-lg-4 col-md-12">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">Avance por distrito</h4>
					<div id="piechart" class="mt-2" style="height:283px; width:100%;"></div>

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

