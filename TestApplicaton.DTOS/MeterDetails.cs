using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestApplication.DTOS
{
   public class MeterDetails
    {
        public int AccountId { get; set; }
        public DateTime MeterReadDate { get; set; }
        public string MeterReadValue { get; set; }
    }
}
