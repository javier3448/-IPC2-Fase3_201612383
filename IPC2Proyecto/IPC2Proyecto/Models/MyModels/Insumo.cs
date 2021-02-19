namespace IPC2Proyecto.Models.MyModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Insumo")]
    public partial class Insumo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Insumo()
        {
            Prestamoes = new HashSet<Prestamo>();
        }

        [Key]
        public int id_insumo { get; set; }

        [Required]
        [StringLength(45)]
        public string nombre { get; set; }

        [Required]
        [StringLength(145)]
        public string descripcion { get; set; }

        [Required]
        [StringLength(10)]
        public string estado { get; set; }

        public decimal precio { get; set; }

        public bool disponible { get; set; }

        public bool activo { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Prestamo> Prestamoes { get; set; }
    }
}
