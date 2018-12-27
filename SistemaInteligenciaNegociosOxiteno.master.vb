Imports System.Configuration.ConfigurationManager

Partial Class SistemaInteligenciaNegociosOxiteno
    Inherits System.Web.UI.MasterPage

    Private u As String = String.Empty

    Protected Sub NavigationMenu_MenuItemClick(sender As Object, e As System.Web.UI.WebControls.MenuEventArgs) Handles NavigationMenu.MenuItemClick
        If NavigationMenu.SelectedValue = "Cerrar sesión" Then
            ELog.save(Me, "El usuario " + Session("Usuario") + " ha cerrado sesión con éxito")
            Response.Write("Server event raised -- you clicked: " & Menu.MenuItemClickCommandName.ToString)
            Session.RemoveAll()
            Session.Abandon()
            'Session("USER") = Nothing
            FormsAuthentication.SignOut()
            FormsAuthentication.RedirectFromLoginPage("n_Usuario", False)
            Response.Redirect("~/Account/Login.aspx")
        End If
        ELog.save(Me, u + " está en: " + HttpContext.Current.Request.Url.AbsoluteUri)
    End Sub

    'Protected Sub Ubicacion_Usuario(sender As Object, e As System.EventArgs) Handles MainContent.PreRender
    '    ELog.save(Me, HttpContext.Current.Request.Url.AbsoluteUri)
    'End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim admins() As String = {AppSettings.Get("Admin1").ToString, AppSettings.Get("Admin2").ToString, _
                     AppSettings.Get("Admin3").ToString, AppSettings.Get("Admin4").ToString}
        Dim mnuItems As MenuItemCollection = NavigationMenu.Items
        Dim nuevoItem As New MenuItem

        If Session("Usuario") Is Nothing Then
            Session.RemoveAll()
            Session.Abandon()
            Response.Redirect("~/Account/Login.aspx")
        Else
            u = Session("Usuario").ToString
            lUsuario.Text = u
            If admins.Contains(u) Then
                lUsuario.Text = "[Admin] " + u
                AppSettings.Set("Sesion_Actual", "[Admin] " + u)
            End If
        End If
    End Sub
End Class

