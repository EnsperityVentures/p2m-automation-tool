<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OmanFloatAmount.aspx.cs" Inherits="P2M_Tools.pages.OmanFloatAmount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Main.css" rel="stylesheet" />
    <link href="../css/daterangepicker.css" rel="stylesheet" />
    <script src="../js/moment.min.js"></script>
    <script src="../js/jquery-3.3.1.js"></script>
    <script src="../js/daterangepicker.js"></script>
    <script src="../js/ASPSnippets_Pager.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.date').daterangepicker({
                "singleDatePicker": true,
                "showDropdowns": true,
                "buttonClasses": "btn-cal btn-sm",
                "locale": {
                    "format": "YYYY-MM-DD"
                }
            });
            
        });

        
    </script>
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
                <asp:MenuItem NavigateUrl="~/pages/GCInvoices.aspx" Text="Gift Cards Invoices" Value="Gift Cards Invoices"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/Members.aspx" Text="Members" Value="Members"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/OmanFloatAmount.aspx"  Selected="true" Text="Oman Float Amount" Value="Oman Float Amount"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/DailyOrders.aspx" Text="Daily Orders" Value="Daily Orders"></asp:MenuItem>
            </Items>
        </asp:Menu>
        <!--Menu Ends-->

        <div class="container">

            <div>
                
            </div>
             <asp:Menu ID="Menu2" CssClass="inner-tab" StaticMenuItemStyle-CssClass="inner-tabs" StaticHoverStyle-BackColor="#dddddd"
                StaticSelectedStyle-BackColor="#dddddd" StaticMenuItemStyle-Height="15px" StaticMenuItemStyle-VerticalPadding="8px"
                StaticMenuItemStyle-HorizontalPadding="20px" runat="server" Orientation="Horizontal" OnMenuItemClick="Menu2_MenuItemClick">
                <Items>
                    <asp:MenuItem Value="0" Selected="true" Text="Float"></asp:MenuItem>
                    <asp:MenuItem Value="1" Text="Amount"></asp:MenuItem>
                </Items>

                <StaticHoverStyle BackColor="#DDDDDD" Font-Underline="True"></StaticHoverStyle>

                <StaticMenuItemStyle CssClass="inner-tabs" Height="15px" BorderStyle="Solid" BorderWidth="1px" BorderColor="#eee" ForeColor="#000" HorizontalPadding="20px" VerticalPadding="8px"></StaticMenuItemStyle>

                <StaticSelectedStyle BackColor="#DDDDDD" Font-Underline="True"></StaticSelectedStyle>
            </asp:Menu>

            <asp:MultiView runat="server" ID="MVFloatAndAmount" ActiveViewIndex="0">
                <asp:View runat="server" ID="Float">
                    <asp:GridView ID="GVFloat" CssClass="myGridClass" AlternatingRowStyle-CssClass="myAltRowClass" PagerStyle-CssClass="myPagerClass"
                    DataKeyNames="OrderNo,Status,DeliveryDate" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GVFloat_PageIndexChanging"
                    OnRowCancelingEdit="GVFloat_RowCancelingEdit" OnRowDataBound="GVFloat_RowDataBound" OnRowDeleting="GVFloat_RowDeleting"
                    OnRowEditing="GVFloat_RowEditing" OnRowUpdating="GVFloat_RowUpdating">
                    <AlternatingRowStyle CssClass="myAltRowClass" />
                    <Columns>
                        <asp:TemplateField HeaderText="Order #">
                            <EditItemTemplate>
                                <asp:Label ID="LblFloatOrderNo" runat="server" Text='<%# Bind("OrderNo") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LblFloatOrderNo" runat="server" Text='<%# Bind("OrderNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Order Date">
                            <EditItemTemplate>
                                <asp:Label ID="LblFloatOrderDate" runat="server" Text='<%# Bind("OrderDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LblFloatOrderDate" runat="server" Text='<%# Bind("OrderDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Member Name">
                            <EditItemTemplate>
                                <asp:Label ID="LblFloatMemberName" runat="server" Text='<%# Bind("MemberName") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LblFloatMemberName" runat="server" Text='<%# Bind("MemberName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quantity">
                            <EditItemTemplate>
                                <asp:Label ID="LblFloatQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LblFloatQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cost">
                            <EditItemTemplate>
                                <asp:Label ID="LblFloatCost" runat="server" Text='<%# Bind("Totalcost") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LblFloatCost" runat="server" Text='<%# Bind("Totalcost") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delivery Fees">
                            <EditItemTemplate>
                                <asp:Label ID="LblFloatFees" runat="server" Text='<%# Bind("Deliveryfees") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LblFloatFees" runat="server" Text='<%# Bind("Deliveryfees") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Cost">
                            <EditItemTemplate>
                                <asp:Label ID="LblFloatTotal" runat="server" Text='<%# Bind("TotalCostwithDelivery") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LblFloatTotal" runat="server" Text='<%# Bind("TotalCostwithDelivery") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Current Status">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DLLStatusList" runat="server"></asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LblFloatCurrentStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delivery Date">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="TxtFloatDeliveryDate" CssClass="date" AutoComplete="off" Text='<%# Eval("DeliveryDate", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                                    
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LblFloatDeliveryDate" runat="server" Text='<%# Bind("DeliveryDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product (Amount)">
                            <EditItemTemplate>
                                <asp:Label ID="LblFloatProduct" runat="server" Text='<%# Bind("CardTypeandAmount") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LblFloatProduct" runat="server" Text='<%# Bind("CardTypeandAmount") %>'></asp:Label>
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
                </asp:View>
                <asp:View runat="server" ID="Amount">
                    <div class="half-width">
                        <asp:GridView ID="GVAmount" CssClass="myGridClass" AlternatingRowStyle-CssClass="myAltRowClass"
                        PagerStyle-CssClass="myPagerClass" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                        DataKeyNames="ID" OnRowCancelingEdit="GVAmount_RowCancelingEdit" OnRowDeleting="GVAmount_RowDeleting" OnRowEditing="GVAmount_RowEditing" OnRowUpdating="GVAmount_RowUpdating">

                        <AlternatingRowStyle CssClass="myAltRowClass" />
                        <Columns>
                            <asp:TemplateField HeaderText="ID" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="LblAmountID" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LblAmountID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Payment Amount">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TxtAmountPayment" runat="server" Text='<%# Bind("PaymentstoOman") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LblAmountPayment" runat="server" Text='<%# Bind("PaymentstoOman") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Payment Date">
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" ID="TxtAmountPaymentDate" CssClass="date" AutoComplete="off" Text='<%# Eval("Dateofpayment", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LblAmountPaymentDate" runat="server" Text='<%# Bind("Dateofpayment", "{0:MM/dd/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                            <EditItemTemplate>
                                <asp:ImageButton CssClass="controls" ID="UpdateButtonAmount" runat="server" CommandName="Update" ImageUrl="~/img/icons8-ok-16 (7).png" ToolTip="Update"
                                    OnClientClick="return confirm('Are you sure you want to save this entry? Modifications cannot be undone.');" />
                                <asp:ImageButton CssClass="controls" ID="CancelButtonAmount" runat="server" CommandName="Cancel" ImageUrl="~/img/icons8-cancel-16 (2).png" ToolTip="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton CssClass="controls" ID="EditButtonAmount" runat="server" CommandName="Edit" ImageUrl="~/img/icons8-compose-16.png" ToolTip="Edit" />
                                <asp:ImageButton CssClass="controls" ID="DeleteButtonAmount" runat="server" CommandName="Delete" ImageUrl="~/img/icons8-cancel-16 (2).png" OnClientClick="return confirm('Are you sure you want to delete this entry?');" ToolTip="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="myPagerClass" />

                    </asp:GridView>
                    </div>
                    <div>
                        <asp:Label runat="server" ID="LblTotalAmount" Font-Bold="True"></asp:Label>
                    </div>

                     <div class="panel half-width" style="margin-top: 30px;">
                <h1 class="header"><span style="width: 120px;">Add Payment</span></h1>
                <table class="full-width" style="margin-top: 10px;">
                    <tr>
                        <td style="vertical-align: top;"><asp:Label runat="server" Text="Amount"></asp:Label></td>
                        <td style="vertical-align: top;"><asp:TextBox runat="server" ID="TxtAddPaymentAmount" CssClass="input-small"></asp:TextBox>

                            <asp:RequiredFieldValidator runat="server" ID="PaymentAmountValidator" ValidationGroup="InsertGroup" 
                                ControlToValidate="TxtAddPaymentAmount" SetFocusOnError="true" ErrorMessage="Amount can't be blank" 
                                CssClass="val-msg"></asp:RequiredFieldValidator>
                        </td>
                        <td style="vertical-align: top;"><asp:Label runat="server" Text="Date"></asp:Label></td>
                        <td style="vertical-align: top;"><asp:TextBox runat="server" ID="TxtAddPaymentDate" autocomplete="off" CssClass="input-small date"></asp:TextBox>

                            <asp:RequiredFieldValidator runat="server" ID="TxtPaymentDateValidator" ValidationGroup="InsertGroup" 
                                ControlToValidate="TxtAddPaymentDate" SetFocusOnError="true" ErrorMessage="Please choose a date" 
                                CssClass="val-msg"></asp:RequiredFieldValidator>
                        </td>
                        
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:Button runat="server" ID="btnInsert" Text="+ Add" CssClass="btn float-right" ValidationGroup="InsertGroup" OnClick="btnInsert_Click"/>
                        </td>
                    </tr>
                </table>
                     </div>
                </asp:View>

            </asp:MultiView>
        </div>
    </form>
</body>
</html>
