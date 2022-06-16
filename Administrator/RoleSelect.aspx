<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RoleSelect.aspx.vb" Inherits="Administrator_RoleSelect" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="msgBox" Namespace="BunnyBear" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Images/logo_login.jpg" rel="shortcut icon" type="image/x-icon" />
    <title>&nbsp;&nbsp;:: ISLAMIC BOOKSTORE ::</title>
    <link href="../Css/islamicbookstore.css" rel="stylesheet" />
    <script src="../Css/menu.js"></script>
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
                    <telerik:RadMenu ID="RM_Menu" runat="server" DataFieldID="MENU_ID"
                        DataNavigateUrlField="MENU_URL" DataSourceID="DS_Menu" DataTextField="MENU_DESCRIPTION" DataValueField="MENU_VALUE" DataFieldParentID="PARENT_ID">
                    </telerik:RadMenu>
                    <asp:SqlDataSource ID="DS_MENU" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>"
                        SelectCommand="USP_LISTMENU" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="ROLECODE" SessionField="rolecode" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
        <div style="margin-top: 90px; margin-bottom: 50px; bottom: 50px; padding-left: 5px; padding-right: 5px;">
            <table style="width: 100%;">
                <tr>
                    <td style="align-content: center; padding: 10px">
                        <telerik:RadGrid ID="rgSelectRole" runat="server" AllowFilteringByColumn="false" AutoGenerateColumns="false"
                            AllowPaging="true" PageSize="20" Width="100%" DataSourceID="DS_SelectRole">
                            <MasterTableView Name="MasterTable" runat="server" DataKeyNames="ASSIGNMENT_ID" DataSourceID="DS_SelectRole">
                                <Columns>
                                    <telerik:GridBoundColumn HeaderText="User Name" DataField="USER_NAME" UniqueName="USER_NAME"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"
                                        ShowFilterIcon="false" FilterControlWidth="270px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="User Email" DataField="USER_MAIL" UniqueName="USER_MAIL"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"
                                        ShowFilterIcon="false" FilterControlWidth="170px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="User Mobile" DataField="USER_MOBILE" UniqueName="USER_MOBILE"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"
                                        ShowFilterIcon="false" FilterControlWidth="100px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Role" DataField="ROLE_DESCRIPTION" UniqueName="ROLE_DESCRIPTION"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"
                                        ShowFilterIcon="false" FilterControlWidth="90px">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridButtonColumn HeaderText="SELECT" CommandName="cmdselect" Text="Enter" UniqueName="Select" ButtonType="PushButton"
                                        HeaderStyle-Font-Bold="true" ButtonCssClass="btn btn-primary">
                                        <ItemStyle HorizontalAlign="Center" Width="100" />
                                        <HeaderStyle HorizontalAlign="Center" Width="100" />
                                    </telerik:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                            <GroupingSettings CaseSensitive="false" />
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
            <asp:EntityDataSource ID="DS_SelectRole" runat="server" ConnectionString="name=ISLAMIC_BOOKSTOREEntities" DefaultContainerName="ISLAMIC_BOOKSTOREEntities"
                EnableFlattening="False" EntitySetName="vMYROLEs" Where="it.[USER_ID] = @USER_ID">
                <WhereParameters>
                    <asp:SessionParameter Name="USER_ID" SessionField="uid" Type="String" />
                </WhereParameters>
            </asp:EntityDataSource>
        </div>
    </form>
    <div style="font-size: 14px; text-align: center; font-family: Calibri; margin-bottom: 1px; bottom: 0px; padding-top: 5px; padding-bottom: 5px; position: fixed; width: 100%; background-color: #3FD47E;">
        © Copyright :: 2017 BAYIKAWAK All Rights Reserved
    </div>
</body>
</html>
