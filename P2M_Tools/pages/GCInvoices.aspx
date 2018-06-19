<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GCInvoices.aspx.cs" Inherits="P2M_Tools.pages.GCInvoices" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gift Cards Invoices</title>
    <link href="../css/Main.css" rel="stylesheet" />
    <link href="../css/daterangepicker.css" rel="stylesheet" />
    <script src="../js/jquery-3.3.1.js"></script>
    <script src="../js/ASPSnippets_Pager.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!--Menu Starts-->
        <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" CssClass="tab" StaticMenuItemStyle-CssClass="tabs" StaticHoverStyle-BackColor="#f1f1f1"
            StaticSelectedStyle-BackColor="#f1f1f1" StaticSelectedStyle-Font-Bold="true" StaticMenuItemStyle-Height="20px" StaticMenuItemStyle-VerticalPadding="15px"
            StaticMenuItemStyle-HorizontalPadding="10px" StaticMenuItemStyle-ForeColor="Black">
            <Items>
                <asp:MenuItem ImageUrl="~/img/P2M-Logo_1.png" Selectable="false"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/ClientsInvoices.aspx" Text="Clients Invoices" Value="Clients Invoices"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/Companies.aspx" Text="Company" Value="Company"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/Currencies.aspx" Text="Currency" Value="Currency"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/Departments.aspx" Text="Departments" Value="Departments"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/Fees.aspx" Text="Fees" Value="Fees"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/GCInvoices.aspx" Selected="true" Text="Gift Cards Invoices" Value="Gift Cards Invoices"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/Members.aspx" Text="Members" Value="Members"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/OmanFloatAmount.aspx" Text="Oman Float Amount" Value="Oman Float Amount"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/DailyOrders.aspx" Text="Daily Orders" Value="Daily Orders"></asp:MenuItem>
            </Items>
        </asp:Menu>
        <!--Menu Ends-->

        <div class="container">
            <div class="panel half-width float-left" style="margin-top: 30px;">
                <h1 class="header"><span>Search</span></h1>
                <asp:Panel ID="PnlSearch" runat="server" DefaultButton="BtnSearch">
                    <table class="search-box" style="width: 100%;">
                        <tr>
                            <td>
                                <asp:Label ID="lblCompany" runat="server" Text="Company"></asp:Label></td>
                            <td>
                                <asp:DropDownList runat="server" CssClass="input-small" ID="CompaniesList" ValidationGroup="SearchGroup"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td></td>

                            <td>
                                <asp:RequiredFieldValidator ID="CompaniesListValidator" runat="server" ControlToValidate="CompaniesList"
                                    ErrorMessage="Please choose a company" InitialValue="0" ValidationGroup="SearchGroup"
                                    CssClass="val-msg"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="border-top: 1px solid #eee;">
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblSearchOrderNo" Text="Order #"></asp:Label></td>
                            <td>
                                <asp:TextBox runat="server" ID="txtSearchOrderNo" CssClass="input-small" MaxLength="16" placeholder="Order #"></asp:TextBox></td>
                            <td>
                                <asp:Label runat="server" ID="lblSearchEmpID" Text="Employee ID"></asp:Label></td>
                            <td>
                                <asp:TextBox runat="server" ID="txtSearchEmpID" CssClass="input-small" MaxLength="16" placeholder="Employee ID"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lblSDate" Text="From"></asp:Label></td>
                            <td>
                                <div class="field-wrap">
                                    <img src="../img/icons8-calendar-16 (1).png" style="width: 16px; height: 16px;" />
                                    &nbsp;
                                    <asp:TextBox runat="server" CssClass="embeded-save-field date" ID="startDate"></asp:TextBox>
                                </div>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblEDate" Text="To"></asp:Label></td>
                            <td>
                                <div class="field-wrap">
                                    <img src="../img/icons8-calendar-16 (1).png" style="width: 16px; height: 16px;" />
                                    &nbsp;
                                <asp:TextBox runat="server" CssClass="embeded-save-field date" ID="endDate"></asp:TextBox>

                                </div>
                            </td>

                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:Button runat="server" ID="BtnSearch" ValidationGroup="SearchGroup" CssClass="btn float-right" Text="Search" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
            <div class="panel half-width float-right" style="margin-top: 30px; height: 149px;">
                <h1 class="header"><span style="width: 170px;">Export/Import File</span></h1>
                <table class="full-width no-padding" style="margin-top: 10px;">
                    <tr>
                        <td>Import</td>
                        <td>
                            <asp:FileUpload ID="ImportFileUpload" runat="server" CssClass="input-small" Width="100%" />
                            <asp:RequiredFieldValidator runat="server" ValidationGroup="FileGroup" ID="UploadValidator" ControlToValidate="ImportFileUpload" ErrorMessage="* Please choose a file..."
                                SetFocusOnError="true" CssClass="val-msg"></asp:RequiredFieldValidator>
                        </td>
                        <td style="padding: 0;">
                            <asp:Button ID="ImportUploadBtn" runat="server" CssClass="btn float-right" Text="Import" Width="98%" Height="25px" /></td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="border-top: 1px solid #eee;"></td>
                    </tr>
                    <tr>
                        <td>Export
                        </td>
                        <td>
                            <asp:RadioButtonList runat="server" ID="FileType">
                                <asp:ListItem Value="csv" Selected="True" Text="CSV"></asp:ListItem>
                                <asp:ListItem Value="pdf" Text="PDF"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:Button runat="server" ID="ExportFileBtn" CssClass="btn float-right" Width="98%" Text="Export File" />
                        </td>
                    </tr>
                </table>
            </div>
            <asp:GridView ID="GVGiftCardOrders" CssClass="myGridClass" AlternatingRowStyle-CssClass="myAltRowClass" DataKeyNames="OrderId,ReasonofReturn,SKU,Country" 
                PagerStyle-CssClass="myPagerClass" AllowPaging="True" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="GVGiftCardOrders_PageIndexChanging" OnRowCancelingEdit="GVGiftCardOrders_RowCancelingEdit" OnRowDeleting="GVGiftCardOrders_RowDeleting" OnRowEditing="GVGiftCardOrders_RowEditing" OnRowUpdating="GVGiftCardOrders_RowUpdating" PageSize="25" OnRowDataBound="GVGiftCardOrders_RowDataBound">
