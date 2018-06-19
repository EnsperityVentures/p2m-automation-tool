using System;

namespace Entities
{
    public class ClientsInvoice
    {
        public string OrderNo { get; set; }
        public string EmployeeID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string CatalogName { get; set; }
        public int Quantity { get; set; }
        public DateTime? OrderDate { get; set; }
        public string RedemptionPoints { get; set; }
        public double LocalCost { get; set; }
        public double TotalLocalCost { get; set; }
        public double USDCost { get; set; }
        public double TotalUSDCost { get; set; }
        public string ReasonofReturn { get; set; }
        public string Country { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
    }
}
