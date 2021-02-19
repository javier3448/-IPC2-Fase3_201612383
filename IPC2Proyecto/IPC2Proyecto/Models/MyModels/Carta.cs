namespace IPC2Proyecto.Models.MyModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Carta")]
    public partial class Carta
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Carta()
        {
            Actividads = new HashSet<Actividad>();
        }

        [Key]
        public int id_carta { get; set; }

        [Required]
        [StringLength(45)]
        public string asunto { get; set; }

        [Required]
        [StringLength(245)]
        public string contenido { get; set; }

        [StringLength(245)]
        public string imagen { get; set; }

        public int usuario_instructor { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Actividad> Actividads { get; set; }

        public virtual Usuario Usuario { get; set; }
    }
}
