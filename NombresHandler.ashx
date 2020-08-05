<%@ WebHandler Language="C#" Class="NombresHandler" %>

using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Script.Serialization;

public class NombresHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
       string nombre_comp = context.Request["term"] ?? "";
            List<string> listSNombres = new List<string>();

            string cs = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
            using(SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_GetNombres", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@Nombre_comp",
                    Value = nombre_comp
                });
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while(rdr.Read())
                {
                    listSNombres.Add(rdr["Nombre_Comp"].ToString());
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            context.Response.Write(js.Serialize(listSNombres));
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}