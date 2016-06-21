using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase;
using SuperWebSocket;
using System.Threading;
using SuperSocket.SocketEngine;
using System.Web.Script.Serialization;


namespace qdRealBusConsole
{
    class Program
    {
        private static List<WebSocketSession> m_Sessions = new List<WebSocketSession>();       //用于存放连接会话
        private static List<WebSocketSession> m_SecureSessions = new List<WebSocketSession>(); //用于存放安全连接会话
        private static object m_SessionSyncRoot = new object();
        private static object m_SecureSessionSyncRoot = new object();
        private static Timer m_SocketPushTimer;
        private static WebSocketServer socketServer;
        private static string linename = "-1";
        
        static void Main(string[] args)
        {
            StartSuperWebSocketByProgramming();
        }

        static void appServer_NewMessageReceived(WebSocketSession session, string message)
        {
            //Send the received message back
            session.Send("服务器: " + message);

        }

        #region superWebsocket实现

        static void StartSuperWebSocketByProgramming()
        {
            socketServer = new WebSocketServer();
            //设置websocket服务器
            if (!socketServer.Setup(20122)) //设置监听端口号
            {
                using (System.IO.StreamWriter sw = new System.IO.StreamWriter("C:\\log.txt", true))
                {
                    sw.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss ") + "设置WebSocketServer监听服务器失败");
                }
                return;
            }

            socketServer.NewMessageReceived += new SessionHandler<WebSocketSession, string>(socketServer_NewMessageReceived);
            socketServer.NewSessionConnected += new SessionHandler<WebSocketSession>(socketServer_NewSessionConnected);
            socketServer.SessionClosed += new SessionHandler<WebSocketSession, CloseReason>(socketServer_SessionClosed);

            //启动websocket服务器
            if (!socketServer.Start())
            {
                using (System.IO.StreamWriter sw = new System.IO.StreamWriter("C:\\log.txt", true))
                {
                    sw.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss ") + "启动服务器失败");
                }
                return;
            }
            using (System.IO.StreamWriter sw = new System.IO.StreamWriter("C:\\log.txt", true))
            {
                sw.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss ") + "启动服务器已成功启动");
            }
            var ts = new TimeSpan(0, 0, 8);
            m_SocketPushTimer = new Timer(SendRealBusDataCallback, new object(), ts, ts);

            while (Console.ReadKey().KeyChar != 'q')
            {
                Console.WriteLine();
                continue;
            }

            //Stop the appServer
            socketServer.Stop();

            Console.WriteLine();
            Console.WriteLine("The server was stopped!");
            Console.ReadKey();

        }

        static void SendRealBusDataCallback(object state)
        {
            //对当前已连接的所有会话进行广播
            if (socketServer.GetAllSessions().Count() > 0)
            {
                try
                {
                    qdRealBusDataClassesDataContext datacontext = new qdRealBusDataClassesDataContext();
                    var data = (from a in datacontext.qdRealBus
                                where a.actdatetime > DateTime.Now.AddMinutes(-5)
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
                                                  time = string.Format("{0:yyyy-MM-dd HH:mm:ss}", c.actdatetime),
                                                  linename = c.busLineName,
                                                  stop=c.BusStopsName,
                                                  num=c.stationnum,
                                                  name=c.stationname
                                              }).Take(1)
                                    });
                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    string str = serializer.Serialize(data);
                    SendToAll(str);
                }
                catch (Exception ex)
                {
                    Console.WriteLine("异常错误："+ex.Message);
                }

            }
        }

        //接受新消息
        static void socketServer_NewMessageReceived(WebSocketSession session, string e)
        {
            //SendToAll(session.SessionID + ":"+e);
            linename = e;
            Console.WriteLine(session.SessionID+"接受消息为："+e);

        }

        //打开新连接
        static void socketServer_NewSessionConnected(WebSocketSession session)
        {
            lock (m_SessionSyncRoot)
                m_Sessions.Add(session);
            Console.WriteLine(session.SessionID + "已连接!!!");
            
            SendToAll("System: " + session.SessionID + " connected");

        }
        //关闭连接
        static void socketServer_SessionClosed(WebSocketSession session, CloseReason reason)
        {
            lock (m_SessionSyncRoot)
                m_Sessions.Remove(session);

            if (reason == CloseReason.ServerShutdown)
                return;
            Console.WriteLine(session.SessionID + "已关闭连接!!!");
            SendToAll("System: " + session.Cookies["name"] + " disconnected");

        }

        //发送数据
        static void SendToAll(string message)
        {
            lock (m_SessionSyncRoot)
            {
                foreach (var s in m_Sessions)
                {
                    //Console.WriteLine("服务器:" + DateTime.Now);
                    s.Send(message);
                }
            }
        }

        //应用程序结束
        static void Application_End(object sender, EventArgs e)
        {
            m_SocketPushTimer.Change(Timeout.Infinite, Timeout.Infinite);
            m_SocketPushTimer.Dispose();
            socketServer.Stop();
        }
        //应用程序错误
        static void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        static void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started

        }

        static void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }
        #endregion



    }
}
