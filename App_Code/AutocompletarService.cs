using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using AjaxControlToolkit;
using System.Collections.Specialized;

/// <summary>
/// Descripción breve de AutocompletarService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.ComponentModel.ToolboxItem(false)]
[System.Web.Script.Services.ScriptService]
public class AutocompletarService : System.Web.Services.WebService
{


   



    //[WebMethod]
    //public List<string> GetNombres(string nombre_comp)
    //{
    //    List<string> nom_autocompletar = new List<string>();
    //    string cs = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(cs))
    //    {
    //        SqlCommand cmd = new SqlCommand("sp_GetNombres", con);
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        SqlParameter parameter = new SqlParameter()
    //        {
    //            ParameterName = "@nombre_comp",
    //            Value = nombre_comp
    //        };
    //        //cmd.Parameters.Add(new SqlParameter()
    //        //{
    //        //    ParameterName = "@nombre_comp",
    //        //    Value = nombre_comp
    //        //});

    //        cmd.Parameters.Add(parameter);

    //        con.Open();
    //        SqlDataReader rdr = cmd.ExecuteReader();
    //        while (rdr.Read())
    //        {
    //            nom_autocompletar.Add(rdr["Apellidos"].ToString());
    //        }
    //    }

    //    return nom_autocompletar;
    //}

    //METODO PARA BUSCAR PERSONAS DEL INE DESDE PAGINA TERRITORIAL
    //[WebMethod()]
    //[System.Web.Script.Services.ScriptMethod()]
    //public string[] BuscarINE2(string prefixText)
    //{
    //    string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();
    //    using (SqlConnection cn = new SqlConnection(conexion))
    //    {
    //        SqlCommand cmd = new SqlCommand("SELECT top(15) Nombre_Comp, clave_elec FROM tbl_INEPersonas " +
    //            " WHERE Nombre_Comp  " +
    //            "like  '%" + prefixText + "%'", cn);
    //        //cmd.Parameters.AddWithValue("@nombre_comp", prefixText);
    //        //cmd.Parameters.AddWithValue("@entidad", entidad);
    //        SqlDataReader dr = default(SqlDataReader);
    //        cmd.Connection.Open();
    //        dr = cmd.ExecuteReader();
    //        List<string> items = new List<string>();
    //        while (dr.Read())
    //        {
    //            //items.Add(dr["Nombre_Comp"].ToString());
    //            //items.Add(dr["Nombre_Comp"].ToString() + " Colonia:" + dr["colonia"].ToString());
    //            items.Add(dr["Nombre_Comp"].ToString() + " | " + dr["clave_elec"].ToString() + " | ");



    //        }
    //        cmd.Connection.Close();
    //        return items.ToArray();



    //    }
    //}


    //METODO DE BUSQUEDA AUTOCOMPLETAR NOMBRE COMPLETO
    [WebMethod]
    public string[] BuscarINE(string prefixText, int count, string estado)
    {




        //     string MiConeccion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();
        //     List<string> items = new List<string>(count);
        //     DataSet ds = new DataSet();
        //     string connectionString = MiConeccion;
        //     using (SqlConnection connection = new SqlConnection(connectionString))
        //     {

        //string sql = "SELECT top(10) CLAVE_ELECT AS CVE, NOMBRE_COMP AS  NOM_COMP FROM tbl_Nacional_2017 "
        //             +" WHERE NOMBRE_COMP  like'%"+ prefixText + "%'";

        ////string sql = "SELECT  NOMBRE_COMP, CLAVE_ELECT FROM tbl_Nacional_2017 " +
        ////			 " WHERE NOMBRE_COMP  " +
        ////	"like  '" + prefixText + "%' and IDENTIDAD="+ estado+"";
        //connection.Open();
        //         SqlDataAdapter adapter = new SqlDataAdapter();
        //         adapter.SelectCommand = new SqlCommand(sql, connection);
        //         adapter.Fill(ds);


        //     }

        //     //Si no encuentra algún dato envía un registro de no existe tienda.
        //     if (ds.Tables[0].Rows.Count > 0)
        //     {

        //         foreach (DataRow dr in ds.Tables[0].Rows)
        //         {
        //             items.Add(dr["NOMBRE_COMP"].ToString());
        //             //items.SetValue(dr["clave_elec"].ToString() + "\t" +dr["TAR_Tipo"].ToString());


        //         }




        //     }
        //     else
        //     {
        //         items.Add("No se encontraron coincidencias.");
        //     }
        //     return items.ToArray();

        string MiConeccion = MiConeccion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
        List<string> items = new List<string>(count);
        DataSet ds = new DataSet();
        string connectionString = MiConeccion;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string sql = "SELECT CVE, NOM_COMP FROM tbl_NuevoL2017  "
                + "WHERE NOM_COMP like '%" + prefixText + "%'";
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand(sql, connection);
            adapter.Fill(ds);
        }

