using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

/// <summary>
/// Descripción breve de Catalogos
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
// [System.Web.Script.Services.ScriptService]
public class Catalogos : System.Web.Services.WebService
{

    public Catalogos()
    {

        //Elimine la marca de comentario de la línea siguiente si utiliza los componentes diseñados 
        //InitializeComponent(); 
    }

    [WebMethod]
    public void GetStudents()
    {
        var cs = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
        var students = new List<catalogo>();
        using (var con = new SqlConnection(cs))
        {
            var cmd = new SqlCommand("sp_ListAsignaciones", con) { CommandType = CommandType.StoredProcedure };
            con.Open();
            var dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                var student = new catalogo
                {
                    //Id_Estado = Convert.ToInt32(dr[0].ToString()),
                    //d_estado = dr[1].ToString(),

                    clave_elector = dr[0].ToString(),
                    nombre = dr[1].ToString(),
                    fecha_nac = dr[2].ToString(),
                    calle = dr[3].ToString(),
                    num_ext = dr[4].ToString(),
                    //fecha_nac = dr[4].ToString(),
                    //afiliacion = dr[5].ToString(),
                    //calle = dr[6].ToString(),
                    //num_ext = dr[7].ToString(),
                    //num_int = Convert.ToInt32(dr[8].ToString()),
                    //colonia = dr[9].ToString(),
                    //municipio = dr[10].ToString(),
                    //seccion = Convert.ToInt32(dr[11].ToString()),
                    //clave_elector = dr[12].ToString(),
                    //telefono = dr[13].ToString(),
                    //codigoP = dr[14].ToString(),
                    //manzana = dr[15].ToString(),
                    //idPersonas = Convert.ToInt32(dr[17].ToString()),
                    //idEstado = Convert.ToInt32(dr[18].ToString()),
                    //idMunicipio = Convert.ToInt32(dr[5].ToString()),
                    //estado = Convert.ToInt32(dr[20].ToString()),


                };
                students.Add(student);
            }
        }
        var js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(students));
    }



    [WebMethod]
    public void ListarPersonas(string id_Estado, string id_Municipio, string id_Colonia)
    {
        var cs = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
        //var students = new List<catalogo>();
        List<Personas> Lista = new List<Personas>();
        using (var con = new SqlConnection(cs))
        {
            var cmd = new SqlCommand("spListarPersonas", con) { CommandType = CommandType.StoredProcedure };
            con.Open();
            var dr = cmd.ExecuteReader();
            while (dr.Read())
            {
				Personas objPersonas = new Personas
				{
					//objPersonas.id = Convert.ToInt32(dr["id"].ToString());
					//objPersonas.Entidad = dr["Entidad"].ToString();
					//objPersonas.Nombre = dr["Nombre"].ToString();
					//objPersonas.F_Afil = dr["F_Afil"].ToString();

					clave = dr[0].ToString(),
					Nombre_Comp = dr[1].ToString(),
					colonia = dr[2].ToString(),
					municipio = dr[3].ToString(),
					entidad = dr[4].ToString()
				};
				// añadir a la lista de objetos
				Lista.Add(objPersonas);


                //var student = new catalogo
                //{
                //	//Id_Estado = Convert.ToInt32(dr[0].ToString()),
                //	//d_estado = dr[1].ToString(),

                //	id_Distrital = Convert.ToInt32(dr[0].ToString()),
                //	nombre = dr[1].ToString(),
                //	apellido_paterno = dr[2].ToString(),
                //	apellido_materno = dr[3].ToString(),
                //	};
                //students.Add(student);
            }
        }
        var js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(Lista));
    }

    [WebMethod]

    public void BuscarPersonas(String nroDocumento)
    {
        //SqlConnection con = null;
        //SqlCommand cmd = null;
        //SqlDataReader dr = null;
        //Personas objPersonas = new Personas();



        var cs = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
        //var students = new List<catalogo>();
        List<Personas> Lista = new List<Personas>();
        using (var con = new SqlConnection(cs))
        {
            var cmd = new SqlCommand("sp_GetNombres", con) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.AddWithValue("@nombre_comp", nroDocumento);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            var dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Personas objPersonas = new Personas();
                //objPersonas.id = Convert.ToInt32(dr["id"].ToString());
                //objPersonas.Entidad = dr["Entidad"].ToString();
                //objPersonas.Nombre = dr["Nombre"].ToString();
                //objPersonas.F_Afil = dr["F_Afil"].ToString();

                objPersonas.clave = dr[0].ToString();
                objPersonas.Nombre_Comp = dr[1].ToString();
                objPersonas.colonia = dr[2].ToString();
                objPersonas.municipio = dr[3].ToString();
                objPersonas.entidad = dr[4].ToString();
                // añadir a la lista de objetos
                Lista.Add(objPersonas);


                //var student = new catalogo
                //{
                //	//Id_Estado = Convert.ToInt32(dr[0].ToString()),
                //	//d_estado = dr[1].ToString(),

                //	id_Distrital = Convert.ToInt32(dr[0].ToString()),
                //	nombre = dr[1].ToString(),
                //	apellido_paterno = dr[2].ToString(),
                //	apellido_materno = dr[3].ToString(),
                //	};
                //students.Add(student);
            }
        }
        var js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(Lista));
    }


}
