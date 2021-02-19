using IPC2Proyecto.Models.MyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPC2Proyecto.PaginasEstudiante.Cursos
{
    public partial class DetallesCurso : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.Cookies.Get("usuario").Values["tipo"] != "estudiante" || Request.Cookies.Get("usuario").Values["tipo"] == null)
            {
                if (Request.Cookies.Get("usuario").Values["tipo"] == "admin")
                {
                    return;
                }
                Response.Redirect("~/Login");
            }
        }

        protected void Page_InitComplete(object sender, EventArgs e)
        {
            LlenarControles();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void LlenarControles()
        {
            int idCurso;
            bool b = Int32.TryParse(Request.QueryString["id_curso"], out idCurso);

            if (!b)
            {
                FailureText.Text = "Id curso no valido";
                return;
            }

            ModelDatabase db = new ModelDatabase();

            Curso curso = (from c in db.Cursoes
                          where c.id_curso == idCurso
                          select c).Take(1).First();

            TBNombre.Text = curso.nombre;
            TBCatedratico.Text = GetNombreCatedratico(curso);
            TBCiclo.Text = curso.ciclo;
            TBDateInicial.Text = (curso.fecha_incio ?? default(DateTime)).ToString("dd/MM/yyyy");
            CalendarInicial.SelectedDate = curso.fecha_incio ?? default(DateTime);
            TBDateFinal.Text = (curso.fecha_final ?? default(DateTime)).ToString("dd/MM/yyyy");
            CalendarFinal.SelectedDate = curso.fecha_final ?? default(DateTime);

        }

        public string GetNombreCatedratico(Curso curso)
        {
            if (!curso.Actividads.Any())
            {
                return "Error";
            }
            else
            {
                ModelDatabase db = new ModelDatabase();

                IQueryable<Actividad> actividadesDeCurso = from a in db.Actividads
                                                           where a.curso_id_curso == curso.id_curso
                                                           select a;

                if (!actividadesDeCurso.Any())
                {
                    return "error";
                }
                else
                {
                    Actividad actividadDeCurso = actividadesDeCurso.Take(1).First();

                    return actividadDeCurso.Carta.Usuario.nombre;
                }
            }
        }

        protected void Asignar_Click(object sender, EventArgs e)
        {
            if (!RBTraslapes.Checked)
            {
                AsignarseSinTraslapes();
            }
            else
            {
                AsignarseConTraslapes();
            }
        }

        private void AsignarseSinTraslapes()
        {
            ModelDatabase db = new ModelDatabase();

            int idUsuario = Int32.Parse(Request.Cookies["usuario"].Values["id_usuario"]);
            int idCurso = Int32.Parse(Request.QueryString["id_curso"]);

            IQueryable < Actividad > actividadesAMatricular = (from a in db.Actividads
                                                               where a.curso_id_curso == idCurso
                                                               select a);

            IQueryable<Actividad> actividadesDeEstudiante = from acti in db.Actividads
                                                            join mat in db.Matriculas on acti.id_actividad equals mat.actividad_id_actividad
                                                            where mat.usuario_estudiante == idUsuario
                                                            select acti;

            IQueryable<Actividad> actividadesTraslapadas = Validacion.IsActividadDisponible(actividadesAMatricular, actividadesDeEstudiante);

            //Revisar si se traslapa
            if (actividadesTraslapadas.Any())
            {
                foreach (Actividad actividadTralapada in actividadesTraslapadas)
                {
                    FailureText.Text = "La actividad a la que desea matricularse se traslapa con: " + actividadTralapada.nombre + "\n";
                }
                return;
            }

            Models.MyModels.Asignacion asignacion = new Models.MyModels.Asignacion() {
                usuario_estudiante = idUsuario,
                curso_id_curso = idCurso
            };

            db.Asignacions.Add(asignacion);

            foreach (Actividad actividadAMatricular in actividadesAMatricular)
            {
                Matricula matricula = new Matricula()
                {
                    asistencia = Matricula.TipoDeAsistencia.Ausente,
                    usuario_estudiante = idUsuario,
                    actividad_id_actividad = actividadAMatricular.id_actividad
                };

                db.Matriculas.Add(matricula);
            }
            
            db.SaveChanges();

            Response.Redirect("~/PaginasEstudiante/Cursos/MisCursos");
        }

        private void AsignarseConTraslapes()
        {
            ModelDatabase db = new ModelDatabase();

            int idUsuario = Int32.Parse(Request.Cookies["usuario"].Values["id_usuario"]);
            int idCurso = Int32.Parse(Request.QueryString["id_curso"]);

            IQueryable<Actividad> actividadesAMatricular = (from a in db.Actividads
                                                            where a.curso_id_curso == idCurso
                                                            select a);

            foreach (Actividad actividadAMatricular in actividadesAMatricular)
            {
                Matricula matricula = new Matricula()
                {
                    asistencia = Matricula.TipoDeAsistencia.Ausente,
                    usuario_estudiante = idUsuario,
                    actividad_id_actividad = actividadAMatricular.id_actividad
                };

                db.Matriculas.Add(matricula);
            }

            db.SaveChanges();

            Response.Redirect("~/PaginasEstudiante/Cursos/MisCursos");
        }
    }
}