<AlternatingRowStyle CssClass="myAltRowClass"></AlternatingRowStyle>
                <Columns>
                    <asp:TemplateField HeaderText="Order No">
                        <EditItemTemplate>
                            <asp:Label ID="LblGCinvoiceOrderNo" runat="server" Text='<%# Bind("OrderId") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblGCinvoiceOrderNo" runat="server" Text='<%# Bind("OrderId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Line Number">
                        <EditItemTemplate>
                            <asp:Label ID="LblGCinvoiceLineNumber" runat="server" Text='<%# Bind("LineNumber") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblGCinvoiceLineNumber" runat="server" Text='<%# Bind("LineNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee ID">
                        <EditItemTemplate>
                            <asp:Label ID="LblGCinvoiceEmployeeID" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblGCinvoiceEmployeeID" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Reward Name">
                        <EditItemTemplate>
                            <asp:Label ID="LblGCinvoiceRewardName" runat="server" Text='<%# Bind("RewardName") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblGCinvoiceRewardName" runat="server" Text='<%# Bind("RewardName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Order Date">
                        <EditItemTemplate>
                            <asp:Label ID="LblGCinvoiceOrderDate" runat="server" Text='<%# Bind("OrderDate") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblGCinvoiceOrderDate" runat="server" Text='<%# Bind("OrderDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Local Cost">
                        <EditItemTemplate>
                            <asp:Label ID="LblGCinvoiceLocalCost" runat="server" Text='<%# Bind("LocalCost") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblGCinvoiceLocalCost" runat="server" Text='<%# Bind("LocalCost") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <EditItemTemplate>
                            <asp:Label ID="LblGCinvoiceQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblGCinvoiceQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Reason of Return">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DDLGCInvoiceReason" runat="server">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblGCinvoiceReason" runat="server" Text='<%# Bind("ReasonofReturn") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actions">
                        <EditItemTemplate>
                            <asp:ImageButton CssClass="controls" ID="UpdateButton" runat="server" CommandName="Update" ImageUrl="~/img/icons8-ok-16 (7).png" ToolTip="Update"
                                OnClientClick="return confirm('Are you sure you want to save this entry? Modifications cannot be undone.');" />
                            <asp:ImageButton CssClass="controls" ID="CancelButton" runat="server" CommandName="Cancel" ImageUrl="~/img/icons8-cancel-16 (2).png" ToolTip="Cancel" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:ImageButton CssClass="controls" ID="EditButton" runat="server" CommandName="Edit" ImageUrl="~/img/icons8-compose-16.png" ToolTip="Edit" />
                            <asp:ImageButton CssClass="controls" ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/img/icons8-cancel-16 (2).png" OnClientClick="return confirm('Are you sure you want to delete this entry?');" ToolTip="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

<PagerStyle CssClass="myPagerClass"></PagerStyle>

            </asp:GridView>
        </div>
    </form>
</body>
</html>
