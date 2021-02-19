using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using IPC2Proyecto.Models;
using IPC2Proyecto.Models.MyModels;
namespace IPC2Proyecto.PaginasOperador
{
    public partial class NuevaActividad : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.Cookies.Get("usuario").Values["tipo"] != "operador" || Request.Cookies.Get("usuario").Values["tipo"] == null)
            {
                if (Request.Cookies.Get("usuario").Values["tipo"] == "admin")
                {
                    return;
                }
                Response.Redirect("~/Login");

                MultiViewCarta.ActiveViewIndex = 2;
            }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            SetParam(Request.QueryString["idSalon"], Request.QueryString["date"]);
        }

        public void SetParam(String idSalon, String fechaInicial) {
            if (idSalon == "" || fechaInicial == "" || idSalon == null || fechaInicial == null) {
                return;
            }
            
            DateTime f0 = DateTime.Parse(fechaInicial);
            CalendarFecha.SelectedDate = f0;
            TBFecha.Text = f0.ToString("dd/MM/yyyy");
            TBHoraInicio.Text = f0.ToString("HH:mm");

            int id;
            bool b = Int32.TryParse(idSalon,out id);

            if (!b) {
                FailureText.Text = "Error en conversion de id";
                return;
            }

            ModelDatabase db = new ModelDatabase();

            int index = -1;

            foreach (Salon salon  in db.Salons)
            {
                index++;
                if (salon.id_salon==id)
                {
                    break;
                }
            }
            
            DDLSalon.SelectedIndex = index;
            
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            String nombre = txbNombre.Text;
            DateTime inicio = DateTime.ParseExact(TBFecha.Text + " " + TBHoraInicio.Text, "dd/MM/yyyy HH:mm", System.Globalization.CultureInfo.InvariantCulture);
            DateTime fin = DateTime.ParseExact(TBFecha.Text + " " + TBHoraFinal.Text, "dd/MM/yyyy HH:mm", System.Globalization.CultureInfo.InvariantCulture);
            int idCarta = 0;
            if (MultiViewCarta.ActiveViewIndex==0)
            {
                idCarta = Int32.Parse(txbIdCarta.Text);
            }
            else if (MultiViewCarta.ActiveViewIndex==1)
            {
                ModelDatabase db = new ModelDatabase();

                /*INSERT INTO carta(asunto, contenido, imagen, usuario)
                VALUES(@asunto, @contenido, @imagen, @usuario)*/
                db.Cartas.Add(new Carta {
                    asunto = txbAsunto.Text,
                    contenido = txbContenido.Text,
                    imagen = txbImagen.Text,
                    usuario_instructor = getIdCarne(txbCarne.Text),
                });

                db.SaveChanges();

                idCarta = (from carta in db.Cartas
                           select carta.id_carta).Take(1).SingleOrDefault();
            }
            else
            {
                return;
            }

            int idSalon = Int32.Parse(DDLSalon.SelectedValue);
            int idCurso = Int32.Parse(DDLCurso.SelectedValue);

            ModelDatabase dataBase = new ModelDatabase();

            Actividad actividadNueva = new Actividad()
            {
                nombre = nombre,
                tipo = ListTipo.SelectedItem.Text,
                fecha_incio = inicio,
                fecha_final = fin,
                presentacion = "vacio",
                cuestionario = "vacio",
                codigo_qr = Lector.LectorDeArchivos.RandomString(8),
                carta_id_carta = idCarta,
                salon_id_salon = idSalon,
                curso_id_curso = idCurso
            };

            IQueryable<Actividad> actividadsTraslapadas = Validacion.IsActividadDisponible(actividadNueva, dataBase.Actividads);

            if (actividadsTraslapadas.Any())
            {
                Actividad actividadTraslapada = actividadsTraslapadas.Take(1).First();
                FailureText.Text = "La nueva actividad se traslapa con: "+actividadTraslapada.nombre;
                return;
            }

            dataBase.Actividads.Add(actividadNueva);


            dataBase.SaveChanges();

            dataBase = new ModelDatabase();

            int idActividad = (from ac in dataBase.Actividads
                              select ac.id_actividad).Take(1).SingleOrDefault();
            int idInstructor = getIdInstructorDeCarta(idCarta, dataBase);

            dataBase.Matriculas.Add(new Matricula {
                asistencia = "inst_pen",
                respuestas_cuestionario = null,
                usuario_estudiante = idInstructor,
                actividad_id_actividad = idActividad
            });

            dataBase.SaveChanges();

            if (Request.QueryString["idSalon"] != "" || Request.QueryString["date"] != "" || Request.QueryString["idSalon"] != null || Request.QueryString["date"] != null)
            {
                Response.Redirect(Request.UrlReferrer.ToString());
            }
        }

        private int getIdInstructorDeCarta(int idCarta, ModelDatabase dataBase)
        {
            int id_us = (from car in dataBase.Cartas
                         join us in dataBase.Usuarios on car.usuario_instructor equals us.id_usuario
                         where car.id_carta == idCarta
                         select us.id_usuario).FirstOrDefault();

            return id_us;
        }

        private int getIdCurso(string text)
        {
            ModelDatabase db = new ModelDatabase();

            int id_curso = (from c in db.Cursoes
                              where c.nombre == text
                              select c.id_curso).FirstOrDefault();

            return id_curso;
        }

        private int getIdSalon(string nombre, string edificio)
        {
            ModelDatabase db = new ModelDatabase();

            int id_salon = (from s in db.Salons
                              where s.nombre == nombre && s.edificio == edificio
                              select s.id_salon).FirstOrDefault();

            return id_salon;
        }

        private int getIdCarne(string text)
        {
            ModelDatabase db = new ModelDatabase();

            int id_usuario = (from u in db.Usuarios
                          where u.carne == text
                          select u.id_usuario).FirstOrDefault();

            return id_usuario;
        }

        protected void idCarta_Click(object sender, EventArgs e)
        {
            MultiViewCarta.ActiveViewIndex = 0;
        }

        protected void nuevaCarta_Click(object sender, EventArgs e)
        {
            MultiViewCarta.ActiveViewIndex = 1;
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/");
        }

        protected void CalendarFecha_SelectionChanged(object sender, EventArgs e)
        {
            TBFecha.Text = CalendarFecha.SelectedDate.ToString("dd/MM/yyyy");
        }
    }
}