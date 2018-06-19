using System;
using System.IO;
using System.Text;
using System.Configuration;
using System.Web.UI.WebControls;
using Entities;
using DAL;
using System.Collections.Generic;

namespace P2M_Tools.pages
{
    public partial class OmanFloatAmount : System.Web.UI.Page
    {
        string SelectedText;
        int amountID;
        string CurrentDate;



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { FetchFloat(); FetchAmount(); }
        }
        protected void FetchFloat()
        {
            FloatAmountDAL theFloat = new FloatAmountDAL { ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString() };

            GVFloat.DataSource = theFloat.GetFloat(null);
            GVFloat.DataBind();
        }
        protected void FetchAmount()
        {
            FloatAmountDAL theAmount = new FloatAmountDAL { ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString() };
            Double TotalAmount = Convert.ToDouble(theAmount.GetTotalAmount());
            LblTotalAmount.Text = "Total remaining amount: " + TotalAmount;
            GVAmount.DataSource = theAmount.GetAmount();
            GVAmount.DataBind();
        }

        protected void GVFloat_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVFloat.PageIndex = e.NewPageIndex;
            FetchFloat();
        }

        protected void GVFloat_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVFloat.EditIndex = -1;
            FetchFloat();

        }

        protected void GVFloat_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            FloatAmountDAL floatDAL = new FloatAmountDAL { ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString() };

            string OrderNo = GVFloat.DataKeys[e.RowIndex].Values["OrderNo"].ToString();
            floatDAL.DeleteFloat(OrderNo);

            FetchFloat();
        }

        protected void GVFloat_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVFloat.EditIndex = e.NewEditIndex;
            FetchFloat();
        }

        protected void GVFloat_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            FloatAmountDAL floatDAL = new FloatAmountDAL { ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString() };

            Float TheFloat = new Float()
            {
                OrderNo = (GVFloat.Rows[e.RowIndex].FindControl("LblFloatOrderNo") as Label).Text,
                OrderDate = DateTime.Parse((GVFloat.Rows[e.RowIndex].FindControl("LblFloatOrderDate") as Label).Text),
                MemberName = (GVFloat.Rows[e.RowIndex].FindControl("LblFloatMemberName") as Label).Text,
                Totalcost = Double.Parse((GVFloat.Rows[e.RowIndex].FindControl("LblFloatCost") as Label).Text),
                Deliveryfees = Double.Parse((GVFloat.Rows[e.RowIndex].FindControl("LblFloatFees") as Label).Text),
                Status = (GVFloat.Rows[e.RowIndex].FindControl("DLLStatusList") as DropDownList).Text,
                TotalCostwithDelivery = Double.Parse((GVFloat.Rows[e.RowIndex].FindControl("LblFloatTotal") as Label).Text),
                CardTypeandAmount = (GVFloat.Rows[e.RowIndex].FindControl("LblFloatProduct") as Label).Text,
                Quantity = Int32.Parse((GVFloat.Rows[e.RowIndex].FindControl("LblFloatQuantity") as Label).Text),
                DeliveryDate = ((GVFloat.Rows[e.RowIndex].FindControl("TxtFloatDeliveryDate") as TextBox).Text == string.Empty) ? (DateTime?)null : DateTime.Parse((GVFloat.Rows[e.RowIndex].FindControl("TxtFloatDeliveryDate") as TextBox).Text)
            };

            floatDAL.InsertFloat(TheFloat);
            GVFloat.EditIndex = -1;

            FetchFloat();
        }

        protected void GVFloat_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                if (((e.Row.RowState) & DataControlRowState.Edit) != 0)
                {
                    DropDownList ddl = (DropDownList)e.Row.FindControl("DLLStatusList");
                    TextBox DateBox = (TextBox)e.Row.FindControl("TxtFloatDeliveryDate");


                    SelectedText = GVFloat.DataKeys[e.Row.RowIndex].Values["Status"].ToString();

                    FetchStatusList(ddl, SelectedText);


                    //CurrentDate = (GVFloat.DataKeys[e.Row.RowIndex].Values["DeliveryDate"] == null) ? string.Empty : GVFloat.DataKeys[e.Row.RowIndex].Values["DeliveryDate"].ToString();
                    //DateBox.Text = CurrentDate;
                }
            }
        }

        protected void FetchStatusList(DropDownList StatusList, string SelectedText)
        {
            StatusList.Items.Add(new ListItem("Pending"));
            StatusList.Items.Add(new ListItem("Ordered"));
            StatusList.Items.Add(new ListItem("Shipped"));
            StatusList.Items.Add(new ListItem("Return Confirmed"));
            StatusList.Items.Add(new ListItem("Other"));

            if (SelectedText == "Pending") { StatusList.SelectedIndex = 0; }
            else if (SelectedText == "Ordered") { StatusList.SelectedIndex = 1; }
            else if (SelectedText == "Shipped") { StatusList.SelectedIndex = 2; }
            else if (SelectedText == "Return Confirmed") { StatusList.SelectedIndex = 3; }
            else { StatusList.SelectedIndex = 4; }
        }

        protected void Menu2_MenuItemClick(object sender, MenuEventArgs e)
        {
            int val = Convert.ToInt32(Menu2.SelectedValue);
            MVFloatAndAmount.ActiveViewIndex = val;

        }

        protected void GVAmount_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVAmount.EditIndex = -1;
            FetchAmount();
        }

        protected void GVAmount_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            FloatAmountDAL amountDAL = new FloatAmountDAL { ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString() };

            string ID = GVAmount.DataKeys[e.RowIndex].Values["ID"].ToString();
            amountDAL.DeleteAmount(ID);

            FetchAmount();

        }

        protected void GVAmount_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVAmount.EditIndex = e.NewEditIndex;
            FetchAmount();
        }

        protected void GVAmount_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            FloatAmountDAL amountDAL = new FloatAmountDAL { ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString() };

            Amount TheAmount = new Amount();

            TheAmount.ID = Convert.ToInt32(GVAmount.DataKeys[e.RowIndex].Values["ID"].ToString());
            TheAmount.PaymentstoOman = Convert.ToDouble((GVAmount.Rows[e.RowIndex].FindControl("TxtAmountPayment") as TextBox).Text);
            TheAmount.Dateofpayment = ((GVAmount.Rows[e.RowIndex].FindControl("TxtAmountPaymentDate") as TextBox).Text == string.Empty) ? (DateTime?)null : DateTime.Parse((GVAmount.Rows[e.RowIndex].FindControl("TxtAmountPaymentDate") as TextBox).Text);
          

            amountDAL.InsertAmount(TheAmount);
            GVAmount.EditIndex = -1;

            FetchAmount();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            FloatAmountDAL amountDAL = new FloatAmountDAL { ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString() };

            Amount TheAmount = new Amount();

            
            TheAmount.PaymentstoOman = Convert.ToDouble(TxtAddPaymentAmount.Text);
            TheAmount.Dateofpayment = (TxtAddPaymentDate.Text == string.Empty) ? (DateTime?)null : DateTime.Parse(TxtAddPaymentDate.Text);


            amountDAL.InsertAmount(TheAmount);
            
            FetchAmount();
        }

        
    }
}