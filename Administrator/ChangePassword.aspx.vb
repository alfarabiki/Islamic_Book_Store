Imports Telerik.Web.UI
Imports System.Data.SqlClient
Imports System.Data
Partial Class Administrator_ChangePassword
    Inherits System.Web.UI.Page
    Private db As New ISLAMIC_BOOKSTOREEntities
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        SetFocus("rtbNewPassword")
    End Sub
    Protected Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click
        Dim conpassword As String = rtbConfirmPassword.Text
        Dim sesUID As String = Session("uid")
        Dim updtuser As tUSER = db.tUSERs.Where(Function(p) p.USER_ID = sesUID).FirstOrDefault()
        Try
            updtuser.USER_PASSWORD = conpassword
            db.SaveChanges()
            CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Success")
        Catch ex As Exception
            CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
        End Try
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Response.Redirect("~/Home.aspx")
    End Sub
End Class
