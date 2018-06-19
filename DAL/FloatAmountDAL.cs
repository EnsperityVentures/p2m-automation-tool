using System;
using System.Collections.Generic;
using Entities;
using MySql.Data.MySqlClient;

namespace DAL
{
    public class FloatAmountDAL
    {
        public string ConnectionString { get; set; }

        public void InsertFloat(Float TheFloat)
        {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            MySqlCommand command = new MySqlCommand("UpsertFloat", connection) { CommandType = System.Data.CommandType.StoredProcedure };

            command.Parameters.Add(new MySqlParameter("VarOrderNo", TheFloat.OrderNo));
            command.Parameters.Add(new MySqlParameter("VarOrderDate", TheFloat.OrderDate));
            command.Parameters.Add(new MySqlParameter("VarMemberName", TheFloat.MemberName));
            command.Parameters.Add(new MySqlParameter("VarTotalcost", TheFloat.Totalcost));
            command.Parameters.Add(new MySqlParameter("VarDeliveryfees", TheFloat.Deliveryfees));
            command.Parameters.Add(new MySqlParameter("VarTotalCostwithDelivery", TheFloat.TotalCostwithDelivery));
            command.Parameters.Add(new MySqlParameter("VarStatus", TheFloat.Status));
            command.Parameters.Add(new MySqlParameter("VarDeliveryDate", TheFloat.DeliveryDate));
            command.Parameters.Add(new MySqlParameter("VarCardTypeandAmount", TheFloat.CardTypeandAmount));
            command.Parameters.Add(new MySqlParameter("VarQuantity", TheFloat.Quantity));

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
        public void InsertAmount(Amount TheAmount)
        {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            MySqlCommand command = new MySqlCommand("UpsertAmount", connection) { CommandType = System.Data.CommandType.StoredProcedure };

            command.Parameters.Add(new MySqlParameter("VarID", TheAmount.ID));
            command.Parameters.Add(new MySqlParameter("VarPaymentstoOman", TheAmount.PaymentstoOman));
            command.Parameters.Add(new MySqlParameter("VarDateofpayment", TheAmount.Dateofpayment));

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public void DeleteFloat(string OrderNo)
        {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            MySqlCommand command = new MySqlCommand("DeleteFloat", connection) { CommandType = System.Data.CommandType.StoredProcedure };
            command.Parameters.Add(new MySqlParameter("VarOrderNO", OrderNo));

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
        public void DeleteAmount(string DepositID)
        {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            MySqlCommand command = new MySqlCommand("DeleteAmount", connection) { CommandType = System.Data.CommandType.StoredProcedure };
            command.Parameters.Add(new MySqlParameter("VarID", DepositID));

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public string GetTotalAmount()
        {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            try
            {
                MySqlCommand command = new MySqlCommand("GetTotalAmount", connection) { CommandType = System.Data.CommandType.StoredProcedure };

                connection.Open();

                string Total = null;

                MySqlDataReader dataReader = command.ExecuteReader();

                while (dataReader.Read())
                {
                    Total = dataReader["TotalRemainingAmount"].ToString();
                }

                connection.Close();
                return Total;
            }
            catch (Exception e)
            {
                connection.Close();
                return null;
            }
        }

        public List<Float> GetFloat(string OrderNo)
        {
            MySqlConnection connection = new MySqlConnection(ConnectionString);
            try
            {
                MySqlCommand command = new MySqlCommand("GetFloat", connection) { CommandType = System.Data.CommandType.StoredProcedure };
                command.Parameters.Add(new MySqlParameter("VarOrderNo", OrderNo));

                List<Float> FloatList = new List<Float>();

                connection.Open();

                MySqlDataReader dataReader = command.ExecuteReader();

                while (dataReader.Read())
                {
                    Float TheFloat = new Float()
                    {
                        OrderNo = dataReader["OrderNo"].ToString(),
                        MemberName = dataReader["MemberName"].ToString(),
                        Totalcost = Convert.ToDouble(dataReader["Totalcost"]),
                        Deliveryfees = Convert.ToDouble(dataReader["Deliveryfees"]),
                        TotalCostwithDelivery = Convert.ToDouble(dataReader["TotalCostwithDelivery"]),
                        Status = dataReader["Status"].ToString(),
                        CardTypeandAmount = dataReader["CardTypeandAmount"].ToString(),
                        Quantity = Convert.ToInt32(dataReader["Quantity"])
                    };
                    
                    DateTime? orderDate = (dataReader["OrderDate"] == System.DBNull.Value) ? (DateTime?)null : Convert.ToDateTime(dataReader["OrderDate"]);
                    DateTime? deliveryDate = (dataReader["DeliveryDate"] == System.DBNull.Value) ? (DateTime?)null : Convert.ToDateTime(dataReader["DeliveryDate"]);
                    TheFloat.OrderDate = orderDate;
                    TheFloat.DeliveryDate = deliveryDate;

                    FloatList.Add(TheFloat);
                }

                connection.Close();
                return FloatList;
            }
            catch (Exception e)
            {
                connection.Close();
                return null;
            }

        }
        public List<Amount> GetAmount() {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            try
            {
                MySqlCommand command = new MySqlCommand("GetAmount", connection) { CommandType = System.Data.CommandType.StoredProcedure };

                List<Amount> AmountList = new List<Amount>();

                connection.Open();

                MySqlDataReader dataReader = command.ExecuteReader();

                while (dataReader.Read())
                {
                    Amount TheAmount = new Amount()
                    {
                        ID = Convert.ToInt32(dataReader["ID"]),
                        PaymentstoOman = Convert.ToDouble(dataReader["PaymentstoOman"]),
                        TotalRemainingAmount = Convert.ToDouble(dataReader["TotalRemainingAmount"])
                    };

                    DateTime? paymentDate = (dataReader["Dateofpayment"] == System.DBNull.Value) ? (DateTime?)null : Convert.ToDateTime(dataReader["Dateofpayment"]);
                    TheAmount.Dateofpayment = paymentDate;

                    AmountList.Add(TheAmount);

                }

                connection.Close();
                return AmountList;
            }
            catch (Exception e)
            {
                connection.Close();
                return null;
            }
        }
        
    }
}
