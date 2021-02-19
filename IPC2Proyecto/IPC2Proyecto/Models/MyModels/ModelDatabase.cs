namespace IPC2Proyecto.Models.MyModels
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ModelDatabase : DbContext
    {
        public ModelDatabase()
            : base("name=ModelDatabase")
        {
        }

        public virtual DbSet<Actividad> Actividads { get; set; }
        public virtual DbSet<Asignacion> Asignacions { get; set; }
        public virtual DbSet<Carta> Cartas { get; set; }
        public virtual DbSet<Curso> Cursoes { get; set; }
        public virtual DbSet<Incidente_insumo> Incidente_insumo { get; set; }
        public virtual DbSet<Incidente_salon> Incidente_salon { get; set; }
        public virtual DbSet<Insumo> Insumoes { get; set; }
        public virtual DbSet<Matricula> Matriculas { get; set; }
        public virtual DbSet<Prestamo> Prestamoes { get; set; }
        public virtual DbSet<Salon> Salons { get; set; }
        public virtual DbSet<Usuario> Usuarios { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Actividad>()
                .HasMany(e => e.Incidente_salon)
                .WithRequired(e => e.Actividad)
                .HasForeignKey(e => e.actividad_id_actividad);

            modelBuilder.Entity<Actividad>()
                .HasMany(e => e.Matriculas)
                .WithRequired(e => e.Actividad)
                .HasForeignKey(e => e.actividad_id_actividad)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Carta>()
                .HasMany(e => e.Actividads)
                .WithRequired(e => e.Carta)
                .HasForeignKey(e => e.carta_id_carta)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Curso>()
                .HasMany(e => e.Actividads)
                .WithRequired(e => e.Curso)
                .HasForeignKey(e => e.curso_id_curso)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Curso>()
                .HasMany(e => e.Asignacions)
                .WithRequired(e => e.Curso)
                .HasForeignKey(e => e.curso_id_curso)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Incidente_insumo>()
                .Property(e => e.costo)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Incidente_salon>()
                .Property(e => e.costo)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Insumo>()
                .Property(e => e.precio)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Insumo>()
                .HasMany(e => e.Prestamoes)
                .WithRequired(e => e.Insumo)
                .HasForeignKey(e => e.insumo_id_insumo)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Prestamo>()
                .HasMany(e => e.Incidente_insumo)
                .WithRequired(e => e.Prestamo)
                .HasForeignKey(e => e.prestamo_id_prestamo);

            modelBuilder.Entity<Salon>()
                .HasMany(e => e.Actividads)
                .WithRequired(e => e.Salon)
                .HasForeignKey(e => e.salon_id_salon)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Usuario>()
                .HasMany(e => e.Asignacions)
                .WithRequired(e => e.Usuario)
                .HasForeignKey(e => e.usuario_estudiante)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Usuario>()
                .HasMany(e => e.Cartas)
                .WithRequired(e => e.Usuario)
                .HasForeignKey(e => e.usuario_instructor);

            modelBuilder.Entity<Usuario>()
                .HasMany(e => e.Matriculas)
                .WithRequired(e => e.Usuario)
                .HasForeignKey(e => e.usuario_estudiante)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Usuario>()
                .HasMany(e => e.Prestamoes)
                .WithRequired(e => e.Usuario)
                .HasForeignKey(e => e.usuario_id_usuario)
                .WillCascadeOnDelete(false);
        }
    }
}
