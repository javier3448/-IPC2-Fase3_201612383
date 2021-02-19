using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IPC2Proyecto.Models.MyModels;

namespace IPC2Proyecto.PaginasAdmin
{
    public partial class CargaMasiva : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e) {
            if (Request.Cookies.Get("usuario").Values["tipo"] != "admin" || Request.Cookies.Get("usuario").Values["tipo"] == null)
            {
                Response.Redirect("~/Login");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        

        protected void Aceptar_Click(object sender, EventArgs e)
        {
            List<String> lineas = Lector.LectorDeArchivos.Leer(TextBoxArchivo.Text);

            List<String[]> valores = Lector.LectorDeArchivos.Separar(lineas);

            if (DropDownTabla.SelectedIndex==0)
            {
                InsertActividad(valores);
                Resultado.Text = "Datos cargados en Actividad";
            }
            else if (DropDownTabla.SelectedIndex==1)
            {
                InsertAsignacion(valores);
                Resultado.Text = "Datos cargados en Asignacion";
            }
            else if (DropDownTabla.SelectedIndex == 2)
            {
                InsertCarta(valores);
                Resultado.Text = "Datos cargados en Carta";
            }
            else if (DropDownTabla.SelectedIndex == 3)
            {
                InsertCurso(valores);
                Resultado.Text = "Datos cargados en Curso";
            }
            else if (DropDownTabla.SelectedIndex == 4)
            {
                InsertIncidenteInsumo(valores);
                Resultado.Text = "Datos cargados en Incidente insumo";
            }
            else if (DropDownTabla.SelectedIndex == 5)
            {
                InsertIncidenteSalon(valores);
                Resultado.Text = "Datos cargados en incidente salon";
            }
            else if (DropDownTabla.SelectedIndex == 6)
            {
                InsertInsumo(valores);
                Resultado.Text = "Datos cargados en insumo";
            }
            else if (DropDownTabla.SelectedIndex == 7)
            {
                InsertMatricula(valores);
                Resultado.Text = "Datos cargados en matricula";
            }
            else if (DropDownTabla.SelectedIndex == 8)
            {
                InsertPrestamo(valores);
                Resultado.Text = "Datos cargados en Prestamo";
            }
            else if (DropDownTabla.SelectedIndex == 9)
            {
                InsertSalon(valores);
                Resultado.Text = "Datos cargados en Salon";
            }
            else if (DropDownTabla.SelectedIndex == 10)
            {
                InsertUsuario(valores);
                Resultado.Text = "Datos cargados en Usuario";
            }
        }

        private void InsertActividad(List<String[]> valores) {

            ModelDatabase db = new ModelDatabase();

            foreach (String[] strings in valores) {
                Actividad actividad = new Actividad
                {
                    nombre = strings[0],
                    tipo = strings[1],
                    fecha_incio = DateTime.ParseExact(strings[2],"yyyy-MM-dd HH:mm:ss", System.Globalization.CultureInfo.InvariantCulture),
                    fecha_final = DateTime.ParseExact(strings[3], "yyyy-MM-dd HH:mm:ss", System.Globalization.CultureInfo.InvariantCulture),
                    presentacion = strings[4],
                    cuestionario = strings[5],
                    codigo_qr = strings[6],
                    carta_id_carta = Int32.Parse(strings[7]),
                    salon_id_salon = Int32.Parse(strings[8]),
                    curso_id_curso = Int32.Parse(strings[9])
                };
                db.Actividads.Add(actividad);
            }
            db.SaveChanges();
        }

        private void InsertAsignacion(List<String[]> valores)
        {
            ModelDatabase db = new ModelDatabase();

            foreach (String[] strings in valores)
            {
                Asignacion asignacion = new Asignacion
                {
                    usuario_estudiante= Int32.Parse(strings[0]),
                    curso_id_curso = Int32.Parse(strings[1])
                };
                db.Asignacions.Add(asignacion);
            }
            db.SaveChanges();
        }

        private void InsertCarta(List<String[]> valores)
        {
            ModelDatabase db = new ModelDatabase();

            foreach (String[] strings in valores)
            {
                Carta carta = new Carta
                {
                    asunto = strings[0],
                    contenido = strings[1],
                    usuario_instructor = Int32.Parse(strings[2])
                };
                db.Cartas.Add(carta);
            }
            db.SaveChanges();
        }

        private void InsertCurso(List<String[]> valores)
        {
            ModelDatabase db = new ModelDatabase();

            foreach (String[] strings in valores)
            {
                Curso curso = new Curso
                {
                    nombre = strings[0],
                    ciclo = strings[1]
                };
                db.Cursoes.Add(curso);
            }
            db.SaveChanges();
        }

        private void InsertIncidenteInsumo(List<String[]> valores)
        {
            ModelDatabase db = new ModelDatabase();

            foreach (String[] strings in valores)
            {
                Incidente_insumo incidente = new Incidente_insumo
                {
                    descripcion = strings[0],
                    costo = decimal.Parse(strings[1]),
                    estado = strings[2],
                    activo = Boolean.Parse(strings[3]),
                    id_incidente_insumo = Int32.Parse(strings[4])
                };
                db.Incidente_insumo.Add(incidente);
            }
            db.SaveChanges();
        }

        private void InsertIncidenteSalon(List<String[]> valores)
        {
            ModelDatabase db = new ModelDatabase();

            foreach (String[] strings in valores)
            {
                Incidente_salon incidente = new Incidente_salon
                {
                    descripcion = strings[0],
                    costo = decimal.Parse(strings[1]),
                    estado = strings[2],
                    activo = Boolean.Parse(strings[3]),
                    actividad_id_actividad= Int32.Parse(strings[4])
                };
                db.Incidente_salon.Add(incidente);
            }
            db.SaveChanges();
        }

        private void InsertInsumo(List<String[]> valores)
        {
            ModelDatabase db = new ModelDatabase();

            foreach (String[] strings in valores)
            {
                Insumo insumo = new Insumo
                {
                    nombre = strings[0],
                    descripcion = strings[1],
                    estado = strings[2],
                    precio = Decimal.Parse(strings[3]),
                    disponible = Boolean.Parse(strings[4]),
                    activo = Boolean.Parse(strings[5])
                };
                db.Insumoes.Add(insumo);
            }
            db.SaveChanges();
        }

        private void InsertMatricula(List<String[]> valores)
        {
            ModelDatabase db = new ModelDatabase();

            foreach (String[] strings in valores)
            {
                Matricula matricula = new Matricula
                {
                    asistencia = strings[0],
                    respuestas_cuestionario = strings[1],
                    usuario_estudiante = Int32.Parse(strings[2]),
                    actividad_id_actividad = Int32.Parse(strings[3])
                };
                db.Matriculas.Add(matricula);
            }
            db.SaveChanges();
        }

        private void InsertPrestamo(List<String[]> valores)
        {
            ModelDatabase db = new ModelDatabase();

            foreach (String[] strings in valores)
            {
                Prestamo prestamo = new Prestamo
                {
                    descripcion = strings[0],
                    fecha = DateTime.ParseExact(strings[1], "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture),
                    estado = strings[2],
                    insumo_id_insumo = Int32.Parse(strings[3]),
                    usuario_id_usuario = Int32.Parse(strings[3])
                };
                db.Prestamoes.Add(prestamo);
            }
            db.SaveChanges();
        }

        private void InsertSalon(List<String[]> valores)
        {
            ModelDatabase db = new ModelDatabase();

            foreach (String[] strings in valores)
            {
                Salon salon = new Salon
                {
                    nombre = strings[0],
                    edificio = strings[1],
                    estado = strings[2],
                    activo = Boolean.Parse(strings[3])
                };
                db.Salons.Add(salon);
            }
            db.SaveChanges();
        }

        private void InsertUsuario(List<String[]> valores)
        {
            ModelDatabase db = new ModelDatabase();

            foreach (String[] strings in valores)
            {
                Usuario usuario = new Usuario
                {
                    carne = strings[0],
                    cui = strings[1],
                    contrasena = strings[2],
                    nombre = strings[3],
                    direccion = strings[4],
                    telefono = strings[5],
                    correo = strings[6],
                    fecha_de_nacimiento = DateTime.ParseExact(strings[7], "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture),
                    tipo = strings[8]
                };
                db.Usuarios.Add(usuario);
            }
            db.SaveChanges();
        }

        String[] formatos = { "nombre,tipo,fecha_inicio,fecha_final,presentacion,cuestionario,codigo_qr,carta_id_carta,salon_id_salon,curso_id_curso",
                                "usuario_estudiante,curso_id_curso",
                                "asunto,contenido,usuario_instructor",
                                "nombre,ciclo",
                                "descripcion,costo,estado,activo,idPrestamo",
                                "descripcion,costo,estado,activo,idActividad",
                                "nombre,descripcion,estado,precio,disponible,activo",
                                "asistencia,respuestasCuestionario,usuarioEstudiante,actividadIdActividad",
                                "descripcion,fecha,estado,id_insumo,id_usuario",
                                "nombre,edificio,estado,activo",
                                "carne,cui,contrasena,nombre,direccion,telefono,correo,fechaNacimiento,tipo"};

        String[] tipos = { "string,string,yyyy-MM-dd HH:mm:ss,yyyy-MM-dd HH:mm:ss,string,string,string,int,int,int",
                                "int,int",
                                "string,string,int",
                                "string,ciclo",
                                "string,decimal,estado,false,int",
                                "string,decimal,estado,false,int",
                                "string,string,estado,decimal,false,false",
                                "string,string,int,int",
                                "string,yyyy-MM-dd,estado,int,int",
                                "string,string,estado,boolean",
                                "string,string,string,string,string,string,string,yyyy-MM-dd,tipo"};

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            FormatoText.Text = formatos[DropDownTabla.SelectedIndex];
            TipoText.Text = tipos[DropDownTabla.SelectedIndex];
        }
    }
}