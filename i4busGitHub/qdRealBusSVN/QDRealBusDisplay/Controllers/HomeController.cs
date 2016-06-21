using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QDRealBusDisplay.Models;
using System.Web.Script.Serialization;
namespace QDRealBusDisplay.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
       
        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";
            return View();
        }
        public ActionResult Main()
        {
            return View();
        }
       // [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult GetBuslines(string query)
        {
            qdbusDataClassesDataContext datacontext = new qdbusDataClassesDataContext();


            var buslines = (from a in datacontext.BaiduBuslineName_View
                            where a.busLineName.Substring(0,query.Length)==query
                            select new
                            {
                                name = a.busLineName
                            }).OrderByDescending(a=>a.name).ToList();
            return Json(buslines, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetBuslineDetail(string buslinename)
        {
            qdbusDataClassesDataContext datacontext = new qdbusDataClassesDataContext();
            
            //var data = from a in datacontext.busstation
            //           where a.busroad == buslinename
            //           group a by a.updown 
            //               into b
            //               select new
            //               {
            //                   updown=b.Key,
            //                   stations = from c in b
            //                              select new
            //                              {
            //                                 name=c.busstation1,
            //                                 lng=c.lng,
            //                                 lat=c.lat
            //                              }
            //               };

            

            var data = from a in datacontext.busStopCoordinates
                       where a.busLineName == buslinename
                       group a by new { a.startstop, a.endstop }
                           into b
                           select new
                           {
                               //获取爱青岛实时公交的开始和终点站
                               realBusStopStation = datacontext.BaiduAndQdRealBusLine_View.Where(d => d.BaiduBusLineName == buslinename && d.BusStopsName == b.Key.endstop).Count() == 1 ? datacontext.BaiduAndQdRealBusLine_View.Where(d => d.BaiduBusLineName == buslinename && d.BusStopsName == b.Key.endstop).First().BusStopsName : ((from c in datacontext.BaiduAndQdRealBusLine_View
                                                     where c.BaiduBusLineName == buslinename && c.BaiDuStartStation == b.Key.startstop
                                                     select c).Count() == 1 ? datacontext.BaiduAndQdRealBusLine_View.Single(d => d.BaiduBusLineName == buslinename && d.BaiDuStartStation == b.Key.startstop).BusStopsName : null),
                               realBusLineName = datacontext.BaiduAndQdRealBusLine_View.Where(e => e.BaiduBusLineName == buslinename).First().busLineName,
                               stations = from c in b
                                          select new
                                          {
                                              name = c.stop,
                                              lng = c.lng,
                                              lat = c.lat
                                          }
                           };

            //if (data.Count() == 1)
            //{
            //    foreach (var station in data)
            //    {
                    
            //    }
            //}




            return Json(data, JsonRequestBehavior.AllowGet);

        } 

        //获取特定线路公交站点速度
        public JsonResult GetStationSpeedByLine(string buslinename,string busstopname,string timecount, string week)
        {
            qdbusDataClassesDataContext datacontext = new qdbusDataClassesDataContext();
            var data = from a in datacontext.BusRealInfoWeight2
                       where a.busLineName == buslinename && a.BusStopName == busstopname && a.timeCount == timecount && a.week == week
                       orderby a.stopnumber
                       select new
                       {
                           a.stationname,
                           a.speed,
                           a.stopnumber
                       };
            return Json(data,JsonRequestBehavior.AllowGet);
        }


        //历史数据回放
        public string GetHistoryData(string start)
        {         
            DateTime starttime = Convert.ToDateTime(start);
            qdbusDataClassesDataContext datacontext = new qdbusDataClassesDataContext();
            var data = (from a in datacontext.RealBus
                        where Convert.ToDateTime(a.actdatetime)<starttime &&  Convert.ToDateTime(a.actdatetime) >starttime.AddMinutes(-1) 
                        group a by a.busselfid
                            into b
                            select new
                            {
                                id = b.Key,
                                pl = (from c in b
                                      orderby c.actdatetime descending
                                      select new
                                      {
                                          lng = c.lng,
                                          lat = c.lat,
                                          //time = string.Format("{0:yyyy-MM-dd HH:mm:ss}", c.actdatetime),
                                          //linename = c.busLineName,
                                          //stop = c.BusStopsName,
                                          //num = c.stationnum,
                                          //name = c.stationname
                                      }).Take(1)
                            });
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            string str = serializer.Serialize(data);
            return str;
        }


        public JsonResult GetQdStartEnd(string buslinename, string updown)
        {
            qdbusDataClassesDataContext datacontext=new qdbusDataClassesDataContext();
            var startendResult = (from a in datacontext.BusLineUpDown
                                 where a.busLineName == buslinename && a.updown == updown
                                 select new
                                 {
                                     a.busStart,
                                     a.busEnd
                                 }).SingleOrDefault();
            return Json(startendResult, JsonRequestBehavior.AllowGet);
        }

        public ActionResult roadCondition()
        {
            return View();
        }



        /// <summary>
        /// 101--113路站点可视化
        /// </summary>
        /// <param name="busline"></param>
        /// <param name="time"></param>
        /// <returns></returns>
        public JsonResult getAllLinesStation(string date, string hour)
        {

            using (qdbusDataClassesDataContext ndcs = new qdbusDataClassesDataContext())
            {
                  string diffhour;
        
        
                if (Convert.ToInt32(hour) < 10)
                {
                    hour = "0" + hour + ":00:00";

                }
                else
                {
                    hour = hour + ":00:00";

                }
                diffhour = date + " " + hour;
                var all = ndcs.CardBoardingStation_Count_ALL.Where(c => c.Lat != 0 && c.Lon != 0&&c.DateTime== Convert.ToDateTime(diffhour)).ToList();
                var Allstations = from bb in all
                                 
                                  select new
                                  {
                                      jingdu = bb.Lon,
                                      weidu = bb.Lat,
                                      totalFlow = bb.counts

                                  };

                return Json(Allstations);
            }
        }

        //获取所有站点坐标
        public JsonResult getAllStationCoord()
        {

            using (qdbusDataClassesDataContext ndcs = new qdbusDataClassesDataContext())
            {

                var all = ndcs.QDStationCoorinateUnique1.ToList();
                var Allstations = from bb in all

                                  select new
                                  {
                                      jingdu = bb.bdlon,
                                      weidu = bb.bdlat,
                                      ID = bb.StationID,

                                      //totalFlow = bb.

                                  };

                var count = Allstations.Count();
                return Json(Allstations,JsonRequestBehavior.AllowGet);

            }
        }
        //全市动态
        public JsonResult passengerFlowCount2(string dates,string hours)
        {
            using (qdbusDataClassesDataContext ndcs = new qdbusDataClassesDataContext())
            {
                
                if (Convert.ToInt32(hours) < 10)
                {
                    hours = "0" + hours + ":00:00";

                }
                else
                {
                    hours = hours + ":00:00";

                }

                var all = ndcs.TripOfEachCardRecord_TimeInterval.Where(c => c.Num > 29 && c.Date.ToString() == dates && c.TimeInterval == hours).ToList();

                var AllFlow = from bb in all

                              select new
                              {
                                  num = bb.Num,
                                  srcid = bb.BSID,
                                  desid = bb.ASID,
                                 
                              };
                var count = AllFlow.Count();
                return Json(AllFlow);
            }
        }

        //流状可视化
        public JsonResult passengerFlowCount(string dates,string hours)
        {
            string diff;
            using (qdbusDataClassesDataContext ndcs = new qdbusDataClassesDataContext())
            {
                //string diffhour;
                diff = dates;

                if (Convert.ToInt32(hours) < 10)
                {
                    hours = "0" + hours + ":00:00";

                }
                else
                {
                    hours = hours + ":00:00";

                }
                //diffhour = dates + " " + hours;

                var d1 = ndcs.TripOfEachCardRecord_TimeInterval.Where(c => c.Date.ToString() == diff && c.TimeInterval == hours&&c.Num>20).ToList();              
                var AllFlow = from bb in d1
                                  select new
                                  {
                                      num = bb.Num,
                                      srcid = bb.BSID,
                                      desid = bb.ASID,
                                    

                                  };
                var count = AllFlow.Count();
                return Json(AllFlow,JsonRequestBehavior.AllowGet);
            }
        }


        //单站
        public JsonResult passengerFlowSingleStation()
        {
            using (qdbusDataClassesDataContext ndcs = new qdbusDataClassesDataContext())
            {

                               
                                      

                //var all = ndcs.TripOfEachCardRecord_Static.ToList(); 
                var all = ndcs.SingleStationVisual.Where(c=>c.Date=="2015-10-13") .ToList();
                //var all = ndcs.CardBoardingStation_Count_ALL.Where(c => c.Lat != 0 && c.Lon != 0 && c.DateTime == Convert.ToDateTime(diffhour)).ToList();
                var AllFlow = from bb in all

                              select new
                              {
                                  num = bb.NUM,
                                  srcid = bb.BoardStationID,
                                  desid = bb.AlightStationID,
                                  name = bb.StationName,

                              };
                var count = AllFlow.Count();
                return Json(AllFlow);
            }
        }


//三维墙图可视化
        public JsonResult getVisualData(string busline, string time)
        {

            using (qdbusDataClassesDataContext ndc = new qdbusDataClassesDataContext())
            {
                string buslinename = busline.Split('(')[0].Trim();
                string endstop = busline.Split('(')[1].Split('-')[1].Split(')')[0];
                List<visualData> busdetail1 = ndc.visualData.Where(c => c.busLineName == buslinename ).ToList();
                List<visualData> busdetail = busdetail1.Where(c => c.BusStopName == endstop && c.week == time && c.endlat != null).ToList();

                List<visualData> busdetailSorted = busdetail.OrderBy(c => c.stopnumber).ToList();


                var result = from b in busdetailSorted
                             select new
                             {
                                 busLineName = buslinename,
                                 stationname = b.stationname,
                                 BusStopName = b.BusStopName,
                                 stopnumber = b.stopnumber,
                                 timeCount = b.timeCount,
                                 startlng = b.startlng,
                                 startlat = b.starlat,
                                 endlng = b.endlng,
                                 endlat = b.endlat,
                                 speed = b.speed,
                                 week = b.week

                             };
                return Json(result);

            }

        }

        /// <summary>
        /// 留言板
        /// </summary>
        /// <returns></returns>

        public JsonResult tijiao(string name, string email, string message)
        {

            string result;
            using (qdbusDataClassesDataContext ndc = new qdbusDataClassesDataContext())
            {

                if (name != "" && email !="" && message !="")
                {

                    Message n = new Message();
                    {
                        n.name = name;
                        n.mail = email;
                        n.message1 = message;
                        n.time = DateTime.Now;


                    };

                    ndc.Message.InsertOnSubmit(n);
                    ndc.SubmitChanges();
                    result = "成功";
                }
                else
                {


                    result = "失败";

                }



                //if (Request.Form["name"] != "")
                //{
                //    //string name = Request.Files["inputFile"].FileName;
                //    //string mingzi = Path.GetFileName(Request.Files["inputFile"].FileName);
                //    //string leixing = Request.Files["inputFile"].ContentType;

                //    //int index = name.LastIndexOf("\\") + 1;
                //    //int fileLen = Request.Files["inputFile"].ContentLength;
                //    //Byte[] fileData = new Byte[fileLen];
                //    //Stream sr = Request.Files["inputFile"].InputStream;
                //    //sr.Read(fileData, 0, fileLen);
                //    //sr.Close();

                //    Message n = new Message();
                //    {
                //        n.name = Request.Form["name"];
                //        n.mail = Request.Form["email"];
                //        n.message1 = Request.Form["message"];                      
                //        n.time = DateTime.Now;


                //    };

                //    ndc.Message.InsertOnSubmit(n);
                //    ndc.SubmitChanges();

                //}

            }

            return Json(result);

        }


////heatmap

        public JsonResult getHeatData()
        {        
          
            qdbusDataClassesDataContext ndc = new qdbusDataClassesDataContext();             

                string week = DateTime.Now.DayOfWeek.ToString();
                string hour = DateTime.Now.Hour < 10 ? ('0' + DateTime.Now.Hour.ToString()) : DateTime.Now.Hour.ToString();
                string minu = DateTime.Now.Minute / 10 == 0 ? "00" : ((DateTime.Now.Minute / 10).ToString() + '0');
                string time = hour + ':' + minu;
                var visualdata1 = ndc.visualData.Where(c=>c.week==week && c.timeCount==time ).ToList();
                var visualdata = visualdata1.Where(c => c.starlat != null && c.endlat != null && c.starlat != 0 && c.endlat != 0 && c.speed>0).OrderBy(c => c.speed).ToList();

                var result = from v in visualdata
                           select new
                           {
                              startlng = v.startlng,
                              startlat=v.starlat,
                              endlng=v.endlng,
                              endlat=v.endlat,
                              speed = v.speed

                           };

                return Json(result);

        }

        //125线路路况
        public JsonResult getCongestIndexData(string shijian, string busline)
        {
            qdbusDataClassesDataContext ndc = new qdbusDataClassesDataContext();
            var indexdata1 = ndc.NumOfSegment_AllLines.Where(c => c.Date == shijian && c.LineName==busline).ToList();
            var indexdata = indexdata1.Where(c => c.StartLat != null && c.EndLat != null).ToList();
            //var visualdataOrder = visualdata.OrderBy(c=>c.busLineName).ThenBy(c=>c.BusStopName).ThenBy(c=>c.stopnumber).ToList();

            var result = from a in indexdata
                         select new
                         {
                             startlat = a.StartLat,
                             startlng = a.StartLon,
                             endlat = a.EndLat,
                             endlng = a.EndLon,
                             count = a.PassengerNum
                         };
            return Json(result);
        }
        /// <summary>
        /// 各个线路一周站点热图
        /// </summary>
        /// <param name="busLine"></param>
        /// <param name="date"></param>
        /// <returns></returns>
        public JsonResult busLineStationHot(string busLine, string date) {
            qdbusDataClassesDataContext ndc = new qdbusDataClassesDataContext();
            var result = from dd in ndc.NumOfSegment_125.Where(c => c.Date == date && c.LineID == busLine).ToList()
                         where dd.StartLat != "0" && dd.StartLon != "0" && dd.EndLat != "0" && dd.EndLon != "0"
                         select new
                         {
                             startlat = dd.StartLat,
                             startlng = dd.StartLon,
                             endlat = dd.EndLat,
                             endlng = dd.EndLon,
                             count = dd.PassengerNum

                         };

            return Json(result);
        }
       

        //public JsonResult getCongestIndexData()
        //{
        //    qdbusDataClassesDataContext ndc = new qdbusDataClassesDataContext();
        //   // string week = DateTime.Now.DayOfWeek.ToString();           
        //    var indexdata1 = ndc.NumOfSegment_125.Where(c => c.Date=="2015-10-13").ToList();
        //    var indexdata = indexdata1.Where(c => c.StartLat != null && c.EndLat != null).ToList();
        //    //var visualdataOrder = visualdata.OrderBy(c=>c.busLineName).ThenBy(c=>c.BusStopName).ThenBy(c=>c.stopnumber).ToList();
        //    var result = from a in indexdata
        //                 select new
        //                 {
        //                     startlat = a.StartLat,
        //                     startlng = a.StartLon,
        //                     endlat = a.EndLat,
        //                     endlng = a.EndLon,
        //                     count = a.PassengerNum
        //                 };       
        //    return Json(result);
        //}

       
       /// <summary>
       /// 125一天不同时段站点人数可视化
       /// </summary>
       /// <param name="diffHour"></param>
       /// <returns></returns>
        /// 

        public JsonResult get125HourData(string date, string hour, string busLineName)
        {
            qdbusDataClassesDataContext ndcc = new qdbusDataClassesDataContext();
            string diffhour;
        
        
                if (Convert.ToInt32(hour) < 10)
                {
                    hour = "0" + hour + ":00:00";

                }
                else
                {
                    hour = hour + ":00:00";

                }
                diffhour = date + " " + hour;
             var d1 = ndcc.CardBoardingStation_Count_ALL.Where(c => c.DateTime == Convert.ToDateTime(diffhour)&&c.RouteName==busLineName.Trim()).ToList();
           
            var results = from rr in d1
                          where (rr.Lat != 0 && rr.Lon != 0)
                          select new
                          {
                              jingdu = rr.Lon,
                              weidu = rr.Lat,
                              renshu = rr.counts

                          };
            
            //}
            return Json(results);
        }
    }
}
