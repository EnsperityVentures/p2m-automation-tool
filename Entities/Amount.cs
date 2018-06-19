using System;

namespace Entities
{
    public class Amount
    {
        public int ID { get; set; }
        public double? PaymentstoOman { get; set; }
        public double? TotalRemainingAmount { get; set; }
        public DateTime? Dateofpayment { get; set; }
    }
}
