using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using logica;

public partial class Catalogo : BasePage
{
    WebServiceDatos Tools = new WebServiceDatos();


    string strConnString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
    DataTable dt;
    AutocompletarService Service = new AutocompletarService();
    ws_TablaDatos lista = new ws_TablaDatos();
    protected void Page_Load(object sender, EventArgs e)
    {
        ListDistritales();
        if (!Page.IsPostBack)
        {
        }

        if (Session["UserSessionEmpleado"] != null)
        {
            Empleado objEmpeado = (Empleado)Session["UserSessionEmpleado"];
            int idEmp = Convert.ToInt32(objEmpeado.ID);                    
        }     
    }
    







    private void ListDistritales()
    {
        try
        {
            if (Session["UserSessionEmpleado"] != null)
            {
                Empleado objEmpeado = (Empleado)Session["UserSessionEmpleado"];
                int idEmp = Convert.ToInt32(objEmpeado.ID);

                DataTable dt = lista.GetNacionalLista(idEmp);
                Gw_ListaAsignacion.DataSource = dt;
                Gw_ListaAsignacion.DataBind();
            }
            
        }
        catch (Exception ex)
        { 
            Tools.setError(msgError, ex.Message, true); 
        }
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
    }
   



	
	protected void Gw_ListaAsignacion_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{

	}

	protected void Gw_ListaAsignacion_RowDataBound(object sender, GridViewRowEventArgs e)
	{

	}

	protected void Gw_ListaAsignacion_SelectedIndexChanged(object sender, EventArgs e)
	{

	}

    protected void BtnExportToExcel_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.AppendHeader("content-disposition", "attachment; filename=Asignaciones.xls");
        Response.ContentType = "application/excel";
        StringWriter stringWriter = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(stringWriter);
        //Gw_ListaAsignacion.HeaderRow.Style.Add("background-color", "#FFFFFF");
        foreach (TableCell tableCell in Gw_ListaAsignacion.HeaderRow.Cells)
        {
            tableCell.Style["background-color"] = "#022c66";
            tableCell.Style["color"] = "#FFFFFF";
        }

        foreach (GridViewRow gridViewRow in Gw_ListaAsignacion.Rows)
        {
            gridViewRow.BackColor = System.Drawing.Color.White;
            foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
            {
                gridViewRowTableCell.Style["background-color"] = "#FFFFFF";
            }
        }
        Gw_ListaAsignacion.RenderControl(htw);
        Response.Write(stringWriter.ToString());
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
    }
}