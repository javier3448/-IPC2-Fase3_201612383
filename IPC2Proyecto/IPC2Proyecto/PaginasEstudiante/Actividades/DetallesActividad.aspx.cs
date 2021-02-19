using IPC2Proyecto.Models.MyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPC2Proyecto.PaginasEstudiante.Actividades
{
    public partial class DetallesActividad : System.Web.UI.Page
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

        private void LlenarControles()
        {
            int idActividad = 0;
            bool b= Int32.TryParse(Request.QueryString["id_actividad"], out idActividad);

            if (!b)
            {
                FailureText.Text = "id actividad no valido";
                return;
            }

            ModelDatabase db = new ModelDatabase();
            Actividad actividad = (from a in db.Actividads
                                   where a.id_actividad == idActividad
                                   select a).Take(1).First();

            TBNombre.Text = actividad.nombre;
            TBTipo.Text = actividad.tipo;
            CalendarFecha.SelectedDate = actividad.fecha_incio;
            TBFecha.Text = actividad.fecha_incio.ToString("dd/MM/yyyy");
            TBHoraInicio.Text = actividad.fecha_incio.ToString("HH:mm");
            TBHoraFinal.Text = actividad.fecha_final.ToString("HH:mm");
            TBCatedratico.Text = actividad.Carta.Usuario.nombre;
            TBSalon.Text = actividad.Salon.nombre;
            TBCurso.Text = actividad.Curso.nombre;
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (!RBTraslapes.Checked)
            {
                MatricularseSinTraslapes();
            }
            else
            {
                MatricularseConTraslapes();
            }
        }

        private void MatricularseConTraslapes()
        {
            ModelDatabase db = new ModelDatabase();

            int idUsuario = Int32.Parse(Request.Cookies["usuario"].Values["id_usuario"]);
            int idActividad = Int32.Parse(Request.QueryString["id_actividad"]);

            Matricula matricula = new Matricula()
            {
                asistencia = Matricula.TipoDeAsistencia.Ausente,
                usuario_estudiante = idUsuario,
                actividad_id_actividad = idActividad
            };

            db.Matriculas.Add(matricula);

            db.SaveChanges();

            Response.Redirect("~/PaginasEstudiante/Actividades/MisActividades");

        }

        //Revisa si no hay traslape
        private void MatricularseSinTraslapes()
        {
            ModelDatabase db = new ModelDatabase();

            int idUsuario = Int32.Parse(Request.Cookies["usuario"].Values["id_usuario"]);
            int idActividad = Int32.Parse(Request.QueryString["id_actividad"]);

            Actividad actividadAMatricular = (from a in db.Actividads
                                             where a.id_actividad==idActividad
                                             select a).Take(1).First();

            IQueryable<Actividad> actividadesDeEstudiante = from acti in db.Actividads
                                                            join mat in db.Matriculas on acti.id_actividad equals mat.actividad_id_actividad
                                                            where mat.usuario_estudiante == idUsuario
                                                            select acti;

            IQueryable<Actividad> actividadesTraslapadas = Validacion.IsActividadDisponible(actividadAMatricular, actividadesDeEstudiante, Validacion.IsActividadDisponibleOptions.IgnorarSalon);

            //Revisar si se traslapa
            if (actividadesTraslapadas.Any())
            {
                Actividad actividadTraslapada = actividadesTraslapadas.Take(1).First();
                FailureText.Text = "La actividad a la que desea matricularse se traslapa con: "+actividadTraslapada.nombre;
                return;
            }
            
            Matricula matricula = new Matricula()
            {
                asistencia = Matricula.TipoDeAsistencia.Ausente,
                usuario_estudiante = idUsuario,
                actividad_id_actividad = idActividad
            };

            db.Matriculas.Add(matricula);

            db.SaveChanges();

            Response.Redirect("~/PaginasEstudiante/Actividades/MisActividades");
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PaginasEstudiante/Actividades/ActividadesDisponibles");
        }
        
    }
}