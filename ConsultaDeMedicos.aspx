<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaDeMedicos.aspx.cs" Inherits="Hospital.ConsultaDeMedicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Consulta Medicos</h1>
            <p>Filtrar por:</p>
            <asp:DropDownList ID="drpCampos" runat="server">
                <asp:ListItem Selected="True">Rut</asp:ListItem>
                <asp:ListItem Value="apellidoPaterno">Apellido Paterno</asp:ListItem>
                <asp:ListItem Value="nombre">Nombre</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtFiltro" runat="server"></asp:TextBox>
            <asp:Button ID="btnConsultar" runat="server" Text="Consultar" OnClick="btnConsultar_Click" />
            <asp:Button ID="btnVolver" runat="server" Text="Volver" OnClick="btnVolver_Click1" />
        </div>
        <asp:GridView ID="grdMedico" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataMedico" EmptyDataText="No hay registros de datos para mostrar." OnSelectedIndexChanged="grdMedico_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="rut" HeaderText="rut" SortExpression="rut" />
                <asp:BoundField DataField="dv" HeaderText="dv" SortExpression="dv" />
                <asp:BoundField DataField="apellidoPaterno" HeaderText="apellidoPaterno" SortExpression="apellidoPaterno" />
                <asp:BoundField DataField="apellidoMaterno" HeaderText="apellidoMaterno" SortExpression="apellidoMaterno" />
                <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                <asp:BoundField DataField="estado" HeaderText="estado" SortExpression="estado" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataMedico" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalConnectionString1 %>" ProviderName="<%$ ConnectionStrings:HospitalConnectionString1.ProviderName %>" SelectCommand="SELECT [rut], [dv], [apellidoPaterno], [apellidoMaterno], [nombre], [estado] FROM [MantencionMedico]"></asp:SqlDataSource>
    </form>
    
</body>
</html>
