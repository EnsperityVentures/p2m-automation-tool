using System;
using System.Collections.Generic;
using Entities;
using MySql.Data.MySqlClient;

namespace DAL
{
    public class CompanyDAL
    {
        public string ConnectionString { set; get; }

        public void InsertCompany(Company company) {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            MySqlCommand command = new MySqlCommand("UpsertCompany", connection) { CommandType = System.Data.CommandType.StoredProcedure };
            command.Parameters.Add(new MySqlParameter("VarName", company.Name));
            command.Parameters.Add(new MySqlParameter("VarCountry", company.Country));
            command.Parameters.Add(new MySqlParameter("VarNameAr", company.NameAr));
            command.Parameters.Add(new MySqlParameter("VarSite", company.Site));

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
        public void DeleteCompany(string CompanyName) {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            MySqlCommand command = new MySqlCommand("DeleteCompany", connection) { CommandType = System.Data.CommandType.StoredProcedure };
            command.Parameters.Add(new MySqlParameter("VarName", CompanyName));

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
        public List<Company> GetCompany(string CompanyName) {
            MySqlConnection connection = new MySqlConnection(ConnectionString);

            try {
                MySqlCommand command = new MySqlCommand("GetCompany",connection) { CommandType = System.Data.CommandType.StoredProcedure };
                command.Parameters.Add(new MySqlParameter("VarName", CompanyName));

                connection.Open();

                List<Company> companyList = new List<Company>();
                Company company = new Company();

                MySqlDataReader dataReader = command.ExecuteReader();

                while (dataReader.Read()) {
                    company = new Company
                    {
                        ID = Convert.ToInt32(dataReader["ID"]),
                        Name = dataReader["Name"].ToString(),
                        Country = dataReader["Country"].ToString(),
                        NameAr = dataReader["NameAr"].ToString(),
                        Site = dataReader["Site"].ToString()
                    };

                    companyList.Add(company);
                }
                connection.Close();
                return companyList;
            }
            catch (Exception e) {
                connection.Close();
                return null;
            }
        }
    }
}
