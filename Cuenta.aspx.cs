using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Entidades;
using logica;
using System.Text.RegularExpressions;
using System.Security.Permissions;

public partial class Cuenta : BasePage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        Empleado objEmpeado = (Empleado)Session["UserSessionEmpleado"];
        //txtTipo.Text = Convert.ToString(objEmpeado.RTipoEmpleado);
        //txtNombre.Text = objEmpeado.Nombre;
        //txtApellidoP.Text = objEmpeado.ApPaterno;
        //txtApellidoM.Text = objEmpeado.ApMaterno;
        //OBTIENE EL ID EMPLEADO EN LOS USUARIOS REGISTRADS
        Int32 idPersona = Convert.ToInt32(objEmpeado.idPersona);

        LlenarDatosSession(idPersona);



    }

    private void LlenarDatosSession(Int32 idPersona)
    {
        //EnvironmentPermissionAccess EL ID AL CLASE LOGICA
        // llenar la informacion
        var objDivelectoral = Div_ElectoraLN.getInstance().InformacionSessionPer(idPersona);
        //hfIdPaciente.Value = objPaciente.IdPaciente.ToString();
        //lblNombres.Text = objPaciente.Nombres;
        //lblApellidos.Text = objPaciente.ApPaterno + " " + objPaciente.ApMaterno;
        //lblEdad.Text = objPaciente.Edad.ToString();
        //lblSexo.Text = (objPaciente.Sexo == 'F') ? "Femenino" : "Masculino";
        txtNombre.Text = objDivelectoral.nombre;
        txtApellidoP.Text = objDivelectoral.apellido_paterno;
        txtApellidoM.Text = objDivelectoral.apellido_materno;
        txtCVE.Text = objDivelectoral.clave_elector;


    }
}




     