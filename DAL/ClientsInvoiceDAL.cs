using System;
using System.Collections.Generic;
using Entities;
using MySql.Data.MySqlClient;

namespace DAL
{
    public class ClientsInvoiceDAL
    {
        public string ConnectionString { set; get; }

        public void InsertClientsInvoice(ClientsInvoice invoice)
        {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            MySqlCommand command = new MySqlCommand("UpsertClientsInvoice", connection) { CommandType = System.Data.CommandType.StoredProcedure };
            command.Parameters.Add(new MySqlParameter("VarOrderNo", invoice.OrderNo));
            command.Parameters.Add(new MySqlParameter("VarEmployeeID", invoice.EmployeeID));
            command.Parameters.Add(new MySqlParameter("VarFirstName", invoice.FirstName));
            command.Parameters.Add(new MySqlParameter("VarLastName", invoice.LastName));
            command.Parameters.Add(new MySqlParameter("VarCatalogName", invoice.CatalogName));
            command.Parameters.Add(new MySqlParameter("VarQuantity", invoice.Quantity));
            command.Parameters.Add(new MySqlParameter("VarOrderDate", invoice.OrderDate));
            command.Parameters.Add(new MySqlParameter("VarRedemptionPoints", invoice.RedemptionPoints));
            command.Parameters.Add(new MySqlParameter("VarLocalCost", invoice.LocalCost));
            command.Parameters.Add(new MySqlParameter("VarCountry", invoice.Country));
            command.Parameters.Add(new MySqlParameter("VarReasonofReturn", invoice.ReasonofReturn));

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public void DeleteClientsInvoice(string OrderNo)
        {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            MySqlCommand command = new MySqlCommand("DeleteClientsInvoice", connection) { CommandType = System.Data.CommandType.StoredProcedure };
            command.Parameters.Add(new MySqlParameter("VarOrderNo", OrderNo));

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public List<ClientsInvoice> GetClientsInvoice(string OrderNo, string EmployeeID, DateTime StartDate, DateTime EndDate, int Company)
        {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            try
            {
                MySqlCommand command = new MySqlCommand("GetClientsInvoices", connection) { CommandType = System.Data.CommandType.StoredProcedure };
                if (string.IsNullOrEmpty(OrderNo))
                {
                    command.Parameters.Add(new MySqlParameter("VarOrderNo", null));
                }
                else
                {
                    command.Parameters.Add(new MySqlParameter("VarOrderNo", OrderNo));
                }

                if (string.IsNullOrEmpty(EmployeeID))
                {
                    command.Parameters.Add(new MySqlParameter("VarEmployeeID", null));
                }
                else
                {
                    command.Parameters.Add(new MySqlParameter("VarEmployeeID", EmployeeID));
                }
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
                command.Parameters.Add(new MySqlParameter("VarCompany", Company));

                connection.Open();

                List<ClientsInvoice> clientsInvoiceList = new List<ClientsInvoice>();
                ClientsInvoice clientsInvoice = new ClientsInvoice();

                MySqlDataReader dataReader = command.ExecuteReader();

                while (dataReader.Read())
                {
                    clientsInvoice = new ClientsInvoice
                    {
                        OrderNo = dataReader["OrderNo"].ToString(),
                        EmployeeID = dataReader["EmployeeID"].ToString(),
                        FirstName = dataReader["FirstName"].ToString(),
                        LastName = dataReader["LastName"].ToString(),
                        CatalogName = dataReader["CatalogName"].ToString(),
                        Quantity = Convert.ToInt32(dataReader["Quantity"]),
                        OrderDate = Convert.ToDateTime(dataReader["OrderDate"]),
                        RedemptionPoints = dataReader["RedemptionPoints"].ToString(),
                        LocalCost = Convert.ToDouble(dataReader["LocalCost"]),
                        Country = dataReader["RedemptionPoints"].ToString(),
                        ReasonofReturn = dataReader["ReasonofReturn"].ToString(),
                        USDCost = Convert.ToDouble(dataReader["USDCost"])
                    };

                    DateTime? OrderDate = (dataReader["OrderDate"] == System.DBNull.Value) ? (DateTime?)null : Convert.ToDateTime(dataReader["OrderDate"]).Date;
                    clientsInvoice.OrderDate = OrderDate;

                    clientsInvoiceList.Add(clientsInvoice);
                }
                connection.Close();
                return clientsInvoiceList;
            }
            catch (Exception e)
            {
                connection.Close();
                return null;
            }
        }

        public List<ClientsInvoice> GetInvoiceTotal(string OrderNo, string EmployeeID, DateTime StartDate, DateTime EndDate, int Company)
        {

            MySqlConnection connection = new MySqlConnection(ConnectionString);
            try
            {
                MySqlCommand command = new MySqlCommand("GetInvoiceTotal", connection) { CommandType = System.Data.CommandType.StoredProcedure };

                command.Parameters.Add(new MySqlParameter("VarOrderNo", OrderNo));
                command.Parameters.Add(new MySqlParameter("VarEmployeeID", EmployeeID));

                if (StartDate != DateTime.MinValue) { command.Parameters.Add(new MySqlParameter("VarStartDate", StartDate.Date)); }
                else { command.Parameters.Add(new MySqlParameter("VarStartDate", null)); }

                if (EndDate != DateTime.MinValue) { command.Parameters.Add(new MySqlParameter("VarEndDate", EndDate.Date)); }
                else { command.Parameters.Add(new MySqlParameter("VarEndDate", null)); }

                command.Parameters.Add(new MySqlParameter("VarCompany", Company));

                List<ClientsInvoice> TotalInvoicesList = new List<ClientsInvoice>();

                connection.Open();

                MySqlDataReader dataReader = command.ExecuteReader();

                while (dataReader.Read())
                {
                    ClientsInvoice clientsInvoices = new ClientsInvoice()
                    {
                        TotalLocalCost = Convert.ToDouble(dataReader["TotalLocalCost"]),
                        TotalUSDCost = Convert.ToDouble(dataReader["TotalUSDCost"]),
                        Country = dataReader["Country"].ToString()
                    };

                    TotalInvoicesList.Add(clientsInvoices);
                }

                connection.Close();
                return TotalInvoicesList;
            }
            catch
            {
                connection.Close();
                return null;
            }
        }
    }
}
