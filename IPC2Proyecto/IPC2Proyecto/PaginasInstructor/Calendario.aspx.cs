using IPC2Proyecto.Models.MyModels;
using IPC2Proyecto.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace IPC2Proyecto.PaginasInstructor
{
    public partial class Calendario : System.Web.UI.Page
    {
        IQueryable<Actividad> actividads;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.Cookies.Get("usuario").Values["tipo"] != "instructor" || Request.Cookies.Get("usuario").Values["tipo"] == null)
            {
                if (Request.Cookies.Get("usuario").Values["tipo"] == "admin")
                {
                    return;
                }
                Response.Redirect("~/Login");
            }
        }

        int idUsuario = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            idUsuario = Int32.Parse(Request.Cookies["usuario"].Values["id_usuario"]);

            ModelDatabase db = new ModelDatabase();

            /*SELECT Actividad.id_actividad 
            FROM Actividad INNER JOIN Matricula ON Actividad.id_actividad=Matricula.id_actividad
            INNER JOIN  Usuario ON Usuario.id_usuario = Matricula.id_usuario
            WHERE Usuario.id_usuario=@IdUsuario*/
            actividads = from acti in db.Actividads
                         join mat in db.Matriculas on acti.id_actividad equals mat.actividad_id_actividad
                         join us in db.Usuarios on mat.usuario_estudiante equals us.id_usuario
                         where us.id_usuario == idUsuario
                         select acti;
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

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DateTime dia = Calendar1.SelectedDate;
            DateTime dia2 = dia.AddDays(1);

            /*SELECT * 
            FROM Actividad
            WHERE fecha_inicio>@dia && fecha_final <@dia2
            ORDER BY fecha_inicio ASC*/
            IQueryable<Actividad> actividadsDelDia = from a in actividads
                                                     where a.fecha_incio > dia && a.fecha_final < dia2
                                                     orderby a.fecha_incio ascending
                                                     select a;

            generateRowsAndCells(dia, actividadsDelDia.ToList());
        }

        private void generateRowsAndCells(DateTime day, List<Actividad> actis)
        {
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
                btn.Text = "DISPONIBLE";
                btn.ForeColor = Color.FromArgb(204, 204, 204);
                btn.Enabled = false;
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
                btn.PostBackUrl = "~/PaginasInstructor/EditarActividad.aspx?idActividad=" + a.id_actividad.ToString();

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