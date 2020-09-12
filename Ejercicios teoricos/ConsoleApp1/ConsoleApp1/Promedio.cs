using System;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            float promedio;
            Console.WriteLine("A continuación se le solicitaran 3 números para calcular el promedio de los mismos");
            promedio = Promedio();
            Console.WriteLine("Promedio {0}", promedio);
            Console.ReadKey();
        }

        static float Promedio()
        {
            float[] numeros = new float[3];
            int cont = 0;
            float total=0, promedio;

            try
            {
                while (cont != 3)
                {

                    Console.WriteLine("Ingrese el dato No. {0}", cont);
                    numeros[cont] = Convert.ToInt32(Console.ReadLine());
                    total = total + numeros[cont];
                    cont++;

                }

            }catch(Exception er)
            {
                Console.WriteLine("Valor no valido {0}", er);
            }

            promedio = total / 3;
            return promedio;
        }
    }
}
