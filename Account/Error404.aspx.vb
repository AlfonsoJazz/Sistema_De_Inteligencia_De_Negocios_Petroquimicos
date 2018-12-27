
Partial Class Error404
    Inherits System.Web.UI.Page

    Protected Sub Inicio_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles Inicio.Click
        Response.Redirect("~/Default.aspx")
    End Sub
End Class
