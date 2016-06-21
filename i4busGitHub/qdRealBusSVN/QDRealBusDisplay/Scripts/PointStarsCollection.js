//【在百度地图上实时显示公交】
if (document.createElement('canvas').getContext) {
    var BW = 0,    //canvas width
		BH = 0,    //canvas height
		ctx = null,
		stars = [],   //存储所有星星对象的数组
		py = null, //偏移
        mousepoint = null;//鼠标位置点
        canvas = null; //canvas画板
            // 以下变量用于显示鼠标点击地图上的点显示信息,searchFlag为是否查询特定线路的标志
            var searchFlag = false, mapclickpoint = null, timeoutID=null,k=0,markers=[],selectedStations=[],busroute=[];
    //【定义Star】
    function Star(options) {
        this.init(options);
    }
    Star.prototype.init = function (options) {
        this.x = ~ ~(options.x);
        this.y = ~ ~(options.y);
        this.linename = options.linename;
        this.time = options.time;
        this.stop = options.stop;
        this.name = options.name;
        this.num = options.num;
        this.lng = options.lng;
        this.lat = options.lat;
        this.routenum = options.routenum;
        this.id = options.id;
        this.stay = true; //公交到站
        this.nextstation = options.nextstation; //公交站点在线路中的位置
        this.speed = options.speed;
        this.initSize(options.size);


        if (~ ~(0.5 + Math.random() * 7) == 1) {
            this.size = 0;
        } else {
            this.size = this.maxSize;
        }
    }

    Star.prototype.initSize = function (size) {
        var size = ~ ~(size);
        this.maxSize = size > 6 ? 6 : size;
    }
    //【Star的绘制渲染】
    Star.prototype.render = function (i) {
        var p = this;
        var datenow = new Date();
        var datenow_3 = desendMinutes(datenow, 3); ; //当前时间三分钟前的时刻
        var datenow_10 = desendMinutes(datenow, 8); //当前时间十分钟前的时刻
        if (new Date(p.time) < datenow_10 || p.num <= 0) {
            stars.splice(i, 1); //如果一个公交十分钟没有更新数据，则移除该公交
            try {
                if (typeof (p.lushu) != "undefined") {
                    p.lushu.remove();
                    $("#busStations li:eq(" + (p.num + clickstationnum+1) + ")").css("color", "white");
                }
            }
            catch (e) {
                alert(e + "error");
            }
        }
        if (p.x < 0 || p.y < 0 || p.x > BW || p.y > BH) {
            // return;
        }


        ctx.beginPath();
        var gradient = ctx.createRadialGradient(p.x, p.y, 0, p.x, p.y, p.size);
        //星星颜色
        if (new Date(p.time) > datenow_3 && searchFlag == false && buslinename == "") {
            
             
            
            gradient.addColorStop(0, "rgba(7,120,249,1)");
            gradient.addColorStop(1, "rgba(7,120,249,0.3)");


            ctx.fillStyle = gradient;
            ctx.arc(p.x, p.y, p.size, Math.PI * 2, false);
            ctx.fill();
        }
        else if (searchFlag == false && buslinename == "") {
            gradient.addColorStop(0, "rgba(7,120,249,1)");
            gradient.addColorStop(1, "rgba(7,120,249,0.3)");
            ctx.fillStyle = gradient;
            ctx.arc(p.x, p.y, p.size, Math.PI * 2, false);
            ctx.fill();

        }
        else if (searchFlag == true && p.num > 0) {

            $("#busStations li:eq(" + (clickstationnum-p.num) + ")"+" a").css("color", "red");



            gradient.addColorStop(0, "rgba(255,255,0,0.5)");
            gradient.addColorStop(1, "rgba(255,255,0,0.1)");

            //move公交站
            var lnglatpoint = busroute[p.routenum].p;
            //经纬度坐标转为像素坐标
            var temppx = map.pointToOverlayPixel(lnglatpoint);
            p.x = temppx.x - py.x;
            p.y = temppx.y - py.y;

            /*只显示站点位置，没有move的情况
            //var lnglatpoint = new BMap.Point(p.lng, p.lat);
            var icon = new BMap.Icon("../Content/bus16.png", new BMap.Size(16, 16));
            var marker = new BMap.Marker(lnglatpoint, { icon: icon });
            markers.push(marker); //将marker放入markers数组
            // map.addOverlay(marker);
            //设置label标签
            var label = new BMap.Label(p.num, { offset: new BMap.Size(20, -10) });
            label.setStyle({ width: "22px", textAlign: "center", backgroundColor: "rgba(255, 255, 255, 0.2)", border: "none", borderRadius: "3px", color: "white" })
            marker.setLabel(label);
            //定义弹出信息窗
            var opts = {
            width: 0,     // 信息窗口宽度
            height: 200,     // 信息窗口高度
            title: "<h4>" + p.name + ":" + p.id + "</h4>",  // 信息窗口标题
            enableMessage: false,
            offset: new BMap.Size(3, -3)
            }
            var content = "<table class='table table-striped'><tr><td>线路：</td><td>" + p.linename + "</td></td></tr><tr><td>开往:</td><td>" + p.stop + "</td></tr><tr><td>时间：</td><td>" + p.time + "</td></tr><tr><td>距离当前站</td><td>" + p.num + "站</td></tr>";
            var infoWindow = new BMap.InfoWindow(content, opts);

            //设置marker的单击事件
            marker.addEventListener("click", function () {
            map.openInfoWindow(infoWindow, lnglatpoint);
            })

            ctx.fillStyle = gradient;
            ctx.arc(p.x, p.y, p.size, Math.PI * 2, false);
            ctx.fill();
            */
            //添加公交图标

            if (p.stay == true) {
                //*************************路书实现************************//
                var array = [];
                for (var m = p.routenum; m < p.nextstation.num; m++) {
                    array.push(busroute[m].p);
                }
                var infowindow = null;
                if (typeof (p.lushu) != "undefined") {
                    infowindow = p.lushu._opts.InfoWindow;
                    p.lushu.remove();
                   // $("#busStations li:eq(" + (p.num + clickstationnum) + ")").css("color", "white");
                }
                
                p.lushu = new BMapLib.LuShu(map, array, {
                    defaultContent: p.num + "" + p.name + "" + p.id,
                    busselfid:p.id,
                    time: p.time, //公交到站时间
                    stop: p.stop, //查询的站点
                    linename: p.linename, //公交线路名
                    num: p.num, //距离当前站还有几站
                    name: p.name,
                    nextStationName: p.nextstation.name, //下一站
                    InfoWindow:infowindow,//marker上方信息框
                    autoView: false, //是否开启自动视野调整，如果开启那么路书在运动过程中会根据视野自动调整
                    // icon: new BMap.Icon("../Content/bus16.png", new BMap.Size(16, 16), { anchor: new BMap.Size(5, 5) }),
                    icon: new BMap.Icon('../Content/car.png', new BMap.Size(50, 25), { anchor: new BMap.Size(23, 10) }),
                    speed: p.speed==0?(Math.random()*2+7)*0.9/3.6:p.speed*0.9/3.6, //覆盖物移动速度，单位米/秒 
                    enableRotation: true,
                    landmarkPois: [{ lng: 120.439581, lat: 36.076574, html: '加油站', pauseTime: 2}]
                });
                p.lushu.start();
                p.lushu._opts.speed;
                //   busroute[p.routenum].isStation = 0;
                p.stay = false; //离开站点
                //********************************************//
            }


        } //搜索特定公交车



        //随机设置星点的大小
        if (~ ~(0.5 + Math.random() * 7) == 1) {

            p.size = (searchFlag == false) ? 0 : 6;

        } else {
            p.size = (searchFlag == false) ? p.maxSize : 12;
        }
        //判断鼠标点是否在星点内
        /*
        if (mousepoint && ctx.isPointInPath(mousepoint.x, mousepoint.y) && searchFlag == false) {
        p.size = 10;
        mapclickpoint = p;
        }*/
    }
    //【每个180ms绘制一次实现动画闪烁效果】
    function render() {
        if (markers.length != 0) {
            for (var i = 0; i < markers.length; i++) {
                map.removeOverlay(markers[i]);
            }
        }
        if (stars.length == 0 && searchFlag == true) {
            //alert("未找到实时公交数据");
            $("#realStatus").html('<a href="#" id="errorclose" class="close" data-dismiss="alert" >&times;</a><strong>温馨提示！</strong>没有查询到该条线路的公交车');
            $("#realStatus").show();
            $("#errorclose").on("tap",function () {
                $("#realStatus").hide();
            })
        }
        else if (stars.length > 0 && searchFlag == true) {
            $("#realStatus").hide();
        }
        else if (stars.length>0) {
            $("#realStatus").hide();
        }
        renderAction();
        timeoutID = setTimeout(render, 180);
    }

    function renderAction() {
        ctx.clearRect(0, 0, BW, BH);
        ctx.globalCompositeOperation = "lighter";
        //【对所有的Star进行绘制渲染】
        $("#busStations li a").css("color", "white");
        $("#busStations li.green a").css("color", "green");


        for (var i = 0, len = stars.length; i < len; ++i) {
            if (stars[i]) {
                stars[i].render(i);
            }
        }

    }


    // 复杂的自定义覆盖物【--以公交车为例】
    function PointStarCollections() {
        this.points = [];
        this.mymapstyle = blackmapstyle;//设置覆盖物对应地图的风格
    }
    PointStarCollections.prototype = new BMap.Overlay();
    PointStarCollections.prototype.initialize = function (map) {
        this._map = map;
        canvas = this.canvas = document.createElement("canvas");
        canvas.style.cssText = "position:absolute;left:0;top:0;";
        ctx = canvas.getContext("2d");
        var size = map.getSize();
        canvas.width = BW = size.width;
        canvas.height = BH = size.height;
        this.width = size.width;
        this.height = size.width;

        map.getPanes().labelPane.appendChild(canvas);
       // render();


        //【为每个star添加单击事件，显示star的详细信息】
        
        map.addEventListener('click', function (e) {
        mousepoint = getEventPosition(e); //获取鼠标位置
        clearTimeout(timeoutID);
        render();
        if (mapclickpoint != null) {
        var lnglatpoint = map.pixelToPoint(new BMap.Pixel(mapclickpoint.x, mapclickpoint.y));
        var opts = {
        width: 0,     // 信息窗口宽度
        height: 200,     // 信息窗口高度
        title: "<h4>" + mapclickpoint.name + "</h4>",  // 信息窗口标题
        enableMessage: false,
        offset: new BMap.Size(3, -3)
        }
        var content = "<table class='table table-striped'><tr><td>线路：</td><td>" + mapclickpoint.linename + "</td></td></tr><tr><td>开往:</td><td>" + mapclickpoint.stop + "</td></tr><tr><td>时间：</td><td>" + mapclickpoint.time + "</td></tr><tr><td>距离当前站</td><td>" + mapclickpoint.num + "站</td></tr>";
        var infoWindow = new BMap.InfoWindow(content, opts);  // 创建信息窗口对象
        mapclickpoint = null;
        map.openInfoWindow(infoWindow, new BMap.Point(e.point.lng, e.point.lat));

        console.log(mapclickpoint.x + "," + mapclickpoint.y);
  
        }
        });

        return this.canvas;
    }
    PointStarCollections.prototype.draw = function () {
        var map = this._map;
        var bounds = map.getBounds();
        var sw = bounds.getSouthWest();
        var ne = bounds.getNorthEast();
        //【重新设置canvas大小】
        var size = map.getSize();
        canvas.width = BW = size.width;
        canvas.height = BH = size.height;
        this.width = size.width;
        this.height = size.width;
        //【获取左上角坐标】
        var pixel = map.pointToOverlayPixel(new BMap.Point(sw.lng, ne.lat));
        py = pixel;


        if (this.points.length > 0) {
            showStars(this.points);
            clearInterval(timeoutID);
            render();
            //render();
        }



    }


    //【添加并显示星星】
    function showStars(data) {
        //如果是显示全部公交信息
        if(buslinename==""|| typeof (realstopstation) == "undefined" || (stars.length>0 && typeof(stars[0].id)=="undefined")){
           stars.length = 0; //清空stars
        }
        var privorcount=stars.length;//上一次stars(公交)的数量
        for (var i = 0, len = data.length; i < len; i++) {
            var starlinename = data[i].pl[0].linename, starstop = data[i].pl[0].stop, starnum = data[i].pl[0].num; //获取线路名称
            //显示全部公交
            if (buslinename == "" || typeof (realstopstation) == "undefined") {
                searchFlag = false;
                var x = data[i].pl[0].lng, y = data[i].pl[0].lat, startime = data[i].pl[0].time, starname = data[i].pl[0].name;
                var point = new BMap.Point(x, y);
                var px = map.pointToOverlayPixel(point);//经纬度坐标转为像素坐标
                //create all stars
                var s = new Star({
                    x: px.x - py.x,
                    y: px.y - py.y,
                    size: 3.8 + Math.random() * 3,
                    linename:starlinename,
                    time:startime,
                    stop: starstop,
                    name:starname
                });
                stars.push(s);
            }
            //查询开往特定站点的特定公交
            else if (selectedStations.length > 0 && starlinename == buslinename && starstop == realstopstation ) {
                searchFlag = true; //搜索特定线路的标记设为true
                var id=data[i].id,x = data[i].pl[0].lng, y = data[i].pl[0].lat, startime = data[i].pl[0].time, starname = data[i].pl[0].name;

                var stationscount = selectedStations.length;

                // var x1 = selectedStations[stationscount - starnum - 1].position.lng, y1 = selectedStations[stationscount - starnum - 1].position.lat;
                var x1 = null, y1 = null, stationnum = null,speed=0;
                var similarity = 0;//两个站点匹配的相似度
                for (var t = 0; t < stationscount; t++) {
                    //站点名完全匹配
                    if (starname == selectedStations[t].name) {
                        x1 = selectedStations[t].position.lng;
                        y1 = selectedStations[t].position.lat;
                        speed = selectedStations[t].speed;
                        stationnum = t;
                        break;
                    } //站点名不完全匹配，匹配度>80%认为为同一站点
                    else if ((tempsimilarity = compare(starname, selectedStations[t].name)) >= 80) {
                        if (similarity < tempsimilarity) {
                            similarity = tempsimilarity;
                            x1 = selectedStations[t].position.lng;
                            y1 = selectedStations[t].position.lat;
                            speed = selectedStations[t].speed;
                            stationnum = t;
                            
                            if (similarity > 90) {
                                break;
                            }
                        }
                    }

                }
                if (stationnum == null) {
                    console.log("站点：" + starname + "   id:" + id);
                }
                //如果站点可以匹配到
                if (stationnum != null) {
                    var point = new BMap.Point(x1, y1);
                    var px = map.pointToOverlayPixel(point);
                    //create all stars
                    var s = new Star({
                        id: id,
                        x: px.x - py.x,
                        y: px.y - py.y,
                        size: 3 + Math.random() * 3,
                        linename: starlinename,
                        time: startime,
                        stop: clickstation,
                        name: starname,
                       // num: starnum - clickstationnum + 1,
                        num:clickstationnum-stationnum,
                        lng: x1,
                        lat: y1,
                        speed: speed,
                        searchstation:clickstation,//查询的站点
                        //  nextstation: selectedStations[stationscount - starnum],//下一个站点的位置
                        // routenum: selectedStations[stationscount - starnum-1].num  //当前站点的位置
                        nextstation: selectedStations[stationnum + 1], //下一个站点的位置
                        routenum: selectedStations[stationnum].num  //当前站点的位置
                    });

                    //判断是否为stars数组内已有点
                    if (stars.length == 0) {
                        stars.push(s);
                    }
                    else {
                        var isSameTimeSation = false; //判断是否为同一个时刻同一辆公交车，如果为true则不添加，为false则表示新产生的公交数据（if为同一辆公交车，时间不同则更新前一时刻的公交数据）

                        for (var j = 0; j < stars.length; j++) {
                            if (id == stars[j].id && startime == stars[j].time) {
                            
                                isSameTimeSation = true;
                                var routenum = stars[j].routenum;
                                var starlushu = stars[j].lushu;
                                var stay = stars[j].stay;
                                stars[j] = s;
                                stars[j].routenum = routenum;
                                stars[j].stay = stay;
                                stars[j].lushu = starlushu;
                                break;
                            }
                            if (id == stars[j].id && startime != stars[j].time) {
                                
                                isSameTimeSation = true;
                                //var routenum = stars[j].routenum;
                                var starlushu = stars[j].lushu;
                                stars[j] = s;
                                stars[j].stay = true;
                                // stars[j].routenum = routenum;
                                stars[j].lushu = starlushu;
                                break;
                            }


                        }
                        if (isSameTimeSation == false) {
                            stars.push(s);
                        }
                    }
                }
            }

        }
        canvas.style.left = py.x + "px";
        canvas.style.top = py.y + "px";
        renderAction();
    }


} else {
    alert('请在chrome、safari、IE8+以上浏览器使用');
}

