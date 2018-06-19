using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL;
using Entities;
using MySql.Data.MySqlClient;

namespace P2M_Tools.pages
{
    public partial class ClientsInvoices : System.Web.UI.Page
    {
        static DateTime sdate;
        static DateTime edate;
        double TotalLocalCost;
        double TotalUSDCost;
        static string search;
        static int company;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { FetchCompaniesList();
                
            }
        }

        public string ConnectionString { get; set; }

        protected void FetchClientsInvoice(string OrderNo, string EmpID, int company, DateTime sdate, DateTime edate)
        {
            ClientsInvoiceDAL invoice = new ClientsInvoiceDAL
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString()
            };
            sdate =  (string.IsNullOrEmpty(startDate.Text)) ? DateTime.MinValue : Convert.ToDateTime(startDate.Text);
            company = Convert.ToInt32(CompaniesList.SelectedValue);
            List<ClientsInvoice> ClientsInvoiceList = invoice.GetClientsInvoice(OrderNo, EmpID, sdate, edate, company);

            GVClientsInvoice.DataSource = ClientsInvoiceList;
            GVClientsInvoice.DataBind();

        }

        protected void GVClientsInvoice_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            company = Convert.ToInt32(CompaniesList.SelectedValue);

            GVClientsInvoice.EditIndex = -1;
            FetchClientsInvoice(search, search, company, sdate, edate);
        }

        protected void GVClientsInvoice_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ClientsInvoiceDAL invoice = new ClientsInvoiceDAL
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString()
            };

            string IDString = GVClientsInvoice.DataKeys[e.RowIndex].Values["OrderNo"].ToString();
            invoice.DeleteClientsInvoice(IDString);

            FetchClientsInvoice(search, search, company, sdate, edate);

        }

        protected void GVClientsInvoice_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ClientsInvoiceDAL invoice = new ClientsInvoiceDAL
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString()
            };
            ClientsInvoice command = new ClientsInvoice();
            //{
            //    OrderNo = (GVClientsInvoice.Rows[e.RowIndex].FindControl("LblInvoicesOrderNoEdit") as Label).Text,
            //    EmployeeID = (GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesEmpID") as TextBox).Text,
            //    FirstName = (GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesFName") as TextBox).Text,
            //    LastName = (GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesLName") as TextBox).Text,
            //    CatalogName = (GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesCName") as TextBox).Text,
            //    Quantity = Convert.ToInt32((GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesQuantity") as TextBox).Text),
            //    OrderDate = Convert.ToDateTime((GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesOrderDate") as TextBox).Text),
            //    LocalCost = Convert.ToDouble((GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesLocalCost") as TextBox).Text),

            //    //USDCost = Convert.ToDouble((GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesUSDCost") as TextBox).Text),
            //    TotalLocalCost = Convert.ToDouble(GVClientsInvoice.DataKeys[e.RowIndex].Values["TotalLocalCost"].ToString()),
            //    RedemptionPoints = (GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesRP") as TextBox).Text,
            //    ReasonofReturn = (GVClientsInvoice.Rows[e.RowIndex].FindControl("DDLInvoicesReason") as DropDownList).SelectedValue,

            //    Country = GVClientsInvoice.DataKeys[e.RowIndex].Values[2].ToString()
            //};
            command.OrderNo = (GVClientsInvoice.Rows[e.RowIndex].FindControl("LblInvoicesOrderNoEdit") as Label).Text;
            command.EmployeeID = (GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesEmpID") as TextBox).Text;
            command.FirstName = (GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesFName") as TextBox).Text;
            command.LastName = (GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesLName") as TextBox).Text;
            command.CatalogName = (GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesCName") as TextBox).Text;
            command.Quantity = Convert.ToInt32((GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesQuantity") as TextBox).Text);
            command.OrderDate = Convert.ToDateTime((GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesOrderDate") as TextBox).Text);
            command.LocalCost = Convert.ToDouble((GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesLocalCost") as TextBox).Text);

            //USDCost = Convert.ToDouble((GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesUSDCost") as TextBox).Text);
            command.TotalLocalCost = Convert.ToDouble(GVClientsInvoice.DataKeys[e.RowIndex].Values["TotalLocalCost"].ToString());
            command.RedemptionPoints = (GVClientsInvoice.Rows[e.RowIndex].FindControl("TxtInvoicesRP") as TextBox).Text;
            command.ReasonofReturn = (GVClientsInvoice.Rows[e.RowIndex].FindControl("DDLInvoicesReason") as DropDownList).SelectedValue;

            command.Country = GVClientsInvoice.DataKeys[e.RowIndex].Values[2].ToString();

            invoice.InsertClientsInvoice(command);
            GVClientsInvoice.EditIndex = -1;
            FetchClientsInvoice(search, search, company, sdate, edate);
        }

        protected void GVClientsInvoice_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int company = Convert.ToInt32(CompaniesList.SelectedValue);
            GVClientsInvoice.EditIndex = e.NewEditIndex;
            FetchClientsInvoice(search, search, company, sdate, edate);
        }

        protected void GVClientsInvoice_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            int company = Convert.ToInt32(CompaniesList.SelectedValue);
            GVClientsInvoice.EditIndex = -1;
            GVClientsInvoice.PageIndex = e.NewPageIndex;
            FetchClientsInvoice(search, search, company, sdate, edate);
        }

        protected void FetchCompaniesList()
        {
            //MySqlConnection connection = new MySqlConnection
            //{
            //ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString()
            //};

            //MySqlCommand command = new MySqlCommand("SELECT Name FROM  `shobingg_P2M_Operations`.`Clients Invoices` group by Company", connection)
            //{
            //CommandType = System.Data.CommandType.Text
            //};

            //MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SELECT ID,Name FROM  `shobingg_P2M_Operations`.`Company` ", connection);

            //DataTable dataTable = new DataTable();

            //dataAdapter.Fill(dataTable);

            //connection.Open();

            //CompaniesList.DataSource = dataTable;
            //CompaniesList.DataTextField = "Name";
            //CompaniesList.DataValueField = "ID";
            //CompaniesList.DataBind();

            //connection.Close();

            CompanyDAL companies = new CompanyDAL
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString()
            };

            CompaniesList.DataSource = companies.GetCompany(null);
            CompaniesList.DataTextField = "Name";
            CompaniesList.DataValueField = "ID";
            CompaniesList.DataBind();
            CompaniesList.Items.Insert(0, new ListItem("--Select Company--","0"));

        }

        protected void FetchReasonsList(DropDownList ReasonsList, string selectedText) {
            ReasonsList.Items.Add(new ListItem("None", "-1"));
            ReasonsList.Items.Add(new ListItem("Not Available", "0"));
            ReasonsList.Items.Add(new ListItem("By Customer", "1"));

            if (selectedText == "N/A")
            {
                ReasonsList.SelectedValue = "0";
            }
            else if (selectedText == "By Customer")
            {
                ReasonsList.SelectedValue = "1";
            }
            else
            {
                ReasonsList.SelectedValue = "-1";
            }
        }

        protected void GVClientsInvoice_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (((e.Row.RowState) & DataControlRowState.Edit) != 0) {
                    DropDownList ddl = (DropDownList)e.Row.FindControl("DDLInvoicesReason");

                    string selectedtext = GVClientsInvoice.DataKeys[e.Row.RowIndex].Values["ReasonofReturn"].ToString();

                    FetchReasonsList(ddl, selectedtext);
                }
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
           
            FetchClientsInvoice(search, search, company, sdate, edate);
        }
    }
}