using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Zona
/// </summary>
public class Zona
{
	public int id_Zona { get; set; }
	public string zonas { get; set; }
	public int fk_Distrito { get; set; }
}