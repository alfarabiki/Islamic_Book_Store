Imports Telerik.Web.UI
Imports System.Data.SqlClient
Imports System.Data
Partial Class Index
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("CS").ConnectionString)
    Dim str As String
    Dim com As SqlCommand
    Dim sqlda As SqlDataAdapter
    Dim ds As DataSet
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
