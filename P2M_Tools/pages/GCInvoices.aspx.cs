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
    public partial class GCInvoices : System.Web.UI.Page
    {
        double TotalLocalCost;
        double TotalUSDCost;
        static DateTime sdate;
        static DateTime edate;
        static string searchOrder;
        static string searchEmp;
        static string selectedtext;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                FetchGCInvoice(searchOrder, searchEmp, sdate, edate);
            }
        }

        protected void FetchGCInvoice(string OrderNo, string EmpID, DateTime sdate, DateTime edate) {
            GiftCardsDAL giftCardsDAL = new GiftCardsDAL { ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString() };

            List<GiftCardInvoice> giftCardsList = giftCardsDAL.GetGiftCardsInvoice(OrderNo, EmpID, sdate, edate);

            GVGiftCardOrders.DataSource = giftCardsList;
            GVGiftCardOrders.DataBind();

        }

        protected void GVGiftCardOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVGiftCardOrders.PageIndex = e.NewPageIndex;
            FetchGCInvoice(searchOrder, searchEmp, sdate, edate);
        }

        protected void GVGiftCardOrders_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVGiftCardOrders.EditIndex = -1;
            FetchGCInvoice(searchOrder, searchEmp, sdate, edate);
        }

        protected void GVGiftCardOrders_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GiftCardsDAL giftCardsDAL = new GiftCardsDAL { ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString() };

            string OrderNo = GVGiftCardOrders.DataKeys[e.RowIndex].Values["OrderNo"].ToString();
            giftCardsDAL.DeleteGiftCardsInvoice(OrderNo);

            FetchGCInvoice(searchOrder, searchEmp, sdate, edate);
        }

        protected void GVGiftCardOrders_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GiftCardsDAL giftCardsDAL = new GiftCardsDAL { ConnectionString = ConfigurationManager.ConnectionStrings["MySQLTest"].ToString() };

            GiftCardInvoice invoice = new GiftCardInvoice {
                OrderID = (GVGiftCardOrders.Rows[e.RowIndex].FindControl("LblGCinvoiceOrderNo") as Label).Text,
                EmployeeID = (GVGiftCardOrders.Rows[e.RowIndex].FindControl("LblGCinvoiceEmployeeID") as Label).Text,
                LineNumber = (GVGiftCardOrders.Rows[e.RowIndex].FindControl("LblGCinvoiceLineNumber") as Label).Text,
                RewardName = (GVGiftCardOrders.Rows[e.RowIndex].FindControl("LblGCinvoiceRewardName") as Label).Text,
                OrderDate = Convert.ToDateTime((GVGiftCardOrders.Rows[e.RowIndex].FindControl("LblGCinvoiceOrderDate") as Label).Text),
                LocalCost = (GVGiftCardOrders.Rows[e.RowIndex].FindControl("LblGCinvoiceLocalCost") as Label).Text,
                Quantity = Convert.ToInt32((GVGiftCardOrders.Rows[e.RowIndex].FindControl("LblGCinvoiceQuantity") as Label).Text),
                ReasonofReturn = (GVGiftCardOrders.Rows[e.RowIndex].FindControl("DDLGCInvoiceReason") as DropDownList).Text
            };

            giftCardsDAL.InsertGiftCardsInvoice(invoice);
            GVGiftCardOrders.EditIndex = -1;
            FetchGCInvoice(searchOrder, searchEmp, sdate, edate);

        }

        protected void GVGiftCardOrders_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVGiftCardOrders.EditIndex = e.NewEditIndex;
            FetchGCInvoice(searchOrder, searchEmp, sdate, edate);
        }

        protected void FetchReasonsList(DropDownList ReasonsList, string selectedText)
        {
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

        protected void GVGiftCardOrders_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (((e.Row.RowState) & DataControlRowState.Edit) != 0)
                {
                    DropDownList ddl = (DropDownList)e.Row.FindControl("DDLGCInvoiceReason");

                    selectedtext = GVGiftCardOrders.DataKeys[e.Row.RowIndex].Values["ReasonofReturn"].ToString();

                    FetchReasonsList(ddl, selectedtext);
                }
            }
        }
    }
}