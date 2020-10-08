<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Cuenta.aspx.cs" Inherits="Cuenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
										<label>Nivel</label>
										<asp:TextBox ID="txtTipo" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group text-left">
										<label>Nombre</label>
										<asp:TextBox ID="txtNombre" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group text-left">
										<label>Apellido Paterno</label>
										<asp:TextBox ID="txtApellidoP" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group text-left">
										<label>Apellido Materno</label>
										<asp:TextBox ID="txtApellidoM" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group text-left">
										<label>Edad</label>
										<asp:TextBox ID="txtEdad" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
									</div>
								</div>
							</div>

							<div class="col-md-4">
								<div class="col-12">
									<div class="form-group text-left">
										<label>Clave Elector</label>
										<asp:TextBox ID="txtCVE" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group text-left">
										<label>Colonia</label>
										<asp:TextBox ID="txtColonia" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group text-left">
										<label>Num. Ext.</label>
										<asp:TextBox ID="txtNumE" type="tel" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
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



					</div>

				</div>
			</div>
		</div>
	</div>
</asp:Content>

