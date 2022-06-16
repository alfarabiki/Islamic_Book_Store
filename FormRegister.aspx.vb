Imports Telerik.Web.UI
Imports System.Data.SqlClient
Imports System.Data
Partial Class FormRegister
    Inherits System.Web.UI.Page
    Private db As New ISLAMIC_BOOKSTOREEntities
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        SetFocus("rtbName")
        If Not Page.IsPostBack Then
            Dim userIdhint = (From a In db.tUSERs Select a.USER_ID).Max
            rtbUserId.Text = userIdhint + 1
            permit.Text = LTrim("" & Request.QueryString("permission"))
            If permit.Text.Equals("F97E75BF-69DF-444B-96D6-C0D98AE51C98") Then
                lblinfo.Text = "You don't have permission to access this page. Please, register here.."
            Else
                lblinfo.Text = "Can't access this web. Please, register here.."
            End If
        End If
    End Sub

    Protected Sub btnRegister_Command(sender As Object, e As CommandEventArgs) Handles btnRegister.Command
        Select Case e.CommandName
            Case "Insert"
                If rtbUserId.Text.Equals("") Or rtbName.Text.Equals("") Or rtbEmail.Text.Equals("") Or rtbPassword.Text.Equals("") Or rtbConfirmPassword.Text.Equals("") Then
                    RadNotification1.Show("Do not leave a mandatory field!")
                Else
                    If rtbConfirmPassword.Text = rtbPassword.Text Then
                        Dim UId As String = rtbUserId.Text
                        Dim checkData = (From a In db.tUSERs Where a.USER_ID = UId)
                        If checkData.Count > 0 Then
                            RadNotification1.Show("Your data already has been!")
                        Else
                            Dim insUSER As New tUSER
                            insUSER.USER_ID = rtbUserId.Text
                            insUSER.USER_NAME = rtbName.Text
                            insUSER.MULTIROLE = False
                            insUSER.USER_ROLE = "RC003"
                            insUSER.USER_ADDRESS = rtbAddress.Text
                            insUSER.USER_MOBILE = rtbMobile.Text
                            insUSER.USER_MAIL = rtbEmail.Text
                            insUSER.USER_PASSWORD = rtbPassword.Text
                            insUSER.CREATEDBY = rtbUserId.Text
                            insUSER.CREATEDDATE = Now
                            db.tUSERs.Add(insUSER)
                            db.SaveChanges()
                            Response.Redirect("Login.aspx")
                        End If
                    Else
                        rtbUserId.Text = ""
                        rtbName.Text = ""
                        rtbAddress.Text = ""
                        rtbMobile.Text = ""
                        rtbEmail.Text = ""
                        rtbPassword.Text = ""
                        rtbConfirmPassword.Text = ""
                        RadNotification1.Show("Your Confirm Password Not Match! Please, Repeat Your Password")
                    End If

                End If
        End Select
    End Sub

    Protected Sub btnBack_Click(sender As Object, e As EventArgs) Handles btnBack.Click
        Response.Redirect("Login.aspx")
    End Sub
End Class
