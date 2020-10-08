<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="GestionarMenus.aspx.cs" Inherits="GestionarMenus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	 <div class="card-body">

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body text-center">
                        <h4 class="card-title text-left">Gestionar Menús</h4>

                        <div class="form-body">
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group text-left">
                                        <label>Nombre</label>
                                        <asp:TextBox ID="txtNombrePermiso" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-9">
                                            <div class="form-group text-left">
                                                <label>Icono</label>
                                                <asp:TextBox ID="TextIcono" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group text-center">
                                                <label>Submenú</label>
                                            </div>
                                            <div class="form-group text-center">
                                                <asp:CheckBox ID="chkIsSubmenu" runat="server" Height="45px" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group text-left">
                                        <label>Ruta</label>
                                        <asp:TextBox ID="txtUrlPermiso" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group text-left">
                                        <label>Menú Principal</label>
                                        <asp:DropDownList ID="ddlMenuPrincipal" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="text-center">
                            <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Text="Registrar Menú" />
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body text-center">
                        <h4 class="card-title text-left">Lista de Menús</h4>

                        <div class="table-responsive">
                            <table id="tbl_menus" class="table">
                                <thead class="bg-primary text-white">
                                    <tr>
                                        <th>Código</th>
                                        <th>Nombre</th>
                                        <th>Ruta</th>
                                        <th>Activo/Inactivo</th>
                                        <th>Sub-Menú</th>
                                        <th>Menu Padre</th>
                                        <th>Acciones</th>
                                        <th>icon</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- DATA POR MEDIO DE AJAX-->
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="modal fade" id="imodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Actualizar Permiso</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>NOMBRE</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtANombrePermiso" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>RUTA</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtAUrlPermiso" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>MENÚ PRINCIPAL</label>
                    </div>
                    <div class="form-group">
                        <asp:DropDownList ID="ddlAMenuPrincipal" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>SUBMENÚ</label>
                    </div>
                    <div class="form-group">
                        <asp:CheckBox ID="chkAIsSubmenu" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>ACTIVAR</label>
                    </div>
                    <div class="form-group">
                        <asp:CheckBox ID="chkAActivo" runat="server" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btnactualizar">Actualizar</button>
                </div>
            </div>
        </div>
    </div>

	<script src="js/menus.js" type="text/javascript"></script>
</asp:Content>

