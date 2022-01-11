using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestApplication.DTOS;
using TestApplication.Respository;

namespace TestApplication.BusinessLogic
{
    public class SaveReadings
    {
        public string SaveMeterReading(List<MeterDetails> meterDetails) {
            StringBuilder successResponse = new StringBuilder();
            StringBuilder errorResponseAccount = new StringBuilder();
            StringBuilder errorResponseReading = new StringBuilder();
            StringBuilder errorResponseReadingDate = new StringBuilder();

            List<MeterDetails> insertData = new List<MeterDetails>();

            foreach (var item in meterDetails) {
                //Validate Account
                if (ValidateAccount(item.AccountId))
                {
                    //Validate Date
                    if (!ValidateReadingDate(item)){

                        //Validate Reading Data
                        if (ValidateReadingValue(item))
                        {
                            insertData.Add(item);
                            successResponse.Append("Record Processed for user: " + item.AccountId + "<br />");
                        }
                        else
                        {
                            errorResponseReading.Append("Incorect data for user: " + item.AccountId + "<br />");
                        }
                    }
                    else {
                        errorResponseReadingDate.Append("Reading data already present for user : " + item.AccountId + "<br />");
                    }
                }
                else {
                    errorResponseAccount.Append("Customer Account does not exist : " + item.AccountId + "<br />");
                }
            }

            string response = successResponse.ToString() + "<br/>" + errorResponseAccount.ToString() + "<br/>" + errorResponseReading.ToString() + "<br/>" + errorResponseReadingDate.ToString();

            if (insertData.Count > 0)
            {
                SaveReadingRepository saveReadingRepository = new SaveReadingRepository();
                bool saveMeterReadingData = saveReadingRepository.SaveMeterReadingRepository(insertData);

                if (saveMeterReadingData)
                {
                    return response;
                }
                else
                {
                    return "There is some error with saving of data, please try again or contact support";
                }
            }
            else {
                return response;
            }
        }

        //Functions to validate
        public bool ValidateReadingValue(MeterDetails meterDetail) {
            //Check if valid int
            var isNumeric = int.TryParse(meterDetail.MeterReadValue, out _);

            if (isNumeric)
            {
                //Check if valid value
                if (Convert.ToInt32(meterDetail.MeterReadValue) < 0)
                {
                    return false;
                }
            }
            else {
                return false;
            }
            return true;
        }

        public bool ValidateAccount(int accountId) {
            //Check If Customer Exist
            SaveReadingRepository saveReadingRepository = new SaveReadingRepository();
            return saveReadingRepository.CheckValidAccount(accountId);
        }

        public bool ValidateReadingDate(MeterDetails meterDetail)
        {
            //Check If Customer Exist
            SaveReadingRepository saveReadingRepository = new SaveReadingRepository();
            return saveReadingRepository.CheckValidReadingDate(meterDetail);
        }
    }
}
