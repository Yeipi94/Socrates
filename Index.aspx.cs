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
						Response.Redirect("Search.aspx");
                    }
					else if (dt.Rows[0][1].ToString() == "Carto")
					{
						Session["Carto"] = dt.Rows[0]["num_empleado"];
						Session["empleadoCaptura"] = dt.Rows[0]["num_empleado"];
						Response.Redirect("Cartografía.aspx");
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
        

