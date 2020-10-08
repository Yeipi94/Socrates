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
using Entidades;
using logica;

public partial class Territorial : BasePage
{
    WebServiceDatos Tools = new WebServiceDatos();
    string strConnString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserSessionEmpleado"] != null)
        {
            Empleado objEmpeado = (Empleado)Session["UserSessionEmpleado"];
            int TipoSession = objEmpeado.RTipoEmpleado;
            //si session es ditrital
			if (TipoSession == 4)
			{
                Distritos_D.Visible = true;
                Regiones.Visible = true;
                sec_on.Visible = false;
                Manzanas.Visible = false;
			}
            //si session es regional
            else if (TipoSession == 5)
            {
                Distritos_D.Visible = true;
                Regiones.Visible = true;
                sec_on.Visible = true;
                Manzanas.Visible = false;
            }
            //si session es Seccional
            else if (TipoSession == 6)
            {
                Distritos_D.Visible = true;
                Regiones.Visible = true;
                sec_on.Visible = true;
                Manzanas.Visible = true;
            }
			else
			{

			}

        }

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
                        .CreateAutoCompleteItem(string.Format("{0}-{1}-{2}-{3}-{4}-{5}-{6}-{7}-{8}-{9}-{10}-{11}-{12}-{13}",
                        sdr["Nombre_Comp"].ToString(),
                        sdr["CVE"], 
                        Convert.ToDateTime(sdr["FechaN"]).ToString("dd/MM/yyyy").TrimEnd(),
                        sdr["calle"], 
                        sdr["num_exterior"], 
                        sdr["Nombre"],
                        sdr["Apellido_Pa"],
                        sdr["Apellido_Ma"],
                        sdr["partido_afil"], 
                        sdr["INT"], 
                        sdr["CP"], 
                        sdr["municipio"], 
                        sdr["colonia"], 
                        sdr["seccion"]

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

   //GUARADAR DATOS DE FORMULARIO
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {

        Page.Validate();
        if (Page.IsValid)
        {
            if (ddlDistrito.SelectedValue != null & ddlRegiones.SelectedValue == "")
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
                cmd.Parameters.AddWithValue("@fecha_nac", "1900-01-01");
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
                cmd.Parameters.AddWithValue("@estado", true);
                cmd.Parameters.AddWithValue("@y", cord1.Text.ToString());
                cmd.Parameters.AddWithValue("@x", cord2.Text.ToString());
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)/*si rowsAffected (1) es mayor a 0*/
                {
                    Notificacion.Visible = true;
                    txtAutocomplete.Text = "";
                    txtClaveE.Text = "";
                    txtNombre.Text = "";
                    txtApellidoPa.Text = "";
                    txtApellidoMa.Text = "";
                    //txtFechaN.Text = "";
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
            else if (ddlRegiones.SelectedValue != null & ddlSecciones.SelectedValue == "")
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
                cmd.Parameters.AddWithValue("@fecha_nac", "1900-01-01");
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
                cmd.Parameters.AddWithValue("@fk_idRegion", ddlRegiones.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@estado", true);
                cmd.Parameters.AddWithValue("@y", cord1.Text.ToString());
                cmd.Parameters.AddWithValue("@x", cord2.Text.ToString());
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)/*si rowsAffected (1) es mayor a 0*/
                {
                    Notificacion.Visible = true;
                    txtAutocomplete.Text = "";
                    txtClaveE.Text = "";
                    txtNombre.Text = "";
                    txtApellidoPa.Text = "";
                    txtApellidoMa.Text = "";
                    //txtFechaN.Text = "";
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
            else if (ddlSecciones.SelectedValue != null & ddlManzanas.SelectedValue == "")
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
                cmd.Parameters.AddWithValue("@fecha_nac", "1900-01-01");
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
                cmd.Parameters.AddWithValue("@fk_idRegion", ddlRegiones.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@fk_idSeccion", ddlSecciones.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@estado", true);
                cmd.Parameters.AddWithValue("@y", cord1.Text.ToString());
                cmd.Parameters.AddWithValue("@x", cord2.Text.ToString());
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)/*si rowsAffected (1) es mayor a 0*/
                {
                    Notificacion.Visible = true;
                    txtAutocomplete.Text = "";
                    txtClaveE.Text = "";
                    txtNombre.Text = "";
                    txtApellidoPa.Text = "";
                    txtApellidoMa.Text = "";
                    //txtFechaN.Text = "";
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
                strSql = "sp_Insert_Manzaneros";
                SqlCommand cmd = new SqlCommand(strSql, con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@nombre", txtNombre.Text);
                cmd.Parameters.AddWithValue("@apellido_paterno", txtApellidoPa.Text);
                cmd.Parameters.AddWithValue("@apellido_materno", txtApellidoMa.Text);
                cmd.Parameters.AddWithValue("@fecha_nac", "1900-01-01");
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
                cmd.Parameters.AddWithValue("@fk_idRegion", ddlRegiones.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@fk_idSeccion", ddlSecciones.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@fk_idManzana", ddlManzanas.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@estado", true);
                cmd.Parameters.AddWithValue("@y", cord1.Text.ToString());
                cmd.Parameters.AddWithValue("@x", cord2.Text.ToString());
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)/*si rowsAffected (1) es mayor a 0*/
                {
                    Notificacion.Visible = true;
                    txtAutocomplete.Text = "";
                    txtClaveE.Text = "";
                    txtNombre.Text = "";
                    txtApellidoPa.Text = "";
                    txtApellidoMa.Text = "";
                    //txtFechaN.Text = "";
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

 //   public void TipoAisgnacion()//Inicia el llenado de Dropdowlist
 //   {
	//	ddlTipoAsigna.DataSource = Consultar("SELECT idTipoEmpleado, descripcion FROM TipoEmpleado where idTipoEmpleado >=4 order by idTipoEmpleado asc");
	//	ddlTipoAsigna.DataTextField = "descripcion";//Texto que se desea mostrar en dropdow
	//	ddlTipoAsigna.DataValueField = "idTipoEmpleado";//Valor de las lista en cada opcion
	//	ddlTipoAsigna.DataBind();
	//	ddlTipoAsigna.Items.Insert(0, new ListItem("Seleccionar", "0"));//el valor que le mostrara al ususrio en el dropdowlist
	//	ddlCatalogo.Items.Insert(0, new ListItem("Seleccionar", "0"));//el valor que le mostrara al ususrio en el dropdowlist
        



	//}

    //protected void ddlTipoAsigna_SelectedIndexChanged(object sender, EventArgs e)
    //{

    //    string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ToString();
    //    SqlConnection conn = new SqlConnection(conexion);
    //    int idMunicipio = Convert.ToInt32(ddlMunicipio.SelectedValue);
    //    int idTipoAsigna = Convert.ToInt32(ddlTipoAsigna.SelectedValue);
    //    if (idTipoAsigna == 4)
    //    {
    //        ddlCatalogo.Items.Clear();
           
    //        SqlCommand cmd = new SqlCommand("sp_cCatalogoElectoral", conn);
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.AddWithValue("@idCatalogo", idMunicipio);
    //        cmd.Parameters.AddWithValue("@tipo", idTipoAsigna);
    //        SqlDataAdapter da = new SqlDataAdapter(cmd);
    //        DataTable dt = new DataTable();
    //        conn.Open();
    //        da.Fill(dt);
    //        ddlCatalogo.DataSource = dt;
    //        ddlCatalogo.DataValueField = "idCatalogo";
    //        ddlCatalogo.DataTextField = "Catalogos";
    //        ddlCatalogo.DataBind();
    //        ddlCatalogo.Items.Insert(0, new ListItem("Seleccionar", ""));
    //        conn.Close();
    //    }
    //    else if (idTipoAsigna > 4)
    //    {
            
    //        Empleado objEmpeado = (Empleado)Session["UserSessionEmpleado"];
    //        Int32 idPersona = Convert.ToInt32(objEmpeado.ID);
    //        var objDivelectoral = Div_ElectoraLN.getInstance().InformacionSessionPer(idPersona);
    //        int idCatalogo = objDivelectoral.fk_Catalogo_Asignado;




    //        SqlCommand cmd = new SqlCommand("sp_cCatalogoElectoral", conn);
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.AddWithValue("@idCatalogo", idCatalogo);
    //        cmd.Parameters.AddWithValue("@tipo", idTipoAsigna);
    //        SqlDataAdapter da = new SqlDataAdapter(cmd);
    //        DataTable dt = new DataTable();
    //        conn.Open();
    //        da.Fill(dt);
    //        ddlCatalogo.DataSource = dt;
    //        ddlCatalogo.DataValueField = "idCatalogo";
    //        ddlCatalogo.DataTextField = "Catalogos";
    //        ddlCatalogo.DataBind();
    //        ddlCatalogo.Items.Insert(0, new ListItem("Seleccionar", ""));

    //        conn.Close();
    //    }
		
    //    //return ds;

    //}

    private void GetSeccion(int ProductName)
    {
        string cs = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
        

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        try
        {
            AutocompletarService dbws = new AutocompletarService();

        DataTable dt = dbws.get_List_Ine(Convert.ToString(ddlEstados_Cat.SelectedValue), Convert.ToString(txtClaveE.Text));
         //txtClaveE.Text = dt.Rows[0]["CVE"].ToString();
        txtNombre.Text = dt.Rows[0]["NOMBRE"].ToString();
        txtApellidoPa.Text = dt.Rows[0]["PATERNO"].ToString();
        txtApellidoMa.Text = dt.Rows[0]["MATERNO"].ToString();
        txtCalle.Text = dt.Rows[0]["calle"].ToString();
        txtColonia.Text = dt.Rows[0]["colonia"].ToString();
        txtNumE.Text = dt.Rows[0]["num_exterior"].ToString();
        txtNumeroI.Text = dt.Rows[0]["INT"].ToString();
        txtCodigo.Text = Convert.ToInt32(dt.Rows[0]["CP"]).ToString().Trim();
        txtseccion.Text = dt.Rows[0]["seccion"].ToString().Trim();
        txtMunicipio.Text = dt.Rows[0]["municipio"].ToString();
        //txtFechaN.Text = Convert.ToDateTime(dt.Rows[0]["FechaN"]).ToString("yyyy-MM-dd").TrimEnd();
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
                        //txtFechaN.Enabled = true;
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

			
				string seccion = txtseccion.Text.ToString();
				//if (seccion != "")
				//{
    //            SqlConnection con = new SqlConnection(strConnString);

    //                string seccion2 = Convert.ToString(dt.Rows[0]["seccion"]);
    //            SqlCommand com = new SqlCommand("Select Top_25_2009_gral, Top_25_2009_porc, Top25DifGral2009, 3Cond_2009_25_porc, Top_25_2015_PRI, Top_25_2015_porc_PRI, Top25DifGral2015, 3Cond_2015_25_porc from tbl_Secciones2009_2015NL where seccion='" + seccion2 + "'", con);
				//	com.CommandType = CommandType.Text;
				//	//comando2.Parameters.AddWithValue("@IdPersona", txtIntegrante.Text);
				//	con.Open();
				//	SqlDataReader rd = com.ExecuteReader();
				//	if (rd.Read())
				//	{



				//		txtgral2009.Text = rd["Top_25_2009_gral"].ToString();
				//		txtporciento2009.Text = rd["Top_25_2009_porc"].ToString();
				//		txtdif2009.Text = rd["Top25DifGral2009"].ToString();
				//		txtcond2009.Text = rd["3Cond_2009_25_porc"].ToString();
				//		txtgral2015.Text = rd["Top_25_2015_PRI"].ToString();
				//		txtporciento2015.Text = rd["Top_25_2015_porc_PRI"].ToString();
				//		txtdif2015.Text = rd["Top25DifGral2015"].ToString();
				//		txtcond2015.Text = rd["3Cond_2015_25_porc"].ToString();




				//	}
				//	else
				//	{
				//		txtAfiliacion.Text = "";
				//	}
    //            con.Close();

    //        }
				//else
				//{

				//}
			
			
		}
        catch
        {

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

        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#Asignaciones').modal('show')", true);

    }


   





    private void GetProductMasterDet(string ProductName)
    {
        string cs = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            //SqlCommand com = new SqlCommand("sp_GetNombres", con);

            //com.CommandType = CommandType.StoredProcedure;
            //com.Parameters.AddWithValue("@nombre_comp", ProductName);
            //SqlDataAdapter da = new SqlDataAdapter(com);
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //DataTable dt = ds.Tables[0];
            //con.Close();
            ////Binding TextBox From dataTable  
            //txtNombre.Text = dt.Rows[0]["nombre"].ToString();
            //txtApellidoPa.Text = dt.Rows[0]["apellido_Pa"].ToString();
            //txtApellidoMa.Text = dt.Rows[0]["apellido_Ma"].ToString();
            //txtCalle.Text = dt.Rows[0]["calle"].ToString();
            //txtColonia.Text = dt.Rows[0]["colonia"].ToString();
            //txtNumE.Text = dt.Rows[0]["num_exterior"].ToString();
            //txtNumeroI.Text = dt.Rows[0]["num_interior"].ToString();
            //txtCodigo.Text = Convert.ToInt32(dt.Rows[0]["codigo_Pos"]).ToString().Trim();
            //txtseccion.Text = dt.Rows[0]["seccion"].ToString().Trim();
            //txtMunicipio.Text = dt.Rows[0]["municipio"].ToString();
            //txtFechaN.Text = Convert.ToDateTime(dt.Rows[0]["fecha_nac"]).ToString("yyyy-MM-dd").TrimEnd();

            //try
            //{
            //    string nombreCom = dt.Rows[0]["nombre_comp"].ToString();
            //    if (nombreCom != "")
            //    {
            //        string nombre = Convert.ToString(dt.Rows[0]["nombre_comp"]);
            //        com = new SqlCommand("Select nombre_comp, partido_afil from tbl_PartidoNacional where nombre_comp='" + nombre + "'", con);
            //        com.CommandType = CommandType.Text;
            //        //comando2.Parameters.AddWithValue("@IdPersona", txtIntegrante.Text);
            //        con.Open();
            //        SqlDataReader registro2 = com.ExecuteReader();
            //        if (registro2.Read())
            //        {

            //            txtAfiliacion.Text = registro2["partido_afil"].ToString().TrimEnd();
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
            //catch (Exception ex)
            //{
            //    Tools.setError(msgError, ex.Message, true);

            //}

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


    


    //private void Get_Div_Electoral()
    //{
    //    try
    //    {
    //        DataTable dt = new DataTable();
    //        SqlConnection con = new SqlConnection(strConnString);
    //        con.Open();
    //        //string nombre; if (txtNomInteg.Text != "") { nombre = Convert.ToString(txtNomInteg.Text); } else { nombre = ""; }
    //        //string Nombre_Comp; if (txtName.Text != "") { Nombre_Comp = Convert.ToString(txtName.Text); } else { Nombre_Comp = ""; }


    //        //string Nombrecomplet = txtNomInteg.Text;
    //        //string validar = txtName.Text.Trim();
    //        //string entidad = ddlEstados.Text.Trim();
    //        //if (validar != "")
    //        //{

    //        //    string result = SqlDataSource1.SelectCommand = "SELECT clave_elec, Nombre_Comp, edad , calle, num_exterior,colonia, municipio, entidad    FROM tbl_INEPersonas  WHERE Nombre_Comp  like '%" + validar + "%' and entidad='" + entidad + "'";
    //        //}
    //        //else
    //        //{
    //        //    GvwMonterrey.DataSource = new List(String);
    //        //    GvwMonterrey.DataBind();

    //        //    string result = SqlDataSource1.SelectCommand = "";
    //        //}

    //        string result = SqlDataSource1.SelectCommand = "SELECT *  FROM tbl_Captura";
    //        GvwMonterrey.DataBind();

    //        SqlDataSource1.DataBind();

    //        con.Close();



    //    }

    //    catch (Exception ex)
    //    {
    //        Tools.setError(msgError, ex.Message, true);

    //    }
    //}

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










	protected void ddlCatalogo_SelectedIndexChanged1(object sender, EventArgs e)
	{

	}
}