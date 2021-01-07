using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Hospital
{
    public partial class ConsultaDeMedicos : System.Web.UI.Page
    {
        string usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = Request["us"];

        }


        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            string strSql = "Select * from MantencionMedico where " + drpCampos.SelectedItem.Value + " like '%" + txtFiltro.Text + "%'";
            SqlDataMedico.SelectCommand = strSql;
            SqlDataMedico.DataBind();
            grdMedico.DataBind();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Server.Transfer("Menu.aspx?us=" + usuario, true);
        } 

        protected void grdMedico_SelectedIndexChanged(object sender, EventArgs e)
        {
            string rut = grdMedico.Rows[grdMedico.SelectedIndex].Cells[1].Text.ToString();

            Response.Redirect("MantencionDeMedicos.aspx?rut=" + rut + "&accion=VER", true);
        }

        protected void btnVolver_Click1(object sender, EventArgs e)
        {
            Server.Transfer("Menu.aspx?us=" + usuario, true);
        }
    }
}