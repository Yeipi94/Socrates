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

public partial class Territorial : System.Web.UI.Page
{
    WebServiceDatos Tools = new WebServiceDatos();
    string strConnString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
   
        
        //cord1.Text = Convert.ToDecimal(25.6438666).ToString();
        //cord2.Text = Convert.ToDecimal(-100.2769715).ToString();
        Notificacion.Visible = false;
        if (!Page.IsPostBack)
        {
           
         
        }
       



    }

	[System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]

    public static List<string> Autocompletar(string prefixText, int count, string contextKey)
    {

		using (SqlConnection conn = new SqlConnection())
		{
			conn.ConnectionString = ConfigurationManager
					.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
			using (SqlCommand cmd = new SqlCommand())
			{
				cmd.CommandType = System.Data.CommandType.StoredProcedure;
				cmd.CommandText = "sp_BusquedaNacional";
				cmd.Parameters.AddWithValue("@NOMBRE_COMP", prefixText);
				cmd.Parameters.AddWithValue("@Estado", contextKey);

				cmd.Connection = conn;
				conn.Open();

				List<string> _Datos = new List<string>();

				using (SqlDataReader sdr = cmd.ExecuteReader())
				{
					while (sdr.Read())
					{
                        _Datos.Add(AjaxControlToolkit.AutoCompleteExtender
                        //.CreateAutoCompleteItem(string.Format("{0}-{1}-{2}-{3}-{4}-{5}-{6}-{7}-{8}-{9}-{10}-{11}-{12}-{13}-{14}-{15}-{16}-{17}-{18}-{19}",
                        .CreateAutoCompleteItem(string.Format("{0}-{1}-{2}-{3}-{4}",
                        sdr["Nombre_Comp"].ToString(), sdr["CVE"], sdr["FechaN"], sdr["calle"], sdr["num_exterior"]

						),

                        sdr["CVE"].ToString()));

                    }


                }
                conn.Close();
                return _Datos;



            }
        }
    }



    protected void ddlCatalogo_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

   
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        if ( ddlDistrito.SelectedValue!= null & ddlRegiones.SelectedValue == "")
        {
            string strSql;
            SqlConnection con = new SqlConnection(strConnString);
            strSql = "sp_Insert_Distritales";
            SqlCommand cmd = new SqlCommand(strSql, con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.Parameters.AddWithValue("@nombre", txtNombre.Text);
            cmd.Parameters.AddWithValue("@apellido_paterno", txtApellidoPa.Text);
            cmd.Parameters.AddWithValue("@apellido_materno", txtApellidoMa.Text);
            cmd.Parameters.AddWithValue("@fecha_nac", txtFechaN.Text);
            cmd.Parameters.AddWithValue("@afiliacion", txtAfiliacion.Text);
            cmd.Parameters.AddWithValue("@calle", txtCalle.Text);
            cmd.Parameters.AddWithValue("@num_ext", txtNumE.Text);
            cmd.Parameters.AddWithValue("@num_int", txtNumeroI.Text);
            cmd.Parameters.AddWithValue("@colonia", txtColonia.Text);
            cmd.Parameters.AddWithValue("@municipio", txtMunicipio.Text);
            cmd.Parameters.AddWithValue("@seccion", Convert.ToInt32(txtseccion.Text));
            cmd.Parameters.AddWithValue("@clave_elector", txtClaveE.Text.Trim());
            cmd.Parameters.AddWithValue("@telefono", txtTelefono.Text);
            cmd.Parameters.AddWithValue("@codigoP", txtCodigo.Text);
            cmd.Parameters.AddWithValue("@manzana", "");
            cmd.Parameters.AddWithValue("@fk_idPersonas", 1);
            cmd.Parameters.AddWithValue("@fk_idEstado", ddlEstad.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@fk_idMunicipio", ddlMunicipio.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@fk_idDistrito", ddlDistrito.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@estado", "");

            cmd.Parameters.AddWithValue("@y", cord1.Text);


            cmd.Parameters.AddWithValue("@x", cord2.Text);


            int rowsAffected = cmd.ExecuteNonQuery();
            if (rowsAffected > 0)/*si rowsAffected (1) es mayor a 0*/
            {
                Notificacion.Visible = true;
                txtAutocomplete.Text = "";
                txtClaveE.Text = "";
                txtNombre.Text = "";
                txtApellidoPa.Text = "";
                txtApellidoMa.Text = "";
                txtFechaN.Text = "";
                txtAfiliacion.Text = "";
                txtCalle.Text = "";
                txtNumE.Text = "";
                txtNumeroI.Text = "";
                txtColonia.Text = "";
                txtMunicipio.Text = "";
                txtseccion.Text = "";
                txtTelefono.Text = "";
                txtCodigo.Text = "";
            }
            else
            {
                throw new Exception("Llenar todos los campos");

            }
        }
        else if ( ddlRegiones.SelectedValue!= null & ddlSecciones.SelectedValue == "")
        {
            string strSql;
            SqlConnection con = new SqlConnection(strConnString);
            strSql = "sp_Insert_Regional";
            SqlCommand cmd = new SqlCommand(strSql, con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.Parameters.AddWithValue("@nombre", txtNombre.Text);
            cmd.Parameters.AddWithValue("@apellido_paterno", txtApellidoPa.Text);
            cmd.Parameters.AddWithValue("@apellido_materno", txtApellidoMa.Text);
            cmd.Parameters.AddWithValue("@fecha_nac", txtFechaN.Text);
            cmd.Parameters.AddWithValue("@afiliacion", txtAfiliacion.Text);
            cmd.Parameters.AddWithValue("@calle", txtCalle.Text);
            cmd.Parameters.AddWithValue("@num_ext", txtNumE.Text);
            cmd.Parameters.AddWithValue("@num_int", txtNumeroI.Text);
            cmd.Parameters.AddWithValue("@colonia", txtColonia.Text);
            cmd.Parameters.AddWithValue("@municipio", txtMunicipio.Text);
            cmd.Parameters.AddWithValue("@seccion", Convert.ToInt32(txtseccion.Text));
            cmd.Parameters.AddWithValue("@clave_elector", txtClaveE.Text.Trim());
            cmd.Parameters.AddWithValue("@telefono", txtTelefono.Text);
            cmd.Parameters.AddWithValue("@codigoP", txtCodigo.Text);
            cmd.Parameters.AddWithValue("@manzana", "");
            cmd.Parameters.AddWithValue("@fk_idPersonas", 1);
            cmd.Parameters.AddWithValue("@fk_idEstado", ddlEstad.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@fk_idMunicipio", ddlMunicipio.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@fk_idDistrito", ddlDistrito.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@fk_Regional", ddlRegiones.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@estado", "");
            cmd.Parameters.AddWithValue("@y", cord1.Text);
            cmd.Parameters.AddWithValue("@x", cord2.Text);
            int rowsAffected = cmd.ExecuteNonQuery();
            if (rowsAffected > 0)/*si rowsAffected (1) es mayor a 0*/
            {
                Notificacion.Visible = true;
                txtAutocomplete.Text = "";
                txtClaveE.Text = "";
                txtNombre.Text = "";
                txtApellidoPa.Text = "";
                txtApellidoMa.Text = "";
                txtFechaN.Text = "";
                txtAfiliacion.Text = "";
                txtCalle.Text = "";
                txtNumE.Text = "";
                txtNumeroI.Text = "";
                txtColonia.Text = "";
                txtMunicipio.Text = "";
                txtseccion.Text = "";
                txtTelefono.Text = "";
                txtCodigo.Text = "";
            }
            else
            {
                throw new Exception("Llenar todos los campos");

            }
        }
        else if ( ddlSecciones.SelectedValue!= null & ddlManzanas.SelectedValue == "")
        {
            string strSql;
            SqlConnection con = new SqlConnection(strConnString);
            strSql = "sp_Insert_Secciones";
            SqlCommand cmd = new SqlCommand(strSql, con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.Parameters.AddWithValue("@nombre", txtNombre.Text);
            cmd.Parameters.AddWithValue("@apellido_paterno", txtApellidoPa.Text);
            cmd.Parameters.AddWithValue("@apellido_materno", txtApellidoMa.Text);
            cmd.Parameters.AddWithValue("@fecha_nac", txtFechaN.Text);
            cmd.Parameters.AddWithValue("@afiliacion", txtAfiliacion.Text);
            cmd.Parameters.AddWithValue("@calle", txtCalle.Text);
            cmd.Parameters.AddWithValue("@num_ext", txtNumE.Text);
            cmd.Parameters.AddWithValue("@num_int", txtNumeroI.Text);
            cmd.Parameters.AddWithValue("@colonia", txtColonia.Text);
            cmd.Parameters.AddWithValue("@municipio", txtMunicipio.Text);
            cmd.Parameters.AddWithValue("@seccion", Convert.ToInt32(txtseccion.Text));
            cmd.Parameters.AddWithValue("@clave_elector", txtClaveE.Text.Trim());
            cmd.Parameters.AddWithValue("@telefono", txtTelefono.Text);
            cmd.Parameters.AddWithValue("@codigoP", txtCodigo.Text);
            cmd.Parameters.AddWithValue("@manzana", "");
            cmd.Parameters.AddWithValue("@fk_idPersonas", 1);
            cmd.Parameters.AddWithValue("@fk_idEstado", ddlEstad.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@fk_idMunicipio", ddlMunicipio.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@fk_idDistrito", ddlDistrito.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@fk_Regional", ddlRegiones.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@fk_Seccion", ddlSecciones.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@estado", "");
            cmd.Parameters.AddWithValue("@y", cord1.Text);
            cmd.Parameters.AddWithValue("@x", cord2.Text);
            int rowsAffected = cmd.ExecuteNonQuery();
            if (rowsAffected > 0)/*si rowsAffected (1) es mayor a 0*/
            {
                Notificacion.Visible = true;
                txtAutocomplete.Text = "";
                txtClaveE.Text = "";
                txtNombre.Text = "";
                txtApellidoPa.Text = "";
                txtApellidoMa.Text = "";
                txtFechaN.Text = "";
                txtAfiliacion.Text = "";
                txtCalle.Text = "";
                txtNumE.Text = "";
                txtNumeroI.Text = "";
                txtColonia.Text = "";
                txtMunicipio.Text = "";
                txtseccion.Text = "";
                txtTelefono.Text = "";
                txtCodigo.Text = "";
            }
            else
            {
                throw new Exception("Llenar todos los campos");

            }
        }
        else if (ddlSecciones.SelectedValue != null & ddlManzanas.SelectedValue != null)
        {
            string strSql;
            SqlConnection con = new SqlConnection(strConnString);
            strSql = "sp_Manzanal_Secciones";
            SqlCommand cmd = new SqlCommand(strSql, con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.Parameters.AddWithValue("@nombre", txtNombre.Text);
            cmd.Parameters.AddWithValue("@apellido_paterno", txtApellidoPa.Text);
            cmd.Parameters.AddWithValue("@apellido_materno", txtApellidoMa.Text);
            cmd.Parameters.AddWithValue("@fecha_nac", txtFechaN.Text);
            cmd.Parameters.AddWithValue("@afiliacion", txtAfiliacion.Text);
            cmd.Parameters.AddWithValue("@calle", txtCalle.Text);
            cmd.Parameters.AddWithValue("@num_ext", txtNumE.Text);
            cmd.Parameters.AddWithValue("@num_int", txtNumeroI.Text);
            cmd.Parameters.AddWithValue("@colonia", txtColonia.Text);
            cmd.Parameters.AddWithValue("@municipio", txtMunicipio.Text);
            cmd.Parameters.AddWithValue("@seccion", Convert.ToInt32(txtseccion.Text));
            cmd.Parameters.AddWithValue("@clave_elector", txtClaveE.Text.Trim());
            cmd.Parameters.AddWithValue("@telefono", txtTelefono.Text);
            cmd.Parameters.AddWithValue("@codigoP", txtCodigo.Text);
            cmd.Parameters.AddWithValue("@manzana", "");
            cmd.Parameters.AddWithValue("@fk_idPersonas", 1);
            cmd.Parameters.AddWithValue("@fk_idEstado", ddlEstad.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@fk_idMunicipio", ddlMunicipio.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@fk_idDistrito", ddlDistrito.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@fk_Regional", ddlRegiones.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@fk_Seccion", ddlSecciones.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@fk_Manzana", ddlManzanas.SelectedValue.Trim());
            cmd.Parameters.AddWithValue("@estado", "");
            cmd.Parameters.AddWithValue("@y", cord1.Text);
            cmd.Parameters.AddWithValue("@x", cord2.Text);
            int rowsAffected = cmd.ExecuteNonQuery();
            if (rowsAffected > 0)/*si rowsAffected (1) es mayor a 0*/
            {
                Notificacion.Visible = true;
                txtAutocomplete.Text = "";
                txtClaveE.Text = "";
                txtNombre.Text = "";
                txtApellidoPa.Text = "";
                txtApellidoMa.Text = "";
                txtFechaN.Text = "";
                txtAfiliacion.Text = "";
                txtCalle.Text = "";
                txtNumE.Text = "";
                txtNumeroI.Text = "";
                txtColonia.Text = "";
                txtMunicipio.Text = "";
                txtseccion.Text = "";
                txtTelefono.Text = "";
                txtCodigo.Text = "";
            }
            else
            {
                throw new Exception("Llenar todos los campos");

            }
        }

    }

   
    
    protected void txtClaveE_TextChanged(object sender, EventArgs e)
    {

    }

    protected void txtCodigo_TextChanged(object sender, EventArgs e)
    {
        
    }

   

  
    protected void ddlMunicipio_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void ddlColonia_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void txtseccion_TextChanged(object sender, EventArgs e)
    {



        try
        {
            string seccion = txtseccion.Text;

            if (seccion != "")
            {
                GetSeccion(Convert.ToInt32(txtseccion.Text));
            }
        }
        catch
        {

        }

    }

    private void GetSeccion(int ProductName)
    {
        string cs = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
        

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        try
        {
            AutocompletarService dbws = new AutocompletarService();

        DataTable dt = dbws.get_List_Ine(Convert.ToInt32(ddlEstados_Cat.Text), Convert.ToString(txtClaveE.Text));
         //txtClaveE.Text = dt.Rows[0]["CVE"].ToString();
        txtNombre.Text = dt.Rows[0]["Nombre"].ToString();
        txtApellidoPa.Text = dt.Rows[0]["Apellido_Pa"].ToString();
        txtApellidoMa.Text = dt.Rows[0]["apellido_Ma"].ToString();
        txtCalle.Text = dt.Rows[0]["calle"].ToString();
        txtColonia.Text = dt.Rows[0]["colonia"].ToString();
        txtNumE.Text = dt.Rows[0]["num_exterior"].ToString();
        txtNumeroI.Text = dt.Rows[0]["INT"].ToString();
        txtCodigo.Text = Convert.ToInt32(dt.Rows[0]["CP"]).ToString().Trim();
        txtseccion.Text = dt.Rows[0]["seccion"].ToString().Trim();
        txtMunicipio.Text = dt.Rows[0]["municipio"].ToString();
        txtFechaN.Text = Convert.ToDateTime(dt.Rows[0]["FechaN"]).ToString("yyyy-MM-dd").TrimEnd();
            string nombreCom = dt.Rows[0]["Nombre_comp"].ToString();
            if (nombreCom != "")
            {
                string nombre = Convert.ToString(dt.Rows[0]["Nombre_comp"]);
                using (SqlConnection con = new SqlConnection(strConnString))
                {
                    SqlCommand com = new SqlCommand("Select nombre_comp, partido_afil from tbl_PartidoNacional where nombre_comp='" + nombre + "'", con);
                    com.CommandType = CommandType.Text;
                    con.Open();
                    SqlDataReader registro2 = com.ExecuteReader();
                    if (registro2.Read())
                    {
                        txtClaveE.Enabled =true;
                        txtNombre.Enabled =true;
                        txtApellidoPa.Enabled = true;
                        txtApellidoMa.Enabled = true;
                        txtFechaN.Enabled = true;
                        txtTelefono.Enabled = true;
                        txtAfiliacion.Enabled = true;
                        txtCalle.Enabled = true;
                        txtNumE.Enabled = true;
                        txtNumeroI.Enabled = true;
                        txtCodigo.Enabled = true;
                        txtMunicipio.Enabled = true;
                        txtColonia.Enabled = true;
                        txtseccion.Enabled = true;

                        txtAfiliacion.Text = registro2["partido_afil"].ToString().TrimEnd();
                    }
                    else
                    {
                        txtAfiliacion.Text = "";
                    }

                }
            }
            else
            {

            }
        }
        catch
        {

        }

		try
		{
			string seccion = dt.Rows[0]["seccion"].ToString();
			if (seccion != "")
			{
				string seccion2 = Convert.ToString(dt.Rows[0]["seccion"]);
				com = new SqlCommand("Select Top_25_2009_gral, Top_25_2009_porc, Top25DifGral2009, 3Cond_2009_25_porc, Top_25_2015_PRI, Top_25_2015_porc_PRI, Top25DifGral2015, 3Cond_2015_25_porc from tbl_Secciones2009_2015NL where seccion='" + seccion2 + "'", con);
				com.CommandType = CommandType.Text;
				//comando2.Parameters.AddWithValue("@IdPersona", txtIntegrante.Text);
				con.Open();
				SqlDataReader rd = com.ExecuteReader();
				if (rd.Read())
				{



					txtgral2009.Text = rd["Top_25_2009_gral"].ToString();
					txtporciento2009.Text = rd["Top_25_2009_porc"].ToString();
					txtdif2009.Text = rd["Top25DifGral2009"].ToString();
					txtcond2009.Text = rd["3Cond_2009_25_porc"].ToString();
					txtgral2015.Text = rd["Top_25_2015_PRI"].ToString();
					txtporciento2015.Text = rd["Top_25_2015_porc_PRI"].ToString();
					txtdif2015.Text = rd["Top25DifGral2015"].ToString();
					txtcond2015.Text = rd["3Cond_2015_25_porc"].ToString();




				}
				else
				{
					txtAfiliacion.Text = "";
				}

			}
			else
			{

			}
		}
		catch
		{

		}
		con.Close();

		ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#Asignaciones').modal('show')", true);

    }


   





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
            txtNombre.Text = dt.Rows[0]["nombre"].ToString();
            txtApellidoPa.Text = dt.Rows[0]["apellido_Pa"].ToString();
            txtApellidoMa.Text = dt.Rows[0]["apellido_Ma"].ToString();
            txtCalle.Text = dt.Rows[0]["calle"].ToString();
            txtColonia.Text = dt.Rows[0]["colonia"].ToString();
            txtNumE.Text = dt.Rows[0]["num_exterior"].ToString();
            txtNumeroI.Text = dt.Rows[0]["num_interior"].ToString();
            txtCodigo.Text = Convert.ToInt32(dt.Rows[0]["codigo_Pos"]).ToString().Trim();
            txtseccion.Text = dt.Rows[0]["seccion"].ToString().Trim();
            txtMunicipio.Text = dt.Rows[0]["municipio"].ToString();
            txtFechaN.Text = Convert.ToDateTime(dt.Rows[0]["fecha_nac"]).ToString("yyyy-MM-dd").TrimEnd();

            try
            {
                string nombreCom = dt.Rows[0]["nombre_comp"].ToString();
                if (nombreCom != "")
                {
                    string nombre = Convert.ToString(dt.Rows[0]["nombre_comp"]);
                    com = new SqlCommand("Select nombre_comp, partido_afil from tbl_PartidoNacional where nombre_comp='" + nombre + "'", con);
                    com.CommandType = CommandType.Text;
                    //comando2.Parameters.AddWithValue("@IdPersona", txtIntegrante.Text);
                    con.Open();
                    SqlDataReader registro2 = com.ExecuteReader();
                    if (registro2.Read())
                    {

                        txtAfiliacion.Text = registro2["partido_afil"].ToString().TrimEnd();
                    }
                    else
                    {
                        txtAfiliacion.Text = "";
                    }








                      
                    

                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                Tools.setError(msgError, ex.Message, true);

            }

            //try
            //{
            //    string seccion = dt.Rows[0]["seccion"].ToString();
            //    if (seccion != "")
            //    {
            //        string seccion2 = Convert.ToString(dt.Rows[0]["seccion"]);
            //        com = new SqlCommand("Select Top_25_2009_gral, Top_25_2009_porc, Top25DifGral2009, 3Cond_2009_25_porc, Top_25_2015_PRI, Top_25_2015_porc_PRI, Top25DifGral2015, 3Cond_2015_25_porc from tbl_Secciones2009_2015NL where seccion='" + seccion2 + "'", con);
            //        com.CommandType = CommandType.Text;
            //        //comando2.Parameters.AddWithValue("@IdPersona", txtIntegrante.Text);
            //        con.Open();
            //        SqlDataReader rd = com.ExecuteReader();
            //        if (rd.Read())
            //        {



            //            txtgral2009.Text = rd["Top_25_2009_gral"].ToString();
            //            txtporciento2009.Text = rd["Top_25_2009_porc"].ToString();
            //            txtdif2009.Text = rd["Top25DifGral2009"].ToString();
            //            txtcond2009.Text = rd["3Cond_2009_25_porc"].ToString();
            //            txtgral2015.Text = rd["Top_25_2015_PRI"].ToString();
            //            txtporciento2015.Text = rd["Top_25_2015_porc_PRI"].ToString();
            //            txtdif2015.Text = rd["Top25DifGral2015"].ToString();
            //            txtcond2015.Text = rd["3Cond_2015_25_porc"].ToString();




            //        }
            //        else
            //        {
            //            txtAfiliacion.Text = "";
            //        }

            //    }
            //    else
            //    {

            //    }
            //}
            //catch
            //{

            //}
            //con.Close();

        }

    }

   
    protected void Distritos(object sender, EventArgs e)
    {
        



        //try
        //{
        //    DataTable dt = new DataTable();
        //    SqlConnection con = new SqlConnection(strConnString);
        //    con.Open();

        //    string result = SqlDataSource1.SelectCommand = "SELECT *  FROM tbl_Captura";
        //    GvwMonterrey.DataBind();

        //    SqlDataSource1.DataBind();

        //    con.Close();



        //}

        //catch (Exception ex)
        //{
        //    //Tools.setError(msgError, ex.Message, true);

        //}
    }


    public DataSet Consultar(string strSQL)
    {
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();
        SqlCommand cmd = new SqlCommand(strSQL, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        return ds;
    }//MEtodo que retorna datos


    


    private void Get_Div_Electoral()
    {
        try
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            //string nombre; if (txtNomInteg.Text != "") { nombre = Convert.ToString(txtNomInteg.Text); } else { nombre = ""; }
            //string Nombre_Comp; if (txtName.Text != "") { Nombre_Comp = Convert.ToString(txtName.Text); } else { Nombre_Comp = ""; }


            //string Nombrecomplet = txtNomInteg.Text;
            //string validar = txtName.Text.Trim();
            //string entidad = ddlEstados.Text.Trim();
            //if (validar != "")
            //{

            //    string result = SqlDataSource1.SelectCommand = "SELECT clave_elec, Nombre_Comp, edad , calle, num_exterior,colonia, municipio, entidad    FROM tbl_INEPersonas  WHERE Nombre_Comp  like '%" + validar + "%' and entidad='" + entidad + "'";
            //}
            //else
            //{
            //    GvwMonterrey.DataSource = new List(String);
            //    GvwMonterrey.DataBind();

            //    string result = SqlDataSource1.SelectCommand = "";
            //}

            string result = SqlDataSource1.SelectCommand = "SELECT *  FROM tbl_Captura";
            GvwMonterrey.DataBind();

            SqlDataSource1.DataBind();

            con.Close();



        }

        catch (Exception ex)
        {
            Tools.setError(msgError, ex.Message, true);

        }
    }

    protected void GvwMonterrey_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        
    }

    protected void GvwMonterrey_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void GvwMonterrey_SelectedIndexChanged(object sender, EventArgs e)
    {

    }



    protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {

    }






   
}