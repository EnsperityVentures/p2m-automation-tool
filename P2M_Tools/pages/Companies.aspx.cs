using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Entities;
namespace P2M_Tools.pages
{
    public partial class Companies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
            {
            if (!IsPostBack)
            {
                FetchCompany();
            }
        }

        public void ShowMessage(string Message)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                "<script language = 'javascript' > alert('" + Message + "');</ script > ");
        }

        public void FetchCompany() {
            CompanyDAL CompDAL = new CompanyDAL {
                ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString()
            };

            GVCompany.DataSource = CompDAL.GetCompany(null);
            GVCompany.DataBind();
        }

        public void FetchCompany(string CompanyName)
        {
            CompanyDAL CompDAL = new CompanyDAL
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString()
            };

            GVCompany.DataSource = CompDAL.GetCompany(CompanyName);
            GVCompany.DataBind();
        }

        protected void ResetControls()
        {
            TxtAddCompanyName.Text = string.Empty;
            DDLAddCompanyCountry.SelectedIndex = 0;
            TxtAddCompanyNameAr.Text = string.Empty;
            TxtAddCompanySite.Text = string.Empty;
        }

        protected void GVCompany_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVCompany.EditIndex = e.NewEditIndex;
            FetchCompany();

        }

        protected void GVCompany_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            CompanyDAL CompDAL = new CompanyDAL
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString()
            };

            Company command = new Company {
                Name = (GVCompany.Rows[e.RowIndex].FindControl("TxtNameEng") as TextBox).Text,
                Country = (GVCompany.Rows[e.RowIndex].FindControl("TxtCountry") as TextBox).Text,
                NameAr = (GVCompany.Rows[e.RowIndex].FindControl("TxtNameAr") as TextBox).Text,
                Site = (GVCompany.Rows[e.RowIndex].FindControl("TxtSite") as TextBox).Text
            };
            CompDAL.InsertCompany(command);
            GVCompany.EditIndex = -1;
            FetchCompany();
        }

        protected void GVCompany_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            CompanyDAL CompDAL = new CompanyDAL
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString()
            };

            Company command = new Company { Name = (GVCompany.Rows[e.RowIndex].FindControl("LblNameEng") as Label).Text };

            CompDAL.DeleteCompany(command.Name);
            GVCompany.EditIndex = -1;
            FetchCompany();
        }

        protected void GVCompany_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVCompany.EditIndex = -1;
            FetchCompany();
        }

        protected void BtnInsertCompany_Click(object sender, EventArgs e)
        {
            CompanyDAL CompDAL = new CompanyDAL
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString()
            };

            Company command = new Company {
                Name = TxtAddCompanyName.Text,
                Country = DDLAddCompanyCountry.Text,
                NameAr = TxtAddCompanyNameAr.Text,
                Site = TxtAddCompanySite.Text
            };

            CompDAL.InsertCompany(command);
            GVCompany.EditIndex = -1;

            ResetControls();
            FetchCompany();
        }
        
    }
}