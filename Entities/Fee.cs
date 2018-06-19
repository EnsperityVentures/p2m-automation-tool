using System;

namespace Entities
{
    public class Fee
    {
        public int? ID { set; get; }
        public string RewardName { set; get; }
        public double ShippingCost { set; get; }
        public double HandlingCost { set; get; }
        public double ServiceCharge { set; get; }
        public double Total { set; get; }
        public string SKU { set; get; }
    }
}
