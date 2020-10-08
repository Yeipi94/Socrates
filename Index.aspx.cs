using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Configuration;
using Entidades;
using logica;
using System.Web.Security;



//public static class MessageBox
//{
//    public static void Show2(this Page Page, String Message)
//    {
//        Page.ClientScript.RegisterStartupScript(
//         Page.GetType(),
//         "MessageBox",
//         "<script language='javascript'>alert('" + Message + "');</script>"
//        );
//    }
//}
public partial class Index : System.Web.UI.Page
{
	//WebServiceDatos Tools = new WebServiceDatos();

	//string strConnString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
	protected void Page_Load(object sender, EventArgs e)
    {


        if (!Page.IsPostBack)
        {
            Session["UserSessionId"] = null;
			

        }

	}
    protected void IngresarLogin(object sender, EventArgs e)
    {
  

    }
    protected void LoginUser_Authenticate(object sender, AuthenticateEventArgs e)
    {
        bool auth = Membership.ValidateUser(LoginUser.UserName, LoginUser.Password);

        if (auth)
        {
            
            Empleado objEmpleado = EmpleadoLN.getInstance().AccesoSistema(LoginUser.UserName, LoginUser.Password);

            if (objEmpleado != null)
            {
                
                SessionManager _SessionManager = new SessionManager(Session);
                //SessionManager.UserSessionId = objEmpleado.ID.ToString();
                _SessionManager.UserSessionEmpleado = objEmpleado;
                FormsAuthentication.RedirectFromLoginPage(LoginUser.UserName, false);
            }
            else
            {
                Response.Write("<script>alert('USUARIO INCORRECTO.')</script>");
            }
        }
		
    }

}
        

