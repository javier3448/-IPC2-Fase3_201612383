namespace IPC2Proyecto.Models.MyModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Prestamo")]
    public partial class Prestamo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Prestamo()
        {
            Incidente_insumo = new HashSet<Incidente_insumo>();
        }

        [Key]
        public int id_prestamo { get; set; }

        [Required]
        [StringLength(145)]
        public string descripcion { get; set; }

        [Column(TypeName = "date")]
        public DateTime fecha { get; set; }

        [Required]
        [StringLength(10)]
        public string estado { get; set; }

        public int insumo_id_insumo { get; set; }

        public int usuario_id_usuario { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Incidente_insumo> Incidente_insumo { get; set; }

        public virtual Insumo Insumo { get; set; }

        public virtual Usuario Usuario { get; set; }
    }
}
