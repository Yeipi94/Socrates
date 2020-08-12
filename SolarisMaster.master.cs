using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SolarisMaster : System.Web.UI.MasterPage
{
    string strConnString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)//si hay un fifetente de postback
        {
            Page.MaintainScrollPositionOnPostBack = true;
        }

        try
        {


            //SESSION DE USUARIO CAPTURA
            if (Session["User"] != null)
            {
                Dashboard.Visible = false;
                catalogos.Visible = true;
                divElectoral.Visible = false;
                Busqueda.Visible = false;

                string NumEmpleado = Session["User"].ToString();

                //DateTime Hoy = DateTime.Today;
                //string fecha_actualMaster = Hoy.ToString("dd/MM/yyyy HH:mm:ss");

                //SqlConnection connection = new SqlConnection();
                string NomCom = "select  CONCAT(nom_Empleado,' ', Ape_PatEmpleado,' ', Ape_MatEmpleado) as empleadoCom from tblEmpleado where num_empleado=" + "'" + NumEmpleado + "'";

                //SqlCommand cmd = new SqlCommand(NomCom, connection);
                //SqlDataReader registro = cmd.ExecuteReader();
                //lblNombreUSer.Text = registro["empleadoCom"].ToString();
                //lblNombreUSer.Text = ConexionBD(NomCom, );

                using (SqlConnection conn = new SqlConnection(strConnString))
                {
                    string sql = "select  CONCAT(nom_Empleado,' ', Ape_PatEmpleado,' ', Ape_MatEmpleado) as empleadoCom from tblEmpleado where num_empleado=" + "'" + NumEmpleado + "'";
                    SqlCommand command = new SqlCommand(sql, conn);
                    conn.Open();
                    SqlDataReader registro = command.ExecuteReader();
                    if (registro.Read())
                    {
                        lblNombreUSer.Text = registro["empleadoCom"].ToString();

                    }
                }

            }
            else if (Session["Admin"] != null)
            {

                string NumEmpleado = Session["Admin"].ToString().Trim();
                string NomCom = "select  CONCAT(nom_Empleado,' ', Ape_PatEmpleado,' ', Ape_MatEmpleado) as empleadoCom from tblEmpleado where num_empleado=" + "'" + NumEmpleado + "'";

                using (SqlConnection conn = new SqlConnection(strConnString))
                {
                    string sql = "select  CONCAT(nom_Empleado,' ', Ape_PatEmpleado,' ', Ape_MatEmpleado) as empleadoCom from tblEmpleado where num_empleado=" + "'" + NumEmpleado + "'";
                    SqlCommand command = new SqlCommand(sql, conn);
                    conn.Open();
                    SqlDataReader registro = command.ExecuteReader();
                    if (registro.Read())
                    {
                        lblNombreUSer.Text = registro["empleadoCom"].ToString();
                    }
                }

            }
            else if (Session["User1"] != null)
            {
                Dashboard.Visible = false;
                catalogos.Visible = true;
                divElectoral.Visible = true;
                Busqueda.Visible = false;
                M_Region.Visible = false;
                M_Seccion.Visible = false;
                M_Manzana.Visible = false;
                string NumEmpleado = Session["User1"].ToString().Trim();
                string NomCom = "select  CONCAT(nom_Empleado,' ', Ape_PatEmpleado,' ', Ape_MatEmpleado) as empleadoCom from tblEmpleado where num_empleado=" + "'" + NumEmpleado + "'";
                using (SqlConnection conn = new SqlConnection(strConnString))
                {
                    string sql = "select  CONCAT(nom_Empleado,' ', Ape_PatEmpleado,' ', Ape_MatEmpleado) as empleadoCom from tblEmpleado where num_empleado=" + "'" + NumEmpleado + "'";
                    SqlCommand command = new SqlCommand(sql, conn);
                    conn.Open();
                    SqlDataReader registro = command.ExecuteReader();
                    if (registro.Read())
                    {
                        lblNombreUSer.Text = registro["empleadoCom"].ToString();

                    }
                }
            }
            else if (Session["User2"] != null)
            {
                
                Dashboard.Visible = false;
                catalogos.Visible = true;
                divElectoral.Visible = true;
                Busqueda.Visible = false;

                M_Distrito.Visible = false;
                M_Seccion.Visible = false;
                M_Manzana.Visible = false;

                string NumEmpleado = Session["User2"].ToString().Trim();
                string NomCom = "select  CONCAT(nom_Empleado,' ', Ape_PatEmpleado,' ', Ape_MatEmpleado) as empleadoCom from tblEmpleado where num_empleado=" + "'" + NumEmpleado + "'";
                using (SqlConnection conn = new SqlConnection(strConnString))
                {
                    string sql = "select  CONCAT(nom_Empleado,' ', Ape_PatEmpleado,' ', Ape_MatEmpleado) as empleadoCom from tblEmpleado where num_empleado=" + "'" + NumEmpleado + "'";
                    SqlCommand command = new SqlCommand(sql, conn);
                    conn.Open();
                    SqlDataReader registro = command.ExecuteReader();
                    if (registro.Read())
                    {
                        lblNombreUSer.Text = registro["empleadoCom"].ToString();

                    }
                }
            }
            else if (Session["User3"] != null)
            {
                Dashboard.Visible = false;
                catalogos.Visible = true;
                divElectoral.Visible = true;
                Busqueda.Visible = false;

                M_Distrito.Visible = false;
                M_Region.Visible = false;
                M_Manzana.Visible = false;

                string NumEmpleado = Session["User3"].ToString().Trim();
                string NomCom = "select  CONCAT(nom_Empleado,' ', Ape_PatEmpleado,' ', Ape_MatEmpleado) as empleadoCom from tblEmpleado where num_empleado=" + "'" + NumEmpleado + "'";
                using (SqlConnection conn = new SqlConnection(strConnString))
                {
                    string sql = "select  CONCAT(nom_Empleado,' ', Ape_PatEmpleado,' ', Ape_MatEmpleado) as empleadoCom from tblEmpleado where num_empleado=" + "'" + NumEmpleado + "'";
                    SqlCommand command = new SqlCommand(sql, conn);
                    conn.Open();
                    SqlDataReader registro = command.ExecuteReader();
                    if (registro.Read())
                    {
                        lblNombreUSer.Text = registro["empleadoCom"].ToString();

                    }
                }
            }
            else if (Session["User4"] != null)
            {
                Dashboard.Visible = false;
                catalogos.Visible = true;
                divElectoral.Visible = true;
                Busqueda.Visible = false;

                M_Distrito.Visible = false;
                M_Seccion.Visible = false;
                M_Seccion.Visible = false;
                string NumEmpleado = Session["User4"].ToString().Trim();
                string NomCom = "select  CONCAT(nom_Empleado,' ', Ape_PatEmpleado,' ', Ape_MatEmpleado) as empleadoCom from tblEmpleado where num_empleado=" + "'" + NumEmpleado + "'";
                using (SqlConnection conn = new SqlConnection(strConnString))
                {
                    string sql = "select  CONCAT(nom_Empleado,' ', Ape_PatEmpleado,' ', Ape_MatEmpleado) as empleadoCom from tblEmpleado where num_empleado=" + "'" + NumEmpleado + "'";
                    SqlCommand command = new SqlCommand(sql, conn);
                    conn.Open();
                    SqlDataReader registro = command.ExecuteReader();
                    if (registro.Read())
                    {
                        lblNombreUSer.Text = registro["empleadoCom"].ToString();

                    }
                }
            }
            else if (Session["Datos"] != null)
            {



                string NumEmpleado = Session["Datos"].ToString().Trim();
                string NomCom = "select  CONCAT(nom_Empleado,' ', Ape_PatEmpleado,' ', Ape_MatEmpleado) as empleadoCom from tblEmpleado where num_empleado=" + "'" + NumEmpleado + "'";

                using (SqlConnection conn = new SqlConnection(strConnString))
                {
                    string sql = "select  CONCAT(nom_Empleado,' ', Ape_PatEmpleado,' ', Ape_MatEmpleado) as empleadoCom from tblEmpleado where num_empleado=" + "'" + NumEmpleado + "'";
                    SqlCommand command = new SqlCommand(sql, conn);
                    conn.Open();
                    SqlDataReader registro = command.ExecuteReader();
                    if (registro.Read())
                    {
                        lblNombreUSer.Text = registro["empleadoCom"].ToString();

                    }
                }

            }
            else
            {
                Response.Redirect("Index.aspx");
            }

        }
        catch
        {
            Response.Redirect("Index.aspx");
        }

    }

    public void btLogOut(object sender, System.EventArgs e)
    {
        Session.Clear();
        Session.RemoveAll();
        //Session.Abandon();
        //Session.Remove("User");
        Response.Redirect("~/Index.aspx");
        //Session.Abandon();

        //Response.AppendHeader("Refresh", "5;url=index.aspx");

    }
}