/**
* 将字符串中的数字替换为汉字形式
* @param {String} str待处理的字符串
* @return 返回转换后的字符串
*/
var convertNumberToChinese = function (str) {
    return str.replace(/[0-9]/ig, function (word) {
        var num = word;
        var N = [ "零", "一", "二", "三", "四", "五", "六", "七", "八", "九"];
        var str = num.toString();
        var len = num.toString().length;
        var C_Num = [];
        for (var i = 0; i < len; i++) {
            C_Num.push(N[str.charAt(i)]);
        }
        return C_Num.join('');
    });
}



/**
* 字符串匹配度计算
* @param {String} x 字符串1
* @param {String} y 字符串2
* @return 返回匹配度百分比.
*/
function compare(x, y) {

    x = x.split("(")[0].split("（")[0].split(" ")[0].split("");
    y = y.split("(")[0].split("（")[0].split(" ")[0].split("");
    var z = 0;
    var s = x.length + y.length; ;

    x.sort();
    y.sort();
    var a = x.shift();
    var b = y.shift();

    while (a !== undefined && b !== undefined) {
        if (a === b) {
            z++;
            a = x.shift();
            b = y.shift();
        } else if (a < b) {
            a = x.shift();
        } else if (a > b) {
            b = y.shift();
        }
    }
    return z / s * 200;
}

