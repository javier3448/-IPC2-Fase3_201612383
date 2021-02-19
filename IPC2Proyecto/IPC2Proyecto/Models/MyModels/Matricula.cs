namespace IPC2Proyecto.Models.MyModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Matricula")]
    public partial class Matricula
    {
        [Key]
        public int id_matricula { get; set; }

        [Required]
        [StringLength(45)]
        public string asistencia { get; set; }

        [StringLength(145)]
        public string respuestas_cuestionario { get; set; }

        public int usuario_estudiante { get; set; }

        public int actividad_id_actividad { get; set; }

        public virtual Actividad Actividad { get; set; }

        public virtual Usuario Usuario { get; set; }

        public static class TipoDeAsistencia {
            public static string Ausente = "ausente";
            public static string Presente = "presente";
        }
    }
}
