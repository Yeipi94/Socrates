using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Estados
/// </summary>
public class Estados
{
    private int _Id_Estado;
    private int _d_estado;

    public int Id_Estado 
    { get 
        {
            return _Id_Estado;
        }
        set
        {
            _Id_Estado = value;
        }
    }
    public int d_estado
    {
        get
        {
            return _d_estado;
        }
        set
        {
            _d_estado = value;
        }
    }
}