using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IPC2Proyecto.Models.MyModels;

namespace IPC2Proyecto
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LogIn(object sender, EventArgs e) {

            String resultado = "ERROR EN EL LOGIN";

            //Instanciar contexto
            ModelDatabase db = new ModelDatabase();
            var usuarios = db.Usuarios;

            String usuario = txbUsuario.Text;
            String contraseña = txbContraseña.Text;

            foreach (Usuario u in usuarios) {
                if (usuario == u.carne) {
                    resultado = "Contraseña incorrecta";
                    if (contraseña == u.contrasena){
                        initCookiesDeUsuario(u);

                        Response.Redirect("~/");

                        resultado = "Login exitoso, " + Request.Cookies.Get("usuario").Values["id_usuario"]+ " nombre: " + Request.Cookies.Get("usuario").Values["nombre"] + " rol: " + Request.Cookies.Get("usuario").Values["tipo"];
                    }
                    break;
                }
                resultado = "Usuario incorrecto";
            }

            FailureText.Text = resultado;
        }

        protected void initCookiesDeUsuario(Usuario u) {
            Response.Cookies.Get("usuario").Values["id_usuario"] = u.id_usuario.ToString();
            Response.Cookies.Get("usuario").Values["tipo"] = u.tipo;
        }

        protected void recupContra_Click(object sender, EventArgs e)
        {
            Lector.EmailSender.RecupContraseña(getUsuario(txbUsuario.Text));
            FailureText.Text = "Email enviado";
        }

        private Usuario getUsuario(String carne) {
            ModelDatabase db = new ModelDatabase();

            Usuario usuario = (from u in db.Usuarios
                               where u.carne == carne
                               select u).SingleOrDefault();

            return usuario;
        }
    }
}