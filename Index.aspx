<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>Solaris Web</title>
    <!-- Custom CSS -->
    <link href="dist/css/style.min.css" rel="stylesheet">
    <script>
        javascript: window.history.forward(1); //Esto es para cuando le pulse albotón de Atrás
          //javascript:window.history.back(1); //Esto para cuando le pulse al botón de Adelante
    </script>
</head>
<body>

    <div class="main-wrapper">
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Login box.scss -->
        <!-- ============================================================== -->
        <div class="auth-wrapper d-flex no-block justify-content-center align-items-center position-relative"
            style=" background-color:aliceblue;">
            <div class="auth-box row">
                <div class="col-lg-7 col-md-5 modal-bg-img" style="background-image: url(assets/images/big/Business_Plan.gif);">
                </div>
                <%--<video  class="col-lg-7 col-md-5 modal-bg-img"  controls poster="assets/images/big/3.jpg">
                    <source src="img/solaris.mp4" type="video/mp4" />
              </video>--%>
<%--                <img src="assets/images/big/Business%20Plan.gif" />--%>
                <div class="col-lg-5 col-md-7 bg-white">

                    <div class="p-3">
                       <%-- <div class="text-center">
                            <img src="assets/images/big/icon.png" alt="wrapkit" />
                        </div>--%>
                        <h2 class="mt-3 text-center">Login</h2>
<%--                        <p class="text-center">Acceso al panel de administración.</p>--%>
                        <form class="mt-4" runat="server">
                            <div class="row">
                                <div class="col-md-12 col-xs-12">
                                    <div class="alert alert-danger alert-dismissible fade in" role="alert" id="msgError" runat="server" style="display: none; background-color: #ad0a0a; color: #fff"></div>
                                </div>
                                <div class="col-lg-12">
                                    
                                    <div class="form-group">
<%--                                        <label class="text-dark" for="uname">Usuario</label>--%>
                                        <%--<input class="form-control" id="uname" type="text"
                                            placeholder="enter your username">--%>
                                        <asp:TextBox ID="txtuser" CssClass="form-control" runat="server"  placeholder="Ingrese usuario..."></asp:TextBox>
<%--                                        <p class="help-block">Escribe tú nombre de usuario</p>--%>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  runat="server"  ErrorMessage="Requerido" ControlToValidate="txtuser" ForeColor="Red" ValidationGroup="FrmLogin" ></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
<%--                                        <label class="text-dark" for="pwd">Contraseña</label>--%>
                                        <%--<input class="form-control" id="pwd" type="password"
                                            placeholder="enter your password">--%>
                                        <asp:TextBox ID="txtpassword" CssClass="form-control" runat="server"  placeholder="Ingrese Password..."  TextMode="Password"></asp:TextBox>
<%--                                        <p class="help-block">Escribe tú contraseña</p>--%>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Requerido" ControlToValidate="txtpassword" ForeColor="Red" ValidationGroup="FrmLogin"></asp:RequiredFieldValidator>


                                    </div>
                                </div>
                                <div class="col-lg-12 text-center">
                                    <%--                                    <button type="submit" class="btn btn-block btn-dark">Sign In</button>--%>
                                    <asp:Button ID="Button1" runat="server" Text="Entrar" CssClass="btn btn-block btn-dark" OnClick="IngresarLogin" ValidationGroup="FrmLogin" />


                                </div>
                                <div class="col-lg-12 text-center mt-5">
<%--                                    Don't have an account? <a href="#" class="text-danger">Sign Up</a>--%>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Login box.scss -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- All Required js -->
    <!-- ============================================================== -->
    <script src="assets/libs/jquery/dist/jquery.min.js "></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/libs/popper.js/dist/umd/popper.min.js "></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.min.js "></script>
    <!-- ============================================================== -->
    <!-- This page plugin js -->
    <!-- ============================================================== -->
    <script>
        $(".preloader ").fadeOut();
    </script>
</body>
</html>
