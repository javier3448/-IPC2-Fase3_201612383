using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using IPC2Proyecto.Models.MyModels;

namespace IPC2Proyecto
{
    public partial class _Default : Page
    {
        protected int Numero{ get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public string GetNombre() {

            ModelDatabase context = new ModelDatabase();

            var usuarios = context.Usuarios;
            IQueryable<Usuario> query = from u in usuarios
                                        where u.id_usuario == 1
                                        select u;

            string s = "";

            foreach (Usuario u in query) {
                s = u.nombre;
            }

            return s;
        }

    }
}