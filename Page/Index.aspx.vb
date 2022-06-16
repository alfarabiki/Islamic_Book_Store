Imports Telerik.Web.UI
Imports System.Data.SqlClient
Imports System.Data

Partial Class Page_Index
    Inherits System.Web.UI.Page
    Private db As New ISLAMIC_BOOKSTOREEntities
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("CS").ConnectionString)
    Dim str As String
    Dim com As SqlCommand
    Dim sqlda As SqlDataAdapter
    Dim ds As DataSet
    Protected Sub rpterItem_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles rpterItem.ItemCommand
        Select Case e.CommandName
            Case "AddToCart"
                Dim vItem As RepeaterItem = CType(e.Item, RepeaterItem)
                Dim uid As String = Session("uid")
                Dim Qty As Integer = CType(vItem.FindControl("Qty"), RadNumericTextBox).DbValue
                Dim Price As Integer = CType(vItem.FindControl("Price"), RadNumericTextBox).DbValue
                Dim ItemId As String = CType(vItem.FindControl("lblITEM_ID"), Label).Text
                Dim ItemStatus As String = CType(vItem.FindControl("lblStatus"), Label).Text
                If Qty > 0 Then
                    Dim insitem As New tCART
                    insitem.CART_ID = System.Guid.NewGuid.ToString
                    insitem.ITEM_ID = ItemId
                    insitem.ITEM_QTY = Qty
                    insitem.ITEM_PRICE = Price
                    insitem.TOTAL_PRICE = Qty * Price
                    insitem.ITEM_STATUS = "BELI"
                    insitem.USER_ID = Session("uid")
                    insitem.CREATEDBY = Session("uid")
                    insitem.CREATEDDATE = Now
                    Try
                        db.tCARTs.Add(insitem)
                        Dim ITEM_ID As String = ItemId
                        Dim uITEM As tITEM = db.tITEMs.Where(Function(p) p.ITEM_ID = ITEM_ID).SingleOrDefault
                        Dim PurchaseQty As Decimal = uITEM.PURC_QTY + Qty
                        uITEM.PURC_QTY = PurchaseQty

                        uITEM.BAL_QTY = uITEM.TOTAL_QTY - PurchaseQty

                        db.SaveChanges()
                        Response.Redirect("~/Page/Index.aspx")
                    Catch ex As Exception
                        CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("eror " + ex.Message)
                    End Try
                Else
                    CType(Master.FindControl("MsgBox1"), BunnyBear.msgBox).alert("Minimum Qty = 1")
                End If
        End Select
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            bindrepeater()
        End If
    End Sub
    Private Sub bindrepeater()
        con.Open()
        com = New SqlCommand("SP_FILE_INDEX", con)
        sqlda = New SqlDataAdapter(com)
        ds = New DataSet
        sqlda.Fill(ds, "List Of Book")
        Dim Pds1 As New PagedDataSource()
        Pds1.DataSource = ds.Tables(0).DefaultView
        Pds1.AllowPaging = True
        Pds1.PageSize = 6
        Pds1.CurrentPageIndex = CurrentPage
        lbl1.Text = "Showing Page: " & (CurrentPage + 1).ToString() & " of " & Pds1.PageCount.ToString()
        btnPrevious.Enabled = Not Pds1.IsFirstPage
        btnNext.Enabled = Not Pds1.IsLastPage
        rpterItem.DataSource = Pds1
        rpterItem.DataBind()
        con.Close()
    End Sub
    Public Property CurrentPage() As Integer
        Get
            Dim s1 As Object = Me.ViewState("CurrentPage")
            If s1 Is Nothing Then
                Return 0
            Else
                Return CInt(s1)
            End If
        End Get
        Set(ByVal value As Integer)
            Me.ViewState("CurrentPage") = value
        End Set
    End Property
    Protected Sub btnNext_Click(ByVal sender As Object, e As EventArgs) Handles btnNext.Click
        CurrentPage += 1
        bindrepeater()
    End Sub
    Protected Sub btnPrevious_Click(sender As Object, e As EventArgs) Handles btnPrevious.Click
        CurrentPage -= 1
        bindrepeater()
    End Sub
End Class
