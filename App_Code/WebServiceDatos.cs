using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;
using System.Web.UI.HtmlControls;

/// <summary>
/// Descripción breve de WebServiceDatos
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
// [System.Web.Script.Services.ScriptService]
public class WebServiceDatos : System.Web.Services.WebService
{
	string strConnString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;

	private SqlConnection con;
	private SqlDataAdapter da = new SqlDataAdapter();
	private DataTable dt = new DataTable();
	private SqlCommand cmd;
	public SqlDataReader dr;

	private void Conectar()
	{
		con = new SqlConnection("Data Source=192.168.1.124; Initial Catalog=SISTEM_ALIADOS; User ID=usuario1; Password=Juanp123");
		con.Open();
	}
	private void Desconectar()
	{
		con.Close();
	}

	private void CrearComando(String consulta)
	{
		cmd = new SqlCommand(consulta, con);
	}
	private void AsignarParametro(string param, SqlDbType tipo, object value)
	{
		cmd.Parameters.Add(param, tipo).Value = value;
	}
	private int EjecutarConsulta()
	{
		int numReg;
		numReg = cmd.ExecuteNonQuery();
		return numReg;
	}

	[WebMethod]
	public void setError(HtmlGenericControl msg, string message, bool display)
	{
		string str = "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button>";
		str += "<span class=\"fa fa-exclamation-circle style=\"color:white\"> " + message + "</span>";
		//str += "<p></p><span style=\"color:white\">" + message + "</span>";
		string view = display == true ? "block" : "none";
		msg.Style.Add("display", view);
		msg.InnerHtml = str;
	}
	[WebMethod]
	//public DataTable getDistrito()
	//{
	//	Conectar();
	//	SqlCommand cmd = SqlCommand("spGetDistritos", con);
	//	cmd.CommandType = System.Data.CommandType.StoredProcedure;
	//	con.Open();
	//	SqlDataReader dr = cmd.ExecuteReader();
	//	DataTable dt = new DataTable();
	//	dt.Load(dr);

	//	cmd.Connection.Close();
	//	con.Close();
	//	return dt;
	//}

	private SqlCommand SqlCommand(string v, SqlConnection con)
	{
		throw new NotImplementedException();
	}

	[WebMethod]
	public bool InsertaDatosClientes(string nom, string tel, string ciu)
	{
		bool inserto;
		Conectar();
		CrearComando("INSERT INTO Registro(Nombre,Telefono,Ciudad) VALUES(@nom,@tel,@ciu);");
		AsignarParametro("@nom", SqlDbType.VarChar, nom);
		AsignarParametro("@tel", SqlDbType.VarChar, tel);
		AsignarParametro("@ciu", SqlDbType.VarChar, ciu);
		if (EjecutarConsulta() > 0)
		{
			inserto = true;
		}
		else
		{
			inserto = false;
		}
		con.Close();
		return inserto;
	}
	//[WebMethod]
	//public DataTable ListadoGestores()
	//{
	//	Conectar();
	//	CrearComando("SELECT * FROM tbl_Gestores_Capturados");
	//}

	//[WebMethod]
	//public List<int> ConsultaDatosClientes()
	//{
	//	List lista = new List();
	//	Conectar();
	//	CrearComando("SELECT * FROM tbl_Gestores_Capturados");
	//	da.SelectCommand = cmd;
	//	try
	//	{
	//		da.Fill(dt);
	//		foreach (DataRow dr in dt.Rows)
	//		{
	//			lista.Add(dr["id_formGestor"].ToString());
	//			lista.Add(dr["BDUbicado"].ToString());
	//			lista.Add(dr["num_Integrante"].ToString());
	//		}
	//	}
	//	catch (System.Exception ex)
	//	{
	//		string error = "Error: " + ex.Message;
	//	}
	//	return lista;

	//}

	//public WebServiceDatos()
	//{

	//	//Elimine la marca de comentario de la línea siguiente si utiliza los componentes diseñados 
	//	//InitializeComponent(); 
	//}

