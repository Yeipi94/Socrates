<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Captura.aspx.cs" Inherits="Captura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">INE</h4>
                                    <div class="form-body">
                                        <div class="row" id="cap1">
                                           
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Folio</label>
                                                    <asp:TextBox ID="txtNombre" runat="server" class="form-control"  placeholder="Nombre Completo"></asp:TextBox>
                                                </div>
                                            </div>
                                        
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Fecha</label>
                                                    <asp:TextBox ID="txtEdad" runat="server" class="form-control" placeholder="Edad"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Nombres</label>
                                                    <asp:TextBox ID="txtCalle" runat="server" class="form-control" placeholder="Calle"></asp:TextBox>
                                                </div>
                                            </div>
                                        
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Apellido Paterno</label>
                                                    <asp:TextBox ID="txtNum" runat="server" class="form-control" placeholder="Num. Casa"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Apellido Materno</label>
                                                    <asp:TextBox ID="txtColonia" runat="server" class="form-control" placeholder="Colonia"></asp:TextBox>
                                                </div>
                                            </div>
                                        
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Fecha de Nacimiento</label>
                                                    <asp:TextBox ID="txtMun" runat="server" class="form-control" placeholder="Municipio"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Genero</label>
                                                    <asp:TextBox ID="txtSec" runat="server" class="form-control" placeholder="Seccion"></asp:TextBox>
                                                </div>
                                            </div>
                                       
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Calle</label>
                                                    <asp:TextBox ID="txtEmi" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Int</label>
                                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Ext</label>
                                                    <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Colonia</label>
                                                    <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Municipio</label>
                                                    <asp:TextBox ID="TextBox4" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>CP</label>
                                                    <asp:TextBox ID="TextBox5" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Teléfono</label>
                                                    <asp:TextBox ID="TextBox6" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Celular</label>
                                                    <asp:TextBox ID="TextBox7" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Correo</label>
                                                    <asp:TextBox ID="TextBox8" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>INE</label>
                                                    <asp:TextBox ID="TextBox9" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>CURP</label>
                                                    <asp:TextBox ID="TextBox10" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Distrito Local</label>
                                                    <asp:TextBox ID="TextBox11" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Sección</label>
                                                    <asp:TextBox ID="TextBox12" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Programa</label>
                                                    <asp:TextBox ID="TextBox13" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Tema</label>
                                                    <asp:TextBox ID="TextBox14" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Apoyo</label>
                                                    <asp:TextBox ID="TextBox15" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Petición</label>
                                                    <asp:TextBox ID="TextBox16" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Enlace 1</label>
                                                    <asp:TextBox ID="TextBox17" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                             </div>
                                          <div class="form-actions">
                                        <div class="text-right">
                                            <button type="submit" class="btn btn-info">Cancelar</button>
                                            <button type="reset" class="btn btn-dark">Guardar</button>
                                        </div>
                                    </div>
                                        
                                        
                                    </div>
                                    <%--<div class="form-actions">
                                        <div class="text-right">
                                            <button type="submit" class="btn btn-info">Submit</button>
                                            <button type="reset" class="btn btn-dark">Reset</button>
                                        </div>
                                    </div>--%>
                                
                            </div>
                        </div>
                    </div>
                </div>
</asp:Content>

