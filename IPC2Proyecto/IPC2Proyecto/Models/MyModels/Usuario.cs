namespace IPC2Proyecto.Models.MyModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Usuario")]
    public partial class Usuario
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Usuario()
        {
            Asignacions = new HashSet<Asignacion>();
            Cartas = new HashSet<Carta>();
            Matriculas = new HashSet<Matricula>();
            Prestamoes = new HashSet<Prestamo>();
        }

        [Key]
        public int id_usuario { get; set; }

        [Required]
        [StringLength(45)]
        public string carne { get; set; }

        [StringLength(45)]
        public string cui { get; set; }

        [Required]
        [StringLength(45)]
        public string contrasena { get; set; }

        [Required]
        [StringLength(45)]
        public string nombre { get; set; }

        [StringLength(145)]
        public string direccion { get; set; }

        [StringLength(45)]
        public string telefono { get; set; }

        [Required]
        [StringLength(45)]
        public string correo { get; set; }

        [Column(TypeName = "date")]
        public DateTime fecha_de_nacimiento { get; set; }

        [Required]
        [StringLength(10)]
        public string tipo { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Asignacion> Asignacions { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Carta> Cartas { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Matricula> Matriculas { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Prestamo> Prestamoes { get; set; }

        public enum TipoDeUsuario
        {
            admin, operador, instructor, estudiante, anonimo
        }
    }
}
