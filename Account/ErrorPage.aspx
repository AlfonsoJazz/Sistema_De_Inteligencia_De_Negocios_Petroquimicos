<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ErrorPage.aspx.vb" Inherits="Account_ErrorPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//ES" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ErrorPage</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
    <%--<img src="../uiResources/bug.png" alt="Haz encontrado un error, comunicate con Negocios de TI" width="200px"/>--%>
    <br />
    <img src="../uiResources/oxiteno_transparente.png" alt="Error 404" width="400px" />
    <br />
    <br />
        Se ha producido un <span class="style1"><strong>error</strong></span>, por favor reportalo con el departamento de  Negocios de TI 
    <br />
    <br />
    <asp:ImageButton ID="Inicio" runat="server" ImageUrl="~/uiResources/btn_inicio.png" Width="150px"></asp:ImageButton>
    </center>
    </div>
    </form>
</body>
</html>
