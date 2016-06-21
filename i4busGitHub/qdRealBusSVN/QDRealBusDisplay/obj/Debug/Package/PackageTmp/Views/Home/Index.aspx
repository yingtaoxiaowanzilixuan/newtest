﻿<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,maximum-scale=1.0,initial-scale=1,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="keywords" content="">
    <meta name="renderer" content="webkit">
    <!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="../../assets/i/favicon.png">
    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="../../assets/i/app-icon72x72@2x.png">
    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="apple-touch-icon-precomposed" href="../../assets/i/app-icon72x72@2x.png">
    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="assets/i/app-icon72x72@2x.png">
    <meta name="msapplication-TileColor" content="#0e90d2">
    <link rel="stylesheet" href="../../assets/css/amazeui.min.css">
    <link rel="stylesheet" href="../../assets/css/app.css">
    <title>青岛实时公交</title>
    <link href="http://libs.baidu.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
    <link href="../../Content/images/jQueryanimate.css" rel="stylesheet" type="text/css" />
    <style>
        html
        {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        body, .ui-page
        {
            width: 100%;
            height: 100%;
            margin: 0px;
            padding: 0px;
            overflow: hidden;
        }
        #content
        {
            position: absolute;
            width: 100%;
            height: 100%;
            color: #fff;
            margin: 0px;
            padding: 0px;
            top: 0px; /* margin-right:-350px;*/
        }
        .modal-dialog
        {
            margin: 20px;
        }
        label
        {
            max-width: none;
        }
        #realStatus
        {
            display: none;
            position: absolute;
            top: 0px;
            left: 0px;
            width: 100%;
            z-index: 1000;
        }
        #mapstationclose
        {
            position: absolute;
            right: 30px;
            top: 50px;
            background-color: white;
            opacity: 0.8;
            z-index: 100px;
            width: 20px;
            text-align: center;
            display: none;
        }
        
        .infoBoxlist ul li
        {
            float: left;
            width: 255px;
            height: 38px;
            line-height: 30px;
            border-bottom: solid 1px #ccc;
            padding: 2px 0;
        }
        .infoBoxlist ul li span
        {
            width: 100px;
            display: block;
            float: left;
            overflow: hidden;
        }
        
        .aside
        {
            position: absolute;
            left: 10px;
            top: 76px;
            color: #fff;
            border: 2px solid #0157b4;
            background: #02050a;
            width: 130px;
        }
        .aside_title
        {
            font-size: 14px;
            height: 40px;
            line-height: 40px;
            padding-left: 20px;
            background: #0157b4;
        }
        .aside_list
        {
            padding-bottom: 50px;
        }
        #aside_list a
        {
            display: block;
            height: 30px;
            line-height: 30px;
            text-decoration: none;
            border-bottom: 1px solid #1c1e23;
            font-size: 14px;
            font-family: '微软雅黑';
            padding-left: 40px;
            color: #fff;
            position: relative;
        }
        
        /*.ui-footer{
        position:absolute;
        bottom:0px;
        left:0px;
        right:0px;
     }*/
        
        /*公交速度说明等级*/
        .map_description
        {
            position: absolute;
            display: none;
            right: 50px;
            bottom: 80px;
            z-index: 10;
            background-color: #1b1c28;
            border-top: #dede00 solid 3px;
        }
        .map_description span
        {
            display: block;
            color: #dede00;
            margin: 8px 10px 5px 0px;
            font-size: 13px;
            text-align: right;
        }
        .map_description p
        {
            float: left;
            display: inline;
            margin: 0px 2px;
        }
        .map_description p i
        {
            float: left;
            display: inline;
            width: 56px;
            height: 22px;
            line-height: 22px;
            color: #fff;
            text-align: center;
            font-style: normal;
            margin: 4px 2px;
            font-family: Arial, "宋体" , Verdana, Helvetica, sans-serif;
            cursor: default;
            font-size: 12px;
            text-shadow: none;
        }
        .map_description p i.map_level_bg1
        {
            background-color: #17BF00;
        }
        .map_description p i.map_level_bg2
        {
            background-color: #FF9F19;
        }
        .map_description p i.map_level_bg3
        {
            background-color: #F23030;
        }
        .map_description p i.map_level_bg4
        {
            background-color: #BB0000;
        }
    </style>
    <script type="text/ecmascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script type="text/ecmascript" src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=WZZCdjry5vdrtFtdVGE3c44e"></script>
    <script src="../../Scripts/SearchInfoWindow_min.js" type="text/javascript"></script>
    <link href="../../Content/SearchInfoWindow_min.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/lushu.js" type="text/javascript"></script>
    
    <script src="../../Scripts/PointStarsCollection.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap-typeahead.js" type="text/javascript"></script>
    <script src="../../Content/buslines.js" type="text/javascript"></script>
    <script src="../../Scripts/reconnecting-websocket.js" type="text/javascript"></script>
    <script type="text/ecmascript" src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
    <script type="text/ecmascript" src="../../assets/js/amazeui.ie8polyfill.min.js"></script>
    <script type="text/ecmascript" src="../../assets/js/amazeui.min.js"></script>
    <script type="text/javascript">

        if (window.WebSocket) {
            var initWebSocket = function () {
                var wsServer = 'ws://localhost:20124';
                websocket = new ReconnectingWebSocket(wsServer);
                websocket.onopen = function (evt) { onOpen(evt) };
                websocket.onclose = function (evt) { onClose(evt) };
                websocket.onmessage = function (evt) { onMessage(evt) };
                websocket.onerror = function (evt) { onError(evt) };
                function onOpen(evt) {
                    console.log("Connected to WebSocket server.已连接到服务器");
                    $("#realStatus").hide();
                    $.mobile.loading("show", { text: '实时数据加载中...', textVisible: true, theme: 'a' });

                }
                function onClose(evt) {
                    console.log("Disconnected");
                    try {
                        $.each(stars, function (index, object) {
                            var p = object;
                            if (typeof (p.lushu) != "undefined") {
                                p.lushu.remove();
                                p.lushu = null;
                            }
                        });
                        clearStar();
                    }
                    catch (e) {
                    }
                    $("#realStatus").html('<a href="#" id="errorclose" class="close" data-dismiss="alert" >&times;</a><strong>警告！</strong>无法连接到服务器或服务器故障。');
                    $("#realStatus").show();
                    $("#errorclose").on("tap", function () {
                        $('#realStatus').hide();
                    });
                }
                function onMessage(evt) {
                    try {
                        pointStarOverlay.points = eval(evt.data); //请求到的数据
                        $("#busnum").text(pointStarOverlay.points.length);
                        pointStarOverlay.draw(); //请求到数据后重新绘制
                        $.mobile.loading("hide");
                    }
                    catch (error) {
                    }
                }
                function onError(evt) {
                    // console.log('Error occured: ' + evt.data);
                    try {
                        clearStar();
                    }
                    catch (e) {
                    }
                    $("#realStatus").show();
                }

                function disconnectWebSocket() {
                    if (websocket) {
                        websocket.close();
                        console.log('关闭连接！！！');
                    }
                }
                function sendMessage(e) {
                    websocket.send(e);
                }
            }
        }
        else {
            alert("你太落后了，可是尝试使用最新的Chrome、火狐、360、Opera或ie10以上浏览器！！")
        }



        var map;
        $(document).on("pageinit", "#pageone", function () {
            setTimeout(function () {
                map = new BMap.Map("content");          // 创建地图实例  

                var centerpoint = new BMap.Point(120.436212, 36.131032);  // 创建点坐标  
                map.centerAndZoom(centerpoint, 13);                 // 初始化地图，设置中心点坐标和地图级别
                map.enableScrollWheelZoom();
                var opts = { type: BMAP_NAVIGATION_CONTROL_ZOOM, anchor: BMAP_ANCHOR_BOTTOM_RIGHT, offset: new BMap.Size(10, 70) }
                map.addControl(new BMap.NavigationControl(opts));
                map.addControl(new BMap.GeolocationControl({ offset: new BMap.Size(10, 70) }));

                //在百度地图上实时显示公交
                pointStarOverlay = new PointStarCollections(); //创建自定义图层【公交车】
                map.addOverlay(pointStarOverlay);

                var mapStyle = {
                    features: ["road", "building", "water", "land"], //隐藏地图上的poi
                    style: "dark"
                };
                //map.setMapStyle(mapStyle);
                map.setMapStyle({ styleJson: pointStarOverlay.mymapstyle });
                initWebSocket(); //开始请求数据
            }, 200);
        });
        //清除公交车
        function clearStar() {
            ctx.clearRect(0, 0, BW, BH);
            stars = [];
            clearInterval(timeoutID);
            // clearTimeout(updateSpeedTimeoutID);
            pointStarOverlay.points = [];
        }

    </script>
</head>
<body>
    <div data-role="page" id="pageone">
        <div id="content">
        </div>       
         <div data-role="header" id="nav-panel-header" data-theme="b" data-position="fixed" style="background-color:rgba(0,0,0,0);border:none;display:none;" >
            <h1 style="color:rgba(0,0,0,0)">.</h1>
            <a href="#nav-panel" data-icon="bars" data-iconpos="notext">Menu</a>
        </div>
        <!-- /header -->
        <!-- /panel -->
        <div data-role="footer" data-position="fixed" data-theme="b">
            <div data-role="navbar">
                <ul>
                    <li><a href="#popupBusearch" data-transition="slide" data-iconpos="left" data-icon="search">
                        查询</a></li>
                    <li><a href="http://222.195.148.178:80/mit/index.html" data-transition="slide" data-iconpos="left"
                        data-icon="delete">退出</a></li>
                </ul>
            </div>
        </div>
        <div data-role="panel" data-position-fixed="true" data-dismissible="false" data-display="push"
            data-theme="b" id="nav-panel">
            <div class="demo" id="stationsAxis" style="overflow: auto; height: 100%; width: 100%;">
                <div class="demoheader">
                    <ul>
                        <li id="buslinename"></li>
                        <li id="startendtime"></li>
                    </ul>
                </div>
                <div class="history">
                    <div class="history-date">
                        <ul id="busStations">
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- /panel -->
        <!--关闭查公交线路查询-->
        <div id="mapstationclose">
            <a href="#" title="关闭查询" class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">
                Close</a>
        </div>
        <!--实时公交状态显示-->
        <div id="realStatus" class="alert alert-warning">
        </div>
        <!--显示公交速度图例-->
        <div class="map_description" id="map_description">
            <span id="updatetime">公交路况</span>
            <div class="clear">
            </div>
            <p>
                <i class="map_level_bg1" href="">优</i><i class="map_level_bg2" href="">良</i><i class="map_level_bg3"
                    href="">中</i><i class="map_level_bg4" href="">差</i></p>
        </div>
    </div>
    <div data-role="page" id="popupBusearch" data-transition="slide">
        <div data-role="header" data-position="fixed" data-theme="b">
            <a href="#pageone" data-rel="back" class="ui-btn ui-btn-left ui-alt-icon ui-nodisc-icon ui-corner-all ui-btn-icon-notext ui-icon-carat-l">
                Back</a>
            <h1 style="font-weight: bold;">
                公交查询</h1>
        </div>
        <div data-role="content" style="height: 100%">
            <input type="text" placeholder="请输入公交线路名称" id="name">
            <div id="busSearchDetail" style="height: 80%">
                <h3 style="color: green; font: 25px/25px 微软雅黑; margin-top: 50px;">
                    使用说明：</h3>
                <ul style="color: green; font: 15px/25px 微软雅黑; padding: 10px;">
                    <li>1.首先在上方输入栏中输入公交线路名称，下方会智能匹配公交线路名，用鼠标或键盘选中即可</li>
                    <li>2.查询到公交的上行和下行信息</li>
                    <li>3.选择要查询的车站进行查询，例如查询125路，从到达海大崂山停车场的车，选择从台东出发的路线，点击海大崂山校区即可</li>
                    <li>4.进入地图界面，在地图上实时显示到达某一站的公交位置信息，侧边栏为文字信息</li>
                    <li>5.点击公交图标上方的文字信息可以获取该公交的详细信息</li>
                    <li>6.点击地图界面右上方的关闭按钮即可关闭公交查询</li>
                </ul>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#name').typeahead({
            source: buslinedata,
            //            ajax: {
            //                url: '../../Home/GetBuslines',
            //                method: 'post',
            //                triggerLength: 1
            //            }, //y

            highlighter: function (item) {
                return item;
            },
            itemSelected: function (item) {
                $("#busSearchDetail").html("");
                $.mobile.loading("show", { text: '数据加载中...', textVisible: false, theme: 'a' });
                $.ajax({
                    url: '../../Home/GetBuslineDetail',
                    type: 'POST',
                    data: { buslinename: $("#name").val() },
                    dataType: "json",
                    success: function (data) {
                        realBusLineName = data[0].realBusLineName;        //爱青岛对应实时公交线路名
                        //   realBusStopStation = data[0].realBusStopStation;  //爱青岛对应终点站名

                        var table = '<table class="table table-striped">';
                        var updowncount = data.length;
                        if (updowncount == 2) {
                            table += '<thead><tr><th>上行</th><th>下行</th></tr></thead><tbody>';
                            var uplength = data[0].stations.length, downlength = data[1].stations.length;
                            var maxlength = uplength >= downlength ? uplength : downlength;
                            for (var i = 0; i < maxlength; i++) {
                                var col1 = (i > uplength - 1) ? "" : (i + 1 + " " + data[0].stations[i].name);
                                var col2 = (i > downlength - 1) ? "" : (i + 1 + " " + data[1].stations[i].name)
                                table += '<tr><td><a class="stationup" href="#" >' + col1 + '</a></td><td><a class="stationdown" href="#">' + col2 + '</a></td></tr>'
                            }
                            table += '</tbody></table>'
                        }
                        if (updowncount == 1) {
                            table += '<thead><tr><th>上行</th><th>下行</th></tr></thead><tbody>';

                            var length = data[0].stations.length;
                            var midindex = Math.floor((length - 1) / 2);
                            var uplength = midindex + 1, downlength = length - uplength + 1;
                            var maxlength = uplength >= downlength ? uplength : downlength;
                            data.push({ stations: data[0].stations.splice(midindex, downlength), updown: data[0].updown });
                            data[0].stations.push(data[1].stations[0]);
                            for (var i = 0; i < maxlength; i++) {
                                var col1 = (i > uplength - 1) ? "" : (i + 1 + " " + data[0].stations[i].name);
                                var col2 = (i > downlength - 1) ? "" : (i + 1 + " " + data[1].stations[i].name)
                                table += '<tr><td><a class="stationup" href="#" >' + col1 + '</a></td><td><a class="stationdown" href="#">' + col2 + '</a></td></tr>'
                            }
                            table += '</tbody></table>'

                        }


                        $("#busSearchDetail").css("height", $(window).height() * 0.8)
                        $("#busSearchDetail").css("overflow", "auto");
                        $("#busSearchDetail").html(table);
                        $.mobile.loading("hide");

                        function elementclickFunc(clickstation, data, updown, index) {
                            //清除以前内容
                            buslinename = "";
                            map.clearOverlays();
                            if (typeof (updateSpeedTimeoutID) != "undefined") {
                                clearTimeout(updateSpeedTimeoutID)
                            }

                            map.addOverlay(pointStarOverlay);
                            $.mobile.changePage("#pageone");
                            BaiduBusLineName = $("#name").val();  //公交线路名
                            selectedStations.length = 0; //清空数组
                            busroute.length = 0;
                            searchFlag = false;
                            //map.setMapStyle({ style: "mapbox" });

                            $("#mapstationclose").show();
                            startstation = data[updown].stations[0].name; //起始站
                            stopstation = data[updown].stations[data[updown].stations.length - 1].name; //终点站

                            realstopstation = data[updown].realBusStopStation; //爱青岛实时公交对应的终点站
                            if (data[0].stations.length != data[1].stations.length) {
                                for (var indexi = 0; indexi < data[updown].stations.length; indexi++) {
                                    if (compare(data[updown].stations[indexi].name, clickstation) >= 85) {
                                        index = indexi;
                                        break;
                                    }
                                }
                            }


                            //  clickstationnum = data[updown].stations.length - index;               //鼠标点击当前要查询的公交站点
                            clickstationnum = index;
                            var selectpoint = new BMap.Point(data[updown].stations[index].lng, data[updown].stations[index].lat);
                            map.clearOverlays();
                            if (typeof (timeoutID) != "undefined" && typeof (pointStarOverlay) != "undefined") {
                                clearTimeout(timeoutID);
                                map.addOverlay(pointStarOverlay);
                            }

                            var busline = new BMap.BusLineSearch(map, {
                                renderOptions: {},
                                onGetBusListComplete: function (result) {
                                    /*result为得到公交信息*/
                                    if (result) {
                                        //公交线路名含始终站，例125路(海大崂山校区-台东)
                                        var baidubusline = BaiduBusLineName + "(" + startstation + "-" + stopstation + ")";

                                        //判断是否为环形,如果为环形线路则始发站等于终点站
                                        if (updowncount == 1) {
                                            baidubusline = BaiduBusLineName + "(" + data[0].stations[0].name + "-" + data[0].stations[0].name + ")";
                                        }
                                        //遍历公交信息，找到特定始终站线路信息
                                        for (var i = 0; i < result.getNumBusList(); i++) {
                                            if (result.getBusListItem(i).name == baidubusline) {
                                                var fstLine = result.getBusListItem(i);
                                                busline.getBusLine(fstLine); //获取线路具体信息，通过onGetBusLineComplete回调得到信息
                                                break;
                                            }
                                            else if (result.getBusListItem(i).name.indexOf("环线") != "-1") {
                                                var fstLine = result.getBusListItem(i);
                                                busline.getBusLine(fstLine);
                                                break;
                                            }

                                        }
                                    }
                                },
                                onGetBusLineComplete: function (busline) {
                                    if (busline) {
                                        searchFlag = true; //搜索特定线路的标记设为true

                                        var array = busline.getPath(); //获取线路的坐标数组
                                        var points = [];
                                        //添加公交线路图层
                                        buspolyline = new BMap.Polyline(array, { strokeColor: "#107658", strokeWeight: 5, strokeOpacity: 1 });
                                        map.addOverlay(buspolyline);

                                        //添加始发点和终点站图标
                                        var startstationpoint = busline.getBusStation(0).position; //始发站位置信息
                                        var endstationpoint = busline.getBusStation(busline.getNumBusStations() - 1).position;  //终点站坐标信息
                                        var start_endicon = new BMap.Icon('../../Content/transparent.png', new BMap.Size(38 * 0.7, 41 * 0.7));
                                        var starticon = new BMap.Marker(startstationpoint, { icon: start_endicon }); //创建圆
                                        var startlabel = new BMap.Label("起", { offset: new BMap.Size(0, 0) });

                                        startlabel.setStyle({ width: "26px", height: "26px", fontSize: "13px", lineHeight: "26px", textAlign: "center", backgroundColor: "rgba(0, 255, 0, 0.6)", border: "none", borderRadius: "13px", color: "white" })

                                        starticon.setLabel(startlabel);
                                        map.addOverlay(starticon);

                                        var endicon = new BMap.Marker(endstationpoint, { icon: start_endicon }); //创建圆
                                        var endlabel = new BMap.Label("终", { offset: new BMap.Size(0, 0) });
                                        endlabel.setStyle({ width: "26px", height: "26px", fontSize: "13px", lineHeight: "26px", textAlign: "center", backgroundColor: "rgba(255, 0, 0, 0.6)", border: "none", borderRadius: "13px", color: "white" })
                                        endicon.setLabel(endlabel);
                                        map.addOverlay(endicon);
                                        var k = 0;

                                        console.log(map.getDistance(array[0], busline.getBusStation(0).position));
                                        var stationcircleIcon = new BMap.Icon('../../Content/stationcircle.png', new BMap.Size(16, 16));

                                        var stationlist = [];
                                        var stationupdown = updown == 0 ? "stationupPanel" : "stationdownPanel";
                                        $("#buslinename").html("<h3><a href='#' id='reverseupdwon' title='点击获取返程线路信息' updown=" + stationupdown + ">" + busline.name + "</a></h3>");

                                        $("#startendtime").html("<h3>首末班时间：" + busline.startTime + "-" + busline.endTime + "<div style='background-color:red;float:right;border-radius:1px;color:white;margin-left:10px;width:30px;text-align:center'>途中</div><div style='background-color:green;width:30px;float:right;border-radius:1px;color:white;text-align:center'>目的</div>  </h3>");
                                        for (var i = 0; i < array.length; i++) {
                                            var p = array[i], isStation;
                                            //标注线路坐标数据中为公交站的坐标点
                                            if (k < busline.getNumBusStations() && map.getDistance(array[i], busline.getBusStation(k).position) < 20) {
                                                selectedStations.push({ position: array[i], num: i, name: busline.getBusStation(k).name, speed: 0 });
                                                //实时到站侧边栏文字显示
                                                var stationpanel = "<li><h3>" + k + "</h3><dl><dt><a href='#' class=" + stationupdown + ">" + busline.getBusStation(k).name + "</a></dt></dl></li>";
                                                if (busline.getBusStation(k).name == data[updown].stations[index].name) {
                                                    stationpanel = "<li class='green'><h3>" + k + "</h3><dl><dt><a href='#' class=" + stationupdown + ">" + busline.getBusStation(k).name + "</a></dt></dl></li>";
                                                }
                                                stationlist.push(stationpanel);

                                                //添加线路上的所有站点(不包括起点和终点)
                                                if (k != 0 && k != busline.getNumBusStations() - 1) {
                                                    var stationcircle = new BMap.Marker(array[i], { icon: stationcircleIcon, title: busline.getBusStation(k).name });
                                                    var opts = {
                                                        width: 0,
                                                        height: 0,
                                                        enableMessage: false,
                                                        offset: new BMap.Size(3, -3)
                                                    }
                                                    var content = busline.getBusStation(k).name;
                                                    var infoWindow = new BMap.InfoWindow(content, opts);

                                                    stationcircle.addEventListener("click", function (info, stationlnglat) {
                                                        return function () { map.openInfoWindow(info, stationlnglat); }
                                                    } (infoWindow, array[i]))




                                                    map.addOverlay(stationcircle); //显示在线获取的公交数据
                                                }
                                                isStation = 1;
                                                k++;

                                            }
                                            else {
                                                isStation = 0;
                                            }

                                            busroute.push({ p: new BMap.Point(p.lng, p.lat), isStation: isStation });
                                        }
                                        //【更新速度】
                                        var beforetimecount = null, speedcolorlines = [];
                                        function updateSpeed() {
                                            var updatetime = new Date();
                                            var hour = updatetime.getHours() < 10 ? ("0" + updatetime.getHours()) : updatetime.getHours();
                                            var minutes = updatetime.getMinutes();
                                            minutes = parseInt(minutes / 10) * 10;
                                            if (minutes == 0) {
                                                minutes = "00";
                                            }
                                            //星期
                                            var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
                                            var week = days[updatetime.getDay()];
                                            var timecount = hour + ":" + minutes;

                                            if (beforetimecount != timecount || beforetimecount == null) {
                                                $.ajax({
                                                    url: '../../Home/GetStationSpeedByLine',
                                                    type: 'post',
                                                    data: { buslinename: BaiduBusLineName, busstopname: stopstation, timecount: timecount, week: week },
                                                    dataType: 'json',
                                                    success: function (data) {
                                                        for (var i = 0; i < data.length; i++) {
                                                            //匹配公交站点的速度，根据公交站点的序号
                                                            try {
                                                                if (compare(data[i].stationname, selectedStations[data[i].stopnumber - 1].name) >= 85) {
                                                                    selectedStations[data[i].stopnumber - 1].speed = data[i].speed;
                                                                }
                                                                else {
                                                                    //如果公交序号匹配不上，则遍历所有的公交站点
                                                                    for (var j = 0; j < selectedStations.length; j++) {
                                                                        if (compare(selectedStations[j].name, data[i].stationname) > 90) {
                                                                            selectedStations[j].speed = data[i].speed;
                                                                            break;
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            catch (ex) {
                                                                console.log("站点匹配异常错误")
                                                            }
                                                            finally {
                                                                continue;
                                                            }


                                                        }

                                                        if (speedcolorlines.length != 0) {
                                                            for (var i = 0; i < speedcolorlines.length; i++) {
                                                                map.removeOverlay(speedcolorlines[i]);
                                                            }
                                                        }
                                                        //在线路上用不同的颜色绘制公交速度
                                                        if (data.length > 0) {
                                                            $("#map_description").show();
                                                            $("#updatetime").html("公交路况     更新时间：" + timecount);
                                                            for (var j = 1; j < selectedStations.length; j++) {
                                                                var stationbefore = selectedStations[j - 1].num, stationafter = selectedStations[j].num + 1;
                                                                var stationspeed = selectedStations[j - 1].speed * 2, speedcolor = null;

                                                                switch (true) {
                                                                    case stationspeed == 0:
                                                                        speedcolor = "#17BF00"; //未请求到实时数据
                                                                        break;
                                                                    case stationspeed > 0 && stationspeed <= 3 * 3.6:
                                                                        speedcolor = "#BB0000"; //严重拥堵
                                                                        break;
                                                                    case stationspeed > 3 * 3.6 && stationspeed <= 6 * 3.6:
                                                                        speedcolor = "#F23030"; //拥堵
                                                                        break;
                                                                    case stationspeed > 6 * 3.6 && stationspeed <= 10 * 3.6:
                                                                        speedcolor = "#FF9F19"; //缓行
                                                                        break;
                                                                    case stationspeed > 10 * 3.6:
                                                                        speedcolor = "#17BF00"; //通畅
                                                                        break;
                                                                }

                                                                //ctx.beginPath();
                                                                var buspolylineSpeed = new BMap.Polyline(array.slice(stationbefore, stationafter), { strokeColor: speedcolor, strokeWeight: 10, strokeOpacity: 1 }); //slice(start,end)提取从start到end的所有字符。
                                                                map.addOverlay(buspolylineSpeed);
                                                                buspolylineSpeed.addEventListener('click', function () {
                                                                    alert("timecount");
                                                                });
                                                                speedcolorlines.push(buspolylineSpeed);
                                                            }
                                                        }
                                                    },
                                                    error: function (data) {
                                                        alert("速度无法匹配" + data);
                                                    }
                                                })
                                                beforetimecount = timecount;
                                            }

                                            updateSpeedTimeoutID = setTimeout(updateSpeed, 10000);
                                        }
                                        updateSpeed();

                                        $("#stationsAxis").css("height", $(window).height() * 0.92);
                                        $("#busStations").html(stationlist.join(" "));

                                        // $("#busStations").listview("refresh");
                                        for (var j = 0; j < data[updown].stations.length; j++) {
                                            var point = new BMap.Point(data[updown].stations[j].lng, data[updown].stations[j].lat); //数据库中的站点
                                            //从数据库中获取经纬度数据标在地图上
                                            var stationmarker = new BMap.Marker(point);
                                            var label = new BMap.Label(data[updown].stations.stop, { offset: new BMap.Size(20, -10) });

                                            // map.addOverlay(new BMap.Marker(point));//显示数据库中公交位置
                                            ////以下注释的三行代码表示在线从百度地图上获取站点经纬度数据，然后标在地图上
                                            //                                            var stationmarker = new BMap.Marker(busline.getBusStation(j).position); //百度地图上的站点点
                                            //                                            //站点（公交线路上的站点）
                                            //                                            // map.addOverlay(stationcircle); //显示在线获取的公交数据
                                            //                                            var label = new BMap.Label(busline.getBusStation(j).name, { offset: new BMap.Size(20, -10) });
                                            label.setStyle({ backgroundColor: "rgba(255, 255, 0, 0.2)", border: "1px solid white", borderRadius: "3px", color: "white" })
                                            stationmarker.setLabel(label);
                                            //console.log(busline.getBusStation(j).name, busline.getBusStation(j).position.lng, busline.getBusStation(j).position.lat);
                                            //selectedStations.push(busline.getBusStation(j));
                                        }


                                        //居中并设置跳动
                                        setTimeout(function () {
                                            clickmarker = new BMap.Marker(selectpoint); //选择的当前点
                                            map.addOverlay(clickmarker);

                                            var label = new BMap.Label(clickstation, { offset: new BMap.Size(20, -15) });
                                            label.setStyle({ backgroundColor: "rgba(255, 255, 0, 1)", fontSize: "15px", border: "1px solid white", borderRadius: "3px", color: "black", zIndex: "100000000000", fontWeight: "bold" })
                                            clickmarker.setLabel(label);

                                            //创建右键菜单，用于删除当前点
                                            var removeMarker = function (e, ee, marker) {
                                                //删除当前选择站点时进行的操作，包括移除当前点、清空buslinename等
                                                map.removeOverlay(marker);
                                                buslinename = "";
                                                map.clearOverlays();
                                                clearTimeout(timeoutID);
                                                map.addOverlay(pointStarOverlay);
                                                $("#mapstationclose").hide();
                                                $("#name").val("");
                                                $("#busSearchDetail").css("height", "0px")
                                                $("#busSearchDetail").html("");
                                            }
                                            var markerMenu = new BMap.ContextMenu();
                                            markerMenu.addItem(new BMap.MenuItem('删除', removeMarker.bind(clickmarker)));
                                            clickmarker.addContextMenu(markerMenu);
                                            map.centerAndZoom(point, 13);
                                            clickmarker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
                                            $("#nav-panel-header").show();
                                            $("#nav-panel").panel("open");

                                            //左侧侧边栏的单击事件
                                            $(".stationupPanel").each(function (indexs, element) {
                                                $(element).on("tap", function () {
                                                    clickstation = $(this).text(); //选取的查询站点
                                                    elementclickFunc(clickstation, data, 0, indexs);
                                                })


                                            });
                                            $(".stationdownPanel").each(function (indexs, element) {
                                                $(element).on("tap", function () {
                                                    clickstation = $(this).text(); //选取的查询站点
                                                    elementclickFunc(clickstation, data, 1, indexs);
                                                })
                                            });
                                            //返程单击按钮
                                            $("#reverseupdwon").on("tap", function () {
                                                if ($(this).attr("updown") == "stationupPanel") {
                                                    elementclickFunc(clickstation, data, 1, data[0].stations.length - index - 1);
                                                }
                                                else {
                                                    elementclickFunc(clickstation, data, 0, data[1].stations.length - index - 1);
                                                }

                                            })


                                        }, 300);
                                        buslinename = realBusLineName; //爱青岛对应公交线路名

                                    }
                                }
                            });
                            function busSearch() {
                                //根据公交线路名查询公交信息（含上行和下行）
                                busline.getBusList(BaiduBusLineName);
                            }
                            busSearch();
                            //$("#popupclose").click();
                        }

                        $(".stationup").each(function (index, element) {
                            $(element).on("tap", function () {
                                clickstation = $(this).text(); //选取的查询站点
                                elementclickFunc(clickstation, data, 0, index);

                            })
                        });
                        $(".stationdown").each(function (index, element) {
                            $(element).on("tap", function () {
                                clickstation = $(this).text(); //选取的查询站点
                                elementclickFunc(clickstation, data, 1, index);
                            })
                        });



                    }
                });
            }
        });
        //关闭公交信息panel
        $("#mapstationclose").on("tap", function () {
            $("#mapstationclose").hide();
            $("#map_description").hide();
            buslinename = "";

            var helpinfo = '<h3 style="color:green;font:25px/25px 微软雅黑;  margin-top:50px;">使用说明：</h3><ul style=" color:green;font:15px/25px 微软雅黑; padding:10px;"><li>1.首先在上方输入栏中输入公交线路名称，下方会智能匹配公交线路名，用鼠标或键盘选中即可</li><li>2.查询到公交的上行和下行信息</li> <li>3.选择要查询的车站进行查询，例如查询125路，从到达海大崂山停车场的车，选择从台东出发的路线，点击海大崂山校区即可</li><li>4.进入地图界面，在地图上实时显示到达某一站的公交位置信息，侧边栏为文字信息</li> <li>5.点击公交图标上方的文字信息可以获取该公交的详细信息</li><li>6.点击地图界面右上方的关闭按钮即可关闭公交查询</li>   </ul>';

            //  $("#busStations").html(helpinfo);
            $("#nav-panel").panel("close");
            $("#nav-panel-header").hide();
            //            map.removeOverlay(clickmarker);
            //            map.removeOverlay(buspolyline);
            map.clearOverlays();
            clearTimeout(timeoutID);
            clearTimeout(updateSpeedTimeoutID);
            map.addOverlay(pointStarOverlay);

            $("#name").val("");
            //  $("#busSearchDetail").css("height", "0px")
            $("#busSearchDetail").html(helpinfo);
        })



        var buslinename = "";

    </script>
</body>
</html>
