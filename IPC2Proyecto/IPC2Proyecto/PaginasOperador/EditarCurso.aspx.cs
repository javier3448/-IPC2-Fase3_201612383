using IPC2Proyecto.Models.MyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPC2Proyecto.PaginasOperador
{
    public partial class EditarCurso : System.Web.UI.Page
    {
        ModelDatabase db;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.Cookies.Get("usuario").Values["tipo"] != "operador" || Request.Cookies.Get("usuario").Values["tipo"] == null)
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
            InitActividadesConTraslape();
            LlenarControles();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void LlenarControles()
        {
            db = new ModelDatabase();

            if (Request.QueryString["id_curso"]==null)
            {
                Response.Redirect("~/");
            }

            int idCurso = Int32.Parse(Request.QueryString["id_curso"]);

            Curso curso = (from c in db.Cursoes
                          where c.id_curso == idCurso
                          select c).Take(1).First();

            TBNombre.Text = curso.nombre;
            if (curso.ciclo=="semanal")
            {
                DDLCiclo.SelectedIndex = 0;
            }
            else if (curso.ciclo == "mensual")
            {
                DDLCiclo.SelectedIndex = 1;
            }
            else if (curso.ciclo == "anual")
            {
                DDLCiclo.SelectedIndex = 2;
            }

            DateTime inicio = curso.fecha_incio ?? default(DateTime);
            DateTime final= curso.fecha_final ?? default(DateTime);

            TBDateInicial.Text = inicio.ToString("dd/MM/yyyy");
            TBDateFinal.Text = final.ToString("dd/MM/yyyy");

            CalendarInicial.SelectedDate = inicio;
            CalendarFinal.SelectedDate = final;
        }

        private void InitActividadesConTraslape()
        {
            FailureText.Text = "Las siguientes actividades no se generaron por problemas de traslape: </br>nombre, nombre De Actividad Con la que se traslapa, fecha </br>" ;

            ModelDatabase db = new ModelDatabase();

            char[] c = { ';' };

            if (Request.QueryString["Traslapes"] == null)
            {
                FailureText.Text = "";
                return;
            }

            string[] actividadesConTraslape = Server.UrlDecode(Request.QueryString["Traslapes"]).Split(c, StringSplitOptions.RemoveEmptyEntries);

            foreach (string stringActividad in actividadesConTraslape)
            {
                string nombreActividadNueva = stringActividad.Split(',')[0];

                int idActividadExistente = Int32.Parse(stringActividad.Split(',')[1]);

                Actividad actividadExistente = (from a in db.Actividads
                                               where a.id_actividad == idActividadExistente
                                               select a).Take(1).First();

                FailureText.Text += nombreActividadNueva + "," + actividadExistente.nombre +","+ actividadExistente.fecha_incio.ToString("dd/MM/yyyy") + "</br>";
            }
        }

        protected void Aceptar_Click(object sender, EventArgs e)
        {
            UpdateCurso();
        }

        private void UpdateCurso()
        {
            ModelDatabase db = new ModelDatabase();

            int idCurso = Int32.Parse(Request.QueryString["id_curso"]);
            Curso curso = (from c in db.Cursoes
                          where c.id_curso == idCurso
                          select c).Take(1).First();

            curso.nombre = TBNombre.Text;
            curso.ciclo = DDLCiclo.Text;
            curso.fecha_incio = DateTime.ParseExact(TBDateInicial.Text,"dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            curso.fecha_final = DateTime.ParseExact(TBDateFinal.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);

            db.SaveChanges();

            LlenarControles();

            FailureText.Text = "Curso Actuailizado";
        }

        protected void CalendarInicial_SelectionChanged(object sender, EventArgs e)
        {
            TBDateInicial.Text = CalendarInicial.SelectedDate.ToString("dd/MM/yyyy");
        }

        protected void CalendarFinal_SelectionChanged(object sender, EventArgs e)
        {
            TBDateFinal.Text = CalendarFinal.SelectedDate.ToString("dd/MM/yyyy");
        }
    }
}