        //Si no encuentra algún dato envía un registro de no existe tienda.
        if (ds.Tables[0].Rows.Count > 0)
        {

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                //items.Add(dr["CVE"].ToString() + " | " +dr["NOM_COMP"].ToString() + " | ");
                dr["NOM_COMP"].ToString();
                //items.SetValue(dr[“TAR_Codigo”].ToString() + “\t” + dr[“TAR_Tipo”].ToString());
            }

        }
        else
        {
            items.Add("No se encontraron coincidencias.");
        }

        return items.ToArray();

    }





    [WebMethod]
    public DataTable GetNacionalLista(string validar, string entidad)
    {
        Connections cnn = new Connections();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.CommandText = "sp_BusquedaNacional";
        cmd.Parameters.AddWithValue("@NOMBRE_COMP", validar);
        cmd.Parameters.AddWithValue("@Estado", entidad);
        cmd.Connection = cnn.cnn();
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);

        cmd.Connection.Close();
        cnn.close();
        return dt;
    }



    //METODO DE PRUEBA GRIDVIEW
    [WebMethod]
    public DataTable Get(string Nombre, string Estado)
    {
        

        Connections cnn = new Connections();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.CommandTimeout = 90;
        cmd.CommandText = "sp_Nacional_Lista";
        cmd.Parameters.AddWithValue("@NOMBRE_COMP", Nombre);
        cmd.Parameters.AddWithValue("@Estado", Estado);
        cmd.Connection = cnn.cnn();
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);

        cmd.Connection.Close();
        cnn.close();
        return dt;




    }


    [WebMethod]
    public DataTable getIneNacional(string knownCategoryValues)
    {
        Connections cnn = new Connections();
        SqlCommand cmd = new SqlCommand();
        //int CountryID;

        //StringDictionary items = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem();
        //CountryID = Convert.ToInt32(items["Estados"]);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.CommandText = "sp_GetNombres";
        cmd.Parameters.AddWithValue("@nombre_comp", knownCategoryValues);
        cmd.Connection = cnn.cnn();
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);

        cmd.Connection.Close();
        cnn.close();
        return dt;
    }

    [WebMethod]
    public DataTable get_List_Ine(string Estado, string knownCategoryValues)
    {
        Connections cnn = new Connections();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.CommandTimeout = 90;
        cmd.CommandText = "sp_InformacioNacional";
        cmd.Parameters.AddWithValue("@id_Estado", Estado);
        cmd.Parameters.AddWithValue("@CVE", knownCategoryValues);
        cmd.Connection = cnn.cnn();
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);

        cmd.Connection.Close();
        cnn.close();
        return dt;




        //Connections cnn = new Connections();
        //SqlCommand cmd = new SqlCommand();
  

        ////int CountryID;

        ////StringDictionary items = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem();
        ////CountryID = Convert.ToInt32(items["Estados"]);
        //cmd.CommandType = System.Data.CommandType.StoredProcedure;
        //cmd.CommandTimeout = 0;
        //cmd.CommandText = "sp_List_INE_Information";
        //cmd.Parameters.AddWithValue("@clave_elec", knownCategoryValues);
        //cmd.Connection = cnn.cnn();
        //SqlDataReader dr = cmd.ExecuteReader();
        //DataTable dt = new DataTable();
        //dt.Load(dr);

        //cmd.Connection.Close();
        //cnn.close();
        //return dt;
    }

   

    [WebMethod]
    [System.Web.Script.Services.ScriptMethod()]
    public static List<string> Get_NameCom(string prefixText, int count, string contextKey)
    {
        string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();
        using (SqlConnection cn = new SqlConnection(conexion))
        {
            SqlCommand cmd = new SqlCommand("SELECT top(15)clave_elec, Nombre_Comp FROM tbl_INEPersonas " +
                 " WHERE Nombre_Comp  " +
                 "like  @nombre_comp +'%'  ", cn);
            cmd.Parameters.AddWithValue("@nombre_comp", prefixText);
            SqlDataReader dr = default(SqlDataReader);
            cmd.Connection.Open();
            dr = cmd.ExecuteReader();
            List<string> items = new List<string>();
            while (dr.Read())
            {
                items.Add(dr["Nombre_Comp"].ToString());

            }
            cmd.Connection.Close();
            return items;









            //}

            //string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();
            //   //List items = new List(count);
            //   List<string> items = new List<string>();
            //   DataSet ds = new DataSet();
            //   using (SqlConnection cn = new SqlConnection(conexion))
            //   {
            //       SqlCommand cmd = new SqlCommand("SELECT top(15)  * FROM tbl_INEPersonas   WHERE Nombre_Comp  like  @nombre_comp +'%'", cn);
            //       cmd.Parameters.AddWithValue("@nombre_comp", prefixText);
            //       //string sql = "SELECT top(15)  * FROM tbl_INEPersonas   WHERE Nombre_Comp  like '%" +prefixText + "% '";
            //       SqlDataAdapter adapter = new SqlDataAdapter();
            //       adapter.SelectCommand = new SqlCommand(cmd, cn);
            //       adapter.Fill(ds);


            //       //cmd.Parameters.AddWithValue("@nombre_comp", prefixText);
            //       //SqlDataReader dr = default(SqlDataReader);
            //       //cmd.Connection.Open();
            //       //dr = cmd.ExecuteReader();
            //       //List<string> items = new List<string>();
            //       //while (dr.Read())
            //       //{
            //       //    items.Add(dr["Nombre_Comp"].ToString() + " | " +dr["clave_elec"].ToString() + " | ");
            //       //    //items.Add(dr["Nombre_Comp"].ToString() + " Colonia:" + dr["colonia"].ToString());

            //       //}
            //       //cmd.Connection.Close();
            //       //return items.ToArray();

            //   }
            //   if (ds.Tables[0].Rows.Count > 0)
            //   {

            //       foreach (DataRow dr in ds.Tables[0].Rows)
            //       {
            //           items.Add(dr["Nombre_Comp"].ToString() + "|" + dr["clave_elec"].ToString() + "|");
            //           //items.SetValue(dr[“TAR_Codigo”].ToString() + “\t” + dr[“TAR_Tipo”].ToString());
            //       }

            //   }
            //   else
            //   {
            //       items.Add("No existe tienda." + "|" + "Da clic en: Cliente Nuevo." + "|");
            //   }

            //   return items.ToArray();



        }


    }
    
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod()]
    public CascadingDropDownNameValue[] Get_ListNac2017(string knownCategoryValues, string category)
    {
		//string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();
		//using (SqlConnection cn = new SqlConnection(conexion))
		//{
		//    SqlCommand cmd = new SqlCommand();
		//    DataSet ds = new DataSet();
		//    cmd.CommandType = System.Data.CommandType.StoredProcedure;
		//    cmd = new SqlCommand("SELECT top(200) CVEELECT, IDLISTA, nom_comp, NOMBRE, PATERNO,  MATERNO, FECHANAC, CALLE, COLONIA, MUNICIPIO,  CP, SECCION, MZA FROM tbl_ListaNac2017   WHERE nom_comp  like @nom_comp +'%'", cn);
		//    cmd.Parameters.AddWithValue("@nom_comp", knownCategoryValues);

		//    SqlDataAdapter adp = new SqlDataAdapter(cmd);
		//    adp.Fill(ds);
		//    cmd.Connection.Open();
		//    cmd.ExecuteNonQuery();
		//    List<CascadingDropDownNameValue> items = new List<CascadingDropDownNameValue>();
		//    foreach (DataRow DR in ds.Tables[0].Rows)
		//    {
		//        string Id_Estado = DR["IDLISTA"].ToString();
		//        string Estado = DR["nom_comp"].ToString();
		//        items.Add(new CascadingDropDownNameValue(Estado, Id_Estado));
		//    }


		//    cmd.Connection.Close();
		//    return items.ToArray();


		//}

		string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();
		using (SqlConnection cn = new SqlConnection(conexion))
		{

			SqlCommand cmd = new SqlCommand();
			DataSet ds = new DataSet();
			cmd.CommandType = System.Data.CommandType.StoredProcedure;
			cmd = new SqlCommand("SELECT  * FROM tbl_INEPersonas   WHERE Nombre_Comp  like  @nom_comp +'%'", cn);
			cmd.Parameters.AddWithValue("@nom_comp", knownCategoryValues);

			SqlDataAdapter adp = new SqlDataAdapter(cmd);
			adp.Fill(ds);
			cmd.Connection.Open();
			cmd.ExecuteNonQuery();
			List<CascadingDropDownNameValue> items = new List<CascadingDropDownNameValue>();
			foreach (DataRow DR in ds.Tables[0].Rows)
			{
				string Id_Estado = DR["clave_elec"].ToString();
				string Estado = DR["Nombre_Comp"].ToString();
				items.Add(new CascadingDropDownNameValue(Estado, Id_Estado));
			}


			cmd.Connection.Close();
			return items.ToArray();


		}



	}





    [WebMethod]
    [System.Web.Script.Services.ScriptMethod()]
    public CascadingDropDownNameValue[] Get_Estados(string knownCategoryValues, string category)
    {

        string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();
        using (SqlConnection cn = new SqlConnection(conexion))
        {
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand("SELECT * from tbl_Estados", cn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            List<CascadingDropDownNameValue> items = new List<CascadingDropDownNameValue>();
            foreach(DataRow DR in ds.Tables[0].Rows)
            {
                string Id_Estado = DR["Id_Estado"].ToString();
                string Estado = DR["d_estado"].ToString();
                items.Add(new CascadingDropDownNameValue (Estado, Id_Estado));
            }


            cmd.Connection.Close();
            return items.ToArray();


        }
    }







    /// <summary>
    /// LISTA DE ESTADOS
    /// </summary>
    /// <param name="knownCategoryValues"></param>
    /// <param name="category"></param>
    /// <returns></returns>
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod()]
    public CascadingDropDownNameValue[] Get_ListEstado(string knownCategoryValues, string category)
    {
        string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();

        using (SqlConnection conn = new SqlConnection(conexion))
        {

            DataSet ds = new DataSet();
            //conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT Id_Estado, d_estado FROM tbl_Estados", conn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            conn.Open();
            cmd.ExecuteNonQuery();


            List<CascadingDropDownNameValue> CountryDetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string CountryID = DR["Id_Estado"].ToString();
                string CountryName = DR["d_estado"].ToString();
                CountryDetails.Add(new CascadingDropDownNameValue(CountryName, CountryID));
            }
            conn.Close();
            return CountryDetails.ToArray();
        }
    }



    /// <summary>
    /// LISTADO DE MUNICIPIOS
    /// </summary>
    /// <param name="knownCategoryValues"></param>
    /// <param name="category"></param>
    /// <returns></returns>
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod()]
    public CascadingDropDownNameValue[] Get_ListMunicipio(string knownCategoryValues, string category)
    {
        string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();
        SqlConnection conn = new SqlConnection(conexion);
        DataSet ds = new DataSet();
        int CountryID;

        StringDictionary CountryDetails = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        CountryID = Convert.ToInt32(CountryDetails["Estados"]);
       
        SqlCommand cmd = new SqlCommand("SELECT clave,nombre FROM tbl_municipios where id_Estado=@Estado", conn);
        cmd.Parameters.AddWithValue("@Estado", CountryID);
        conn.Open();
        cmd.ExecuteNonQuery();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);       
        adp.Fill(ds);
        List<CascadingDropDownNameValue> StateDetails = new List<CascadingDropDownNameValue>();
        foreach (DataRow DR in ds.Tables[0].Rows)
        {
            string stateID = DR["clave"].ToString();
            string statename = DR["nombre"].ToString();
            StateDetails.Add(new CascadingDropDownNameValue(statename, stateID));
        }
        conn.Close();
        return StateDetails.ToArray();
    }

    

    //[WebMethod]
    //[System.Web.Script.Services.ScriptMethod()]
    //public CascadingDropDownNameValue[] Get_TipoAsignacion(string knownCategoryValues, string category)
    //{
    //    string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();

    //    using (SqlConnection conn = new SqlConnection(conexion))
    //    {

    //        DataSet ds = new DataSet();
    //        //conn.Open();
    //        SqlCommand cmd = new SqlCommand("SELECT idTipoEmpleado, descripcion FROM TipoEmpleado where idTipoEmpleado >=4 order by idTipoEmpleado asc", conn);
    //        SqlDataAdapter adp = new SqlDataAdapter(cmd);
    //        adp.Fill(ds);
    //        conn.Open();
    //        cmd.ExecuteNonQuery();


    //        List<CascadingDropDownNameValue> TipoAsignacion = new List<CascadingDropDownNameValue>();
    //        foreach (DataRow DR in ds.Tables[0].Rows)
    //        {
    //            string id = DR["idTipoEmpleado"].ToString();
    //            string Catalogo = DR["descripcion"].ToString();
    //            TipoAsignacion.Add(new CascadingDropDownNameValue(Catalogo, id));
    //        }
    //        conn.Close();
    //        return TipoAsignacion.ToArray();
    //    }
    //}


    //[WebMethod]
    //public CascadingDropDownNameValue[] Get_ListCatatlogo(string knownCategoryValues, string category)
    //{
    //    string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();

    //    SqlConnection conn = new SqlConnection(conexion);
    //    DataSet ds = new DataSet();
    //    int id_TipoAsignacion;


    //    StringDictionary StateDetails = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
    //    id_TipoAsignacion = Convert.ToInt32(StateDetails["Municipios"]);


    //    SqlCommand cmd = new SqlCommand("select id, distrito_local from tbl_Distritos_y_x  where fk_Municipio=@municipio", conn);
    //    cmd.Parameters.AddWithValue("@municipio", id_TipoAsignacion);
    //    SqlCommand cmd = new SqlCommand("sp_cCatalogoElectoral", conn);
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.Parameters.AddWithValue("@municipio", idMunicipio);



    //    SqlDataAdapter adp = new SqlDataAdapter(cmd);
    //    adp.Fill(ds);
    //    conn.Open();
    //    cmd.ExecuteNonQuery();

    //    List<CascadingDropDownNameValue> CityDetails = new List<CascadingDropDownNameValue>();
    //    foreach (DataRow DR in ds.Tables[0].Rows)
    //    {
    //        string CityID = DR["id"].ToString();
    //        string City = DR["distrito_local"].ToString();
    //        CityDetails.Add(new CascadingDropDownNameValue(City, CityID));
    //    }
    //    conn.Close();
    //    return CityDetails.ToArray();
    //}


    //Web method for bind city  
    /// <summary>
    /// LISTADO DE DISTRITOS
    /// </summary>
    /// <param name="knownCategoryValues"></param>
    /// <param name="category"></param>
    /// <returns></returns>
    [WebMethod]
    public CascadingDropDownNameValue[] Get_ListDistrito(string knownCategoryValues, string category)
    {
        string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();

        SqlConnection conn = new SqlConnection(conexion);
        DataSet ds = new DataSet();
        int id_Municipio;
        
   
        StringDictionary StateDetails = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        id_Municipio = Convert.ToInt32(StateDetails["Municipios"]);
   

        SqlCommand cmd = new SqlCommand("select id, distrito_local from tbl_Distritos_y_x  where fk_Municipio=@municipio", conn);
        cmd.Parameters.AddWithValue("@municipio", id_Municipio);
       
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(ds);
        conn.Open();
        cmd.ExecuteNonQuery();
        
        List<CascadingDropDownNameValue> CityDetails = new List<CascadingDropDownNameValue>();
        foreach (DataRow DR in ds.Tables[0].Rows)
        {
            string CityID = DR["id"].ToString();
            string City = DR["distrito_local"].ToString();
            CityDetails.Add(new CascadingDropDownNameValue(City, CityID));
        }
        conn.Close();
        return CityDetails.ToArray();
    }


    /// <summary>
    /// lISTADO DE REGIONES
    /// </summary>
    /// <param name="knownCategoryValues"></param>
    /// <param name="category"></param>
    /// <returns></returns>
    [WebMethod]
    public CascadingDropDownNameValue[] Get_ListRegiones(string knownCategoryValues, string category)
    {
        string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();

        SqlConnection conn = new SqlConnection(conexion);
        DataSet ds = new DataSet();

        int distrito;
        StringDictionary Cat_Estado = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        distrito = Convert.ToInt32(Cat_Estado["Distritos"]);


        SqlCommand cmd = new SqlCommand("SELECT id, region  FROM tbl_Regiones_y_x where id_Distrito=@id_Distrito order by region asc", conn);
        cmd.Parameters.AddWithValue("@id_Distrito", distrito); 

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(ds);
        conn.Open();
        cmd.ExecuteNonQuery();

        List<CascadingDropDownNameValue> CityDetails = new List<CascadingDropDownNameValue>();
        foreach (DataRow DR in ds.Tables[0].Rows)
        {
            string CityID = DR["id"].ToString();
            string City = DR["region"].ToString();
            CityDetails.Add(new CascadingDropDownNameValue(City, CityID));
        }
        conn.Close();
        return CityDetails.ToArray();
    }



    
    [WebMethod]
    public CascadingDropDownNameValue[] Get_ListSecciones(string knownCategoryValues, string category)
    {
        string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();

        SqlConnection conn = new SqlConnection(conexion);
        DataSet ds = new DataSet();
        int Region;
        
        StringDictionary statedetails = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        Region = Convert.ToInt32(statedetails["Regiones"]);


        SqlCommand cmd = new SqlCommand("select id, seccion from Seccion_y_x  where fk_Region=@fk_Region order by seccion asc", conn);
        cmd.Parameters.AddWithValue("@fk_Region", Region); 

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(ds);
        conn.Open();
        cmd.ExecuteNonQuery();

        List<CascadingDropDownNameValue> CityDetails = new List<CascadingDropDownNameValue>();
        foreach (DataRow DR in ds.Tables[0].Rows)
        {
            string CityID = DR["id"].ToString();
            string City = DR["seccion"].ToString();
            CityDetails.Add(new CascadingDropDownNameValue(City, CityID));
        }
        conn.Close();
        return CityDetails.ToArray();
    }


    [WebMethod]
    public CascadingDropDownNameValue[] Get_ListColonias(string knownCategoryValues, string category)
    {
        string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();

        SqlConnection conn = new SqlConnection(conexion);
        DataSet ds = new DataSet();
        int Region;

        StringDictionary statedetails = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        Region = Convert.ToInt32(statedetails["Regiones"]);


        SqlCommand cmd = new SqlCommand("SELECT id_Colonia, colonia, fk_Municipios, fk_Estado FROM solaris.dbo.tbl_Colonias where fk_Municipios=@fk_Municipios order by id_Colonia asc", conn);
        cmd.Parameters.AddWithValue("@fk_Municipios", Region);

        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(ds);
        conn.Open();
        cmd.ExecuteNonQuery();

        List<CascadingDropDownNameValue> CityDetails = new List<CascadingDropDownNameValue>();
        foreach (DataRow DR in ds.Tables[0].Rows)
        {
            string CityID = DR["id_Colonia"].ToString();
            string City = DR["colonia"].ToString();
            CityDetails.Add(new CascadingDropDownNameValue(City, CityID));
        }
        conn.Close();
        return CityDetails.ToArray();
    }


    
    /// <summary>
    /// LISTADO DE MANZANAS
    /// </summary>
    /// <returns></returns>
    /// 
    [WebMethod]
    public CascadingDropDownNameValue[] Get_ListManzanas(string knownCategoryValues, string category)
    {
        string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();
        SqlConnection conn = new SqlConnection(conexion);
        DataSet ds = new DataSet();
        int seccion;
        StringDictionary statedetails = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        seccion = Convert.ToInt32(statedetails["Secciones"]);
        SqlCommand cmd = new SqlCommand("select id, manzana from tbl_Manzanas_y_x  where fk_Seccion=@seccion", conn);
        cmd.Parameters.AddWithValue("@seccion", seccion); 
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(ds);
        conn.Open();
        cmd.ExecuteNonQuery();
        List<CascadingDropDownNameValue> CityDetails = new List<CascadingDropDownNameValue>();
        foreach (DataRow DR in ds.Tables[0].Rows)
        {
            string CityID = DR["id"].ToString();
            string City = DR["manzana"].ToString();
            CityDetails.Add(new CascadingDropDownNameValue(City, CityID));
        }
        conn.Close();
        return CityDetails.ToArray();
    }






    [WebMethod]
    public DataTable ListarPersonas()
    {
        Connections cnn = new Connections();
        SqlCommand cmd = new SqlCommand();
        //int CountryID;

        //StringDictionary items = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem();
        //CountryID = Convert.ToInt32(items["Estados"]);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.CommandText = "spListarPersonas";
        cmd.Connection = cnn.cnn();
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);

        cmd.Connection.Close();
        cnn.close();
        return dt;
    }

    public DataTable getCatalogos(int id, int Catalogo)
    {
        Connections cnn = new Connections();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.CommandText = "sp_cCatalogoElectoral";
        cmd.Parameters.AddWithValue("@prmOption", id);
        cmd.Parameters.AddWithValue("@municipio", Catalogo);
        cmd.Connection = cnn.cnn();
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);

        cmd.Connection.Close();
        cnn.close();
        return dt;
    }


}
