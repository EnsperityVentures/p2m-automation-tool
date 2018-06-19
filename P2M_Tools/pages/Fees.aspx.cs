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
    public partial class Fees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { FetchFees(); }
        }
        protected void FetchFees() {
            FeeDAL feesDAL = new FeeDAL
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString()
            };

            GVFees.DataSource = feesDAL.GetFees(null);
            GVFees.DataBind();
        }

        protected void ResetControls() {
            TxtAddFeesRewardName.Text = string.Empty;
            TxtAddFeesShippingCost.Text  = string.Empty;
            TxtAddFeesHandlingCost.Text  = string.Empty;
            TxtAddFeesServiceCharge.Text = string.Empty;
            TxtAddFeesSKU.Text = string.Empty;

        }

        protected void GVFees_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVFees.EditIndex = -1;
            FetchFees();
        }

        protected void GVFees_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            FeeDAL feesDAL = new FeeDAL
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString()
            };

            string IDString = GVFees.DataKeys[e.RowIndex].Values["ID"].ToString();

            feesDAL.DeleteFees(IDString);

            GVFees.EditIndex = -1;
            FetchFees();
        }

        protected void GVFees_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVFees.EditIndex = e.NewEditIndex;
            FetchFees();
        }

        protected void GVFees_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            FeeDAL feesDAL = new FeeDAL
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString()
            };

            Fee fees = new Fee
            {
                ID = Convert.ToInt32((GVFees.Rows[e.RowIndex].FindControl("LblFeesIDEdit") as Label).Text),
                RewardName = (GVFees.Rows[e.RowIndex].FindControl("TxtFeesRewardName") as TextBox).Text,
                ShippingCost = Double.Parse((GVFees.Rows[e.RowIndex].FindControl("TxtFeesShippingCost") as TextBox).Text),
                HandlingCost = Double.Parse((GVFees.Rows[e.RowIndex].FindControl("TxtFeesHandlingCost") as TextBox).Text),
                ServiceCharge = Double.Parse((GVFees.Rows[e.RowIndex].FindControl("TxtFeesServiceCharge") as TextBox).Text),
                SKU = (GVFees.Rows[e.RowIndex].FindControl("TxtFeesSKU") as TextBox).Text
            };

            feesDAL.InsertFees(fees);

            GVFees.EditIndex = -1;
            FetchFees();
        }

        protected void GVFees_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVFees.EditIndex = -1;
            GVFees.PageIndex = e.NewPageIndex;
            FetchFees();
        }

        protected void BtnInsertFee_Click(object sender, EventArgs e)
        {
            FeeDAL feesDAL = new FeeDAL
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString()
            };

            Fee fees = new Fee
            {
                RewardName = TxtAddFeesRewardName.Text,
                ShippingCost = Double.Parse(TxtAddFeesShippingCost.Text),
                HandlingCost = Double.Parse(TxtAddFeesHandlingCost.Text),
                ServiceCharge = Double.Parse(TxtAddFeesServiceCharge.Text),
                SKU = TxtAddFeesSKU.Text
            };

            feesDAL.InsertFees(fees);
            GVFees.EditIndex = -1;

            ResetControls();
            FetchFees();
        }
    }
}