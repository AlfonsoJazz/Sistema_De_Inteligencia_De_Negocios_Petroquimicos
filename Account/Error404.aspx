<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Error404.aspx.vb" Inherits="Error404" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//ES" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error 404</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
        <img src="../uiResources/error_404.gif" alt="Error 404" width="600px" />
        <br />
        <img src="../uiResources/oxiteno_transparente.png" alt="Error 404" width="200px" />
        <br />
        La página que buscas no se encuentra en el servidor
        <br />
        <br />
        <br />
        <asp:ImageButton ID="Inicio" runat="server" ImageUrl="~/uiResources/btn_inicio.png" Width="150px"></asp:ImageButton>
    </center>
    </div>
    </form>
</body>
</html>
