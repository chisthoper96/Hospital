using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Hospital
{
    public partial class MantencionDeMedicos : System.Web.UI.Page
    {
        string usuario, accion, rut;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = Request["us"];
            accion = Request["accion"];
            rut = Request["rut"];

            if (!Page.IsPostBack)
            {

                if (accion == "VER")
                {
                    leerMedico(rut);
                }
            }
            else
            {
                accion = "";
            }
        }

            protected void Button1_Click(object sender, EventArgs e)
            {
                if (!existeRut(txtRutMedico.Text))
                    ingresarMedico();
                else
                    modificarMedico();

            }

            private bool existeRut(string Rut)
            {
                bool valor = false;
                string strConnection = "Data Source = LAPTOP-9H59B7FJ\\SQLEXPRESS; Initial Catalog = Hospital; Integrated Security = True";

                string strSql = "Select rut from MantencionMedico where rut=" + Rut;

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

            protected void ingresarMedico()
            {

                SqlDataMedico.InsertCommandType = SqlDataSourceCommandType.Text;

                SqlDataMedico.InsertCommand = "Insert into MantencionMedico (rut,dv,apellidoPaterno,apellidoMaterno,nombre,estado) VALUES (@rut,@dv,@apellidoPaterno,@apellidoMaterno, @nombre, @estado)";


                SqlDataMedico.InsertParameters.Add("rut", txtRutMedico.Text);
                SqlDataMedico.InsertParameters.Add("Dv", txtDvMedico.Text);
                SqlDataMedico.InsertParameters.Add("apellidoPaterno", txtApellidoPaterno.Text);
                SqlDataMedico.InsertParameters.Add("apellidoMaterno", txtApellidoMaterno.Text);
                SqlDataMedico.InsertParameters.Add("nombre", txtNombre.Text);
                SqlDataMedico.InsertParameters.Add("estado", drpEstado.SelectedItem.Value);

                try
                {
                    SqlDataMedico.Insert();
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

            protected void modificarMedico()
            {
                SqlDataMedico.UpdateCommandType = SqlDataSourceCommandType.Text;

                SqlDataMedico.UpdateCommand = "Update MantencionMedico set rut=@rut,dv=@dv,apellidoPaterno=@apellidoPaterno,apellidoMaterno=@apellidoMaterno,nombre=@nombre,estado=@estado where rut=@rut";
                SqlDataMedico.UpdateParameters.Add("Rut", txtRutMedico.Text);
                SqlDataMedico.UpdateParameters.Add("Dv", txtDvMedico.Text);
                SqlDataMedico.UpdateParameters.Add("apellidoPaterno", txtApellidoPaterno.Text);
                SqlDataMedico.UpdateParameters.Add("apellidoMaterno", txtApellidoMaterno.Text);
                SqlDataMedico.UpdateParameters.Add("nombre", txtNombre.Text);
                SqlDataMedico.UpdateParameters.Add("estado", drpEstado.SelectedItem.Value);

                try
                {
                    SqlDataMedico.Update();
                }
                catch (Exception ex)
                {
                    lblMensaje.Text = ex.Message.ToString();
                }
                finally
                {

                }


            }
        private void leerMedico(string Rut)
        {

            string strConnection = "Data Source = LAPTOP-9H59B7FJ\\SQLEXPRESS; Initial Catalog = Hospital; Integrated Security = True";

            string strSql = "Select * from MantencionMedico where rut=" + Rut;

            SqlConnection sqlConn = new SqlConnection(strConnection);

            SqlCommand sqlCmd = new SqlCommand(strSql, sqlConn);

            SqlDataReader rdr = null;

            try
            {

                sqlConn.Open();
                rdr = sqlCmd.ExecuteReader();
                if (rdr.Read())
                {
                    txtRutMedico.Text = Rut;
                    txtDvMedico.Text = rdr.GetString(1);
                    txtApellidoPaterno.Text = rdr.GetString(2);
                    txtApellidoMaterno.Text = rdr.GetString(3);
                    txtNombre.Text = rdr.GetString(4);
                    drpEstado.SelectedIndex = rdr.GetInt32(5);


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



        }


        protected void Button2_Click(object sender, EventArgs e)
            {
                Server.Transfer("Menu.aspx?us=" + usuario, true);
            }
        }
    }
