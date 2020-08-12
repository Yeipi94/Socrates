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
	WebServiceDatos Tools = new WebServiceDatos();

	string strConnString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
	protected void Page_Load(object sender, EventArgs e)
    {
        

        if (IsPostBack)
        {
        }

    }
    protected void IngresarLogin(object sender, EventArgs e)
    {
        try
        {
            //string strConnString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT * From tblEmpleado WHERE usuario = @username AND password = @password", con);



                cmd.Parameters.AddWithValue("@username", txtuser.Text);
                cmd.Parameters.AddWithValue("@password", txtpassword.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {

                    if (dt.Rows[0][1].ToString() == "Admin")
                    {
                        Session["Admin"] = dt.Rows[0]["num_empleado"];
						Session["empleadoCaptura"] = dt.Rows[0]["num_empleado"];
						Response.Redirect("Search.aspx");
                    }
                    else if (dt.Rows[0][1].ToString() == "Datos")
                    {
                        Session["Datos"] = dt.Rows[0]["num_empleado"];
                        Session["empleadoCaptura"] = dt.Rows[0]["num_empleado"];
                        Response.Redirect("Search.aspx");
                    }
                    else if (dt.Rows[0][1].ToString() == "User")
                    {
                        Session["User"] = dt.Rows[0]["num_empleado"];
						Session["empleadoCaptura"] = dt.Rows[0]["num_empleado"];
						Response.Redirect("Territorial.aspx");
                    }
					else if (dt.Rows[0][1].ToString() == "User1")
					{
						Session["User1"] = dt.Rows[0]["num_empleado"];
						Session["empleadoCaptura"] = dt.Rows[0]["num_empleado"];
						Response.Redirect("Catalogo.aspx");
					}
                    else if (dt.Rows[0][1].ToString() == "User2")
                    {
                        Session["User2"] = dt.Rows[0]["num_empleado"];
                        Session["empleadoCaptura"] = dt.Rows[0]["num_empleado"];
                        Response.Redirect("Regiones.aspx");
                    }
                    else if (dt.Rows[0][1].ToString() == "User3")
                    {
                        Session["User3"] = dt.Rows[0]["num_empleado"];
                        Session["empleadoCaptura"] = dt.Rows[0]["num_empleado"];
                        Response.Redirect("Seccionales.aspx");
                    }
                    else if (dt.Rows[0][1].ToString() == "User4")
                    {
                        Session["User4"] = dt.Rows[0]["num_empleado"];
                        Session["empleadoCaptura"] = dt.Rows[0]["num_empleado"];
                        Response.Redirect("Manzaneros.aspx");
                    }
                }
                else
                {
					throw new Exception("Ingrese los datos correctamente.");
                }
            }

        }
        catch (Exception ex)
        {
			Tools.setError(msgError, ex.Message, true);

		}



	}
            
}
        

