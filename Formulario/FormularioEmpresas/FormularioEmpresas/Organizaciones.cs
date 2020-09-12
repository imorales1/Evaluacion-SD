using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaNegocio;

namespace FormularioEmpresas
{
    public partial class Organizaciones : Form
    {
        public Organizaciones()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            
        }

        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            
        }

        private void textBox1_KeyDown(object sender, KeyEventArgs e)
        {
            
        }

        private void textBox1_KeyUp(object sender, KeyEventArgs e)
        {
            if(rdCodigo.Checked == true)
            {
                Empresas emp = new Empresas();
                dataGridView1.DataSource = emp.MostrarEmpresa(textBox1.Text);
            }
            else
            {
                Empresas emp = new Empresas();
                dataGridView1.DataSource = emp.EmpresaPorNombre(textBox1.Text);
            }
            
        }
    }
}
