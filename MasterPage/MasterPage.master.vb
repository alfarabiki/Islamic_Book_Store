
Partial Class MasterPage_MasterPage
    Inherits System.Web.UI.MasterPage
    Private db As New ISLAMIC_BOOKSTOREEntities
    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Session("uid") = "" Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblrole.Text = "Welcome, " + Session("uname") + " [" + Session("uid") + "], you are logged in this web as <b>" & Session("rolename") & "</b>"
        If Not Page.IsPostBack Then
            Dim pathPage As String = Request.AppRelativeCurrentExecutionFilePath
            If Session("uid") <> "" Then
                Dim menu = (From a In db.tMENUs Where a.MENU_URL = pathPage)
                If menu.Count > 0 Then
                    Dim role_id As String = Session("rolecode").ToString
                    Dim autorhize = (From a In db.tROLESMENUs Where a.MENU_ID = menu.FirstOrDefault.MENU_ID And a.ROLE_CODE = role_id)
                    If autorhize.Count > 0 Then
                        If autorhize.FirstOrDefault.SELECT = False Then
                            Response.Redirect("~/FormRegister.aspx?Permission=F97E75BF-69DF-444B-96D6-C0D98AE51C98")
                        End If
                    Else
                        Response.Redirect("~/Administrator/SelectRole.aspx")
                    End If
                End If
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub
End Class

