using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Hospital
{
    public partial class ConsultaDeAtencion : System.Web.UI.Page
    {
        string usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = Request["us"];
        }

        protected void grdIngresoPaciente_SelectedIndexChanged(object sender, EventArgs e)
        {
            string rut = grdIngresoPaciente.Rows[grdIngresoPaciente.SelectedIndex].Cells[1].Text.ToString();

            Response.Redirect("IngresoDeAtencion.aspx?rut=" + rut + "&accion=VER", true);
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            string strSql = "Select * from tbIngresoPaciente where " + drpCampos.SelectedItem.Value + " like '%" + txtFiltro.Text + "%'";
            SqlDataIngresoPaciente.SelectCommand = strSql;
            SqlDataIngresoPaciente.DataBind();
            grdIngresoPaciente.DataBind();
        }

        protected void btnVovler_Click(object sender, EventArgs e)
        {
            Server.Transfer("Menu.aspx?us=" + usuario, true);
        }
    }
}