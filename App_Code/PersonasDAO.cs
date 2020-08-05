using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de PersonasDAO
/// </summary>
public class PersonasDAO
{
    public List<Personas> ListarPersonas()
    {
        List<Personas> Lista = new List<Personas>();
        SqlConnection con = null;
        SqlCommand cmd = null;
        SqlDataReader dr = null;

        try
        {
            Connections cnn = new Connections();
            cnn.cnn();
            cmd = new SqlCommand("spListarPersonas", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                // Crear objetos de tipo Paciente
                Personas objPersonas = new Personas();
                //objPersonas.id = Convert.ToInt32(dr["id"].ToString());
                //objPersonas.Entidad = dr["Entidad"].ToString();
                //objPersonas.Nombre = dr["Nombre"].ToString();
                //objPersonas.F_Afil = dr["F_Afil"].ToString();

                objPersonas.clave = dr["clave"].ToString();
                objPersonas.Nombre_Comp = dr["Nombre_Comp"].ToString();
                objPersonas.colonia = dr["colonia"].ToString();
                objPersonas.municipio = dr["municipio"].ToString();
                objPersonas.entidad = dr["entidad"].ToString();
                // añadir a la lista de objetos
                Lista.Add(objPersonas);
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return Lista;
    }
}