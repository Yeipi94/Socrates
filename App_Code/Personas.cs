using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Personas
/// </summary>
public class Personas
{
    public String clave { get; set; }
    public String Nombre_Comp { get; set; }
    public String colonia { get; set; }
    public String municipio { get; set; }
    public String entidad { get; set; }

    public Personas() : this("", "", "", "", "") { }
    public Personas(String _clave, String _Nombre_Comp, String _colonia, String _municipio, String _entidad)
    {

        //this.id = _id;
        //this.Entidad = _Entidad;
        //this.Nombre = _Nombre;
        //this.F_Afil = _F_Afil;

        this.clave = _clave;
        this.Nombre_Comp = _Nombre_Comp;
        this.colonia = _colonia;
        this.municipio = _municipio;
        this.entidad = _entidad;
    }

}
