using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IPC2Proyecto.Lector;
using IPC2Proyecto.Models.MyModels;

namespace IPC2Proyecto.PaginasOperador
{
    public partial class NuevoCurso : System.Web.UI.Page
    {
        Carta carta;
        Curso curso;
        ModelDatabase db;
        /*ViewStates: IsCursoCreado, IdCarta, IdCurso, InicioCurso, FinalCurso (dd/MM/yyyy), ActividadesDeCurso*/
        
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitViewState();
            }

            db = new ModelDatabase();

            int IdCarta = (int)ViewState["IdCarta"];
            if (IdCarta!=0)
            {
                /*SELECT * 
                 FROM Carta
                 WHERE id_carta=@IdCarta*/
                carta = (from c in db.Cartas
                         where c.id_carta == IdCarta
                         select c).Take(1).First();
            }

            int IdCurso = (int)ViewState["IdCurso"];
            if (IdCurso != 0)
            {
                /*SELECT * 
                 FROM Curso
                 WHERE id_curso=@IdCurso*/
                curso = (from c in db.Cursoes
                         where c.id_curso==IdCurso
                         select c).Take(1).First();
            }

            String ActividadesDeCurso = (String)ViewState["ActividadesDeCurso"];
            if (ActividadesDeCurso.Length>0)
            {
                InitTable(Curso.TipoDeCiclo.semanal.ToString());
            }
        }

        private void InitViewState()
        {
            ViewState["IdCarta"] = 0;
            
            ViewState["IdCurso"] = 0;
            
            ViewState["ActividadesDeCurso"] = "";

            ViewState["IsCursoCreado"] = false;
        }

        private void vaciarTablaActividades()
        {
            ViewState["ActividadesDeCurso"]="";
            Table1.Controls.Clear();
        }
        

        protected void CalendarInicial_SelectionChanged(object sender, EventArgs e)
        {
            SetSelectedDate(0);
        }

        protected void CalendarFinal_SelectionChanged(object sender, EventArgs e)
        {
            SetSelectedDate(1);
        }

        /// <summary>
        /// Ingresa el dia seleccionado en los textbox
        /// </summary>
        /// <param name="n">si es 0, lo hace en TBInicial, si es 1 lo hace en el final, si no es ninguno lo hace el de actividad</param>
        private void SetSelectedDate(int n)
        {
            if (n == 0)
            {
                TBDateInicial.Text = CalendarInicial.SelectedDate.ToString();
            }
            else if (n == 1)
            {
                TBDateFinal.Text = CalendarFinal.SelectedDate.ToString();
            }
            else
            {

            }
        }

        private bool RevisarCamposCurso()
        {
            if (TBNombre.Text == "")
            {
                FailureText.Text = "nombre no valido";
                return false;
            }
            else if (TBDateInicial.Text == "" || TBDateFinal.Text == "")
            {
                FailureText.Text = "Fechas de curso no validas";
                return false;
            }
            //id
            if (MultiViewCarta.ActiveViewIndex==0)
            {
                if (!Validacion.isTBCarta(TBIdCarta))
                {
                    FailureText.Text = "Id de carta no valido";
                    return false;
                }
            }
            //nueva carta
            else if (MultiViewCarta.ActiveViewIndex==1)
            {
                if (TBAsunto.Text=="")
                {
                    FailureText.Text = "asunto no valido";
                    return false;
                }
                else if (TBContenido.Text=="")
                {
                    FailureText.Text = "contenido no valido";
                    return false;
                }
                else if (TBImagen.Text == "")
                {
                    FailureText.Text = "Imagen no valida";
                    return false;
                }
                else if (Validacion.isCarne(TBCarne.Text)==0)
                {
                    FailureText.Text = "carne no existente";
                    return false;
                }
            }
            else if (MultiViewCarta.ActiveViewIndex==2)
            {
                FailureText.Text = "Carta no seleccionada";
                return false;
            }
            return true;
        }

        



        private void AgregarActividadMensual()
        {
            
        }

        private void AgregarActividadAnual()
        {
            
        }

        private void getProbs(double p, int n)
        {
            double ventaja = getVentaja(p,n);
            double desventaja = getDesventaja(p, n);

            FailureText.Text ="ventaja: "+ventaja.ToString() +". desventaja: "+desventaja.ToString();
        }

        private double getVentaja(double p, int n)
        {
            double q = 1 - p;

            double pxPyAcumulado = 0;
            for (int x = 0; x <= n - 1; x++)
            {
                double px = LectorDeArchivos.nCr(n - 1, x) * Math.Pow(p, x) * Math.Pow(q, n - 1 - x);

                double pyAcumulada = 0;
                for (int y = 0; y <= x; y++)
                {
                    double py = LectorDeArchivos.nCr(n,y)* Math.Pow(p, y) * Math.Pow(q, n - y);
                    pyAcumulada += py;
                }
                px = px * pyAcumulada;
                pxPyAcumulado += px;
            }

            return pxPyAcumulado;
        }

        private double getDesventaja(double p, int n)
        {
            double q = 1 - p;

            double pxPyAcumulado = 0;
            for (int y = 2; y <= n; y++)
            {
                double py = LectorDeArchivos.nCr(n, y) * Math.Pow(p, y) * Math.Pow(q, n - y);

                double pxAcumulada = 0;
                for (int x = 0; x <= y - 2; x++)
                {
                    double px = LectorDeArchivos.nCr(n - 1, x) * Math.Pow(p, x) * Math.Pow(q, n - 1 - x);
                    pxAcumulada += px;
                }
                py = py * pxAcumulada;
                pxPyAcumulado += py;
            }

            return pxPyAcumulado;
        }

        

        protected void idCarta_Click(object sender, EventArgs e)
        {
            MultiViewCarta.ActiveViewIndex = 0;
        }

        protected void nuevaCarta_Click(object sender, EventArgs e)
        {
            MultiViewCarta.ActiveViewIndex = 1;
        }

        protected void Aceptar_Click(object sender, EventArgs e)
        {
            if (!RevisarCamposCurso())
            {
                return;
            }

            ViewState["InicioCurso"] = CalendarInicial.SelectedDate.ToString("dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            ViewState["FinalCurso"] = CalendarFinal.SelectedDate.ToString("dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);

            CrearCarta();

            CrearCurso();

            DeshabilitarCamposDeCurso();

            ViewState["IsCursoCreado"] = true;
        }

        private void CrearCurso()
        {
            Curso cursoLocal = new Curso() {
                nombre = TBNombre.Text,
                ciclo = DDLCiclo.Text,
                fecha_incio = CalendarInicial.SelectedDate,
                fecha_final = CalendarFinal.SelectedDate,
            };

            db = new ModelDatabase();
            db.Cursoes.Add(cursoLocal);

            db.SaveChanges();

            /*SELECT TOP(1) * FROM Curso ORDER BY id ASC*/
            curso = (from c in db.Cursoes
                     select c).ToList().Last();

            ViewState["IdCurso"] = curso.id_curso;
        }

        private void CrearCarta()
        {
            db = new ModelDatabase();

            //id
            if (MultiViewCarta.ActiveViewIndex==0)
            {
                int id=Int32.Parse(TBIdCarta.Text);

                /*SELECT * 
                 FROM Carta
                 WHERE id_carta=@IdCarta*/
                carta = (from c in db.Cartas
                         where c.id_carta == id
                         select c).Take(1).First();

                ViewState["IdCarta"] = carta.id_carta;
            }
            //Nueva carta
            else if (MultiViewCarta.ActiveViewIndex==1)
            {
                Carta localCarta = new Carta() {
                    asunto = TBAsunto.Text,
                    contenido = TBContenido.Text,
                    usuario_instructor = Validacion.isCarne(TBCarne.Text),
                    imagen = TBImagen.Text
                };

                db.Cartas.Add(localCarta);

                db.SaveChanges();

                /*SELECT TOP(1) * FROM Carta ORDER BY id ASC*/
                carta = (from c in db.Cartas
                         select c).ToList().Last();

                ViewState["IdCarta"] = carta.id_carta;
            }
        }

        private void DeshabilitarCamposDeCurso()
        {
            TBNombre.ReadOnly = true;
            CalendarInicial.Enabled = false;
            CalendarFinal.Enabled = false;
            DDLCiclo.Enabled = false;
            TBIdCarta.ReadOnly = true;
            TBAsunto.ReadOnly = true;
            TBContenido.ReadOnly = true;
            TBImagen.ReadOnly = true;
            TBCarne.ReadOnly = true;
        }

        protected void GenerarActividades_Click(object sender, EventArgs e)
        {
            string StringActividadesDeCurso = (string)ViewState["ActividadesDeCurso"];
            char[] c = { ';' };
            string[] ActividadesDeCurso = StringActividadesDeCurso.Split(c, StringSplitOptions.RemoveEmptyEntries);
            string stringActividadesConTraslape = ""; 
            db = new ModelDatabase();

            bool isActividadesDeCursoValidas = true;
            if (DDLCiclo.SelectedIndex==0)
            {
                foreach (string hash in ActividadesDeCurso) {
                    int idSalon = HashToActividad.GetIdSalon(hash);
                    DateTime inicioActividad = HashToActividad.GetDateInicial(hash);
                    DateTime finalActividad = HashToActividad.GetDateFinal(hash);

                    String stringFinalCurso = (String)ViewState["FinalCurso"];
                    DateTime finalCurso = DateTime.ParseExact(stringFinalCurso,"dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);

                    int i = 1;
                    while (DateTime.Compare(inicioActividad, finalCurso)<0)
                    {
                        db = new ModelDatabase();

                        Actividad actividadNueva = new Actividad()
                        {
                            nombre = HashToActividad.GetNombre(hash)+"numero:"+i.ToString(),
                            tipo = "curso",
                            fecha_incio = inicioActividad,
                            fecha_final = finalActividad,
                            codigo_qr = LectorDeArchivos.RandomString(8),
                            carta_id_carta = carta.id_carta,
                            salon_id_salon = idSalon,
                            curso_id_curso = curso.id_curso
                        };

                        IQueryable<Actividad> actividadsTraslapadas = Validacion.IsActividadDisponible(actividadNueva, db.Actividads);
                        
                        if (actividadsTraslapadas.Any())
                        {
                            Actividad actividadTraslapada = actividadsTraslapadas.Take(1).First();

                            stringActividadesConTraslape += actividadNueva.nombre + "," + actividadTraslapada.id_actividad.ToString() + ";";

                            isActividadesDeCursoValidas = false;
                        }
                        else
                        {
                            db.Actividads.Add(actividadNueva);

                            db.SaveChanges();
                        }

                        inicioActividad = inicioActividad.AddDays(7);
                        finalActividad = finalActividad.AddDays(7);

                        i++;
                    }
                }

                if (!isActividadesDeCursoValidas)
                {
                    Response.Redirect("~/PaginasOperador/EditarCurso?id_curso=" + curso.id_curso.ToString() +
                                      "&Traslapes="+Server.UrlEncode(stringActividadesConTraslape));
                    return;
                }

                Response.Redirect("~/PaginasOperador/EditarCurso?id_curso=" + curso.id_curso.ToString());
            }
        }

        protected void CancelarActividades_Click(object sender, EventArgs e)
        {

        }


        protected void RBLunes_CheckedChanged(object sender, EventArgs e)
        {
            RBMartes.Checked = false;
            RBMiercoles.Checked = false;
            RBJueves.Checked = false;
            RBViernes.Checked = false;
            RBSabado.Checked = false;
            RBDomingo.Checked = false;
        }

        protected void RBMartes_CheckedChanged(object sender, EventArgs e)
        {
            RBLunes.Checked = false;
            RBMiercoles.Checked = false;
            RBJueves.Checked = false;
            RBViernes.Checked = false;
            RBSabado.Checked = false;
            RBDomingo.Checked = false;
        }

        protected void RBMiercoles_CheckedChanged(object sender, EventArgs e)
        {
            RBLunes.Checked = false;
            RBMartes.Checked = false;
            RBJueves.Checked = false;
            RBViernes.Checked = false;
            RBSabado.Checked = false;
            RBDomingo.Checked = false;
        }

        protected void RBJueves_CheckedChanged(object sender, EventArgs e)
        {
            RBLunes.Checked = false;
            RBMartes.Checked = false;
            RBMiercoles.Checked = false;
            RBViernes.Checked = false;
            RBSabado.Checked = false;
            RBDomingo.Checked = false;
        }

        protected void RBViernes_CheckedChanged(object sender, EventArgs e)
        {
            RBLunes.Checked = false;
            RBMartes.Checked = false;
            RBMiercoles.Checked = false;
            RBJueves.Checked = false;
            RBSabado.Checked = false;
            RBDomingo.Checked = false;
        }

        protected void RBSabado_CheckedChanged(object sender, EventArgs e)
        {
            RBLunes.Checked = false;
            RBMartes.Checked = false;
            RBMiercoles.Checked = false;
            RBJueves.Checked = false;
            RBViernes.Checked = false;
            RBDomingo.Checked = false;
        }

        protected void RBDomingo_CheckedChanged(object sender, EventArgs e)
        {
            RBLunes.Checked = false;
            RBMartes.Checked = false;
            RBMiercoles.Checked = false;
            RBJueves.Checked = false;
            RBViernes.Checked = false;
            RBSabado.Checked = false;
        }

        protected void CalendarActividad_SelectionChanged(object sender, EventArgs e)
        {

        }

        private void InitTable(string tipoDeCiclo)
        {
            Table1.Controls.Clear();
            if (tipoDeCiclo == Curso.TipoDeCiclo.semanal.ToString())
            {
                TableRow row = new TableRow();
                TableCell c0 = new TableCell();
                c0.Font.Size = FontUnit.Large;
                c0.Font.Bold = true;
                c0.Controls.Add(new LiteralControl("Nombre"));
                c0.BorderStyle = BorderStyle.Solid;
                c0.BorderColor = Color.Black;
                c0.BackColor = Color.FromArgb(140, 225, 250);
                TableCell c1 = new TableCell();
                c1.Font.Bold = true;
                c1.Font.Size = FontUnit.Large;
                c1.Controls.Add(new LiteralControl("Salon"));
                c1.BorderStyle = BorderStyle.Solid;
                c1.BorderColor = Color.Black;
                c1.BackColor = Color.FromArgb(140, 225, 250);
                TableCell c2 = new TableCell();
                c2.Font.Bold = true;
                c2.Font.Size = FontUnit.Large;
                c2.Controls.Add(new LiteralControl("Dia"));
                c2.BorderStyle = BorderStyle.Solid;
                c2.BorderColor = Color.Black;
                c2.BackColor = Color.FromArgb(140, 225, 250);
                TableCell c3 = new TableCell();
                c3.Font.Size = FontUnit.Large;
                c3.Font.Bold = true;
                c3.Controls.Add(new LiteralControl("Hora"));
                c3.BorderStyle = BorderStyle.Solid;
                c3.BorderColor = Color.Black;
                c3.BackColor = Color.FromArgb(140, 225, 250);
                row.Cells.Add(c0);
                row.Cells.Add(c1);
                row.Cells.Add(c2);
                row.Cells.Add(c3);
                Table1.Rows.Add(row);

                string StringActividadesDeCurso = (string)ViewState["ActividadesDeCurso"];

                char[] c = { ';' };

                string[] ActividadesDeCurso = StringActividadesDeCurso.Split(c,StringSplitOptions.RemoveEmptyEntries);
                
                foreach (string hashActividad in ActividadesDeCurso)
                {
                    TableRow row0 = new TableRow();
                    TableCell c00 = new TableCell();
                    c00.Font.Size = FontUnit.Small;
                    c00.Controls.Add(new LiteralControl(HashToActividad.GetNombre(hashActividad)));
                    c00.BorderStyle = BorderStyle.Solid;
                    c00.BorderColor = Color.Black;
                    c00.BackColor = Color.White;

                    TableCell c11 = new TableCell();
                    c11.Font.Size = FontUnit.Small;
                    c11.Controls.Add(new LiteralControl(HashToActividad.GetSalon(hashActividad).nombre));
                    c11.BorderStyle = BorderStyle.Solid;
                    c11.BorderColor = Color.Black;
                    c11.BackColor = Color.White;

                    DateTime inicioActividad = HashToActividad.GetDateInicial(hashActividad);
                    DateTime finActividad = HashToActividad.GetDateFinal(hashActividad);
                    TableCell c22 = new TableCell();
                    c22.Font.Size = FontUnit.Small;
                    c22.Controls.Add(new LiteralControl(inicioActividad.DayOfWeek.ToString()));
                    c22.BorderStyle = BorderStyle.Solid;
                    c22.BorderColor = Color.Black;
                    c22.BackColor = Color.White;

                    TableCell c33 = new TableCell();
                    c33.Font.Size = FontUnit.Small;
                    c33.Controls.Add(new LiteralControl(inicioActividad.ToString("HH:mm") + "-" + finActividad.ToString("HH:mm")));
                    c33.BorderStyle = BorderStyle.Solid;
                    c33.BorderColor = Color.Black;
                    c33.BackColor = Color.White;
                    row0.Cells.Add(c00);
                    row0.Cells.Add(c11);
                    row0.Cells.Add(c22);
                    row0.Cells.Add(c33);
                    Table1.Rows.Add(row0);
                }
            }


        }

        private void vaciarControlesActividad()
        {
            RBLunes.Checked = false;
            RBMartes.Checked = false;
            RBMiercoles.Checked = false;
            RBJueves.Checked = false;
            RBViernes.Checked = false;
            RBSabado.Checked = false;
            RBDomingo.Checked = false;

            TBDia.Text = "";
            TBDateActividad.Text = "";
            TBHoraInicio.Text = "";
            TBHoraFinal.Text = "";
            TBNombreActividad.Text = "";
        }


        protected void Agregar_Click(object sender, EventArgs e)
        {
            bool IsCursoCreado = (bool)ViewState["IsCursoCreado"];
            if (!IsCursoCreado)
            {
                FailureText.Text = "Crear el curso primero";
                return;
            }

            AgregarActividadSemanal();

            InitTable(Curso.TipoDeCiclo.semanal.ToString());
        }
        private void AgregarActividadSemanal()
        {
            if (!RevisarActividad(0))
            {
                return;
            }

            String InicioCurso = (String)ViewState["InicioCurso"];
            String FinCurso = (String)ViewState["FinalCurso"];
            DateTime inicioActividad = DateTime.ParseExact(InicioCurso + " " + TBHoraInicio.Text, "dd/MM/yyyy HH:mm",System.Globalization.CultureInfo.InvariantCulture);
            DateTime finalActividad = DateTime.ParseExact(FinCurso + " " + TBHoraFinal.Text, "dd/MM/yyyy HH:mm", System.Globalization.CultureInfo.InvariantCulture);

            DayOfWeek dayOfWeek = getDayOfTheWeek();

            bool b = true;
            while (b)
            {
                if (inicioActividad.DayOfWeek != dayOfWeek)
                {
                    inicioActividad = inicioActividad.AddDays(1);
                    finalActividad = finalActividad.AddDays(1);
                }
                else
                {
                    b = false;
                }
            }

            /*Construir el hash de la nueva actividad y agregarlo al ViewState["ActividadesDeCurso"]*/
            string nombre = TBNombreActividad.Text;
            string date = inicioActividad.ToString("dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            string horaInicial = inicioActividad.ToString("HH:mm", System.Globalization.CultureInfo.InvariantCulture);
            string horaFinal = finalActividad.ToString("HH:mm", System.Globalization.CultureInfo.InvariantCulture);
            string idSalon = DDLSalon.SelectedValue;

            String ActividadesDeCurso = (String)ViewState["ActividadesDeCurso"];
            ActividadesDeCurso += nombre+","+date+","+horaInicial+","+horaFinal+","+idSalon+";";

            ViewState["ActividadesDeCurso"] = ActividadesDeCurso;

            FailureText.Text = (string)ViewState["ActividadesDeCurso"]; 

            vaciarControlesActividad();
        }

        private DayOfWeek getDayOfTheWeek()
        {
            if (RBDomingo.Checked)
            {
                return DayOfWeek.Sunday;
            }
            else if (RBLunes.Checked)
            {
                return DayOfWeek.Monday;
            }
            else if (RBMartes.Checked)
            {
                return DayOfWeek.Tuesday;
            }
            else if (RBMiercoles.Checked)
            {
                return DayOfWeek.Wednesday;
            }
            else if (RBJueves.Checked)
            {
                return DayOfWeek.Thursday;
            }
            else if (RBViernes.Checked)
            {
                return DayOfWeek.Friday;
            }
            else if (RBSabado.Checked)
            {
                return DayOfWeek.Saturday;
            }
            return DayOfWeek.Monday;
        }


        private bool RevisarActividad(int tipoDeCiclo)
        {
            if (tipoDeCiclo == 0)
            {
                if (TBNombreActividad.Text == "")
                {
                    FailureText.Text = "Nombre no vaido";
                    return false;
                }
                else if (RBDomingo.Checked == false && RBLunes.Checked == false && RBMartes.Checked == false && RBMiercoles.Checked == false &&
                         RBJueves.Checked == false && RBViernes.Checked == false && RBSabado.Checked == false && RBDomingo.Checked == false)
                {
                    FailureText.Text = "Seleccione el dia de la semana";
                    return false;
                }
                else if (!Validacion.isTBHour(TBHoraInicio) || !Validacion.isTBHour(TBHoraFinal))
                {
                    FailureText.Text = "Hora  de inicio no vaida";
                    return false;
                }
            }
            return true;
        }

        protected void DDLCiclo_SelectedIndexChanged(object sender, EventArgs e)
        {
            vaciarControlesActividad();
            vaciarTablaActividades();
        }

        protected void DDLSalon_SelectedIndexChanged(object sender, EventArgs e)
        {
            FailureText.Text = DDLSalon.SelectedValue;
        }
    }
    
    
}