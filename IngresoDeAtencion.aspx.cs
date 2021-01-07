using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Hospital
{
    public partial class IngresoDeAtencion : System.Web.UI.Page
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
                    leerAtenion(rut);
                }
            }
            else
            {
                accion = "";
            }
        }

        protected void btnIngresarPaciente_Click(object sender, EventArgs e)
        {
            if (!existeRut(txtRutPaciente.Text))
                ingresarAtencion();
            else
                modificarAtencion();

        }

        private bool existeRut(string Rut)
        {
            bool valor = false;

            string strConnection = "Data Source = LAPTOP-9H59B7FJ\\SQLEXPRESS; Initial Catalog = Hospital; Integrated Security = True";

            string strSql = "Select rutPaciente from tbIngresoPaciente where rutPaciente=" + Rut;

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

        protected void ingresarAtencion()
        {
            SqlDataIngresoPaciente.InsertCommandType = SqlDataSourceCommandType.Text;

            SqlDataIngresoPaciente.InsertCommand = "Insert into tbIngresoPaciente (rutPaciente,dvPaciente, RutMedico,dvMedico,fecha,observacion,valor,valorTotal) VALUES (@RutPaciente,@dvPaciente,@RutMedico,@dvMedico,@fecha,@Observacion,@Valor,@valorTotal)";

            SqlDataIngresoPaciente.InsertParameters.Add("rutPaciente", txtRutPaciente.Text);
            SqlDataIngresoPaciente.InsertParameters.Add("dvPaciente", txtDvPaciente.Text);
            SqlDataIngresoPaciente.InsertParameters.Add("RutMedico", txtRutMedico.Text);
            SqlDataIngresoPaciente.InsertParameters.Add("dvMedico", txtDvMedico.Text);
            SqlDataIngresoPaciente.InsertParameters.Add("fecha", txtFecha.Text);
            SqlDataIngresoPaciente.InsertParameters.Add("observacion", txtObservaciones.Text);
            SqlDataIngresoPaciente.InsertParameters.Add("valor", txtValorUnitario.Text);
            SqlDataIngresoPaciente.InsertParameters.Add("valorTotal", txtValorTotal.Text);

            try
            {
                SqlDataIngresoPaciente.Insert();
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
        protected void modificarAtencion()
        {

            SqlDataIngresoPaciente.UpdateCommandType = SqlDataSourceCommandType.Text;


            SqlDataIngresoPaciente.UpdateCommand = "Update tbIngresoPaciente set rutPaciente=@rutPaciente,dvPaciente=@dvPaciente,rutMedico=@rutMedico,dvMedico=@dvMedico,fecha=@fecha,observacion=@observacion,valor=@valor,valorTotal=@valorTotal where rutPaciente=@rutPaciente";
            SqlDataIngresoPaciente.UpdateParameters.Add("rutPaciente", txtRutPaciente.Text);
            SqlDataIngresoPaciente.UpdateParameters.Add("dvPaciente", txtDvPaciente.Text);
            SqlDataIngresoPaciente.UpdateParameters.Add("rutMedico", txtRutMedico.Text);
            SqlDataIngresoPaciente.UpdateParameters.Add("dvMedico", txtDvMedico.Text);
            SqlDataIngresoPaciente.UpdateParameters.Add("fecha", txtFecha.Text);
            SqlDataIngresoPaciente.UpdateParameters.Add("observacion", txtObservaciones.Text);
            SqlDataIngresoPaciente.UpdateParameters.Add("valor", txtValorUnitario.Text);
            SqlDataIngresoPaciente.UpdateParameters.Add("valorTotal", txtValorTotal.Text);


            try
            {
                SqlDataIngresoPaciente.Update();
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
        private void leerAtenion(string Rut)
        {

            string strConnection = "Data Source = LAPTOP-9H59B7FJ\\SQLEXPRESS; Initial Catalog = Hospital; Integrated Security = True";

            string strSql = "Select * from tbIngresoPaciente where rutPaciente=" + Rut;

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
                    txtRutMedico.Text = rdr.GetString(2);
                    txtDvMedico.Text = rdr.GetString(3);
                    txtFecha.Text = rdr.GetString(4);
                    txtObservaciones.Text = rdr.GetString(5);
                    txtValorUnitario.Text = rdr.GetString(6);
                    txtValorTotal.Text = rdr.GetString(7);


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



        protected void Button1_Click(object sender, EventArgs e)
        {
            Server.Transfer("Menu.aspx?us=" + usuario, true);
        }
    }
}