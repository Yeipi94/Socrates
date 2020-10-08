using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GestoriaCap : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

	[System.Web.Services.WebMethod]
	[System.Web.Script.Services.ScriptMethod]
	public static List<string> SearchCustomers(string prefixText, int count, string contextKey)
	{
		using (SqlConnection conn = new SqlConnection())
		{
			conn.ConnectionString = ConfigurationManager
					.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
			using (SqlCommand cmd = new SqlCommand())
			{
				string cmdText = "SELECT  NOM_COMP FROM tbl_NuevoL2017 where " +
				"NOM_COMP like @SearchText + '%'";
				cmd.Parameters.AddWithValue("@SearchText", prefixText);
				if (contextKey != "0")
				{
					cmdText += " and E = @Country";
					cmd.Parameters.AddWithValue("@Country", contextKey);
				}
				cmd.CommandText = cmdText;
				cmd.Connection = conn;
				conn.Open();
				List<string> customers = new List<string>();
				using (SqlDataReader sdr = cmd.ExecuteReader())
				{
					while (sdr.Read())
					{
						customers.Add(sdr["NOM_COMP"].ToString());
					}
				}
				conn.Close();
				return customers;
			}
		}
	}

}