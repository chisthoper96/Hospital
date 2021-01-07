<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresoDeAtencion.aspx.cs" Inherits="Hospital.IngresoDeAtencion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Estilos.css" rel="stylesheet" />
    <title>Ingreso de atención</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 137px;
        }
        .auto-style3 {
            width: 146px;
        }
        .auto-style4 {
            width: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Ingreso Pacientes</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Rut paciente:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtRutPaciente" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">Dv:</td>
                <td>-<asp:TextBox ID="txtDvPaciente" runat="server" Width="16px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Rut Medico:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtRutMedico" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">Dv:</td>
                <td>-<asp:TextBox ID="txtDvMedico" runat="server" Width="16px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Fecha:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtFecha" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Observaciones:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtObservaciones" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Valor unitario:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtValorUnitario" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Valor total: </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtValorTotal" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:Button ID="btnIngresarPaciente" runat="server" Text="Ingresar" OnClick="btnIngresarPaciente_Click" />
        <asp:Button ID="Button1" runat="server" Text="Volver" OnClick="Button1_Click" />
        <asp:SqlDataSource ID="SqlDataIngresoPaciente" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalConnectionString1 %>" ProviderName="<%$ ConnectionStrings:HospitalConnectionString1.ProviderName %>" SelectCommand="SELECT [rutPaciente], [dv], [rutMedico], [fehca], [observacion], [valor], [valorTotal] FROM [tbIngresoPaciente]"></asp:SqlDataSource>
        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    </form>
</body>
</html>
