//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RecursoHumano_ProyectoFinal.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Salida_Empleados
    {
        public int Id { get; set; }
        public int EmpleadosId { get; set; }
        public string Tipo_Salida { get; set; }
        public string Motivo { get; set; }
        public System.DateTime Fecha_Salida { get; set; }
    
        public virtual Empleados Empleado { get; set; }
    }

    public enum Salida {
        Renuncia,
        Despido,
        Desahucio
    }
}
