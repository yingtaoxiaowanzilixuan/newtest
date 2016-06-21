<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<!doctype html>
<html>
<head>
   <title>青岛实时公交</title>
   <style>
     html{height:100%}  
     body{height:100%;margin:0px;padding:0px}  
     #container{height:100%}  
   </style>
   <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=WZZCdjry5vdrtFtdVGE3c44e"></script>
   <script type="text/javascript">
       var rs=[];
       var wsServer = 'ws://222.195.148.178:20122';
       var websocket = new WebSocket(wsServer);
       websocket.onopen = function (evt) { onOpen(evt) };
       websocket.onclose = function (evt) { onClose(evt) };
       websocket.onmessage = function (evt) { onMessage(evt) };
       websocket.onerror = function (evt) { onError(evt) };
       function onOpen(evt)
       {
           console.log("Connected to WebSocket server.");
       }
       function onClose(evt)
       {
           console.log("Disconnected");
           alert("服务连接已关闭");
           clearStar();
       }
       function onMessage(evt)
       {
           rs = eval(evt.data);
           showStars(rs);
       }
       function onError(evt)
       {
           console.log('Error occured: ' + evt.data);
       }

       function disconnectWebSocket()
       {
           if (websocket) {
               websocket.close();
               console.log('关闭连接！！！');
           }
       }


       //连接
//       setInterval(function ()
//       {
//           if (websocket.readyState == 0 || websocket.readyState == 2 || websocket.readyState == 3) {
//               websocket = new WebSocket(wsServer);
//               websocket.onopen = function (evt) { onOpen(evt) };
//               websocket.onclose = function (evt) { onClose(evt) };
//               websocket.onmessage = function (evt) { onMessage(evt) };
//               websocket.onerror = function (evt) { onError(evt) };
//           }
//       }, 1000);

   </script>
</head>
<body>
<button id="close" style="width:400px" onclick="disconnectWebSocket();">关闭连接</button>
<div id="container"></div>
<script type="text/javascript">
    //加载基础百度地图的实现
    var map = new BMap.Map("container");          // 创建地图实例  
    var point = new BMap.Point(120.466622, 36.152752);  // 创建点坐标  
    map.centerAndZoom(point, 13);                 // 初始化地图，设置中心点坐标和地图级别
    map.enableScrollWheelZoom();
    var mapStyle = {
        features: ["road", "building", "water", "land"], //隐藏地图上的poi
        style: "dark"  //设置地图风格为高端黑
    }
    map.setMapStyle(mapStyle);

    //在百度地图上实时显示公交
    if (document.createElement('canvas').getContext) {
            var BW = 0,    //canvas width
				BH = 0,    //canvas height
				ctx = null,
				stars = [],   //存储所有星星对象的数组
				timer = null, //定时器
				timeLine = null, //时间轴对象
				//rs = [],   //最新的结果
				isNowTimeData = false, //是否显示当前时间的定位情况
				py = null, //偏移
				gridWidth = 10000, //网格的大小
				isOverlay = false, //是否叠加
				canvas = null; //偏移

            function Star(options)
            {
                this.init(options);
            }

            Star.prototype.init = function (options)
            {
                this.x = ~ ~(options.x);
                this.y = ~ ~(options.y);
                this.initSize(options.size);
                if (~ ~(0.5 + Math.random() * 7) == 1) {
                    this.size = 0;
                } else {
                    this.size = this.maxSize;
                }
            }

            Star.prototype.initSize = function (size)
            {
                var size = ~ ~(size);
                this.maxSize = size > 6 ? 6 : size;
            }

            Star.prototype.render = function (i)
            {
                var p = this;

                if (p.x < 0 || p.y < 0 || p.x > BW || p.y > BH) {
                    return;
                }

                ctx.beginPath();
                var gradient = ctx.createRadialGradient(p.x, p.y, 0, p.x, p.y, p.size);
                gradient.addColorStop(0, "rgba(7,120,249,1)");
                gradient.addColorStop(1, "rgba(7,120,249,0.3)");
                ctx.fillStyle = gradient;
                ctx.arc(p.x, p.y, p.size, Math.PI * 2, false);
                ctx.fill();
                if (~ ~(0.5 + Math.random() * 7) == 1) {
                    p.size = 0;
                } else {
                    p.size = p.maxSize;
                }
            }

            function render()
            {
                renderAction();
                timeoutID=setTimeout(render, 180);
            }

            function renderAction()
            {
                ctx.clearRect(0, 0, BW, BH);
                ctx.globalCompositeOperation = "lighter";
                for (var i = 0, len = stars.length; i < len; ++i) {
                    if (stars[i]) {
                        stars[i].render(i);
                    }
                }
            }


            // 复杂的自定义覆盖物
            function ComplexCustomOverlay(point)
            {
                this._point = point;
            }
            ComplexCustomOverlay.prototype = new BMap.Overlay();
            ComplexCustomOverlay.prototype.initialize = function (map)
            {
                this._map = map;
                canvas = this.canvas = document.createElement("canvas");
                canvas.style.cssText = "position:absolute;left:0;top:0;";
                ctx = canvas.getContext("2d");
                var size = map.getSize();
                canvas.width = BW = size.width;
                canvas.height = BH = size.height;
                map.getPanes().labelPane.appendChild(canvas);
                //map.getContainer().appendChild(canvas);
                return this.canvas;
            }
            ComplexCustomOverlay.prototype.draw = function ()
            {
                var map = this._map;
                var bounds = map.getBounds();
                var sw = bounds.getSouthWest();
                var ne = bounds.getNorthEast();
                var pixel = map.pointToOverlayPixel(new BMap.Point(sw.lng, ne.lat));
                py = pixel;
                if (rs.length > 0) {
                    showStars(rs);
                }
            }
            var myCompOverlay = new ComplexCustomOverlay(new BMap.Point(116.407845, 39.914101));
            map.addOverlay(myCompOverlay);

            var project = map.getMapType().getProjection();
            var bounds = map.getBounds();
            var sw = bounds.getSouthWest();
            var ne = bounds.getNorthEast();
            sw = project.lngLatToPoint(new BMap.Point(sw.lng, sw.lat));
            ne = project.lngLatToPoint(new BMap.Point(ne.lng, ne.lat));


            //显示星星
            function showStars(data)
            {
                stars.length = 0;
                var temp = {};
                for (var i = 0, len = rs.length; i < len; i++) {
                    var x = data[i].pl[0].lng, y = data[i].pl[0].lat;
                    var   point = new BMap.Point(x, y);
                    var px = map.pointToOverlayPixel(point);
                    //create all stars
                    var s = new Star({
                        x: px.x - py.x,
                        y: px.y - py.y,
                        size: 3+Math.random()*3
                    });
                    stars.push(s);
                    
                }
                canvas.style.left = py.x + "px";
                canvas.style.top = py.y + "px";
                renderAction();
            }
            render();
            //清除公交车
            function clearStar()
            {
                ctx.clearRect(0, 0, BW, BH);
                clearTimeout(timeoutID);
                stars = [];
                rs = [];
            }


        } else {
            alert('请在chrome、safari、IE8+以上浏览器查看本示例');
        }





</script>  
</body>
</html>
