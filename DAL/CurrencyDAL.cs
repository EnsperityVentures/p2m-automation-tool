using System;
using System.Collections.Generic;
using Entities;
using MySql.Data.MySqlClient;

namespace DAL
{
    public class CurrencyDAL
    {
        public string ConnectionString { set; get; }

        public void InsertCurrency(Currency currency)
        {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            MySqlCommand command = new MySqlCommand("UpsertCurrency", connection) { CommandType = System.Data.CommandType.StoredProcedure };
            command.Parameters.Add(new MySqlParameter("VarName", currency.Name));
            command.Parameters.Add(new MySqlParameter("VarCountry", currency.Country));
            command.Parameters.Add(new MySqlParameter("VarPointValue_Rate", currency.PointValue_Rate));
            command.Parameters.Add(new MySqlParameter("VarUSDRate", currency.USDRate));
            command.Parameters.Add(new MySqlParameter("VarISO", currency.ISO));

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public void UpdateCurrency(Currency currency) {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            MySqlCommand command = new MySqlCommand("UpdateCurrency", connection) { CommandType = System.Data.CommandType.StoredProcedure };
            command.Parameters.Add(new MySqlParameter("VarID", currency.ID));
            command.Parameters.Add(new MySqlParameter("VarName", currency.Name));
            command.Parameters.Add(new MySqlParameter("VarCountry", currency.Country));
            command.Parameters.Add(new MySqlParameter("VarPointValue_Rate", currency.PointValue_Rate));
            command.Parameters.Add(new MySqlParameter("VarUSDRate", currency.USDRate));
            command.Parameters.Add(new MySqlParameter("VarISO", currency.ISO));

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
        public void DeleteCurrency(string ID)
        {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            MySqlCommand command = new MySqlCommand("DeleteCurrency", connection) { CommandType = System.Data.CommandType.StoredProcedure };
            command.Parameters.Add(new MySqlParameter("VarID", Convert.ToInt16(ID)));

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        public List<Currency> GetCurrency()
        {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            try
            {
                MySqlCommand command = new MySqlCommand("GetCurrency", connection) { CommandType = System.Data.CommandType.StoredProcedure };
                
                connection.Open();

                List<Currency> currencyList = new List<Currency>();
                Currency currency = new Currency();

                MySqlDataReader dataReader = command.ExecuteReader();

                while (dataReader.Read())
                {
                    currency = new Currency
                    {
                        ID = Convert.ToInt32(dataReader["ID"]),
                        Name = dataReader["Name"].ToString(),
                        Country = dataReader["Country"].ToString(),
                        PointValue_Rate = Convert.ToDouble(dataReader["PointValue_Rate"]),
                        USDRate = Convert.ToDouble(dataReader["USDRate"]),
                        ISO = dataReader["ISO"].ToString()
                    };

                    currencyList.Add(currency);
                }
                connection.Close();
                return currencyList;
            }
            catch (Exception e)
            {
                connection.Close();
                return null;
            }
        }
    }
}
