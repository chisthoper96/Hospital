    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acceso.aspx.cs" Inherits="Hospital.Acceso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Estilos.css" rel="stylesheet" />
    <title>Acceso</title>
</head>
<body>
    <form id="pagInicio" runat="server">
        <asp:Label ID="txtHospitalGeneral" runat="server" Text="Hospital General"></asp:Label>

        <div>
            <img src="img/logo.SVG" alt="LOGO" width="50%" height="50%" />
        </div>
        <p>
            <asp:TextBox ID="txtUsuario" CssClass="diseñoInput" runat="server" placeholder="Usuario"></asp:TextBox>
        </p>
        <asp:TextBox ID="txtPassword" type="password" CssClass="diseñoInput" runat="server" placeholder="Contraseña"></asp:TextBox>
        <p>
            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" />
        </p>
        <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
