using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IPC2Proyecto.Lector
{
    public class Token
    {
        public AnalizadorLexico.TipoDeToken Tipo { get; set; }

        public String Lexema { get; set; }
    }
}