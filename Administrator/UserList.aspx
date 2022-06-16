<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="false" CodeFile="UserList.aspx.vb" Inherits="Administrator_UserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
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
    </div>
    <div>
        <table style="width: 100%;">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td>
                                <h1 style="color: #4EB058;">User List</h1>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadGrid ID="rgUserList" runat="server" DataSourceID="dsUserList" GroupPanelPosition="Top">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="USER_ID" DataSourceID="dsUserList" CommandItemDisplay="Top"
                                        CommandItemSettings-AddNewRecordText="Add User" EditMode="PopUp">
                                        <Columns>
                                            <telerik:GridButtonColumn ConfirmText="Delete this Data?" ConfirmDialogType="RadWindow"
                                                ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete" UniqueName="DELETE">
                                                <HeaderStyle HorizontalAlign="Center" Width="20" Font-Bold="true" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="20" CssClass="MyImageButton" />
                                            </telerik:GridButtonColumn>
                                            <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="Edit">
                                                <HeaderStyle HorizontalAlign="Center" Width="20" Font-Bold="true" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="20" />
                                            </telerik:GridEditCommandColumn>
                                            <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="No." CurrentFilterFunction="Contains"
                                                AutoPostBackOnFilter="true" ShowFilterIcon="false" FilterControlWidth="10px">
                                                <ItemTemplate>
                                                    <asp:Label ID="numberLabel" runat="server" />
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" Width="20" Font-Bold="true" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="20" CssClass="MyImageButton" />
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="USER_ID" FilterControlAltText="Filter USER_ID column" HeaderText="ID User"
                                                SortExpression="USER_ID" UniqueName="USER_ID" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="90px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="90px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="USER_NAME" FilterControlAltText="Filter USER_NAME column" HeaderText="Name"
                                                SortExpression="USER_NAME" UniqueName="USER_NAME" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="170px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Left" Width="170px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="MULTIROLE" FilterControlAltText="Filter MULTIROLE column" HeaderText="MultiRole"
                                                SortExpression="MULTIROLE" UniqueName="MULTIROLE" EmptyDataText="-" Display="false">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="170px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Left" Width="170px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="USER_ROLE" FilterControlAltText="Filter USER_ROLE column" HeaderText="Role"
                                                SortExpression="USER_ROLE" UniqueName="USER_ROLE" EmptyDataText="-" Display="false">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="170px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Left" Width="170px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="ROLE_DESCRIPTION" FilterControlAltText="Filter ROLE_DESCRIPTION column" HeaderText="Role"
                                                SortExpression="ROLE_DESCRIPTION" UniqueName="ROLE_DESCRIPTION" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="120px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Left" Width="120px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="USER_ADDRESS" FilterControlAltText="Filter USER_ADDRESS column" HeaderText="Address"
                                                SortExpression="USER_ADDRESS" UniqueName="USER_ADDRESS" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="400px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Left" Width="400px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="USER_MOBILE" FilterControlAltText="Filter USER_MOBILE column" HeaderText="Phone"
                                                SortExpression="USER_MOBILE" UniqueName="USER_MOBILE" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="60px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="60px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="USER_MAIL" FilterControlAltText="Filter USER_MAIL column" HeaderText="Mail"
                                                SortExpression="USER_MAIL" UniqueName="USER_MAIL" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="190px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Left" Width="190px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="USER_PASSWORD" FilterControlAltText="Filter USER_PASSWORD column" HeaderText="Password"
                                                SortExpression="USER_PASSWORD" UniqueName="USER_PASSWORD" EmptyDataText="-" Display="false">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="190px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Left" Width="190px" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings EditFormType="Template" EditColumn-HeaderText="Add Menu">
                                            <PopUpSettings Modal="true" Width="400" />
                                            <FormTemplate>
                                                <table>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">User ID</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="txtUserID" runat="server" Width="150" MaxLength="6" Text='<%# Bind("USER_ID")%>'
                                                                ReadOnly='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "false", "true")%>'>
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Name</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="txtName" runat="server" Width="250" MaxLength="50" Text='<%# Bind("USER_NAME")%>'>
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Role</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadComboBox ID="rcbRole" runat="server" DataSourceID="DS_ROLE" SelectedValue='<%# Bind("USER_ROLE")%>'
                                                                DataTextField="ROLE_DESCRIPTION" DataValueField="ROLE_CODE" Width="280px" Height="100px"
                                                                Filter="Contains" EmptyMessage="                << Select Position >>">
                                                            </telerik:RadComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Address</td>
                                                        <td style="padding-left: 10px; padding-top: 10px;">: </td>
                                                        <td style="padding-left: 10px; padding-top: 10px;">
                                                            <telerik:RadTextBox ID="txtAddress" runat="server" Width="250" MaxLength="50" Text='<%# Bind("USER_ADDRESS")%>'
                                                                TextMode="MultiLine">
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Phone</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="txtPhone" runat="server" Width="170" MaxLength="50" Text='<%# Bind("USER_MOBILE")%>'>
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Mail</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="txtMail" runat="server" Width="170" MaxLength="50" Text='<%# Bind("USER_MAIL")%>'>
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr id="trPass" runat="server">
                                                        <td style="padding-left: 10px; padding-top: 10px;">Password</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="txtPassword" runat="server" Width="150" MaxLength="50" Text='<%# Bind("USER_PASSWORD")%>'
                                                                PasswordStrengthSettings-MinimumLowerCaseCharacters="6">
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Multi Role?</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <asp:CheckBox ID="chkMultirole" runat="server" Checked='<%# Bind("MULTIROLE")%>' />
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
                    <asp:SqlDataSource ID="dsUserList" runat="server" SelectCommandType="StoredProcedure"
                        ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="USP_LISTUSER"></asp:SqlDataSource>
                    <asp:EntityDataSource ID="DS_ROLE" runat="server" ConnectionString="name=ISLAMIC_BOOKSTOREEntities" DefaultContainerName="ISLAMIC_BOOKSTOREEntities"
                        EnableFlattening="False" EntitySetName="tROLEs">
                    </asp:EntityDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

