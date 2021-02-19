namespace IPC2Proyecto.Models.MyModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Incidente_salon
    {
        [Key]
        public int id_incidente_salon { get; set; }

        [Required]
        [StringLength(145)]
        public string descripcion { get; set; }

        public decimal costo { get; set; }

        [Required]
        [StringLength(10)]
        public string estado { get; set; }

        public bool activo { get; set; }

        public int actividad_id_actividad { get; set; }

        public virtual Actividad Actividad { get; set; }
    }
}
