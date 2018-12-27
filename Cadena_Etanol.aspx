<%@ Page Title="SINO | Cadena Etanol" Language="VB" MasterPageFile="~/SistemaInteligenciaNegociosOxiteno.master" AutoEventWireup="false" CodeFile="Cadena_Etanol.aspx.vb" Inherits="Cadena_Etanol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Cadena_Etanol" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="Panel_main" runat="server">
        <h2>Cadena Etanol</h2>
    <div id="Hidrocarburos_Liquidos_1">
        <%--script de solo numeros--%>
    <script type="text/javascript">
        function numbersonly(e) {
            var unicode = e.charCode ? e.charCode : e.keyCode
            if (unicode != 8 && unicode != 44) {
                if (unicode < 48 || unicode > 57) //if not a number
                { return false } //disable key press    
            }
        }  
    </script>
    
        <table id="Tabla_1" class="page2">
            <tr>
                <td colspan="9" class="style1">
                    <br />
                    Captura un nuevo registro
                    <asp:Label ID="Lerror" runat="server" style="color: #FF0000; font-weight: 700" 
                        Visible="False"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    Año</td>
                <td >
                    Etanol</td>
                <td >
                    Etileno</td>
                <td >
                    Oxido de Etileno</td>
                <td >
                    Unidad de Medida
                </td>
                <td >
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td >
                    <asp:DropDownList ID="dropAño" runat="server">
                    </asp:DropDownList>
                    <asp:TextBox ID="txtaño0" runat="server" CssClass="Txt" 
                        onkeypress="return numbersonly(event)" ReadOnly="True" Visible="False"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtEtanol" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtEtileno" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td >
                    <asp:TextBox ID="txtO_Etileno" onkeypress="return numbersonly(event)" runat="server" CssClass="Txt"></asp:TextBox>
                </td>
                <td  >
                    <title>Miles de Barriles Diarios</title>
                    <asp:TextBox ID="txtUDM" Text="MT" runat="server" CssClass="Txt" 
                        ReadOnly="True" ToolTip="Miles de Toneladas"></asp:TextBox>
                </td>
                <td class="style10" >
                    <asp:ImageButton ID="btn_edit" runat="server" ImageUrl="~/uiResources/saveicon.png" 
                        Width="30px" ToolTip="Actualizar registro en la base de datos" 
                        Visible="False"/>
                </td>
                <td class="style10">
                    <asp:ImageButton ID="btn_cancel" runat="server" 
                        ImageUrl="~/uiResources/delete.png"
                        ToolTip="Cancelar transacción" Visible="False" 
                        Width="30px" CausesValidation="false" />
                </td>
                <td class="style10">
                    <asp:ImageButton ID="add" runat="server" ImageUrl="~/uiResources/add_icon.png" 
                        ToolTip="Agregar registro a la base de datos" ValidationGroup="" Width="30px" />
                </td>
                <td class="style10">
                    <asp:ImageButton ID="editar" runat="server" ImageUrl="~/uiResources/Edit.png"
                        ToolTip="Edita el último registro en la base de datos" CausesValidation="false" Width="30px" />
                </td>
            </tr>
            <tr>
                <td >
                    &nbsp;</td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_4" runat="server" 
                        ControlToValidate="txtEtanol" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_5" runat="server" 
                        ControlToValidate="txtEtileno" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:RequiredFieldValidator ID="RFV_6" runat="server" 
                        ControlToValidate="txtO_Etileno" ErrorMessage="Campo Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td  >
                        &nbsp;</td>
                <td  >
                        &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    </asp:Panel>
    <br />
        <div id="PanelRevision" >
        <hr />
        <h2>Tabla de registros: [SINOXCarga008_CadenaEtanol] --Producción</h2>
        <center>
            <asp:GridView ID="GV_Datos" runat="server" AutoGenerateColumns="False" 
                BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                CellPadding="4" DataSourceID="DS_Produccion" ForeColor="Black" 
                AllowPaging="True" AllowSorting="True" Width="80%" CellSpacing="2" 
                style="text-align: center">
                <Columns>
                    <asp:BoundField DataField="SINOXCarga008_Año" HeaderText="Año" 
                        SortExpression="SINOXCarga008_Año" />
                    <asp:BoundField DataField="SINOXCarga008_Etanol" HeaderText="Etanol" 
                        SortExpression="SINOXCarga008_Etanol" />
                    <asp:BoundField DataField="SINOXCarga008_Etileno" HeaderText="Etileno" 
                        SortExpression="SINOXCarga008_Etileno" />
                    <asp:BoundField DataField="SINOXCarga008_OxidoEtileno" HeaderText="Oxido Etileno" 
                        SortExpression="SINOXCarga008_OxidoEtileno" />
                    <asp:BoundField DataField="SINOXCarga008_UDM" HeaderText="UDM" 
                        SortExpression="SINOXCarga008_UDM" />
                </Columns>
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
            <asp:SqlDataSource ID="DS_Produccion" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZSINOConnectionString1 %>" 
                
                SelectCommand="SELECT * FROM [SINOXCarga008_CadenaEtanol] ORDER BY [SINOXCarga008_Año] DESC">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DS_Pruebas" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZOI1_prueba %>" 
                SelectCommand="SELECT * FROM [BKUP_CadenaEtanol] ORDER BY [SINOXCarga008_Año] DESC">
            </asp:SqlDataSource>
        </center>
    </div>

    

</asp:Content>

