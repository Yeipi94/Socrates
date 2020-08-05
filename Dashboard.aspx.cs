﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard : System.Web.UI.Page
{
    string strConnString = ConfigurationManager.ConnectionStrings["SISTEM_ALIADOSConnectionString"].ConnectionString;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        tableMeta();
        MetaDistrital();
    }


    private void MetaDistrital()
    {
        dt = new DataTable();
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();

        string result1 = SqlDataSource1.SelectCommand = "SELECT TOP (1000) fk_idDistrito, Meta, Avance, Faltante, AvancePorciento, FaltantePorciento FROM solaris.dbo.Meta_Distrital";

        SqlDataSource1.DataBind();

        con.Close();
    }


    protected string obtenerDatos()
    {
        SqlConnection con = new SqlConnection(strConnString);

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select Estatus, Avance from Metas_Distrito where Distrito=1";
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        con.Open();

        DataTable Datos = new DataTable();
        Datos.Load(cmd.ExecuteReader());
        con.Close();

        //DataTable Datos = new DataTable();

        //Datos.Columns.Add(new DataColumn("Meta", typeof(string)));
        //Datos.Columns.Add(new DataColumn("Porciento", typeof(string)));

        //Datos.Rows.Add(new Object[] { "Avance", 3 });
        //Datos.Rows.Add(new Object[] { "Pendiente", 97 });

        string strDatos;

        strDatos = "[['Meta','Porciento'],";

        foreach (DataRow dr in Datos.Rows)
        {
            strDatos = strDatos + "[";
            strDatos = strDatos + "'" + dr[0] + "'" + "," + dr[1];
            strDatos = strDatos + "],";
        }
        strDatos = strDatos + "]";
        return strDatos;

    }
    private void tableMeta()
    {
        dt = new DataTable();
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();

        string result2 = SqlDataSource2.SelectCommand = "SELECT TOP (1000) seccion, Meta, Avance, Faltante, AvancePorciento, FaltantePorciento FROM solaris.dbo.Meta_Territorio";

        SqlDataSource2.DataBind();

        con.Close();
    }

    

    protected void GvwMetas_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
		   
		

	}

    protected void GvwMetas_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void GvwMetas_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ddlEstad_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}