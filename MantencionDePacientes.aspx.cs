using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Hospital
{
     
    public partial class MantencionDePacientes : System.Web.UI.Page
    {
        string usuario,accion,rut;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = Request["us"];
            accion = Request["accion"];
            rut = Request["rut"];

            if (!Page.IsPostBack)
            {
                if (accion == "VER")
                {
                    leerPaciente(rut);
                }
            }
            else
            {
                accion = "";
            }
        }


            
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (!existeRut(txtRutPaciente.Text))
                ingresarPaciente();
            else
                modificarPaciente();
        }

        private bool existeRut(string Rut)
        {
            bool valor = false;
            string strConnection = "Data Source = LAPTOP-9H59B7FJ\\SQLEXPRESS; Initial Catalog = Hospital; Integrated Security = True";

            string strSql = "Select rut from MantencionPaciente where rut=" + Rut;

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

            }
            finally
            {

                if (rdr != null) rdr.Close();
                sqlConn.Close();
            }

            return (valor);
        }

        protected void ingresarPaciente()
        {
            SqlDataPacientes.InsertCommandType = SqlDataSourceCommandType.Text;

            SqlDataPacientes.InsertCommand = "Insert into MantencionPaciente (rut,dv,apellidoPaterno,apellidoMaterno,nombre,direccion,comuna) VALUES (@rut,@dv,@apellidoPaterno,@apellidoMaterno, @nombre,@direccion,@comuna)";

            SqlDataPacientes.InsertParameters.Add("Rut", txtRutPaciente.Text);
            SqlDataPacientes.InsertParameters.Add("Dv", txtDvPaciente.Text);
            SqlDataPacientes.InsertParameters.Add("apellidoPaterno", txtApellidoPaterno.Text);
            SqlDataPacientes.InsertParameters.Add("apellidoMaterno", txtApellidoMaterno.Text);
            SqlDataPacientes.InsertParameters.Add("nombre", txtNombre.Text);
            SqlDataPacientes.InsertParameters.Add("direccion", txtDireccion.Text);
            SqlDataPacientes.InsertParameters.Add("comuna", drpComunas.SelectedItem.Value);

            try
            {
                SqlDataPacientes.Insert();
                lblMensaje.Text = "Agregado Correctamente";
            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message.ToString();
            }
            finally
            {

            }
        }

        protected void modificarPaciente()
        {

            SqlDataPacientes.UpdateCommandType = SqlDataSourceCommandType.Text;

            SqlDataPacientes.UpdateCommand = "Update MantencionPaciente set rut=@rut,dv=@dv,apellidoPaterno=@apellidoPaterno,apellidoMaterno=@apellidoMaterno,nombre=@nombre,direccion=@direccion,comuna=@comuna where rut=@rut";
            SqlDataPacientes.UpdateParameters.Add("Rut", txtRutPaciente.Text);
            SqlDataPacientes.UpdateParameters.Add("Dv", txtDvPaciente.Text);
            SqlDataPacientes.UpdateParameters.Add("apellidoPaterno", txtApellidoPaterno.Text);
            SqlDataPacientes.UpdateParameters.Add("apellidoMaterno", txtApellidoMaterno.Text);
            SqlDataPacientes.UpdateParameters.Add("nombre", txtNombre.Text);
            SqlDataPacientes.UpdateParameters.Add("direccion", txtDireccion.Text);
            SqlDataPacientes.UpdateParameters.Add("comuna", drpComunas.SelectedItem.Value);


            try
            {
                SqlDataPacientes.Update();
                lblMensaje.Text = "Modificado correctamente";
            }
            catch (Exception ex)
            {

                lblMensaje.Text = ex.Message.ToString();
            }
            finally
            {

            }


        }
        private void leerPaciente(string Rut)
        {

            string strConnection = "Data Source=LAPTOP-9H59B7FJ\\SQLEXPRESS;Initial Catalog=Hospital;Integrated Security=True";


            string strSql = "Select * from MantencionPaciente where rut=" + Rut;

            SqlConnection sqlConn = new SqlConnection(strConnection);

            SqlCommand sqlCmd = new SqlCommand(strSql, sqlConn);

            SqlDataReader rdr = null;

            try
            {
                sqlConn.Open();
                rdr = sqlCmd.ExecuteReader();
                if (rdr.Read())
                {
                    txtRutPaciente.Text = Rut;
                    txtDvPaciente.Text = rdr.GetString(1);
                    txtApellidoPaterno.Text = rdr.GetString(2);
                    txtApellidoMaterno.Text = rdr.GetString(3);
                    txtNombre.Text = rdr.GetString(4);
                    txtDireccion.Text = rdr.GetString(5);
                    drpComunas.SelectedIndex = rdr.GetInt32(6);


                }
            }
            catch (Exception ex)
            {
                //*** Se despliega un mensaje de error en el objeto lblMensaje
                lblMensaje.Text = ex.Message.ToString();
            }
            finally
            {
                //***Se cierran las conexiones a la base de datos y a la tabla

                if (rdr != null) rdr.Close();
                sqlConn.Close();
            }



        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Server.Transfer("Menu.aspx?us=" + usuario, true);
        }
    }
}