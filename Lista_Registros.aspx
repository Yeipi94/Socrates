<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Lista_Registros.aspx.cs" Inherits="Registros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	 <div class="row">

        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">CAPTURA 1</h4>

                    <ul class="nav nav-pills bg-nav-pills nav-justified">
                        <li class="nav-item">
                            <a href="#DatPer" aria-expanded="true"
                                class="nav-link rounded-0 active">
                                <span class="tab-justified">Datos Personales</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#Direccion" aria-expanded="false"
                                class="nav-link rounded-0">
                                <span class="tab-justified">Direccion</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#DatCon" aria-expanded="false"
                                class="nav-link rounded-0">
                                <span class="tab-justified">Datos de Contacto</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#Enlace1" aria-expanded="false"
                                class="nav-link rounded-0">
                                <span class="tab-justified">Enlace 1</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#Enlace2" aria-expanded="false"
                                class="nav-link rounded-0">
                                <span class="tab-justified">Enlace 2</span>
                            </a>
                        </li>
                    </ul>

                    <div class="tab-content" id="regTab">

                        <div class="tab-pane show active" id="DatPer">

                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="col-md-6 m-auto">
                                                <%--CONTENIDO 1--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="tab-pane" id="Direccion">

                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="col-md-6 m-auto">
                                                <%--CONTENIDO 2--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="tab-pane" id="DatCon">

                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="col-md-6 m-auto">
                                                <%--CONTENIDO 3--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="tab-pane" id="Enlace1">

                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="col-md-6 m-auto">
                                                <div class="col-12">
                                                    <%--CONTENIDO 4--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="tab-pane" id="Enlace2">

                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="col-md-6 m-auto">
                                                <div class="col-12">
                                                   <%--CONTENIDO 5--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                    <div>
                        <div style="overflow: auto;">
                            <div style="float: right;">
                                <button type="button" class="btn waves-effect waves-light btn-secondary" id="prevBtn" onclick="nextPrev(-1)">Anterior</button>  
                                <button type="button" class="btn waves-effect waves-light btn-primary" id="nextBtn" onclick="nextPrev(1)">Siguiente</button>
                            </div>
                        </div>   
                    </div>

                </div>
            </div>
        </div>
    </div>


</asp:Content>

