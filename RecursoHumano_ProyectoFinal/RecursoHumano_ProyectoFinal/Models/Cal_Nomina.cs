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
    
    public partial class Cal_Nomina
    {
        public int Id { get; set; }
        public System.DateTime Ano { get; set; }
        public System.DateTime Mes { get; set; }
        public double Monto_Total { get; set; }
        public int EmpleadosId { get; set; }
    
        public virtual Empleados Empleado { get; set; }
    }
}
