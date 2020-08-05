using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cascada : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    [WebMethod]
    public static string[] GetCountries(string prefix, int parentId)
    {
        SqlCommand cmd = new SqlCommand();
        string query = "SELECT top(15) Nombre_Comp, clave_elec FROM tbl_INEPersonas " +
                " WHERE Nombre_Comp  " +
                "like @Prefix + '%'";
        cmd.Parameters.AddWithValue("@Prefix", prefix);
        cmd.CommandText = query;
        return PopulateAutoComplete(cmd);
    }


    private static string[] PopulateAutoComplete(SqlCommand cmd)
    {
        List<string> autocompleteItems = new List<string>();
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
            cmd.Connection = conn;
            conn.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                while (sdr.Read())
                {
                    autocompleteItems.Add(string.Format("{0}-{1}", sdr[1], sdr[0]));
                }
            }
            conn.Close();
        }
        return autocompleteItems.ToArray();
    }

}