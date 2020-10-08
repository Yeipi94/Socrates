<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.Master" AutoEventWireup="true" CodeFile="GestionarPermisos.aspx.cs" Inherits="GestionarPermisos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="upPanel" runat="server">
		<ContentTemplate>


			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body text-center">
							<h4 class="card-title text-left">Datos de Empleado</h4>
							<div class="form-body">

								<div class="row">

									<div class="col-md-6">
										<div class="form-group text-left">
											<label>Documento de Identidad</label>
											<div class="input-group">
												<asp:TextBox ID="txtDNI" CssClass="form-control form-control-sm" runat="server" MaxLength="8"></asp:TextBox>
												<div class="input-group-btn">
													<asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-danger" Text="BUSCAR" Style="height: 31px; padding-bottom: 0px; padding-top: 0px;" OnClick="btnBuscar_Click" />
												</div>
											</div>
										</div>
										<div class="form-group text-left">
											<label>Nombres</label>
											<asp:TextBox ID="txtNombres" CssClass="form-control form-control-sm" runat="server" Enabled="false"></asp:TextBox>
										</div>
										<div class="form-group text-left">
											<label>Apellidos</label>
											<asp:TextBox ID="txtApellidos" CssClass="form-control form-control-sm" runat="server" Enabled="false"></asp:TextBox>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group text-left">
											<label>Numero de Documento</label>
											<asp:TextBox ID="txtNroDocumento" CssClass="form-control form-control-sm" runat="server" Enabled="false"></asp:TextBox>
										</div>
										<div class="form-group text-left">
											<label>Tipo de empleado</label>
											<asp:TextBox ID="txtTipoEmpleado" CssClass="form-control form-control-sm" runat="server" Enabled="false"></asp:TextBox>
										</div>
										<div class="form-group text-left">
											<label>Usuario</label>
											<asp:TextBox ID="txtUsuario" CssClass="form-control form-control-sm" runat="server" Enabled="false"></asp:TextBox>
										</div>
									</div>

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body text-center">
							<h4 class="card-title text-left">Permisos Asignados</h4>
							<div class="form-body">

								<div class="row">
									<div class="col-md-12">
										<div class="box box-primary">
											<div class="box-header"></div>
											<div class="box-body">
												<div class="row">
													<div class="col-md-12">
														<asp:GridView ID="grdPermisosAsignados" runat="server" CssClass="table table-bordered table-hover text-center" AutoGenerateColumns="false">
															<Columns>
																<asp:TemplateField>
																	<HeaderTemplate>
																		<asp:Label ID="lblHeaderAsignar" runat="server" Text="SELECCIONAR"></asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		<asp:CheckBox ID="chkSeleccionar" runat="server" Checked="true" />
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField>
																	<HeaderTemplate>
																		<asp:Label ID="lblHeaderNombre" runat="server" Text="NOMBRE"></asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		<asp:HiddenField ID="hfIdMenu" Visible="false" runat="server" Value='<%#Eval("IdMenu") %>' />
																		<asp:Label ID="lblNombreMenu" runat="server" Text='<%#Eval("Nombre") %>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField>
																	<HeaderTemplate>
																		<asp:Label ID="lblHeaderRuta" runat="server" Text="RUTA"></asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		<asp:Label ID="lblRutaMenu" runat="server" Text='<%#Eval("Url") %>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField>
																	<HeaderTemplate>
																		<asp:Label ID="lblHeaderIsSubMenu" runat="server" Text="SUBMENÚ"></asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		<asp:Label ID="lblIsSubMenu" runat="server" Text='<%#(Convert.ToBoolean(Eval("IsSubMenu")) == true)? "Si":"No" %>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField>
																	<HeaderTemplate>
																		<asp:Label ID="lblHeaderMenuPrincipal" runat="server" Text="MENÚ PRINCIPAL"></asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		<asp:HiddenField ID="hfIdParentMenu" runat="server" Visible="false" Value='<%#Eval("IdMenuParent") %>' />
																		<asp:Label ID="lblPadreMenu" runat="server" Text='<%#((Eval("SubMenu") as List<Entidades.Menu>).Count > 0)? (Eval("SubMenu") as List<Entidades.Menu>)[0].Nombre : "" %>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
															</Columns>
														</asp:GridView>
													</div>
												</div>
												<br />
												<div class="row">
													<div class="col-md-12 text-center">
														<asp:Button ID="btnRemover" runat="server" CssClass="btn btn-danger" Text="REMOVER PERMISOS" OnClick="btnRemover_Click" />
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

			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body text-center">
							<h4 class="card-title text-left">Permisos no Asignados</h4>
							<div class="form-body">

								<div class="row">
									<div class="col-md-12">
										<div class="box box-primary">
											<div class="box-header"></div>
											<div class="box-body">
												<div class="row">
													<div class="col-md-12">
														<asp:GridView ID="grdPermisosNoAsignados" runat="server" CssClass="table table-bordered table-hover text-center" AutoGenerateColumns="false">
															<Columns>
																<asp:TemplateField>
																	<HeaderTemplate>
																		<asp:Label ID="lblHeaderAsignar" runat="server" Text="SELECCIONAR"></asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		<asp:CheckBox ID="chkSeleccionar" runat="server" />
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField>
																	<HeaderTemplate>
																		<asp:Label ID="lblHeaderNombre" runat="server" Text="NOMBRE"></asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		<asp:HiddenField ID="hfIdMenu" Visible="false" runat="server" Value='<%#Eval("IdMenu") %>' />
																		<asp:Label ID="lblNombreMenu" runat="server" Text='<%#Eval("Nombre") %>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField>
																	<HeaderTemplate>
																		<asp:Label ID="lblHeaderRuta" runat="server" Text="RUTA"></asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		<asp:Label ID="lblRutaMenu" runat="server" Text='<%#Eval("Url") %>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField>
																	<HeaderTemplate>
																		<asp:Label ID="lblHeaderIsSubMenu" runat="server" Text="SUBMENÚ"></asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		<asp:Label ID="lblIsSubMenu" runat="server" Text='<%#(Convert.ToBoolean(Eval("IsSubMenu")) == true)? "Si":"No" %>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField>
																	<HeaderTemplate>
																		<asp:Label ID="lblHeaderMenuPrincipal" runat="server" Text="MENÚ PRINCIPAL"></asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		<asp:HiddenField ID="hfIdParentMenu" runat="server" Visible="false" Value='<%#Eval("IdMenuParent") %>' />
																		<asp:Label ID="lblPadreMenu" runat="server" Text='<%#((Eval("SubMenu") as List<Entidades.Menu>).Count > 0)? (Eval("SubMenu") as List<Entidades.Menu>)[0].Nombre : "" %>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
															</Columns>
														</asp:GridView>
													</div>
												</div>
												<br />
												<div class="row">
													<div class="col-md-12 text-center">
														<asp:Button ID="btnAsignar" runat="server" CssClass="btn btn-primary" Text="ASIGNAR PERMISOS" OnClick="btnAsignar_Click" />
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


			<asp:HiddenField ID="hfIdEmpleado" runat="server" Visible="false" Value="0" />
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
