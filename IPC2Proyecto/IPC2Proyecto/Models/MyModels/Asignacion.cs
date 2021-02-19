namespace IPC2Proyecto.Models.MyModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Asignacion")]
    public partial class Asignacion
    {
        [Key]
        public int id_asignacion { get; set; }

        public int usuario_estudiante { get; set; }

        public int curso_id_curso { get; set; }

        public virtual Curso Curso { get; set; }

        public virtual Usuario Usuario { get; set; }
    }
}
