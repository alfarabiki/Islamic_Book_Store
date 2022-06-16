<%@ Page Language="VB" AutoEventWireup="false" CodeFile="UploadFile.aspx.vb" Inherits="Page_UploadFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload File</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <table>
                <tr>
                    <td>Judul Buku </td>
                    <td>: </td>
                    <td>
                        <asp:Label ID="lblJudulBuku" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>: </td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server" />
                    </td>
                </tr>
            </table>
            <telerik:RadGrid runat="server" ID="rgFILE" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="edsFile" CellSpacing="-1">
                <MasterTableView DataKeyNames="FILE_ID,FILE_NAME,FILE_NAME_ORI" DataSourceID="edsFile" ShowHeadersWhenNoRecords="true" NoMasterRecordsText="No files"
                    CommandItemDisplay="Top" EditMode="EditForms" CommandItemSettings-AddNewRecordText="Add Document">
                    <CommandItemSettings AddNewRecordText="Add File"></CommandItemSettings>
                    <Columns>
                        <telerik:GridBoundColumn DataField="FILE_NAME_ORI" FilterControlAltText="Filter FILE_NAME_ORI column" HeaderText="FILENAME ORIG" SortExpression="FILE_NAME_ORI" UniqueName="FILE_NAME_ORI">
                            <ColumnValidationSettings>
                                <ModelErrorMessage Text="" />
                            </ColumnValidationSettings>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FILE_NAME" FilterControlAltText="Filter FILE_NAME column" HeaderText="FILENAME" ReadOnly="True" SortExpression="FILE_NAME" UniqueName="FILE_NAME">
                            <ColumnValidationSettings>
                                <ModelErrorMessage Text="" />
                            </ColumnValidationSettings>
                        </telerik:GridBoundColumn>
                        <telerik:GridDateTimeColumn DataField="UPLOADDATE" HeaderText="UPLOAD DATE" ReadOnly="true" FilterControlWidth="95px" DataFormatString="{0:dd MMMM yyyy}"
                            SortExpression="UPLOADDATE" UniqueName="UPLOADDATE" PickerType="DatePicker" EnableTimeIndependentFiltering="true" EditDataFormatString="dd MMMM yyyy">
                            <ColumnValidationSettings EnableRequiredFieldValidation="true" EnableModelErrorMessageValidation="true">
                                <RequiredFieldValidator ForeColor="Red" ErrorMessage="This field is required"></RequiredFieldValidator>
                                <ModelErrorMessage BackColor="Red" />
                            </ColumnValidationSettings>
                        </telerik:GridDateTimeColumn>
                        <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="cmdDownload" Text="DOWNLOAD" HeaderText="DOWNLOAD"
                            ImageUrl="~/images/download.png" UniqueName="Download">
                        </telerik:GridButtonColumn>
                        <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="cmdDelete" Text="DELETE" HeaderText="DELETE" ConfirmText="Are you sure want to delete this file?"
                            ImageUrl="~/images/delete_file.png" UniqueName="Delete">
                        </telerik:GridButtonColumn>
                    </Columns>
                    <EditFormSettings EditFormType="Template">
                        <PopUpSettings Modal="true" Width="600px" />
                        <FormTemplate>
                            <table style="width: 100%" cellpadding="4">
                                <tr>
                                    <td style="width: 125px" valign="top">Select File
                                    </td>
                                    <td style="width: 1px" valign="top">:
                                    </td>
                                    <td>
                                        <telerik:RadAsyncUpload runat="server" ID="fuDocument" MultipleFileSelection="Disabled" MaxFileSize="10240000"
                                            AllowedFileExtensions=".jpeg,.jpg,.png" InitialFileInputsCount="1" MaxFileInputsCount="1">
                                        </telerik:RadAsyncUpload> 
                                        <asp:CheckBox ID="chkDefault" runat="server" Text="Is Default"></asp:CheckBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center">
                                        <telerik:RadButton ID="btnSave" runat="server" ValidationGroup="input" Text="Upload" CommandName="cmdUpload">
                                        </telerik:RadButton>
                                        <telerik:RadButton ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                            </table>
                        </FormTemplate>
                    </EditFormSettings>
                </MasterTableView>
            </telerik:RadGrid>
            <asp:EntityDataSource ID="edsFile" runat="server" ConnectionString="name=ISLAMIC_BOOKSTOREEntities" DefaultContainerName="ISLAMIC_BOOKSTOREEntities" EnableFlattening="False"
                EntitySetName="tDOCUMENTs" Where="it.[ITEM_ID]=@ID" OrderBy="it.[FILE_NAME]">
                <WhereParameters>
                    <asp:QueryStringParameter Name="ID" QueryStringField="ID" DbType="String" />
                </WhereParameters>
            </asp:EntityDataSource>
            <cc1:msgBox ID="MsgBox1" runat="server" />
        </div>
    </form>
</body>
</html>
