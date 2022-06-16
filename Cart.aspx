<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="false" CodeFile="Cart.aspx.vb" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        fieldset {
            display: block;
            margin-left: 2px;
            margin-right: 2px;
            padding-top: 0.35em;
            padding-bottom: 0.625em;
            padding-left: 0.75em;
            padding-right: 0.75em;
            border: 2px solid;
            border-color: #368EE0;
            border-radius: 4px;
        }

        legend {
            width: 150px;
            padding-left: 10px;
            font-weight: bold;
            font-size: medium;
            font-style: normal;
            font-variant: small-caps;
            border: none;
        }
    </style>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" EnableAJAX="True">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="rcbBankCode">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="kodebayar" LoadingPanelID="AjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="AjaxLoadingPanel1" runat="server" />
    <telerik:RadWindow runat="server" ID="rwPayment" Modal="true" Width="400" Height="200" CenterIfModal="true"
        VisibleOnPageLoad="false" EnableViewState="false">
        <ContentTemplate>
            <table style="width: 100%">
                <tr>
                    <td style="padding-left: 10px; padding-bottom: 10px; padding-top: 10px">Bank</td>
                    <td style="padding-left: 10px; padding-bottom: 10px; padding-top: 10px">:</td>
                    <td style="padding-left: 10px; padding-bottom: 10px; padding-top: 10px">
                        <telerik:RadComboBox ID="rcbBankCode" Width="200" EmptyMessage="Choose Bank.." Height="80" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rcbBankCode_SelectedIndexChanged">
                            <Items>
                                <telerik:RadComboBoxItem Text="MUAMALAT" Value="147" />
                                <telerik:RadComboBoxItem Text="BNI SYARIAH" Value="427" />
                                <telerik:RadComboBoxItem Text="MANDIRI SYARIAH" Value="451" />
                            </Items>
                        </telerik:RadComboBox>
                    </td>
                </tr>

                <tr>
                    <td style="padding-left: 10px; padding-bottom: 10px;"></td>
                    <td style="padding-left: 10px; padding-bottom: 10px;"></td>
                    <td style="padding-left: 10px; padding-bottom: 10px;">
                        <telerik:RadButton runat="server" ID="btnSubmit" Text="Bayar">
                        </telerik:RadButton>
                        <telerik:RadButton runat="server" ID="btnCancel" Text="Cancel">
                        </telerik:RadButton>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:Label ID="lblInfo" runat="server" Font-Bold="true" Font-Size="Smaller" Text="* pastikan setelah anda memilih bank catat kode pembayarannya" ForeColor="#4EB058"></asp:Label></td>
                </tr>
            </table>
            <table style="width: 100%" id="kodebayar" runat="server" visible="false">
                <tr>
                    <td align="center" style="padding-top: 20px">
                        <asp:Label ID="lblkodepembayaran" runat="server" Text="Anda belum memilih Bank" ForeColor="#368EE0"></asp:Label></td>
                </tr>
            </table>
        </ContentTemplate>
    </telerik:RadWindow>
    <fieldset style="border-color: #E5E5E5;">
        <legend style="padding-top: 5px;">Isi Keranjang Saya</legend>
        <div id="paymentarea" runat="server" visible="false">
            <table style="width: 100%">
                <tr>
                    <td>
                        <asp:Button ID="btnPayment" runat="server" Text="Lakukan Pembayaran" BackColor="#4EB058" Font-Bold="true" ForeColor="White" />
                    </td>
                    <td align="Right">
                        <telerik:RadRotator ID="rrInformation" Height="18px" runat="server" DataSourceID="dsInfoPembayaran" ItemWidth="650"
                            Width="610" ScrollDuration="5900" ScrollDirection="left" FrameDuration="1500">
                            <ItemTemplate>
                                <div>
                                    <div>
                                        << Segera Lakukan Pembayaran Anda Sebelum Tanggal ( <b style="color: red"><%# Format(Eval("CLOSING_DATE"), "dd MMMM yyyy Pukul hh:mm")%> </b>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </div>
                                </div>
                            </ItemTemplate>
                        </telerik:RadRotator>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <telerik:RadGrid ID="rgCartList" runat="server" DataSourceID="dsCartList" GroupPanelPosition="Top">
                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="CART_ID" DataSourceID="dsCartList" CommandItemDisplay="None" ShowFooter="true">
                    <Columns>
                        <telerik:GridButtonColumn ButtonType="ImageButton" ImageUrl="~/Images/view_detail.png" CommandName="cmdDetail"
                            HeaderText="Details" Text="Klik to View Details" UniqueName="Detail">
                            <HeaderStyle HorizontalAlign="Center" Width="60px" Font-Bold="true" BackColor="#368EE0" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                            <FooterStyle HorizontalAlign="Right" Width="60px" BackColor="#4EB058" Font-Bold="true" />
                        </telerik:GridButtonColumn>
                        <telerik:GridBoundColumn DataField="ITEM_DESCRIPTION" FilterControlAltText="Filter ITEM_DESCRIPTION column" HeaderText="Judul Buku"
                            SortExpression="ITEM_DESCRIPTION" UniqueName="ITEM_DESCRIPTION" EmptyDataText="-">
                            <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="290px" BackColor="#368EE0" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" Width="290px" />
                            <FooterStyle HorizontalAlign="Right" Width="290px" BackColor="#4EB058" Font-Bold="true" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CREATEDDATE" FilterControlAltText="Filter CREATEDDATE column" HeaderText="Tgl. Transaksi"
                            SortExpression="CREATEDDATE" UniqueName="CREATEDDATE" EmptyDataText="-" DataFormatString="{0: dd/MM/yyyy}">
                            <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="100px" BackColor="#368EE0" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" Width="90px" />
                            <FooterStyle HorizontalAlign="Right" Width="90px" BackColor="#4EB058" Font-Bold="true" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ITEM_STATUS" FilterControlAltText="Filter ITEM_STATUS column" HeaderText="Status"
                            SortExpression="ITEM_STATUS" UniqueName="ITEM_STATUS" EmptyDataText="-">
                            <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="100px" BackColor="#368EE0" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                            <FooterStyle HorizontalAlign="Right" Width="100px" BackColor="#4EB058" Font-Bold="true" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ITEM_PRICE" FilterControlAltText="Filter ITEM_PRICE column" HeaderText="Harga"
                            SortExpression="ITEM_PRICE" UniqueName="ITEM_PRICE" EmptyDataText="-" DataFormatString="{0:#,##0.00}">
                            <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="100px" BackColor="#368EE0" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Right" Width="100px" />
                            <FooterStyle HorizontalAlign="Right" Width="100px" BackColor="#4EB058" Font-Bold="true" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ITEM_QTY" FilterControlAltText="Filter ITEM_QTY column" HeaderText="Jumlah"
                            ReadOnly="True" SortExpression="ITEM_QTY" UniqueName="ITEM_QTY" EmptyDataText="-" Aggregate="Sum" FooterAggregateFormatString="{0:#}">
                            <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="60px" BackColor="#368EE0" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                            <FooterStyle HorizontalAlign="Center" Width="60px" BackColor="#4EB058" Font-Bold="true" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TOTAL_PRICE" FilterControlAltText="Filter TOTAL_PRICE column" HeaderText="Total Harga"
                            SortExpression="TOTAL_PRICE" UniqueName="TOTAL_PRICE" EmptyDataText="-" DataFormatString="{0:#,##0.00}" Aggregate="Sum">
                            <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="120px" BackColor="#368EE0" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Right" Width="120px" />
                            <FooterStyle HorizontalAlign="Right" Width="120px" BackColor="#4EB058" Font-Bold="true" />
                        </telerik:GridBoundColumn>
                        <telerik:GridButtonColumn ButtonType="PushButton" ImageUrl="~/Images/view_detail.png" CommandName="Delete"
                            Text="Batalkan" HeaderTooltip="Klik untuk melakukan Pembatalan" UniqueName="Cancel" HeaderText="Pembatalan">
                            <HeaderStyle HorizontalAlign="Center" Width="90px" Font-Bold="true" BackColor="#368EE0" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" />
                            <FooterStyle HorizontalAlign="Center" Width="90px" BackColor="#4EB058" Font-Bold="true" />
                        </telerik:GridButtonColumn>
                        <telerik:GridBoundColumn DataField="PAYMENT_STATUS" FilterControlAltText="Filter PAYMENT_STATUS column" HeaderText="Status Pembayaran"
                            SortExpression="PAYMENT_STATUS" UniqueName="PAYMENT_STATUS" EmptyDataText="Belum Terbayar">
                            <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="120px" BackColor="#4EB058" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" Width="120px" />
                            <FooterStyle HorizontalAlign="Center" Width="120px" BackColor="#4EB058" Font-Bold="true" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PAYMENT_DATE" FilterControlAltText="Filter PAYMENT_DATE column" HeaderText="Tgl. Pembayaran"
                            SortExpression="PAYMENT_DATE" UniqueName="PAYMENT_DATE" EmptyDataText="-" DataFormatString="{0: dd/MM/yyyy}">
                            <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="120px" BackColor="#4EB058" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" Width="120px" />
                            <FooterStyle HorizontalAlign="Right" Width="120px" BackColor="#4EB058" Font-Bold="true" />
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
                <ClientSettings>
                    <Scrolling ScrollHeight="250" AllowScroll="true" UseStaticHeaders="true" />
                </ClientSettings>
            </telerik:RadGrid>
        </div>
    </fieldset>
    <asp:SqlDataSource ID="dsInfoPembayaran" runat="server" SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="USP_INFO_PEMBAYARAN">
        <SelectParameters>
            <asp:SessionParameter Name="USER_ID" SessionField="uid" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsCartList" runat="server" SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="USP_CART_LIST">
        <SelectParameters>
            <asp:SessionParameter Name="USER_ID" SessionField="uid" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

