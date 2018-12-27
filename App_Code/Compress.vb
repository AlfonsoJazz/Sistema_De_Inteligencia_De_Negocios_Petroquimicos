Imports Microsoft.VisualBasic
Imports System.IO
'Imports Imports System.IO.Compression
Imports System.IO.Compression

Public Class Compress
    Public Shared Sub compression(ByVal directorySelected As DirectoryInfo, ByVal directoryPath As String)
        For Each fileToCompress As FileInfo In directorySelected.GetFiles()

            Using originalFileStream As FileStream = fileToCompress.OpenRead()

                If (File.GetAttributes(fileToCompress.FullName) And FileAttributes.Hidden) <> FileAttributes.Hidden And fileToCompress.Extension <> ".zip" Then

                    Using compressedFileStream As FileStream = File.Create(fileToCompress.FullName & ".zip")

                        Using compressionStream As GZipStream = New GZipStream(compressedFileStream, CompressionMode.Compress)
                            originalFileStream.CopyTo(compressionStream)
                        End Using
                    End Using

                    Dim info As FileInfo = New FileInfo(directoryPath & "\" & fileToCompress.Name & ".zip")
                    ELog.save(info, "Compressed {0} from {1} to {2} bytes." + fileToCompress.Name + fileToCompress.Length.ToString() + info.Length.ToString())
                End If
            End Using
        Next
    End Sub
End Class
