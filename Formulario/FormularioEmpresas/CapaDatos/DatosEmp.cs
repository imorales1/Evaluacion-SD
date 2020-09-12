using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class DatosEmp
    {
        public Conexion con = new Conexion();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dat;
        DataTable tabla = new DataTable();

        public DataTable MostrarDatos(string codigo)
        {
            cmd.Connection = con.AbrirConexion();
            cmd.CommandText = "Consulta";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Codigo", codigo);
            dat = cmd.ExecuteReader();
            tabla.Load(dat);

            cmd.Parameters.Clear();
            con.CerrarConexion();
            return tabla;
        }

        public DataTable MostrarEmpresas(string nombre)
        {
            cmd.Connection = con.AbrirConexion();
            cmd.CommandText = "ConsultaNombre";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Nombre", nombre);
            dat = cmd.ExecuteReader();
            tabla.Load(dat);

            cmd.Parameters.Clear();
            con.CerrarConexion();

            return tabla;
        }
    }
}
