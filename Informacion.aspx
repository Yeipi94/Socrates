<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Informacion.aspx.cs" Inherits="Informacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-12">
			<div class="alert alert-danger alert-dismissible fade in" role="alert" id="msgError" runat="server" style="display: none; background-color: #ad0a0a; color: #fff"></div>
		</div>
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title"><i class="fa fa-bars"> INE | NACIONAL</i></h4>
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                     <label>Clave Electoral</label>
                                                    <asp:TextBox ID="txtClave" runat="server" class="form-control" placeholder="Clave de elector"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Nombre</label>
                                                    <asp:TextBox ID="txtNombre" runat="server" class="form-control" placeholder="Nombre Completo"></asp:TextBox>
                                                </div>
                                            </div>
                                        
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Edad</label>
                                                    <asp:TextBox ID="txtEdad" runat="server" class="form-control" placeholder="Edad"></asp:TextBox>
                                                </div>
                                            </div>
                                            
                                        

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Calle</label>
                                                    <asp:TextBox ID="txtCalle" runat="server" class="form-control" placeholder="Calle"></asp:TextBox>
                                                </div>
                                            </div>
                                        
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Número Exterior</label>
                                                    <asp:TextBox ID="txtNum" runat="server" class="form-control" placeholder="Num. Casa"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Colonia</label>
                                                    <asp:TextBox ID="txtColonia" runat="server" class="form-control" placeholder="Colonia"></asp:TextBox>
                                                </div>
                                            </div>
                                        
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label>Municipio</label>
                                                    <asp:TextBox ID="txtMun" runat="server" class="form-control" placeholder="Municipio"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-1">
                                                <div class="form-group">
                                                    <label>Sección</label>
                                                    <asp:TextBox ID="txtSec" runat="server" class="form-control" placeholder="Seccion"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-1">
                                                <div class="form-group">
                                                    <label>Emisión</label>
                                                    <asp:TextBox ID="txtEmi" runat="server" class="form-control" placeholder="Emisión"></asp:TextBox>
                                                </div>
                                            </div>
                                       
                                             <div class="col-md-1">
                                                <div class="form-group">
                                                    <label>Origen</label>
                                                    <asp:TextBox ID="txtOrigen" runat="server" class="form-control" placeholder="Origen"></asp:TextBox>
                                                </div>
                                            </div>
                                             <div class="col-md-1">
                                                <div class="form-group">
                                                    <label>Afiliación</label>
                                                    <asp:TextBox ID="txtAfiliacion" runat="server" class="form-control" placeholder="Afiliación"></asp:TextBox>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-1">
                                                <div class="form-group">
                                                    <label>2006</label>
                                                    <asp:TextBox ID="txtseis" runat="server" class="form-control" placeholder="2006"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-1">
                                                <div class="form-group">
                                                    <label>2009</label>
                                                    <asp:TextBox ID="txtnueve" runat="server" class="form-control" placeholder="2009"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-1">
                                                <div class="form-group">
                                                    <label>2012</label>
                                                    <asp:TextBox ID="txtdoce" runat="server" class="form-control" placeholder="2012"></asp:TextBox>
                                                </div>
                                            </div>
                                             <div class="col-md-1">
                                                <div class="form-group">
                                                    <label>20##</label>
                                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="S/D"></asp:TextBox>
                                                </div>
                                            </div>
                                             <div class="col-md-1">
                                                <div class="form-group">
                                                    <label>20##</label>
                                                    <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="S/D"></asp:TextBox>
                                                </div>
                                            </div>
                                             <div class="col-md-1">
                                                <div class="form-group">
                                                    <label>20##</label>
                                                    <asp:TextBox ID="TextBox4" runat="server" class="form-control" placeholder="S/D"></asp:TextBox>
                                                </div>
                                            </div>
                                             </div>
                                        
                                        
                                    </div>

                                <h4 class="card-title"><i class="fa fa-bars"> INE | MONTERREY</i></h4>
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Dirección Completa</label>
                                                <asp:TextBox ID="txtDirComp" runat="server" class="form-control" placeholder="S/D"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Estado de Nacimiento</label>
                                                <asp:TextBox ID="txtEstadoN" runat="server" class="form-control" placeholder="S/D"></asp:TextBox>
                                            </div>
                                        </div>

                                         <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Fecha de Nacimiento</label>
                                                <asp:TextBox ID="txtFechaN" runat="server" class="form-control" placeholder="S/D"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Sexo</label>
                                                <asp:TextBox ID="txtSexo" runat="server" class="form-control" placeholder="S/D"></asp:TextBox>
                                            </div>
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


    
        <div class="row">
           
            <div class="col-12">

                <div class="card">

                    <div class="card-body">
                       <h4 class="card-title"><i class="fa fa-bars"> TELCEL | REGISTRO DE TELÉFONOS</i></h4>
                        <div style="width: 100%; height: auto; max-height: 400px; overflow-y: scroll" class="table-responsive">
                            <asp:GridView ID="GdvTelefonos" class="table table-striped table-bordered no-wrap" runat="server" OnPageIndexChanging="GdvTelefonos_PageIndexChanging" AutoGenerateColumns="false" DataKeyNames="cuenta" DataSourceID="SqlDataSource1" PagerSettings-Position="Top"  OnRowDataBound="GdvTelefonos_RowDataBound" OnSelectedIndexChanged="GdvTelefonos_SelectedIndexChanged" HeaderStyle-CssClass="info">
                                <HeaderStyle CssClass="bg-danger text-white" />
                                <Columns>
                                    <asp:BoundField DataField="cuenta" HeaderText="cuenta" ReadOnly="True" SortExpression="cuenta" Visible="false" />
                                    <asp:BoundField DataField="telefono" HeaderText="Telefono" SortExpression="telefono" />
                                    <asp:BoundField DataField="marca" HeaderText="marca" SortExpression="marca" />
                                    <asp:BoundField DataField="modelo" HeaderText="modelo" SortExpression="modelo" Visible="false" />
                                    <asp:BoundField DataField="domicilio" HeaderText="domicilio" SortExpression="domicilio" />
                                    <asp:BoundField DataField="numero" HeaderText="numero" SortExpression="numero" />
                                    <asp:BoundField DataField="colonia" HeaderText="colonia" SortExpression="colonia" />
                                    <asp:BoundField DataField="numero" HeaderText="numero" SortExpression="numero" />
                                    <asp:BoundField DataField="ciudad" HeaderText="ciudad" SortExpression="ciudad" />
                                    <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-rounded btn-danger" ShowSelectButton="true" Visible="false" />
                                </Columns>
                                <HeaderStyle />
                                <PagerSettings Mode="NumericFirstLast" Position="Bottom"  FirstPageText="1" LastPageText="2" NextPageText="3" PreviousPageText="" Visible="false" />
                                <PagerStyle VerticalAlign="Bottom" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SISTEM_ALIADOSConnectionString %>" ></asp:SqlDataSource>
                        </div>
                    </div>

                    <asp:HiddenField ID="TabName" runat="server" />

                </div>
            </div>


        </div>
     <div class="row">
           
            <div class="col-12">

                <div class="card">

                    <div class="card-body">
                       <h4 class="card-title"><i class="fa fa-bars"> PRI TELÉFONOS | SIN TELCEL</i></h4>
                        <div style="width: 100%; height: auto; max-height: 400px; overflow-y: scroll" class="table-responsive">
                            <asp:GridView ID="GridView2" class="table table-striped table-bordered no-wrap" runat="server" OnPageIndexChanging="GridView2_PageIndexChanging" AutoGenerateColumns="false" DataKeyNames="nombre_comp" DataSourceID="SqlDataSource2" PagerSettings-Position="Top"  OnRowDataBound="GridView2_RowDataBound" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" HeaderStyle-CssClass="info">
                                <HeaderStyle CssClass="bg-danger text-white" />
                                <Columns>
                                    <asp:BoundField DataField="nombre_comp" HeaderText="nombre_comp"  ReadOnly="True" SortExpression="nombre_comp" />
                                    <asp:BoundField DataField="edo_nac" HeaderText="edo_nac" SortExpression="edo_nac" />
                                    <asp:BoundField DataField="municipio" HeaderText="municipio" SortExpression="municipio" />
                                    <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
                                    <asp:BoundField DataField="tipo_tel" HeaderText="tipo_tel" SortExpression="tipo_tel" />
                                    <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-rounded btn-danger" ShowSelectButton="true" Visible="false" />
                                </Columns>
                                <HeaderStyle />
                                <PagerSettings Mode="NumericFirstLast" Position="Bottom"  FirstPageText="1" LastPageText="2" NextPageText="3" PreviousPageText="" Visible="false" />
                                <PagerStyle VerticalAlign="Bottom" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SISTEM_ALIADOSConnectionString %>" ></asp:SqlDataSource>
                        </div>
                    </div>

                    <asp:HiddenField ID="HiddenField1" runat="server" />

                </div>
            </div>


        </div>
    
</asp:Content>

