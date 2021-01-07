<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MantencionDePacientes.aspx.cs" Inherits="Hospital.MantencionDePacientes" %>

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
            width: 136px;
        }
        .auto-style3 {
            width: 166px;
        }
        .auto-style4 {
            width: 124px;
        }
        .auto-style5 {
            width: 124px;
            height: 23px;
        }
        .auto-style6 {
            width: 166px;
            height: 23px;
        }
        .auto-style7 {
            width: 136px;
            height: 23px;
        }
        .auto-style8 {
            height: 23px;
        }
        .auto-style9 {
            width: 124px;
            height: 26px;
        }
        .auto-style10 {
            width: 166px;
            height: 26px;
        }
        .auto-style11 {
            width: 136px;
            height: 26px;
        }
        .auto-style12 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Mantencion De Pacientes
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Rut:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtRutPaciente" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style2">dv-<asp:TextBox ID="txtDvPaciente" runat="server" Width="16px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Apellido Paterno:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtApellidoPaterno" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style2">Apellido Materno:</td>
                    <td>
                        <asp:TextBox ID="txtApellidoMaterno" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Nombre:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Direccion:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">Comuna</td>
                    <td class="auto-style10">
                        <asp:DropDownList ID="drpComunas" runat="server" DataMember="DefaultView" DataSourceID="SqlDataComuna" DataTextField="nombreComuna" DataValueField="idComuna">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style11"></td>
                    <td class="auto-style12"></td>
                    <td class="auto-style12"></td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style6"></td>
                    <td class="auto-style7"></td>
                    <td class="auto-style8"></td>
                    <td class="auto-style8"></td>
                </tr>
            </table>
        </div>
        <p>
            <asp:SqlDataSource ID="SqlDataComuna" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalConnectionString1 %>" ProviderName="<%$ ConnectionStrings:HospitalConnectionString1.ProviderName %>" SelectCommand="SELECT [idComuna], [nombreComuna] FROM [Comuna]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataPacientes" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalConnectionString1 %>" ProviderName="<%$ ConnectionStrings:HospitalConnectionString1.ProviderName %>" SelectCommand="SELECT [rut], [dv], [apellidoPaterno], [apellidoMaterno], [nombre], [direccion], [comuna] FROM [MantencionPaciente]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" />
            <asp:Button ID="btnVolver" runat="server" Text="Volver" OnClick="btnVolver_Click" />
        </p>
    </form>
</body>
</html>
