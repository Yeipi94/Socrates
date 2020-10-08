using Entidades;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Seccionales : BasePage
{
    string strConnString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
    WebServiceDatos Tools = new WebServiceDatos();
    ws_TablaDatos lista = new ws_TablaDatos();
    protected void Page_Load(object sender, EventArgs e)
    {
        ListRegiones();

    }

    private void ListRegiones()
    {
       

        try
        {
            if (Session["UserSessionEmpleado"] != null)
            {
                Empleado objEmpeado = (Empleado)Session["UserSessionEmpleado"];
                int idEmp = Convert.ToInt32(objEmpeado.ID);

                DataTable dt = lista.GetListaSecciones(idEmp);
                Gw_ListaAsignacion.DataSource = dt;
                Gw_ListaAsignacion.DataBind();
            }

        }
        catch (Exception ex)
        {
            Tools.setError(msgError, ex.Message, true);
        }
    }
    protected void BtnExportToExcel_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.AppendHeader("content-disposition", "attachment; filename=Asignaciones.xls");
        Response.ContentType = "application/excel";
        StringWriter stringWriter = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(stringWriter);
        Gw_ListaAsignacion.HeaderRow.Style.Add("background-color", "#FFFFFF");
        foreach (TableCell tableCell in Gw_ListaAsignacion.HeaderRow.Cells)
        {
            tableCell.Style["background-color"] = "#A55129";
        }

        foreach (GridViewRow gridViewRow in Gw_ListaAsignacion.Rows)
        {
            gridViewRow.BackColor = System.Drawing.Color.White;
            foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
            {
                gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
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