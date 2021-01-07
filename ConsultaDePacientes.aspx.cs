using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Hospital
{
    public partial class ConsultaDePacientes : System.Web.UI.Page
    {
        string usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = Request["us"];
        }

        protected void grdPaciente_SelectedIndexChanged(object sender, EventArgs e)
        {
            string rut = grdPaciente.Rows[grdPaciente.SelectedIndex].Cells[1].Text.ToString();
            Response.Redirect("MantencionDePacientes.aspx?rut=" + rut + "&accion=VER", true);
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            string strSql = "Select * from MantencionPaciente where " + drpCampos.SelectedItem.Value + " like '%" + txtFiltro.Text + "%'";
            SqlDataPaciente.SelectCommand = strSql;
            SqlDataPaciente.DataBind();
            grdPaciente.DataBind();

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Server.Transfer("Menu.aspx?us=" + usuario, true);
        }
    }
}
