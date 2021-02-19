namespace IPC2Proyecto.Models.MyModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Incidente_insumo
    {
        [Key]
        public int id_incidente_insumo { get; set; }

        [Required]
        [StringLength(145)]
        public string descripcion { get; set; }

        public decimal costo { get; set; }

        [Required]
        [StringLength(10)]
        public string estado { get; set; }

        public bool activo { get; set; }

        public int prestamo_id_prestamo { get; set; }

        public virtual Prestamo Prestamo { get; set; }
    }
}
