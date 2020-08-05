<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Div_Electoral.aspx.cs" Inherits="Div_Electoral" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Asignación</h4>
                    <div class="form-body">
                       
                        <div class="row">
                             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Consultar nombre(s)</label>
                                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                                    <asp:AutoCompleteExtender ID="IDExtensor" runat="server" DelimiterCharacters="" Enabled="True" ServicePath="../AutocompletarService.asmx" MinimumPrefixLength="1" ServiceMethod="BuscarINE" EnableCaching="true" TargetControlID="TextBox1" CompletionInterval="0"></asp:AutoCompleteExtender>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Nombre(s)</label>
                                    <asp:TextBox ID="txtNombre" runat="server" class="form-control" ></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="Rnombre" ControlToValidate="txtNombre" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Apellido Paterno</label>
                                    <asp:TextBox ID="txtApellidoPa" runat="server" class="form-control" ></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="RApellidoP" ControlToValidate="txtApellidoPa" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Apellido Materno</label>
                                    <asp:TextBox ID="txtApellidoMa" runat="server" class="form-control" ></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="RApellidoM" ControlToValidate="txtApellidoMa" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Fecha Nac.</label>
                                    <asp:TextBox ID="txtFechaN" TextMode="Date" runat="server" class="form-control" ></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="RFechaN" ControlToValidate="txtFechaN" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Teléfono</label>
                                    <asp:TextBox ID="txtTelefono" runat="server" class="form-control max" TextMode="Number" MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="RTeléfono" ControlToValidate="txtTelefono" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Afiliacion</label>
                                    <asp:TextBox ID="txtAfiliacion" runat="server" class="form-control" placeholder="Afiliación"  ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <h4 class="card-title">UBICACION</h4>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Calle</label>
                                    <asp:TextBox ID="txtCalle" runat="server" class="form-control" ></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="RCalle" ControlToValidate="txtCalle" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Num Ext</label>
                                    <asp:TextBox ID="txtNumE" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="RNumE" ControlToValidate="txtNumE" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Num. Interior</label>
                                    <asp:TextBox ID="txtNumeroI" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Codigo Postal</label>
                                    <asp:TextBox ID="txtCodigo" runat="server" class="form-control" AutoPostBack="True" OnTextChanged="txtCodigo_TextChanged" ></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtCodigo" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Municipio</label>
                                    <asp:TextBox ID="txtMunicipio" runat="server" class="form-control" AutoPostBack="True"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="RMunicipio" ControlToValidate="txtMunicipio" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Colonia</label>
                                     <asp:TextBox ID="txtColonia" runat="server" class="form-control" AutoPostBack="True"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="RColonia" ControlToValidate="txtColonia" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Sección</label>
                                    <asp:TextBox ID="txtseccion" runat="server" class="form-control" AutoPostBack="True" OnTextChanged="txtseccion_TextChanged"></asp:TextBox>

                                    <asp:RequiredFieldValidator runat="server" ID="RSección" ControlToValidate="txtseccion" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                             
                         
                        </div>
                         <h4 class="card-title">Asignación Territorial</h4>
                        <div class="row">
                            <div class="col-xs-12 col-lg-3">
								<div class="form-group">
									<label>Estados</label>
									<asp:DropDownList ID="ddlEstad" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEstad_SelectedIndexChanged" ></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="ddlEstad" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
                                    <asp:CascadingDropDown ID="CascadingDropDown3" runat="server" Category="Estados" TargetControlID="ddlEstad" LoadingText="Cargando Estados.." ServicePath="../AutocompletarService.asmx" ServiceMethod="Get_Estados" PromptText="Selecciona"></asp:CascadingDropDown>

								</div>
							</div>
                            <div class="col-xs-12 col-lg-3">
								<div class="form-group">
									<label>Municipio</label>
									<asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-control" ></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="ddlMunicipio" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
<%--                                    <asp:CascadingDropDown ID="CascadingDropDown2" runat="server" Category="Municipio" TargetControlID="ddlMunicipio" LoadingText="Cargando Estados.." ParentControlID="ddlEstad"  ServicePath="../AutocompletarService.asmx" ServiceMethod="Get_Municipios" PromptText="Selecciona"></asp:CascadingDropDown>--%>

								</div>
							</div>
                           <div class="col-md-4">
                                <div class="form-group">
                                    <label>Estatus</label>
                                    
                                    <asp:DropDownList ID="ddlNivel" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="">Seleccionar</asp:ListItem>
                                        <asp:ListItem Value="Distrital">Distrital</asp:ListItem>
                                        <asp:ListItem Value="Zonal">Zonal</asp:ListItem>
                                        <asp:ListItem Value="Regional">Regional</asp:ListItem>
                                        <asp:ListItem Value="Seccional">Seccional</asp:ListItem>
                                        <asp:ListItem Value="Manzanero">Manzanero</asp:ListItem>
                                        <asp:ListItem Value="Votante">Votante</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="RNivel" ControlToValidate="ddlNivel" ErrorMessage="Obligatorio." ForeColor="Red" ValidationGroup="FrmRequerido"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                             <div class="col-xs-12 col-lg-3">
								<div class="form-group">
									<label>Número</label>
									<asp:DropDownList ID="ddlNumero" runat="server" CssClass="form-control" >
									</asp:DropDownList>
								</div>
							</div>
                        </div>

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
                        <div class="form-actions">
                            <div class="text-right">
                                <%--                                 <button type="submit" class="btn btn-info">Cancelar</button>--%>
                                <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-info" Width="200px" Text="Cancelar" OnClick="btnCancelar_Click" CommandName="Cancelar" OnClientClick="return confirm('¿Esta seguro que desea cancelar?')" />

                                <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-dark" Width="200px" Text="Registrar" OnClick="btnRegistrar_Click" ValidationGroup="FrmRequerido" />

                                <%--<button type="reset" class="btn btn-dark">Guardar</button>--%>
                            </div>
                        </div>
                    </div>

                </div>




            </div>
        </div>
    </div>


</asp:Content>

