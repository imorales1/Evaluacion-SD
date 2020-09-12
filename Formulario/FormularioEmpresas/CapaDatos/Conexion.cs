using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CapaDatos
{
    public class Conexion
    {

        private SqlConnection Conec = new SqlConnection(ConfigurationManager.ConnectionStrings["cadena"].ConnectionString);

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
