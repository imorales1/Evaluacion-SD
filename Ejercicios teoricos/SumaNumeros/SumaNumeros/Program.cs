using System;
using System.Linq;

namespace SumaNumeros
{
    class Program
    {
        static void Main(string[] args)
        {
            int total;
            Console.WriteLine("El resultado de la suma de los números del 1 al 10 es:");
            total = suma();
            Console.WriteLine("SUMA: {0}", total);
            Console.ReadKey();
        }

        static int suma()
        {
            int[] numeros = new int[10];
            int cont = 0, total = 0, sum = 1; ;

            while (cont != 10)
            {

                numeros[cont] = sum;
                sum++;
                cont++;

            }

            total = numeros.Sum();
            return total;
        }
    }
}
