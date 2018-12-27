Imports System.Data
Imports System.IO

Partial Class Admin_Log
    Inherits System.Web.UI.Page

    'Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
    '    Dim ruta As String = Server.MapPath("~/log")
    '    Dim i, j, n As Integer
    '    Dim dt As New DataTable
    '    Dim Link As String = String.Empty
    '    ' Dim dInfo As DirectoryInfo
    '    Dim fInfo As FileInfo
    '    Try
    '        Dim lista1() As String
    '        lista1 = System.IO.Directory.GetFiles(ruta)
    '        Dim lista2 As System.Collections.IEnumerator
    '        lista2 = lista1.GetEnumerator
    '        i = lista1.Length
    '        j = ruta.Length

    '        dt.Columns.Add("Id")
    '        dt.Columns.Add("Archivos Log")
    '        dt.Columns.Add("Descargar")

    '        For Each File In lista1
    '            fInfo = New FileInfo(File)
    '            Dim R As DataRow = dt.NewRow
    '            Dim hLink As New HyperLink
    '            hLink.NavigateUrl = fInfo.FullName.ToString
    '            hLink.Text = "Descarga"
    '            R("Id") = n
    '            R("Archivos Log") = fInfo.Name.ToString
    '            R("Descargar") = hLink.Text
    '            dt.Rows.Add(R)
    '            n = n + 1

    '        Next
    '        GridView1.DataSource = dt
    '        GridView1.DataBind()

    '    Catch ex As Exception
    '        ELog.save(Me, ex.Message.ToString)
    '    End Try
    'End Sub


End Class
