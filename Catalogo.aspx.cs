using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Catalogo : System.Web.UI.Page
{
    WebServiceDatos Tools = new WebServiceDatos();
    string strConnString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
    DataTable dt;
    AutocompletarService Service = new AutocompletarService();
    ws_TablaDatos lista = new ws_TablaDatos();
    protected void Page_Load(object sender, EventArgs e)
    {
        ListDistritales();
        if (!Page.IsPostBack)
        {
        }
    }
    

  


    /// <summary>
    /// GRIDVIEW Y WEB SERVICES CON PARAMETROS DE ENTRADA Y SIN PARAMETROS
    /// </summary>
    private void ListDistritales()
    {
        try
        {
            DataTable dt = lista.GetNacionalLista();
            Gw_ListaAsignacion.DataSource = dt;
            Gw_ListaAsignacion.DataBind();
        }
        catch (Exception ex)
        { 
            Tools.setError(msgError, ex.Message, true); 
        }
    }


   

   
    public DataSet Consultar(string strSQL)
    {
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        SqlCommand cmd = new SqlCommand(strSQL, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        return ds;
    }
   



	
	protected void Gw_ListaAsignacion_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{

	}

	protected void Gw_ListaAsignacion_RowDataBound(object sender, GridViewRowEventArgs e)
	{

	}

	protected void Gw_ListaAsignacion_SelectedIndexChanged(object sender, EventArgs e)
	{

	}
}