using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IPC2Proyecto.Lector
{
    public static class LectorDeArchivos
    {
        /// <summary>
        /// Lee un documento de texto, devuelve una lista de strings, cada string es una linea
        /// </summary>
        /// <param name="direccion">ubicacion del archivoj</param>
        /// <returns></returns>
        public static List<String> Leer(String direccion)
        {
            List<String> lista = new List<String>();

            int contador = 0;
            String line;

            System.IO.StreamReader file = new System.IO.StreamReader(direccion);
            while ((line = file.ReadLine()) != null)
            {
                lista.Add(line);
                contador++;
            }

            file.Close();

            return lista;
        }


        public static List<String[]> Separar(List<String> lista) {
            List<String[]> listaDeInstrucciones=new List<String[]>();

            foreach (String s in lista){
                String[] palabras = s.Split(',');
                listaDeInstrucciones.Add(palabras);
            }

            return listaDeInstrucciones;
        }

        private static Random random = new Random();
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        public static double nCr(int n, int r)
        {
            // naive: return Factorial(n) / (Factorial(r) * Factorial(n - r));
            return nPr(n, r) / Factorial(r);
        }

        public static double nPr(int n, int r)
        {
            // naive: return Factorial(n) / Factorial(n - r);
            return FactorialDivision(n, n - r);
        }

        private static double FactorialDivision(int topFactorial, int divisorFactorial)
        {
            double result = 1;
            for (int i = topFactorial; i > divisorFactorial; i--)
                result *= i;
            return result;
        }

        private static double Factorial(int i)
        {
            if (i <= 1)
                return 1;
            return i * Factorial(i - 1);
        }
    }
}