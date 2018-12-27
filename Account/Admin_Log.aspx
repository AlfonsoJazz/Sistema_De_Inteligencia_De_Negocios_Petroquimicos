<%@ Page Title="" Language="VB" MasterPageFile="~/SistemaInteligenciaNegociosOxiteno.master" AutoEventWireup="false" CodeFile="Admin_Log.aspx.vb" Inherits="Admin_Log" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   <h2>Archivos Log del sistema</h2>
   <center>
    <asp:GridView ID="GridView1" runat="server" BorderStyle="Solid" 
        BorderWidth="3px" CellPadding="4" CellSpacing="2" 
        style="text-align: center">
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
   </center>
</asp:Content>

