<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Seccionales.aspx.cs" Inherits="Seccionales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<style>
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<div class="row">
		<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" ScriptMode="Debug"></asp:ScriptManager>
		<div class="alert alert-danger alert-dismissible fade in" role="alert" id="msgError" runat="server" style="display: none; background-color: #ad0a0a; color: #fff"></div>

		<div class="col-sm-12 col-md-12 col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-7 align-self-center">
							<h4 class="card-title mb-3">SECCIONES ASIGNADAS</h4>
						</div>
						<div class="col-5 align-self-center">
							<div class="customize-input float-right">
								<asp:Button ID="btnExportToExcel" CssClass="btn btn-primary" runat="server" OnClick="BtnExportToExcel_Click" Text="Exportar a excel" />
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
					<div class="table-responsive" style="width: 100%; height: auto; max-height: 400px; overflow-y: scroll">
						<asp:GridView ID="Gw_ListaAsignacion" class="table-bordered no-wrap table table-sm mb-0" runat="server"  AutoGenerateColumns="false" DataKeyNames="id" PagerSettings-Position="Top"  HeaderStyle-CssClass="info">
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
								<asp:BoundField DataField="seccion" HeaderText="sección" SortExpression="seccion" />
							</Columns>
							<HeaderStyle />
							<PagerSettings Mode="NumericFirstLast" Position="Bottom" FirstPageText="1" LastPageText="2" NextPageText="3" PreviousPageText="" Visible="false" />
							<PagerStyle VerticalAlign="Bottom" />
						</asp:GridView>
						<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SISTEM_ALIADOSConnectionString %>"></asp:SqlDataSource>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-12">
							
									<div class="embed-container">
									<iframe width="500" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" title="secciones" src="//ssocratess.maps.arcgis.com/apps/Embed/index.html?webmap=bbff4179a368412d911c45fa5bf8e46b&extent=-111.4049,24.9433,-95.1781,32.8861&home=true&zoom=true&previewImage=true&scale=true&search=true&searchextent=true&legend=true&disable_scroll=true&theme=dark"></iframe>						

									</div>
								
						</div>
					</div>
					



				</div>
			</div>
		</div>


	</div>
</asp:Content>

