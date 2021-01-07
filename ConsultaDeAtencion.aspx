<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaDeAtencion.aspx.cs" Inherits="Hospital.ConsultaDeAtencion" %>

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
            width: 142px;
        }
        .auto-style3 {
            width: 142px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 98px;
        }
        .auto-style6 {
            height: 23px;
            width: 98px;
        }
        .auto-style7 {
            width: 134px;
        }
        .auto-style8 {
            height: 23px;
            width: 134px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Consulta de Atencion</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Filtrar por:</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="drpCampos" runat="server">
                            <asp:ListItem Selected="True" Value="rutPaciente">Rut Paciente</asp:ListItem>
                            <asp:ListItem Value="rutMedico">Rut Medico</asp:ListItem>
                            <asp:ListItem Value="observacion">Observacion</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtFiltro" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnConsultar" runat="server" OnClick="btnConsultar_Click" Text="Consultar" />
                        <asp:Button ID="btnVovler" runat="server" OnClick="btnVovler_Click" Text="Volver" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td class="auto-style6"></td>
                    <td class="auto-style8"></td>
                    <td class="auto-style4"></td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td class="auto-style6"></td>
                    <td class="auto-style8"></td>
                    <td class="auto-style4"></td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <asp:GridView ID="grdIngresoPaciente" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataIngresoPaciente" EmptyDataText="No hay registros de datos para mostrar." OnSelectedIndexChanged="grdIngresoPaciente_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="rutPaciente" HeaderText="rutPaciente" SortExpression="rutPaciente" />
                <asp:BoundField DataField="dvPaciente" HeaderText="dvPaciente" SortExpression="dvPaciente" />
                <asp:BoundField DataField="rutMedico" HeaderText="rutMedico" SortExpression="rutMedico" />
                <asp:BoundField DataField="dvMedico" HeaderText="dvMedico" SortExpression="dvMedico" />
                <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                <asp:BoundField DataField="observacion" HeaderText="observacion" SortExpression="observacion" />
                <asp:BoundField DataField="valor" HeaderText="valor" SortExpression="valor" />
                <asp:BoundField DataField="valorTotal" HeaderText="valorTotal" SortExpression="valorTotal" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataIngresoPaciente" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalConnectionString1 %>" ProviderName="<%$ ConnectionStrings:HospitalConnectionString1.ProviderName %>" SelectCommand="SELECT [rutPaciente], [dvPaciente], [rutMedico], [dvMedico], [fecha], [observacion], [valor], [valorTotal] FROM [tbIngresoPaciente]"></asp:SqlDataSource>
    </form>
</body>
</html>
