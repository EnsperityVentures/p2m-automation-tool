using System;


namespace Entities
{
    public class Currency
    {
        public int? ID { set; get; }
        public string Name { set; get; }
        public string Country { set; get; }
        public double PointValue_Rate { set; get; }
        public double USDRate { set; get; }
        public string ISO { set; get; }
    }
}
