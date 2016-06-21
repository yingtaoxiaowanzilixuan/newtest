<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>i4Bus</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <!--弹出页面上的按钮-->
    <link href="../../css/button.css" rel="stylesheet" type="text/css" />
    <link href="../../css/RiqiStyle.css" rel="stylesheet" type="text/css" />
    <link href="../../css/style2.css" rel="stylesheet" type="text/css" />
    <link href="../../css/style3.css" rel="stylesheet" type="text/css" />
    <link href="../../css/styleOnOff.css" rel="stylesheet" type="text/css" />
    <!-- 弹出页面布局-->
    <style>
        .anchorBL
        {
            display: none;
        }
        *
        {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }
        
        a, img
        {
            border: none;
        }
        
        .zx_slider
        {
            position: relative;
            margin: 20px auto 0 auto;
            width: 90%;
            height: 80%;
            overflow: hidden;
            border-radius: 5px;
            background: -ms-linear-gradient(top, #cccccc 0%, #f5f5f5f 100%);
        }
        .zx_slider .imgbox
        {
            width: 3750px;
            height: 270px;
            position: absolute;
            left: 5px;
            margin-top: 0px;
        }
        
        
        .zx_slider .lbtn
        {
            cursor: pointer;
            width: 45px;
            height: 55px;
            position: absolute;
            left: 180px;
            bottom: 10px;
            background: url(img/slider_l_btn.png);
            _background: none;
            filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src="img/slider_l_btn.png");
        }
        .zx_slider .rbtn
        {
            cursor: pointer;
            width: 45px;
            height: 55px;
            position: absolute;
            left: 670px;
            bottom: 10px;
            background: url(img/slider_r_btn.png);
            _background: none;
            filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src="img/slider_r_btn.png");
        }
        .zx_slider .btnbox
        {
            width: 100%;
            height: 10%;
            position: absolute;
            left: 230px;
            bottom: 30px;
        }
        .zx_slider .btnbox a
        {
            cursor: pointer;
            display: inline-block;
            float: left;
            width: 126px;
            height: 54px;
            margin: 0 10px 0 10px;
        }
        .zx_slider .btnbox a img
        {
            position: relative;
            display: inline;
            width: 120px;
            height: 80px;
            float: left;
            border: 3px solid #392101;
            border-radius: 2px;
        }
        .zx_slider .btnbox a .img_hover
        {
            border: 3px solid #e4471f;
            border-radius: 2px;
        }
        .zx_slider .slider_p
        {
            overflow: hidden;
            width: 220px;
            height: 500px;
            position: absolute;
            right: 3px;
            top: -50px;
        }
        
        .zx_slider .slider_p h3
        {
            margin: 90px 0 15px 0;
            font-size: 18px;
            text-align: center;
            color: #faf8d5;
        }
        
        
        .zx_slider .slider_p h3 strong
        {
            color:white; 
            font-size: 24px;
            letter-spacing: 2px;
        }
        
        .zx_slider .slider_p p
        {
            line-height: 26px;
            font-size: 20px;
            color: black;
            margin-left: 3px;
            text-align: justify;
        }
        .hi_btn
        {
            width: 740px;
            height: 330px;
            position: absolute;
            left: 0px;
            top: 0px;
            display: block;
        }
        
        
        
        /*热力图*/
        span[class*='shijianzhou']
        {
            float: left;
            font-size: 1.1em;
            font-weight: bold;
            width: 4%;
            text-align: center;
            text-shadow: 1px 0 0 rgba(0,0,0,0.8);
            color: #ffffff;
        }
        .shijianzhou2, .shijianzhou3
        {
            margin-left: 11%;
        }
        
        .shijianzhou4, .shijianzhou5, .shijianzhou6, .shijianzhou7
        {
            margin-left: 13%;
        }
        
        .shijianzhou1
        {
            margin-left: 3%;
        }
        .shijianzhou12
        {
            margin-left: 2%;
        }
        .time-panel
        {
            overflow: hidden;
            margin-top: 1%;
            width: 100%;
            position: relative;
        }
        .time-panel span
        {
            width: 1%;
            font-size: 0.8em;
            line-height: 12px;
            font-weight: normal;
        }
        .time-panels span
        {
            width: 1%;
            line-height: 10px;
            font-weight: normal;
        }
        .ranges
        {
            box-shadow: 1px 1px 2px rgba(0,0,0,0.8);
            width: 90%;
            margin-left: 1%;
            margin-top: 1%;
        }
        /*道路拥堵状况说明等级*/
        .map_description
        {
            position: absolute;
            display: block;
            right: 30px;
            bottom: 4px;
            z-index: 999;
            background: #202838;
            border-radius: 10px; /*background: -ms-linear-gradient(top, #99CCCC 0%, #669999 100%);*/
            box-shadow: 3px 3px 3px rgba(0,0,0,0.8);
            opacity: 0.8;
            border-top: #dede00 solid 3px;
        }
        .map_description span
        {
            display: block;
            color: #ffffff;
            margin: 2px 10px 5px 6px;
            font-size: 13px;
            text-align: center;
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
            background-color: #F27064;
        }
        .map_description p i.map_level_bg4
        {
            background-color: #BB0000;
        }
        .map_description2
        {         
            display: block;           
            z-index: 999;
            background: #202838;
            border-radius: 10px; /*background: -ms-linear-gradient(top, #99CCCC 0%, #669999 100%);*/
            box-shadow: 3px 3px 3px rgba(0,0,0,0.8);
            opacity: 0.8;
            border-top: #dede00 solid 3px;
        }
        .map_description2 span
        {
            display: block;
            color: #ffffff;
            margin: 2px 10px 5px 6px;
            font-size: 13px;
            text-align: center;
        }
        .map_description2 p
        {
            float: left;
            display: inline;
            margin: 0px 2px;
        }
        .map_description2 p i
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
        .map_description2 p i.map_level_bg12
        {
            background-color: #50bb35;
        }
        .map_description2 p i.map_level_bg22
        {
            background-color: #d4d000;
        }
        .map_description2 p i.map_level_bg32
        {
            background-color: #ff8000;
        }
        .map_description2 p i.map_level_bg42
        {
            background-color: #ff3300;
        }
        .map_description2 p i.map_level_bg52
        {
            background-color: #ff0000;
        }
        
        /*week边框*/
        .img_week
        {
            width: 200px;
            height: 150px;
            text-align: center;
        }
        
        .Monday
        {
            width: 40px;
            height: 40px;
            background: url(img/week.png) no-repeat;
            display: inline-block;
            transition: 0.5s all;
            -webkit-transition: 0.5s all;
            -moz-transition: 0.5s all;
            -o-transition: 0.5s all;
            -ms-transition: 0.5s all;
            background-position: 0px 0px;
            margin-top: 2px;
        }
        .Monday:hover
        {
            background-position: -40px 0px;
        }
        
        .Tuesday
        {
            width: 40px;
            height: 40px;
            background: url(img/week.png) no-repeat;
            display: inline-block;
            transition: 0.5s all;
            -webkit-transition: 0.5s all;
            -moz-transition: 0.5s all;
            -o-transition: 0.5s all;
            -ms-transition: 0.5s all;
            background-position: -82px 0px;
            margin-top: 2px;
        }
        
        .Tuesday:hover
        {
            background-position: -122px 0px;
        }
        
        
        .Wednesday
        {
            width: 40px;
            height: 40px;
            background: url(img/week.png) no-repeat;
            display: inline-block;
            transition: 0.5s all;
            -webkit-transition: 0.5s all;
            -moz-transition: 0.5s all;
            -o-transition: 0.5s all;
            -ms-transition: 0.5s all;
            background-position: -162px 0px;
            margin-top: 2px;
        }
        
        .Wednesday:hover
        {
            background-position: -202px 0px;
        }
        
        
        
        .Thursday
        {
            width: 40px;
            height: 40px;
            background: url(img/week.png) no-repeat;
            display: inline-block;
            transition: 0.5s all;
            -webkit-transition: 0.5s all;
            -moz-transition: 0.5s all;
            -o-transition: 0.5s all;
            -ms-transition: 0.5s all;
            background-position: -242px 0px;
            margin-top: 2px;
        }
        
        .Thursday:hover
        {
            background-position: -282px 0px;
        }
        
        
        .Friday
        {
            width: 40px;
            height: 40px;
            background: url(img/week.png) no-repeat;
            display: inline-block;
            transition: 0.5s all;
            -webkit-transition: 0.5s all;
            -moz-transition: 0.5s all;
            -o-transition: 0.5s all;
            -ms-transition: 0.5s all;
            background-position: -324px 0px;
            margin-top: 2px;
        }
        
        .Friday:hover
        {
            background-position: -364px 0px;
        }
        .Saturday
        {
            width: 40px;
            height: 40px;
            background: url(img/week.png) no-repeat;
            display: inline-block;
            transition: 0.5s all;
            -webkit-transition: 0.5s all;
            -moz-transition: 0.5s all;
            -o-transition: 0.5s all;
            -ms-transition: 0.5s all;
            background-position: -404px 0px;
            margin-top: 2px;
        }
        
        .Saturday:hover
        {
            background-position: -444px 0px;
        }
        .Sunday
        {
            width: 40px;
            height: 40px;
            background: url(img/week.png) no-repeat;
            display: inline-block;
            transition: 0.5s all;
            -webkit-transition: 0.5s all;
            -moz-transition: 0.5s all;
            -o-transition: 0.5s all;
            -ms-transition: 0.5s all;
            background-position: -484px 0px;
            margin-top: 2px;
        }
        
        .Sunday:hover
        {
            background-position: -524px 0px;
        }
        
        
        
        strong
        {
            color:white;
            font-size: 1.2em;
            letter-spacing: 3px;
        }
        
        
        
        p
        {
            font-size: 20px;
            margin: 15px 0 20px;
            line-height: 2em;
        }
        
        li
        {
            font-size: 20px;
            color: Yellow;
        }
        li a:hover
        {
            background-color: #f4d03f;
        }
        h3
        {
            margin-top: 30px;
        }
        
        
        .map_condition_level 
        {
            width:180px;
            height:22px;
           
            background:-ms-linear-gradient(left, cyan 0%,lime 20%,yellow 60%, red 100%);
            
        }
    </style>
    <!--  百度地图-->
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=WnU9QFnCiia4g97i86hqPBWG"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>
    <script src="../../Scripts/Mapv.js" type="text/javascript"></script>
    <!--jquerymobile-->
    <script src="../../Scripts/jquery.1.11.1.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../../fonts/font-awesome/css/font-awesome.css">
    <!-- Slider
    ================================================== -->
    <link href="../../css/owl.carousel.css" rel="stylesheet" media="screen">
    <link href="../../css/owl.theme.css" rel="stylesheet" media="screen">
    <!-- Stylesheet
    ================================================== -->
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/prettyPhoto.css">
    <link href='http://fonts.useso.com/css?family=Lato:400,700,900,300' rel='stylesheet'
        type='text/css'>
    <link href='http://fonts.useso.com/css?family=Open+Sans:400,700,800,600,300' rel='stylesheet'
        type='text/css'>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
    <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top"><span style="font-size: 1.5em;">
                    首页</span> </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden"><a href="#page-top"></a></li>
                    <li><a href="#services" style="font-size: 1.1em;">实时公交</a> </li>
                    <li><a href="#works" style="font-size: 1.1em;">公交路况分析</a> </li>
                    <li><a href="#about" style="font-size: 1.1em;">公交客流量分析</a> </li>
                    <li><a href="#contact" style="font-size: 1.1em;">联系我们</a> </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <!-- Header -->
    <header class="intro effect2">
        <div class="intro-body" style="width: 100%; height: 100%;">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h1 class="hh" style="position: relative; top: -30px;">
                            We are <span class="brand-heading"><span style="text-transform: lowercase;">i</span><span
                                style="text-transform: capitalize;">4Bus</span></span></h1>
                        <p class="intro-text">
                            A Big Data Mining and Visualization Platform</p>
                        <%-- <p id="us"style="margin-top:-20px;">
                            <span style="font-size: 1.5em;">MIT</span><span style="text-transform:capitalize;">-mobile</span><span style="text-transform:uppercase;">gis</span></p>--%>
                        <a href="#services" class="btn btn-circle page-scroll"><i id="ii" class="fa fa-angle-double-down animated"
                            style="margin-top: -20px;"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-md-offset-2" style="width: 80%; height: 10%; margin-left: 10%;">
                <div class="stackone">
                    <img src="../../img/bg/bus.png" alt="">
                </div>
                <div class="stacktwo">
                    <img src="../../img/bg/kk3.jpg" alt="">
                </div>
                <div class="stackthree">
                    <img src="../../img/bg/kk5.jpg" alt="">
                </div>
                <div class="stackfour">
                    <img src="../../img/bg/kk6.jpg" alt="">
                </div>
            </div>
        </div>
    </header>
    <!-- Services Section -->
    <div id="services" class="text-center effect2">
        <div style="width: 100%; height: 100%;">
            <div class="row" style="width: 80%; height: 95%">
                <div class="col-md-8 col-md-offset-2" style="width: 100%; height: 100%">
                    <iframe id="Iframe1" src="../../Index.html" style="width: 100%; height: 100%"></iframe>
                </div>
            </div>
        </div>
    </div>
    <%--弹出界面--%>
    <div id="condition-one" class="tanchuceng">
        <div class="anniu">
            <label class="button">
                <input type="checkbox" id="btn_sel" checked /><span></span><span></span></label>
        </div>
        <div id="tongjitu1" class="zx_slider">
            <div class="imgbox">
                <div id="imgbox0" style="width: 900px; height: 400px; position: relative; top: 20px;
                    display: inline-block; visibility: visible;">
                </div>
                <div id="imgbox1" style="width: 900px; height: 400px; display: inline-block; visibility: hidden;">
                </div>
                <div id="imgbox2" style="width: 900px; height: 400px; display: inline-block; visibility: hidden;">
                </div>
            </div>
            <div class="btnbox">
                <a onclick="btn_m_over(0)">
                    <img alt="Danx" id="btn_img0" class="thumb img_hover" src="../../img/zhxt3.png" /></a>
                <a onclick="btn_m_over(1)">
                    <img alt="Danx" id="btn_img1" class="thumb" src="../../img/zhuzh1.png" /></a>
                <a onclick="btn_m_over(2)">
                    <img alt="Danx" id="btn_img2" class="thumb" src="../../img/bzh1.png" /></a>
            </div>
            <div class="lbtn">
            </div>
            <div class="rbtn">
            </div>
            <div class="slider_p">
                <div id="slider_p0" class="slider_p_div">
                    <h3>
                        <strong>四大城区平均行程速度</strong></h3>
                    <p>
                        四个城区平均行程速度依次增大，市北区交通状况最差，崂山区最好。在工作日，四大城区均有明显的早晚高峰，出现在早上8：00及晚上18：00左右；而在非工作日，早晚高峰现象不明显。</p>
                    <div class="navs">
                        <%--   <div class="btn page-scroll" style="font-size:30px;color:#faf6a8"  id="btn_week"><i class="fa fa-angle-double-down animated"></i></div>--%>
                    </div>
                    <div class="img_week" style="display: block;" id="img_week">
                        <span class="Monday"></span><span class="Tuesday"></span><span class="Wednesday">
                        </span><span class="Thursday"></span><span class="Friday"></span><span class="Saturday">
                        </span><span class="Sunday"></span>
                    </div>
                </div>
                <div id="slider_p1" class="slider_p_div">
                    <h3>
                        <strong>早晚高峰变化对比</strong></h3>
                    <p>
                        k线图表示公交平均行程速度一周变化趋势，由周一、周五、一周最小、一周最大平均行程速度四个变量绘制而成。红色实体表示平均行程速度周一高于周五，蓝色实体反之。四个城区中，早高峰时周一拥堵严重，晚高峰周五拥堵严重。</p>
                    <div class="navs">
                        <%--  <div class="btn page-scroll" style="font-size:30px;color:#faf6a8"  id="btn_two"><i class="fa fa-angle-double-down animated"></i></div>--%>
                    </div>
                    <div class="button_box" style="display: block;" id="img_area">
                        <a class="button_link" id="style3Shinan">市南区 <span class="line line_top"></span><span
                            class="line line_right"></span><span class="line line_bottom"></span><span class="line line_left">
                            </span></a><a class="button_link" id="style3Shibei">市北区 <span class="line line_top">
                            </span><span class="line line_right"></span><span class="line line_bottom"></span><span
                                class="line line_left"></span></a><a class="button_link" id="style3Licang">李沧区 <span
                                    class="line line_top"></span><span class="line line_right"></span><span class="line line_bottom">
                                    </span><span class="line line_left"></span></a><a class="button_link" id="style3Laoshan">
                                        崂山区 <span class="line line_top"></span><span class="line line_right"></span><span
                                            class="line line_bottom"></span><span class="line line_left"></span>
                        </a>
                    </div>
                </div>
                <div id="slider_p2" class="slider_p_div">
                    <h3>
                        <strong>五大商圈交通状况占比</strong>
                    </h3>
                    <p>
                        台东受限于老城区的道路布局导致交通状况堪忧；香港中路商圈中商业体主要集中在交通线路的端头、尽端，受车辆、道路条件影响较小，故交通状况稍好。</p>
                    <div class="navs">
                        <%--  <div class="btn page-scroll" style="font-size:30px;color:#faf6a8"  id="btn_area"><i class="fa fa-angle-double-down animated"></i></div>--%>
                    </div>
                    <div class="containers" style="display: block;" id="Div1">
                        <div class="toggles" id="week">
                            <input type="checkbox">
                            <span class="labels">工作日</span>
                        </div>
                        <div class="toggles" id="weekend">
                            <input type="checkbox" checked>
                            <span class="labels">非工作日</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--地图--%>
        <div id="ditu" style="width: 100%; height: 89%; display: none;">
            <div id="xianlu2" style="width: 100%; height: 100%; margin: 0 0 auto 0;">
                <div id="dituzitu" style="height: 100%; width: 100%;">
                </div>
                <div style="position: absolute; background: #555; opacity: 0.5; top: 70px; left: 5px;
                    width: 18%; height: auto; z-index: 999; border-radius: 20px; box-shadow: 2px 2px 4px rgba(0,0,0,0.8);">
                    <span style="font-weight: bold; font-size: 1.2em; line-height: 40px; margin-left: 20px;">
                        青岛市公交线路拥堵状况</span>
                </div>
               <div class="map_description2" style="width:200px;height:80px;font-Weight:bold;font-Size:large;position:relative;bottom:100px;left:1050px;" >
                    <span>公交路况</span>
                    <div class="clear">
                    </div>
                    <p>
                       <i class="map_condition_level" style="width:190px;"></i>
                        <i style="position:relative;left:-10px;font-Weight:bold">畅通</i><i style="position:relative;right:-90px;font-Weight:bold">拥堵</i>
                        
                    </p>
                </div>
            </div>
        </div>
    </div>
    <!--zx_slider end-->
    <div id="condition-two" class="tanchuceng">
        <iframe id="Iframe2" src="../../roadCondition.html" width="100%" height="100%"></iframe>
    </div>
    <!-- Portfolio Section -->
    <div id="works" class="works effect2">
        <div class="container" style="position: relative; top: -75px;">
            <!-- Container -->
            <div class="section-title text-center center">
                <h2>
                    <strong>路况信息</strong> 可视化</h2>
                <hr>
                <p>
                    挖掘公共交通大数据，对公交路况进行可视化</p>
            </div>
            <div class="categories">
                <ul class="cat">
                    <li>
                        <ol class="type">
                            <li><a href="#" data-filter="*">折线图</a></li>
                            <li><a href="#" data-filter=".web">K线图</a></li>
                            <li><a href="#" data-filter=".app">饼状图</a></li>
                            <li><a href="#" data-filter=".branding">热力图</a></li>
                        </ol>
                    </li>
                </ul>
                <div class="clearfix">
                </div>
            </div>
            <div class="row">
                <div class="portfolio-items">
                    <div class="col-sm-6 col-md-3 col-lg-5 web">
                        <div class="portfolio-item" style="position: relative; left: 80px;">
                            <div class="hover-bg img-shadow">
                                <a title="公交线路路况" rel="prettyPhoto" id="btnShowOne">
                                    <div class="hover-text">
                                        <h4 style="margin-top: -40px;">
                                            公交线路路况</h4>
                                        <small>各条公交线路路况分析</small>
                                        <div class="clearfix">
                                        </div>
                                        <i class="fa fa-search"></i>
                                    </div>
                                    <img src="../../img/qiangtu2.png" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3 col-lg-5 web">
                        <div class="portfolio-item">
                            <div class="hover-bg img-shadow" style="position: relative; left: 140px;">
                                <a rel="城市区域路况" id="btnShowtwo">
                                    <div class="hover-text">
                                        <h4 style="margin-top: -40px;">
                                            城市区域路况</h4>
                                        <small>青岛市区域公交路况分析</small>
                                        <div class="clearfix">
                                        </div>
                                        <i class="fa fa-search"></i>
                                    </div>
                                    <img src="../../img/qiangtu3.png" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- About Section -->
    <%-- 乘客流动可视化弹出层--%>
    <div id="condition-three" class="tanchuceng">
        <div class="anniu">
            <label class="button">
                <input type="checkbox" id="btn_sel2" checked /><span></span><span></span></label>
        </div>
        <div id="tongjitu2" style="width: 1000px; height: 550px; margin: 0px auto 10px;">
        </div>
        <div id="ditu2" style="width: 100%; height: 550px; display: none; margin: 5px auto;">
            <div id="chengke" style="width: 100%; height: 100%; margin: 0 0;">
                <div style="position: absolute; background: #555; opacity: 0.5; top: 180px; width: 3%;
                    height: auto; z-index: 100; border-radius: 20px; padding: 10px 10px; box-shadow: 2px 2px 4px rgba(0,0,0,0.8);">
                    <span style="font-weight: bold; font-size: 1.2em; line-height: 10px; word-break: break-all;
                        letter-spacing: 1px;">青岛市公交线路站点客流量热图</span>
                </div>
                <div class="map_description2" id="map_description2" style="width:305px;height:60px;font-Weight:bold;font-Size:large;position:absolute;bottom:50px;left:960px;">
                    <span id="Span12">公交站点客流量</span>
                    <div class="clear">
                    </div>
                    <p>
                        <i class="map_level_bg12" href=""><20</i><i class="map_level_bg22" href="">20-30</i><i
                            class="map_level_bg32" href="">30-40</i><i class="map_level_bg42" href="">40-50</i><i
                                class="map_level_bg52" href="">>50 </i>
                    </p>
                </div>
                <div id="zhandian" style="height: 99%; width: 100%;">
                </div>
               <div id="r-result" style="width: 15%; position: absolute; top: 65px; left: -2px;
                    opacity: 0.8;">
                    <div class="ranges">
                        <input type="range" id="range" min="1" max="7" value="1" onchange="showHotmap(this.value)"></div>
                   <div class="time-panel">
                        <span class="shijianzhou1">周一</span> <span class="shijianzhou2">周二</span> <span class="shijianzhou3">
                            周三</span> <span class="shijianzhou4">周四</span> <span class="shijianzhou5">周五</span>
                        <span class="shijianzhou6">周六</span> <span class="shijianzhou6">周日</span>
                    </div>
                </div>
                <div id="hours" style="width: 85%; position: absolute; bottom: 0; right: 1px; opacity: 0.8;
                    color: #ffffff; float: right; height: 5%;">
                    <div style="float: right; width: 80%;">
                        <div style="width: 100%; float: right;">
                            <input type="range" style="width: 100%; box-shadow: 1px 1px 2px rgba(0,0,0,0.8);
                                opacity: 0.5;" min="5" max="20" value="5" onchange="showHotHour(this.value)">
                        </div>
                        <div class="time-panels" style="width: 100%; overflow: visible; float: left; opacity: 0.5;">
                            <span style="margin-left: 1%;">05:00</span> <span style="margin-left: 1%;">06:00</span>
                            <span style="margin-left: 1%;">07:00</span> <span style="margin-left: 1.5%;">08:00</span>
                            <span style="margin-left: 1.5%;">09:00</span> <span style="margin-left: 2%;">10:00</span>
                            <span style="margin-left: 2%;">11:00</span> <span style="margin-left: 2%;">12:00</span>
                            <span style="margin-left: 2%;">13:00</span> <span style="margin-left: 2.5%;">14:00</span>
                            <span style="margin-left: 2.5%;">15:00</span> <span style="margin-left: 2.5%;">16:00</span>
                            <span style="margin-left: 2%;">17:00</span> <span style="margin-left: 2%;">18:00</span>
                            <span style="margin-left: 1.5%;">19:00</span> <span style="margin-left: 0.5%;">20:00</span>
                        </div>
                    </div>
                    <div style="width: 9%; float: right; margin-right: 1%;">
                        <input id="xuanzeDate" type="text" placeholder="请选择日期" list="xuanze" style="width: 100%;
                            color: Black; opacity: 0.5;" />
                        <datalist id="xuanze" style="opacity: 0.5;">
                            <select id="hdata">
                                <option value="2015-10-11"></option>
                                <option value="2015-10-12"></option>
                                <option value="2015-10-13"></option>
                                <option value="2015-10-14"></option>
                                <option value="2015-10-15"></option>
                                <option value="2015-10-16"></option>
                                <option value="2015-10-17"></option>
                            </select>
                        </datalist>
                    </div>
                    <div style="width: 9%; margin-right: 1px; margin-bottom: 8%;">
                        <input id="busName" type="text" placeholder="请输入线路" value="125路" style="width: 100%; opacity: 0.5; 
                            color: Black;" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="condition-four" class="tanchuceng">
        <div id="xianlu" style="width: 100%; height: 100%; margin: 0 0 auto 0;">
            <div style="position: absolute; background: #555; opacity: 0.5; top: 2px; width: 20%;
                height: auto; z-index: 100; border-radius: 20px; box-shadow: 2px 2px 4px rgba(0,0,0,0.8);">
                <span style="font-weight: bold; font-size: 1.2em; line-height: 40px; margin-left: 15px;">
                    青岛市公交线路客流量情况</span>
            </div>
            <div class="map_description" id="map_description">
                <span id="updatetime">公交线路拥挤路况</span>
                <div class="clear">
                </div>
                <p>
                    <i class="map_level_bg1" href="">优</i><i class="map_level_bg2" href="">良</i><i class="map_level_bg3"
                        href="">中</i><i class="map_level_bg4" href="">差</i></p>
            </div>
            <div id="xianluyongji" style="height: 100%; width: 100%;">
            </div>
            <div style="float: left; position: absolute; width: 8%; bottom: 2px;">
                <input id="busline" style="opacity: 0.5; width: 100%; color: Black;" type="text" value="125路"
                    placeholder="请输入线路名" />
            </div>
            <div id="selSJ" style="position: absolute; width: 4%; bottom: 2px; left: 10%;">
                <select id="selT" onchange="passengerFlow(this.value)" style="opacity: 0.5;">
                    <option selected style="opacity: 0.5;">请选择时间</option>
                    <option value="2015-10-11">周日</option>
                    <option value="2015-10-12">周一</option>
                    <option value="2015-10-13">周二</option>
                    <option value="2015-10-14">周三</option>
                    <option value="2015-10-15">周四</option>
                    <option value="2015-10-16">周五</option>
                    <option value="2015-10-17">周六</option>
                </select>
            </div>
        </div>
    </div>
    <div id="condition-five" class="tanchuceng">
        <div id="areaflow" style="width: 100%; height: 100%; margin: 0 0 auto 0;">
            <div style="position: absolute; background: #555; opacity: 0.5; top: 2px; width: 20%;
                height: auto; z-index: 100; border-radius: 20px; box-shadow: 2px 2px 4px rgba(0,0,0,0.8);">
                <span style="font-weight: bold; font-size: 1.2em; margin-left: 15px; line-height: 40px;">
                    青岛市区域站点客流量热图</span>
            </div>
            <div id="allstation" style="height: 100%; width: 100%;">
            </div>          
            <div id="hour2" style="width: 85%; position: absolute; bottom: 0; right: 1px; opacity: 0.8;
                color: #ffffff; float: right; height: 5%;">
                <div style="float: right; width: 80%;">
                    <div style="width: 100%; float: right;">
                        <input type="range" style="width: 100%; box-shadow: 1px 1px 2px rgba(0,0,0,0.8);
                            opacity: 0.5;" min="5" max="20" value="5" onchange="allstationMap(this.value)">
                    </div>
                    <div class="time-panels" style="width: 100%; overflow: visible; float: left; opacity: 0.5;">
                        <span style="margin-left: 1%;">05:00</span> <span style="margin-left: 1%;">06:00</span>
                        <span style="margin-left: 1%;">07:00</span> <span style="margin-left: 1.5%;">08:00</span>
                        <span style="margin-left: 1.5%;">09:00</span> <span style="margin-left: 2%;">10:00</span>
                        <span style="margin-left: 2%;">11:00</span> <span style="margin-left: 2%;">12:00</span>
                        <span style="margin-left: 2%;">13:00</span> <span style="margin-left: 2.5%;">14:00</span>
                        <span style="margin-left: 2.5%;">15:00</span> <span style="margin-left: 2.5%;">16:00</span>
                        <span style="margin-left: 2%;">17:00</span> <span style="margin-left: 2%;">18:00</span>
                        <span style="margin-left: 1.5%;">19:00</span> <span style="margin-left: 0.5%;">20:00</span>
                    </div>
                </div>
                <div style="width: 9%; float: right; margin-right: 1%;">
                    <input id="xuanzeriqi" type="text" placeholder="请选择日期" list="Datalist1" style="width: 100%;
                        color: Black; opacity: 0.5;" />
                    <datalist id="Datalist1" style="opacity: 0.5;">
                        <select id="Select1">
                         <option selected style="opacity: 0.5;">请选择时间</option>
                            <option value="2015-10-11">周日</option>
                            <option value="2015-10-12">周一</option>
                            <option value="2015-10-13">周二</option>
                            <option value="2015-10-14">周三</option>
                            <option value="2015-10-15">周四</option>
                            <option value="2015-10-16">周五</option>
                            <option value="2015-10-17">周六</option>
                        </select>
                    </datalist>
                </div>
            </div>
        </div>
    </div>

    <div id="condition-six" class="tanchuceng" >
        <div id="stationflowsimilation" style="width: 100%; height: 100%; margin: 0 0 auto 0;position:relative;">                  
      <input type=button value="单站" onclick="addmapSingleStation()" style=" background:linear-gradient(top, #336666 0%, #339999 100%);opacity: 0.5; top: 2px; width: 5%;
                box-shadow: 2px 2px 4px rgba(0,0,0,0.8); height: auto;  border-radius: 20px; margin-left:47.5%" />
           
             <div id="allstation2" style="height: 95%; width: 100%;"></div>
            <div id="hour6" style="width: 85%; position: absolute; bottom: 10px; right: 1px;
                color: #ffffff; float: right; height: 5%;z-index:3;opcity:0.8;">
                <div style="float: right; width: 80%;">
                    <div style="width: 100%; float: right;">
                     <input type="range" id="Range2" style="width: 100%; box-shadow: 1px 1px 2px rgba(0,0,0,0.8);
                            opacity: 0.5;" min="5" max="21" value="5">
                    </div>
                   <div class="time-panels" style="width: 100%; overflow: visible; float: left; opacity: 0.5;">
                        <span style="margin-left: 1%;">05:00</span> <span style="margin-left: 1%;">06:00</span>
                        <span style="margin-left: 1%;">07:00</span> <span style="margin-left: 1.5%;">08:00</span>
                        <span style="margin-left: 1.5%;">09:00</span> <span style="margin-left: 2%;">10:00</span>
                        <span style="margin-left: 2%;">11:00</span> <span style="margin-left: 2%;">12:00</span>
                        <span style="margin-left: 2%;">13:00</span> <span style="margin-left: 2.5%;">14:00</span>
                        <span style="margin-left: 2.5%;">15:00</span> <span style="margin-left: 2.5%;">16:00</span>
                        <span style="margin-left: 2%;">17:00</span> <span style="margin-left: 2%;">18:00</span>
                        <span style="margin-left: 1.5%;">19:00</span> <span style="margin-left: 0.5%;">20:00</span>
                    </div>
               </div>
                <div style="width: 9%; float: right; margin-right: 1%;">
                    <input id="selectArrow" type="text" placeholder="请选择日期" list="selArrow" style="width: 100%;
                        color: Black; opacity: 0.5;" />
                    <datalist id="selArrow" style="opacity: 0.5;">
                        <select id="Select6">
                            <option value="2015-10-11">周日</option>
                            <option value="2015-10-12">周一</option>
                           
                        </select>
                    </datalist>
                </div>
            </div>
           
        </div>
    </div>

    

    <!-- About Section -->
    <div id="about" class="about effect2">
        <div class="container">
            <div class="section-title text-center center">
                <h2>
                    <strong>公交客流量</strong> 可视化</h2>
                <hr>
                <div class="clearfix">
                </div>
                <p>
                    探索乘客出行链，计算公交车乘客拥挤度</p>
            </div>
            <div class="categories">
                <ul class="cat">
                    <li>
                        <ol class="type">
                            <li><a href="#" data-filter="*" class="active">折线图</a></li>
                            <li><a href="#" data-filter=".web">热力图</a></li>
                        </ol>
                    </li>
                </ul>
                <div class="clearfix">
                </div>
            </div>
            <div class="row">
                <div class="portfolio-items">
                    <div class="col-sm-6 col-md-2 col-lg-3 web">
                        <div class="portfolio-item" style="position: relative; left: -10px;">
                            <div class="hover-bg img-shadow">
                                <a title="公交站点客流量" rel="prettyPhoto" id="btnshowthree">
                                    <div class="hover-text">
                                        <h4>
                                            公交站点客流量</h4>
                                        <small>各个公交站点客流量统计分析</small>
                                        <div class="clearfix">
                                        </div>
                                        <i class="fa fa-search"></i>
                                    </div>
                                    <img src="../../img/bingtu.jpg" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-2 col-lg-3 web">
                        <div class="portfolio-item">
                            <div class="hover-bg img-shadow">
                                <a title="公交线路客流量" rel="prettyPhoto" id="btnshowfour">
                                    <div class="hover-text">
                                        <h4>
                                            公交线路客流量</h4>
                                        <small>各条公交线路客流量统计分析</small>
                                        <div class="clearfix">
                                        </div>
                                        <i class="fa fa-search"></i>
                                    </div>
                                    <img src="../../img/retu2.jpg" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-2 col-lg-3 web">
                        <div class="portfolio-item" style="position: relative; right: -10px;">
                            <div class="hover-bg img-shadow">
                                <a title="城市区域客流量" rel="prettyPhoto" id="btnshowfive">
                                    <div class="hover-text">
                                        <h4>
                                            城市区域客流量</h4>
                                        <small>青岛市区域客流量统计分析</small>
                                        <div class="clearfix">
                                        </div>
                                        <i class="fa fa-search"></i>
                                    </div>
                                    <img src="../../img/kk4.jpg" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>

                          <div class="col-sm-6 col-md-2 col-lg-3 web">
                        <div class="portfolio-item" style="position: relative; right: -10px;">
                            <div class="hover-bg img-shadow">
                                <a title="城市区域客流量" rel="prettyPhoto" id="btnStationFlow">
                                    <div class="hover-text">
                                        <h4>
                                            站间客流模拟</h4>
                                        <small>站间客流流向模拟</small>
                                        <div class="clearfix">
                                        </div>
                                        <i class="fa fa-search"></i>
                                    </div>
                                    <img src="../../img/stationflow.png" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
      <div id="condition-seven" class="tanchuceng" >
        <div id="wholeCityStatic" style="width: 100%; height: 100%; margin: 0 0 auto 0;">                  
           <input type=button value="全市动态" onclick="addmap()" style="  background:linear-gradient(top, #36455b 0%, #283446 100%);opacity: 0.5; top: 2px; width: 5%;
                box-shadow: 2px 2px 4px rgba(0,0,0,0.8); height: auto; border-radius: 20px; margin-left:47.5%" />
                       
             <div id="wholeCityD" style="height: 95%; width: 100%;"></div>
            <div id="hourD" style="width: 85%; position: absolute; bottom: 10px; right: 1px;
                color: #ffffff; float: right; height: 5%;">
                <div style="float: right; width: 80%;">
                    <div style="width: 100%; float: right;">
                    <input type="range"id="Range1" style="width: 100%; box-shadow: 1px 1px 2px rgba(0,0,0,0.8);
                            opacity: 0.5;" min="5" max="21" value="5" onchange="showPassengerFlowss(this.value)">
                      
                    </div>
                    <div class="time-panels" style="width: 100%; overflow: visible; float: left; opacity: 0.5;">
                        <span style="margin-left: 1%;">05:00</span> <span style="margin-left: 1%;">06:00</span>
                        <span style="margin-left: 1%;">07:00</span> <span style="margin-left: 1.5%;">08:00</span>
                        <span style="margin-left: 1.5%;">09:00</span> <span style="margin-left: 2%;">10:00</span>
                        <span style="margin-left: 2%;">11:00</span> <span style="margin-left: 2%;">12:00</span>
                        <span style="margin-left: 2%;">13:00</span> <span style="margin-left: 2.5%;">14:00</span>
                        <span style="margin-left: 2.5%;">15:00</span> <span style="margin-left: 2.5%;">16:00</span>
                        <span style="margin-left: 2%;">17:00</span> <span style="margin-left: 2%;">18:00</span>
                        <span style="margin-left: 1.5%;">19:00</span> <span style="margin-left: 1%;">20:00</span>
                        <span style="margin-left: 1%;">21:00</span>
                    </div>
                </div>
                <div style="width: 9%; float: right; margin-right: 1%;">
                    <input id="selectArrowD" type="text" placeholder="请选择日期" list="selArrowD" style="width: 100%;
                        color: Black; opacity: 0.5;" />
                    <datalist id="selArrowD" style="opacity: 0.5;">
                        <select id="Select7">
                            <option value="2015-10-11">周日</option>
                            <option value="2015-10-12">周一</option>
                           
                        </select>
                    </datalist>
                </div>
            </div>
           
        </div>
    </div>

    <div id="condition-eight" class="tanchuceng" >
        <div id="wholeCityDynamic" style="width: 100%; height: 100%; margin: 0 0 auto 0;">                  
          
           <input type=button value="全市静态" onclick="addmapStatic()" style=" background:linear-gradient(top, #336666 0%, #339999 100%);opacity: 0.5; top: 2px; width: 5%;
                 box-shadow: 2px 2px 4px rgba(0,0,0,0.8);height: auto; border-radius: 20px;margin-left:47.5%" />                    
             <div id="wholeCityS" style="height: 95%; width: 100%;"></div>
            <div id="hourS" style="width: 85%; position: absolute; bottom: 10px; right: 1px;
                color: #ffffff; float: right; height: 5%;">
                <div style="float: right; width: 80%;">
                    <div style="width: 100%; float: right;">
                      <input type="range"id="staticvalue" style="width: 100%; box-shadow: 1px 1px 2px rgba(0,0,0,0.8);
                            opacity: 0.5;" min="5" max="21" value="5" onchange="showPassengerFlowS(this.value)">
                    </div>
                    <div class="time-panels" style="width: 100%; overflow: visible; float: left; opacity: 0.5;">
                        <span style="margin-left: 1%;">05:00</span> <span style="margin-left: 1%;">06:00</span>
                        <span style="margin-left: 1%;">07:00</span> <span style="margin-left: 1.5%;">08:00</span>
                        <span style="margin-left: 1.5%;">09:00</span> <span style="margin-left: 2%;">10:00</span>
                        <span style="margin-left: 2%;">11:00</span> <span style="margin-left: 2%;">12:00</span>
                        <span style="margin-left: 2%;">13:00</span> <span style="margin-left: 2.5%;">14:00</span>
                        <span style="margin-left: 2.5%;">15:00</span> <span style="margin-left: 2.5%;">16:00</span>
                        <span style="margin-left: 2%;">17:00</span> <span style="margin-left: 2%;">18:00</span>
                        <span style="margin-left: 1.5%;">19:00</span> <span style="margin-left: 1%;">20:00</span>
                        <span style="margin-left: 1%;">21:00</span>
                    </div>
                </div>
                <div style="width: 9%; float: right; margin-right: 1%;">
                    <input id="selectArrowS" type="text" placeholder="请选择日期" list="selArrowS" style="width: 100%;
                        color: Black; opacity: 0.5;" />
                    <datalist id="selArrowS" style="opacity: 0.5;">
                        <select id="Select8">
                            <option value="2015-10-11">周日</option>
                            <option value="2015-10-12">周一</option>
                           
                        </select>
                    </datalist>
                </div>
            </div>
           
        </div>
    </div>

    <!--可视化增加层-->
       <div id="workTwo" class="workTwo effect2">
        <div class="container">
            <!-- Container -->         
            <div class="row">
                <div class="portfolio-items">
                    <div class="col-sm-6 col-md-3 col-lg-5 web">
                        <div class="portfolio-item" style="position: relative; left: 80px;">
                            <div class="hover-bg img-shadow">
                                <a title="公交线路路况" rel="prettyPhoto" id="quanshiStatic">
                                    <div class="hover-text">
                                        <h4 style="margin-top: -40px;">
                                            公交线路路况</h4>
                                        <small>青岛市站间客流量</small>
                                        <div class="clearfix">
                                        </div>
                                        <i class="fa fa-search"></i>
                                    </div>
                                    <img src="../../img/quanshiDynamic.png" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3 col-lg-5 web">
                        <div class="portfolio-item">
                            <div class="hover-bg img-shadow" style="position: relative; left: 140px;">
                                <a rel="城市区域路况" id="quanshiDynamic">
                                    <div class="hover-text">
                                        <h4 style="margin-top: -40px;">
                                            城市区域路况</h4>
                                        <small>青岛市站间客流量</small>
                                        <div class="clearfix">
                                        </div>
                                        <i class="fa fa-search"></i>
                                    </div>
                                    <img src="../../img/quanshiStatic.jpg" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


 <!--可视化增加层-->
 

    <!-- Contact Section -->
    <div id="contact" class="text-center effect2">
        <div class="container">
            <div class="section-title center">
                <h2>
                    <strong>联系</strong> 我们</h2>
                <hr>
                <p>
                    如有问题,请用以下方式联系我们！
                </p>
            </div>
            <div class="col-md-8 col-md-offset-2">
                <div class="col-md-4">
                    <i class="fa fa-map-marker fa-2x"></i>
                    <p>
                        信院南楼A505</p>
                </div>
                <div class="col-md-4">
                    <i class="fa fa-envelope-o fa-2x"></i>
                    <p>
                        gaoman2014@163.com</p>
                </div>
                <div class="col-md-4">
                    <i class="fa fa-phone fa-2x"></i>
                    <p>
                        +157 2620 6191</p>
                </div>
                <hr>
                <div class="clearfix">
                </div>
            </div>
            <div class="col-md-8 col-md-offset-2">
                <hr>
                <h3>
                    留言</h3>
                <form name="sentMessage" id="contactForm" enctype="multipart/form-data" method="post"
                action="Main.aspx">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" id="name" class="form-control" placeholder="Name" required="required">
                            <p class="help-block text-danger">
                            </p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="email" id="email" class="form-control" placeholder="Email" required="required">
                            <p class="help-block text-danger">
                            </p>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <textarea name="message" id="message" class="form-control" rows="4" placeholder="Message"
                        required></textarea>
                    <p class="help-block text-danger">
                    </p>
                </div>
                <div id="success">
                </div>
                <input type="button" onclick="sub()" class="btn btn-default" style="margin-bottom: 5%;"
                    value="Send Message" />
                </form>
            </div>
        </div>
    </div>
    <nav id="footer">
        <div class="container">
            <div class="pull-left fnav">
                <p>
                    Copyright &copy; 2015 Marine Information Technology Lab</p>
            </div>
            <div class="pull-right fnav">
                <ul class="footer-social">
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../../Scripts/bootstrap.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../Scripts/contact_me.js" type="text/javascript"></script>
    <script src="../../Scripts/jqBootstrapValidation.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.1.11.1.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.counterup.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.isotope.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.prettyPhoto.js" type="text/javascript"></script>
    <script src="../../Scripts/doc/asset/js/jquery.min.js" type="text/javascript"></script>
    <script src="../../Scripts/doc/example/www/js/echarts.js" type="text/javascript"></script>
    <script src="../../Scripts/owl.carousel.js" type="text/javascript"></script>
    <script src="../../Scripts/SmoothScroll.js" type="text/javascript"></script>
    <script src="../../Scripts/waypoints.js" type="text/javascript"></script>
    <script src="../../Scripts/echarts-all.js" type="text/javascript"></script>
    <script src="../../Scripts/esl.js" type="text/javascript"></script>
    <script src="../../Scripts/map.js" type="text/javascript"></script>
    <script src="../../Scripts/zrender.js" type="text/javascript"></script>
    <script src="../../Scripts/placeList.js" type="text/javascript"></script>
    <!-- Javascripts
    ================================================== -->
    <%--<script src="../../Scripts/main.js" type="text/javascript"></script>--%>
    <script type="text/javascript">


        $(function () {
            $('#btnShowOne').click(function (event) {
                //取消事件冒泡  
                event.stopPropagation();
                //按钮的toggle,如果div是可见的,点击按钮切换为隐藏的;如果是隐藏的,切换为可见的。  
                $('#condition-one').toggle('slow');
            });
            $('#works').click(function (event) { $('#condition-one').slideUp('slow'); });

            $("#btnShowtwo").click(function (event) {
                event.stopPropagation();
                $("#condition-two").toggle('fast');
            });
            $("#works").click(function (event) {
                $("#condition-two").slideUp('fast');
            });

            $("#btnshowthree").click(function (event) {
                event.stopPropagation();
                $("#condition-three").toggle('slow');
            });
            $("#about").click(function (event) {
                $("#condition-three").slideUp('slow');
            });

            $("#btnshowfour").click(function (event) {
                event.stopPropagation();
                $("#condition-four").toggle('slow');
            });
            $("#about").click(function (event) {
                $("#condition-four").slideUp('slow');
            });

            $("#btnshowfive").click(function (event) {
                event.stopPropagation();
                $("#condition-five").toggle('slow');
            });
            $("#about").click(function (event) {
                $("#condition-five").slideUp('slow');
            });
            $("#btnStationFlow").click(function (event) {
                event.stopPropagation();
                $("#condition-six").toggle('slow');
            });

            $("#about").click(function (event) {
                $("#condition-six").slideUp('slow');
            });

         $("#quanshiStatic").click(function (event) {
                event.stopPropagation();
                $("#condition-eight").toggle('slow');
            });

            $("#workTwo").click(function (event) {
                $("#condition-eight").slideUp('slow');
            });

             $("#quanshiDynamic").click(function (event) {
                event.stopPropagation();
                $("#condition-seven").toggle('slow');
            });

            $("#workTwo").click(function (event) {
                $("#condition-seven").slideUp('slow');
            });
        });

       function  addmapSingleStation() {
    require.config({
        paths: {
            echarts: '../../Scripts/doc/example/www/js'
        },
        packages: [
            {
                name: 'BMap',
                location: '../../Scripts/src',
                main: 'main'
            }
        ]
    });

    require(
    [
        'echarts',
        'BMap',
        'echarts/chart/map'
    ],
    function (echarts, BMapExtension) {

        var BMapExt = new BMapExtension($('#allstation2')[0], BMap, echarts,{
            enableMapClick: false
        });
        var allStationsMapSF = BMapExt.getMap();
        allStationsMapSF.centerAndZoom(new BMap.Point(120.436212, 36.131032), 13); 
        allStationsMapSF.setCurrentCity("青岛");         
        allStationsMapSF.enableScrollWheelZoom(true); 
        // 地图自定义样式
        allStationsMapSF.setMapStyle({
            styleJson: [{
                featureType: 'water',
                elementType: 'all',
                stylers: {
                    color: '#044161'
                }
            }, {
                featureType: 'land',
                elementType: 'all',
                stylers: {
                    color: '#105E77'
                }
            }, {
                featureType: 'boundary',
                elementType: 'geometry',
                stylers: {
                    color: '#064f85'
                }
            }, {
                featureType: 'railway',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'highway',
                elementType: 'geometry',
                stylers: {
                    color: '#004981'
                }
            }, {
                featureType: 'highway',
                elementType: 'geometry.fill',
                stylers: {
                    color: '#005b96',
                    lightness: 1
                }
            }, {
                featureType: 'highway',
                elementType: 'labels',
                stylers: {
                    visibility: 'on'
                }
            }, {
                featureType: 'arterial',
                elementType: 'geometry',
                stylers: {
                    color: '#004981',
                    lightness: -39
                }
            }, {
                featureType: 'arterial',
                elementType: 'geometry.fill',
                stylers: {
                    color: '#00508b'
                }
            }, {
                featureType: 'poi',
                elementType: 'all',
                stylers: {
                    visibility: 'on'
                }
            }, {
                featureType: 'green',
                elementType: 'all',
                stylers: {
                    color: '#056197',
                    visibility: 'off'
                }
            }, {
                featureType: 'subway',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'manmade',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'local',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'arterial',
                elementType: 'labels',
                stylers: {
                    visibility: 'on'
                }
            }, {
                featureType: 'boundary',
                elementType: 'geometry.fill',
                stylers: {
                    color: '#029fd4'
                }
            }, {
                featureType: 'building',
                elementType: 'all',
                stylers: {
                    color: '#1a5787'
                }
            }, {
                featureType: 'label',
                elementType: 'all',
                stylers: {
                    visibility: 'on'
                }
            }, {
                featureType: 'poi',
                elementType: 'labels.text.fill',
                stylers: {
                    color: '#ffffff'
                }
            }, {
                featureType: 'poi',
                elementType: 'labels.text.stroke',
                stylers: {
                    color: '#1e1c1c'
                }
            }]
        });


        option = {
     color: ['gold','aqua','lime'],
    title : {
        text: '单站客流方向统计',
        
        x:'center',
        textStyle : {
            color: '#fff'
        }
    },
    tooltip : {
        trigger: 'item',
        formatter: '{b}'
    },
    legend: {
        orient: 'vertical',
        x:'left',
        data:[ '李村公园','台东', '市政府'],
        selectedMode: 'single',
        selected:{
            '市政府' : false,
            '台东' : false
        },
        textStyle : {
            color: '#fff'
        }
    },
    toolbox: {
        show : true,
        orient : 'vertical',
        x: 'right',
        y: 'center',
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    dataRange: {
        min : 0,
        max : 1000,
        calculable : true,
        color: ['#ff3333', 'orange', 'yellow','lime','aqua'],
        textStyle:{
            color:'#fff'
        }
    },
    series : [
    {
       
       name: '李村公园',
            type: 'map',
            mapType: 'none',
            data:[],
            geoCoord:{},
            markLine : {
                smooth:true,
                effect : {
                    show: true,
                    scaleSize: 1,
                    period: 30,
                    color: '#fff',
                    shadowBlur: 10
                },
                itemStyle : {
                    normal: {
                        borderWidth:1,
                        lineStyle: {
                            type: 'solid',
                            shadowBlur: 10
                        }
                    }
                },
                data : []
            },
            markPoint : {
                symbol:'emptyCircle',
                symbolSize : function (v){
                    return 10 + v/10
                },
                effect : {
                    show: true,
                    shadowBlur : 0
                },
                itemStyle:{
                    normal:{
                        label:{show:false}
                    },
                    emphasis: {
                        label:{position:'top'}
                    }
                },
                data : []
            }

       },

          /////////
       {
            name: '台东',
            type: 'map',
            mapType: 'none',
            data:[],
            geoCoord:{},
            markLine : {
                smooth:true,
                effect : {
                    show: true,
                    scaleSize: 1,
                    period: 30,
                    color: '#fff',
                    shadowBlur: 10
                },
                itemStyle : {
                    normal: {
                        borderWidth:1,
                        lineStyle: {
                            type: 'solid',
                            shadowBlur: 10
                        }
                    }
                },
                data : [
                   
                ]
            },
            markPoint : {
                symbol:'emptyCircle',
                symbolSize : function (v){
                    return 10 + v/10
                },
                effect : {
                    show: true,
                    shadowBlur : 0
                },
                itemStyle:{
                    normal:{
                        label:{show:false}
                    },
                    emphasis: {
                        label:{position:'top'}
                    }
                },
                data : [
                    
                ]
            }
        },     
       ///////
       {
            name: '市政府',
            type: 'map',
            mapType: 'none',
            data:[],
            geoCoord:{},
            markLine : {
                smooth:true,
                effect : {
                    show: true,
                    scaleSize: 1,
                    period: 30,
                    color: '#fff',
                    shadowBlur: 10
                },
                itemStyle : {
                    normal: {
                        borderWidth:1,
                        lineStyle: {
                            type: 'solid',
                            shadowBlur: 10
                        }
                    }
                },
                data : [
                    
                ]
            },
            markPoint : {
                symbol:'emptyCircle',
                symbolSize : function (v){
                    return 10 + v/10
                },
                effect : {
                    show: true,
                    shadowBlur : 0
                },
                itemStyle:{
                    normal:{
                        label:{show:false}
                    },
                    emphasis: {
                        label:{position:'top'}
                    }
                },
                data : [
                   
                ]
            }
        }
       ]
       };
       var stationCoords = {};
       
        function showPassengerFlow(){
               $.ajax({
                type: "post",
                url: "../../Home/passengerFlowSingleStation",
                dataType: "json",
                data:{},
                success: function (dataResult) {
                 $.ajax({
                type: "post",
                url: "../../Home/getAllStationCoord",
                dataType: "json",
                data:{},
                success: function (data) {
                for (var i = 0; i < data.length; i++) {
                var id = data[i].ID;
                var tempCoor = new Array(2);
                tempCoor[0] = data[i].jingdu;
                tempCoor[1] = data[i].weidu;
                stationCoords[id] = tempCoor;
                }

                    var allflow;
                    allflow = dataResult;
                    var stationID0 = [];
                    var stationID1 = [];
                    var stationID2 = [];

                    var jsonsFlow0= new Array();
                    var jsonsFlow1 = new Array();
                    var jsonsFlow2 = new Array();
                    for (var i = 0; i < allflow.length; i++) {
                        if(allflow[i].name == "李村公园")
                        {
                          jsonsFlow0.push({ "start": allflow[i].srcid, "end": allflow[i].desid, "num": allflow[i].num});
                          stationID0.push({"name":allflow[i].desid, "value":allflow[i].num});
                        }
                        else if(allflow[i].name == "台东")
                        {
                          jsonsFlow1.push({ "start": allflow[i].srcid, "end": allflow[i].desid, "num": allflow[i].num});
                          stationID1.push({"name":allflow[i].desid, "value":allflow[i].num});
                        }
                        else if(allflow[i].name == "市政府")
                        {
                           jsonsFlow2.push({ "start": allflow[i].srcid, "end": allflow[i].desid, "num": allflow[i].num});
                          stationID2.push({"name":allflow[i].desid, "value":allflow[i].num});
                        }
                    }

                    ///设置0
                    option.series[0].geoCoord = stationCoords;
                    option.series[0].markLine.data = jsonsFlow0.map(function (line) {
                       return [
                      {
                        name: line.start
                         }, {
                         name:line.end, value:line.num
                        }]
                    });
                    option.series[0].markPoint.data = stationID0.map(function(point){
                    return {name:point.name,value:point.value}
                    });

                    ///设置1
                    option.series[1].geoCoord = stationCoords;
                    option.series[1].markLine.data = jsonsFlow1.map(function (line) {
                       return [
                      {
                        name: line.start
                         }, {
                         name:line.end, value:line.num
                        }]
                    });
                    option.series[1].markPoint.data = stationID1.map(function(point){
                    return {name:point.name,value:point.value}
                    });

                    //设置2
                    option.series[2].geoCoord = stationCoords;
                    option.series[2].markLine.data = jsonsFlow2.map(function (line) {
                       return [
                      {
                        name: line.start
                         }, {
                         name:line.end, value:line.num
                        }]
                    });
                    option.series[2].markPoint.data = stationID2.map(function(point){
                    return {name:point.name,value:point.value}
                    });

                    var container = BMapExt.getEchartsContainer();
                    var myChart = BMapExt.initECharts(container);
                    window.onresize = myChart.onresize;
                    BMapExt.setOption(option,true);
                }
                });
                }
            });
         }
        showPassengerFlow();       
    }
    );    
    };
       
       var BMapExtss;
        function addmap() {
    require.config({
        paths: {
            echarts: '../../Scripts/doc/example/www/js'
        },
        packages: [
            {
                name: 'BMap',
                location: '../../Scripts/src',
                main: 'main'
            }
        ]
    });

    require(
    [
        'echarts',
        'BMap',
        'echarts/chart/map'
    ],
    function (echarts, BMapExtension) {

        BMapExtss = new BMapExtension($('#wholeCityD')[0], BMap, echarts,{
            enableMapClick: false
        });
        var allStationsMapSF = BMapExtss.getMap();
        allStationsMapSF.centerAndZoom(new BMap.Point(120.436212, 36.131032), 13);  // 初始化地图,设置中心点坐标和地图级别
        allStationsMapSF.setCurrentCity("青岛");          // 设置地图显示的城市 此项是必须设置的
        allStationsMapSF.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放        
        var mapStyle = {
                    features: ["road", "building", "water", "land"], //隐藏地图上的poi
                    style: "dark"
                };
        allStationsMapSF.setMapStyle(mapStyle);
        option = {
//    backgroundColor: '#1b1b1b',
    title : {
        text: '客流流动',
        x:'center',
        y:'top',
        textStyle: {
            color: 'white'
        }
    },
    legend: {
        show: true,
        selected: {},
        x: 'left',
        orient: 'vertical',
        textStyle: {
            color: 'white'
        },
        data: []
    },
    series : [{
        name:'青岛',
        type:'map',
        mapType: 'none',
         itemStyle: {
            normal: {
                borderColor:'rgba(100,149,237,1)',
                borderWidth:0.5,
               
                areaStyle: {
                     color: '#1b1b1b'
                }
            }
        },
        
        geoCoord:{},
        data: [{}],
        hoverable: true,
        clickable: true,
        roam: true,
        markLine: {
           effect: {
                color: 'rgba(154, 246, 255, 0.5)',
                show: true,
                period: 40
            },
            bundling: {
                enable: true
            },
            large: true,
            smooth: true,
            smoothness: 0.1,
            symbol: ['none', 'none'],
            itemStyle: {
                normal: {
                    lineStyle: {
                        color: 'rgba(2, 166, 253, 0.05)',
                        type: 'solid',
                        width: 0.5,
                        opacity: 0.8
                    }
                }
            },
            data: []
        },
        markPoint: {
            symbol: 'circle',
            symbolSize: 1.5,
             
            itemStyle: {
                normal: {
                    color: 'rgba(255, 0, 0, 0.5)'
                }   
            },
            data: []
            }
           }]
       };      
    }
    );
    
    };

    ///全市动态
           
        function showPassengerFlowss(newvals){
               $.ajax({
                type: "post",
                url: "../../Home/passengerFlowCount2",
                dataType: "json",
                data:{dates:$("#selectArrowD").val(),hours:newvals},
                success: function (dataResult) {
                 $.ajax({
                type: "post",
                url: "../../Home/getAllStationCoord",
                dataType: "json",
                data:{},
                success: function (data) {

                var stationCoordss = {};
                var stationIDs = [];

                for (var i = 0; i < data.length; i++) {
                var id = data[i].ID;
                var tempCoor = new Array(2);
                tempCoor[0] = data[i].jingdu;
                tempCoor[1] = data[i].weidu;
                stationCoordss[id] = tempCoor;
                }
                    var allflow;
                    allflow = dataResult;
                    var jsonsFlow= new Array();
                    for (var i = 0; i < allflow.length; i++) {
                        jsonsFlow.push({ "start": allflow[i].srcid, "end": allflow[i].desid, "num": allflow[i].num, "singleNum":allflow[i].num});
                        stationIDs.push({"name":allflow[i].srcid, "value":allflow[i].num});
                    }
                    option.series[0].geoCoord = stationCoordss;
                    option.series[0].markLine.data = jsonsFlow.sort(function (a, b) {
                    return b.num - a.num
                      }).map(function (line) {
                       return [
                      {
                        name: line.start
                         }, {
                         name:line.end, value:line.num
                        }]
                    });
                    option.series[0].markPoint.data = stationIDs.map(function(point){
                    return {name:point.name}
                    });
                    var container = BMapExtss.getEchartsContainer();
                    var myChart = BMapExtss.initECharts(container);
                    BMapExtss.setOption(option,true);

                }
                });
     

                }
            });
         }
      

       ///全市动态



    var BMapExts; 
 function addmapStatic() {
    require.config({
        paths: {
            echarts: '../../Scripts/doc/example/www/js'
        },
        packages: [
            {
                name: 'BMap',
                location: '../../Scripts/src',
                main: 'main'
            }
        ]
    });

    require(
    [
        'echarts',
        'BMap',
        'echarts/chart/map'
    ],
    function (echarts, BMapExtension) {

       BMapExts = new BMapExtension($('#wholeCityS')[0], BMap, echarts,{
            enableMapClick: false
        });

        var allStationsMapSF = BMapExts.getMap();
        allStationsMapSF.centerAndZoom(new BMap.Point(120.436212, 36.131032), 13);  // 初始化地图,设置中心点坐标和地图级别
        //allStationsMap.addControl(new BMap.MapTypeControl());   //添加地图类型控件
        allStationsMapSF.setCurrentCity("青岛");          // 设置地图显示的城市 此项是必须设置的
        allStationsMapSF.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
        

        var mapStyle = {
                    features: ["road", "building", "water", "land"], //隐藏地图上的poi
                    style: "dark"
                };
        allStationsMapSF.setMapStyle(mapStyle);
        option = {
//    backgroundColor: '#1b1b1b',
    title : {
        text: '客流流动',
        x:'center',
        y:'top',
        textStyle: {
            color: 'white'
        }
    },
    tooltip : {
        trigger: 'item',
        formatter: '{b}'
    },
    legend: {
        show: true,
        selected: {},
        x: 'left',
        orient: 'vertical',
        textStyle: {
            color: 'white'
        },
        data: []
    },
    dataRange: {
        min : 300,
        max : 1000,
        calculable : true,
        color: ['#ff3333', 'orange', 'yellow','lime','aqua'],
        textStyle:{
            color:'#fff'
        }
    },
    series : [{
        name:'青岛',
        type:'map',
        mapType: 'none',
         itemStyle: {
            normal: {
                borderColor:'rgba(100,149,237,1)',
                borderWidth:0.5,
               
                areaStyle: {
                     color: '#1b1b1b'
                }
            }
        },
        
        geoCoord:{},
        data: [{}],
        hoverable: true,
        clickable: true,
        roam: true,
        markLine: {


        smooth:true,
                effect : {
                    show: true,
                    scaleSize: 1,
                    period: 30,
                    color: '#fff',
                    shadowBlur: 10
                },
                itemStyle : {
                    normal: {
                        borderWidth:1,
                        lineStyle: {
                            type: 'solid',
                            shadowBlur: 10
                        }
                    }
                },
            data: []
        },
        markPoint: {
            symbol: 'circle',
            symbolSize: 1.5,
             
            itemStyle: {
                normal: {
                    color: 'rgba(255, 0, 0, 0.5)'
                }   
            },
            data: []
            }
           }]
       };
    }
    );
    
    };
    ///全市静态
        var stationCoords = {};
       var stationID = [];
        function showPassengerFlowS(newvals){
               $.ajax({
                type: "get",
                url: "../../Home/passengerFlowCount",
                dataType: "json",
                data:{dates:$("#selectArrowS").val(),hours:newvals},
                success: function (dataResult) {
                 $.ajax({
                type: "get",
                url: "../../Home/getAllStationCoord",
                dataType: "json",
                data:{},
                success: function (data) {
                for (var i = 0; i < data.length; i++) {
                var id = data[i].ID;
                var tempCoor = new Array(2);
                tempCoor[0] = data[i].jingdu;
                tempCoor[1] = data[i].weidu;
                stationCoords[id] = tempCoor;          
                }
                    var allflow;
                    allflow = dataResult;
                    var jsonsFlow= new Array();
                    for (var i = 0; i < allflow.length; i++) {
                     var stationName = allflow[i].sname+"->"+allflow[i].ename;
                        jsonsFlow.push({ "start": allflow[i].srcid, "end": allflow[i].desid, "num": allflow[i].num, "singleNum":allflow[i].num});
                        stationID.push({"name":allflow[i].srcid, "value":allflow[i].num});
                    }
                    option.series[0].geoCoord = stationCoords;
                    option.series[0].markLine.data = jsonsFlow.sort(function (a, b) {
                    return b.num - a.num
                      }).map(function (line) {
                       return [
                      {
                        name: line.start,value:line.num
                         }, {
                         name:line.end
                        }]
                    });
                    option.dataRange.max = 100;
                    option.dataRange.min = 20;


//                    option.series[0].markPoint.data = stationID.map(function(point){
//                                        return {name:point.name}
//                    });
                    var container = BMapExts.getEchartsContainer();
                    var myChart = BMapExts.initECharts(container);                               
                   
                    BMapExts.setOption(option,true);
                      
                }
                });
     

                }
            });
         }

         ///全市静态
      
        ///目前所有线路的站点热图地图
        var allStationsMap = new BMap.Map("allstation");
        allStationsMap.centerAndZoom(new BMap.Point(120.216212, 36.151032), 13);  // 初始化地图,设置中心点坐标和地图级别
        //allStationsMap.addControl(new BMap.MapTypeControl());   //添加地图类型控件
        allStationsMap.setCurrentCity("青岛");          // 设置地图显示的城市 此项是必须设置的
        allStationsMap.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
       //设置地图风格样式
        allStationsMap.setMapStyle({
            styleJson: [{
                featureType: 'water',
                elementType: 'all',
                stylers: {
                    color: '#044161'
                }
            }, {
                featureType: 'land',
                elementType: 'all',
                stylers: {
                    color: '#105E77'
                }
            }, {
                featureType: 'boundary',
                elementType: 'geometry',
                stylers: {
                    color: '#064f85'
                }
            }, {
                featureType: 'railway',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'highway',
                elementType: 'geometry',
                stylers: {
                    color: '#004981'
                }
            }, {
                featureType: 'highway',
                elementType: 'geometry.fill',
                stylers: {
                    color: '#005b96',
                    lightness: 1
                }
            }, {
                featureType: 'highway',
                elementType: 'labels',
                stylers: {
                    visibility: 'on'
                }
            }, {
                featureType: 'arterial',
                elementType: 'geometry',
                stylers: {
                    color: '#004981',
                    lightness: -39
                }
            }, {
                featureType: 'arterial',
                elementType: 'geometry.fill',
                stylers: {
                    color: '#00508b'
                }
            }, {
                featureType: 'poi',
                elementType: 'all',
                stylers: {
                    visibility: 'on'
                }
            }, {
                featureType: 'green',
                elementType: 'all',
                stylers: {
                    color: '#056197',
                    visibility: 'off'
                }
            }, {
                featureType: 'subway',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'manmade',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'local',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'arterial',
                elementType: 'labels',
                stylers: {
                    visibility: 'on'
                }
            }, {
                featureType: 'boundary',
                elementType: 'geometry.fill',
                stylers: {
                    color: '#029fd4'
                }
            }, {
                featureType: 'building',
                elementType: 'all',
                stylers: {
                    color: '#1a5787'
                }
            }, {
                featureType: 'label',
                elementType: 'all',
                stylers: {
                    visibility: 'on'
                }
            }, {
                featureType: 'poi',
                elementType: 'labels.text.fill',
                stylers: {
                    color: '#ffffff'
                }
            }, {
                featureType: 'poi',
                elementType: 'labels.text.stroke',
                stylers: {
                    color: '#1e1c1c'
                }
            }]
        });


     //所有站点可视化函数  
        var allstationData;
        var heatmapOverlaySation = new BMapLib.HeatmapOverlay({ "radius": 10 });
        allStationsMap.addOverlay(heatmapOverlaySation);
        function allstationMap(newval) {
            $.ajax({
                type: "post",
                url: "../../Home/getAllLinesStation",
                dataType: "json",
                data:{date:$("#xuanzeriqi").val(),hour:newval},
                success: function (data) {
                    allstationData = data;
                    var jsons = new Array();
                    for (var i = 0; i < allstationData.length; i++) {
                        jsons.push({ "lng": allstationData[i].jingdu, "lat": allstationData[i].weidu, "count": allstationData[i].totalFlow });
                    }
                    heatmapOverlaySation.setDataSet({ data: jsons, max: 100 });
                  
                }
            });
         }
                  
        ///125线路乘客流量可视化地图
        var mappassen = new BMap.Map("xianluyongji");
        mappassen.centerAndZoom(new BMap.Point(120.216212, 36.151032), 13);
        mappassen.enableScrollWheelZoom();

        mappassen.setMapStyle({
            styleJson: [{
                featureType: 'water',
                elementType: 'all',
                stylers: {
                    color: '#044161'
                }
            }, {
                featureType: 'land',
                elementType: 'all',
                stylers: {
                    color: '#105E77'
                }
            }, {
                featureType: 'boundary',
                elementType: 'geometry',
                stylers: {
                    color: '#064f85'
                }
            }, {
                featureType: 'railway',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'highway',
                elementType: 'geometry',
                stylers: {
                    color: '#004981'
                }
            }, {
                featureType: 'highway',
                elementType: 'geometry.fill',
                stylers: {
                    color: '#005b96',
                    lightness: 1
                }
            }, {
                featureType: 'highway',
                elementType: 'labels',
                stylers: {
                    visibility: 'on'
                }
            }, 
            {
                featureType: 'arterial',
                elementType: 'geometry',
                stylers: {
                    color: '#004981',
                    lightness: -39
                }
            }, 
            {
                featureType: 'arterial',
                elementType: 'geometry.fill',
                stylers: {
                    color: '#00508b'
                }
            }, {
                featureType: 'poi',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'green',
                elementType: 'all',
                stylers: {
                    color: '#056197',
                    visibility: 'off'
                }
            }, {
                featureType: 'subway',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'manmade',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'local',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'arterial',
                elementType: 'labels',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'boundary',
                elementType: 'geometry.fill',
                stylers: {
                    color: '#029fd4'
                }
            }, {
                featureType: 'building',
                elementType: 'all',
                stylers: {
                    color: '#1a5787'
                }
            }, {
                featureType: 'label',
                elementType: 'all',
                stylers: {
                    visibility: 'on'
                }
            }, {
                featureType: 'poi',
                elementType: 'labels.text.fill',
                stylers: {
                    color: '#ffffff'
                }
            }, {
                featureType: 'poi',
                elementType: 'labels.text.stroke',
                stylers: {
                    color: '#1e1c1c'
                }
            }]
        });

        var redata;
        var curve;

        function passengerFlow(value) {
            $.ajax({
                type: "post",
                url: "../../Home/getCongestIndexData",
                dataType: "json",
                data: { shijian: value,busline:$("#busline").val().toString() },
                success: function (data) {
                    redata = data;


                    for (var i = 0; i < redata.length; i++) {
                        if (redata[i].count < 250) {
                            curve = new BMap.Polyline([new BMap.Point(redata[i].startlng, redata[i].startlat), new BMap.Point(redata[i].endlng, redata[i].endlat)], { strokeColor: "rgba(23,191,0,0.72)", strokeWeight: 8, strokeOpacity: 0.5 });

                        } else if (redata[i].count >= 250 && redata[i].count < 500) {

                            curve = new BMap.Polyline([new BMap.Point(redata[i].startlng, redata[i].startlat), new BMap.Point(redata[i].endlng, redata[i].endlat)], { strokeColor: "rgba(255,159,25,0.72)", strokeWeight: 8, strokeOpacity: 0.5 });
                        } else if (redata[i].count > 500 && redata[i].count < 750) {
                            curve = new BMap.Polyline([new BMap.Point(redata[i].startlng, redata[i].startlat), new BMap.Point(redata[i].endlng, redata[i].endlat)], { strokeColor: "rgba(242,112,100,0.99)", strokeWeight: 8, strokeOpacity: 0.5 });

                        }
                         else if (redata[i].count > 750) {
                            curve = new BMap.Polyline([new BMap.Point(redata[i].startlng, redata[i].startlat), new BMap.Point(redata[i].endlng, redata[i].endlat)], { strokeColor: "rgba(192,43,19,0.9)", strokeWeight: 8, strokeOpacity: 0.5 });

                        }
                        mappassen.addOverlay(curve);
                    }
                }

            });
        }
                         
        


     //// // 125路站点可视化暂时去掉
      
        var point1 = [
         {"lng": 120.35932, "lat": 36.088004, "count": 1342 },
         { "lng": 120.361719, "lat": 36.08773, "count": 271 },
         { "lng": 120.36533, "lat": 36.085466, "count": 369 },
         { "lng": 120.37006, "lat": 36.081609, "count": 286 },
        { "lng": 120.376186, "lat": 36.077864, "count": 195 },
        { "lng": 120.381306, "lat": 36.079093, "count": 197 },
        { "lng": 120.388691, "lat": 36.080472, "count": 154 },
        { "lng": 120.396404, "lat": 36.074334, "count": 205 },
        { "lng": 120.405183, "lat": 36.070743, "count": 303 },
        { "lng": 120.413761, "lat": 36.071319, "count": 301 },
        { "lng": 120.419193, "lat": 36.073208, "count": 193 },
        { "lng": 120.424368, "lat": 36.076122, "count": 152 },
        { "lng": 120.428588, "lat": 36.072348, "count": 138 },
         {"lng": 120.434227, "lat": 36.07377, "count": 133 },
        { "lng": 120.440196, "lat": 36.076763, "count": 97 },
        { "lng": 120.444544, "lat": 36.079185, "count": 66 },
        { "lng": 120.450958, "lat": 36.082863, "count": 35 },
        { "lng": 120.454474, "lat": 36.086962, "count": 62 },
        { "lng": 120.457865, "lat": 36.092394, "count": 48 },
        { "lng": 120.464062, "lat": 36.095967, "count": 118 },
        { "lng": 120.469148, "lat": 36.098124, "count": 81 },
        { "lng": 120.470011, "lat": 36.100618, "count": 56 },
           { "lng": 120.46498, "lat": 36.1063, "count": 89 },
        { "lng": 120.460623, "lat": 36.110765, "count": 160 },
        { "lng": 120.456828, "lat": 36.114516, "count": 67 },
           { "lng": 120.453482, "lat": 36.118, "count": 95 },
        { "lng": 120.447584, "lat": 36.123215, "count": 120 },
        { "lng": 120.438202, "lat": 36.134726, "count": 251 },
        { "lng": 120.440645, "lat": 36.137083, "count": 231 },
        { "lng": 120.445428, "lat": 36.138293, "count": 230 },
        { "lng": 120.452925, "lat": 36.140155, "count": 33 },
        { "lng": 120.461064, "lat": 36.142147, "count": 64 },
         { "lng": 120.47964, "lat": 36.148133, "count": 40 },
        { "lng": 120.483714, "lat": 36.152104, "count": 29 },
        {"lng": 120.485924, "lat": 36.154301, "count": 70 },
        { "lng": 120.493245, "lat": 36.157178, "count": 40 },
        { "lng": 120.495222, "lat": 36.160653, "count": 52 },
        { "lng": 120.496353, "lat": 36.164948, "count": 65 },
        { "lng": 120.501201, "lat": 36.170695, "count": 42 },
        { "lng": 120.501366, "lat": 36.170814, "count": 24 },
        { "lng": 120.497036, "lat": 36.166553, "count": 44 },
        { "lng": 120.495285, "lat": 36.162553, "count": 12 },
        { "lng": 120.492509, "lat": 36.157287, "count": 362 },
        { "lng": 120.487146, "lat": 36.155888, "count": 73 },
        { "lng": 120.483229, "lat": 36.151895, "count": 73 },
        { "lng": 120.476627, "lat": 36.146883, "count": 112 },
        { "lng": 120.473258, "lat": 36.145498, "count": 69 },
        { "lng": 120.468219, "lat": 36.144063, "count": 83 },
        { "lng": 120.461365, "lat": 36.142336, "count": 127 },
        { "lng": 120.456702, "lat": 36.141199, "count": 116 },
        { "lng": 120.45275, "lat": 36.140252, "count": 96 },
        { "lng": 120.446668, "lat": 36.138758, "count": 76 },
        { "lng": 120.439617, "lat": 36.137017, "count": 67 },
         {"lng": 120.437815, "lat": 36.134958, "count": 38 },
         { "lng": 120.446021, "lat": 36.124183, "count": 94 },
         { "lng": 120.453873, "lat": 36.117237, "count": 74 },
         { "lng": 120.457107, "lat": 36.113884, "count": 119 },
         { "lng": 120.462227, "lat": 36.108752, "count": 225 },
        { "lng": 120.465386, "lat": 36.105725, "count": 122 },
         { "lng": 120.469728, "lat": 36.100449, "count": 176 },
         { "lng": 120.470093, "lat": 36.098949, "count": 103 },
         { "lng": 120.463233, "lat": 36.095951, "count": 132 },
        { "lng": 120.45884, "lat": 36.094091, "count": 146 },
         { "lng": 120.453735, "lat": 36.086029, "count": 92 },
         { "lng": 120.448115, "lat": 36.081309, "count": 48 },
          { "lng": 120.439545, "lat": 36.07662, "count": 68 },
         { "lng": 120.435826, "lat": 36.074811, "count": 73 },
          { "lng": 120.432246, "lat": 36.07301, "count": 57 },
          { "lng": 120.423456, "lat": 36.07662, "count": 62 },
         { "lng": 120.418394, "lat": 36.072645, "count": 57 },
         { "lng": 120.412456, "lat": 36.071274, "count": 101 },
         { "lng": 120.405809, "lat": 36.070808, "count": 90 },
        { "lng": 120.397057, "lat": 36.072647, "count": 49 },
         { "lng": 120.388815, "lat": 36.080523, "count": 65 },
         { "lng": 120.384705, "lat": 36.079943, "count": 96 },
         { "lng": 120.379677, "lat": 36.078724, "count": 198 },
         { "lng": 120.373232, "lat": 36.078542, "count": 278 },
         {"lng": 120.370052, "lat": 36.08167, "count": 117 },
        { "lng": 120.364698, "lat": 36.085943, "count": 134 },
         { "lng": 120.35907, "lat": 36.088266, "count": 128}];

        var point2 = [
         { "lng": 120.35932, "lat": 36.088004, "count": 813 },
         { "lng": 120.361719, "lat": 36.08773, "count": 388 },
         { "lng": 120.36533, "lat": 36.085466, "count": 453 },
         { "lng": 120.37006, "lat": 36.081609, "count": 279 },
        { "lng": 120.376186, "lat": 36.077864, "count": 215 },
        { "lng": 120.381306, "lat": 36.079093, "count": 265 },
        { "lng": 120.388691, "lat": 36.080472, "count": 170 },
        { "lng": 120.396404, "lat": 36.074334, "count": 248 },
        { "lng": 120.405183, "lat": 36.070743, "count": 322 },
        { "lng": 120.413761, "lat": 36.071319, "count": 381 },
        { "lng": 120.419193, "lat": 36.073208, "count": 178 },
        { "lng": 120.424368, "lat": 36.076122, "count": 127 },
        { "lng": 120.428588, "lat": 36.072348, "count": 95 },
        {"lng": 120.434227, "lat": 36.07377, "count": 95 },
        { "lng": 120.440196, "lat": 36.076763, "count": 126 },
        { "lng": 120.444544, "lat": 36.079185, "count": 64 },
        { "lng": 120.450958, "lat": 36.082863, "count": 46 },
        { "lng": 120.454474, "lat": 36.086962, "count": 48 },
        { "lng": 120.457865, "lat": 36.092394, "count": 58 },
        { "lng": 120.464062, "lat": 36.095967, "count": 102 },
        { "lng": 120.469148, "lat": 36.098124, "count": 98 },
        { "lng": 120.470011, "lat": 36.100618, "count": 78 },
           { "lng": 120.46498, "lat": 36.1063, "count": 124 },
        { "lng": 120.460623, "lat": 36.110765, "count": 155 },
        { "lng": 120.456828, "lat": 36.114516, "count": 100 },
           { "lng": 120.453482, "lat": 36.118, "count": 60 },
        { "lng": 120.447584, "lat": 36.123215, "count": 110 },
        { "lng": 120.438202, "lat": 36.134726, "count": 1400 },
        { "lng": 120.440645, "lat": 36.137083, "count": 267 },
        { "lng": 120.445428, "lat": 36.138293, "count": 240 },
        { "lng": 120.452925, "lat": 36.140155, "count": 23 },
        { "lng": 120.461064, "lat": 36.142147, "count": 51 },
         { "lng": 120.47964, "lat": 36.148133, "count": 38 },
        { "lng": 120.483714, "lat": 36.152104, "count": 28 },
        {"lng": 120.485924, "lat": 36.154301, "count": 58 },
        { "lng": 120.493245, "lat": 36.157178, "count": 74 },
        { "lng": 120.495222, "lat": 36.160653, "count": 61 },
        { "lng": 120.496353, "lat": 36.164948, "count": 76 },
        { "lng": 120.501201, "lat": 36.170695, "count": 47 },
        { "lng": 120.501366, "lat": 36.170814, "count": 27 },
        { "lng": 120.497036, "lat": 36.166553, "count": 32 },
        { "lng": 120.495285, "lat": 36.162553, "count": 17 },
        { "lng": 120.492509, "lat": 36.157287, "count": 411 },
        { "lng": 120.487146, "lat": 36.155888, "count": 125 },
        { "lng": 120.483229, "lat": 36.151895, "count": 74 },
        { "lng": 120.476627, "lat": 36.146883, "count": 127 },
        { "lng": 120.473258, "lat": 36.145498, "count": 92 },
        { "lng": 120.468219, "lat": 36.144063, "count": 101 },
        { "lng": 120.461365, "lat": 36.142336, "count": 113 },
        { "lng": 120.456702, "lat": 36.141199, "count": 148 },
        { "lng": 120.45275, "lat": 36.140252, "count": 120 },
        { "lng": 120.446668, "lat": 36.138758, "count": 117 },
        { "lng": 120.439617, "lat": 36.137017, "count": 73 },
        {"lng": 120.437815, "lat": 36.134958, "count": 73 },
        { "lng": 120.446021, "lat": 36.124183, "count": 94 },
        { "lng": 120.453873, "lat": 36.117237, "count": 69 },
        { "lng": 120.457107, "lat": 36.113884, "count": 170 },
        { "lng": 120.462227, "lat": 36.108752, "count": 281 },
       { "lng": 120.465386, "lat": 36.105725, "count": 96 },
        { "lng": 120.469728, "lat": 36.100449, "count": 192 },
        { "lng": 120.470093, "lat": 36.098949, "count": 168 },
        { "lng": 120.463233, "lat": 36.095951, "count": 149 },
       { "lng": 120.45884, "lat": 36.094091, "count": 236 },
        { "lng": 120.453735, "lat": 36.086029, "count": 97 },
        { "lng": 120.448115, "lat": 36.081309, "count": 75 },
         { "lng": 120.439545, "lat": 36.07662, "count": 78 },
        { "lng": 120.435826, "lat": 36.074811, "count": 99 },
         { "lng": 120.432246, "lat": 36.07301, "count": 65 },
         { "lng": 120.423456, "lat": 36.07662, "count": 83 },
        { "lng": 120.418394, "lat": 36.072645, "count": 104 },
        { "lng": 120.412456, "lat": 36.071274, "count": 118 },
        { "lng": 120.405809, "lat": 36.070808, "count": 62 },
       { "lng": 120.397057, "lat": 36.072647, "count": 115 },
        { "lng": 120.388815, "lat": 36.080523, "count": 103 },
        { "lng": 120.384705, "lat": 36.079943, "count": 97 },
        { "lng": 120.379677, "lat": 36.078724, "count": 217 },
        { "lng": 120.373232, "lat": 36.078542, "count": 431 },
        {"lng": 120.370052, "lat": 36.08167, "count": 189 },
        { "lng": 120.364698, "lat": 36.085943, "count": 98 },
        { "lng": 120.35907, "lat": 36.088266, "count": 152}];

        var point3 = [
         { "lng": 120.35932, "lat": 36.088004, "count": 779 },
         { "lng": 120.361719, "lat": 36.08773, "count": 339 },
         { "lng": 120.36533, "lat": 36.085466, "count": 403 },
         { "lng": 120.37006, "lat": 36.081609, "count": 308 },
        { "lng": 120.376186, "lat": 36.077864, "count": 181 },
        { "lng": 120.381306, "lat": 36.079093, "count": 221 },
        { "lng": 120.388691, "lat": 36.080472, "count": 199 },
        { "lng": 120.396404, "lat": 36.074334, "count": 203 },
        { "lng": 120.405183, "lat": 36.070743, "count": 269 },
        { "lng": 120.413761, "lat": 36.071319, "count": 291 },
        { "lng": 120.419193, "lat": 36.073208, "count": 207 },
        { "lng": 120.424368, "lat": 36.076122, "count": 136 },
        { "lng": 120.428588, "lat": 36.072348, "count": 141 },
         {"lng": 120.434227, "lat": 36.07377, "count": 50 },
        { "lng": 120.440196, "lat": 36.076763, "count": 76 },
        { "lng": 120.444544, "lat": 36.079185, "count": 50 },
        { "lng": 120.450958, "lat": 36.082863, "count": 51 },
        { "lng": 120.454474, "lat": 36.086962, "count": 81 },
        { "lng": 120.457865, "lat": 36.092394, "count": 62 },
        { "lng": 120.464062, "lat": 36.095967, "count": 93 },
        { "lng": 120.469148, "lat": 36.098124, "count": 102 },
        { "lng": 120.470011, "lat": 36.100618, "count": 71 },
           { "lng": 120.46498, "lat": 36.1063, "count": 82 },
        { "lng": 120.460623, "lat": 36.110765, "count": 172 },
        { "lng": 120.456828, "lat": 36.114516, "count": 82 },
           { "lng": 120.453482, "lat": 36.118, "count": 105 },
        { "lng": 120.447584, "lat": 36.123215, "count": 77 },
        { "lng": 120.438202, "lat": 36.134726, "count": 140 },
        { "lng": 120.440645, "lat": 36.137083, "count": 230 },
        { "lng": 120.445428, "lat": 36.138293, "count": 283 },
        { "lng": 120.452925, "lat": 36.140155, "count": 40 },
        { "lng": 120.461064, "lat": 36.142147, "count": 56 },
         { "lng": 120.47964, "lat": 36.148133, "count": 72 },
        { "lng": 120.483714, "lat": 36.152104, "count": 48 },
        {"lng": 120.485924, "lat": 36.154301, "count": 59 },
        { "lng": 120.493245, "lat": 36.157178, "count": 62 },
        { "lng": 120.495222, "lat": 36.160653, "count": 48 },
        { "lng": 120.496353, "lat": 36.164948, "count": 77 },
        { "lng": 120.501201, "lat": 36.170695, "count": 36 },
        { "lng": 120.501366, "lat": 36.170814, "count": 33 },
        { "lng": 120.497036, "lat": 36.166553, "count": 30 },
        { "lng": 120.495285, "lat": 36.162553, "count": 25 },
        { "lng": 120.492509, "lat": 36.157287, "count": 351 },
        { "lng": 120.487146, "lat": 36.155888, "count": 83 },
        { "lng": 120.483229, "lat": 36.151895, "count": 66 },
        { "lng": 120.476627, "lat": 36.146883, "count": 91 },
        { "lng": 120.473258, "lat": 36.145498, "count": 116 },
        { "lng": 120.468219, "lat": 36.144063, "count": 76 },
        { "lng": 120.461365, "lat": 36.142336, "count": 117 },
        { "lng": 120.456702, "lat": 36.141199, "count": 87 },
        { "lng": 120.45275, "lat": 36.140252, "count": 68 },
        { "lng": 120.446668, "lat": 36.138758, "count": 92 },
        { "lng": 120.439617, "lat": 36.137017, "count": 56 },
        {"lng": 120.437815, "lat": 36.134958, "count": 95 },
        { "lng": 120.446021, "lat": 36.124183, "count": 112 },
        { "lng": 120.453873, "lat": 36.117237, "count": 52 },
        { "lng": 120.457107, "lat": 36.113884, "count": 135 },
        { "lng": 120.462227, "lat": 36.108752, "count": 325 },
       { "lng": 120.465386, "lat": 36.105725, "count": 120 },
        { "lng": 120.469728, "lat": 36.100449, "count": 200 },
        { "lng": 120.470093, "lat": 36.098949, "count": 147 },
        { "lng": 120.463233, "lat": 36.095951, "count": 143 },
       { "lng": 120.45884, "lat": 36.094091, "count": 218 },
        { "lng": 120.453735, "lat": 36.086029, "count": 93 },
        { "lng": 120.448115, "lat": 36.081309, "count": 85 },
         { "lng": 120.439545, "lat": 36.07662, "count": 101 },
        { "lng": 120.435826, "lat": 36.074811, "count": 119 },
         { "lng": 120.432246, "lat": 36.07301, "count": 98 },
         { "lng": 120.423456, "lat": 36.07662, "count": 122 },
        { "lng": 120.418394, "lat": 36.072645, "count": 108 },
        { "lng": 120.412456, "lat": 36.071274, "count": 125 },
        { "lng": 120.405809, "lat": 36.070808, "count": 110 },
        { "lng": 120.397057, "lat": 36.072647, "count": 147 },
        { "lng": 120.388815, "lat": 36.080523, "count": 94 },
        { "lng": 120.384705, "lat": 36.079943, "count": 125 },
        { "lng": 120.379677, "lat": 36.078724, "count": 153 },
        { "lng": 120.373232, "lat": 36.078542, "count": 318 },
        {"lng": 120.370052, "lat": 36.08167, "count": 207 },
        { "lng": 120.364698, "lat": 36.085943, "count": 112 },
        { "lng": 120.35907, "lat": 36.088266, "count": 44}];

        var point4 = [
         { "lng": 120.35932, "lat": 36.088004, "count": 640 },
         { "lng": 120.361719, "lat": 36.08773, "count": 304 },
         { "lng": 120.36533, "lat": 36.085466, "count": 397 },
         { "lng": 120.37006, "lat": 36.081609, "count": 358 },
        { "lng": 120.376186, "lat": 36.077864, "count": 195 },
        { "lng": 120.381306, "lat": 36.079093, "count": 260 },
        { "lng": 120.388691, "lat": 36.080472, "count": 194 },
        { "lng": 120.396404, "lat": 36.074334, "count": 247 },
        { "lng": 120.405183, "lat": 36.070743, "count": 369 },
        { "lng": 120.413761, "lat": 36.071319, "count": 384 },
        { "lng": 120.419193, "lat": 36.073208, "count": 227 },
        { "lng": 120.424368, "lat": 36.076122, "count": 159 },
        { "lng": 120.428588, "lat": 36.072348, "count": 158 },
         {"lng": 120.434227, "lat": 36.07377, "count": 115 },
        { "lng": 120.440196, "lat": 36.076763, "count": 102 },
        { "lng": 120.444544, "lat": 36.079185, "count": 83 },
        { "lng": 120.450958, "lat": 36.082863, "count": 58 },
        { "lng": 120.454474, "lat": 36.086962, "count": 66 },
        { "lng": 120.457865, "lat": 36.092394, "count": 44 },
        { "lng": 120.464062, "lat": 36.095967, "count": 110 },
        { "lng": 120.469148, "lat": 36.098124, "count": 123 },
        { "lng": 120.470011, "lat": 36.100618, "count": 123 },
           { "lng": 120.46498, "lat": 36.1063, "count": 87 },
        { "lng": 120.460623, "lat": 36.110765, "count": 187 },
        { "lng": 120.456828, "lat": 36.114516, "count": 95 },
           { "lng": 120.453482, "lat": 36.118, "count": 103 },
        { "lng": 120.447584, "lat": 36.123215, "count": 120 },
        { "lng": 120.438202, "lat": 36.134726, "count": 195 },
        { "lng": 120.440645, "lat": 36.137083, "count": 261 },
        { "lng": 120.445428, "lat": 36.138293, "count": 303 },
        { "lng": 120.452925, "lat": 36.140155, "count": 44 },
        { "lng": 120.461064, "lat": 36.142147, "count": 66 },
         { "lng": 120.47964, "lat": 36.148133, "count": 47 },
        { "lng": 120.483714, "lat": 36.152104, "count": 40 },
        {"lng": 120.485924, "lat": 36.154301, "count": 67 },
        { "lng": 120.493245, "lat": 36.157178, "count": 63 },
        { "lng": 120.495222, "lat": 36.160653, "count": 75 },
        { "lng": 120.496353, "lat": 36.164948, "count": 40 },
        { "lng": 120.501201, "lat": 36.170695, "count": 35 },
        { "lng": 120.501366, "lat": 36.170814, "count": 32 },
        { "lng": 120.497036, "lat": 36.166553, "count": 37 },
        { "lng": 120.495285, "lat": 36.162553, "count": 14 },
        { "lng": 120.492509, "lat": 36.157287, "count": 445 },
        { "lng": 120.487146, "lat": 36.155888, "count": 80 },
        { "lng": 120.483229, "lat": 36.151895, "count": 96 },
        { "lng": 120.476627, "lat": 36.146883, "count": 106 },
        { "lng": 120.473258, "lat": 36.145498, "count": 97 },
        { "lng": 120.468219, "lat": 36.144063, "count": 95 },
        { "lng": 120.461365, "lat": 36.142336, "count": 141 },
        { "lng": 120.456702, "lat": 36.141199, "count": 170 },
        { "lng": 120.45275, "lat": 36.140252, "count": 108 },
        { "lng": 120.446668, "lat": 36.138758, "count": 123 },
        { "lng": 120.439617, "lat": 36.137017, "count": 67 },
        {"lng": 120.437815, "lat": 36.134958, "count": 81 },
        { "lng": 120.446021, "lat": 36.124183, "count": 87 },
        { "lng": 120.453873, "lat": 36.117237, "count": 82 },
        { "lng": 120.457107, "lat": 36.113884, "count": 178 },
        { "lng": 120.462227, "lat": 36.108752, "count": 272 },
       { "lng": 120.465386, "lat": 36.105725, "count": 106 },
        { "lng": 120.469728, "lat": 36.100449, "count": 174 },
        { "lng": 120.470093, "lat": 36.098949, "count": 181 },
        { "lng": 120.463233, "lat": 36.095951, "count": 141 },
       { "lng": 120.45884, "lat": 36.094091, "count": 194 },
        { "lng": 120.453735, "lat": 36.086029, "count": 98 },
        { "lng": 120.448115, "lat": 36.081309, "count": 47 },
         { "lng": 120.439545, "lat": 36.07662, "count": 79 },
        { "lng": 120.435826, "lat": 36.074811, "count": 127 },
         { "lng": 120.432246, "lat": 36.07301, "count": 51 },
         { "lng": 120.423456, "lat": 36.07662, "count": 83 },
        { "lng": 120.418394, "lat": 36.072645, "count": 72 },
        { "lng": 120.412456, "lat": 36.071274, "count": 103 },
        { "lng": 120.405809, "lat": 36.070808, "count": 117 },
       { "lng": 120.397057, "lat": 36.072647, "count": 69 },
        { "lng": 120.388815, "lat": 36.080523, "count": 80 },
        { "lng": 120.384705, "lat": 36.079943, "count": 95 },
        { "lng": 120.379677, "lat": 36.078724, "count": 196 },
        { "lng": 120.373232, "lat": 36.078542, "count": 369 },
        {"lng": 120.370052, "lat": 36.08167, "count": 221 },
       { "lng": 120.364698, "lat": 36.085943, "count": 96 },
        { "lng": 120.35907, "lat": 36.088266, "count": 59}];

        var point5 = [
        { "lng": 120.35932, "lat": 36.088004, "count": 861 },
        { "lng": 120.361719, "lat": 36.08773, "count": 176 },
        { "lng": 120.36533, "lat": 36.085466, "count": 458 },
        { "lng": 120.37006, "lat": 36.081609, "count": 341 },
        { "lng": 120.376186, "lat": 36.077864, "count": 133 },
        { "lng": 120.381306, "lat": 36.079093, "count": 193 },
        { "lng": 120.388691, "lat": 36.080472, "count": 152 },
        { "lng": 120.396404, "lat": 36.074334, "count": 238 },
        { "lng": 120.405183, "lat": 36.070743, "count": 217 },
        { "lng": 120.413761, "lat": 36.071319, "count": 228 },
        { "lng": 120.419193, "lat": 36.073208, "count": 148 },
        { "lng": 120.424368, "lat": 36.076122, "count": 147 },
        { "lng": 120.428588, "lat": 36.072348, "count": 89 },

         {"lng": 120.434227, "lat": 36.07377, "count": 89 },
        { "lng": 120.440196, "lat": 36.076763, "count": 91 },
        { "lng": 120.444544, "lat": 36.079185, "count": 60 },
        { "lng": 120.450958, "lat": 36.082863, "count": 25 },
        { "lng": 120.454474, "lat": 36.086962, "count": 72 },
        { "lng": 120.457865, "lat": 36.092394, "count": 49 },
        { "lng": 120.464062, "lat": 36.095967, "count": 95 },
        { "lng": 120.469148, "lat": 36.098124, "count": 75 },
        { "lng": 120.470011, "lat": 36.100618, "count": 71 },
           { "lng": 120.46498, "lat": 36.1063, "count": 79 },
        { "lng": 120.460623, "lat": 36.110765, "count": 93 },
        { "lng": 120.456828, "lat": 36.114516, "count": 50 },
           { "lng": 120.453482, "lat": 36.118, "count": 66 },
        { "lng": 120.447584, "lat": 36.123215, "count": 77 },
        { "lng": 120.438202, "lat": 36.134726, "count": 186 },
        { "lng": 120.440645, "lat": 36.137083, "count": 153 },
        { "lng": 120.445428, "lat": 36.138293, "count": 166 },
        { "lng": 120.452925, "lat": 36.140155, "count": 18 },
        { "lng": 120.461064, "lat": 36.142147, "count": 64 },
         { "lng": 120.47964, "lat": 36.148133, "count": 39 },
        { "lng": 120.483714, "lat": 36.152104, "count": 28 },
        {"lng": 120.485924, "lat": 36.154301, "count": 56 },
        { "lng": 120.493245, "lat": 36.157178, "count": 42 },
        { "lng": 120.495222, "lat": 36.160653, "count": 37 },
        { "lng": 120.496353, "lat": 36.164948, "count": 37 },
        { "lng": 120.501201, "lat": 36.170695, "count": 38 },
        { "lng": 120.501366, "lat": 36.170814, "count": 36 },
        { "lng": 120.497036, "lat": 36.166553, "count": 42 },
        { "lng": 120.495285, "lat": 36.162553, "count": 18 },
        { "lng": 120.492509, "lat": 36.157287, "count": 349 },
        { "lng": 120.487146, "lat": 36.155888, "count": 100 },
        { "lng": 120.483229, "lat": 36.151895, "count": 65 },
        { "lng": 120.476627, "lat": 36.146883, "count": 74 },
        { "lng": 120.473258, "lat": 36.145498, "count": 80 },
        { "lng": 120.468219, "lat": 36.144063, "count": 59 },
        { "lng": 120.461365, "lat": 36.142336, "count": 111 },
        { "lng": 120.456702, "lat": 36.141199, "count": 94 },
        { "lng": 120.45275, "lat": 36.140252, "count": 75 },
        { "lng": 120.446668, "lat": 36.138758, "count": 108 },
        { "lng": 120.439617, "lat": 36.137017, "count": 46 },
        {"lng": 120.437815, "lat": 36.134958, "count": 52 },
        { "lng": 120.446021, "lat": 36.124183, "count": 63 },
        { "lng": 120.453873, "lat": 36.117237, "count": 45 },
        { "lng": 120.457107, "lat": 36.113884, "count": 128 },
        { "lng": 120.462227, "lat": 36.108752, "count": 250 },
       { "lng": 120.465386, "lat": 36.105725, "count": 131 },
        { "lng": 120.469728, "lat": 36.100449, "count": 146 },
        { "lng": 120.470093, "lat": 36.098949, "count": 125 },
        { "lng": 120.463233, "lat": 36.095951, "count": 117 },
       { "lng": 120.45884, "lat": 36.094091, "count": 129 },
        { "lng": 120.453735, "lat": 36.086029, "count": 73 },
        { "lng": 120.448115, "lat": 36.081309, "count": 41 },
         { "lng": 120.439545, "lat": 36.07662, "count": 55 },
        { "lng": 120.435826, "lat": 36.074811, "count": 50 },
         { "lng": 120.432246, "lat": 36.07301, "count": 91 },
         { "lng": 120.423456, "lat": 36.07662, "count": 77 },
        { "lng": 120.418394, "lat": 36.072645, "count": 25 },
        { "lng": 120.412456, "lat": 36.071274, "count": 86 },
        { "lng": 120.405809, "lat": 36.070808, "count": 63 },
       { "lng": 120.397057, "lat": 36.072647, "count": 55 },
        { "lng": 120.388815, "lat": 36.080523, "count": 68 },
        { "lng": 120.384705, "lat": 36.079943, "count": 111 },
        { "lng": 120.379677, "lat": 36.078724, "count": 167 },
        { "lng": 120.373232, "lat": 36.078542, "count": 273 },
        {"lng": 120.370052, "lat": 36.08167, "count": 107 },
       { "lng": 120.364698, "lat": 36.085943, "count": 114 },
        { "lng": 120.35907, "lat": 36.088266, "count": 78}];

        var point6 = [
         { "lng": 120.35932, "lat": 36.088004, "count": 894 },
         { "lng": 120.361719, "lat": 36.08773, "count": 500 },
         { "lng": 120.36533, "lat": 36.085466, "count": 273 },
         { "lng": 120.37006, "lat": 36.081609, "count": 325 },
        { "lng": 120.376186, "lat": 36.077864, "count": 203 },
        { "lng": 120.381306, "lat": 36.079093, "count": 186 },
        { "lng": 120.388691, "lat": 36.080472, "count": 210 },
        { "lng": 120.396404, "lat": 36.074334, "count": 193 },
        { "lng": 120.405183, "lat": 36.070743, "count": 306 },
        { "lng": 120.413761, "lat": 36.071319, "count": 341 },
        { "lng": 120.419193, "lat": 36.073208, "count": 193 },
        { "lng": 120.424368, "lat": 36.076122, "count": 111 },
        { "lng": 120.428588, "lat": 36.072348, "count": 163 },
         {"lng": 120.434227, "lat": 36.07377, "count": 106 },
        { "lng": 120.440196, "lat": 36.076763, "count": 151 },
        { "lng": 120.444544, "lat": 36.079185, "count": 94 },
        { "lng": 120.450958, "lat": 36.082863, "count": 45 },
        { "lng": 120.454474, "lat": 36.086962, "count": 56 },
        { "lng": 120.457865, "lat": 36.092394, "count": 40 },
        { "lng": 120.464062, "lat": 36.095967, "count": 85 },
        { "lng": 120.469148, "lat": 36.098124, "count": 87 },
        { "lng": 120.470011, "lat": 36.100618, "count": 96 },
           { "lng": 120.46498, "lat": 36.1063, "count": 90 },
        { "lng": 120.460623, "lat": 36.110765, "count": 94 },
        { "lng": 120.456828, "lat": 36.114516, "count": 70 },
           { "lng": 120.453482, "lat": 36.118, "count": 99 },
        { "lng": 120.447584, "lat": 36.123215, "count": 88 },
        { "lng": 120.438202, "lat": 36.134726, "count": 173 },
        { "lng": 120.440645, "lat": 36.137083, "count": 232 },
        { "lng": 120.445428, "lat": 36.138293, "count": 312 },
        { "lng": 120.452925, "lat": 36.140155, "count": 30 },
        { "lng": 120.461064, "lat": 36.142147, "count": 42 },
         { "lng": 120.47964, "lat": 36.148133, "count": 21 },
        { "lng": 120.483714, "lat": 36.152104, "count": 29 },
        {"lng": 120.485924, "lat": 36.154301, "count": 90 },
        { "lng": 120.493245, "lat": 36.157178, "count": 57 },
        { "lng": 120.495222, "lat": 36.160653, "count": 75 },
        { "lng": 120.496353, "lat": 36.164948, "count": 73 },
        { "lng": 120.501201, "lat": 36.170695, "count": 42 },
        { "lng": 120.501366, "lat": 36.170814, "count": 23 },
        { "lng": 120.497036, "lat": 36.166553, "count": 28 },
        { "lng": 120.495285, "lat": 36.162553, "count": 40 },
        { "lng": 120.492509, "lat": 36.157287, "count": 445 },
        { "lng": 120.487146, "lat": 36.155888, "count": 110 },
        { "lng": 120.483229, "lat": 36.151895, "count": 120 },
        { "lng": 120.476627, "lat": 36.146883, "count": 112 },
        { "lng": 120.473258, "lat": 36.145498, "count": 80 },
        { "lng": 120.468219, "lat": 36.144063, "count": 83 },
        { "lng": 120.461365, "lat": 36.142336, "count": 83 },
        { "lng": 120.456702, "lat": 36.141199, "count": 166 },
        { "lng": 120.45275, "lat": 36.140252, "count": 74 },
        { "lng": 120.446668, "lat": 36.138758, "count": 111 },
        { "lng": 120.439617, "lat": 36.137017, "count": 57 },
        {"lng": 120.437815, "lat": 36.134958, "count": 46 },
        { "lng": 120.446021, "lat": 36.124183, "count": 58 },
        { "lng": 120.453873, "lat": 36.117237, "count": 56 },
        { "lng": 120.457107, "lat": 36.113884, "count": 86 },
        { "lng": 120.462227, "lat": 36.108752, "count": 273 },
       { "lng": 120.465386, "lat": 36.105725, "count": 119 },
        { "lng": 120.469728, "lat": 36.100449, "count": 177 },
        { "lng": 120.470093, "lat": 36.098949, "count": 154 },
        { "lng": 120.463233, "lat": 36.095951, "count": 151 },
       { "lng": 120.45884, "lat": 36.094091, "count": 117 },
        { "lng": 120.453735, "lat": 36.086029, "count": 92 },
        { "lng": 120.448115, "lat": 36.081309, "count": 69 },
         { "lng": 120.439545, "lat": 36.07662, "count": 79 },
        { "lng": 120.435826, "lat": 36.074811, "count": 120 },
         { "lng": 120.432246, "lat": 36.07301, "count": 87 },
         { "lng": 120.423456, "lat": 36.07662, "count": 96 },
        { "lng": 120.418394, "lat": 36.072645, "count": 114 },
        { "lng": 120.412456, "lat": 36.071274, "count": 178 },
        { "lng": 120.405809, "lat": 36.070808, "count": 201 },
       { "lng": 120.397057, "lat": 36.072647, "count": 104 },
        { "lng": 120.388815, "lat": 36.080523, "count": 104 },
        { "lng": 120.384705, "lat": 36.079943, "count": 143 },
        { "lng": 120.379677, "lat": 36.078724, "count": 245 },
        { "lng": 120.373232, "lat": 36.078542, "count": 326 },
        {"lng": 120.370052, "lat": 36.08167, "count": 222 },
       { "lng": 120.364698, "lat": 36.085943, "count": 120 },
        { "lng": 120.35907, "lat": 36.088266, "count": 78}];

        var point7 = [
         { "lng": 120.35932, "lat": 36.088004, "count": 601 },
         { "lng": 120.361719, "lat": 36.08773, "count": 435 },
         { "lng": 120.36533, "lat": 36.085466, "count": 254 },
         { "lng": 120.37006, "lat": 36.081609, "count": 156 },
        { "lng": 120.376186, "lat": 36.077864, "count": 137 },
        { "lng": 120.381306, "lat": 36.079093, "count": 181 },
        { "lng": 120.388691, "lat": 36.080472, "count": 178 },
        { "lng": 120.396404, "lat": 36.074334, "count": 214 },
        { "lng": 120.405183, "lat": 36.070743, "count": 221 },
        { "lng": 120.413761, "lat": 36.071319, "count": 343 },
        { "lng": 120.419193, "lat": 36.073208, "count": 198 },
        { "lng": 120.424368, "lat": 36.076122, "count": 102 },
        { "lng": 120.428588, "lat": 36.072348, "count": 68 },

         {"lng": 120.434227, "lat": 36.07377, "count": 82 },
        { "lng": 120.440196, "lat": 36.076763, "count": 122 },
        { "lng": 120.444544, "lat": 36.079185, "count": 72 },
        { "lng": 120.450958, "lat": 36.082863, "count": 40 },
        { "lng": 120.454474, "lat": 36.086962, "count": 48 },
        { "lng": 120.457865, "lat": 36.092394, "count": 44 },
        { "lng": 120.464062, "lat": 36.095967, "count": 100 },
        { "lng": 120.469148, "lat": 36.098124, "count": 141 },
        { "lng": 120.470011, "lat": 36.100618, "count": 73 },
           { "lng": 120.46498, "lat": 36.1063, "count": 72 },
        { "lng": 120.460623, "lat": 36.110765, "count": 132 },
        { "lng": 120.456828, "lat": 36.114516, "count": 67 },
           { "lng": 120.453482, "lat": 36.118, "count": 65 },
        { "lng": 120.447584, "lat": 36.123215, "count": 52 },
        { "lng": 120.438202, "lat": 36.134726, "count": 98 },
        { "lng": 120.440645, "lat": 36.137083, "count": 227 },
        { "lng": 120.445428, "lat": 36.138293, "count": 237 },
        { "lng": 120.452925, "lat": 36.140155, "count": 25 },
        { "lng": 120.461064, "lat": 36.142147, "count": 26 },
         { "lng": 120.47964, "lat": 36.148133, "count": 37 },
        { "lng": 120.483714, "lat": 36.152104, "count": 20 },
        {"lng": 120.485924, "lat": 36.154301, "count": 56 },
        { "lng": 120.493245, "lat": 36.157178, "count": 49 },
        { "lng": 120.495222, "lat": 36.160653, "count": 30 },
        { "lng": 120.496353, "lat": 36.164948, "count": 55 },
        { "lng": 120.501201, "lat": 36.170695, "count": 27 },
        { "lng": 120.501366, "lat": 36.170814, "count": 42 },
        { "lng": 120.497036, "lat": 36.166553, "count": 43 },
        { "lng": 120.495285, "lat": 36.162553, "count": 22 },
        { "lng": 120.492509, "lat": 36.157287, "count": 408 },
        { "lng": 120.487146, "lat": 36.155888, "count": 105 },
        { "lng": 120.483229, "lat": 36.151895, "count": 70 },
        { "lng": 120.476627, "lat": 36.146883, "count": 79 },
        { "lng": 120.473258, "lat": 36.145498, "count": 68 },
        { "lng": 120.468219, "lat": 36.144063, "count": 53 },
        { "lng": 120.461365, "lat": 36.142336, "count": 116 },
        { "lng": 120.456702, "lat": 36.141199, "count": 118 },
        { "lng": 120.45275, "lat": 36.140252, "count": 91 },
        { "lng": 120.446668, "lat": 36.138758, "count": 118 },
        { "lng": 120.439617, "lat": 36.137017, "count": 48 },
        {"lng": 120.437815, "lat": 36.134958, "count": 39 },
        { "lng": 120.446021, "lat": 36.124183, "count": 46 },
        { "lng": 120.453873, "lat": 36.117237, "count": 52 },
        { "lng": 120.457107, "lat": 36.113884, "count": 98 },
        { "lng": 120.462227, "lat": 36.108752, "count": 268 },
       { "lng": 120.465386, "lat": 36.105725, "count": 98 },
        { "lng": 120.469728, "lat": 36.100449, "count": 137 },
        { "lng": 120.470093, "lat": 36.098949, "count": 102 },
        { "lng": 120.463233, "lat": 36.095951, "count": 136 },
       { "lng": 120.45884, "lat": 36.094091, "count": 100 },
        { "lng": 120.453735, "lat": 36.086029, "count": 51 },
        { "lng": 120.448115, "lat": 36.081309, "count": 52 },
         { "lng": 120.439545, "lat": 36.07662, "count": 46 },
        { "lng": 120.435826, "lat": 36.074811, "count": 98 },
         { "lng": 120.432246, "lat": 36.07301, "count": 56 },
         { "lng": 120.423456, "lat": 36.07662, "count": 73 },
        { "lng": 120.418394, "lat": 36.072645, "count": 66 },
        { "lng": 120.412456, "lat": 36.071274, "count": 124 },
        { "lng": 120.405809, "lat": 36.070808, "count": 155 },
       { "lng": 120.397057, "lat": 36.072647, "count": 74 },
        { "lng": 120.388815, "lat": 36.080523, "count": 80 },
        { "lng": 120.384705, "lat": 36.079943, "count": 131 },
        { "lng": 120.379677, "lat": 36.078724, "count": 266 },
        { "lng": 120.373232, "lat": 36.078542, "count": 367 },
        {"lng": 120.370052, "lat": 36.08167, "count": 177 },
       { "lng": 120.364698, "lat": 36.085943, "count": 86 },
        { "lng": 120.35907, "lat": 36.088266, "count": 70}];


        //画出热力图       
        var relitu = new BMap.Map("zhandian");    // 创建Map实例
        relitu.centerAndZoom(new BMap.Point(120.216212, 36.151032), 13);  // 初始化地图,设置中心点坐标和地图级别
       // relitu.addControl(new BMap.MapTypeControl());   //添加地图类型控件
        relitu.setCurrentCity("青岛");          // 设置地图显示的城市 此项是必须设置的
        relitu.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
        //relitu.addControl(new BMap.MapTypeControl({ mapTypes: [BMAP_HYBRID_MAP] }));
        relitu.setMapStyle({
            styleJson: [{
                featureType: 'water',
                elementType: 'all',
                stylers: {
                    color: '#044161'
                }
            }, {
                featureType: 'land',
                elementType: 'all',
                stylers: {
                    color: '#105E77'
                }
            }, {
                featureType: 'boundary',
                elementType: 'geometry',
                stylers: {
                    color: '#064f85'
                }
            }, {
                featureType: 'railway',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'highway',
                elementType: 'geometry',
                stylers: {
                    color: '#004981'
                }
            }, {
                featureType: 'highway',
                elementType: 'geometry.fill',
                stylers: {
                    color: '#005b96',
                    lightness: 1
                }
            }, {
                featureType: 'highway',
                elementType: 'labels',
                stylers: {
                    visibility: 'on'
                }
            }, {
                featureType: 'arterial',
                elementType: 'geometry',
                stylers: {
                    color: '#004981',
                    lightness: -39
                }
            }, {
                featureType: 'arterial',
                elementType: 'geometry.fill',
                stylers: {
                    color: '#00508b'
                }
            }, {
                featureType: 'poi',
                elementType: 'all',
                stylers: {
                    visibility: 'on'
                }
            }, {
                featureType: 'green',
                elementType: 'all',
                stylers: {
                    color: '#056197',
                    visibility: 'off'
                }
            }, {
                featureType: 'subway',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'manmade',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'local',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'arterial',
                elementType: 'labels',
                stylers: {
                    visibility: 'on'
                }
            }, {
                featureType: 'boundary',
                elementType: 'geometry.fill',
                stylers: {
                    color: '#029fd4'
                }
            }, {
                featureType: 'building',
                elementType: 'all',
                stylers: {
                    color: '#1a5787'
                }
            }, {
                featureType: 'label',
                elementType: 'all',
                stylers: {
                    visibility: 'off'
                }
            }, {
                featureType: 'poi',
                elementType: 'labels.text.fill',
                stylers: {
                    color: '#ffffff'
                }
            }, {
                featureType: 'poi',
                elementType: 'labels.text.stroke',
                stylers: {
                    color: '#1e1c1c'
                }
            }]
        });

        function showHotmap(newValue) {
            relitu.clearOverlays();
        var heatmapOverlay1 = new BMapLib.HeatmapOverlay({ "radius": 20 });
        relitu.addOverlay(heatmapOverlay1);
//        heatmapOverlay1.setDataSet({ data: point1, max: 500 });
//            
              
            heatmapOverlay1.show();
           if (newValue == 1) {
               heatmapOverlay1.setDataSet({ data: point1, max: 500 });
           } else if (newValue == 2) {

               heatmapOverlay1.setDataSet({ data: point2, max: 500 });
           } else if (newValue == 3) {

               heatmapOverlay1.setDataSet({ data: point3, max: 500 });
           } else if (newValue == 4) {

               heatmapOverlay1.setDataSet({ data: point4, max: 500 });
           } else if (newValue == 5) {

               heatmapOverlay1.setDataSet({ data: point5, max: 500 });
           } else if (newValue == 6) {

               heatmapOverlay1.setDataSet({ data: point6, max: 500 });
           } else if (newValue == 7) {

               heatmapOverlay1.setDataSet({ data: point7, max: 500 });
           }
       }
       //一天不同时段站点拥堵情况
       var allHourData;
      var circle= new BMap.Circle();
       var heatmapOverlay2 = new BMapLib.HeatmapOverlay({ "radius": 20 });
       relitu.addOverlay(heatmapOverlay2);
     
     
//       function showHotHour(newVal) {
//           heatmapOverlay1.hide();
//           heatmapOverlay2.show();
//           $.ajax({
//               type: "post",
//               url: "../../Home/get125HourData",
//               dataType: "json",
//               data: {date:$("#xuanzeDate").val(),hour:newVal,busLineName:$("#busName").val().toString()},
//               success: function (data) {                 
//                   allHourData = data;

//                   var jsonss = new Array();
//                   for (var i = 0; i < allHourData.length; i++) {
//                       jsonss.push({ "lng": allHourData[i].jingdu, "lat": allHourData[i].weidu, "count": allHourData[i].renshu });
//                   }
//                   heatmapOverlay2.setDataSet({ data: jsonss, max: 20 });
//               }
//           });        
  //       }
       function showHotHour(newVal) {
//           heatmapOverlay1.hide();       
           $.ajax({
               type: "post",
               url: "../../Home/get125HourData",
               dataType: "json",
               data: { date: $("#xuanzeDate").val(), hour: newVal, busLineName: $("#busName").val().toString() },
               success: function (data) {
                   allHourData = data;
                   relitu.clearOverlays();
                   for (var i = 0; i < allHourData.length; i++) {
                       if (allHourData[i].renshu < 20) {
                           circle = new BMap.Circle(
                         new BMap.Point(allHourData[i].jingdu, allHourData[i].weidu), 200,
                        {
                            strokeColor: "#b3bbb7",
                            strokeWeight: 0.1,
                            strokeOpacity: 0.5,
                            fillColor: "#50bb35",
                            fillOpacity: 0.7
                        });
                       } else if (allHourData[i].renshu > 20 && allHourData[i].renshu < 30) {
                           circle = new BMap.Circle(
                         new BMap.Point(allHourData[i].jingdu, allHourData[i].weidu), 300,
                        {
                            strokeColor: "#b3bbb7",
                            strokeWeight:0.1,
                            strokeOpacity: 0.5,
                            fillColor: "#d4d000",
                            fillOpacity:0.7
                        });

                       } else if (allHourData[i].renshu > 30 && allHourData[i].renshu < 40) {

                           circle = new BMap.Circle(
                         new BMap.Point(allHourData[i].jingdu, allHourData[i].weidu), 400,
                        {
                            strokeColor: "#b3bbb7",
                            strokeWeight: 0.1,
                            strokeOpacity: 0.5,
                            fillColor: "#ff7403",
                            fillOpacity:0.7
                        });
                       } else if (allHourData[i].renshu > 40 && allHourData[i].renshu < 50) {

                           circle = new BMap.Circle(
                         new BMap.Point(allHourData[i].jingdu, allHourData[i].weidu), 500,
                        {
                            strokeColor: "#b3bbb7",
                            strokeWeight: 0.1,
                            strokeOpacity: 0.5,
                            fillColor: "#ff3300",
                            fillOpacity: 0.7
                        });

                       } else if (allHourData[i].renshu > 50) {
                           circle = new BMap.Circle(
                         new BMap.Point(allHourData[i].jingdu, allHourData[i].weidu), 600,
                        {
                            strokeColor: "#b3bbb7",
                            strokeWeight: 0.1,
                            strokeOpacity: 0.5,
                            fillColor: "#bb2023",
                            fillOpacity: 0.7
                        });
                       }

                    relitu.addOverlay(circle);
                   }
               
               }
           });
       }





////提交表单
        function sub () {
            $.ajax({
                type: "POST",
                url: "../../Home/tijiao",
                dataType: "json",
                data: { name: $("#name").val(), email: $("#email").val(), message: $("#message").val() },
                success: function (data) {

                    if (data == "成功") {
                        alert("提交成功！");
                    }
                    else {

                        alert("提交失败！");

                    }
                },
                complete: function () {

                    $("#name").val('');
                    $("#email").val('');
                    $("#message").val('');
                }
            });
           } 
        ////改变数据,使图形改变





        ////四大城区  整点与半点时间序列图


           var snMon = [23.9, 21.5, 18.7, 16.6, 16.1, 16.7, 19.4, 19.1, 19.5, 19.8, 20.8, 20.9, 20, 21.6, 20.7, 20.4, 20.7, 19.8, 20.1, 19.2, 19.4, 18.8, 17.5, 15.9, 16.6, 17.7, 21.1, 21.4, 21.7, 22.1, 22.3, 22.9];
           var sbMon = [22.9, 19.5, 16.3, 14.3, 14.6, 16.5, 17.6, 18.1, 18.7, 18.9, 18.8, 19.3, 19.8, 19.8, 19.7, 19.5, 18.9, 19.2, 18.7, 18.3, 18.2, 17.8, 16.3, 15.2, 15.5, 17, 19, 20.6, 21, 21.1, 21.6, 22.4];
           var lcMon = [24.7, 22.9, 20.9, 18.7, 19.4, 20.9, 22.2, 22.4, 22, 22.8, 22.9, 22.8, 23.3, 23.6, 22.8, 22.8, 22.2, 22.3, 22.5, 22.2, 21.8, 21.4, 19.9, 19.1, 20.2, 22.1, 23.5, 24.3, 24.7, 24.9, 25.3, 24.9];
           var lsMon = [25.5, 25.3, 24.1, 22.1, 21.7, 23, 24, 25, 25.9, 25.2, 25, 25, 25.4, 25.1, 24.8, 25.1, 24.9, 25.6, 24.5, 24.1, 24.2, 23.5, 22.2, 22, 23, 24.8, 26.2, 26.6, 26.9, 26.5, 25.5, 25.8];


           var snTue = [24.3, 21.6, 19.3, 16.6, 15.6, 17.5, 19, 20.4, 19.9, 19.4, 21.1, 19.8, 20.1, 21.4, 20.9, 20.8, 19.6, 19.7, 19.7, 18.8, 18.6, 18.8, 16.8, 16.1, 16.6, 18.3, 21.1, 22, 21.5, 22.6, 23, 22.5];
           var sbTue = [23.1, 20, 16.9, 14.9, 15.3, 16.7, 18, 18.2, 18.4, 18.5, 18.9, 19.1, 19.1, 19.7, 19.6, 19.4, 19.1, 18.9, 18.8, 18.3, 18.1, 17.4, 16, 14.9, 15.5, 17.5, 19.1, 20.7, 20.7, 21.1, 21.3, 22.2];
           var lcTue = [24.8, 23.3, 21.1, 19.4, 19.7, 21.2, 22, 22, 22.2, 22.7, 23, 22.9, 23.1, 23.2, 23.1, 23.4, 22.6, 22.3, 22.3, 22.3, 21.7, 21.5, 19.7, 19.2, 20.5, 21.9, 23.5, 24.5, 24.8, 24.7, 24.3, 24.8];
           var lsTue = [25.9, 25.1, 24.2, 22.8, 21.9, 23.5, 24, 24.6, 25.2, 25.3, 25.4, 25.8, 25.5, 25.6, 25.7, 25.6, 25, 25.2, 24.8, 25.1, 25.3, 23.5, 22.2, 22.9, 23.8, 25.6, 26.2, 27, 27.1, 26.2, 25.4, 25.4];


           var snWed = [23.1, 20, 17, 15.7, 15.7, 17, 18.1, 18.4, 18.4, 18.8, 18.6, 19.1, 19.1, 19.6, 19.5, 19.3, 18.8, 18.9, 18.8, 18, 18.1, 17.6, 16.1, 15.1, 15.5, 17, 19.1, 20.3, 20.9, 21.1, 21.6, 22.2];
           var sbWed = [24.4, 22.2, 19.3, 18.1, 16.7, 17.4, 19.2, 19.4, 19.5, 20.3, 19.7, 19.5, 19.6, 21.4, 20.5, 20.6, 19.9, 19.7, 19.6, 19.1, 18.5, 18.5, 17, 15.8, 16.6, 18.1, 20.7, 22.3, 21.6, 22.3, 22.3, 22.6];
           var lcWed = [24.7, 23.3, 21.1, 19.5, 20, 21.3, 22, 21.8, 21.7, 22.4, 22.7, 22.7, 23, 23.4, 22.8, 22.8, 22.8, 22.6, 22.3, 22.2, 22.1, 21.8, 20, 19.1, 20.3, 22, 23.2, 24.2, 24.6, 24.6, 24.5, 25];
           var lsWed = [25.6, 25, 24.3, 22.5, 21.8, 22.8, 23.7, 25.2, 25.2, 25.1, 25.1, 24.7, 25.2, 24.9, 25, 25.1, 24.6, 24.5, 24.7, 25, 23.9, 23.9, 22.2, 22, 22.7, 24.7, 25.6, 26.5, 27, 26, 25.3, 25.8];


           var snThu = [23.7, 22.5, 18.7, 17.6, 16.5, 17.1, 18.7, 19.8, 19.5, 20.5, 19.7, 19.8, 20.1, 20.6, 20.7, 20.8, 20.3, 20.5, 19.4, 19, 18.1, 18.6, 16.9, 15.5, 16.4, 17.7, 21.2, 20.8, 21.4, 22.2, 22.1, 22.9];
           var sbThu = [22.8, 19.9, 16.7, 15.4, 15.3, 17, 17.7, 18.1, 18.8, 18.9, 18.9, 19.1, 19.2, 19.6, 19.6, 19.4, 19.3, 19, 18.5, 18.1, 17.8, 17.4, 15.8, 14.7, 15.5, 17.1, 18.9, 20, 20.9, 20, 21.4, 22.1];
           var lcThu = [24.9, 23.2, 21.3, 19.2, 20, 20.9, 22, 22.3, 22.1, 22.9, 23.1, 23.3, 23.4, 23.4, 23.3, 23.1, 22.9, 22.5, 22, 22.3, 21.9, 21.6, 19.6, 18.9, 20.2, 22, 23.2, 24.4, 24.2, 24.7, 24.6, 24.7];
           var lsThu = [28.5, 25.2, 24.2, 22.3, 22.3, 22.9, 24.1, 24.4, 25.5, 25.3, 25.4, 26, 25.4, 25.3, 25.1, 25.2, 25.1, 25, 24.7, 24.3, 24.8, 24.3, 22.2, 22.6, 22.9, 24.9, 25.6, 26.9, 26.9, 26.5, 25.3, 25.6];


           var snFri = [24.1, 21.6, 19.4, 17.6, 15.8, 17, 18.8, 20.1, 19.3, 20.3, 19.5, 20.3, 19.6, 20.4, 20.2, 20.3, 19.4, 20.5, 19.3, 19.4, 17.8, 17.6, 16.4, 15.3, 16.4, 17.2, 19.4, 20.7, 21.1, 22.4, 22.2, 22];
           var sbFri = [23, 19.7, 17, 15.1, 15.5, 16.9, 17.8, 18.4, 18.6, 18.7, 18.8, 19.1, 19.1, 19.4, 19.3, 19.1, 18.8, 18.7, 18.3, 17.7, 17.4, 16.9, 15.6, 14.4, 15, 16, 17.9, 19.6, 20.4, 20.8, 20.8, 21.6];
           var lcFri = [24.7, 23.6, 21, 19.2, 20.2, 21.4, 22, 22.3, 22.2, 22.6, 23.2, 22.7, 23, 23.2, 22.9, 22.6, 22.6, 22.4, 21.8, 21.5, 21.3, 21.1, 19.8, 18.6, 19.3, 21, 22.8, 23.5, 24.1, 24.6, 24.6, 25];
           var lsFri = [25.5, 25.3, 24.2, 22.2, 22, 24.2, 23.9, 24.4, 24.8, 25.4, 25.7, 26, 25.1, 25.5, 25.1, 24.9, 24.2, 25, 24, 24.5, 23.6, 23.7, 21.7, 21.6, 22.7, 24.4, 25.3, 26.4, 26.9, 26.6, 25.3, 25.4];


           var snSat = [24.8, 23, 21.2, 20.7, 20.3, 19.3, 19.5, 19.3, 19.0, 18.9, 19.6, 19.5, 18.6, 19, 19.8, 20, 19.4, 19.1, 19.4, 18.9, 18.7, 18.8, 18.2, 17.8, 18.6, 19.5, 21.4, 20.9, 21.6, 21.4, 23, 22.3];
           var sbSat = [23, 21.3, 19.7, 18.8, 18.5, 18.5, 18.4, 18, 17.5, 17.1, 17.1, 17.7, 18.2, 18.3, 18.8, 18.7, 18.4, 18.3, 18.2, 18, 17.9, 17.4, 16.7, 15.8, 16.5, 18.1, 19.2, 20.1, 20.1, 20.9, 20.8, 21.8];
           var lcSat = [25, 24.2, 22.5, 21.7, 21.8, 21.5, 21.8, 21.2, 21.2, 21.6, 21.7, 21.6, 22.3, 22.2, 22.4, 21.9, 21.8, 21.7, 21.7, 21.2, 21.5, 20.9, 20.2, 19.3, 20.1, 22.2, 23.1, 24, 24.1, 24.5, 24.3, 24.6];
           var lsSat = [25.8, 25.6, 25.7, 24.7, 23.9, 24.1, 24.3, 24.9, 24.6, 23.7, 24.1, 24.2, 24.8, 24.2, 24.5, 25, 24.3, 24.6, 24, 25.2, 24.1, 24, 22.4, 23.5, 23.9, 24.9, 25.7, 26.7, 26.8, 25.7, 24.9, 25.4];


           var snSun = [24.1, 23.9, 22.6, 22.3, 20.8, 21.6, 21.1, 20.2, 19.5, 19.6, 18.9, 19.2, 19.1, 19.2, 20.3, 20.1, 19.7, 19.8, 19.6, 19, 18.9, 19.9, 19, 19, 19.7, 21.9, 21.2, 21.7, 22, 22.1, 23.6, 22.8];
           var sbSun = [23.4, 22.6, 21, 20.2, 19.6, 19, 18.9, 18.4, 17.7, 17.4, 17.4, 17.8, 18.1, 18.6, 19, 18.4, 18.8, 18.2, 17.6, 17.6, 17.4, 17.3, 16.8, 16.5, 17.7, 19.1, 20.1, 20.5, 20.8, 21.4, 21.8, 22.5];
           var lcSun = [25.1, 24.6, 23.8, 22.6, 22.6, 22.1, 22, 21.7, 21.3, 21.2, 21.5, 21.6, 22, 22, 22.2, 22, 21.8, 21.3, 21.8, 21.3, 21.3, 20.7, 20.8, 20.6, 21.2, 22.4, 23.8, 24.8, 24.7, 24.5, 24.6, 24.8];
           var lsSun = [25.9, 26.3, 26, 25.2, 25.6, 24.3, 24.9, 24.7, 24, 23.9, 23.8, 23.8, 24.7, 24.5, 24.9, 24.7, 24.5, 23.6, 23.8, 23.8, 24.1, 24.1, 23.5, 23.4, 24.6, 25.3, 26.2, 26.9, 26.9, 26.8, 25.8, 25.6];

                    
       
        var myChart1 = echarts.init(document.getElementById('imgbox0'));

        option1 = {
            backgroundColor: '#f5f5f5f ', //#f2f2e6
            title: {
                text: '平均行程速度（km/h）',
                //                textAlign:'center',
                textStyle: {
                    fontSize: 20,
                    fontWeight: 'bolder',
                    color: 'white'//#3399ff


                }

            },
            tooltip: {
                trigger: 'axis',
                showDelay: 0,
                hideDelay: 50,
                transitionDuration: 0,
                backgroundColor: 'rgba(41,56,56)',
                borderColor: 'rgba(41,56,56)',
                borderRadius: 8,
                borderWidth: 1,
                padding: 10,    // [5, 10, 15, 20]
                position: function (p) {
                    // 位置回调
                    // console.log && console.log(p);
                    return [p[0] + 10, p[1] - 10];
                },
                textStyle: {
                    color: 'white',
                    decoration: 'none',
                    fontFamily: 'Verdana, sans-serif',
                    fontSize: 15,
//                    fontStyle: 'italic',
                //    fontWeight: 'bold'
                },
                formatter: function (params, ticket, callback) {
                    console.log(params)
                    var res = params[0].name;
                    for (var i = 0, l = params.length; i < l; i++) {
                        res += '<br/>' + params[i].seriesName + ' : ' + params[i].value;
                    }
                    setTimeout(function () {
                        // 仅为了模拟异步回调
                        callback(ticket, res);
                    }, 1000)
                    return 'loading';
                }
            },
            legend: {
                data: ['市南区', '市北区', '李沧区', '崂山区'],
                itemWidth: 35,
                itemHeight: 25,
                //                                   orient: 'vertical',
                //                                   x: 'right',
                //                                   y:'center',
                textStyle: { color: 'white', fontSize: 15, fontWeight: 'bold' },
              //  backgroundColor: '#99CCCC', //#f2f2e6
                //                   borderColor: 'rgba(178,34,34,0.8)',
                //                   borderWidth: 2,
                padding: 10,    // [5, 10, 15, 20]
                itemGap: 10

            },
            toolbox: {
                show: true,
                feature: {
                    mark: { show: false },
                    dataView: { show: true, readOnly: false },
                    magicType: { show: true, type: ['line', 'bar'] },
                    restore: { show: true },
                    saveAsImage: { show: true }
                }
            },
            calculable: false,
            color: ['black', 'red', 'orange', 'green'],

            xAxis: [
           {
               splitLine: {
                   show: false

               },
               name: '时间',
               nameTextStyle: {
                   fontSize: 20,
                   fontStyle: 'normal',
                   fontWeight: 'bold',
                   color: 'white'

               },
               axisLabel: {
                   show: true,
                   textStyle: {
                       color: 'white',
                       fontSize: 15,
                       fontStyle: 'normal',
                       fontWeight: 'bold'
                   }
               },

               type: 'category',
               boundaryGap: false,
               data: ['6:00', '6:30', '7:00', '7:30', '8:00', '8:30', '9:00', '9:30', '10:00', '10:30', '11:00', '11:30', '12:00', '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', '18:00', '18:30', '19:00', '19:30', '20:00', '20:30', '21:00', '21:30']
             }

    ],
            yAxis: [
        {
            //            name: 'Average travel speed(km/h)',
            //            nameTextStyle: {
            //            color:'white',
            //                fontSize: 25,
            //                fontStyle: 'normal',
            //                fontWeight: 'bold'

            //            },
            //            position: 'left',
            splitLine: {
                show: true

            },
            splitArea: {
                show: 'true',
                areaStyle: {
                    color: [
                '#99CCCC',
                '#95c7c7']

                }

            },
            axisLabel: {
                show: true,
                textStyle: {
                    color: 'white',
                    fontSize: 15,
                    fontStyle: 'normal',
                    fontWeight: 'bold'
                }
            },
            type: 'value',
            min:5,
            max:30        


        }
    ],

            series: [

            { smooth: 'true',
                name: '市南区',
                type: 'line',
                data: [23.9, 21.5, 18.7, 16.6, 16.1, 16.7, 19.4, 19.1, 19.5, 19.8, 20.8, 20.9, 20, 21.6, 20.7, 20.4, 20.7, 19.8, 20.1, 19.2, 19.4, 18.8, 17.5, 15.9, 16.6, 17.7, 21.1, 21.4, 21.7, 22.1, 22.3, 22.9],

                itemStyle: {
                    normal: {
                        lineStyle: {
                            width: 2

                        }
                    }

                }
            },
        { smooth: 'true',
            name: '市北区',
            type: 'line',
            data: [22.9, 19.5, 16.3, 14.3, 14.6, 16.5, 17.6, 18.1, 18.7, 18.9, 18.8, 19.3, 19.8, 19.8, 19.7, 19.5, 18.9, 19.2, 18.7, 18.3, 18.2, 17.8, 16.3, 15.2, 15.5, 17, 19, 20.6, 21, 21.1, 21.6, 22.4],

            itemStyle: {
                normal: {
                    lineStyle: {
                        width: 2
                    }
                }

            }
        },
        { smooth: 'true',
            name: '李沧区',
            type: 'line',
            data: [24.7, 22.9, 20.9, 18.7, 19.4, 20.9, 22.2, 22.4, 22, 22.8, 22.9, 22.8, 23.3, 23.6, 22.8, 22.8, 22.2, 22.3, 22.5, 22.2, 21.8, 21.4, 19.9, 19.1, 20.2, 22.1, 23.5, 24.3, 24.7, 24.9, 25.3, 24.9],

            itemStyle: {
                normal: {
                    lineStyle: {
                        width: 2

                    }
                }
            }

        }, { smooth: 'true',
            name: '崂山区',
            type: 'line',
            data: [25.5, 25.3, 24.1, 22.1, 21.7, 23, 24, 25, 25.9, 25.2, 25, 25, 25.4, 25.1, 24.8, 25.1, 24.9, 25.6, 24.5, 24.1, 24.2, 23.5, 22.2, 22, 23, 24.8, 26.2, 26.6, 26.9, 26.5, 25.5, 25.8],

            itemStyle: {
                normal: {
                    lineStyle: {
                        width: 2
                    }
                }
            }
        }

    ]
        };

    myChart1.setOption(option1);
    var opt = myChart1.getOption();
    $("#img_week").find("span:eq(0)").click(function () {
        opt.series[0]['data'] = snMon;
        opt.series[1]['data'] = sbMon;
        opt.series[2]['data'] = lcMon;
        opt.series[3]['data'] = lsMon;
        myChart1.setOption(opt);
    });
    $("#img_week").find("span:eq(1)").click(function () {
        opt.series[0]['data'] = snTue;
        opt.series[1]['data'] = sbTue;
        opt.series[2]['data'] = lcTue;
        opt.series[3]['data'] = lsTue;
        myChart1.setOption(opt);
    });
    $("#img_week").find("span:eq(2)").click(function () {
        opt.series[0]['data'] = snWed;
        opt.series[1]['data'] = sbWed;
        opt.series[2]['data'] = lcWed;
        opt.series[3]['data'] = lsWed;
        myChart1.setOption(opt);
    });
    $("#img_week").find("span:eq(3)").click(function () {
        opt.series[0]['data'] = snThu;
        opt.series[1]['data'] = sbThu;
        opt.series[2]['data'] = lcThu;
        opt.series[3]['data'] = lsThu;
        myChart1.setOption(opt);
    });

    $("#img_week").find("span:eq(4)").click(function () {
        opt.series[0]['data'] = snFri;
        opt.series[1]['data'] = sbFri;
        opt.series[2]['data'] = lcFri;
        opt.series[3]['data'] = lsFri;
        myChart1.setOption(opt);
    });
    $("#img_week").find("span:eq(5)").click(function () {
        opt.series[0]['data'] = snSat;
        opt.series[1]['data'] = sbSat;
        opt.series[2]['data'] = lcSat;
        opt.series[3]['data'] = lsSat;
        myChart1.setOption(opt);
    });
    $("#img_week").find("span:eq(6)").click(function () {
        opt.series[0]['data'] = snSun;
        opt.series[1]['data'] = sbSun;
        opt.series[2]['data'] = lcSun;
        opt.series[3]['data'] = lsSun;
        myChart1.setOption(opt);
    });




    ////五大商圈  整点与半点柱状图
    var myChart2;
    myChart2 = echarts.init(document.getElementById('imgbox2'));

//    option2 = {
//        title: {
//            text: '五大商圈拥堵占比变化',
//            x: 'right',
//            y: 'bottom'
//        },
//        //            tooltip: {
//        //                    show:true,
//        //                   // trigger: 'item',
//        //                    formatter: "{d}%"
//        //                },
//        legend: {
//            orient: 'vertical',
//            x: 'left',
//            data: ['台东商圈', '香港中路商圈', '市北CBD商圈', '奥帆中心商圈', '李村商圈'],
//            textStyle: {
//                color: 'white'

//            }

//        },
//        toolbox: {
//            show: true,
//            feature: {
//                mark: { show: true },
//                dataView: { show: true, readOnly: false },
//                restore: { show: true },
//                saveAsImage: { show: true }
//            }
//        },
//        calculable: false,
//        series: (function () {
//            var series = [];
//            for (var i = 0; i < 30; i++) {
//                series.push({
//                    name: '商圈',
//                    type: 'pie',
//                    itemStyle: { normal: {
//                        label: { show: i > 28 },
//                        labelLine: { show: i > 28, length: 20 }
//                    }
//                    },
//                    radius: [i * 4 + 40, i * 4 + 43],
//                    data: [
//                    { value: i * 128 + 80, name: '台东商圈' },
//                    { value: i * 64 + 160, name: '市北CBD商圈' },
//                    { value: i * 32 + 320, name: '李村商圈' },
//                    { value: i * 16 + 640, name: '香港中路商圈' },
//                    { value: i * 8 + 1280, name: '奥帆中心商圈' }
//                ]
//                })
//            }
//            series[0].markPoint = {
//                symbol: 'emptyCircle',
//                symbolSize: series[0].radius[0],
//                effect: { show: true, scaleSize: 12, color: 'rgba(250,225,50,0.8)', shadowBlur: 10, period: 30 },
//                data: [{ x: '50%', y: '50%'}]
//            };
//            return series;
//        })()
//    };
//    setTimeout(function () {
//        var _ZR = myChart2.getZrender();
//        var TextShape = require('zrender/shape/Text');
//        // 补充千层饼
//        _ZR.addShape(new TextShape({
//            style: {
//                x: _ZR.getWidth() / 2,
//                y: _ZR.getHeight() / 2,
//                color: '#666',
//                text: '交通拥堵',
//                textAlign: 'center'
//            }
//        }));
//        _ZR.addShape(new TextShape({
//            style: {
//                x: _ZR.getWidth() / 2 + 200,
//                y: _ZR.getHeight() / 2,
//                brushType: 'fill',
//                color: 'orange',
//                text: '拥堵',
//                textAlign: 'left',
//                textFont: 'normal 20px 微软雅黑'
//            }
//        }));
//        _ZR.refresh();
//    }, 2000);

//    myChart2.setOption(option2);




//    ////饼状图

//    option3 = {
//        tooltip: {
//            trigger: 'item',
//            formatter: "{a} <br/>{b} : {c} ({d}%)"
//        },
//        legend: {
//            orient: 'vertical',
//            x: 'left',
//            data: ['拥堵', '缓行', '顺畅'],
//            textStyle: { color: 'white' }
//        },
//        color: ['red', 'yellow', 'lime'],
//        toolbox: {
//            show: true,
//            feature: {
//                mark: { show: true },
//                dataView: { show: true, readOnly: false },
//                magicType: {
//                    show: true,
//                    type: ['pie', 'funnel'],
//                    option: {
//                        funnel: {
//                            x: '25%',
//                            width: '50%',
//                            funnelAlign: 'center',
//                            max: 1548
//                        }
//                    }
//                },
//                restore: { show: true },
//                saveAsImage: { show: true }
//            }
//        },
//        calculable: true,
//        series: [
//        {
//            name: '台东商圈',
//            type: 'pie',
//            radius: ['25%', '35%'],
//            center: ['25%', '32%'],
//            itemStyle: {
//                normal: {
//                    label: {
//                        formatter: '台东商圈',
//                        textStyle: {
//                            fontSize: '12',
//                            color: 'black'
//                            //                            fontWeight: 'bold'
//                        },
//                        position: 'center',
//                        show: true
//                    },
//                    labelLine: {
//                        show: false
//                    }
//                },
//                emphasis: {
//                    label: {
//                        show: false
//                        //                        position: 'inner',
//                        //                        textStyle: {
//                        //                            fontSize: '18',
//                        //                            fontWeight: 'bold'
//                        //                        }
//                    }
//                }
//            },
//            data: [
//                { value: 66, name: '拥堵' },
//                { value: 583, name: '缓行' },
//                { value: 23, name: '顺畅' }

//            ]
//        },
//          {
//              name: '香港中路商圈',
//              type: 'pie',
//              radius: ['25%', '35%'],
//              center: ['50%', '32%'],
//              itemStyle: {
//                  normal: {
//                      label: {
//                          formatter: '香港中路商圈',
//                          textStyle: {
//                              fontSize: '12',
//                              color: 'black'

//                          },
//                          position: 'center',
//                          show: true
//                      },
//                      labelLine: {
//                          show: false
//                      }
//                  }
//              },
//              emphasis: {
//                  label: {
//                      show: false
//                  }
//              },
//              data: [
//                { value: 27, name: '拥堵' },
//                { value: 425, name: '缓行' },
//                { value: 220, name: '顺畅' }

//            ]
//          }, {
//              name: '市北CBD商圈',
//              type: 'pie',
//              radius: ['25%', '35%'],
//              center: ['75%', '32%'],
//              itemStyle: {
//                  normal: {
//                      label: {
//                          formatter: '市北CBD商圈',
//                          textStyle: {
//                              fontSize: '12',
//                              color: 'black'

//                          },
//                          position: 'center',
//                          show: true
//                      },
//                      labelLine: {
//                          show: false
//                      }
//                  },
//                  emphasis: {
//                      label: {
//                          show: true

//                      }
//                  }
//              },
//              data: [
//                { value: 61, name: '拥堵' },
//                { value: 491, name: '缓行' },
//                { value: 120, name: '顺畅' }

//            ]
//          },
//           {
//               name: '奥帆中心商圈',
//               type: 'pie',
//               radius: ['25%', '35%'],
//               center: ['37.5%', '75%'],
//               itemStyle: {
//                   normal: {
//                       label: {
//                           formatter: '奥帆中心商圈',
//                           textStyle: {
//                               fontSize: '12',
//                               color: 'black'

//                           },
//                           position: 'center',
//                           show: true
//                       },
//                       labelLine: {
//                           show: false
//                       }
//                   },
//                   emphasis: {
//                       label: {
//                           show: false

//                       }
//                   }
//               },
//               data: [
//                { value: 64, name: '拥堵' },
//                { value: 545, name: '缓行' },
//                { value: 63, name: '顺畅' }

//            ]
//           },
//          {
//              name: '李村商圈',
//              type: 'pie',
//              radius: ['25%', '35%'],
//              center: ['62.5%', '75%'],
//              itemStyle: {
//                  normal: {
//                      label: {
//                          formatter: '李村商圈',
//                          textStyle: {
//                              fontSize: '12',
//                              color: 'black'

//                          },
//                          position: 'center',
//                          show: true
//                      },
//                      labelLine: {
//                          show: false
//                      }
//                  },
//                  emphasis: {
//                      label: {
//                          show: false

//                      }
//                  }
//              },
//              data: [
//                { value: 18, name: '拥堵' },
//                { value: 423, name: '缓行' },
//                { value: 231, name: '顺畅' }

//            ]
//          }
//    ]
//    };


    //工作日  饼状图

    option2 = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data: ['拥堵', '轻微拥堵', '缓行', '畅通', '非常畅通'],
            textStyle: { color: 'white', fontSize: '15',fontWeight:'bold' }
        },
        color: ['#ba0100', '#D2691E', '#f99507', '#14bd00', 'green'],
        toolbox: {
            show: true,
            feature: {
                mark: { show: true },
                dataView: { show: true, readOnly: false },
                magicType: {
                    show: true,
                    type: ['pie', 'funnel'],
                    option: {
                        funnel: {
                            x: '25%',
                            width: '50%',
                            funnelAlign: 'center',
                            max: 1548
                        }
                    }
                },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        calculable: true,
        series: [
        {
            name: '台东商圈',
            type: 'pie',
            radius: ['25%', '35%'],
            center: ['25%', '32%'],
            itemStyle: {
                normal: {
                    label: {
                        formatter: '台东商圈',
                        textStyle: {
                            fontSize: '15',
                            color: 'navy',
                                                  //    fontWeight: 'bold'
                        },
                        position: 'center',
                        show: true
                    },
                    labelLine: {
                        show: false
                    }
                },
                emphasis: {
                    label: {
                        show: false
                        //                        position: 'inner',
                        //                        textStyle: {
                        //                            fontSize: '18',
                        //                            fontWeight: 'bold'
                        //                        }
                    }
                }
            },
            data: [
                { value: 196, name: '拥堵' },               
                { value: 259, name: '轻微拥堵' },
                { value: 10, name: '缓行' },
                { value: 5, name: '畅通' },
                { value: 10, name: '非常畅通' }

            ]
        },
          {
              name: '香港中路商圈',
              type: 'pie',
              radius: ['25%', '35%'],
              center: ['50%', '32%'],
              itemStyle: {
                  normal: {
                      label: {
                          formatter: '香港中路商圈',
                          textStyle: {
                              fontSize: '15',
                              color: 'navy'

                          },
                          position: 'center',
                          show: true
                      },
                      labelLine: {
                          show: false
                      }
                  }
              },
              emphasis: {
                  label: {
                      show: false
                  }
              },
              data: [
                { value: 89, name: '拥堵' },            
                { value: 194, name: '轻微拥堵' },
                { value: 55, name: '缓行' },
                { value: 55, name: '畅通' },
                { value: 87, name: '非常畅通' }

            ]
          }, {
              name: '市北CBD商圈',
              type: 'pie',
              radius: ['25%', '35%'],
              center: ['75%', '32%'],
              itemStyle: {
                  normal: {
                      label: {
                          formatter: '市北CBD商圈',
                          textStyle: {
                              fontSize: '15',
                              color: 'navy'

                          },
                          position: 'center',
                          show: true
                      },
                      labelLine: {
                          show: false
                      }
                  },
                  emphasis: {
                      label: {
                          show: false

                      }
                  }
              },
              data: [
                { value: 153, name: '拥堵' },               
                { value: 193, name: '轻微拥堵' },
                  { value: 52, name: '缓行' },
                { value: 34, name: '畅通' },
                { value: 48, name: '非常畅通' }

            ]
          },
           {
               name: '奥帆中心商圈',
               type: 'pie',
               radius: ['25%', '35%'],
               center: ['37.5%', '75%'],
               itemStyle: {
                   normal: {
                       label: {
                           formatter: '奥帆中心商圈',
                           textStyle: {
                               fontSize: '15',
                               color: 'navy'

                           },
                           position: 'center',
                           show: true
                       },
                       labelLine: {
                           show: false
                       }
                   },
                   emphasis: {
                       label: {
                           show: false

                       }
                   }
               },
               data: [
                { value: 209, name: '拥堵' },                
                { value: 186, name: '轻微拥堵' },
                { value: 41, name: '缓行' },
                { value: 25, name: '畅通' },
                { value: 19, name: '非常畅通' }

            ]
           },
          {
              name: '李村商圈',
              type: 'pie',
              radius: ['25%', '35%'],
              center: ['62.5%', '75%'],
              itemStyle: {
                  normal: {
                      label: {
                          formatter: '李村商圈',
                          textStyle: {
                              fontSize: '15',
                              color: 'navy'

                          },
                          position: 'center',
                          show: true
                      },
                      labelLine: {
                          show: false
                      }
                  },
                  emphasis: {
                      label: {
                          show: false

                      }
                  }
              },
              data: [
                { value: 28, name: '拥堵' },              
                { value: 132, name: '轻微拥堵' },
                  { value: 146, name: '缓行' },
                { value: 70, name: '畅通' },
                { value: 104, name: '非常畅通' }

            ]
          }
    ]
    };

    myChart2.setOption(option2);

    ////非工作日  饼状图

    option3 = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data: [ '拥堵', '轻微拥堵', '缓行', '畅通', '非常畅通'],
            textStyle: { color: 'white', fontSize: '15',fontWeight:'bold' }
        },
        color: ['#ba0100', '#D2691E', '#f99507', '#14bd00', '#0f6a04'],
        toolbox: {
            show: true,
            feature: {
                mark: { show: true },
                dataView: { show: true, readOnly: false },
                magicType: {
                    show: true,
                    type: ['pie', 'funnel'],
                    option: {
                        funnel: {
                            x: '25%',
                            width: '50%',
                            funnelAlign: 'center',
                            max: 1548
                        }
                    }
                },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        calculable: true,
        series: [
        {
            name: '台东商圈',
            type: 'pie',
            radius: ['25%', '35%'],
            center: ['25%', '32%'],
            itemStyle: {
                normal: {
                    label: {
                        formatter: '台东商圈',
                        textStyle: {
                            fontSize: '15',
                            color: 'navy'
                            //                            fontWeight: 'bold'
                        },
                        position: 'center',
                        show: true
                    },
                    labelLine: {
                        show: false
                    }
                },
                emphasis: {
                    label: {
                        show: false
                        //                        position: 'inner',
                        //                        textStyle: {
                        //                            fontSize: '18',
                        //                            fontWeight: 'bold'
                        //                        }
                    }
                }
            },
            data: [
                { value: 119, name: '拥堵' },               
                { value: 48, name: '轻微拥堵' },
                  { value: 17, name: '缓行' },
                { value: 3, name: '畅通' },
                { value: 5, name: '非常畅通' }

            ]
        },
          {
              name: '香港中路商圈',
              type: 'pie',
              radius: ['25%', '35%'],
              center: ['50%', '32%'],
              itemStyle: {
                  normal: {
                      label: {
                          formatter: '香港中路商圈',
                          textStyle: {
                              fontSize: '15',
                              color: 'navy'

                          },
                          position: 'center',
                          show: true
                      },
                      labelLine: {
                          show: false
                      }
                  }
              },
              emphasis: {
                  label: {
                      show: false
                  }
              },
              data: [
                { value: 3, name: '拥堵' },          
                { value: 66, name: '轻微拥堵' },
                { value: 45, name: '缓行' },
                { value: 26, name: '畅通' },
                { value: 52, name: '非常畅通' }

            ]
          }, {
              name: '市北CBD商圈',
              type: 'pie',
              radius: ['25%', '35%'],
              center: ['75%', '32%'],
              itemStyle: {
                  normal: {
                      label: {
                          formatter: '市北CBD商圈',
                          textStyle: {
                              fontSize: '15',
                              color: 'navy'

                          },
                          position: 'center',
                          show: true
                      },
                      labelLine: {
                          show: false
                      }
                  },
                  emphasis: {
                      label: {
                          show: false

                      }
                  }
              },
              data: [
                { value: 57, name: '拥堵' },              
                { value: 80, name: '轻微拥堵' },
                { value: 17, name: '缓行' },
                { value: 21, name: '畅通' },
                { value: 17, name: '非常畅通' }

            ]
          },
           {
               name: '奥帆中心商圈',
               type: 'pie',
               radius: ['25%', '35%'],
               center: ['37.5%', '75%'],
               itemStyle: {
                   normal: {
                       label: {
                           formatter: '奥帆中心商圈',
                           textStyle: {
                               fontSize: '15',
                               color: 'navy'

                           },
                           position: 'center',
                           show: true
                       },
                       labelLine: {
                           show: false
                       }
                   },
                   emphasis: {
                       label: {
                           show: false

                       }
                   }
               },
               data: [
                { value: 91, name: '拥堵' },              
                { value: 64, name: '轻微拥堵' },
                { value: 17, name: '缓行' },
                { value: 9, name: '畅通' },
                { value: 10, name: '非常畅通' }

            ]
           },
          {
              name: '李村商圈',
              type: 'pie',
              radius: ['25%', '35%'],
              center: ['62.5%', '75%'],
              itemStyle: {
                  normal: {
                      label: {
                          formatter: '李村商圈',
                          textStyle: {
                              fontSize: '15',
                              color: 'navy'

                          },
                          position: 'center',
                          show: true
                      },
                      labelLine: {
                          show: false
                      }
                  },
                  emphasis: {
                      label: {
                          show: false

                      }
                  }
              },
              data: [
                { value: 69, name: '拥堵' },              
                { value: 48, name: '轻微拥堵' },
                { value: 18, name: '缓行' },
                { value: 17, name: '畅通' },
                { value: 40, name: '非常畅通' }

            ]
          }
    ]
    };

    

    $("#week").click(function () {
        myChart2 = echarts.init(document.getElementById('imgbox2'));
        myChart2.clear();
        myChart2.setOption(option2);
    });
    $("#weekend").click(function () {
        myChart2 = echarts.init(document.getElementById('imgbox2'));
        myChart2.clear();
        myChart2.setOption(option3);
    });



   


    ////k值图  使用option选择

var myChart4 = echarts.init(document.getElementById('imgbox1'));

    option4 = {
        title: {
            text: '平均行程速度（km/h）',
            textStyle: {
            color:'white',
            fontSize:'20'
            
            }
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                var res = params[0].seriesName + ' ' + params[0].name;
                res += '<br/>  周一 : ' + params[0].value[0] + '  最高 : ' + params[0].value[3];
                res += '<br/>  周五 : ' + params[0].value[1] + '  最低 : ' + params[0].value[2];
                return res;
            }
        },
//        legend: {
//            data: ['市南区']
//           
//        },
   
        toolbox: {
            show: true,
            feature: {
//                mark: { show: true },
                dataZoom: { show: true },
                dataView: { show: true, readOnly: false },
                magicType: { show: true, type: ['line', 'bar'] },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        dataZoom: {
            show: true,
            realtime: true,
            start: 50,
            end: 100
        },
        xAxis: [
        {
            type: 'category',
            boundaryGap: true,
            axisTick: { onGap: false },
            splitLine: { show: false },
            name: '时间',
            nameTextStyle: {
                fontSize: 20,
                fontStyle: 'normal',
                fontWeight: 'bold',
                color: 'white'

            },

            axisLabel: {
                show: true,
                textStyle: {
                    color: 'white',
                    fontSize: 15,
                    fontStyle: 'normal',
                    fontWeight: 'bold'
                }
            },

            data: ["06:00","06:10","06:20","06:30","06:40","06:50",
            "07:00","07:10","07:20","07:30","07:40","07:50",
            "08:00","08:10","08:20","08:30","08:40","08:50",
            "09:00","09:10","09:20","09:30","09:40","09:50",
            "10:00","10:10","10:20","10:30","10:40","10:50",
             "11:00","11:10","11:20","11:30","11:40","11:50",
             "12:00","12:10","12:20","12:30","12:40","12:50",
             "13:00","13:10","13:20","13:30","13:40","13:50",
             "14:00","14:10","14:20","14:30","14:40","14:50",
             "15:00","15:10","15:20","15:30","15:40","15:50",
             "16:00","16:10","16:20","16:30","16:40","16:50",
             "17:00","17:10","17:20","17:30","17:40","17:50",
             "18:00","18:10","18:20","18:30","18:40","18:50",
              "19:00","19:10","19:20","19:30","19:40","19:50",
              "20:00","20:10","20:20","20:30","20:40","20:50"
            ]
        }
    ],
        yAxis: [
        {
            type: 'value',
            scale: true,
            axisLabel: {
                show: true,
                textStyle: {
                    color: 'white',
                    fontSize: 15,
                    fontStyle: 'normal',
                    fontWeight: 'bold'
                }
            },
           
            boundaryGap: [0.01, 0.01]
        }
    ],
        series: [
        {
            name: '市南区',
            type: 'k',
            itemStyle: {
                normal: {
                    color: '#088ef6',           // 阳线填充颜色
                    color0: '#e4006d',  // 阴线填充颜色
                    lineStyle: {
                        width: 1,
                        color: '#088ef6',    // 阳线边框颜色
                        color0: '#e4006d'     // 阴线边框颜色
                    }
                },
                emphasis: {
                    color: 'black',         // 阳线填充颜色
                    color0: 'white'         // 阴线填充颜色
                }
            },
            data: // 周一,周五,最低,最高
            [  [	23.9	,	24.1	,	23.9 	,	24.8	],
            [	23.4	,	24.1	,	23.1	,	24.1	],
            [	23.2	,	22.6	,	22.6	,	23.5	],
            [	21.5	,	21.6	,	21.5	,	23.9	],
            [	21.2	,	21.1	,	21.1	,	23.4	],
            [	19.6	,	20	,	    19.6	,	22.7	],
            [	18.7 	,	19.4 	,	18.7	,	22.6	],
            [	17.9 	,	18.5 	,	17.9	,	22.6	],
            [	17.2 	,	17.8 	,	17.2	,	22.1	],
            [	16.6	,	17.6	,	16.6	,	22.3	],
            [	15.8	,	17.2	,	15.8	,	21.2	],
            [	15.1	,	16.3	,	15.1	,	21.6	],
            [	16.1	,	15.8	,	15.8	,	20.8    ],
            [	15.2	,	16	,	    15.2	,	20.6	]	,
            [	16.8	,	16.4	,	16.4	,	21.6	]	,
            [	16.7	,	17	,	    16.7	,	21.6	]	,
            [	17.8	,	17.6	,	17.6	,	20.5	]	,
            [	17.9	,	18.6	,	17.9	,	21.1	]	,
            [	19.4	,	18.8	,	18.8	,	21.1	]	,
            [	19.1	,	18.8	,	18.8	,	20.4	]	,
            [	19.4	,	19.9	,	19.4	,	20.2	]	,
            [	19.1	,	20.1	,	19.1	,	20.2	]	,
            [	19.7	,	20	,	    19.7	,	20	    ]	,
            [	19.6	,	19.8	,	19.6	,	20.3	]	,
            [	19.5	,	19.3	,	19	,	    19.5	]	,
            [	19.6	,	19.3	,	19.1	,	19.6	]	,
            [	19.6	,	20.3	,	19.3	,	20.3	]	,
            [	19.8	,	20.3	,	18.9	,	20.3	]	,
            [	19.8	,	20.2	,	18.7	,	20.2	]	,
            [	19.9	,	20.4	,	19	,	    20.4	]	,
            [	20.8	,	19.5	,	18.9	,	20.8	]	,
            [	19.8	,	19.3	,	18.6	,	19.8	]	,
            [	20.5	,	19.4	,	18.8	,	20.5	]	,
            [	20.9	,	20.3	,	19.2	,	20.9	]	,
            [	20	,	    20.3	,	18.6	,	20.3	]	,
            [	21.3	,	20.9	,	18.7	,	21.3	]	,
            [	20	,	    19.6	,	18.6	,	20	]	,
            [	20.9	,	20.6	,	19.2	,	20.9	]	,
            [	21.6	,	20.4	,	19.7	,	21.6	]	,
            [	21.6	,	20.4	,	19	,    	21.6	]	,
            [	21.7	,	20.6	,	19.6	,	21.7	]	,
            [	21.9	,	24.3	,	19.9	,	24.3	]	,
            [	20.7	,	28.2	,	19.8	,	28.2	]	,
            [	20.7	,	24.5	,	19.8	,	24.5	]	,
            [	20.5	,	19.7	,	19.7	,	20.5	]	,
            [	20.4	,	20.3	,	20	,	    20.4	]	,
            [	20.3	,	19.9	,	19.8	,	20.4	]	,
            [	20.4	,	20.5	,	19.4	,	20.5	]	,
            [	20.7	,	19.4	,	19.4	,	20.7	]	,
            [	19.9	,	19.4	,	19.2	,	19.9	]	,
            [	20.6	,	19.1	,	19	,	    20.6	]	,
            [	19.8	,	20.5	,	19.1	,	20.5	]	,
            [	20.7	,	19.8	,	19.8	,	20.7	]	,
            [	19.7	,	19.6	,	19	,	    19.7	]	,
            [	20.1	,	19.3	,	19.3	,	20.1	]	,
            [	20.4	,	19.5	,	18.8	,	20.4	]	,
            [	19.6	,	19.8	,	18.9	,	19.9	]	,
            [	19.2	,	19.4	,	18.9	,	19.4	]	,
            [	19.4	,	18.2	,	18.2	,	19.6	]	,
            [	19.2	,	18.7	,	18.7	,	19.9	]	,
            [	19.4	,	17.8	,	17.8	,	19.4	]	,
            [	19.5	,	19.2	,	18.4	,	19.9	]	,
            [	20.5	,	19.4	,	18.8	,	20.5	]	,
            [	18.8	,	17.6	,	17.6	,	19.9	]	,
            [	18.4	,	17.8	,	17.8	,	18.7	]	,
            [	18.1	,	17.3	,	17.3	,	19	]	,
            [	17.5	,	16.4	,	16.4	,	19	]	,
            [	16.5	,	15.5	,	15.5	,	18.7	]	,
            [	16.2	,	16.2	,	16.2	,	18.5	]	,
            [	15.9	,	15.3	,	15.3	,	19	]	,
            [	15.6	,	15.1	,	15.1	,	18.4	]	,
            [	15.7	,	14.8	,	14.8	,	18.8	]	,
            [	16.6	,	16.4	,	16.4	,	19.7	]	,
            [	17.6	,	15.6	,	15.6	,	19.8	]	,
            [	17.6	,	17.2	,	17.2	,	20.9	]	,
            [	17.7	,	17.2	,	17.2	,	21.9	]	,
            [	19	,	    17.4	,	17.4	,	20.7	]	,
            [	19.3	,	19.7	,	19.3	,	21.5	]	,
            [	21.1	,	19.4	,	19.4	,	21.4	]	,
            [	21.5	,	19.8	,	19.8	,	21.5	]	,
            [	21	,	    20.2	,	20.2	,	21.5	]	,
            [	21.4	,	20.7	,	20.7	,	21.7	]	,
            [	22.1	,	21.3	,	21.1	,	22.4	]	,
            [	21.6	,	21.2	,	21.1	,	21.9	]	,
            [	21.7	,	21.1	,	21.1	,	22	]	,
            [	21.7	,	21.1	,	21.1	,	21.7	]	,
            [	21.8	,	21.4	,	21.4	,	22.1	]	,
            [	22.1	,	22.4	,	21.4	,	22.4	]	,
            [	23	,	    21.3	,	21.3	,	23	]	,
            [	22.5	,	22.2	,	22.2	,	23.6	]	,
            [	22.3	,	22.2	,	22.2	,	23.6	]	,
            [	22.6	,	21.6	,	21.6	,	22.6	]	,
            [	22.6	,	21.6	,	21.6	,	23.2	]	,
            [	22.9	,	22	,	    22	,	    22.9	]	,
            [	23.6	,	22.5	,	22.5	,	24.3	]	,
            [	23.5	,	22.8	,	22.8	,	24	]	
          ]
        }

    ]
    };

    myChart4.setOption(option4);



    ////市北区


    option5 = {
        title: {
            text: '平均行程速度（km/h）',
            textStyle: {
                color: 'white',
                fontSize: '20'

            }
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                var res = params[0].seriesName + ' ' + params[0].name;
                res += '<br/>  周一 : ' + params[0].value[0] + '  最高 : ' + params[0].value[3];
                res += '<br/>  周五 : ' + params[0].value[1] + '  最低 : ' + params[0].value[2];
                return res;
            }
        },
//        legend: {
//            data: ['市北区']
//        },

        toolbox: {
            show: true,
            feature: {
                //                mark: { show: true },
                dataZoom: { show: true },
                dataView: { show: true, readOnly: false },
                magicType: { show: true, type: ['line', 'bar'] },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        dataZoom: {
            show: true,
            realtime: true,
            start: 50,
            end: 100
        },
        xAxis: [
        {
            type: 'category',
            name: '时间',
            nameTextStyle: {
                fontSize: 20,
                fontStyle: 'normal',
                fontWeight: 'bold',
                color: 'white'

            },

            axisLabel: {
                show: true,
                textStyle: {
                    color: 'white',
                    fontSize: 15,
                    fontStyle: 'normal',
                    fontWeight: 'bold'
                }
            },
            boundaryGap: true,
            axisTick: { onGap: false },
            splitLine: { show: false },

            data: ["06:00", "06:10", "06:20", "06:30", "06:40", "06:50",
            "07:00", "07:10", "07:20", "07:30", "07:40", "07:50",
            "08:00", "08:10", "08:20", "08:30", "08:40", "08:50",
            "09:00", "09:10", "09:20", "09:30", "09:40", "09:50",
            "10:00", "10:10", "10:20", "10:30", "10:40", "10:50",
             "11:00", "11:10", "11:20", "11:30", "11:40", "11:50",
             "12:00", "12:10", "12:20", "12:30", "12:40", "12:50",
             "13:00", "13:10", "13:20", "13:30", "13:40", "13:50",
             "14:00", "14:10", "14:20", "14:30", "14:40", "14:50",
             "15:00", "15:10", "15:20", "15:30", "15:40", "15:50",
             "16:00", "16:10", "16:20", "16:30", "16:40", "16:50",
             "17:00", "17:10", "17:20", "17:30", "17:40", "17:50",
             "18:00", "18:10", "18:20", "18:30", "18:40", "18:50",
              "19:00", "19:10", "19:20", "19:30", "19:40", "19:50",
              "20:00", "20:10", "20:20", "20:30", "20:40", "20:50"
            ]
        }
    ],
        yAxis: [
        {
            type: 'value',
            scale: true,
              axisLabel: {
                show: true,
                textStyle: {
                    color: 'white',
                    fontSize: 15,
                    fontStyle: 'normal',
                    fontWeight: 'bold'
                }
            },
            boundaryGap: [0.01, 0.01]
        }
    ],
        series: [
        {
            name: '市北区',
            type: 'k',
            itemStyle: {
                normal: {
                    color: '#088ef6',           // 阳线填充颜色
                    color0: '#e4006d',  // 阴线填充颜色
                    lineStyle: {
                        width: 1,
                        color: '#088ef6',    // 阳线边框颜色
                        color0: '#e4006d'     // 阴线边框颜色
                    }
                },
                emphasis: {
                    color: 'black',         // 阳线填充颜色
                    color0: 'white'         // 阴线填充颜色
                }
            },
            data: // 周一,周五,最低,最高
            [[22.9, 23, 22.9, 23.4],
            [21.7, 21.6, 21.6, 22.2],
            [20.8, 20.7, 20.7, 22.2],
            [19.5, 19.7, 19.5, 22.6],
            [18.6, 18.7, 18.6, 21.6],
            [17.5, 17.7, 17.5, 21.4],
            [16.3, 17.0, 16.3, 21],
            [15.8, 16.4, 15.8, 20.6],
            [15.1, 15.7, 15.1, 20.4],
            [14.3, 15.1, 14.3, 20.2],
            [13.9, 14.9, 13.9, 19.8],
            [14.2, 15.3, 14.2, 19.7],
            [14.6, 15.5, 14.6, 19.6],
            [15.2, 15.7, 15.2, 19.6],
            [14.9, 15.2, 14.9, 20.4],
            [16.5, 16.9, 16.5, 19],
            [16.9, 17.3, 16.9, 19.3],
            [17.6, 17.4, 17.4, 18.9],
            [17.6, 17.8, 17.6, 18.9],
            [17.9, 18.1, 17.9, 18.6],
            [17.8, 18.5, 17.8, 18.6],
            [18.1, 18.4, 18, 18.4],
            [18.3, 18.6, 17.7, 18.6],
            [18.6, 18.7, 17.5, 18.7],
            [18.7, 18.6, 17.5, 18.7],
            [18.6, 18.5, 17.4, 18.6],
            [18.5, 18.6, 17.2, 18.6],
            [18.9, 18.7, 17.1, 18.9],
            [18.6, 18.8, 17.3, 18.8],
            [18.9, 18.9, 17.3, 18.9],
            [18.8, 18.8, 17.1, 18.8],
            [19.1, 19.1, 17.3, 19.1],
            [19.3, 19.1, 17.5, 19.3],
            [19.3, 19.1, 17.7, 19.3],
            [19.5, 19, 17.6, 19.5],
            [19.7, 19.1, 17.8, 19.7],
            [19.8, 19.1, 18.1, 19.8],
            [20.3, 19.2, 18.2, 20.3],
            [20.3, 19.4, 18.4, 20.3],
            [19.8, 19.4, 18.3, 19.8],
            [20.1, 19.7, 18.9, 20.1],
            [19.5, 19.7, 18.7, 19.7],
            [19.7, 19.3, 18.8, 19.7],
            [19.6, 19.1, 18.6, 19.6],
            [19.7, 19.2, 18.7, 19.7],
            [19.5, 19.1, 18.4, 19.5],
            [19.4, 19, 18.5, 19.4],
            [19.2, 19.1, 18.6, 19.2],
            [18.9, 18.8, 18.4, 18.9],
            [19.2, 18.6, 18.4, 19.2],
            [19, 18.8, 18.4, 19],
            [19.2, 18.7, 18.2, 19.2],
            [18.8, 18.3, 17.9, 18.8],
            [19.1, 18.6, 18.2, 19.1],
            [18.7, 18.3, 17.6, 18.7],
            [18.5, 17.9, 17.9, 18.5],
            [18.1, 20.3, 17.9, 21.3],
            [18.3, 17.7, 17.6, 18.3],
            [18.2, 18, 17.8, 18.2],
            [18.5, 17.8, 17.6, 18.5],
            [18.2, 17.4, 17.4, 18.2],
            [19, 19.1, 17.1, 19.1],
            [19.3, 19.1, 17.5, 19.3],
            [17.8, 16.9, 16.9, 17.8],
            [17.4, 16.8, 16.8, 17.4],
            [17, 16.4, 16.4, 17.2],
            [16.3, 15.6, 15.6, 16.8],
            [15.3, 15, 15, 16.7],
            [15.4, 14.9, 14.9, 16.9],
            [15.2, 14.4, 14.4, 16.5],
            [15, 14.5, 14.5, 16.8],
            [15.2, 14.3, 14.3, 17.2],
            [15.5, 15, 15, 17.7],
            [16.2, 15, 15, 18.1],
            [16.6, 15.5, 15.5, 18.4],
            [17, 16, 16, 19.1],
            [18, 16.6, 16.6, 19.6],
            [18.6, 17.2, 17.2, 19.6],
            [19, 17.9, 17.9, 20.1],
            [19.9, 18.8, 18.8, 20.4],
            [20, 19.3, 19.3, 20.4],
            [20.6, 19.6, 19.6, 20.6],
            [20.9, 19.9, 19.9, 20.9],
            [21, 20.5, 20.2, 21],
            [21, 20.4, 20.1, 21],
            [21.2, 20.3, 20.3, 21.2],
            [21, 20.9, 20.8, 21.2],
            [21.1, 20.8, 20.8, 21.4],
            [21.4, 20.6, 20.6, 21.7],
            [21.6, 20.6, 20.6, 21.8],
            [21.6, 20.8, 20.8, 21.8],
            [21.4, 20.9, 20.9, 21.9],
            [21.5, 21.2, 21.2, 21.9],
            [22.4, 21.6, 21.6, 22.5],
            [22.5, 21.9, 21.9, 22.6],
            [23.2, 22.3, 22.3, 23.2]
          ]
        }

    ]
    };



    ////李沧区


    option6 = {
        title: {
            text: '平均行程速度（km/h）',
            textStyle: {
                color: 'white',
                fontSize: '20'

            }
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                var res = params[0].seriesName + ' ' + params[0].name;
                res += '<br/>  周一 : ' + params[0].value[0] + '  最高 : ' + params[0].value[3];
                res += '<br/>  周五 : ' + params[0].value[1] + '  最低 : ' + params[0].value[2];
                return res;
            }
        },
//        legend: {
//            data: ['李沧区']
//        },

        toolbox: {
            show: true,
            feature: {
                //                mark: { show: true },
                dataZoom: { show: true },
                dataView: { show: true, readOnly: false },
                magicType: { show: true, type: ['line', 'bar'] },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        dataZoom: {
            show: true,
            realtime: true,
            start: 50,
            end: 100
        },
        xAxis: [
        {
            type: 'category',
            boundaryGap: true,
            axisTick: { onGap: false },
            splitLine: { show: false },
            name: '时间',
            nameTextStyle: {
                fontSize: 20,
                fontStyle: 'normal',
                fontWeight: 'bold',
                color: 'white'

            },

            axisLabel: {
                show: true,
                textStyle: {
                    color: 'white',
                    fontSize: 15,
                    fontStyle: 'normal',
                    fontWeight: 'bold'
                }
            },

            data: ["06:00", "06:10", "06:20", "06:30", "06:40", "06:50",
            "07:00", "07:10", "07:20", "07:30", "07:40", "07:50",
            "08:00", "08:10", "08:20", "08:30", "08:40", "08:50",
            "09:00", "09:10", "09:20", "09:30", "09:40", "09:50",
            "10:00", "10:10", "10:20", "10:30", "10:40", "10:50",
             "11:00", "11:10", "11:20", "11:30", "11:40", "11:50",
             "12:00", "12:10", "12:20", "12:30", "12:40", "12:50",
             "13:00", "13:10", "13:20", "13:30", "13:40", "13:50",
             "14:00", "14:10", "14:20", "14:30", "14:40", "14:50",
             "15:00", "15:10", "15:20", "15:30", "15:40", "15:50",
             "16:00", "16:10", "16:20", "16:30", "16:40", "16:50",
             "17:00", "17:10", "17:20", "17:30", "17:40", "17:50",
             "18:00", "18:10", "18:20", "18:30", "18:40", "18:50",
              "19:00", "19:10", "19:20", "19:30", "19:40", "19:50",
              "20:00", "20:10", "20:20", "20:30", "20:40", "20:50"
            ]
        }
    ],
        yAxis: [
        {
            type: 'value',
            scale: true,
              axisLabel: {
                show: true,
                textStyle: {
                    color: 'white',
                    fontSize: 15,
                    fontStyle: 'normal',
                    fontWeight: 'bold'
                }
            },
            boundaryGap: [0.01, 0.01]
        }
    ],
        series: [
        {
            name: '李沧区',
            type: 'k',
            itemStyle: {
                normal: {
                    color: '#088ef6',           // 阳线填充颜色
                    color0: '#e4006d',  // 阴线填充颜色
                    lineStyle: {
                        width: 1,
                        color: '#088ef6',    // 阳线边框颜色
                        color0: '#e4006d'     // 阴线边框颜色
                    }
                },
                emphasis: {
                    color: 'black',         // 阳线填充颜色
                    color0: 'white'         // 阴线填充颜色
                }
            },
            data: // 周一,周五,最低,最高
            [[24.7, 24.7, 24.7, 25.1],
            [24.4, 24.3, 24.3, 24.9],
            [24.1, 23.9, 23.9, 24.6],
            [22.9, 23.6, 22.9, 24.6],
            [23, 22.7, 22.7, 24.8],
            [22, 22.1, 22, 24],
            [20.9, 21.0, 20.9, 23.8],
            [20.0, 20.9, 20, 23.1],
            [19.9, 20.1, 19.9, 23.1],
            [18.7, 19.2, 18.7, 22.6],
            [18.8, 19.2, 18.8, 22.4],
            [19.4, 19.7, 19.4, 22.8],
            [19.4, 20.2, 19.4, 22.6],
            [20.6, 20.1, 20.1, 22.9],
            [21.2, 19.1, 19.1, 23.6],
            [20.9, 21.4, 20.9, 22.1],
            [21.5, 21.7, 21.5, 22.2],
            [22, 21.7, 21.7, 22.1],
            [22.2, 22, 21.8, 22.2],
            [22.1, 22, 21.3, 22.1],
            [21.9, 22, 21.5, 22],
            [22.4, 22.3, 21.2, 22.4],
            [22.2, 22.2, 21, 22.2],
            [22.2, 22.5, 21.1, 22.5],
            [22, 22.2, 21.2, 22.2],
            [22.3, 22.2, 21, 22.3],
            [22.3, 22.8, 20.9, 22.8],
            [22.8, 22.6, 21.2, 22.8],
            [23, 22.7, 21.3, 23],
            [22.7, 22.8, 21.3, 22.8],
            [22.9, 23.2, 21.5, 23.2],
            [23.1, 22.6, 20.7, 23.1],
            [22.9, 23, 21.7, 23],
            [22.8, 22.7, 21.6, 22.8],
            [23, 22.8, 21.7, 23],
            [23.3, 22.9, 22, 23.3],
            [23.3, 23, 22, 23.3],
            [23.5, 22.8, 22.6, 23.5],
            [23.4, 23.3, 22.1, 23.4],
            [23.6, 23.2, 22, 23.6],
            [23.8, 23.2, 22, 23.8],
            [23.5, 22.9, 22.6, 23.5],
            [22.8, 22.9, 22.2, 22.9],
            [22.5, 22.8, 22.5, 22.8],
            [22.7, 22.4, 22.4, 22.7],
            [22.8, 22.6, 21.9, 22.8],
            [22.4, 22.4, 22, 22.6],
            [22.6, 22.6, 21.4, 22.6],
            [22.2, 22.6, 21.8, 22.6],
            [22.7, 22, 21.6, 22.7],
            [22.8, 22.4, 21.6, 22.8],
            [22.3, 22.4, 21.3, 22.4],
            [22.2, 22.3, 21.3, 22.3],
            [22.3, 22, 21.4, 22.3],
            [22.5, 21.8, 21.7, 22.5],
            [22, 21.9, 21.2, 22],
            [23.7, 20.7, 20.7, 26.4],
            [22.2, 21.5, 21.2, 22.2],
            [22.1, 21.9, 21.3, 22.1],
            [22.4, 21.8, 21.1, 22.4],
            [21.8, 21.3, 21.3, 21.8],
            [23.3, 22.4, 20.8, 23.3],
            [22.9, 23, 21.7, 23],
            [21.4, 21.1, 20.7, 21.4],
            [21.4, 20.8, 20.6, 21.4],
            [20.7, 20.6, 20.6, 21.2],
            [19.9, 19.8, 19.8, 20.8],
            [18.8, 18.8, 18.8, 20.4],
            [19, 18.5, 18.5, 20.2],
            [19.1, 18.6, 18.6, 20.6],
            [19.1, 19, 19, 20.5],
            [19.7, 19.2, 19.2, 21.1],
            [20.2, 19.3, 19.3, 21.2],
            [21.3, 20.2, 20.2, 22.1],
            [21.2, 20.6, 20.6, 22.7],
            [22.1, 21, 21, 22.4],
            [22.6, 21.9, 21.9, 23.4],
            [23.4, 22.1, 22.1, 23.6],
            [23.5, 22.8, 22.8, 23.8],
            [23.5, 22.7, 22.7, 24.5],
            [24.5, 23.6, 23.6, 24.5],
            [24.3, 23.5, 23.5, 24.8],
            [24.5, 24.5, 23.9, 24.9],
            [25.2, 24.8, 24.7, 25.6],
            [24.7, 24.1, 24.1, 24.7],
            [25, 24.8, 24.2, 25],
            [25, 24.8, 24.2, 25],
            [24.9, 24.6, 24.5, 24.9],
            [25, 24.9, 23.9, 25],
            [24.7, 24.7, 24.5, 24.7],
            [25.3, 24.6, 24.3, 25.3],
            [25.1, 24.8, 24.5, 25.1],
            [25.1, 24.5, 24.4, 25.1],
            [24.9, 25, 24.6, 25],
            [25.8, 24.6, 24.2, 25.8],
            [25.2, 24.7, 24.7, 25.2]	

          ]
        }

    ]
    };





    ////崂山区


    option7 = {
        title: {
            text: '平均行程速度（km/h）',
            textStyle: {
                color: 'white',
                fontSize: '20'

            }
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                var res = params[0].seriesName + ' ' + params[0].name;
                res += '<br/>  周一 : ' + params[0].value[0] + '  最高 : ' + params[0].value[3];
                res += '<br/>  周五 : ' + params[0].value[1] + '  最低 : ' + params[0].value[2];
                return res;
            }
        },
//        legend: {
//            data: ['崂山区']
//        },

        toolbox: {
            show: true,
            feature: {
                //                mark: { show: true },
                dataZoom: { show: true },
                dataView: { show: true, readOnly: false },
                magicType: { show: true, type: ['line', 'bar'] },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        dataZoom: {
            show: true,
            realtime: true,
            start: 50,
            end: 100
        },
       

        xAxis: [
        {
            type: 'category',
            boundaryGap: true,
            axisTick: { onGap: false },
            splitLine: { show: false },
            name: '时间',
            nameTextStyle: {
                fontSize: 20,
                fontStyle: 'normal',
                fontWeight: 'bold',
                color: 'white'

            },

            axisLabel: {
                show: true,
                textStyle: {
                    color: 'white',
                    fontSize: 15,
                    fontStyle: 'normal',
                    fontWeight: 'bold'
                }
            },

            data: ["06:00", "06:10", "06:20", "06:30", "06:40", "06:50",
            "07:00", "07:10", "07:20", "07:30", "07:40", "07:50",
            "08:00", "08:10", "08:20", "08:30", "08:40", "08:50",
            "09:00", "09:10", "09:20", "09:30", "09:40", "09:50",
            "10:00", "10:10", "10:20", "10:30", "10:40", "10:50",
             "11:00", "11:10", "11:20", "11:30", "11:40", "11:50",
             "12:00", "12:10", "12:20", "12:30", "12:40", "12:50",
             "13:00", "13:10", "13:20", "13:30", "13:40", "13:50",
             "14:00", "14:10", "14:20", "14:30", "14:40", "14:50",
             "15:00", "15:10", "15:20", "15:30", "15:40", "15:50",
             "16:00", "16:10", "16:20", "16:30", "16:40", "16:50",
             "17:00", "17:10", "17:20", "17:30", "17:40", "17:50",
             "18:00", "18:10", "18:20", "18:30", "18:40", "18:50",
              "19:00", "19:10", "19:20", "19:30", "19:40", "19:50",
              "20:00", "20:10", "20:20", "20:30", "20:40", "20:50"
            ]
        }
    ],
        yAxis: [
        {
            type: 'value',
            scale: true,
              axisLabel: {
                show: true,
                textStyle: {
                    color: 'white',
                    fontSize: 15,
                    fontStyle: 'normal',
                    fontWeight: 'bold'
                }
            },
            boundaryGap: [0.01, 0.01]
        }
    ],
        series: [
        {
            name: '崂山区',
            type: 'k',
            itemStyle: {
                normal: {
                    color: '#088ef6',           // 阳线填充颜色
                    color0: '#e4006d',  // 阴线填充颜色
                    lineStyle: {
                        width: 1,
                        color: '#088ef6',    // 阳线边框颜色
                        color0: '#e4006d'     // 阴线边框颜色
                    }
                },
                emphasis: {
                    color: 'black',         // 阳线填充颜色
                    color0: 'white'         // 阴线填充颜色
                }
            },
            data: // 周一,周五,最低,最高
            [[25.5, 25.5, 25.5, 25.9],
            [25.9, 25.6, 25.6, 26.5],
            [25.6, 25.7, 25.6, 26.8],
            [25.3, 25.3, 25.3, 26.3],
            [24.7, 25, 24.7, 26],
            [24.6, 24.6, 24.6, 26.4],
            [24.1, 24.2, 24.1, 26],
            [23.5, 24.1, 23.5, 25.8],
            [23.0, 23.0, 23, 25.1],
            [22.1, 22.2, 22.1, 25.2],
            [21.6, 24.5, 21.6, 25.1],
            [21.9, 22.3, 21.9, 24.8],
            [21.7, 22, 21.7, 25.6],
            [21.8, 22.2, 21.8, 25.2],
            [23.7, 21.5, 21.5, 24.5],
            [23, 24.2, 23, 24.3],
            [23.2, 24.1, 23.2, 25.3],
            [23.5, 24, 23.5, 25.1],
            [24, 23.9, 23.9, 24.9],
            [24.7, 24.1, 24.1, 24.7],
            [24.1, 24.4, 23.6, 24.6],
            [25, 24.4, 24.4, 25],
            [25, 25.1, 24.2, 25.1],
            [24.8, 25.3, 24.3, 25.3],
            [25.9, 24.8, 24, 25.9],
            [24.7, 24.8, 23.8, 24.8],
            [25.3, 24.7, 23.5, 25.3],
            [25.2, 25.4, 23.7, 25.4],
            [24.9, 24.8, 23.5, 24.9],
            [25, 25.3, 24, 25.3],
            [25, 25.7, 23.8, 25.7],
            [24.7, 25.4, 24, 25.4],
            [24.8, 24.9, 24.2, 24.9],
            [25, 26, 23.8, 26],
            [25.7, 25.3, 24.6, 25.7],
            [25.2, 25.3, 24.3, 25.3],
            [25.4, 25.1, 24.7, 25.4],
            [25.4, 25.2, 24.6, 25.4],
            [25.1, 25.7, 24.5, 25.7],
            [25.1, 25.5, 24.2, 25.5],
            [25.1, 25.5, 24.6, 25.5],
            [25, 25.5, 24.3, 25.5],
            [24.8, 25.1, 24.5, 25.1],
            [25.2, 25, 25, 25.9],
            [24.7, 25.1, 24.6, 25.1],
            [25.1, 24.9, 24.7, 25.1],
            [24.9, 24.9, 24.3, 24.9],
            [24.6, 25.5, 24.2, 25.5],
            [24.9, 24.2, 24.2, 24.9],
            [25, 24.2, 24, 25],
            [24.8, 24.7, 23.7, 24.8],
            [25.6, 25, 23.6, 25.6],
            [24.7, 24.2, 23.5, 24.7],
            [24.2, 24.8, 24.1, 24.8],
            [24.5, 24, 23.8, 24.5],
            [24.3, 24.4, 23.8, 24.4],
            [22.6, 24, 22.6, 27.9],
            [24.1, 24.5, 23.8, 25.2],
            [24.1, 24.1, 24.1, 24.2],
            [24.1, 23.8, 23.5, 24.1],
            [24.2, 23.6, 23.6, 24.2],
            [24, 24.9, 22.8, 24.9],
            [24.8, 24.9, 24.2, 24.9],
            [23.5, 23.7, 23.5, 24.1],
            [23.4, 22.9, 22.9, 23.6],
            [23.1, 22.4, 22.4, 23.3],
            [22.2, 21.7, 21.7, 23.5],
            [21.8, 21.7, 21.7, 23],
            [22.3, 21.8, 21.8, 23.7],
            [22, 21.6, 21.6, 23.5],
            [21.6, 21.6, 21.6, 24.1],
            [22.5, 22.5, 22.5, 24.2],
            [23, 22.7, 22.7, 24.6],
            [23.8, 23.1, 23.1, 24.8],
            [23.5, 23.8, 23.5, 25.1],
            [24.8, 24.4, 24.4, 25.3],
            [25.1, 24.6, 24.6, 26.1],
            [26, 24.8, 24.8, 27.1],
            [26.2, 25.3, 25.3, 26.2],
            [25.8, 25.9, 25.8, 26.8],
            [26.4, 26.5, 26.4, 27.3],
            [26.6, 26.4, 26.4, 26.9],
            [27.4, 27, 26.6, 27.4],
            [27.2, 26.8, 26.7, 27.2],
            [26.9, 26.9, 26.8, 26.9],
            [26.5, 26.6, 26.5, 26.6],
            [26.5, 26.8, 26.1, 26.8],
            [26.5, 26.6, 25.7, 26.8],
            [25.8, 26, 25.2, 26],
            [25.6, 25.3, 24.9, 25.8],
            [25.5, 25.3, 24.9, 25.8],
            [25.3, 25.1, 25.1, 25.5],
            [25.3, 25.5, 25.3, 25.9],
            [25.8, 25.4, 25.4, 25.8],
            [25.7, 25.3, 25.3, 25.8],
            [25.8, 25.7, 25.5, 25.8]	

          ]
        }

    ]
    };


    ////客流量


//    var myChart8 = echarts.init(document.getElementById('tongjitu2'));

//    option8 = {

//        timeline: {
//            data: [
//            '周一', '周二', '周三', '周四', '周五', '周六', '周日'
//        ],
//            label: {
//                formatter: function (s) {
//                    return s.slice(0, 4);
//                }
//            },
//            type: 'number',
//            lineStyle: {
//                color: '#666',
//                width: 2,
//                type: 'dashed'

//            },
//            
//            autoPlay: true,
//            playInterval: 2000
//        },
//        options: [{
//            title: {
//                text: '站点客流量',
//                //                textAlign:'center',
//                textStyle: {
//                    fontSize: 20,
////                    fontWeight: 'bold',
//                    color: 'white'//#3399ff


//                }

//            },
//            tooltip: {
//                trigger: 'axis',
//                showDelay: 0,
//                hideDelay: 50,
//                transitionDuration: 0,
//                backgroundColor: 'rgba(41,56,56)',
//                borderColor: 'rgba(41,56,56)',
//                borderRadius: 8,
//                borderWidth: 1,
//                padding: 10,    // [5, 10, 15, 20]
//                position: function (p) {
//                    // 位置回调
//                    // console.log && console.log(p);
//                    return [p[0] + 10, p[1] - 10];
//                },
//                textStyle: {
//                    color: 'white',
//                    decoration: 'none',
//                    fontFamily: 'Verdana, sans-serif',
//                    fontSize: 12,
//                    //                    fontStyle: 'italic',
//                    fontWeight: 'bold'
//                },
//                formatter: function (params, ticket, callback) {
//                    console.log(params)
//                    var res = params[0].name;
//                    for (var i = 0, l = params.length; i < l; i++) {
//                        res += '<br/>' + params[i].seriesName + ' : ' + params[i].value;
//                    }
//                    setTimeout(function () {
//                        // 仅为了模拟异步回调
//                        callback(ticket, res);
//                    }, 1000)
//                    return 'loading';
//                }
//            },
//            legend: {
//                data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
//                //                itemWidth: 35,
//                //                itemHeight: 25,
//                //                orient: 'vertical',
//                //                x: 'right',
//                //                y:'center',
//                textStyle: { color: 'black', fontSize: 15,fontWeight:'bold' },
//                backgroundColor: '#f2f2e6',
//                borderColor: 'navy',
//                borderWidth: 3,
//                padding: 10,    // [5, 10, 15, 20]
//                itemGap: 15

//            },
//            toolbox: {
//                show: true,
//                feature: {
////                    mark: { show: true },
//                    dataZoom: { show: true },
//                    dataView: { show: true, readOnly: false },
//                    magicType: { show: true, type: ['line', 'bar'] },
//                    restore: { show: true },
//                    saveAsImage: { show: true }
//                }
//            },

//            dataZoom: {
//                show: true,
//                realtime: true,
//                start: 00,
//                end: 44
//            },
//            calculable: false,
//            color: ['black', 'red', 'orange', 'green', 'yellow', 'purple', 'darkblue'],
//            grid: {
//                x: 50,
//                x2: 50,
//                y2: 150
//            },

//            xAxis: [
//           {
//               splitLine: {
//                   show: false

//               },
//               name: '站点',
//               nameTextStyle: {
//                   fontSize: 20,
//                   fontStyle: 'normal',
//                  fontWeight: 'bold',
//                   color: 'white'

//               },
//               axisLabel: {
//                   show: true,
//                   interval: 0,
//                   rotate: 90,
//                   textStyle: {
//                       color: 'black',
//                       fontSize: 15,
//                       fontStyle: 'normal'
//                      
//                   }
//               },

//               type: 'category',
//               boundaryGap: false,
//               data: ['	台东	', '台东一路	', '延安路南站	', '芝泉路	', '山东路南站	', '徐州路	', '二中分校	', '浮山所	', '远洋广场	', '辛家庄	', '高雄路	', '青岛大学	', '麦岛	', '青岛大学东院	', '徐家麦岛	', '王家麦岛	', '海川路	', '海青路	', '海安路	', '山东头	', '海尔路	', '香港东路	', '苗岭路	', '银川路	', '国信体育馆东站	', '埠东佳苑	', '辽阳路东站	', '北村	', '中韩	', '西韩	', '东韩	', '株洲路	', '科苑四路	', '青银公路	', '科苑六路	', '科苑七路	', '张村	', '枣山东路	', '株洲路东站	', '枯桃花卉市场	', '新源路	', '海大路	', '海大崂山校区	', '海大路	', '新源路	', '枯桃花卉市场	', '株洲路东站	', '枣山东路	', '张村	', '科苑七路	', '科苑六路	', '青银公路	', '科苑四路	', '株洲路	', '东韩	', '西韩	', '中韩	', '北村	', '辽阳路东站	', '埠东佳苑	', '国信体育馆东站	', '银川路	', '苗岭路	', '香港东路	', '海尔路	', '山东头	', '海安路	', '海青路	', '王家麦岛	', '徐家麦岛	', '青岛大学东院	', '麦岛	', '青岛大学	', '高雄路	', '辛家庄	', '远洋广场	', '浮山所	', '二中分校	', '徐州路	', '山东路南站	', '泰州路	', '芝泉路	', '延安路南站	', '十九中']

//           }


//    ],
//            yAxis: [
//        {
//            //            name: 'Average travel speed(km/h)',
//            //            nameTextStyle: {
//            //            color:'white',
//            //                fontSize: 25,
//            //                fontStyle: 'normal',
//            //                fontWeight: 'bold'

//            //            },
//            //            position: 'left',
//            splitLine: {
//                show: true

//            },
//            splitArea: {
//                show: 'true',
//                areaStyle: {
//                    color: [
//                '#99CCCC',
//                '#95c7c7']

//                }

//            },
//            axisLabel: {
//                show: true,
//                textStyle: {
//                    color: 'black',
//                    fontSize: 15,
//                    fontStyle: 'normal',
//                    fontWeight: 'bold'
//                }
//            },
//            type: 'value',
//            min: 0,
//            max: 1000


//        }
//    ],

//            series: [

//            { smooth: 'true',
//                name: '周一',
//                type: 'line',
//                data: [1342, 271, 369, 286, 195, 197, 154, 205, 303, 301, 193, 152, 138, 133, 97, 66, 35, 62, 48, 118, 81, 56, 89, 160, 67, 95, 120, 251, 231, 230, 33, 64, 40, 29, 70, 40, 52, 65, 42, 24, 44, 12, 362, 73, 73, 112, 69, 83, 127, 116, 96, 76, 67, 38, 94, 74, 119, 225, 122, 176, 103, 132, 146, 92, 48, 68, 73, 57, 62, 57, 101, 90, 49, 65, 96, 198, 278, 117, 134, 128, 108, 92, 75, 64, 17],

//                itemStyle: {
//                    normal: {
//                        lineStyle: {
//                            width: 4

//                        }
//                    }
//                }

//            }]
//        },
//       {
//           series: [
//          { smooth: 'true',
//              name: '周二',
//              type: 'line',
//              data: [813, 388, 453, 279, 215, 265, 170, 248, 322, 381, 178, 127, 95, 95, 126, 64, 46, 48, 58, 102, 98, 78, 124, 155, 100, 60, 110, 140, 267, 240, 23, 51, 38, 28, 58, 74, 61, 76, 47, 27, 32, 17, 411, 125, 74, 127, 92, 101, 113, 148, 120, 117, 73, 73, 94, 69, 170, 281, 96, 192, 168, 149, 236, 97, 75, 78, 99, 65, 83, 104, 118, 62, 115, 103, 97, 217, 431, 189, 98, 152, 203, 108, 108, 48, 3],

//              itemStyle: {
//                  normal: {
//                      lineStyle: {
//                          width: 4
//                      }
//                  }

//              }



//          }]
//       },
//       { series: [
//        { smooth: 'true',
//            name: '周三',
//            type: 'line',
//            data: [779, 339, 403, 308, 181, 221, 199, 203, 269, 291, 207, 136, 141, 50, 76, 50, 51, 81, 62, 93, 102, 71, 82, 172, 82, 105, 77, 140, 230, 283, 40, 56, 72, 48, 59, 62, 48, 77, 36, 33, 30, 25, 351, 83, 66, 91, 116, 76, 117, 87, 68, 92, 56, 95, 112, 52, 135, 325, 120, 200, 147, 143, 218, 93, 85, 101, 119, 98, 122, 108, 125, 110, 147, 94, 125, 153, 318, 207, 112, 44, 117, 112, 75, 66, 58],

//            itemStyle: {
//                normal: {
//                    lineStyle: {
//                        width: 4

//                    }
//                }

//            }


//        }]
//       },
//       { series: [{ smooth: 'true',
//           name: '周四',
//           type: 'line',
//           data: [640, 304, 397, 358, 195, 260, 194, 247, 369, 384, 227, 159, 158, 115, 102, 83, 58, 66, 44, 110, 123, 123, 87, 187, 95, 103, 120, 195, 261, 303, 44, 66, 47, 40, 67, 63, 75, 40, 35, 32, 37, 14, 445, 80, 96, 106, 97, 95, 141, 170, 108, 123, 67, 81, 87, 82, 178, 272, 106, 174, 181, 141, 194, 98, 47, 79, 127, 51, 83, 72, 103, 117, 69, 80, 95, 196, 369, 221, 96, 59, 114, 123, 91, 70, 104],

//           itemStyle: {
//               normal: {
//                   lineStyle: {
//                       width: 4
//                   }
//               }

//           }



//       }]
//       },
//       { series: [{ smooth: 'true',
//           name: '周五',
//           type: 'line',
//           data: [861, 176, 458, 341, 133, 193, 152, 238, 217, 228, 148, 147, 89, 89, 91, 60, 25, 72, 49, 95, 75, 71, 79, 93, 50, 66, 77, 186, 153, 166, 18, 64, 39, 28, 56, 42, 37, 37, 38, 36, 42, 18, 349, 100, 65, 74, 80, 59, 111, 94, 75, 108, 46, 52, 63, 45, 128, 250, 131, 146, 125, 117, 129, 73, 41, 55, 50, 91, 77, 25, 86, 63, 55, 68, 111, 167, 273, 107, 114, 78, 140, 79, 85, 74, 23],

//           itemStyle: {
//               normal: {
//                   lineStyle: {
//                       width: 4
//                   }
//               }

//           }



//       }]
//       },
//       { series: [{ smooth: 'true',
//           name: '周六',
//           type: 'line',
//           data: [894, 500, 273, 325, 203, 186, 210, 193, 306, 341, 193, 111, 163, 106, 151, 94, 45, 56, 40, 85, 87, 96, 90, 94, 70, 99, 88, 173, 232, 312, 30, 42, 21, 29, 90, 57, 75, 73, 42, 23, 28, 40, 445, 110, 120, 112, 80, 83, 83, 166, 74, 111, 57, 46, 58, 56, 86, 273, 119, 177, 154, 151, 117, 92, 69, 79, 120, 87, 96, 114, 178, 201, 104, 104, 143, 245, 326, 222, 120, 78, 136, 100, 112, 92, 90],

//           itemStyle: {
//               normal: {
//                   lineStyle: {
//                       width: 4
//                   }
//               }
//           }
//       }]
//       },

//       { series: [{ smooth: 'true',
//           name: '周日',
//           type: 'line',
//           data: [601, 435, 254, 156, 137, 181, 178, 214, 221, 343, 198, 102, 68, 82, 122, 72, 40, 48, 44, 100, 141, 73, 72, 132, 67, 65, 52, 98, 227, 237, 25, 26, 37, 20, 56, 49, 30, 55, 27, 42, 43, 22, 408, 105, 70, 79, 68, 53, 116, 118, 91, 118, 48, 39, 46, 52, 98, 268, 98, 137, 102, 136, 100, 51, 52, 46, 98, 56, 73, 66, 124, 155, 74, 80, 131, 266, 367, 177, 86, 70, 76, 104, 94, 84, 90],

//           itemStyle: {
//               normal: {
//                   lineStyle: {
//                       width: 4
//                   }
//               }
//           }
//       }
//    ]
//       }

//]
//    };

//    myChart8.setOption(option8);




  var myChart8 = echarts.init(document.getElementById('tongjitu2'));
  option8 = {
            backgroundColor: '#f5f5f5f ', //#f2f2e6
            title: {
                text: '站点客流量（人）',
                //                textAlign:'center',
                textStyle: {
                    fontSize: 20,
                    fontWeight: 'bolder',
                    color: 'white'//#3399ff


                }

            },
            tooltip: {
                trigger: 'axis',
                showDelay: 0,
                hideDelay: 50,
                transitionDuration: 0,
                backgroundColor: 'rgba(41,56,56)',
                borderColor: 'rgba(41,56,56)',
                borderRadius: 8,
                borderWidth: 1,
                padding: 10,    // [5, 10, 15, 20]
                position: function (p) {
                    // 位置回调
                    // console.log && console.log(p);
                    return [p[0] + 10, p[1] - 10];
                },
                textStyle: {
                    color: 'white',
                    decoration: 'none',
                    fontFamily: 'Verdana, sans-serif',
                    fontSize: 15
//                    fontStyle: 'italic',
   //                 fontWeight: 'bold'
                },
                formatter: function (params, ticket, callback) {
                    console.log(params)
                    var res = params[0].name;
                    for (var i = 0, l = params.length; i < l; i++) {
                        res += '<br/>' + params[i].seriesName + ' : ' + params[i].value;
                    }
                    setTimeout(function () {
                        // 仅为了模拟异步回调
                        callback(ticket, res);
                    }, 1000)
                    return 'loading';
                }
            },
            legend: {
                data: ['周一', '周二', '周三', '周四','周五','周六','周日'],
                itemWidth: 35,
                itemHeight: 25,
                //                                   orient: 'vertical',
                //                                   x: 'right',
                //                                   y:'center',
                textStyle: { color: 'white', fontSize: 15, fontWeight: 'bold' },
              //  backgroundColor: '#99CCCC', //#f2f2e6
                //                   borderColor: 'rgba(178,34,34,0.8)',
                //                   borderWidth: 2,
                padding: 10,    // [5, 10, 15, 20]
                itemGap: 10

            },
            toolbox: {
                show: true,
                feature: {
                    mark: { show: false },
                    dataZoom:{show:true},
                    dataView: { show: true, readOnly: false },
                    magicType: { show: true, type: ['line', 'bar'] },
                    restore: { show: true },
                    saveAsImage: { show: true }
                }
            },

                dataZoom: {
                show: true,
                realtime: true,
                start: 0,
                end: 44
            },
            grid:{
            
            x2:50,
            y2:70       
            
            
            
            
            },
            calculable: false,
            color: ['red', 'orange', 'yellow', 'green','black','blue','purple'],

            xAxis: [
           {
               splitLine: {
                   show: false

               },
               name: '站点',
               nameTextStyle: {
                   fontSize: 20,
                   fontStyle: 'normal',
                   fontWeight: 'bold',
                   color: 'white'

               },
               axisLabel: {
                   show: true,
                   textStyle: {
                       color: 'white',
                       fontSize: 15,
                       fontStyle: 'normal',
                       fontWeight: 'bold'
                   }
               },

               type: 'category',
               boundaryGap: false,
               data: ['台东', '台东一路','十九中', '延安路南站', '芝泉路', '山东路南站', '徐州路', '二中分校', '浮山所', '远洋广场', '辛家庄', '高雄路', '青岛大学', '麦岛', '青岛大学东院', '徐家麦岛', '王家麦岛', '海川路	', '海青路	', '海安路	', '山东头	', '海尔路	', '香港东路', '苗岭路', '银川路', '国信体育馆东站', '埠东佳苑', '辽阳路东站', '北村', '中韩', '西韩', '东韩', '株洲路', '科苑四路', '青银公路', '科苑六路', '科苑七路', '张村', '枣山东路', '株洲路东站', '枯桃花卉市场', '新源路', '海大路', '海大崂山校区']
             }

    ],
            yAxis: [
        {
            //            name: 'Average travel speed(km/h)',
            //            nameTextStyle: {
            //            color:'white',
            //                fontSize: 25,
            //                fontStyle: 'normal',
            //                fontWeight: 'bold'

            //            },
            //            position: 'left',
            splitLine: {
                show: true

            },
            splitArea: {
                show: 'true',
                areaStyle: {
                    color: [
                '#99CCCC',
                '#95c7c7']

                }

            },
            axisLabel: {
                show: true,
                textStyle: {
                    color: 'white',
                    fontSize: 15,
                    fontStyle: 'normal',
                    fontWeight: 'bold'
                }
            },
            type: 'value'
               


        }
    ],

            series: [

            { smooth: 'true',
                name: '周一',
                type: 'line',
                data: [569	,	273	,	366	,	267	,	187	,	196	,	171	,	196	,	341	,	332	,	157	,	131	,	123	,	148	,	121	,	82	,	44	,	75	,	54	,	127	,	91	,	87	,	114	,	139	,	54	,	107	,	102	,	196	,	231	,	205	,	31	,	73	,	54	,	22	,	53	,	59	,	75	,	58	,	41	,	39	,	43	,	18	,	367	,	77],

                itemStyle: {
                    normal: {
                        lineStyle: {
                            width: 2

                        }
                    }

                }
            },
        { smooth: 'true',
            name: '周二',
            type: 'line',
            data:  [633	,	425	,	462	,	279	,	230	,	264	,	202	,	272	,	320	,	408	,	183	,	137	,	95	,	100	,	111	,	70	,	39	,	46	,	51	,	101	,	104	,	92	,	138	,	177	,	105	,	56	,	103	,	140	,	272	,	261	,	19	,	42	,	36	,	26	,	62	,	61	,	57	,	68	,	43	,	24	,	16	,	16	,	413	,	126],

            itemStyle: {
                normal: {
                    lineStyle: {
                        width: 2
                    }
                }

            }
        },
        { smooth: 'true',
            name: '周三',
            type: 'line',
            data:  [456	,	356	,	453	,	321	,	177	,	222	,	195	,	249	,	277	,	306	,	224	,	127	,	135	,	65	,	81	,	46	,	39	,	60	,	58	,	103	,	102	,	75	,	90	,	185	,	88	,	115	,	86	,	142	,	253	,	308	,	34	,	47	,	76	,	32	,	53	,	68	,	60	,	56	,	34	,	37	,	24	,	20	,	359	,	94],

            itemStyle: {
                normal: {
                    lineStyle: {
                        width: 2

                    }
                }
            }

        }, { smooth: 'true',
            name: '周四',
            type: 'line',
            data: [634	,	302	,	391	,	359	,	205	,	269	,	212	,	239	,	380	,	353	,	205	,	180	,	156	,	105	,	116	,	76	,	82	,	65	,	57	,	111	,	94	,	116	,	82	,	145	,	107	,	98	,	115	,	214	,	251	,	309	,	39	,	73	,	36	,	48	,	61	,	51	,	70	,	52	,	49	,	31	,	43	,	15	,	435	,	97],

            itemStyle: {
                normal: {
                    lineStyle: {
                        width: 2
                    }
                }
            }
        },
        { smooth: 'true',
            name: '周五',
            type: 'line',
            data:  [750	,	214	,	460	,	271	,	142	,	188	,	142	,	183	,	262	,	210	,	136	,	137	,	106	,	90	,	92	,	60	,	28	,	67	,	40	,	91	,	68	,	82	,	71	,	116	,	51	,	62	,	91	,	166	,	167	,	170	,	18	,	56	,	40	,	29	,	54	,	35	,	31	,	34	,	38	,	33	,	31	,	12	,	351	,	104],

            itemStyle: {
                normal: {
                    lineStyle: {
                        width: 2

                    }
                }
            }

        },
        { smooth: 'true',
            name: '周六',
            type: 'line',
            data: [400	,	590	,	301	,	267	,	207	,	224	,	224	,	211	,	340	,	340	,	186	,	117	,	159	,	109	,	152	,	84	,	38	,	48	,	45	,	93	,	98	,	93	,	76	,	98	,	69	,	109	,	96	,	218	,	285	,	363	,	47	,	53	,	22	,	28	,	74	,	46	,	63	,	56	,	39	,	15	,	21	,	32	,	500	,	110],

            itemStyle: {
                normal: {
                    lineStyle: {
                        width: 2

                    }
                }
            }

        },
        { smooth: 'true',
            name: '周日',
            type: 'line',
            data: [478	,	485	,	251	,	174	,	158	,	200	,	184	,	202	,	250	,	355	,	215	,	118	,	74	,	76	,	117	,	70	,	35	,	56	,	43	,	84	,	107	,	66	,	67	,	148	,	70	,	66	,	53	,	106	,	219	,	243	,	26	,	26	,	36	,	21	,	54	,	49	,	30	,	51	,	27	,	38	,	44	,	21	,	397	,	109],

            itemStyle: {
                normal: {
                    lineStyle: {
                        width: 2

                    }
                }
            }

        }

    ]
        };
  myChart8.setOption(option8);



    // 创建Map实例
    var bmap = new BMap.Map('dituzitu', {
        enableMapClick: false,
        minZoom: 4
        //vectorMapLevel: 3
    });

    bmap.enableScrollWheelZoom(); // 启用滚轮放大缩小
    bmap.centerAndZoom(new BMap.Point(120.216212, 36.151032), 13); // 初始化地图,设置中心点坐标和地图级别


    bmap.getContainer().style.background = '#081734';
    bmap.setMapStyle({
        styleJson: [{
            featureType: 'water',
            elementType: 'all',
            stylers: {
                color: '#044161'
            }
        }, {
            featureType: 'land',
            elementType: 'all',
            stylers: {
                color: '#105E77'
            }
        }, {
            featureType: 'boundary',
            elementType: 'geometry',
            stylers: {
                color: '#064f85'
            }
        }, {
            featureType: 'railway',
            elementType: 'all',
            stylers: {
                visibility: 'off'
            }
        }, {
            featureType: 'highway',
            elementType: 'geometry',
            stylers: {
                color: '#004981'
            }
        }, {
            featureType: 'highway',
            elementType: 'geometry.fill',
            stylers: {
                color: '#005b96',
                lightness: 1
            }
        }, {
            featureType: 'highway',
            elementType: 'labels',
            stylers: {
                visibility: 'on'
            }
        }, {
            featureType: 'arterial',
            elementType: 'geometry',
            stylers: {
                color: '#004981',
                lightness: -39
            }
        }, {
            featureType: 'arterial',
            elementType: 'geometry.fill',
            stylers: {
                color: '#00508b'
            }
        }, {
            featureType: 'poi',
            elementType: 'all',
            stylers: {
                visibility: 'on'
            }
        }, {
            featureType: 'green',
            elementType: 'all',
            stylers: {
                color: '#056197',
                visibility: 'off'
            }
        }, {
            featureType: 'subway',
            elementType: 'all',
            stylers: {
                visibility: 'off'
            }
        }, {
            featureType: 'manmade',
            elementType: 'all',
            stylers: {
                visibility: 'off'
            }
        }, {
            featureType: 'local',
            elementType: 'all',
            stylers: {
                visibility: 'off'
            }
        }, {
            featureType: 'arterial',
            elementType: 'labels',
            stylers: {
                visibility: 'on'
            }
        }, {
            featureType: 'boundary',
            elementType: 'geometry.fill',
            stylers: {
                color: '#029fd4'
            }
        }, {
            featureType: 'building',
            elementType: 'all',
            stylers: {
                color: '#1a5787'
            }
        }, {
            featureType: 'label',
            elementType: 'all',
            stylers: {
                visibility: 'off'
            }
        }, {
            featureType: 'poi',
            elementType: 'labels.text.fill',
            stylers: {
                color: '#ffffff'
            }
        }, {
            featureType: 'poi',
            elementType: 'labels.text.stroke',
            stylers: {
                color: '#1e1c1c'
            }
        }]
    });

  
    var heatData=[];
   

       function getVisualData() {
           $.ajax({
               type: "POST",
               url: "../../Home/getHeatData",
               dataType: "json",
               success: function (data) {

                   var len = data.length;
                   for (var i = 0; i < len - 1; i++) {


                       var startArray = new Array();
                       startArray.push(data[i].startlng);
                       startArray.push(data[i].startlat);

                       var endArray = new Array();
                       endArray.push(data[i].endlng);
                       endArray.push(data[i].endlat);


                       var dataArray = new Array();

                       dataArray.push(startArray);
                       dataArray.push(endArray);

                       var c;
                       if (data[i].speed > 50) {

                          // c = '"' + 1 / 50 + '"';
                           c="50";
                       }
                       else {

                          // c = '"' + 1 / data[i].speed + '"';
                          c= '"' +data[i].speed+ '"';

                       }


                       var finalData = {

                           "geo": dataArray,
                           "count": c

                       };

                       heatData.push(finalData);

                   }    


               },
               complete: function () {


                   // 第一步创建mapv示例
                   var mapv = new Mapv({
                       drawTypeControl: true,
                       map: bmap  // 百度地图的map实例
                   });

                   var layer = new Mapv.Layer({
                       zIndex: 1,
                       mapv: mapv,
                       dataType: 'polyline',
                       coordType: 'bd09ll',
                       data: heatData,
                       drawType: 'heatmap',
                       drawOptions: {
                           blur: true, // 是否有模糊效果
                           shadowBlur: 0,
                           shadowColor: 'black',
                           max: 50, // 设置显示的权重最大值
                           lineWidth: 5, // 半径大小
                           strokeStyle: 'rgba(0, 0, 0, 0.2)',
                           maxOpacity: 0.8,
                           gradient: { // 显示的颜色渐变范围
                               '0': 'cyan',
                               '0.6': 'lime',
                               '0.8': 'yellow',
                               '1': 'red'
                              
                           }
                       }
                   });


               }

           });
          };
          getVisualData();

          setInterval(getVisualData, 300000);






     ////125路站点拥挤度


          var indexData;
          var polyline;

            function getData() {
                $.ajax({
                    type: "POST",
                    url: "../../Home/getCongestIndexData",
                    dataType: "json",
                    success: function (data) {

                        indexData = data;

                    },
                    complete: function () {

                        for (var i = 0; i < indexData.length; i++) {
                            if (indexData[i].count < 200) {

                                polyline = new BMap.Polyline([new BMap.Point(indexData[i].startlng, indexData[i].startlat), new BMap.Point(indexData[i].endlng, indexData[i].endlat)], { strokeColor: "green", strokeWeight: 5, strokeOpacity: 0.8 });



                            }
                            else if (indexData[i].count >= 200 && indexData[i].count < 500) {

                                polyline = new BMap.Polyline([new BMap.Point(indexData[i].startlng, indexData[i].startlat), new BMap.Point(indexData[i].endlng, indexData[i].endlat)], { strokeColor: "yellow", strokeWeight: 8, strokeOpacity: 0.6 });

                            }

                            else if (indexData[i].count >= 500) {

                                polyline = new BMap.Polyline([new BMap.Point(indexData[i].startlng, indexData[i].startlat), new BMap.Point(indexData[i].endlng, indexData[i].endlat)], { strokeColor: "red", strokeWeight: 10, strokeOpacity: 0.4 });

                            }

                            map.addOverlay(polyline);

                        }

                    
                    
                    }

                });
               };
               getData();

           
              
            





    $("#style3Shinan").click(function () {
        myChart4.setOption(option4);
    
    });
    $("#style3Shibei").click(function () {
        myChart4.setOption(option5);

    });
    $("#style3Licang").click(function () {
        myChart4.setOption(option6);

    });
    $("#style3Laoshan").click(function () {
        myChart4.setOption(option7);

    });
    




    var slider_count = 2;
    $(".slider_p_div").hide();
    $("#slider_p0").show();
//    $(".hi_btn").hide();
//    $("#hi_btn0").show();
    $(".img_hover").animate({ bottom: '10px' });
    var slider_i = 1;
    var m_over = true;

    function zx_slider() {
        if (m_over) {
           
            if (slider_i < 0) { slider_i = slider_count; }
            //p
            $(".slider_p_div").hide();
            $("#slider_p" + slider_i).show();
            //p end
            //hi_btn
//            $(".hi_btn").hide();
//            $("#hi_btn" + slider_i).show();
         
            //hi_btn end
            //btn
            $(".btnbox img").stop(true, true);
            $(".btnbox img").removeClass("img_hover");
            $(".btnbox img").animate({ bottom: '0px' }, 200);
            $("#btn_img" + slider_i).addClass("img_hover");
            $("#btn_img" + slider_i).animate({ bottom: '10px' }, 200);
            //btn end
            $(".imgbox").stop();
            $(".imgbox").animate({ left: '-900' * slider_i + 'px' });
            $("#imgbox" + slider_i).css("visibility", "visible");
            if (slider_i < slider_count) {
                slider_i++;
                $("#imgbox" + slider_i).css("visibility", "hidden");
            } else {
                slider_i = 0;

            }

        
        }
    }

    $(".lbtn").click(function () {
        m_over = true;
        if (slider_i == 0) { slider_i = slider_count - 1 } else { slider_i = slider_i - 2; }
        zx_slider();
        m_over = false;
    });

    $(".rbtn").click(function () {
        m_over = true;
        zx_slider();
        m_over = false;
    });

    function btn_m_over(btn_i) {
        if (slider_i - 1 != btn_i) {
            m_over = true;
            slider_i = btn_i;
            zx_slider();
            m_over = false;
        }
    }



////按钮切换统计图与地图
    $("#btn_sel").click(function () {
        if ($(this).is(":checked")) {
            $("#tongjitu1").css("display", "block");
            $("#ditu").css("display", "none");


        } else {
            $("#tongjitu1").css("display", "none");
            $("#ditu").css("display", "block");

        }
    });
    $("#btn_sel2").click(function () {
        if ($(this).is(":checked")) {
            $("#tongjitu2").css("display", "block");
            $("#ditu2").css("display", "none");


        } else {
            $("#tongjitu2").css("display", "none");
            $("#ditu2").css("display", "block");
         
        }
    });



    $("#btn_week").click(function () {
        event.stopPropagation();
        //按钮的toggle,如果div是可见的,点击按钮切换为隐藏的;如果是隐藏的,切换为可见的。  
        $('#img_week').toggle('slow');
    });


    $("#btn_two").click(function () {
        event.stopPropagation();
        //按钮的toggle,如果div是可见的,点击按钮切换为隐藏的;如果是隐藏的,切换为可见的。  
        $('#img_two').toggle('slow');
    });


    $("#btn_area").click(function () {
        event.stopPropagation();
        //按钮的toggle,如果div是可见的,点击按钮切换为隐藏的;如果是隐藏的,切换为可见的。  
        $('#img_area').toggle('slow');
    });   
       


    </script>
</body>
</html>
