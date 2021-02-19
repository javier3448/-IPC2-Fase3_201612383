namespace IPC2Proyecto.Models.MyModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Salon")]
    public partial class Salon
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Salon()
        {
            Actividads = new HashSet<Actividad>();
        }

        [Key]
        public int id_salon { get; set; }

        [Required]
        [StringLength(45)]
        public string nombre { get; set; }

        [Required]
        [StringLength(45)]
        public string edificio { get; set; }

        [Required]
        [StringLength(10)]
        public string estado { get; set; }

        public bool activo { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Actividad> Actividads { get; set; }
    }
}
