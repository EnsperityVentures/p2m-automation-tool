<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fees.aspx.cs" Inherits="P2M_Tools.pages.Fees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fees</title>
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
                <asp:MenuItem NavigateUrl="~/pages/Fees.aspx" Selected="true" Text="Fees" Value="Fees"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/GCInvoices.aspx" Text="Gift Cards Invoices" Value="Gift Cards Invoices"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/Members.aspx" Text="Members" Value="Members"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/OmanFloatAmount.aspx"  Text="Oman Float Amount" Value="Oman Float Amount"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/DailyOrders.aspx" Text="Daily Orders" Value="Daily Orders"></asp:MenuItem>
            </Items>
        </asp:Menu>
        <!--Menu Ends-->

        <div class="container">
            <div class="panel half-width" style="margin-top: 30px;">
                <h1 class="header"><span style="width: 120px;">Manual Add</span></h1>
                <table class="full-width" style="margin-top: 10px;">
                    <tr>
                        <td style="width: 25%; vertical-align: top;">
                            <asp:Label ID="LblFeesRewardName" runat="server" Text="Reward Name"></asp:Label><span class="star"></span></td>
                        <td style="width: 25%;">
                            <asp:TextBox ID="TxtAddFeesRewardName" CssClass="input-small" runat="server" placeholder="Reward Name"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RewardNameValidator" ControlToValidate="TxtAddFeesRewardName"
                                ValidationGroup="AddFeeValidationGroup" ErrorMessage="Name can't be blank" SetFocusOnError="true"
                                CssClass="val-msg"></asp:RequiredFieldValidator>
                        </td>
                        <td style="width: 25%;  vertical-align: top;">
                            <asp:Label ID="LblFeesSKU" runat="server" Text="SKU"></asp:Label><span class="star"></span></td>
                        <td style="width: 25%;">
                            <asp:TextBox ID="TxtAddFeesSKU" CssClass="input-small" runat="server" placeholder="SKU Code"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="SKUValidator" ControlToValidate="TxtAddFeesSKU"
                                ValidationGroup="AddFeeValidationGroup" ErrorMessage="SKU Code can't be blank" SetFocusOnError="true"
                                CssClass="val-msg"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                   
                    <tr>
                        <td colspan="4" style="border-top: 1px solid #eee;">
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <table class="full-width" style="border-collapse: collapse;">
                                <tr>
                                    <td style="width: 16.6%;">
                                        <asp:Label ID="LblFeesShippingCost" runat="server" Text="Shipping Cost"></asp:Label>
                                    </td>
                                    <td style="width: 16.6%;">
                                        <asp:TextBox ID="TxtAddFeesShippingCost" CssClass="input-small" runat="server" placeholder="0.0"></asp:TextBox></td>
                                    <td style="width: 16.6%;">
                                        <asp:Label ID="LblFeesHandlingCost" runat="server" Text="Handling Cost"></asp:Label>
                                    </td>
                                    <td style="width: 16.6%;">
                                        <asp:TextBox ID="TxtAddFeesHandlingCost" CssClass="input-small" runat="server" placeholder="0.0"></asp:TextBox></td>
                                    <td>
                                        <asp:Label ID="LblFeesServiceCharge" runat="server" Text="Service Charge"></asp:Label>
                                    </td>
                                    <td style="width: 16.6%;">
                                        <asp:TextBox ID="TxtAddFeesServiceCharge" CssClass="input-small" runat="server" placeholder="0.0"></asp:TextBox></td>
                                </tr>

                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td style="text-align: right;"><asp:Button runat="server" ID="BtnInsertFee" CssClass="btn" Style="margin-right: 6px;" Text="+ Add" ValidationGroup="AddFeeValidationGroup" OnClick="BtnInsertFee_Click"/></td>

                    </tr>
                </table>
            </div>

            <asp:GridView ID="GVFees" CssClass="myGridClass" DataKeyNames="ID" AlternatingRowStyle-CssClass="myAltRowClass"
                PagerStyle-CssClass="myPagerClass" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnRowCancelingEdit="GVFees_RowCancelingEdit" OnRowDeleting="GVFees_RowDeleting" OnRowEditing="GVFees_RowEditing" OnRowUpdating="GVFees_RowUpdating" OnPageIndexChanging="GVFees_PageIndexChanging">
                <AlternatingRowStyle CssClass="myAltRowClass" />
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <EditItemTemplate>
                            <asp:Label ID="LblFeesIDEdit" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblFeesID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SKU">
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtFeesSKU" CssClass="input-small" runat="server" Text='<%# Bind("SKU") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblFeesSKU" runat="server" Text='<%# Bind("SKU") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Reward Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtFeesRewardName" CssClass="input-small" runat="server" Text='<%# Bind("RewardName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblFeesRewardName" runat="server" Text='<%# Bind("RewardName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shipping Cost">
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtFeesShippingCost" CssClass="input-small" runat="server" Text='<%# Bind("ShippingCost") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblFeesShippingCost" runat="server" Text='<%# Bind("ShippingCost") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Handling Cost">
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtFeesHandlingCost" CssClass="input-small" runat="server" Text='<%# Bind("HandlingCost") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblFeesHandlingCost" runat="server" Text='<%# Bind("HandlingCost") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Service Charge">
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtFeesServiceCharge" CssClass="input-small" runat="server" Text='<%# Bind("ServiceCharge") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblFeesServiceCharge" runat="server" Text='<%# Bind("ServiceCharge") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total">
                        <EditItemTemplate>
                            <asp:Label ID="LblFeesTotalEdit" runat="server" Text='<%# Bind("Total") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblFeesTotal" runat="server" Text='<%# Bind("Total") %>'></asp:Label>
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
                <PagerStyle CssClass="myPagerClass" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