/**
* 计算前n分钟的时间
* @param {Date} date 当前时刻
* @param {Number} minutes 分钟值
* @return 返回当前时刻前minutes的时刻
*/
function desendMinutes(date, minutes) {
    minutes = parseInt(minutes);
    var interTimes = minutes * 60 * 1000;
    interTimes = parseInt(interTimes);
    return new Date(Date.parse(date) - interTimes);
}

//获取鼠标位置
function getEventPosition(ev) {
    var x, y;
    if (ev.layerX || ev.layerX == 0) {
      x = ev.layerX;
      y = ev.layerY;
    } else if (ev.offsetX || ev.offsetX == 0) { // Opera
       x = ev.offsetX;
       y = ev.offsetY;
    }
    return { x: x, y: y };
}
//地图风格
 var blackmapstyle=[
          {
              //陆地
              "featureType": "land",
              "elementType": "geometry",
              "stylers": {
                  "color": "#01090F"
              }
          },
          {
              //建筑
              "featureType": "building",
              "elementType": "geometry",
              "stylers": {
                  "color": "#01090F"
              }
          },
          {
              //高速公路
              "featureType": "highway",
              "elementType": "all",
              "stylers": {
                  "lightness": -42,
                  "saturation": -91,
                  "color": "#000000"
              }
          },
          {
              //主干道
              "featureType": "arterial",
              "elementType": "geometry",
              "stylers": {
                  "lightness": -77,
                  "saturation": -94,
                  "color": "#000000"
              }
          },
          {
              //公园绿地
              "featureType": "green",
              "elementType": "geometry",
              "stylers": {
                  "color": "#01090F"
              }
          },
          {
              "featureType": "water",
              "elementType": "geometry",
              "stylers": {
                  "color": "#002847"
              }
          },
          {
              "featureType": "subway",
              "elementType": "geometry.stroke",
              "stylers": {
                  "color": "#08101C"
              }
          },
          {
              "featureType": "railway",
              "elementType": "geometry",
              "stylers": {
                  "lightness": -52
              }
          },
          {
              "featureType": "all",
              "elementType": "labels.text.stroke",
              "stylers": {
                  "color": "#313131"
              }
          },
          {
              "featureType": "all",
              "elementType": "labels.text.fill",
              "stylers": {
                  "color": "#8b8787"
              }
          },
          {
              //人工造地
              "featureType": "manmade",
              "elementType": "geometry",
              "stylers": {
                  "color": "#01090F"
              }
          },
          {
              "featureType": "local",
              "elementType": "geometry",
              "stylers": {
                  "lightness": -75,
                  "saturation": -91
              }
          },
          {
              "featureType": "subway",
              "elementType": "geometry",
              "stylers": {
                  "lightness": -65
              }
          },
          {
              "featureType": "railway",
              "elementType": "all",
              "stylers": {
                  "lightness": -40
              }
          },
          {
              //普通道路
              "featureType": "local",
              "elementType": "geometry",
              "stylers": {
                  "color": "#000000",
                  "weight": "1",
                  "lightness": -29
              }
          }];
