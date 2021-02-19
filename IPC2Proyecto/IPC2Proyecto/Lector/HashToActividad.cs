using IPC2Proyecto.Models.MyModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IPC2Proyecto.Lector
{
    public static class HashToActividad
    {
        public static string GetNombre(string hash) {
            return hash.Split(',')[0];
        }

        public static DateTime GetDateInicial(string hash) {
            string date = hash.Split(',')[1];
            string horaInicio = hash.Split(',')[2];

            return DateTime.ParseExact(date + " " + horaInicio, "dd/MM/yyyy HH:mm", System.Globalization.CultureInfo.InvariantCulture);
        }

        public static DateTime GetDateFinal(string hash)
        {
            string date = hash.Split(',')[1];
            string horaInicio = hash.Split(',')[3];

            return DateTime.ParseExact(date + " " + horaInicio, "dd/MM/yyyy HH:mm", System.Globalization.CultureInfo.InvariantCulture);
        }

        public static int GetIdSalon(string hash) {
            char[] c = { ',' };
            string s = hash.Split(c)[4];
            return Int32.Parse(s);
        }

        public static Salon GetSalon(string hash)
        {
            int id = GetIdSalon(hash);

            ModelDatabase db = new ModelDatabase();

            Salon salon = (from c in db.Salons
                           where c.id_salon == id
                           select c).Take(1).First();

            return salon;
        }
    }
}