	//[WebMethod]
	//public string HelloWorld()
	//{
	//	return "Hola a todos";
	//}
	//[WebMethod]
	//public void getDistrito()
	//{
	// List<Distrito> Distrito = new List<Distrito>();
	//	using (SqlConnection con = new SqlConnection(strConnString))
	//	{
	//		Conectar();
	//		SqlCommand cmd = new SqlCommand("spGetDistritos", con);
	//		cmd.CommandType = CommandType.StoredProcedure;
	//		con.Open();
	//		SqlDataReader rdr = cmd.ExecuteReader();
	//		while (rdr.Read())
	//		{
	//			Distrito Dist = new Distrito();
	//			Dist.id_Distrito = Convert.ToInt32(rdr["id_Distrito"]);
	//			Dist.clave = rdr["clave"].ToString();
	//			Distrito.Add(Dist);
	//		}
	//	}
	//	JavaScriptSerializer js = new JavaScriptSerializer();
	//	Context.Response.Write(js.Serialize(Distrito));
	//}
	//[WebMethod]
	//public DataTable getDimensiones()
	//{

	//	using (SqlConnection con = new SqlConnection(strConnString))
	//	{
	//		Conectar();
	//		//Connections cnn = new Connections();
	//		SqlCommand cmd = new SqlCommand("spGetDistritos", con);
	//		cmd.CommandType = System.Data.CommandType.StoredProcedure;
	//		con.Open();
	//		SqlDataReader dr = cmd.ExecuteReader();
	//		DataTable dt = new DataTable();
	//		dt.Load(dr);

