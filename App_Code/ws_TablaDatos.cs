using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Descripción breve de ws_TablaDatos
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
// [System.Web.Script.Services.ScriptService]
public class ws_TablaDatos : System.Web.Services.WebService
{

	public ws_TablaDatos()
	{

		//Elimine la marca de comentario de la línea siguiente si utiliza los componentes diseñados 
		//InitializeComponent(); 
	}

	[WebMethod]
	public string HelloWorld()
	{
		return "Hola a todos";
	}


    [WebMethod]
    public DataTable GetNacionalLista(int empleado)
    {
        Connections cnn = new Connections();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.CommandText = "sp_ListAsignaciones";
        cmd.Parameters.AddWithValue("@empleado", empleado);
        cmd.Connection = cnn.cnn();
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);

        cmd.Connection.Close();
        cnn.close();
        return dt;
    }
    
    [WebMethod]
    public DataTable GetListaSecciones(int empleado)
    {
        Connections cnn = new Connections();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.CommandText = "sp_ListSecciones";
        cmd.Parameters.AddWithValue("@empleado", empleado);
        cmd.Connection = cnn.cnn();
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);

        cmd.Connection.Close();
        cnn.close();
        return dt;
    }

    [WebMethod]
    public DataTable GetListaManzanas( int empleado)
    {
        Connections cnn = new Connections();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.CommandText = "sp_ListManzanas";
        cmd.Parameters.AddWithValue("@empleado", empleado);
        cmd.Connection = cnn.cnn();
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);

        cmd.Connection.Close();
        cnn.close();
        return dt;
    }

}
