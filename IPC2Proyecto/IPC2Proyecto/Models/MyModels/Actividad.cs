namespace IPC2Proyecto.Models.MyModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Actividad")]
    public partial class Actividad
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Actividad()
        {
            Incidente_salon = new HashSet<Incidente_salon>();
            Matriculas = new HashSet<Matricula>();
        }

        [Key]
        public int id_actividad { get; set; }

        [Required]
        [StringLength(45)]
        public string nombre { get; set; }

        [Required]
        [StringLength(10)]
        public string tipo { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime fecha_incio { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime fecha_final { get; set; }

        [StringLength(145)]
        public string presentacion { get; set; }

        [StringLength(145)]
        public string cuestionario { get; set; }

        [Required]
        [StringLength(45)]
        public string codigo_qr { get; set; }

        public int carta_id_carta { get; set; }

        public int salon_id_salon { get; set; }

        public int curso_id_curso { get; set; }

        public virtual Carta Carta { get; set; }

        public virtual Curso Curso { get; set; }

        public virtual Salon Salon { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Incidente_salon> Incidente_salon { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Matricula> Matriculas { get; set; }
    }
}
