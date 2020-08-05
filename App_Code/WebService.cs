using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

/// <summary>
/// Descripción breve de WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
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
    //        cmd.Parameters.Add(new SqlParameter()
    //        {
    //            ParameterName = "@Nombre_comp",
    //            Value = nombre_comp
    //        });
    //        con.Open();
    //        SqlDataReader rdr = cmd.ExecuteReader();
    //        while (rdr.Read())
    //        {
    //            nom_autocompletar.Add(rdr["nombre_comp"].ToString());
    //        }
    //    }

    //    return nom_autocompletar;
    //}



   

}
