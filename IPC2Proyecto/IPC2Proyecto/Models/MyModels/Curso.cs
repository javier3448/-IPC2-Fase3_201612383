namespace IPC2Proyecto.Models.MyModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Curso")]
    public partial class Curso
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Curso()
        {
            Actividads = new HashSet<Actividad>();
            Asignacions = new HashSet<Asignacion>();
        }

        [Key]
        public int id_curso { get; set; }

        [Required]
        [StringLength(45)]
        public string nombre { get; set; }

        [Required]
        [StringLength(10)]
        public string ciclo { get; set; }

        [Column(TypeName = "date")]
        public DateTime? fecha_incio { get; set; }

        [Column(TypeName = "date")]
        public DateTime? fecha_final { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Actividad> Actividads { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Asignacion> Asignacions { get; set; }

        public enum TipoDeCiclo
        {
            semanal, mensual, anual, ninguno
        }
    }
}
