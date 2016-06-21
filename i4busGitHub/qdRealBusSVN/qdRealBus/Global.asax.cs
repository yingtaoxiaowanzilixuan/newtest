using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using SuperWebSocket;
using System.Threading;
using System.Configuration;
using SuperSocket.SocketEngine.Configuration;
using SuperSocket.SocketEngine;
using SuperSocket.SocketBase;
using SuperSocket.SocketBase.Config;
using SuperSocket.Common;

namespace qdRealBus
{
    // 注意: 有关启用 IIS6 或 IIS7 经典模式的说明，
    // 请访问 http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
                "Default", // 路由名称
                "{controller}/{action}/{id}", // 带有参数的 URL
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // 参数默认值
            );

        }

        //websocket
        private List<WebSocketSession> m_Sessions = new List<WebSocketSession>();       //用于存放连接会话
        private List<WebSocketSession> m_SecureSessions = new List<WebSocketSession>(); //用于存放安全连接会话
        private object m_SessionSyncRoot = new object();
        private object m_SecureSessionSyncRoot = new object();
        private Timer m_SocketPushTimer;


        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RegisterRoutes(RouteTable.Routes);
            LogUtil.Setup();
            StartSuperWebSocketByConfig();
            //服务器定时向客户端发送数据
            var ts = new TimeSpan(0, 0, 1);
            m_SocketPushTimer = new Timer(SendRealBusDataCallback, new object(), ts, ts);
        }

        void SendRealBusDataCallback(object state)
        {
           //对当前已连接的所有会话进行广播
           SendToAll("服务器:" + DateTime.Now);  
        }

        //通过配置web.config文件启动WebSocket服务器
        void StartSuperWebSocketByConfig()
        {
            var serverConfig = ConfigurationManager.GetSection("socketServer") as SocketServiceConfig;
            if (!SocketServerManager.Initialize(serverConfig))
                return;

            var socketServer = SocketServerManager.GetServerByName("SuperWebSocket") as WebSocketServer;
            var secureSocketServer = SocketServerManager.GetServerByName("SecureSuperWebSocket") as WebSocketServer;

           // Application["WebSocketPort"] = socketServer.Config.Port;
           // Application["SecureWebSocketPort"] = secureSocketServer.Config.Port;
            

            socketServer.NewMessageReceived += new SessionEventHandler<WebSocketSession, string>(socketServer_NewMessageReceived);
            socketServer.NewSessionConnected += new SessionEventHandler<WebSocketSession>(socketServer_NewSessionConnected);
            socketServer.SessionClosed += new SessionEventHandler<WebSocketSession, CloseReason>(socketServer_SessionClosed);

            secureSocketServer.NewSessionConnected += new SessionEventHandler<WebSocketSession>(secureSocketServer_NewSessionConnected);
            secureSocketServer.SessionClosed += new SessionEventHandler<WebSocketSession, CloseReason>(secureSocketServer_SessionClosed);

            if (!SocketServerManager.Start())
                SocketServerManager.Stop();
        }
        //接受新消息
        void socketServer_NewMessageReceived(WebSocketSession session, string e)
        {
            SendToAll(session.Cookies["name"] + ":message have received!!! ");
        }

        //打开新连接
        void socketServer_NewSessionConnected(WebSocketSession session)
        {
            lock (m_SessionSyncRoot)
                m_Sessions.Add(session);
            SendToAll("System: " + session.Cookies["name"] + " connected");
        }
        //关闭连接
        void socketServer_SessionClosed(WebSocketSession session, CloseReason reason)
        {
            lock (m_SessionSyncRoot)
                m_Sessions.Remove(session);

            if (reason == CloseReason.ServerShutdown)
                return;

            SendToAll("System: " + session.Cookies["name"] + " disconnected");
        }

        //关闭安全连接
        void secureSocketServer_SessionClosed(WebSocketSession session, CloseReason reason)
        {
            lock (m_SecureSessionSyncRoot)
            {
                m_SecureSessions.Remove(session);
            }
        }
        //打开安全连接
        void secureSocketServer_NewSessionConnected(WebSocketSession session)
        {
            lock (m_SecureSessionSyncRoot)
            {
                m_SecureSessions.Add(session);
            }
        }

        //发送数据
        void SendToAll(string message)
        {
            lock (m_SessionSyncRoot)
            {
                foreach (var s in m_Sessions)
                {
                    //s.SendResponse(message);
                    s.SendResponseAsync(message+"  ://"+DateTime.Now);
                }
            }
        }



        //应用程序结束
        void Application_End(object sender, EventArgs e)
        {
            m_SocketPushTimer.Change(Timeout.Infinite, Timeout.Infinite);
            m_SocketPushTimer.Dispose();
            SocketServerManager.Stop();
        }
        //应用程序错误
        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started

        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }


    }
}