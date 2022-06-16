Imports System.IO
Imports Telerik.Web.UI
Imports System.Data.SqlClient

Partial Class Page_UploadFile
    Inherits System.Web.UI.Page
    Private db As New ISLAMIC_BOOKSTOREEntities
    Dim trans As SqlTransaction = Nothing
    Dim filename As String = ""
    Dim Info As String = ""
    Dim myConn As New SqlConnection(ConfigurationManager.ConnectionStrings("CS").ConnectionString)
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim ID As String = Request.QueryString("ID")
        Dim data = (From a In db.tITEMs _
                    Join b In db.tCODEs On a.ITEM_NAME Equals b.C_CODE
                    Join c In db.tCODEs On a.ITEM_STATUS Equals c.C_CODE
                    Where a.ITEM_ID = ID _
                    Select New With {.booktitle = b.C_DESCRIPTION,
                                     .status = c.C_DESCRIPTION}).FirstOrDefault

        lblJudulBuku.Text = data.booktitle
        lblStatus.Text = data.status
    End Sub
    Private Sub rgFILE_ItemCommand(sender As Object, e As Telerik.Web.UI.GridCommandEventArgs) Handles rgFILE.ItemCommand
        Select Case e.CommandName
            Case "cmdDownload"
                Dim file As FileInfo = New FileInfo(MapPath("~/Document/") & e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("FILE_NAME"))
                If file.Exists Then 'set appropriate headers  
                    Response.Clear()
                    Response.BufferOutput = False
                    Response.AddHeader("Content-Disposition", "attachment; filename=" & file.Name)
                    Response.AddHeader("Content-Length", file.Length.ToString())
                    Response.ContentType = "application/octet-stream"
                    Response.Flush()
                    Response.WriteFile(file.FullName)
                    Response.End() 'if file does not exist
                Else
                    MsgBox1.alert("File not exist in the server")
                End If
            Case "cmdUpload"
                Dim vItem As GridEditFormItem = CType(e.Item, GridEditFormItem)
                Dim chkdefault As Boolean = CType(vItem.FindControl("chkDefault"), CheckBox).Checked
                Dim x As Integer = 1
                If DirectCast(vItem.FindControl("fuDocument"), RadAsyncUpload).UploadedFiles.Count > 0 Then
                    For Each file As UploadedFile In DirectCast(vItem.FindControl("fuDocument"), RadAsyncUpload).UploadedFiles
                        myConn.Open()
                        trans = myConn.BeginTransaction
                        Try
                            System.Threading.Thread.Sleep(1000)
                            filename = DateTime.Now.ToString("ddMMyyyy.hhmmss") & file.GetExtension
                            Dim File_Path As String = "~/Document/" & filename
                            If update_document(Request.QueryString("ID").ToString, file, File_Path, chkdefault) Then
                                If Not (Directory.Exists(Server.MapPath("~/Document/"))) Then
                                    IO.Directory.CreateDirectory(Server.MapPath("~/Document/"))
                                End If
                                Dim uploadpath As String = Server.MapPath("~/Document/") & filename 'fullfilename
                                If IO.File.Exists(uploadpath) Then
                                    IO.File.Delete(uploadpath)
                                    file.SaveAs(uploadpath)
                                Else
                                    file.SaveAs(uploadpath)
                                End If
                                trans.Commit()
                                myConn.Close()
                                Info = Info & "" & x & ". " & file.GetName & " : File was Uploaded"
                            Else
                                Info = Info & "" & x & ". " & file.GetName & " : Error test"
                            End If
                            MsgBox1.alert(Info)
                            x = x + 1
                            rgFILE.MasterTableView.IsItemInserted = False
                            rgFILE.MasterTableView.Rebind()
                        Catch ex As IOException
                            MsgBox1.alert("Error uploading file : " & ex.Message)
                            trans.Rollback()
                            myConn.Close()
                        End Try
                    Next
                End If
            Case "cmdDelete"
                myConn.Open()
                trans = myConn.BeginTransaction
                Dim filesname As String = e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("FILE_NAME_ORI")
                If delete_file(e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("FILE_ID"), e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("FILE_NAME")) Then
                    MsgBox1.alert("File " & filesname & " deleted !")
                    rgFILE.DataBind()
                End If
        End Select
    End Sub
    Private Function update_document(p1 As String, p2 As UploadedFile, p3 As String, p4 As Boolean) As Boolean
        Dim sFile As New tDOCUMENT
        sFile.FILE_ID = System.Guid.NewGuid.ToString()
        sFile.ITEM_ID = p1
        sFile.FILE_NAME = DateTime.Now.ToString("ddMMyyyy.hhmmss") & p2.GetExtension
        sFile.FILE_PATH = p3
        sFile.CUR_FILE = p4
        sFile.FILE_NAME_ORI = p2.FileName
        sFile.UPLOADBY = Session("uid")
        sFile.UPLOADDATE = Now
        sFile.FILE_SIZE = p2.ContentLength
        sFile.FILE_TYPE = p2.GetExtension
        Try
            db.tDOCUMENTs.Add(sFile)
            db.SaveChanges()
            MsgBox1.alert("File has been uploaded successfully !")
            Return True
        Catch ex As Exception
            Response.Write("error is:" & ex.Message)
            Return False
        End Try
    End Function
    Function delete_file(ByVal file_id As String, ByVal filename As String) As Boolean
        Dim files As tDOCUMENT = db.tDOCUMENTs.Where(Function(p) p.FILE_ID = file_id).FirstOrDefault
        Try
            db.tDOCUMENTs.Remove(files)
            db.SaveChanges()
            Dim filepath As String = Server.MapPath("~/Document/") & "/" & filename
            If File.Exists(filepath) Then
                Try
                    File.Delete(filepath)
                    trans.Commit()
                    myConn.Close()
                    Return True
                Catch ex As IOException
                    MsgBox1.alert("Error deleting file : " & ex.Message)
                    trans.Rollback()
                    myConn.Close()
                    Return False
                End Try
            Else
                MsgBox1.alert("Error deleting file : File not exist")
                trans.Rollback()
                myConn.Close()
                Return False
            End If
        Catch ex As SqlException
            MsgBox1.alert("Error deleting file : " & ex.Message)
            Return False
        End Try
    End Function
End Class
