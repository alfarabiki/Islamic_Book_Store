<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Index.aspx.vb" Inherits="Index" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Images/logo_login.jpg" rel="shortcut icon" type="image/x-icon" />
    <title>&nbsp;&nbsp;:: ISLAMIC BOOKSTORE ::</title>
    <link href="Css/islamicbookstore.css" rel="stylesheet" />
    <script src="Css/menu.js"></script>
    <script>
        /* ========================
               JAM dan TANGGAL
        ==========================*/
        function date_time(id) {
            date = new Date;
            year = date.getFullYear();
            month = date.getMonth();
            months = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
            d = date.getDate();
            day = date.getDay();
            days = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
            h = date.getHours();
            if (h < 10) {
                h = "0" + h;
            }
            m = date.getMinutes();
            if (m < 10) {
                m = "0" + m;
            }
            s = date.getSeconds();
            if (s < 10) {
                s = "0" + s;
            }
            result = '' + days[day] + ', ' + d + ' ' + months[month] + ' ' + year + ' | ' + h + ':' + m + ':' + s;
            document.getElementById(id).innerHTML = result;
            setTimeout('date_time("' + id + '");', '1000');
            return true;
        }
    </script>
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
</head>
<body>
    <form id="form1" runat="server">
        <cc1:msgBox ID="MsgBox1" runat="server" />
        <div class="containerTop">
            <div class="topBG1">
                <div class="tanggalan1">
                    <asp:Label ID="lblrole" CssClass="tanggalan1" runat="server"></asp:Label>
                </div>
                <div class="tanggalan" id="date_time"></div>
                <script type="text/javascript">window.onload = date_time('date_time');</script>
                <div class="topNav">
                </div>
            </div>
            <div class="topBG2">
                <div style="margin-left: 5px; margin-top: 20px; margin-right: 5px;">
                    <telerik:RadNotification ID="RadNotif" runat="server" AutoCloseDelay="10" Width="250" Title="Information"></telerik:RadNotification>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <telerik:RadMenu ID="RM_Menu" runat="server">
                        <Items>
                            <telerik:RadMenuItem Text="Home" NavigateUrl="index.aspx"></telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Cart" NavigateUrl="Login.aspx"></telerik:RadMenuItem>
                            <telerik:RadMenuItem Text="Login" NavigateUrl="Login.aspx"></telerik:RadMenuItem>
                        </Items>
                    </telerik:RadMenu>
                </div>
            </div>
        </div>
        <div style="margin-top: 90px; margin-bottom: 50px; bottom: 50px; padding-left: 5px; padding-right: 5px;">
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
                                                            <td style="padding-left: 5px; padding-bottom: 2px;">Kondisi</td>
                                                            <td style="padding-left: 5px; padding-bottom: 2px;">:</td>
                                                            <td style="padding-left: 5px; padding-bottom: 2px;">
                                                                <asp:Label ID="lblKondisi" runat="server" Text='<%#Eval("KONDISI")%>'></asp:Label>
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
                                                                    <asp:Button ID="btnAddToCart" ForeColor="White" PostBackUrl="~/Login.aspx" BackColor="#368EE0" runat="server" Text="Add To Cart" />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td style="padding-top: 5px; vertical-align: top; float: right">
                                                    <fieldset>
                                                        <asp:ImageButton ID="Imagebook" runat="server" PostBackUrl="~/Login.aspx" ImageAlign="Middle" Height="100px" Width="100px" ImageUrl='<%#Bind("FILE_PATH")%>'></asp:ImageButton>
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
        </div>
    </form>
    <div style="font-size: 14px; text-align: center; font-family: Calibri; margin-bottom: 1px; bottom: 0px; padding-top: 5px; padding-bottom: 5px; position: fixed; width: 100%; background-color: #3FD47E;">
        © Copyright :: 2017 BAYIKAWAK All Rights Reserved
    </div>
</body>
</html>
