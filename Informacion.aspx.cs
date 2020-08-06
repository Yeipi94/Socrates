using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Informacion : System.Web.UI.Page
{
    string strConnString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;

    private string clave;
    private  SqlCommand comando;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        Consulta_Info();
        if (!Page.IsPostBack)
        {          
            CargaInfoTel();
            CargaInfoTel2();
        }
    }

	private void Consulta_Info()
	{
        string cs = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {

            int entidad = Convert.ToInt32(Request.QueryString["entidad"]);
            string Clave_Rec = String.IsNullOrEmpty(Request.QueryString["clave"]) ? "" : Request.QueryString["clave"].ToString();

            SqlCommand com = new SqlCommand("sp_InformacioNacional", con);

            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@id_Estado", entidad);
            com.Parameters.AddWithValue("@CVE", Clave_Rec);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataTable dtt = ds.Tables[0];
            con.Close();
            txtClave.Text = dtt.Rows[0]["CVE"].ToString();
            txtNombre.Text = dtt.Rows[0]["Nombre_Comp"].ToString();
            txtEdad.Text = dtt.Rows[0]["edad"].ToString();
            txtCalle.Text = dtt.Rows[0]["calle"].ToString();
            txtNum.Text = dtt.Rows[0]["num_exterior"].ToString();
            txtColonia.Text = dtt.Rows[0]["colonia"].ToString();
            txtMun.Text = dtt.Rows[0]["municipio"].ToString();
            txtSec.Text = dtt.Rows[0]["seccion"].ToString();
            txtEmi.Text = dtt.Rows[0]["emision_cre"].ToString();
            txtseis.Text = dtt.Rows[0]["voto2006"].ToString();
            txtnueve.Text = dtt.Rows[0]["voto2009"].ToString();
            txtdoce.Text = dtt.Rows[0]["voto2012"].ToString();
            txtOrigen.Text = dtt.Rows[0]["INE_Origen"].ToString();
            txtDirComp.Text = dtt.Rows[0]["direccion_comp"].ToString();
            txtEstadoN.Text = dtt.Rows[0]["edo_nac"].ToString();
            txtFechaN.Text = dtt.Rows[0]["FechaN"].ToString();
            txtSexo.Text = dtt.Rows[0]["sexo"].ToString().Trim();
            txtAfiliacion.Text = dtt.Rows[0]["partido_afil"].ToString().TrimEnd();
        }
    }

	private void CargaInfoTel()
    {
        try
        {
            dt = new DataTable();
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();

            string validar = txtNombre.Text.Trim(); 

            if (validar != "")
            {
                string result = SqlDataSource1.SelectCommand = "SELECT  cuenta, telefono, marca, modelo, domicilio, numero, colonia, numero, ciudad   FROM Vw_TelNacional  WHERE Nombre_comp  like '" + validar + "%'";
              
            }
            else
            {
                
            }

            SqlDataSource1.DataBind();

            con.Close();
        }

        catch (Exception ex)
        {

        }

    }

    private void CargaInfoTel2()
    {
        try
        {
            dt = new DataTable();
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();

            string validar = txtNombre.Text.Trim();

            if (validar != "")
            {
                string result = SqlDataSource2.SelectCommand = "SELECT *  FROM [tbl_TelefonosNL PRI]  WHERE nombre_comp  like '" + validar + "%'";

            }
            else
            {

            }

            SqlDataSource2.DataBind();

            con.Close();
        }

        catch (Exception ex)
        {

        }

    }

    protected void GdvTelefonos_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void GdvTelefonos_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void GdvTelefonos_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}