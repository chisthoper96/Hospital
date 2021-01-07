<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MantencionDeMedicos.aspx.cs" Inherits="Hospital.MantencionDeMedicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 167px;
        }
        .auto-style3 {
            width: 124px;
        }
        .auto-style4 {
            width: 134px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Mantencion Medicos</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Rut:</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtRutMedico" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style3">dv-<asp:TextBox ID="txtDvMedico" runat="server" Width="16px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Apellido Paterno:</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtApellidoPaterno" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style3">Apellido Materno:</td>
            <td>
                <asp:TextBox ID="txtApellidoMaterno" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Nombre:</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Estado:</td>
            <td class="auto-style4">
                <asp:DropDownList ID="drpEstado" runat="server" DataMember="DefaultView" DataSourceID="SqlDataEstado" DataTextField="Estado" DataValueField="idEstado">
                </asp:DropDownList>
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="lblMensaje" runat="server"></asp:Label>
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
        <div>
            <asp:Button ID="btnAgregar" runat="server" OnClick="Button1_Click" Text="Agregar" />
            <asp:Button ID="Button2" runat="server" Text="Volver" OnClick="Button2_Click" />
        </div>
        <asp:SqlDataSource ID="SqlDataEstado" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalConnectionString1 %>" ProviderName="<%$ ConnectionStrings:HospitalConnectionString1.ProviderName %>" SelectCommand="SELECT [idEstado], [Estado] FROM [Estado]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataMedico" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalConnectionString1 %>" ProviderName="<%$ ConnectionStrings:HospitalConnectionString1.ProviderName %>" SelectCommand="SELECT [rut], [dv], [apellidoPaterno], [apellidoMaterno], [nombre], [estado] FROM [MantencionMedico]"></asp:SqlDataSource>
    </form>
</body>
</html>
