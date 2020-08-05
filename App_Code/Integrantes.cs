using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
public class Integrantes
{
     private String mes;
    
    public string Mes
    {
        set
        {
            this.mes = value;
        }
        get
        {
            switch (mes)
            {
                case "JUNIO":
                    
                    this.mes += " del 2019";
                    break;
                case "MAYO":
                    this.mes += " del 2019";
                    break;
                case "":
                    this.mes = "Mes no admitido";
                    break;
            }
            return this.mes;
        }
    }

    //DISCAPACIDAD DEL INTEGRANTE

    private String discapacidad;
    public void setDiscapacidad(String discapacidad)
    {
        this.discapacidad = discapacidad;
    }
    public String getDiscapacidad()
    {
        if (discapacidad == "1")
        {
            discapacidad = "SI";
        }
        else
        {
            discapacidad = "No";
        }
        return this.discapacidad;
    }


    //public string Discapacidad
    //{

    //    set
    //    {
    //        this.discapacidad = value;
    //    }
    //get
    //{
    //switch (discapacidad)
    //{
    //    case "1":

    //        this.discapacidad += " Motriz";
    //        break;
    //    case "2":
    //        this.discapacidad += "Visual";
    //        break;
    //    case "3":
    //        this.discapacidad = "Auditiva";
    //        break;
    //}



    //if (discapacidad == "1")
    //{
    //    discapacidad = "SI";
    //}
    //else
    //{
    //    discapacidad = "No";
    //}
    //        return this.discapacidad;
    //    }
    //}
}