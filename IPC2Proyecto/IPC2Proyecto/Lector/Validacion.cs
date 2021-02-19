using IPC2Proyecto.Models.MyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace IPC2Proyecto
{
    public static class Validacion
    {
        public enum IsActividadDisponibleOptions
        {
            IgnorarSalon
        }

        /// <summary>
        /// Revisa si existe una actividad en db que se traslape con @actividad, no se considera como traslape si la actividad toma lugar en un salon distinto
        /// </summary>
        /// <param name="actividad">actividad a ingresar en la base de datos</param>
        /// <param name="db">Actividades a revisar</param>
        /// <returns>Retorna las actividades con las que hay traslape</returns>
        public static IQueryable<Actividad> IsActividadDisponible(Actividad actividad, IQueryable<Actividad> db)
        {
            DateTime inicio = actividad.fecha_incio;
            DateTime final = actividad.fecha_final;

            IQueryable<Actividad> actividadTraslapada = from a in db
                                                        where ((inicio >= a.fecha_incio && inicio <= a.fecha_final)
                                                        ||
                                                        (final >= a.fecha_incio && final <= a.fecha_final))
                                                        &&
                                                        a.salon_id_salon == actividad.salon_id_salon
                                                        select a;

            return actividadTraslapada;
        }

        /// <summary>
        /// Revisa si existe una actividad en db que se traslape con @actividad, se considera traslape aunque la actividad tome luggar en otro salon
        /// </summary>
        /// <param name="actividad">actividad a ingresar en la base de datos</param>
        /// <param name="db">Actividades a revisar</param>
        /// <returns>Retorna las actividades con las que hay traslape</returns>
        public static IQueryable<Actividad> IsActividadDisponible(Actividad actividad, IQueryable<Actividad> db, IsActividadDisponibleOptions options)
        {
            DateTime inicio = actividad.fecha_incio;
            DateTime final = actividad.fecha_final;

            IQueryable<Actividad> actividadTraslapada = from a in db
                                                        where (inicio >= a.fecha_incio && inicio <= a.fecha_final)
                                                        ||
                                                        (final >= a.fecha_incio && final <= a.fecha_final)
                                                        select a;

            return actividadTraslapada;
        }

        /// <summary>
        /// Revisa si existe una actividad en db que se traslape con cualquier actividad en actividades
        /// </summary>
        /// <param name="actividades">Actividade a ser matriculadas en una misma asignacion</param>
        /// <param name="db">actividades del estudiante</param>
        /// <returns></returns>
        public static IQueryable<Actividad> IsActividadDisponible(IQueryable<Actividad> actividades, IQueryable<Actividad> actividadesDeEstudiante)
        {
            IQueryable<Actividad> actividadesTraslapadas = Enumerable.Empty<Actividad>().AsQueryable();

            foreach (Actividad actividad in actividades)
            {
                foreach (Actividad actividadDeEstudiante in actividadesDeEstudiante)
                {
                    if (actividad.id_actividad == actividadDeEstudiante.id_actividad)
                    {
                        actividadesTraslapadas.Concat(new Actividad[] { actividad });
                    }
                }
            }

            return actividadesTraslapadas;
        }

        public static bool isTBInt(TextBox textBox) {
            int i;
            return Int32.TryParse(textBox.Text, out i);
        }

        public static bool isTBHour(TextBox tBHoraInicio)
        {
            string[] s = tBHoraInicio.Text.Split(':');

            if (s.Length!=2)
            {
                return false;
            }

            int hora, minuto;
            bool bHora = Int32.TryParse(s[0], out hora);
            bool bMinuto = Int32.TryParse(s[1], out minuto);

            if (!bHora||!bMinuto)
            {
                return false;
            }

            if (hora>=24||hora<0||minuto>=60||minuto<0)
            {
                return false;
            }

            return true;
        }

        public static bool isTBCarta(TextBox tBIdCarta)
        {
            int id;
            bool b = Int32.TryParse(tBIdCarta.Text, out id);

            if (!b)
            {
                return false;
            }

            ModelDatabase db = new ModelDatabase();

            Carta carta = (from c in db.Cartas
                          where c.id_carta==id
                          select c).Take(1).First();

            if (carta==null)
            {
                return false;
            }


            return true;
        }

        /// <summary>
        /// retorna el id de usuario con carne igual al parametro carne
        /// </summary>
        /// <param name="carne">carne</param>
        /// <returns>0 si no existe el un usuario con ese carne</returns>
        public static int isCarne(string carne)
        {
            ModelDatabase db = new ModelDatabase();

            Usuario usuario = (from u in db.Usuarios
                         where u.carne == carne
                         select u).Take(1).First();

            if (usuario==null)
            {
                return 0;
            }

            return usuario.id_usuario;
        }
    }
}