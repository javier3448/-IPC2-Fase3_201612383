using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IPC2Proyecto.Models.MyModels;
using IPC2Proyecto.Models;
using System.Drawing;

namespace IPC2Proyecto.PaginasOperador
{
    public partial class Calendario : System.Web.UI.Page
    {
        IQueryable<Actividad> actividads;

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

        int idSalon = 2;

        protected void Page_Load(object sender, EventArgs e)
        {
            bool b = Int32.TryParse(DropDownList1.SelectedValue, out idSalon);
            if (!b)
            {
                idSalon = 2;
            }

            ModelDatabase db = new ModelDatabase();

            /*SELECT Actividad.id_actividad 
            FROM Actividad INNER JOIN Salon ON Actividad.salon_id_salon=Salon.id_salon
            WHERE s.id_salon=@IdSalon*/
            actividads = from a in db.Actividads
                         join s in db.Salons on a.salon_id_salon equals s.id_salon
                         where s.id_salon == idSalon
                         select a;
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            foreach (Actividad a in actividads)
            {
                DateTime diaActual = e.Day.Date;
                DateTime inicioActividad = a.fecha_incio;
                DateTime finActividad = a.fecha_final;
                if (DateTime.Compare(inicioActividad, diaActual) > 0 && DateTime.Compare(finActividad, diaActual.AddDays(1)) < 0)
                {
                    e.Cell.BackColor = Color.FromArgb(111, 180, 183);
                    break;
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            idSalon = Int32.Parse(DropDownList1.SelectedValue);

            ModelDatabase db = new ModelDatabase();

            /*SELECT Actividad.id_actividad 
            FROM Actividad INNER JOIN Salon ON Actividad.salon_id_salon=Salon.id_salon
            WHERE s.id_salon=@IdSalon*/
            actividads = from a in db.Actividads
                         join s in db.Salons on a.salon_id_salon equals s.id_salon
                         where s.id_salon == idSalon
                         select a;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DateTime dia = Calendar1.SelectedDate;
            DateTime dia2 = dia.AddDays(1);

            /*SELECT * 
            FROM Actividad
            WHERE fecha_incio>@dia AND fecha_final<@dia2*/
            IQueryable<Actividad> actividadsDelDia = from a in actividads
                                                     where a.fecha_incio > dia && a.fecha_final < dia2
                                                     orderby a.fecha_incio ascending
                                                     select a;

            generateRowsAndCells(dia, actividadsDelDia.ToList());
        }

        private void generateRowsAndCells(DateTime day, List<Actividad> actis)
        {
            int idSalon = Int32.Parse(DropDownList1.SelectedValue);

            DateTime dateTime = day.AddHours(7);
            DateTime[] horas = new DateTime[30];
            int numrows = 30;
            for (int j = 0; j < numrows; j++)
            {
                TableRow r = new TableRow();
                TableCell c0 = new TableCell();
                TableCell c1 = new TableCell();
                c0.ForeColor = Color.White;
                c0.Controls.Add(new LiteralControl(dateTime.AddMinutes(-30).ToString("HH:mm:ss")));
                c0.BorderStyle = BorderStyle.Solid;
                c0.BorderColor = Color.Black;
                c0.BackColor = Color.FromArgb(51, 51, 153);
                LinkButton btn = new LinkButton();
                btn.Text = "Reservar";
                btn.PostBackUrl = "~/PaginasOperador/NuevaActividad.aspx?idSalon="+idSalon.ToString()+
                                  "&date="+ dateTime.AddMinutes(-30).ToString("yyyy/MM/dd HH:mm:ss");
                c1.Controls.Add(btn);
                c1.BorderStyle = BorderStyle.Solid;
                c1.BorderColor = Color.Black;
                c1.BackColor = Color.FromArgb(204, 204, 204);
                c1.VerticalAlign = VerticalAlign.Middle;
                r.Cells.Add(c0);
                r.Cells.Add(c1);
                Table1.Rows.Add(r);
                horas[j] = dateTime;
                dateTime = dateTime.AddMinutes(30);
            }

            /*Loop para la hora de inicio*/
            int longitudCelda = 0;
            int horaInicioDeLoop = 0;
            int horaInicio = 0;
            int horaFinal = 0;
            foreach (Actividad a in actis)
            {
                longitudCelda = 0;
                horaInicio = 0;
                horaFinal = 0;
                for (int i = horaInicioDeLoop; i < horas.Length; i++)
                {
                    horaInicio++;
                    if (a.fecha_incio <= horas[i])
                    {
                        horaInicio--;
                        if (a.fecha_final <= horas[i])
                        {
                            horaInicio++;
                            horaFinal = i;
                            break;
                        }
                        longitudCelda++;
                    }

                }

                if (longitudCelda == 0)
                {
                    break;
                }

                LinkButton btn = new LinkButton();
                btn.Text = a.nombre;
                btn.ForeColor = Color.White;
                btn.PostBackUrl = "~/PaginasOperador/EditarActividad.aspx?idActividad=" + a.id_actividad.ToString();

                for (int e = horaInicio + 1; e <= horaFinal; e++)
                {
                    Table1.Rows[e].Cells.RemoveAt(1);
                }
                Table1.Rows[horaInicio].Cells[1].RowSpan = longitudCelda;
                Table1.Rows[horaInicio].Cells[1].BackColor = Color.Blue;
                Table1.Rows[horaInicio].Cells[1].HorizontalAlign = HorizontalAlign.Center;
                Table1.Rows[horaInicio].Cells[1].VerticalAlign = VerticalAlign.Middle;
                Table1.Rows[horaInicio].Cells[1].Controls.Clear();

                Table1.Rows[horaInicio].Cells[1].Controls.Add(btn);

                longitudCelda = 0;
                horaInicio = 0;
                horaFinal = 0;
            }
        }
    }
}