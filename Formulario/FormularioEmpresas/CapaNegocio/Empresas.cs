using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using CapaDatos;

namespace CapaNegocio
{
    public class Empresas
    {
        private DatosEmp p = new DatosEmp();

        public DataTable MostrarEmpresa(string codigo)
        {

            DataTable table = new DataTable();
            table = p.MostrarDatos(codigo);
            return table;
        }

        public DataTable EmpresaPorNombre(string nombre)
        {
            DataTable table = new DataTable();
            table = p.MostrarEmpresas(nombre);
            return table;
        }
    }
}
