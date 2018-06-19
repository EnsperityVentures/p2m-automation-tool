using System;
using System.Collections.Generic;
using System.Text;

namespace Entities
{
    public class GiftCardInvoice
    {
        public string OrderID { get; set; }
        public string EmployeeID { get; set; }
        public string LineNumber { get; set; }
        public string RewardName { get; set; }
        public string SKU { get; set; }
        public DateTime? OrderDate { get; set; }
        public string LocalCost { get; set; }
        public double? TotalLocalCost { get; set; }
        public double? USDCost { get; set; }
        public double? TotalUSDCost { get; set; }
        public int? Quantity { get; set; }
        public string ReasonofReturn { get; set; }
        // public Currency Currency_ID { get; set; }
        // public Fees Fees_ID { get; set; }
        public string Country { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
    }
}
