<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="FichaTecnica.aspx.cs" Inherits="FichaTecnica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">      

    <script> 
        function printDiv(formulario) {
            var contenido = document.getElementById('formulario').innerHTML;
            var contenidoOriginal = document.body.innerHTML;

            document.body.innerHTML = contenido;

            window.print();

            document.body.innerHTML = contenidoOriginal;
        }
    </script>

    <style>
        @media print {
            #sidebarnav {
                display: none;
            }
        }

        @page {
            @top-center {
                content: "Ficha Tecnica";
            }
        }
    </style>

    <style>
        .image-upload > input {
            display: none;
        }

        .image-upload img {
            cursor: pointer;
        }
    </style>

    <div class="card-body" id="formulario">

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body text-center">
                        <h4 class="card-title text-left">Datos Personales</h4>

                        <div class="form-body">

                            <div class="row">

                                <div class="col-md-4">
                                    <div class="profile-pic mb-3 mt-3 embed-responsive">
                                        <div class="image-upload">
                                            <label for="file-input">
                                                <img src="assets/images/users/5.jpg" width="270" class="rounded-circle" alt="user">
                                            </label>
                                            <input id="file-input" type="file" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <label>Nombre</label>
                                            <asp:TextBox ID="TextNom" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <label>Alias</label>
                                            <asp:TextBox ID="TextAlias" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <label>Fecha de Nacimiento</label>
                                            <asp:TextBox ID="TextFecNac" type="date" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <label>Edad</label>
                                            <asp:TextBox ID="TextEdad" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <label>Ocupación Actual</label>
                                            <asp:TextBox ID="TextOcupacion" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <label>Líderes Políticos</label>
                                            <asp:TextBox ID="TextLidPol" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <label>Teléfonos</label>
                                            <asp:TextBox ID="TextTel" type="tel" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <label>Correos</label>
                                            <asp:TextBox ID="TextMail" type="email" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="row">

                                <div class="col-md-3">
                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <i class="fab fa-facebook-square"></i>
                                            <label>Facebook</label>
                                            <asp:TextBox ID="TextFace" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <i class="fab fa-twitter"></i>
                                            <label>Twitter</label>
                                            <asp:TextBox ID="TextTwit" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <i class="fab fa-instagram"></i>
                                            <label>Instagram</label>
                                            <asp:TextBox ID="TextInsta" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <i class="fab fa-linkedin"></i>
                                            <label>LinkedIn</label>
                                            <asp:TextBox ID="TextLink" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
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
                    <div class="card-body">
                        <h4 class="card-title">Datos de Identificación</h4>

                        <div class="form-body">
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <label>RFC</label>
                                            <asp:TextBox ID="TextRFC" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <label>CURP</label>
                                            <asp:TextBox ID="TextCURP" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
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
                    <div class="card-body">
                        <h4 class="card-title">Lugar de Nacimiento</h4>

                        <div class="form-body">
                            <div class="row">

                                <div class="col-md-4">
                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <label>País</label>
                                            <asp:TextBox ID="TextPais" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <label>Entidad</label>
                                            <asp:TextBox ID="TextEnt" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <label>Municipio</label>
                                            <asp:TextBox ID="TextMun" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
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
                    <div class="card-body">
                        <h4 class="card-title">Registro Público</h4>
                        <div class="form-body">
                            <div class="row">

                                <div class="col-12">

                                    <form action="#">

                                        <div class="form-body">
                                            <div class="row">

                                                <div class="col-md-2">
                                                    <div class="col-12">
                                                        <div class="form-group text-left">
                                                            <label>Fecha</label>
                                                            <asp:TextBox ID="TextBox1" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="col-12">
                                                        <div class="form-group text-left">
                                                            <label>Tipo de persona</label>
                                                            <asp:TextBox ID="TextBox2" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="col-12">
                                                        <div class="form-group text-left">
                                                            <label>Domicilio</label>
                                                            <asp:TextBox ID="TextBox3" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="col-12">
                                                        <div class="form-group text-left">
                                                            <label>Clave</label>
                                                            <asp:TextBox ID="TextBox4" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="col-12">
                                                        <div class="form-group text-left">
                                                            <label>Acto</label>
                                                            <asp:TextBox ID="TextBox5" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="form-actions">
                                            <div class="text-right">
                                                <button type="submit" class="btn btn-info">Submit</button>
                                                <button type="reset" class="btn btn-dark">Reset</button>
                                            </div>
                                        </div>

                                    </form>

                                </div>

                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="bg-primary text-white">
                                                <tr>
                                                    <th style="width: 150px;">Fecha</th>
                                                    <th style="width: 150px;">Tipo de Persona</th>
                                                    <th style="width: 300px;">Domicilio</th>
                                                    <th style="width: 60px;">Clave</th>
                                                    <th style="width: 60px;">Acto</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Nigam</td>
                                                    <td>Eichmann</td>
                                                    <td>@Sonu</td>
                                                    <td>@Sonu</td>
                                                </tr>
                                            </tbody>
                                        </table>
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
                    <div class="card-body">
                        <h4 class="card-title">Domicilios</h4>
                        <div class="form-body">
                            <div class="row">

                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="bg-primary text-white">
                                                <tr>
                                                    <th style="width: 300px;">Domicilio</th>
                                                    <th style="width: 60px;">Año</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Eichmann</td>
                                                    <td>2019</td>
                                                </tr>
                                            </tbody>
                                        </table>
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
                    <div class="card-body">
                        <h4 class="card-title">Cédulas Profesionales</h4>
                        <div class="form-body">
                            <div class="row">

                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="bg-primary text-white">
                                                <tr>
                                                    <th style="width: 60px;">Año</th>
                                                    <th style="width: 240px;">Escuela</th>
                                                    <th style="width: 120px;">Profesión</th>
                                                    <th style="width: 120px;">Estado</th>
                                                    <th style="width: 120px;">Cédula</th>
                                                    <th style="width: 60px;">Tipo</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Nigam</td>
                                                    <td>Eichmann</td>
                                                    <td>@Sonu</td>
                                                    <td>@Sonu</td>
                                                    <td>@Sonu</td>
                                                </tr>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Nigam</td>
                                                    <td>Eichmann</td>
                                                    <td>@Sonu</td>
                                                    <td>@Sonu</td>
                                                    <td>@Sonu</td>
                                                </tr>
                                            </tbody>
                                        </table>
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
                    <div class="card-body">
                        <h4 class="card-title">Vínculos Familiares</h4>
                        <div class="form-body">
                            <div class="row">

                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="bg-primary text-white">
                                                <tr>
                                                    <th style="width: 240px;">Grado</th>
                                                    <th style="width: 240px;">Nombre</th>
                                                    <th style="width: 240px;">Comentarios</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Familiar</td>
                                                    <td>Nombre</td>
                                                    <td>Comentario</td>
                                                </tr>
                                            </tbody>
                                        </table>
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
                    <div class="card-body">
                        <h4 class="card-title">Vínculos Personales</h4>
                        <div class="form-body">
                            <div class="row">

                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="bg-primary text-white">
                                                <tr>
                                                    <th style="width: 240px;">Grado</th>
                                                    <th style="width: 240px;">Nombre</th>
                                                    <th style="width: 240px;">Comentarios</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Familiar</td>
                                                    <td>Nombre</td>
                                                    <td>Comentario</td>
                                                </tr>
                                            </tbody>
                                        </table>
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
                    <div class="card-body">
                        <h4 class="card-title">Trayectoria Política</h4>
                        <div class="form-body">
                            <div class="row">

                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="bg-primary text-white">
                                                <tr>
                                                    <th style="width: 240px;">Organización</th>
                                                    <th style="width: 240px;">Puesto</th>
                                                    <th style="width: 240px;">Periodo</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Organización</td>
                                                    <td>Puesto</td>
                                                    <td>Periodo</td>
                                                </tr>
                                            </tbody>
                                        </table>
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
                    <div class="card-body">
                        <h4 class="card-title">Cargos Públicos</h4>
                        <div class="form-body">
                            <div class="row">

                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="bg-primary text-white">
                                                <tr>
                                                    <th style="width: 240px;">Organización</th>
                                                    <th style="width: 240px;">Puesto</th>
                                                    <th style="width: 240px;">Periodo</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Organización</td>
                                                    <td>Puesto</td>
                                                    <td>Periodo</td>
                                                </tr>
                                            </tbody>
                                        </table>
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
                    <div class="card-body">
                        <h4 class="card-title">Trayectoria Laboral</h4>
                        <div class="form-body">
                            <div class="row">

                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="bg-primary text-white">
                                                <tr>
                                                    <th style="width: 240px;">Organización</th>
                                                    <th style="width: 240px;">Puesto</th>
                                                    <th style="width: 180px;">Periodo</th>
                                                    <th style="width: 60px;">Actual</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Organización</td>
                                                    <td>Puesto</td>
                                                    <td>Periodo</td>
                                                    <td>No</td>
                                                </tr>
                                            </tbody>
                                        </table>
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
                    <div class="card-body">
                        <h4 class="card-title">Licencias de Manejo</h4>
                        <div class="form-body">
                            <div class="row">

                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="bg-primary text-white">
                                                <tr>
                                                    <th style="width: 160px;">No. Licencia</th>
                                                    <th style="width: 280px;">Fecha - Lugar de Expedición</th>
                                                    <th style="width: 280px;">Domicilio Registrado</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Organización</td>
                                                    <td>Puesto</td>
                                                    <td>Periodo</td>
                                                </tr>
                                            </tbody>
                                        </table>
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
                    <div class="card-body">
                        <h4 class="card-title">Vehiculos Personales</h4>
                        <div class="form-body">
                            <div class="row">

                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="bg-primary text-white">
                                                <tr>
                                                    <th style="width: 120px;">Placa</th>
                                                    <th style="width: 120px;">Serie</th>
                                                    <th style="width: 120px;">Marca</th>
                                                    <th style="width: 120px;">Submarca</th>
                                                    <th style="width: 120px;">Modelo</th>
                                                    <th style="width: 120px;">Color</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Placa</td>
                                                    <td>Serie</td>
                                                    <td>Marca</td>
                                                    <td>Submarca</td>
                                                    <td>Modelo</td>
                                                    <td>Color</td>
                                                </tr>
                                            </tbody>
                                        </table>
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
                    <div class="card-body">
                        <h4 class="card-title">Evidencias</h4>
                        <div class="form-body">
                            <div class="row">

                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class="bg-primary text-white">
                                                <tr>
                                                    <th style="width: 720px;">Enlaces</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Enlace</td>
                                                </tr>
                                            </tbody>
                                        </table>
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
                    <div class="card-body">
                        <h4 class="card-title">Gridview</h4>
                        <div class="form-body">
                            <div class="row">   

                                <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Extn.</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Extn.</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </tfoot>
    </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>

    <input type="button" class="btn btn-info" onclick="printDiv('formulario')" value="Imprimir Ficha Tecnica" />

</asp:Content>


