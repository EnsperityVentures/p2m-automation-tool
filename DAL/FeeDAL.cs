using System;
using System.Collections.Generic;
using Entities;
using MySql.Data.MySqlClient;

namespace DAL
{
    public class FeeDAL
    {
        public string ConnectionString { get; set; }

        public void InsertFees(Fee fees) {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            MySqlCommand command = new MySqlCommand("UpsertFees", connection) { CommandType = System.Data.CommandType.StoredProcedure };
            command.Parameters.Add(new MySqlParameter("VarID",fees.ID));
            command.Parameters.Add(new MySqlParameter("VarRewardName", fees.RewardName));
            command.Parameters.Add(new MySqlParameter("VarShippingCost", fees.ShippingCost));
            command.Parameters.Add(new MySqlParameter("VarHandlingCost", fees.HandlingCost));
            command.Parameters.Add(new MySqlParameter("VarServiceCharge", fees.ServiceCharge));
            command.Parameters.Add(new MySqlParameter("VarSKU", fees.SKU));

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
        public void DeleteFees(string ID) {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            MySqlCommand command = new MySqlCommand("DeleteFees", connection) { CommandType = System.Data.CommandType.StoredProcedure };
            command.Parameters.Add(new MySqlParameter("VarID", Convert.ToInt16(ID)));

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
        public List<Fee> GetFees(string RewardName) {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            try
            {
                MySqlCommand command = new MySqlCommand("GetFees", connection) { CommandType = System.Data.CommandType.StoredProcedure };
                command.Parameters.Add(new MySqlParameter("VarRName", RewardName));
                connection.Open();

                List<Fee> feesList = new List<Fee>();
                Fee fees = new Fee();

                MySqlDataReader dataReader = command.ExecuteReader();

                while (dataReader.Read())
                {
                    fees = new Fee
                    {
                        ID = Convert.ToInt32(dataReader["ID"]),
                        RewardName = dataReader["RewardName"].ToString(),
                        ShippingCost = Convert.ToDouble(dataReader["ShippingCost"]),
                        HandlingCost = Convert.ToDouble(dataReader["HandlingCost"]),
                        ServiceCharge = Convert.ToDouble(dataReader["ServiceCharge"]),
                        Total = Convert.ToDouble(dataReader["Total"]),
                        SKU = dataReader["SKU"].ToString()
                    };

                    feesList.Add(fees);
                }
                connection.Close();
                return feesList;
            }
            catch (Exception e)
            {
                connection.Close();
                return null;
            }
        }
    }
}
