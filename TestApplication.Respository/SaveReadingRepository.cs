using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestApplication.DTOS;
using TestApplication.DataLayer;

namespace TestApplication.Respository
{
    public class SaveReadingRepository
    {
        EnsekDBEntities2 OdContext = new EnsekDBEntities2();
        public bool SaveMeterReadingRepository(List<MeterDetails> meterDetails)
        {
            try
            {
                //Linq to save data
                List<MeterReading> meterData = new List<MeterReading>();

                meterData = meterDetails.Select(t => new MeterReading { AccountId = t.AccountId, MeterReadDate = t.MeterReadDate, MeterReadValue = Convert.ToInt32(t.MeterReadValue) }).ToList();

                OdContext.MeterReadings.AddRange(meterData);
                OdContext.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                //Log Error If Needed
                return false;
            }
        }

        public bool CheckValidAccount(int accountId)
        {
            try
            {
                return OdContext.Customers.Where(x => x.AccountId == accountId).Count() > 0;
            }
            catch (Exception ex)
            {
                //Log Error If Needed
                return false;
            }
        }

        public bool CheckValidReadingDate(MeterDetails meterDetail)
        {
            try
            {
                return OdContext.MeterReadings.Where(x => x.AccountId == meterDetail.AccountId && x.MeterReadDate == meterDetail.MeterReadDate).Count() > 0;
            }
            catch (Exception ex)
            {
                //Log Error If Needed
                return false;
            }
        }
    }
}
