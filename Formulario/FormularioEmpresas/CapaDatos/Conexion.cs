using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class Conexion
    {

        private SqlConnection Conec = new SqlConnection("Data Source=PC-SYSTEM\\SQLEXPRESS;Initial Catalog=DbEvaluacion;Integrated Security=True");


        public SqlConnection AbrirConexion()
        {
            if (Conec.State == ConnectionState.Closed)
                Conec.Open();
            return Conec;
        }

        public SqlConnection CerrarConexion()
        {
            if (Conec.State == ConnectionState.Open)
                Conec.Close();
            return Conec;
        }

    }
}
