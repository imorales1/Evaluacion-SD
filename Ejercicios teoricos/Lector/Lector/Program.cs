using System;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;

namespace Lector
{
    class Program
    {

        static void Main(string[] args)
        {

            string text = System.IO.File.ReadAllText("datos.txt");

            string[] Datos = text.Split('\n');

            foreach (string item in Datos)
            {
                int antes = item.LastIndexOf('Q') + 1;
                int despues = item.LastIndexOf('_') ;
                Console.WriteLine($"Valores Numericos :{item.Substring(antes, despues - antes)}");
            }

            Console.ReadKey();
        }
    }
}
