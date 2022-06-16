Imports Telerik.Web.UI

Partial Class Administrator_RoleSelect
    Inherits System.Web.UI.Page
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
                Dim userid As String = Session("uid")
                If menu.Count > 0 Then
                    Dim autorhize = (From a In db.tROLESMENUs _
                                     Join b In db.tASSIGNMENTs On a.ROLE_CODE Equals b.ROLE_CODE _
                                     Join c In db.tUSERs On b.USER_ID Equals c.USER_ID _
                                     Where a.MENU_ID = menu.FirstOrDefault.MENU_ID And c.MULTIROLE = True And c.USER_ID = userid)
                    If autorhize.Count > 0 Then
                        If autorhize.FirstOrDefault.a.SELECT = False Then
                            Response.Redirect("~/FormRegister.aspx?Permission=F97E75BF-69DF-444B-96D6-C0D98AE51C98")
                        End If
                    Else
                        Response.Redirect("~/FormRegister.aspx?Permission=F97E75BF-69DF-444B-96D6-C0D98AE51C98")
                    End If
                End If
            Else
                Response.Redirect("~/Login.aspx")
            End If
        End If
    End Sub
    Private Sub rgSelectRole_ItemCommand(sender As Object, e As Telerik.Web.UI.GridCommandEventArgs) Handles rgSelectRole.ItemCommand
        Select Case e.CommandName
            Case "cmdselect"
                Dim dataItem As GridDataItem = CType(e.Item, GridDataItem)
                Dim datakey As String = dataItem.OwnerTableView.DataKeyValues(dataItem.ItemIndex)("ASSIGNMENT_ID").ToString
                Dim data = (From myrole In db.vMYROLEs _
                            Where myrole.ASSIGNMENT_ID = datakey _
                            Select New With {.userid = myrole.USER_ID,
                                             .rolename = myrole.ROLE_DESCRIPTION,
                                             .rolecode = myrole.ROLE_CODE}).FirstOrDefault
                Session("rolename") = data.rolename
                Session("rolecode") = data.rolecode
                Dim iduser As String = data.userid
                Dim upduser As tUSER = db.tUSERs.Where(Function(p) p.USER_ID = iduser).FirstOrDefault()
                upduser.USER_ROLE = data.rolecode
                db.SaveChanges()

                If data.rolecode.Contains("RC002") Then
                    Response.Redirect("~/Page/Dashboard.aspx")
                Else
                    Response.Redirect("~/Home.aspx")
                End If
        End Select
    End Sub
End Class