	//		cmd.Connection.Close();
	//		con.Close();
	//		return dt;
	//	}
	//}
	//[WebMethod]
	//public void GetZonas(int fk_Distrito)
	//{
	//	List<Zona> zona = new List<Zona>();
	//	using (SqlConnection con = new SqlConnection(strConnString))
	//	{
	//		Conectar();
	//		SqlCommand cmd = new SqlCommand("spGetZonas", con);
	//		cmd.CommandType = CommandType.StoredProcedure;
	//		SqlParameter param = new SqlParameter()
	//		{
	//			ParameterName = "@fk_Distrito",
	//			Value = fk_Distrito
	//		};
	//		cmd.Parameters.Add(param);
	//		con.Open();
	//		SqlDataReader rdr = cmd.ExecuteReader();
	//		while (rdr.Read())
	//		{
	//			Zona zon = new Zona();
	//			zon.id_Zona = Convert.ToInt32(rdr["id_Zona"]);
	//			zon.zonas = rdr["zonas"].ToString();
	//			zon.fk_Distrito = Convert.ToInt32(rdr["fk_Distrito"]);
	//			zona.Add(zon);
	//		}
	//	}
	//	JavaScriptSerializer js = new JavaScriptSerializer();
	//	Context.Response.Write(js.Serialize(zona));
	//}
	//[WebMethod]
	//public void GetSecciones(int fk_Zona)
	//{
	//	Conectar();
	//	List<Seccion> seccion = new List<Seccion>();
	//	using (SqlConnection con = new SqlConnection(strConnString))
	//	{
	//		SqlCommand cmd = new SqlCommand("spGetSecciones", con);
	//		cmd.CommandType = CommandType.StoredProcedure;
	//		SqlParameter param = new SqlParameter()
	//		{
	//			ParameterName = "@fk_Zona",
	//			Value = fk_Zona
	//		};
	//		cmd.Parameters.Add(param);
	//		con.Open();
	//		SqlDataReader rdr = cmd.ExecuteReader();
	//		while (rdr.Read())
	//		{
	//			Seccion Secn = new Seccion();
	//			Secn.id_Seccion = Convert.ToInt32(rdr["id_Seccion"]);
	//			Secn.seccion = rdr["seccion"].ToString();
	//			Secn.fk_Zona = Convert.ToInt32(rdr["fk_Zona"]);
	//			seccion.Add(Secn);
	//		}
	//	}
	//	JavaScriptSerializer js = new JavaScriptSerializer();
	//	Context.Response.Write(js.Serialize(seccion));
	//}
	[WebMethod]
	public DataTable getDimensiones()
	{
		Connections cnn = new Connections();
		SqlCommand cmd = new SqlCommand();
		cmd.CommandType = System.Data.CommandType.StoredProcedure;
		cmd.CommandText = "spGetDimensiones";
		cmd.Connection = cnn.cnn();
		SqlDataReader dr = cmd.ExecuteReader();
		DataTable dt = new DataTable();
		dt.Load(dr);

		cmd.Connection.Close();
		cnn.close();
		return dt;
	}
	[WebMethod]
	public void Progress(HtmlGenericControl progress, bool display)
	{
		string view = display == true ? "block" : "none";
		progress.Style.Add("display", view);
	}
	[WebMethod]
	public DataTable getDimension(int idDimension)
	{
		Connections cnn = new Connections();
		SqlCommand cmd = new SqlCommand();
		cmd.CommandType = System.Data.CommandType.StoredProcedure;
		cmd.CommandText = "spgetDimension";
		cmd.Parameters.AddWithValue("@idDimension", idDimension);
		cmd.Connection = cnn.cnn();
		SqlDataReader dr = cmd.ExecuteReader();
		DataTable dt = new DataTable();
		dt.Load(dr);

		cmd.Connection.Close();
		cnn.close();
		return dt;
	}
	[WebMethod]
	public DataTable getIndicadores(int idDimension)
	{
		Connections cnn = new Connections();
		SqlCommand cmd = new SqlCommand();
		cmd.CommandType = System.Data.CommandType.StoredProcedure;
		cmd.CommandText = "spgetIndicadores";
		cmd.Parameters.AddWithValue("@idDimension", idDimension);
		cmd.Connection = cnn.cnn();
		SqlDataReader dr = cmd.ExecuteReader();
		DataTable dt = new DataTable();
		dt.Load(dr);

		cmd.Connection.Close();
		cnn.close();
		return dt;
	}
	[WebMethod]
	public bool AddEditDimension(int idDimension, string dimension)
	{
		Connections cnn = new Connections();
		SqlCommand cmd = new SqlCommand();
		cmd.CommandType = System.Data.CommandType.StoredProcedure;
		cmd.CommandText = "spAddEditDimension";
		cmd.Parameters.AddWithValue("@idDimension", idDimension);
		cmd.Parameters.AddWithValue("@Dimension", dimension);
		cmd.Connection = cnn.cnn();
		cmd.ExecuteNonQuery();
		return true;
	}
	[WebMethod]
	public bool AddEditIndicador(int idIndicador, int idDimension, string indicador)
	{
		Connections cnn = new Connections();
		SqlCommand cmd = new SqlCommand();
		cmd.CommandType = System.Data.CommandType.StoredProcedure;
		cmd.CommandText = "spAddEditIndicador";
		cmd.Parameters.AddWithValue("@idDimension", idDimension);
		cmd.Parameters.AddWithValue("@idIndicador", idIndicador);
		cmd.Parameters.AddWithValue("@Indicador", indicador);
		cmd.Connection = cnn.cnn();
		cmd.ExecuteNonQuery();
		return true;
	}
	[WebMethod]
	public bool AddEditSubTitulo(int idSubtitulo, int idTitulo, string clave, string titulo)
	{
		Connections cnn = new Connections();
		SqlCommand cmd = new SqlCommand();
		cmd.CommandType = System.Data.CommandType.StoredProcedure;
		cmd.CommandText = "spAddEditSubTitulo";
		cmd.Parameters.AddWithValue("@idSubTitulo", idSubtitulo);
		cmd.Parameters.AddWithValue("@idTitulo", idTitulo);
		cmd.Parameters.AddWithValue("@Clave", clave);
		cmd.Parameters.AddWithValue("@Titulo", titulo);
		cmd.Connection = cnn.cnn();
		cmd.ExecuteNonQuery();
		return true;
	}
	[WebMethod]
	public DataTable getIndicador(int idIndicador)
	{
		Connections cnn = new Connections();
		SqlCommand cmd = new SqlCommand();
		cmd.CommandType = System.Data.CommandType.StoredProcedure;
		cmd.CommandText = "spgetIndicador";
		cmd.Parameters.AddWithValue("@idIndicador", idIndicador);
		cmd.Connection = cnn.cnn();
		SqlDataReader dr = cmd.ExecuteReader();
		DataTable dt = new DataTable();
		dt.Load(dr);

		cmd.Connection.Close();
		cnn.close();
		return dt;
	}
	[WebMethod]
	public DataTable getTitulos(int idIndicador)
	{
		Connections cnn = new Connections();
		SqlCommand cmd = new SqlCommand();
		cmd.CommandType = System.Data.CommandType.StoredProcedure;
		cmd.CommandText = "spgetTitulos";
		cmd.Parameters.AddWithValue("@idIndicador", idIndicador);
		cmd.Connection = cnn.cnn();
		SqlDataReader dr = cmd.ExecuteReader();
		DataTable dt = new DataTable();
		dt.Load(dr);

		cmd.Connection.Close();
		cnn.close();
		return dt;
	}
	[WebMethod]
	public DataTable GetTitulo(int idTitulo)
	{
		Connections cnn = new Connections();
		SqlCommand cmd = new SqlCommand();
		cmd.CommandType = System.Data.CommandType.StoredProcedure;
		cmd.CommandText = "spGetTitulo";
		cmd.Parameters.AddWithValue("@idTitulo", idTitulo);
		cmd.Connection = cnn.cnn();
		SqlDataReader dr = cmd.ExecuteReader();
		DataTable dt = new DataTable();
		dt.Load(dr);

		cmd.Connection.Close();
		cnn.close();
		return dt;
	}
	[WebMethod]
	public bool AddEditTitulo(int idTitulo, int idIndicador, string clave, string titulo)
	{
		Connections cnn = new Connections();
		SqlCommand cmd = new SqlCommand();
		cmd.CommandType = System.Data.CommandType.StoredProcedure;
		cmd.CommandText = "spAddEditTitulo";
		cmd.Parameters.AddWithValue("@idTitulo", idTitulo);
		cmd.Parameters.AddWithValue("@idIndicador", idIndicador);
		cmd.Parameters.AddWithValue("@Clave", clave);
		cmd.Parameters.AddWithValue("@Titulo", titulo);
		cmd.Connection = cnn.cnn();
		cmd.ExecuteNonQuery();
		return true;
	}
	[WebMethod]
	public DataTable getSubTitulos(int idTitulo)
	{
		Connections cnn = new Connections();
		SqlCommand cmd = new SqlCommand();
		cmd.CommandType = System.Data.CommandType.StoredProcedure;
		cmd.CommandText = "spgetSubTitulos";
		cmd.Parameters.AddWithValue("@idTitulo", idTitulo);
		cmd.Connection = cnn.cnn();
		SqlDataReader dr = cmd.ExecuteReader();
		DataTable dt = new DataTable();
		dt.Load(dr);

		cmd.Connection.Close();
		cnn.close();
		return dt;
	}
	[WebMethod]
	public DataTable getSubtitulo(int idSubtitulo)
	{
		Connections cnn = new Connections();
		SqlCommand cmd = new SqlCommand();
		cmd.CommandType = System.Data.CommandType.StoredProcedure;
		cmd.CommandText = "spGetSubtitulo";
		cmd.Parameters.AddWithValue("@idsubtitulo", idSubtitulo);
		cmd.Connection = cnn.cnn();
		SqlDataReader dr = cmd.ExecuteReader();
		DataTable dt = new DataTable();
		dt.Load(dr);

		cmd.Connection.Close();
		cnn.close();
		return dt;
	}
}
