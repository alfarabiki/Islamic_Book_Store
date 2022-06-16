<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="false" CodeFile="Index.aspx.vb" Inherits="Page_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        fieldset {
            display: flexbox;
            margin-left: 2px;
            margin-right: 2px;
            padding-top: 0.75em;
            padding-bottom: 0.75em;
            padding-left: 0.75em;
            padding-right: 0.75em;
            border: 2px solid;
            border-color: #4EB058;
            border-radius: 4px;
        }
    </style>
    <table style="width: 100%">
        <tr>
            <td align="center">
                <asp:Repeater ID="rpterItem" runat="server">
                    <ItemTemplate>
                        <div class="containerIsi-3kolom-in2">
                            <fieldset style="border-color: #E5E5E5;">
                                <table style="width: 100%">
                                    <tr>
                                        <td colspan="2">
                                            <i><asp:Label ID="lblinfoMaterial" Font-Bold="true" Width="100%" ForeColor="#4EB058" runat="server" Text='<%#Eval("C_DESCRIPTION")%>' /></i>
                                            <asp:Label ID="lblITEM_ID" runat="server" Text='<%#Eval("ITEM_ID")%>' Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-top: 15px; vertical-align: top">
                                            <table style="margin: 3px">
                                                <tr>
                                                    <td style="padding-left: 5px; padding-bottom: 2px;">Penerbit</td>
                                                    <td style="padding-left: 5px; padding-bottom: 2px;">:</td>
                                                    <td style="padding-left: 5px; padding-bottom: 2px;">
                                                        <asp:Label ID="lblPenerbit" runat="server" Text='<%#Eval("PENERBIT")%>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left: 5px; padding-bottom: 2px;">Harga</td>
                                                    <td style="padding-left: 5px; padding-bottom: 2px;">:</td>
                                                    <td style="padding-left: 5px; padding-bottom: 2px;">
                                                        <asp:Label ID="lblPrice" runat="server" Text='<%# "Rp. " & Format(Eval("ITEM_PRICE"), "#,##")%>'></asp:Label>
                                                        <telerik:RadNumericTextBox ID="Price" runat="server" DbValue='<%#Eval("ITEM_PRICE")%>' Display="false">
                                                        </telerik:RadNumericTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left: 5px; padding-bottom: 2px;">Bahan</td>
                                                    <td style="padding-left: 5px; padding-bottom: 2px;">:</td>
                                                    <td style="padding-left: 5px; padding-bottom: 2px;">
                                                        <asp:Label ID="lblBahanSampul" runat="server" Text='<%#Eval("BAHAN")%>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left: 5px; padding-bottom: 2px;">Jumlah</td>
                                                    <td style="padding-left: 5px; padding-bottom: 2px;">:</td>
                                                    <td style="padding-left: 5px; padding-bottom: 2px;">
                                                        <asp:Label ID="lblJumlah" runat="server" Text='<%#Format(Eval("BAL_QTY"), "#,## Buah")%>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left: 5px; padding-bottom: 2px;">Status</td>
                                                    <td style="padding-left: 5px; padding-bottom: 2px;">:</td>
                                                    <td style="padding-left: 5px; padding-bottom: 2px;">
                                                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("ITEM_STATUS")%>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="padding-left: 5px; padding-top: 5px">
                                                        <div>
                                                            <telerik:RadNumericTextBox ID="Qty" runat="server" MinValue="0" MaxValue='<%#Eval("BAL_QTY")%>' Width="60" DisplayText="0"
                                                                ShowSpinButtons="true" NumberFormat-DecimalDigits="0">
                                                            </telerik:RadNumericTextBox>
                                                            <asp:Button ID="btnAddToCart" ValidationGroup="input" ForeColor="White" BackColor="#368EE0" runat="server" CommandName="AddToCart" Text="Add To Cart" />
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="padding-top: 5px; vertical-align: top; float: right">
                                            <fieldset>
                                                <asp:ImageButton ID="Imagebook" runat="server" PostBackUrl='<%#Eval("ITEM_URL")%>' ImageAlign="Middle" Height="100px" Width="100px" ImageUrl='<%#Bind("FILE_PATH")%>'></asp:ImageButton>
                                            </fieldset>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </td>
        </tr>
        <tr>
            <td align="center">
                <table>
                    <tr>
                        <td style="padding: 2px">
                            <asp:Label ID="lbl1" runat="server" Font-Bold="True" ForeColor="#368EE0"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 2px">
                            <asp:Button ID="btnPrevious" runat="server" BackColor="#4EB058" Text="Previous"></asp:Button>
                            <asp:Button ID="btnNext" runat="server" BackColor="#4EB058" Text="    Next    "></asp:Button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

