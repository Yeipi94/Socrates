using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Metas_graficas : System.Web.UI.Page
{
    string strConnString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        DX_Grafca();
    }

    protected void DX_Grafca()
    {
        SqlConnection con = new SqlConnection(strConnString);
        string result4 = SqlDataSource1.SelectCommand = "SELECT * from Meta_Territorio";
        SqlDataSource1.DataBind();

        con.Close();
    }
}

    