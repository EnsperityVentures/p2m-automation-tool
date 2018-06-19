using System;
using System.Collections.Generic;
using Entities;
using MySql.Data.MySqlClient;

namespace DAL
{
    public class GiftCardsDAL
    {
        public string ConnectionString { get; set; }

        public void InsertGiftCardsInvoice(GiftCardInvoice invoice)
        {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            MySqlCommand command = new MySqlCommand("UpsertGiftCardsInvoice", connection) { CommandType = System.Data.CommandType.StoredProcedure };

            command.Parameters.Add(new MySqlParameter("VarOrderId", invoice.OrderID));
            command.Parameters.Add(new MySqlParameter("VarEmployeeID", invoice.EmployeeID));
            command.Parameters.Add(new MySqlParameter("VarLineNumber", invoice.LineNumber));
            command.Parameters.Add(new MySqlParameter("VarRewardName", invoice.RewardName));
            command.Parameters.Add(new MySqlParameter("VarOrderDate", invoice.OrderDate));
            command.Parameters.Add(new MySqlParameter("VarLocalCost", invoice.LocalCost));
            command.Parameters.Add(new MySqlParameter("VarQuantity", invoice.Quantity));
            command.Parameters.Add(new MySqlParameter("VarReasonofReturn", invoice.ReasonofReturn));
            command.Parameters.Add(new MySqlParameter("VarCountry", invoice.Country));
            command.Parameters.Add(new MySqlParameter("VarSKU", invoice.SKU));

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public void DeleteGiftCardsInvoice(string OrderNo)
        {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            MySqlCommand command = new MySqlCommand("DeleteGiftCardsInvoice", connection) { CommandType = System.Data.CommandType.StoredProcedure };
            command.Parameters.Add(new MySqlParameter("VarOrderId", OrderNo));

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public List<GiftCardInvoice> GetGiftCardsInvoice(string OrderNo, string EmployeeID, DateTime StartDate, DateTime EndDate)
        {
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            try
            {
                MySqlCommand command = new MySqlCommand("GetGiftCardsInvoice", connection) { CommandType = System.Data.CommandType.StoredProcedure };

                command.Parameters.Add(new MySqlParameter("VarOrderId", OrderNo));
                command.Parameters.Add(new MySqlParameter("VarEMPID", EmployeeID));

                List<GiftCardInvoice> GCInvoiceList = new List<GiftCardInvoice>();

                if (StartDate != DateTime.MinValue)
                {
                    command.Parameters.Add(new MySqlParameter("VarStartDate", StartDate.Date));
                }
                else
                {
                    command.Parameters.Add(new MySqlParameter("VarStartDate", null));
                }
                if (EndDate != DateTime.MinValue)
                {
                    command.Parameters.Add(new MySqlParameter("VarEndDate", EndDate.Date));
                }
                else
                {
                    command.Parameters.Add(new MySqlParameter("VarEndDate", null));
                }

                connection.Open();

                MySqlDataReader dataReader = command.ExecuteReader();

                while (dataReader.Read())
                {
                    GiftCardInvoice GCInvoice = new GiftCardInvoice()
                    {
                        OrderID = dataReader["OrderId"].ToString(),
                        EmployeeID = dataReader["EmployeeID"].ToString(),
                        LineNumber = (dataReader["LineNumber"].ToString()).Split('-')[0],
                        RewardName = dataReader["RewardName"].ToString(),
                        Quantity = Convert.ToInt32(dataReader["Quantity"]),
                        LocalCost = (dataReader["LocalCost"].ToString()),
                        ReasonofReturn = dataReader["ReasonofReturn"].ToString(),
                        USDCost = Convert.ToDouble(dataReader["USDCost"]),
                        Country = dataReader["Country"].ToString(),
                        SKU = dataReader["SKU"].ToString()
                    };

                    DateTime? OrderDate = (dataReader["OrderDate"] == System.DBNull.Value) ? (DateTime?)null : Convert.ToDateTime(dataReader["OrderDate"]).Date;
                    GCInvoice.OrderDate = OrderDate;

                    GCInvoiceList.Add(GCInvoice);
                }
                connection.Close();
                return GCInvoiceList;
            }
            catch (Exception e)
            {
                connection.Close();
                return null;
            }

        }

        public List<GiftCardInvoice> GetGiftCardsInvoiceTotal(DateTime StartDate, DateTime EndDate)
        {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            try
            {
                MySqlCommand command = new MySqlCommand("GetGCTotal", connection) { CommandType = System.Data.CommandType.StoredProcedure };

                command.Parameters.Add(new MySqlParameter("VarStartDate", StartDate));
                command.Parameters.Add(new MySqlParameter("VarEndDate", EndDate));

                List<GiftCardInvoice> GCTList = new List<GiftCardInvoice>();

                connection.Open();

                MySqlDataReader dataReader = command.ExecuteReader();

                while (dataReader.Read())
                {
                    GiftCardInvoice GCInvoice = new GiftCardInvoice()
                    {
                        TotalLocalCost = Convert.ToDouble(dataReader["TotalLocalCost"]),
                        TotalUSDCost = Convert.ToDouble(dataReader["TotalUSDCost"])
                    };

                    GCTList.Add(GCInvoice);
                }
                connection.Close();
                return GCTList;
            }
            catch
            {
                connection.Close();
                return null;
            }
        }
    }
}
