<%@ Page Title="SINO | Bienvenido " Language="VB" MasterPageFile="~/SistemaInteligenciaNegociosOxiteno.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
    {
        color: #FF3300;
    }
        </style>
    </asp:Content>
<asp:Content ID="index_petroquimicos" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="main_page" class="style1">
 <h2>Bienvenido</h2>

  <hr />
      <%--  <div>
            <asp:Panel ID="Panel_Admin" runat="server" Visible="false">
            <asp:ImageButton ID="Log_Admin" runat="server" ImageUrl="~/uiResources/Log.png" 
                                    ToolTip="Administra los archivos LOG" 
                    style="text-align: left" Width="100px" />
                     <hr />
            </asp:Panel>
        </div>--%>

 Favor de <a href="mailto:vcisneros@oxiteno.com; jose.mosco.ext@oxiteno.com">reportar</a> cualquier error o sugerencia con el departamento de TI, su retroalimentación es de suma importancia para la mejora de esta pieza de software 
 <br />
        <%-- <a href="mailto:vcisneros@oxiteno.com">Valentin Cisneros</a> | <a href="mailto:jose.mosco.ext@oxiteno.com">J. Alfonso Mosco Herrea</a>--%>
 <br />
 <br />
 <strong>Actualizaciones</strong>
 <br />
 <ul>
 <li>15-11-2018 Se ha habilitado la página para la captura de datos <strong>06 Importación Etanol</strong> favor de verificar su funcionamiento </li>
 <li>15-11-2018 Se ha habilitado la página para la captura de datos <strong>07 Gas natural [Complejos]</strong> favor de verificar su funcionamiento </li>
 <li>16-11-2018 Se ha habilitado el servicio de <strong>log</strong> para control y monitoreo de errores</li>
 <li>16-11-2018 Corrección de rotulos e indicadores</li>
     <li>19-11-2018 Corrección de rotulos y mejoras del sistema</li>
     <li>21-11-2018 Se ha rediseñado por completo la página para la captura de datos <strong>07 Gas natural [Complejos]</strong> favor de verificar su funcionamiento </li>
     <li>23-11-2018 Se ha habilitado la página para la captura de datos <strong>08 Cadena 
         Etanol </strong>favor de verificar su funcionamiento </li>
     <li>27-11-2018 La página&nbsp; <strong>07 Gas natural [Complejos]</strong> ha sido 
         rediseñada, favor de verificar su funcionamiento </li>
     <li><span class="style2"><strong>21-12-2018</strong></span> <strong>El sitio ya no 
         se encuentra conectado a la base de pruebas</strong> por lo que los cambios 
         realizados repercuten directamente en la base de datos de producción</li>
 </ul>
        <%--<center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataKeyNames="SINOX003_Id" DataSourceID="SqlDataSource1" 
        ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="SINOX003_Id" HeaderText="SINOX003_Id" 
                ReadOnly="True" SortExpression="SINOX003_Id" />
            <asp:BoundField DataField="SINOX003_UDM" HeaderText="SINOX003_UDM" 
                SortExpression="SINOX003_UDM" />
            <asp:BoundField DataField="SINOX003_Descripcion" 
                HeaderText="SINOX003_Descripcion" SortExpression="SINOX003_Descripcion" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ZSINOConnectionString1 %>" 
        SelectCommand="SELECT * FROM [SINOX003_Catalogo_UDM]"></asp:SqlDataSource>
</center>--%>
</div>
</asp:Content>


