using System;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(IPC2Proyecto.Startup))]
namespace IPC2Proyecto
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
        
    }
}
