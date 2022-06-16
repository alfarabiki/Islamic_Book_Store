<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="false" CodeFile="InputCode.aspx.vb" Inherits="Administrator_InputCode" %>

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
                                <h1 style="color: #4EB058;">Admin Code</h1>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadGrid ID="rgInputCode" runat="server" DataSourceID="dsInputCode" GroupPanelPosition="Top">
                                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="C_ID" DataSourceID="dsInputCode" CommandItemDisplay="Top"
                                        CommandItemSettings-AddNewRecordText="Input Code" EditMode="PopUp">
                                        <GroupByExpressions>
                                            <telerik:GridGroupByExpression>
                                                <GroupByFields>
                                                    <telerik:GridGroupByField FieldName="C_GROUP" HeaderText="Group" />
                                                </GroupByFields>
                                                <SelectFields>
                                                    <telerik:GridGroupByField FieldName="C_GROUP" HeaderText="Kategori" />
                                                </SelectFields>
                                            </telerik:GridGroupByExpression>
                                        </GroupByExpressions>
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="C_ORDER" FilterControlAltText="Filter C_ORDER column" HeaderText="No."
                                                ReadOnly="True" SortExpression="C_ORDER" UniqueName="C_ORDER" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="30px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="30px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridButtonColumn ConfirmText="Delete this Data?" ConfirmDialogType="RadWindow"
                                                ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete" UniqueName="DELETE">
                                                <HeaderStyle HorizontalAlign="Center" Width="20" Font-Bold="true" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="20" CssClass="MyImageButton" />
                                            </telerik:GridButtonColumn>
                                            <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="Edit">
                                                <HeaderStyle HorizontalAlign="Center" Width="20" Font-Bold="true" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="20" />
                                            </telerik:GridEditCommandColumn>
                                            <telerik:GridBoundColumn DataField="C_CODE" FilterControlAltText="Filter C_CODE column" HeaderText="Code"
                                                SortExpression="C_CODE" UniqueName="C_CODE" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="50px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="50" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="C_DESCRIPTION" FilterControlAltText="Filter C_DESCRIPTION column" HeaderText="Description"
                                                SortExpression="C_DESCRIPTION" UniqueName="C_DESCRIPTION" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="260px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Left" Width="260px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="C_GROUP" FilterControlAltText="Filter C_GROUP column" HeaderText="Group"
                                                SortExpression="C_GROUP" UniqueName="C_GROUP" EmptyDataText="-" Display="false">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="170px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Left" Width="170px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="USER_NAME" FilterControlAltText="Filter USER_NAME column" HeaderText="Originator"
                                                SortExpression="USER_NAME" UniqueName="USER_NAME" EmptyDataText="-">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="170px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Left" Width="170px" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CREATEDDATE" FilterControlAltText="Filter CREATEDDATE column" HeaderText="Create Date"
                                                SortExpression="CREATEDDATE" UniqueName="CREATEDDATE" EmptyDataText="-" DataFormatString="{0 : dd MMMM yyyy}">
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="170px" BackColor="#368EE0" ForeColor="White" />
                                                <ItemStyle HorizontalAlign="Center" Width="170px" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                        <EditFormSettings EditFormType="Template" EditColumn-HeaderText="Add Item">
                                            <PopUpSettings Modal="true" Width="400" />
                                            <FormTemplate>
                                                <table>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Code</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="txtCODE" runat="server" Width="150" MaxLength="200" Text='<%# Bind("C_CODE")%>'>
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Description</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="txtDESC" runat="server" Width="250" MaxLength="200" Text='<%# Bind("C_DESCRIPTION")%>'>
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Group</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadTextBox ID="txtGROUP" runat="server" Width="170" MaxLength="50" Text='<%# Bind("C_GROUP")%>'>
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 10px; padding-top: 10px;">Sort Number</td>
                                                        <td style="padding-left: 10px;">: </td>
                                                        <td style="padding-left: 10px;">
                                                            <telerik:RadNumericTextBox ID="txtORDER" runat="server" NumberFormat-DecimalDigits="0" NumberFormat-GroupSeparator="" Width="50" Text='<%# Bind("C_ORDER")%>'>
                                                            </telerik:RadNumericTextBox>
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
                    <asp:SqlDataSource ID="dsInputCode" runat="server" SelectCommandType="StoredProcedure"
                        ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="USP_INPUTCODE"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

