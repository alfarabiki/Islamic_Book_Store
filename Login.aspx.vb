Imports Telerik.Web.UI
Imports System.Data.SqlClient
Imports System.Data
Partial Class Login
    Inherits System.Web.UI.Page
    Private db As New ISLAMIC_BOOKSTOREEntities

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblinfo.Text = "Cannot access, please register <a href='FormRegister.aspx'>here</a>"
        SetFocus("rtbUserId")
        If Not Page.IsPostBack Then
            Session.Abandon()
        End If
    End Sub
    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim UId As String = rtbUserId.Text
        Dim UPass As String = rtbPasssword.Text
        If rtbUserId.Text.Equals("") Then
            RadNotification1.Show("Wrong User ID")
        Else
            Dim checkData = (From a In db.tUSERs _
                             Join b In db.tROLEs On a.USER_ROLE Equals b.ROLE_CODE _
                             Where a.USER_ID = UId And a.USER_PASSWORD = UPass)
            If checkData.Count > 0 Then
                Session("uid") = checkData.FirstOrDefault.a.USER_ID
                Session("uname") = checkData.FirstOrDefault.a.USER_NAME
                Session("umail") = checkData.FirstOrDefault.a.USER_MAIL
                If checkData.FirstOrDefault.a.MULTIROLE Then
                    Response.Redirect("~/Administrator/RoleSelect.aspx")
                Else
                    Session("rolecode") = checkData.FirstOrDefault.a.USER_ROLE
                    Session("rolename") = checkData.FirstOrDefault.b.ROLE_DESCRIPTION
                    If Session("rolecode") = "RC003" Then
                        Response.Redirect("~/Home.aspx")
                    Else
                        Response.Redirect("~/Page/Dashboard.aspx")
                    End If
                End If
            Else
                RadNotification1.Show("Wrong User ID and Password Combine!")
            End If
        End If
    End Sub
End Class
