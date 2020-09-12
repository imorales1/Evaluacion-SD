using System;
using System.IO;
using System.Text.RegularExpressions;

namespace Lector
{
    class Program
    {
        static void Main(string[] args)
        {
            Regex regex = new Regex(@"^\d$");

            string text = System.IO.File.ReadAllText("datos.txt");
            System.Console.WriteLine( text);
            Console.WriteLine();
            string result = Regex.Replace(text, @"[^\d]", ".");
            Console.WriteLine(result);
            Console.WriteLine("Presione cualquier tecla para salir.");
            System.Console.ReadKey();
        }
    }
}
