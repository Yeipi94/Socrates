<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="ErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/icono%20socrates_opt.png"/>
    <title>SÓCRATES</title>

    <link href="../dist/css/style.min.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid" style="padding-top: 100px">

            <div class="col-md-12" style="width: 100%; text-align: center;">
                <div class="col-middle">
                    <div class="text-center text-center">
                        <h1 class="error-number">404</h1>
                        <h2>Lo sentimos, pero no podemos encontrar la página</h2>
                        <p>
                            La página que estas buscando no existe                   
                        </p>
						<asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnReturnError_Click" CssClass="btn btn-secondary btn-circle-lg"><i class="fa fa-home"></i></asp:LinkButton>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
