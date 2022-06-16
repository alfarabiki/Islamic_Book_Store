<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="false" CodeFile="InputDetailData.aspx.vb" Inherits="Administrator_InputDetailData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            var popUp;
            function PopUpShowing(sender, eventArgs) {
                popUp = eventArgs.get_popUp();
                var screenSize = $telerik.getViewPortSize();
                var gridtop = sender.get_element().offsetTop;
                var gridWidth = screenSize.width;
                var gridHeight = screenSize.height;
                var popUpWidth = popUp.style.width.substr(0, popUp.style.width.indexOf("px"));
                var popUpHeight = popUp.style.height.substr(0, popUp.style.height.indexOf("px"));
                popUp.style.left = Math.round(((gridWidth - popUpWidth) / 2 + sender.get_element().offsetLeft)).toString() + "px";
                popUp.style.top = (gridtop + 100).toString() + "px";
            }
        </script>
    </telerik:RadCodeBlock>
    <div>
        <table style="width: 100%;">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td>
                                <h1 style="color: #4EB058;">Input Detail Data</h1>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadGrid ID="rgInputDetailData" runat="server" DataSourceID="dsInputDetailData" GroupPanelPosition="Top">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="DETAIL_ID" DataSourceID="dsInputDetailData"
                                        CommandItemDisplay="Top" EditMode="PopUp" CommandItemSettings-ShowAddNewRecordButton="false">
                                        <Columns>
                                            <telerik:GridButtonColumn ConfirmText="Delete this Data?" ConfirmDialogType="RadWindow" Visible="false"
                                                ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete" UniqueName="DELETE">
                                                <HeaderStyle HorizontalAlign="Center" Width="20" Font-Bold="true" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="20" CssClass="MyImageButton" />
                                            </telerik:GridButtonColumn>
                                            <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="Edit">
                                                <HeaderStyle HorizontalAlign="Center" Width="20" Font-Bold="true" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="20" />
                                            </telerik:GridEditCommandColumn>
                                            <telerik:GridBoundColumn DataField="C_DESCRIPTION" FilterControlAltText="Filter C_DESCRIPTION column" HeaderText="Judul Buku"
                                                SortExpression="C_DESCRIPTION" UniqueName="C_DESCRIPTION" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="290px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Left" Width="290px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="C_CODE" FilterControlAltText="Filter C_CODE column" HeaderText="Code Barang"
                                                SortExpression="C_CODE" UniqueName="C_CODE" EmptyDataText="-" Display="false">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="100" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="100" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ITEM_ID" FilterControlAltText="Filter ITEM_ID column" HeaderText="Item Id"
                                                SortExpression="ITEM_ID" UniqueName="C_CODE" EmptyDataText="-" Display="False">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="100" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="100" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ITEM_QTY" FilterControlAltText="Filter ITEM_QTY column" HeaderText="Jumlah"
                                                ReadOnly="True" SortExpression="ITEM_QTY" UniqueName="ITEM_QTY" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="30px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="30px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ITEM_PRICE" FilterControlAltText="Filter ITEM_PRICE column" HeaderText="Harga"
                                                SortExpression="ITEM_PRICE" UniqueName="ITEM_PRICE" EmptyDataText="-" DataFormatString="{0:#,##0.00}">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="100px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Right" Width="100px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="KATEGORI" FilterControlAltText="Filter KATEGORI column" HeaderText="Kategori"
                                                SortExpression="KATEGORI" UniqueName="KATEGORI" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="50px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PENERBIT" FilterControlAltText="Filter PENERBIT column" HeaderText="Penerbit"
                                                SortExpression="PENERBIT" UniqueName="PENERBIT" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="260px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Left" Width="260px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="KONDISI" FilterControlAltText="Filter KONDISI column" HeaderText="Kondisi"
                                                SortExpression="KONDISI" UniqueName="KONDISI" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="250px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="250px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="BAHAN" FilterControlAltText="Filter BAHAN column" HeaderText="Bahan"
                                                SortExpression="BAHAN" UniqueName="BAHAN" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="250px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="250px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="DETIL_PRODUK" FilterControlAltText="Filter DETIL_PRODUK column" HeaderText="Detil Produk"
                                                SortExpression="DETIL_PRODUK" UniqueName="DETIL_PRODUK" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="450px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Left" Width="450px" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings EditFormType="Template" EditColumn-HeaderText="Add Item">
                                            <PopUpSettings Modal="true" Width="450" />
                                            <FormTemplate>
                                                <table>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Judul Buku</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadComboBox ID="rcbJudulBuku" runat="server" Width="270px" SelectedValue='<%# Bind("ITEM_ID")%>'
                                                                DataSourceID="dsJudulBuku" DataTextField="C_DESCRIPTION" DataValueField="ITEM_ID" Filter="Contains"
                                                                Enabled='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "True", "False")%>'>
                                                            </telerik:RadComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Folder Page</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="rtbFolderPage" runat="server" MaxLength="50" Text='<%# Bind("FOLDER_PAGE")%>' Width="270px">
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Application Page</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="rtbApplicationPage" runat="server" MaxLength="50" Text='<%# Bind("APPLICATION_PAGE")%>' Width="270px">
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Kategori</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="rtbKategori" runat="server" MaxLength="50" Text='<%# Bind("KATEGORI")%>' Width="270px">
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Penerbit</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="rtbPenerbit" runat="server" MaxLength="350" Text='<%# Bind("PENERBIT")%>' Width="270px">
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Kondisi</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="rtbKondisi" runat="server" MaxLength="250" Text='<%# Bind("KONDISI")%>' Width="270px">
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Bahan</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;padding-bottom:10px">
                                                            <telerik:RadTextBox ID="rtbBahan" runat="server" MaxLength="250" Text='<%# Bind("BAHAN")%>' Width="270px">
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Detil Produk</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="rtbDetilProduk" runat="server" MaxLength="500" TextMode="MultiLine" Width="270px"
                                                                Text='<%# Bind("DETIL_PRODUK")%>' Height="120">
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td style="padding: 50px;">
                                                            <telerik:RadButton ID="BtnInsert" runat="server" ValidationGroup="Insert" Width="70"
                                                                Text='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "Save", "Update")%>'
                                                                CommandName='<%# IIf( DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "PerformInsert", "Update") %>'>
                                                            </telerik:RadButton>
                                                            <telerik:RadButton ID="BtnCancel" runat="server" ValidationGroup="Cancel" Text="Cancel" Width="70"
                                                                CommandName="Cancel">
                                                            </telerik:RadButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </FormTemplate>
                                        </EditFormSettings>
                                        <EditFormSettings>
                                            <EditColumn FilterControlAltText="Filter EditCommandColumn column" ButtonType="ImageButton">
                                            </EditColumn>
                                        </EditFormSettings>
                                    </MasterTableView>
                                    <ClientSettings>
                                        <ClientEvents OnPopUpShowing="PopUpShowing" />
                                    </ClientSettings>
                                </telerik:RadGrid>
                            </td>
                        </tr>
                    </table>
                    <asp:SqlDataSource ID="dsInputDetailData" runat="server" SelectCommandType="StoredProcedure"
                        ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="USP_INPUTDETAILDATA"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsJudulBuku" runat="server" SelectCommandType="StoredProcedure"
                        ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="USP_LIST_BUKU"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

