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
    public partial class Currencies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { FetchCurrency(); }
        }

        protected void FetchCurrency()
        {
            CurrencyDAL currencyDAL = new CurrencyDAL
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString()
            };

            GVCurrency.DataSource = currencyDAL.GetCurrency();
            GVCurrency.DataBind();
        }

        protected void GVCurrency_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVCurrency.EditIndex = -1;
            FetchCurrency();
        }

        protected void GVCurrency_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            CurrencyDAL currencyDAL = new CurrencyDAL { ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString() };
            string IDString = GVCurrency.DataKeys[e.RowIndex].Values["ID"].ToString();
            currencyDAL.DeleteCurrency(IDString);
            GVCurrency.EditIndex = -1;

            FetchCurrency();

        }

        protected void GVCurrency_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            CurrencyDAL currencyDAL = new CurrencyDAL
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString()
            };

            Currency currency = new Currency
            {
                ID = Int32.Parse((GVCurrency.Rows[e.RowIndex].FindControl("LblCurrencyID") as Label).Text),
                Name = (GVCurrency.Rows[e.RowIndex].FindControl("txtCurrencyName") as TextBox).Text,
                Country = (GVCurrency.Rows[e.RowIndex].FindControl("DDLCurrencyCountry") as DropDownList).Text,
                PointValue_Rate = Double.Parse((GVCurrency.Rows[e.RowIndex].FindControl("TxtCurrencyPVR") as TextBox).Text),
                USDRate = Double.Parse((GVCurrency.Rows[e.RowIndex].FindControl("TxtCurrencyUSD") as TextBox).Text),
                ISO = (GVCurrency.Rows[e.RowIndex].FindControl("TxtCurrencyISO") as TextBox).Text
            };

            currencyDAL.UpdateCurrency(currency);
            GVCurrency.EditIndex = -1;

            FetchCurrency();
        }

        protected void GVCurrency_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVCurrency.EditIndex = e.NewEditIndex;
            FetchCurrency();
        }

        protected void BtnInsertCurrency_Click(object sender, EventArgs e)
        {
            CurrencyDAL currencyDAL = new CurrencyDAL
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString()
            };

            Currency currency = new Currency
            {
                Name = TxtAddCurrencyName.Text,
                Country = DDLAddCurrencyCountry.Text,
                PointValue_Rate = Double.Parse(TxtAddCurrencyPVR.Text),
                USDRate = Double.Parse(TxtAddCurrencyUSD.Text),
                ISO = TxtAddCurrencyISO.Text
            };

            currencyDAL.InsertCurrency(currency);
            GVCurrency.EditIndex = -1;

            ResetControls();
            FetchCurrency();
        }

        protected void ResetControls()
        {
            TxtAddCurrencyName.Text = string.Empty;
            DDLAddCurrencyCountry.Text = string.Empty;
            TxtAddCurrencyPVR.Text = string.Empty;
            TxtAddCurrencyUSD.Text = string.Empty;
            TxtAddCurrencyISO.Text = string.Empty;
        }

        protected void GVCurrency_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (((e.Row.RowState) & DataControlRowState.Edit) != 0)
                {
                    DropDownList DDLCountries = e.Row.FindControl("DDLCurrencyCountry") as DropDownList;
                    DDLCountries.Text = GVCurrency.DataKeys[e.Row.RowIndex].Values["Country"].ToString();
                }
            }
        }
    }
}