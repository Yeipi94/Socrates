using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Seccion
/// </summary>
public class Seccion
{
	public int id_Seccion { get; set; }
	public string seccion { get; set; }
	public int fk_Zona { get; set; }
}