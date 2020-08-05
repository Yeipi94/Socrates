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
            CargaEstados();
            Estatus();
        }
    }
    public void CargaEstados()//Inicia el llenado de Dropdowlist
    {
        ddlEstado.DataSource = Consultar("SELECT * FROM tbl_Estados");
        ddlEstado.DataTextField = "d_estado";//Texto que se desea mostrar en dropdow
        ddlEstado.DataValueField = "Id_Estado";//Valor de las lista en cada opcion
        ddlEstado.DataBind();
        ddlEstado.Items.Insert(0, new ListItem("Seleccionar", ""));//el valor que le mostrara al ususrio en el dropdowlist
        ddlMunicipio.Items.Insert(0, new ListItem("Seleccionar", ""));
        ddlColonia.Items.Insert(0, new ListItem("Seleccionar", ""));


    }

  


    /// <summary>
    /// GRIDVIEW Y WEB SERVICES CON PARAMETROS DE ENTRADA Y SIN PARAMETROS
    /// </summary>
    private void ListDistritales()
    {
        try
        {


            
            //string validar = txtNombre.Text.Trim();
            //string entidad = ddlEstados_Cat.Text.Trim();
            //DataTable dt = Service.GetNacionalLista(validar, entidad);
            DataTable dt = lista.GetNacionalLista();
            Gw_ListaAsignacion.DataSource = dt;
            Gw_ListaAsignacion.DataBind();
        }
        catch (Exception ex)
        { 
            Tools.setError(msgError, ex.Message, true); 
        }
    }


    public void Estatus()//Inicia el llenado de Dropdowlist
    {
        ddlEstatus.DataSource = Consultar("SELECT * from tbl_Asignacion ");
        ddlEstatus.DataTextField = "Asignacion";//Texto que se desea mostrar en dropdow
        ddlEstatus.DataValueField = "id_Asignacion";//Valor de las lista en cada opcion
        ddlEstatus.DataBind();
        ddlEstatus.Items.Insert(0, new ListItem("Seleccionar", ""));//el valor que le mostrara al ususrio en el dropdowlist

    }

    protected void MunicipioSeleccionado(object sender, EventArgs e)
    {

        int id_Distrito = Convert.ToInt32(ddlEstado.SelectedValue);
        ddlMunicipio.DataSource = Consultar("SELECT * FROM tbl_municipios where id_Estado=" + id_Distrito);
        ddlMunicipio.DataTextField = "nombre";
        ddlMunicipio.DataValueField = "clave";
        ddlMunicipio.DataBind();
        ddlMunicipio.Items.Insert(0, new ListItem("Seleccionar", ""));
        ddlColonia.Items.Insert(0, new ListItem("Seleccionar", ""));



    }

    protected void ColoniaSeleccionar(object sender, EventArgs e)
    {
        string estado = ddlEstado.SelectedValue;
        string municipio = ddlMunicipio.SelectedValue;
        ddlColonia.DataSource = Consultar("select * from tbl_Colonias where  fk_Estado=" + estado + " and fk_Municipios =" + municipio + "  order by colonia asc");

        ddlColonia.DataTextField = "colonia";
        ddlColonia.DataValueField = "id_Colonia";
        ddlColonia.DataBind();
        ddlColonia.Items.Insert(0, new ListItem("Seleccionar", ""));
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
    }//MEtodo que retorna datos
    protected void DdlNivel_TextChanged(object sender, EventArgs e)
    {
        //try
        //{
        //    DataTable dt = new DataTable();
        //    SqlConnection con = new SqlConnection(strConnString);
        //    con.Open();

        //    string result = SqlDataSource1.SelectCommand = "SELECT *  FROM tbl_Captura";
        //    GvwMonterrey.DataBind();

        //    SqlDataSource1.DataBind();

        //    con.Close();



        //}

        //catch (Exception ex)
        //{
        //    //Tools.setError(msgError, ex.Message, true);

        //}
    }




	protected void btnBuscar_Click1(object sender, EventArgs e)
	{
        Catalogos Ws = new Catalogos();
        string Estado = ddlEstado.SelectedValue.ToString();
        string Municipio = ddlMunicipio.SelectedValue.ToString();
        string colonia = ddlColonia.SelectedValue.ToString();
        Ws.ListarPersonas(Estado, Municipio, colonia);
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