using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Hospital
{
    public partial class Acceso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (validaUsuario(txtUsuario.Text, txtPassword.Text))
                Server.Transfer("Menu.aspx?us=" + txtUsuario.Text, true);
            else
                lblMensaje.Text = "Usuario o contraseña incorrecta";
        }

        private bool validaUsuario(string usuario, string password)
        {
            bool valor = false;
            string strConnection = "Data Source = LAPTOP-9H59B7FJ\\SQLEXPRESS; Initial Catalog = Hospital; Integrated Security = True";
            string strSql = "Select * from tbUsuario where usuario='" + usuario + "' and password='" + password + "'";

            SqlConnection sqlConn = new SqlConnection(strConnection);

            SqlCommand sqlCmd = new SqlCommand(strSql, sqlConn);

            SqlDataReader rdr = null;

            try
            {
                sqlConn.Open();
                rdr = sqlCmd.ExecuteReader();

                if (rdr.Read())
                {
                    valor = true;
                }
            }
            catch (Exception ex)
            {
              
                lblMensaje.Text = ex.Message.ToString();
            }
            finally
            {
         
                if (rdr != null) rdr.Close();
                sqlConn.Close();
            }

       
            return (valor);
        }

    }
}