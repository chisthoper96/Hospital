<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaDePacientes.aspx.cs" Inherits="Hospital.ConsultaDePacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 110px;
        }
        .auto-style4 {
            width: 146px;
        }
        .auto-style5 {
            width: 166px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">Consulta de Pacientes</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">Filtrar por:</td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="drpCampos" runat="server">
                            <asp:ListItem Selected="True">Rut</asp:ListItem>
                            <asp:ListItem Value="apellidoPaterno">Apellido Paterno</asp:ListItem>
                            <asp:ListItem Value="nombre">Nombre</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtFiltro" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnConsultar" runat="server" OnClick="btnConsultar_Click" Text="Consultar" />
                        <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:SqlDataSource ID="SqlDataPaciente" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalConnectionString1 %>" ProviderName="<%$ ConnectionStrings:HospitalConnectionString1.ProviderName %>" SelectCommand="SELECT [rut], [dv], [apellidoPaterno], [apellidoMaterno], [nombre], [direccion], [comuna] FROM [MantencionPaciente]"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <asp:GridView ID="grdPaciente" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataPaciente" EmptyDataText="No hay registros de datos para mostrar." OnSelectedIndexChanged="grdPaciente_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="rut" HeaderText="rut" SortExpression="rut" />
                <asp:BoundField DataField="dv" HeaderText="dv" SortExpression="dv" />
                <asp:BoundField DataField="apellidoPaterno" HeaderText="apellidoPaterno" SortExpression="apellidoPaterno" />
                <asp:BoundField DataField="apellidoMaterno" HeaderText="apellidoMaterno" SortExpression="apellidoMaterno" />
                <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                <asp:BoundField DataField="direccion" HeaderText="direccion" SortExpression="direccion" />
                <asp:BoundField DataField="comuna" HeaderText="comuna" SortExpression="comuna" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
