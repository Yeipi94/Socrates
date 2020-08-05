using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
//using System.Drawing;
using System.IO;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Web.Security;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Script.Serialization;

public partial class Search : System.Web.UI.Page
{
	WebServiceDatos Tools = new WebServiceDatos();
	AutocompletarService Service = new AutocompletarService();
	Catalogos Ws = new Catalogos();

	private int valor1;
	private int valor2;
	private int valor3;
	private int valor4;
	string strConnString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
	//SqlDataAdapter adapt;
	DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
		




		//Ws.Usp_MostrarIncidentes(2, Session["usuario"].ToString(), 0);

		//nombre.Visible = false;

		//divnotificacion.Visible = false;
		if (this.IsPostBack)
		{
			TabName.Value = Request.Form[TabName.UniqueID];
			this.BindGrid();

		}

	}



	//[System.Web.Script.Services.ScriptMethod()]
	//[System.Web.Services.WebMethod]
	//public static List<string> SearchCustomers(string prefixText, int count, string contextKey)
	//{
	//	using (SqlConnection conn = new SqlConnection())
	//	{
	//		conn.ConnectionString = ConfigurationManager
	//				.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
	//		using (SqlCommand cmd = new SqlCommand())
	//		{
	//			string cmdText = "SELECT  NOM_COMP FROM tbl_NuevoL2017 where " +
	//			"NOM_COMP like @SearchText + '%'";
	//			cmd.Parameters.AddWithValue("@SearchText", prefixText);
	//			if (contextKey != "0")
	//			{
	//				cmdText += " and E = @Country";
	//				cmd.Parameters.AddWithValue("@Country", contextKey);
	//			}
	//			cmd.CommandText = cmdText;
	//			cmd.Connection = conn;
	//			conn.Open();
	//			List<string> customers = new List<string>();
	//			using (SqlDataReader sdr = cmd.ExecuteReader())
	//			{
	//				while (sdr.Read())
	//				{
	//					customers.Add(sdr["NOM_COMP"].ToString());
	//				}
	//			}
	//			conn.Close();
	//			return customers;
	//		}
	//	}
	//}

	private void BindGrid()
	{
		//AutocompletarService service = new AutocompletarService();
		//string nombre = txtName.Text;
		//string Estado = ddlEstados.SelectedValue;
		//GridView2.DataSource = service.Get(Convert.ToString(nombre), Convert.ToString(Estado));
		//GridView2.DataBind();

	}

	[System.Web.Script.Services.ScriptMethod()]
	[System.Web.Services.WebMethod]

	public static List<string> SearchCustomers(string prefixText, int count, string contextKey)
	{

		using (SqlConnection conn = new SqlConnection())
		{
			conn.ConnectionString = ConfigurationManager
					.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
			using (SqlCommand cmd = new SqlCommand())
			{
				cmd.CommandType = System.Data.CommandType.StoredProcedure;
				cmd.CommandText = "sp_BusquedaNacional";
				cmd.Parameters.AddWithValue("@NOMBRE_COMP", prefixText);
				cmd.Parameters.AddWithValue("@Estado", contextKey);
				
				cmd.Connection = conn;
				conn.Open();

				List<string> customers = new List<string>();

				using (SqlDataReader sdr = cmd.ExecuteReader())
				{
					while (sdr.Read())
					{
						//customers.Add("<p>" + sdr["Nombre_Comp"].ToString() + " | " + sdr["CVE"].ToString() + " | "+ sdr["d_estado"].ToString() + "</p> ");

						customers.Add(sdr["Nombre_Comp"].ToString());
					}
				}
				conn.Close();
				return customers;



			}
		}
	}

	private void getIndicadores()
	{
		try
		{


			string validar = txtNombre.Text.Trim();
			string entidad = ddlEstados_Cat.Text.Trim();
			DataTable dt = Service.GetNacionalLista(validar, entidad);
			GridView1.DataSource = dt;
			GridView1.DataBind();
		}
		catch (Exception ex) { Tools.setError(msgError, ex.Message, true); }
	}

	

	protected void txtName_TextChanged(object sender, EventArgs e)
	{
		getIndicadores();
		

	}
	protected void btnBuscar_Click(object sender, EventArgs e)
    {
		
	}
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        //////PAGINACION DE REGISTROS
        ///REGISTROS2016
        GridView1.PageIndex = e.NewPageIndex;
        SqlDataSource1.DataBind();
		///REGISTROSBASE03
		//GvwMonterrey.PageIndex = e.NewPageIndex;
  //      SqlDataSource2.DataBind();
        /////REGISTROSBASEMIERYNORIEGA
        //GridView3.PageIndex = e.NewPageIndex;
        //SqlDataSource3.DataBind();
        ////view_GestorCaptura
        //GridView4.PageIndex = e.NewPageIndex;
        //SqlDataSource4.DataBind();
    }

	//[WebMethod]
	//[ScriptMethod(ResponseFormat=ResponseFormat.Json)]
	//public List<string> GetNombres(string nombre_comp)
	//{
	//	//List<string> nom_autocompletar = new List<string>();
	//	string cs = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
	//	using (SqlConnection con = new SqlConnection(cs))
	//	{
	//		SqlCommand cmd = new SqlCommand("SELECT top (500) nombre_comp  FROM View_Telcel  WHERE nombre_comp  like @Nombre_comp +'%'", con);
	//		cmd.CommandType = CommandType.StoredProcedure;
	//		cmd.Parameters.Add(new SqlParameter()
	//		{
	//			ParameterName = "@Nombre_comp",
	//			Value = nombre_comp
	//		});
	//		con.Open();
	//		SqlDataReader rdr = cmd.ExecuteReader();
	//		while (rdr.Read())
	//		{
	//			nom_autocompletar.Add(rdr["nombre_comp"].ToString());
	//		}
	//	}

	//	return nom_autocompletar;
	//}

	protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        GridViewRow row1 = GridView1.SelectedRow;
        //GridViewRow row2 = GvwMonterrey.SelectedRow;
        //GridViewRow row3 = GridView3.SelectedRow;
        //GridViewRow row4 = GridView4.SelectedRow;

        if (row1 != null)
		{
			//datoCelda1 = row1.Cells[0].Text.Trim();

				int index = GridView1.SelectedIndex;


            string clave = GridView1.DataKeys[index].Value.ToString();
            //string clave = row1.Cells[0].Text.Trim();
            string entidad = row1.Cells[7].Text.Trim();
            //string entidad = row1.Cells[6].Text.Trim();

			//string baseD = "View_Telcel";
			Session["HoraInicioCap"] = DateTime.Now.ToString();
            Response.Redirect("Informacion.aspx?" + "clave=" + clave + "&entidad=" + entidad);
        }
        
    }
	

	protected void registro1(object sender, SqlDataSourceStatusEventArgs e)
    {
        valor1 = e.AffectedRows;
		Label2.Text = "  " + Convert.ToString(valor1) + " registros.";


    }
 

	

	protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		//if (e.Row.RowType == DataControlRowType.DataRow)
		//{
		//	Literal tot = (Literal)e.Row.FindControl("ltObservaciondx");
		//	if (tot.Text == "DUPLICADO")
		//	{
		//		e.Row.BackColor = Color.FromName("#ffc7ce");
		//		//e.Row.Cells[2].BackColor = Color.FromName("#c6efce");
		//	}

		//	//if (GridView1.Rows.Count == 0)
		//	//{
		//	//	e.Row.BackColor = Color.FromName("#ffeb9c");
		//	//}

		//}
	}







    protected void GvwMonterrey_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
		GvwMonterrey.PageIndex = e.NewPageIndex;
		SqlDataSource2.DataBind();
	}

    protected void GvwMonterrey_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void GvwMonterrey_SelectedIndexChanged(object sender, EventArgs e)
    {
		GridViewRow row1 = GvwMonterrey.SelectedRow;


		if (row1 != null)
		{

			int index = GvwMonterrey.SelectedIndex;


			string clave = GvwMonterrey.DataKeys[index].Value.ToString();
			//string baseD = row1.Cells[5].Text.Trim();
			string baseD = row1.Cells[5].Text.Trim();

			Session["HoraInicioCap"] = DateTime.Now.ToString();
			Response.Redirect("Informacion.aspx?" + "clave=" + clave + "&baseD=" + baseD);
		}

	}

    protected void registro2(object sender, SqlDataSourceStatusEventArgs e)
    {
		valor1 = e.AffectedRows;
		Label3.Text = "  " + Convert.ToString(valor1) + " registros.";
	}







	//[WebMethod]
	//public  List<Personas> ListarPersonas()
	//{
	//	//List<Personas> Lista = null;
	//	List<Personas> Lista = new List<Personas>();
	//	try
	//	{

	//		SqlConnection con = null;
	//		SqlCommand cmd = null;
	//		SqlDataReader dr = null;

	//		try
	//		{
	//			Connections cnn = new Connections();
	//			cnn.cnn();
	//			cmd = new SqlCommand("spListarPersonas", con);
	//			cmd.CommandType = CommandType.StoredProcedure;
	//			con.Open();
	//			dr = cmd.ExecuteReader();

	//			while (dr.Read())
	//			{
	//				// Crear objetos de tipo Paciente
	//				Personas objPersonas = new Personas();
	//				//objPersonas.id = Convert.ToInt32(dr["id"].ToString());
	//				//objPersonas.Entidad = dr["Entidad"].ToString();
	//				//objPersonas.Nombre = dr["Nombre"].ToString();
	//				//objPersonas.F_Afil = dr["F_Afil"].ToString();

	//				objPersonas.clave = dr["clave"].ToString();
	//				objPersonas.Nombre_Comp = dr["Nombre_Comp"].ToString();
	//				objPersonas.colonia = dr["colonia"].ToString();
	//				objPersonas.municipio = dr["municipio"].ToString();
	//				objPersonas.entidad = dr["entidad"].ToString();
	//				// añadir a la lista de objetos
	//				Lista.Add(objPersonas);
	//			}

	//		}
	//		catch (Exception ex)
	//		{
	//			throw ex;
	//		}
	//	}
	//	catch (Exception ex)
	//	{
	//		Lista = new List<Personas>();
	//	}
	//	return Lista;
	//}



	//public List<Personas> ListarPersonas()
	//   {
	//       List<Personas> Lista = new List<Personas>();
	//       SqlConnection con = null;
	//       //SqlCommand cmd = null;
	//       SqlDataReader dr = null;

	//       try
	//       {
	//           AutocompletarService dbws = new AutocompletarService();

	//           DataTable dt = dbws.ListarPersonas();

	//           Personas objPersonas = new Personas();
	//           objPersonas.clave = dr["clave"].ToString();
	//           objPersonas.Nombre_Comp = dr["Nombre_Comp"].ToString();
	//           objPersonas.colonia = dr["colonia"].ToString();
	//           objPersonas.municipio = dr["municipio"].ToString();
	//           objPersonas.entidad = dr["entidad"].ToString();
	//           // añadir a la lista de objetos
	//           Lista.Add(objPersonas);


	//       }
	//       catch (Exception ex)
	//       {
	//           throw ex;
	//       }
	//       finally
	//       {
	//           con.Close();
	//       }
	//       return Lista;
	//   }



	protected void txtIntegrante_TextChanged(object sender, EventArgs e)
	{

	}

	protected void ddlEstados_Cat_SelectedIndexChanged(object sender, EventArgs e)
	{
	}
}