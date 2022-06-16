<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="false" CodeFile="Profile.aspx.vb" Inherits="Page_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        fieldset {
            display: block;
            margin-left: 2px;
            margin-right: 2px;
            padding-top: 0.30em;
            padding-bottom: 0.620em;
            padding-left: 0.75em;
            padding-right: 0.75em;
            border: 2px solid;
            border-color: #368EE0;
            border-radius: 8px;
        }
    </style>
    <div>
        <table style="width: 100%;">
            <tr>
                <td align="center">
                    <h2>::  My Profile  :: </h2>
                    <asp:Label ID="lblinfo" runat="server" ForeColor="#4EB058"></asp:Label>
                    <fieldset style="border-color: #E5E5E5; width: 30%; background-image: url(../Images/LoginBackground.jpg)">
                        <table style="width: 500px">
                            <tr>
                                <td style="padding-left: 10px; padding-bottom: 10px;">User Id</td>
                                <td style="padding-left: 10px; padding-bottom: 10px;">:</td>
                                <td style="padding-left: 10px; padding-bottom: 10px;">
                                    <telerik:RadTextBox ID="rtbUserId" ForeColor="#4EB058" runat="server" Enabled="false"></telerik:RadTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 10px; padding-bottom: 10px;">Name</td>
                                <td style="padding-left: 10px; padding-bottom: 10px;">:</td>
                                <td style="padding-left: 10px; padding-bottom: 10px;">
                                    <telerik:RadTextBox ID="rtbName" runat="server" Width="250" ></telerik:RadTextBox>
                                    <asp:Label ID="lblmandatory1" runat="server" Text="*" ForeCodlor="#368EE0" Font-Size="Smaller"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="!" ForeColor="Red"
                                        ControlToValidate="rtbName" ValidationGroup="update"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 10px; padding-bottom: 10px;">Address</td>
                                <td style="padding-left: 10px; padding-bottom: 10px;">:</td>
                                <td style="padding-left: 10px; padding-bottom: 10px;">
                                    <telerik:RadTextBox ID="rtbAddress" runat="server" MaxLength="500" Width="250" TextMode="MultiLine"></telerik:RadTextBox>
                                    <asp:Label ID="lblmandatory2" runat="server" Text="*" ForeColor="#368EE0" Font-Size="Smaller"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="!" ForeColor="Red"
                                        ControlToValidate="rtbAddress" ValidationGroup="update"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 10px; padding-bottom: 10px;">Mobile</td>
                                <td style="padding-left: 10px; padding-bottom: 10px;">:</td>
                                <td style="padding-left: 10px; padding-bottom: 10px;">
                                    <telerik:RadTextBox ID="rtbMobile" runat="server" MaxLength="150" Width="250"></telerik:RadTextBox>
                                    <asp:Label ID="lblmandatory3" runat="server" Text="*" ForeColor="#368EE0" Font-Size="Smaller"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="!" ForeColor="Red"
                                        ControlToValidate="rtbMobile" ValidationGroup="update"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 10px; padding-bottom: 10px;">Email</td>
                                <td style="padding-left: 10px; padding-bottom: 10px;">:</td>
                                <td style="padding-left: 10px; padding-bottom: 10px;">
                                    <telerik:RadTextBox ID="rtbEmail" runat="server" MaxLength="250" Width="250"></telerik:RadTextBox>
                                    <asp:Label ID="lblmandatory4" runat="server" Text="*" ForeColor="#368EE0" Font-Size="Smaller"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="!" ForeColor="Red"
                                        ControlToValidate="rtbEmail" ValidationGroup="update"></asp:RequiredFieldValidator>
                                </td>
                            </tr>  
                            <tr>
                                <td style="padding-left: 10px; padding-bottom: 10px;"></td>
                                <td style="padding-left: 10px; padding-bottom: 10px;"></td>
                                <td style="padding-left: 10px; padding-bottom: 10px;">
                                    <telerik:RadButton ID="btnUpdate" runat="server" ValidationGroup="update" Font-Bold="true" Text="Update My Profile" BackColor="#4EB058"></telerik:RadButton>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>
        <table id="MyRole" runat="server" visible="false" style="width: 100%">
            <tr>
                <td align="center">
                    <fieldset style="border-color: #E5E5E5; width: 50%">
                        <table style="width: 100%">
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
                    </fieldset>
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
</asp:Content>

