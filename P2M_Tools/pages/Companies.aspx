<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Companies.aspx.cs" Inherits="P2M_Tools.pages.Companies" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Company</title>
    <link href="../css/Main.css" rel="stylesheet" />
    <script src="../js/jquery-3.3.1.min.js"></script>
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
                <asp:MenuItem NavigateUrl="~/pages/Companies.aspx" Selected="true" Text="Company" Value="Company"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/Currencies.aspx" Text="Currency" Value="Currency"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/Departments.aspx" Text="Departments" Value="Departments"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/Fees.aspx" Text="Fees" Value="Fees"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/GCInvoices.aspx" Text="Gift Cards Invoices" Value="Gift Cards Invoices"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/Members.aspx" Text="Members" Value="Members"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/OmanFloatAmount.aspx"  Text="Oman Float Amount" Value="Oman Float Amount"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/pages/DailyOrders.aspx" Text="Daily Orders" Value="Daily Orders"></asp:MenuItem>
            </Items>
        </asp:Menu>
        <!--Menu Ends-->
        <div class="container">

            <asp:Panel runat="server" ID="SuccessAlert" Visible="false">
                <div class="confirmation-msg">
                <span>Company has been added successfully.</span>
            </div>
            </asp:Panel>

            <div class="panel half-width float-left" style="margin-top: 30px;">
                <h1 class="header"><span style="width: 120px;">Manual Add</span></h1>
                <table class="full-width" style="margin-top: 10px;">
                    <tr>
                        <td style="width: 25%; vertical-align: top;">
                            <asp:Label runat="server" ID="LblAddCompanyName" Text="Name (English)"></asp:Label><span class="star"></span></td>
                        <td>
                            <asp:TextBox runat="server" ID="TxtAddCompanyName" CssClass="input-small" placeholder="Company Name (English)"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="CompanyNameValidator" ControlToValidate="TxtAddCompanyName"
                                ValidationGroup="AddCompanyValidationGroup" ErrorMessage="Name can't be blank" SetFocusOnError="true"
                                CssClass="val-msg"></asp:RequiredFieldValidator>
                        </td>
                        <td style="width: 25%; vertical-align: top;">
                            <asp:Label runat="server" ID="LblAddCompanyCountry" Text="Country"></asp:Label><span class="star"></span></td>
                        <td>
                            <asp:DropDownList runat="server" ID="DDLAddCompanyCountry" CssClass="input-small">
                                <asp:ListItem Selected="true">--Select Country--</asp:ListItem>
                                <asp:ListItem>United States</asp:ListItem>
                                <asp:ListItem>Afghanistan</asp:ListItem>
                                <asp:ListItem>Albania</asp:ListItem>
                                <asp:ListItem>Algeria</asp:ListItem>
                                <asp:ListItem>American Samoa</asp:ListItem>
                                <asp:ListItem>Andorra</asp:ListItem>
                                <asp:ListItem>Angola</asp:ListItem>
                                <asp:ListItem>Anguilla</asp:ListItem>
                                <asp:ListItem>Antarctica</asp:ListItem>
                                <asp:ListItem>Antigua And Barbuda</asp:ListItem>
                                <asp:ListItem>Argentina</asp:ListItem>
                                <asp:ListItem>Armenia</asp:ListItem>
                                <asp:ListItem>Aruba</asp:ListItem>
                                <asp:ListItem>Australia</asp:ListItem>
                                <asp:ListItem>Austria</asp:ListItem>
                                <asp:ListItem>Azerbaijan</asp:ListItem>
                                <asp:ListItem>Bahamas</asp:ListItem>
                                <asp:ListItem>Bahrain</asp:ListItem>
                                <asp:ListItem>Bangladesh</asp:ListItem>
                                <asp:ListItem>Barbados</asp:ListItem>
                                <asp:ListItem>Belarus</asp:ListItem>
                                <asp:ListItem>Belgium</asp:ListItem>
                                <asp:ListItem>Belize</asp:ListItem>
                                <asp:ListItem>Benin</asp:ListItem>
                                <asp:ListItem>Bermuda</asp:ListItem>
                                <asp:ListItem>Bhutan</asp:ListItem>
                                <asp:ListItem>Bolivia</asp:ListItem>
                                <asp:ListItem>Bosnia And Herzegowina</asp:ListItem>
                                <asp:ListItem>Botswana</asp:ListItem>
                                <asp:ListItem>Bouvet Island</asp:ListItem>
                                <asp:ListItem>Brazil</asp:ListItem>
                                <asp:ListItem>British Indian Ocean Territory</asp:ListItem>
                                <asp:ListItem>Brunei Darussalam</asp:ListItem>
                                <asp:ListItem>Bulgaria</asp:ListItem>
                                <asp:ListItem>Burkina Faso</asp:ListItem>
                                <asp:ListItem>Burundi</asp:ListItem>
                                <asp:ListItem>Cambodia</asp:ListItem>
                                <asp:ListItem>Cameroon</asp:ListItem>
                                <asp:ListItem>Canada</asp:ListItem>
                                <asp:ListItem>Cape Verde</asp:ListItem>
                                <asp:ListItem>Cayman Islands</asp:ListItem>
                                <asp:ListItem>Central African Republic</asp:ListItem>
                                <asp:ListItem>Chad</asp:ListItem>
                                <asp:ListItem>Chile</asp:ListItem>
                                <asp:ListItem>China</asp:ListItem>
                                <asp:ListItem>Christmas Island</asp:ListItem>
                                <asp:ListItem>Cocos (Keeling) Islands</asp:ListItem>
                                <asp:ListItem>Colombia</asp:ListItem>
                                <asp:ListItem>Comoros</asp:ListItem>
                                <asp:ListItem>Congo</asp:ListItem>
                                <asp:ListItem>Cook Islands</asp:ListItem>
                                <asp:ListItem>Costa Rica</asp:ListItem>
                                <asp:ListItem>Cote D'Ivoire</asp:ListItem>
                                <asp:ListItem>Croatia (Local Name: Hrvatska)</asp:ListItem>
                                <asp:ListItem>Cuba</asp:ListItem>
                                <asp:ListItem>Cyprus</asp:ListItem>
                                <asp:ListItem>Czech Republic</asp:ListItem>
                                <asp:ListItem>Denmark</asp:ListItem>
                                <asp:ListItem>Djibouti</asp:ListItem>
                                <asp:ListItem>Dominica</asp:ListItem>
                                <asp:ListItem>Dominican Republic</asp:ListItem>
                                <asp:ListItem>East Timor</asp:ListItem>
                                <asp:ListItem>Ecuador</asp:ListItem>
                                <asp:ListItem>Egypt</asp:ListItem>
                                <asp:ListItem>El Salvador</asp:ListItem>
                                <asp:ListItem>Equatorial Guinea</asp:ListItem>
                                <asp:ListItem>Eritrea</asp:ListItem>
                                <asp:ListItem>Estonia</asp:ListItem>
                                <asp:ListItem>Ethiopia</asp:ListItem>
                                <asp:ListItem>Falkland Islands (Malvinas)</asp:ListItem>
                                <asp:ListItem>Faroe Islands</asp:ListItem>
                                <asp:ListItem>Fiji</asp:ListItem>
                                <asp:ListItem>Finland</asp:ListItem>
                                <asp:ListItem>France</asp:ListItem>
                                <asp:ListItem>French Guiana</asp:ListItem>
                                <asp:ListItem>French Polynesia</asp:ListItem>
                                <asp:ListItem>French Southern Territories</asp:ListItem>
                                <asp:ListItem>Gabon</asp:ListItem>
                                <asp:ListItem>Gambia</asp:ListItem>
                                <asp:ListItem>Georgia</asp:ListItem>
                                <asp:ListItem>Germany</asp:ListItem>
                                <asp:ListItem>Ghana</asp:ListItem>
                                <asp:ListItem>Gibraltar</asp:ListItem>
                                <asp:ListItem>Greece</asp:ListItem>
                                <asp:ListItem>Greenland</asp:ListItem>
                                <asp:ListItem>Grenada</asp:ListItem>
                                <asp:ListItem>Guadeloupe</asp:ListItem>
                                <asp:ListItem>Guam</asp:ListItem>
                                <asp:ListItem>Guatemala</asp:ListItem>
                                <asp:ListItem>Guinea</asp:ListItem>
                                <asp:ListItem>Guinea-Bissau</asp:ListItem>
                                <asp:ListItem>Guyana</asp:ListItem>
                                <asp:ListItem>Haiti</asp:ListItem>
                                <asp:ListItem>Honduras</asp:ListItem>
                                <asp:ListItem>Hong Kong</asp:ListItem>
                                <asp:ListItem>Hungary</asp:ListItem>
                                <asp:ListItem>Icel And</asp:ListItem>
                                <asp:ListItem>India</asp:ListItem>
                                <asp:ListItem>Indonesia</asp:ListItem>
                                <asp:ListItem>Iran (Islamic Republic Of)</asp:ListItem>
                                <asp:ListItem>Iraq</asp:ListItem>
                                <asp:ListItem>Ireland</asp:ListItem>
                                <asp:ListItem>Israel</asp:ListItem>
                                <asp:ListItem>Italy</asp:ListItem>
                                <asp:ListItem>Jamaica</asp:ListItem>
                                <asp:ListItem>Japan</asp:ListItem>
                                <asp:ListItem>Jordan</asp:ListItem>
                                <asp:ListItem>Kazakhstan</asp:ListItem>
                                <asp:ListItem>Kenya</asp:ListItem>
                                <asp:ListItem>Kiribati</asp:ListItem>
                                <asp:ListItem>Korea</asp:ListItem>
                                <asp:ListItem>Kuwait</asp:ListItem>
                                <asp:ListItem>Kyrgyzstan</asp:ListItem>
                                <asp:ListItem>Lao People'S Dem Republic</asp:ListItem>
                                <asp:ListItem>Latvia</asp:ListItem>
                                <asp:ListItem>Lebanon</asp:ListItem>
                                <asp:ListItem>Lesotho</asp:ListItem>
                                <asp:ListItem>Liberia</asp:ListItem>
                                <asp:ListItem>Libyan Arab Jamahiriya</asp:ListItem>
                                <asp:ListItem>Liechtenstein</asp:ListItem>
                                <asp:ListItem>Lithuania</asp:ListItem>
                                <asp:ListItem>Luxembourg</asp:ListItem>
                                <asp:ListItem>Macau</asp:ListItem>
                                <asp:ListItem>Macedonia</asp:ListItem>
                                <asp:ListItem>Madagascar</asp:ListItem>
                                <asp:ListItem>Malawi</asp:ListItem>
                                <asp:ListItem>Malaysia</asp:ListItem>
                                <asp:ListItem>Maldives</asp:ListItem>
                                <asp:ListItem>Mali</asp:ListItem>
                                <asp:ListItem>Malta</asp:ListItem>
                                <asp:ListItem>Marshall Islands</asp:ListItem>
                                <asp:ListItem>Martinique</asp:ListItem>
                                <asp:ListItem>Mauritania</asp:ListItem>
                                <asp:ListItem>Mauritius</asp:ListItem>
                                <asp:ListItem>Mayotte</asp:ListItem>
                                <asp:ListItem>Mexico</asp:ListItem>
                                <asp:ListItem>Micronesia, Federated States</asp:ListItem>
                                <asp:ListItem>Moldova, Republic Of</asp:ListItem>
                                <asp:ListItem>Monaco</asp:ListItem>
                                <asp:ListItem>Mongolia</asp:ListItem>
                                <asp:ListItem>Montserrat</asp:ListItem>
                                <asp:ListItem>Morocco</asp:ListItem>
                                <asp:ListItem>Mozambique</asp:ListItem>
                                <asp:ListItem>Myanmar</asp:ListItem>
                                <asp:ListItem>Namibia</asp:ListItem>
                                <asp:ListItem>Nauru</asp:ListItem>
                                <asp:ListItem>Nepal</asp:ListItem>
                                <asp:ListItem>Netherlands</asp:ListItem>
                                <asp:ListItem>Netherlands Ant Illes</asp:ListItem>
                                <asp:ListItem>New Caledonia</asp:ListItem>
                                <asp:ListItem>New Zealand</asp:ListItem>
                                <asp:ListItem>Nicaragua</asp:ListItem>
                                <asp:ListItem>Niger</asp:ListItem>
                                <asp:ListItem>Nigeria</asp:ListItem>
                                <asp:ListItem>Niue</asp:ListItem>
                                <asp:ListItem>Norfolk Island</asp:ListItem>
                                <asp:ListItem>Northern Mariana Islands</asp:ListItem>
                                <asp:ListItem>Norway</asp:ListItem>
                                <asp:ListItem>Oman</asp:ListItem>
                                <asp:ListItem>Pakistan</asp:ListItem>
                                <asp:ListItem>Palau</asp:ListItem>
                                <asp:ListItem>Panama</asp:ListItem>
                                <asp:ListItem>Papua New Guinea</asp:ListItem>
                                <asp:ListItem>Paraguay</asp:ListItem>
                                <asp:ListItem>Peru</asp:ListItem>
                                <asp:ListItem>Philippines</asp:ListItem>
                                <asp:ListItem>Pitcairn</asp:ListItem>
                                <asp:ListItem>Poland</asp:ListItem>
                                <asp:ListItem>Portugal</asp:ListItem>
                                <asp:ListItem>Puerto Rico</asp:ListItem>
                                <asp:ListItem>Qatar</asp:ListItem>
                                <asp:ListItem>Reunion</asp:ListItem>
                                <asp:ListItem>Romania</asp:ListItem>
                                <asp:ListItem>Russian Federation</asp:ListItem>
                                <asp:ListItem>Rwanda</asp:ListItem>
                                <asp:ListItem>Saint K Itts And Nevis</asp:ListItem>
                                <asp:ListItem>Saint Lucia</asp:ListItem>
                                <asp:ListItem>Saint Vincent, The Grenadines</asp:ListItem>
                                <asp:ListItem>Samoa</asp:ListItem>
                                <asp:ListItem>San Marino</asp:ListItem>
                                <asp:ListItem>Sao Tome And Principe</asp:ListItem>
                                <asp:ListItem>Saudi Arabia</asp:ListItem>
                                <asp:ListItem>Senegal</asp:ListItem>
                                <asp:ListItem>Seychelles</asp:ListItem>
                                <asp:ListItem>Sierra Leone</asp:ListItem>
                                <asp:ListItem>Singapore</asp:ListItem>
                                <asp:ListItem>Slovakia (Slovak Republic)</asp:ListItem>
                                <asp:ListItem>Slovenia</asp:ListItem>
                                <asp:ListItem>Solomon Islands</asp:ListItem>
                                <asp:ListItem>Somalia</asp:ListItem>
                                <asp:ListItem>South Africa</asp:ListItem>
                                <asp:ListItem>South Georgia , S Sandwich Is.</asp:ListItem>
                                <asp:ListItem>Spain</asp:ListItem>
                                <asp:ListItem>Sri Lanka</asp:ListItem>
                                <asp:ListItem>St. Helena</asp:ListItem>
                                <asp:ListItem>St. Pierre And Miquelon</asp:ListItem>
                                <asp:ListItem>Sudan</asp:ListItem>
                                <asp:ListItem>Suriname</asp:ListItem>
                                <asp:ListItem>Svalbard, Jan Mayen Islands</asp:ListItem>
                                <asp:ListItem>Sw Aziland</asp:ListItem>
                                <asp:ListItem>Sweden</asp:ListItem>
                                <asp:ListItem>Switzerland</asp:ListItem>
                                <asp:ListItem>Syrian Arab Republic</asp:ListItem>
                                <asp:ListItem>Taiwan</asp:ListItem>
                                <asp:ListItem>Tajikistan</asp:ListItem>
                                <asp:ListItem>Tanzania, United Republic Of</asp:ListItem>
                                <asp:ListItem>Thailand</asp:ListItem>
                                <asp:ListItem>Togo</asp:ListItem>
                                <asp:ListItem>Tokelau</asp:ListItem>
                                <asp:ListItem>Tonga</asp:ListItem>
                                <asp:ListItem>Trinidad And Tobago</asp:ListItem>
                                <asp:ListItem>Tunisia</asp:ListItem>
                                <asp:ListItem>Turkey</asp:ListItem>
                                <asp:ListItem>Turkmenistan</asp:ListItem>
                                <asp:ListItem>Turks And Caicos Islands</asp:ListItem>
                                <asp:ListItem>Tuvalu</asp:ListItem>
                                <asp:ListItem>Uganda</asp:ListItem>
                                <asp:ListItem>Ukraine</asp:ListItem>
                                <asp:ListItem>United Arab Emirates</asp:ListItem>
                                <asp:ListItem>United Kingdom</asp:ListItem>
                                <asp:ListItem>United States</asp:ListItem>
                                <asp:ListItem>United States Minor Is.</asp:ListItem>
                                <asp:ListItem>Uruguay</asp:ListItem>
                                <asp:ListItem>Uzbekistan</asp:ListItem>
                                <asp:ListItem>Vanuatu</asp:ListItem>
                                <asp:ListItem>Venezuela</asp:ListItem>
                                <asp:ListItem>Viet Nam</asp:ListItem>
                                <asp:ListItem>Virgin Islands (British)</asp:ListItem>
                                <asp:ListItem>Virgin Islands (U.S.)</asp:ListItem>
                                <asp:ListItem>Wallis And Futuna Islands</asp:ListItem>
                                <asp:ListItem>Western Sahara</asp:ListItem>
                                <asp:ListItem>Yemen</asp:ListItem>
                                <asp:ListItem>Yugoslavia</asp:ListItem>
                                <asp:ListItem>Zaire</asp:ListItem>
                                <asp:ListItem>Zambia</asp:ListItem>
                                <asp:ListItem>Zimbabwe</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="CompanyCountryValidator" ControlToValidate="DDLAddCompanyCountry"
                                InitialValue="--Select Country--" ValidationGroup="AddCompanyValidationGroup" ErrorMessage="Please select a country" SetFocusOnError="true"
                                CssClass="val-msg"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top;">
                            <asp:Label runat="server" ID="LblAddCompanyNameAr" Text="Name (Arabic)"></asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="TxtAddCompanyNameAr" CssClass="input-small" placeholder="Company Name (Arabic)"></asp:TextBox></td>
                        <td style="vertical-align: top;">
                            <asp:Label runat="server" ID="LblAddCompanySite" Text="Site"></asp:Label></td>
                        <td>
                            <asp:TextBox runat="server" ID="TxtAddCompanySite" CssClass="input-small" placeholder="e.g. www.exmple.com"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td style="text-align: right; padding: 4px 0px 4px 4px;">
                            <asp:Button runat="server" ID="BtnInsertCompany" Text="+ Add" Style="margin-right: 10px;" CssClass="btn" ValidationGroup="AddCompanyValidationGroup" OnClick="BtnInsertCompany_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="panel half-width float-right" style="margin-top: 30px;">
                <h1 class="header"><span style="width: 105px;">Upload File</span></h1>
                <table class="search-box">
                <tr>
                    <th><asp:Label ID="lblMessage" runat="server" Text="Please Choose File To Upload" Font-Bold="true"></asp:Label></th>
                    </tr>
                <tr>
                    <td><asp:FileUpload ID="ImportFile" runat="server" CssClass="input-small" /></td>
                    <td><asp:Button ID="BtnUpload" runat="server" Text="Import File" CssClass="btn" /></td>
                    <td><asp:Button ID="BtnExport" runat="server" Text="Export File" CssClass="btn" /></td>
                </tr>
            </table>
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
            <asp:GridView CssClass="myGridClass" DataKeyNames="ID" AlternatingRowStyle-CssClass="myAltRowClass"
                PagerStyle-CssClass="myPagerClass" ID="GVCompany" runat="server" AutoGenerateColumns="False"
                OnRowCancelingEdit="GVCompany_RowCancelingEdit" OnRowDeleting="GVCompany_RowDeleting" OnRowEditing="GVCompany_RowEditing"
                OnRowUpdating="GVCompany_RowUpdating">
                <AlternatingRowStyle CssClass="myAltRowClass"></AlternatingRowStyle>
                <Columns>
                    <asp:TemplateField HeaderText="ID" Visible="true">
                        <EditItemTemplate>
                            <asp:Label ID="LblIDEdit" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name (English)">
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtNameEng" runat="server" Text='<%# Bind("Name") %>' ReadOnly="true"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblNameEng" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name (Arabic)">
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtNameAr" runat="server" Text='<%# Bind("NameAr") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblNameAr" runat="server" Text='<%# Bind("NameAr") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country">
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtCountry" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblCountry" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Site">
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtSite" runat="server" Text='<%# Bind("Site") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblSite" runat="server" Text='<%# Bind("Site") %>'></asp:Label>
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
