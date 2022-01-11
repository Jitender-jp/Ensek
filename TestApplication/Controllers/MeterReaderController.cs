using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using TestApplication.DTOS;
using TestApplication.BusinessLogic;

namespace TestApplication.Controllers
{
    public class MeterReaderController : ApiController
    {

        [Route("api/MeterReader/meter-reading-uploads")]
        [HttpPost]
        public HttpResponseMessage UploadFiles()
        {
            try
            {
                if (HttpContext.Current.Request.Files.Count > 0)
                {
                    List<MeterDetails> meterDetails = new List<MeterDetails>();
                    //Create the Directory.
                    string path = HttpContext.Current.Server.MapPath("~/Uploads/");
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    //Fetch the File.
                    HttpPostedFile postedFile = HttpContext.Current.Request.Files[0];

                    //Fetch the File Extension.
                    string fileName = DateTime.Now.ToString("yyyyddMHHmmss") + Path.GetExtension(postedFile.FileName);

                    string filePath = path + fileName;

                    //Save the File.
                    postedFile.SaveAs(filePath);

                    //Read the contents of CSV file.
                    string csvData = System.IO.File.ReadAllText(filePath);

                    //Execute a loop over the rows.
                    try
                    {
                        int rowNum = 0;
                        foreach (string row in csvData.Split('\n'))
                        {
                            rowNum++;
                            if (rowNum > 1) //Exclude First Header Row
                            {
                                if (!string.IsNullOrEmpty(row))
                                {
                                    meterDetails.Add(new MeterDetails
                                    {
                                        AccountId = Convert.ToInt32(row.Split(',')[0]),
                                        MeterReadDate = Convert.ToDateTime(row.Split(',')[1]),
                                        MeterReadValue = Convert.ToString(row.Split(',')[2])
                                    });
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        //Clean up uploaded file
                        File.Delete(filePath);
                        return Request.CreateResponse(HttpStatusCode.OK, "Please upload a valid file with correct data.");
                    }

                    //Clean up uploaded file
                    File.Delete(filePath);

                    //Call to save method
                    SaveReadings saveMeterReading = new SaveReadings();
                    string result = saveMeterReading.SaveMeterReading(meterDetails);

                    //Send OK Response to Client.
                    return Request.CreateResponse(HttpStatusCode.OK, result);
                }
                else
                {
                    //Error Response Message
                    return Request.CreateResponse(HttpStatusCode.OK, "Please upload a file to process");
                }
            }
            catch (Exception ex) {
                //Error Response Message
                return Request.CreateResponse(HttpStatusCode.OK, "Error: " + ex.ToString());
            }
        }
    }
}
