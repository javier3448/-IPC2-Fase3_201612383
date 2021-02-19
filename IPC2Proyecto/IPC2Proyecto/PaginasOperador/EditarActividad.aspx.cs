using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IPC2Proyecto.Models.MyModels;
using IPC2Proyecto.Models;

namespace IPC2Proyecto.PaginasOperador
{
    public partial class EditarActividad : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e) {
            if (Request.Cookies.Get("usuario").Values["tipo"] != "operador" || Request.Cookies.Get("usuario").Values["tipo"] == null)
            {
                if (Request.Cookies.Get("usuario").Values["tipo"] == "admin")
                {
                    return;
                }
                Response.Redirect("~/Login");
            }
        }

        protected void Page_InitComplete(object sender, EventArgs e) {
            initActividad();
            llenarControles();
        }

        Actividad actividad;

        protected void Page_Load(object sender, EventArgs e)
        {
            /*Si no tiene parametro idActividad se va home*/
            initActividad();
        }

        private void llenarControles() {

            if (actividad==null) {
                return;
            }

            LiteralIdSalon.Text = "idActividad: " + actividad.id_actividad.ToString();
            txbNombre.Text = actividad.nombre;
            if (actividad.tipo == "lab")
            {
                ListTipo.SelectedIndex = 0;
            }
            else if (actividad.tipo == "curso")
            {
                ListTipo.SelectedIndex = 1;
            }
            else if (actividad.tipo == "taller")
            {
                ListTipo.SelectedIndex = 2;
            }
            else if (actividad.tipo == "mantenimiento")
            {
                ListTipo.SelectedIndex = 3;
            }
            else if (actividad.tipo == "feriado")
            {
                ListTipo.SelectedIndex = 4;
            }
            DateTime inicioActividad = actividad.fecha_incio;
            DateTime finActividad = actividad.fecha_final;
            TBFecha.Text = actividad.fecha_incio.ToString("dd/MM/yyyy");

            TBHoraInicio.Text = actividad.fecha_incio.ToString("HH:mm");
            TBHoraFinal.Text = actividad.fecha_final.ToString("HH:mm");

            txbIdCarta.Text = actividad.carta_id_carta.ToString();
            ModelDatabase db = new ModelDatabase();

            int index = -1;
            int idSalon = actividad.salon_id_salon;

            foreach (Salon salon in db.Salons)
            {
                index++;
                if (salon.id_salon == idSalon)
                {
                    break;
                }
            }

            DDLSalon.SelectedIndex = index;

            index = -1;
            int idCurso = actividad.curso_id_curso;

            foreach (Curso curso in db.Cursoes)
            {
                index++;
                if (curso.id_curso == idCurso)
                {
                    break;
                }
            }

            DDLCurso.SelectedIndex = index;
        }

        private void initActividad() {
            ModelDatabase db = new ModelDatabase();

            int idS;
            bool b = Int32.TryParse(Request.QueryString["idActividad"], out idS);

            if (!b)
            {
                /*Hay que redireccionar a mis actividades o calendario*/
                idS = 02;
            }

            /*SELECT * 
            FROM Actividad
            WHERE id_carta=@IdActividad*/
            actividad = (from a in db.Actividads
                         where a.id_actividad == idS
                         select a).Take(1).First();


        }

        protected void Save_Click(object sender, EventArgs e) {
            UpdateActividad();
        }

        protected void UpdateActividad() {
            ModelDatabase db = new ModelDatabase();

            int idS;
            bool b = Int32.TryParse(Request.QueryString["idActividad"], out idS);

            if (!b)
            {
                /*Hay que redireccionar a mis actividades o calendario*/
                idS = 02;
            }

            /*SELECT * 
            FROM Actividad
            WHERE id_Actividad=@IdActividad*/
            Actividad ac = (from a in db.Actividads
                            where a.id_actividad == idS
                            select a).Take(1).First();

            ac.nombre = txbNombre.Text;
            ac.tipo = ListTipo.SelectedValue;

            ac.fecha_incio = DateTime.ParseExact(TBFecha.Text + " " + TBHoraInicio.Text, "dd/MM/yyyy HH:mm", System.Globalization.CultureInfo.InvariantCulture);
            ac.fecha_final = DateTime.ParseExact(TBFecha.Text + " " + TBHoraFinal.Text, "dd/MM/yyyy HH:mm", System.Globalization.CultureInfo.InvariantCulture);

            ac.carta_id_carta = Int32.Parse(txbIdCarta.Text);
            ac.salon_id_salon = Int32.Parse(DDLSalon.SelectedValue);
            ac.curso_id_curso = Int32.Parse(DDLCurso.SelectedValue);

            IQueryable<Actividad> actividadsTraslapadas = Validacion.IsActividadDisponible(ac, db.Actividads);

            if (actividadsTraslapadas.Any())
            {
                Actividad actividadTraslapada = actividadsTraslapadas.Take(1).First();
                FailureText.Text = "La actividad se traslapa con: " + actividadTraslapada.nombre;
                llenarControles();
                return;
            }

            FailureText.Text = "Actividad actualizada";

            db.SaveChanges();
        } 

        protected void Cancel_Click(object sender, EventArgs e)
        {
            initActividad();
            llenarControles();
        }

        protected void CalendarFecha_SelectionChanged(object sender, EventArgs e)
        {
            TBFecha.Text = CalendarFecha.SelectedDate.ToString("dd/MM/yyyy");
        }
    }
}