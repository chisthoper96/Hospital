<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Hospital.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Estilos.css" rel="stylesheet" />
    <title>Menu principal</title>
</head>
<body>
    <form id="form1" runat="server">
      <h1 id="tituloMenu"> Hospital General</h1>
        <div id="pagInicio" > 
            <p class="linkMenu"><asp:HyperLink ID="linkMantencionDePacientes" runat="server" NavigateUrl="~/MantencionDePacientes.aspx">Mantencion de pacientes</asp:HyperLink></p><br />           
            <p class="linkMenu"><asp:HyperLink ID="linkMantencionDeMedicos" runat="server" NavigateUrl="~/MantencionDeMedicos.aspx">Mantencion de medicos</asp:HyperLink></p><br />
            <p class="linkMenu"><asp:HyperLink ID="linkIngresoDeAtenciones" runat="server" NavigateUrl="IngresoDeAtencion.aspx">Igreso de atenciones</asp:HyperLink></p><br />
            <p class="linkMenu"><asp:HyperLink ID="linkConsultaDeMedicos" runat="server" NavigateUrl="~/ConsultaDeMedicos.aspx">Consulta de medicos</asp:HyperLink></p><br />
            <p class="linkMenu"><asp:HyperLink ID="linkConsultaDePacientes" runat="server" NavigateUrl="~/ConsultaDePacientes.aspx">Consulta de pacientes</asp:HyperLink></p><br />
            <p class="linkMenu"><asp:HyperLink ID="linkConsultaDeAtencion" runat="server" NavigateUrl="~/ConsultaDeAtencion.aspx">Consulta de atencion</asp:HyperLink></p><br />
        </div>
    </form>
</body>
</html>

