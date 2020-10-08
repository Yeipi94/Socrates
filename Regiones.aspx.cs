using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Regiones : BasePage
{
	string strConnString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
    WebServiceDatos Tools = new WebServiceDatos();
    ws_TablaDatos lista = new ws_TablaDatos();
	protected void Page_Load(object sender, EventArgs e)
	{
        ListRegiones();

    }

    private void ListRegiones()
    {
        try
        {
            DataTable dt = lista.GetListaRegiones();
            Gw_ListaAsignacion.DataSource = dt;
            Gw_ListaAsignacion.DataBind();
        }
        catch (Exception ex)
        {
            Tools.setError(msgError, ex.Message, true);
        }
    }

}