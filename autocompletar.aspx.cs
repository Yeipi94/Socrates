using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class autocompletar : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        this.tbDrugName.Attributes.Add("OnChange", "tbDrugName_OnChange()");

    }


    [WebMethod]
    public static List<string> GetAutoCompleteData(string username)
    {
        List<string> result = new List<string>();
        string cs = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {

            using (SqlCommand cmd = new SqlCommand("select Nom_Comp from View_Telcel where Apellidos LIKE '%'+@SearchText+'%'", con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@SearchText", username);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    //result.Add(string.Format("{0}/{1}", dr["Apellidos"], dr["id"]));
                    result.Add(dr["Nom_Comp"].ToString());
                }
                return result;
            }
        }
    }


    
    //public static List<string> GetCompletionList(string prefixText, int count)
    //{
    //    //return AutoFillProducts(prefixText);

    //}
    [WebMethod]
    //private static List<string> AutoFillProducts(string prefixText)
    //{
    //    using (SqlConnection con = new SqlConnection())
    //    {
    //        con.ConnectionString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
    //        using (SqlCommand com = new SqlCommand())
    //        {
    //            com.CommandText = "select top(15)  * FROM tbl_INEPersonas where Nombre_Comp like @Search + '%'";
    //            com.Parameters.AddWithValue("@Search", prefixText);
    //            com.Connection = con;
    //            SqlDataReader dr = default(SqlDataReader);
    //            com.Connection.Open();
    //            dr = com.ExecuteReader();
    //            List<string> items = new List<string>();
    //            while (dr.Read())
    //            {
    //                countryNames.Add(sdr["Nom_Comp"].ToString());
    //                items.Add(dr["Nombre_Comp"].ToString());
    //            }
    //            cmd.Connection.Close();
    //            return items.ToArray();



    //            //using (SqlDataReader sdr = com.ExecuteReader())
    //            //{
    //            //    while (sdr.Read())
    //            //    {
    //            //        countryNames.Add(sdr["Nom_Comp"].ToString());
    //            //    }
    //            //}
    //            //con.Close();
    //            //return countryNames;
    //        }
    //    }


     

    //}
    private void GetProductMasterDet(string ProductName)
    {
        string cs = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand com = new SqlCommand("sp_GetNombres", con);

                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@nombre_comp", ProductName);
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DataTable dt = ds.Tables[0];
                con.Close();
                //Binding TextBox From dataTable  
                TextBox2.Text = dt.Rows[0]["Nombre_Comp"].ToString();
            txtclave.Text = dt.Rows[0]["clave_elec"].ToString();

                
               
        }
        
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        //calling method and Passing Values  
        GetProductMasterDet(txtIntegrante.Text);
    }

    [WebMethod]
    public static string AutocompleteMethod()
    {
        String Ciudades = "Bogota:Medellin:Cali:Pereira:Manizales:Barranquilla:Cartagena:Santa";

        // aqui se puede devolver una lista de una Base de Datos por ejemplo
        // Se tambien puede devolver un ObjetoJson con la informacion

        return Ciudades;
    }

    //public static List<string> AutocompleteMethod()
    //{
    //    String Ciudades = "Bogota:Medellin:Cali:Pereira:Manizales:Barranquilla:Cartagena:Santa";

    //    // aqui se puede devolver una lista de una Base de Datos por ejemplo
    //    // Se tambien puede devolver un ObjetoJson con la informacion

    //    return Ciudades;

    //public static string AutocompleteMethod(string nombre_comp)
    //{
    //    //string nombre_comp = context.Request["Apellidos"] ?? "";
    //    List<string> Ciudades = new List<string>();
    //        string cs = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
    //    //using (SqlConnection con = new SqlConnection(cs))
    //    //{
    //    //    SqlCommand cmd = new SqlCommand("sp_GetNombres", con);
    //    //    cmd.CommandType = CommandType.StoredProcedure;
    //    //    SqlParameter parameter = new SqlParameter()
    //    //    {
    //    //        ParameterName = "@nombre_comp",
    //    //        Value = nombre_comp
    //    //    };
    //    //    //cmd.Parameters.Add(new SqlParameter()
    //    //    //{
    //    //    //    ParameterName = "@nombre_comp",
    //    //    //    Value = nombre_comp
    //    //    //});

    //    //    cmd.Parameters.Add(parameter);

    //    //    con.Open();
    //    //    SqlDataReader rdr = cmd.ExecuteReader();
    //    //    while (rdr.Read())
    //    //    {
    //    //        Ciudades.Add(rdr["Apellidos"].ToString());
    //    //    }
    //    //}

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
    //            Ciudades.Add(rdr["Apellidos"].ToString());

    //        }
    //        con.Close();

    //    }
    //    //return Ciudades;

    //    //  JavaScriptSerializer js = new JavaScriptSerializer();
    //    //context.Response.Write(js.Serialize(Ciudades));
    //    //This is your missing statement

    //}
    //}


    private static List<string> getCustomerNames(string prefixText)
    {
        List<string> curtomers = new List<string>();
        using (SqlConnection con = new SqlConnection())
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
            using (SqlCommand com = new SqlCommand())
            {
                com.CommandText = "select Apellidos from View_Telcel where " + "Apellidos like @Search + '%'";
                com.Parameters.AddWithValue("@Search", prefixText);
                com.Connection = con;
                con.Open();
                using (SqlDataReader sdr = com.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        curtomers.Add(sdr["Apellidos"].ToString());
                    }
                }
                con.Close();

            }
        }
        return curtomers;
    }


    //public string[] docentes(string prefixText, int count)
    //{
    //    string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();
    //    using (SqlConnection cn = new SqlConnection(conexion))
    //    {
    //        SqlCommand cmd = new SqlCommand("SELECT top(15)  * FROM tbl_INEPersonas   WHERE Nombre_Comp  like @nombre_comp +'%'", cn);
    //        cmd.Parameters.AddWithValue("nombre_comp", prefixText);
    //        SqlDataReader dr = default(SqlDataReader);
    //        cmd.Connection.Open();
    //        dr = cmd.ExecuteReader();
    //        List<string> items = new List<string>();
    //        while (dr.Read())
    //        {
    //            items.Add(dr["Nombre_Comp"].ToString());
    //        }
    //        cmd.Connection.Close();
    //        return items.ToArray();

    //    }
    //}







    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strContextKey = "";
        if (ddlType.SelectedValue.ToString() == "0")
            {
                strContextKey = "Country";
            }
            else
            {
                strContextKey = "Companies";
            }
                

            

            AutoCompleteExtender1.ContextKey = ddlType.SelectedItem.Text;
        
        
    }
}