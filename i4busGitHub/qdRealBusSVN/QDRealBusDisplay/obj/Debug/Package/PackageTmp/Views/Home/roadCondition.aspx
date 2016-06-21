﻿<!DOCTYPE html >
<html lang="zh-CN">
<head id="Head1" runat="server">
    <title>WebGL路况可视化</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href="../../roadCondition/Content/css/jQueryanimate.css" rel="stylesheet" type="text/css" />
    <link href="../../roadCondition/Content/css/jquery.mobile-1.4.5.css" rel="stylesheet" type="text/css" />
    <script src="../../roadCondition/Scripts/three.js" type="text/javascript"></script>
    <script src="../../roadCondition/Content/data/cities.js" type="text/javascript"></script>
    <script src="../../roadCondition/Scripts/Projection.js" type="text/javascript"></script>
    <script src="../../roadCondition/Scripts/Detector.js" type="text/javascript"></script>
    <script src="../../roadCondition/Scripts/Stats.js" type="text/javascript"></script>
    <script src="../../roadCondition/Scripts/OrbitControls.js" type="text/javascript"></script>
    <script src="../../roadCondition/Scripts/THREEx.FullScreen.js" type="text/javascript"></script>
    <script src="../../roadCondition/Scripts/THREEx.KeyboardState.js" type="text/javascript"></script>
    <script src="../../roadCondition/Scripts/THREEx.WindowResize.js" type="text/javascript"></script>
    <script src="../../roadCondition/Scripts/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="../../roadCondition/Scripts/jquery.mobile-1.4.5.js" type="text/javascript"></script>
    <script src="../../roadCondition/Scripts/info.js" type="text/javascript"></script>
    <script src="../../roadCondition/Scripts/jquery-ui.js" type="text/javascript"></script>
    <link href="../../roadCondition/Content/Site.css" rel="stylesheet" type="text/css" />
    <link href="../../roadCondition/Content/info.css" rel="stylesheet" type="text/css" />
    <link href="../../roadCondition/Content/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../../roadCondition/Scripts/DAT.GUI.min.js" type="text/javascript"></script>
    <script src="../../roadCondition/Content/fonts/droid_sans_bold.typeface.js" type="text/javascript"></script>
    <script src="../../roadCondition/Content/fonts/gentilis_regular.typeface.js" type="text/javascript"></script>
    <script src="../../roadCondition/Content/fonts/droid_sans_regular.typeface.js" type="text/javascript"></script>
    <script src="../../roadCondition/Content/fonts/droid_serif_bold.typeface.js" type="text/javascript"></script>
    <script src="../../roadCondition/Content/fonts/droid_serif_regular.typeface.js" type="text/javascript"></script>
    <script src="../../roadCondition/Content/fonts/gentilis_bold.typeface.js" type="text/javascript"></script>
    <script src="../../roadCondition/Content/fonts/helvetiker_bold.typeface.js" type="text/javascript"></script>
    <script src="../../roadCondition/Content/fonts/optimer_regular.typeface.js" type="text/javascript"></script>
    <script src="../../roadCondition/Content/fonts/helvetiker_regular.typeface.js" type="text/javascript"></script>
    <script src="../../roadCondition/Content/fonts/optimer_bold.typeface.js" type="text/javascript"></script>
   
   <style>
        div#canvas-frame
        {
            border: none;
            cursor: pointer;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        
        h1
        {
            display: block;
            font-size: 20px;
            font-family: '微软雅黑';
            text-align: center;
        }
        
        /*公交速度说明等级*/
        .map_description
        {
            position: absolute;
            right: 30px;
            bottom: 100px;
            width: 28px;
            height: 95px;
            -moz-width: 30px;
            -webkit-width: 30px;
            -moz-height: 100px;
            -webkit-height: 100px;
            display: block;
            z-index: 100;
            background-color: #1b1c28;
            border-bottom: #dede00 solid 3px;
            border-top: #dede00 solid 3px;
        }
        #condition
        {
            display: block;
            color: #dede00;
            font-size: 10px;
            text-align: center;
            margin: 0px 2px;
        }
        
        
        .map_level_bg1
        {
            color: #fff;
            text-align: center;
            margin: 4px 2px;
            font-family: Arial, "宋体" , Verdana, Helvetica, sans-serif;
            cursor: default;
            font-size: 12px;
            background-color: #00FF33;
        }
        .map_level_bg2
        {
            color: #fff;
            text-align: center;
            margin: 4px 2px;
            font-family: Arial, "宋体" , Verdana, Helvetica, sans-serif;
            cursor: default;
            font-size: 12px;
            background-color: #FFF000;
        }
        .map_level_bg3
        {
            color: #fff;
            text-align: center;
            margin: 4px 2px;
            font-family: Arial, "宋体" , Verdana, Helvetica, sans-serif;
            cursor: default;
            font-size: 12px;
            background-color: #FF0033;
        }
        .map_level_bg4
        {
            color: #fff;
            text-align: center;
            margin: 4px 2px;
            font-family: Arial, "宋体" , Verdana, Helvetica, sans-serif;
            cursor: default;
            font-size: 12px;
            background-color: #FF0000;
        }
        legend
        {
            color: #0099ff;
            font-family: Verdana, Helvetica, sans-serif;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div data-role="page" id="allmap" style="overflow: hidden">
        <div id="camera">
        </div>
        <div id="canvas-frame">
            <!--<div id="infoButton">
            </div>-->
           <!-- <div id="infoBox" title="使用说明">
                鼠标左键：漫游；鼠标中键：缩放；m键：全屏</div>-->
            <div class="map_description" id="map_description">
                <span id="condition">路况</span>
                <div class="map_level_bg1">
                    <i>优</i></div>
                <div class="map_level_bg2">
                    <i>良</i></div>
                <div class="map_level_bg3">
                    <i>中</i></div>
                <div class="map_level_bg4">
                    <i>差</i></div>
            </div>
            <div data-role="header" id="nav-panel-header" data-theme="b" data-position="fixed"
                style="background-color: #002847; border: none;">
                <h1 style="color: #002847">
                </h1>
                <a href="#nav-panel" data-icon="bars" data-iconpos="notext">Menu</a>
            </div>
            <div data-role="panel" data-position-fixed="true" data-dismissible="false" data-display="push"
                data-theme="b" id="nav-panel" style="overflow: auto">
                <select name="selectTime" id="selectTime" data-native-menu="false">
                    <option value="select" style="color: #FF0033">请选择时间</option>
                    <option value="Monday">Monday</option>
                    <option value="Tuesday">Tuesday</option>
                    <option value="Wednesday">Wednesday</option>
                    <option value="Thursday">Thursday</option>
                    <option value="Friday">Friday</option>
                    <option value="Saturday">Saturday</option>
                    <option value="Sunday">Sunday</option>
                </select>
                <fieldset data-role="controlgroup" style="width: 21em;">
                    <legend>请选择要添加的线路：</legend>
                    <input type="checkbox" name="checkbox1a" id="checkbox1a" class="custom" data-mini="true"
                        value="0" onchange="this.value=(checkbox1a.checked)?1:0" />
                    <label for="checkbox1a">
                        125路(海大崂山校区-台东)</label>
                    <input type="checkbox" name="checkbox3a" id="checkbox3a" class="custom" data-mini="true"
                        value="0" onchange="this.value=(checkbox3a.checked)?1:0" />
                    <label for="checkbox3a">
                        24路(铁路北站东广场-大港)</label>
                    <input type="checkbox" name="checkbox4a" id="checkbox4a" class="custom" data-mini="true"
                        value="0" onchange="this.value=(checkbox4a.checked)?1:0" />
                    <label for="checkbox4a">
                        113路(流清河-铁路北站东广场)</label>
                    <input type="checkbox" name="checkbox6a" id="checkbox6a" class="custom" data-mini="true"
                        value="0" onchange="this.value=(checkbox6a.checked)?1:0" />
                    <label for="checkbox6a">
                        15路(万安路-天泰公交停车场)</label>
                    <input type="checkbox" name="checkbox7a" id="checkbox7a" class="custom" data-mini="true"
                        value="0" onchange="this.value=(checkbox7a.checked)?1:0" />
                    <label for="checkbox7a">
                        318路(虎山停车场-市政府)</label>
                    <input type="checkbox" name="checkbox8a" id="checkbox8a" class="custom" data-mini="true"
                        value="0" onchange="this.value=(checkbox8a.checked)?1:0" />
                    <label for="checkbox8a">
                        321路(青大高职学院-轮渡回场)</label>
                    <input type="checkbox" name="checkbox9a" id="checkbox9a" class="custom" data-mini="true"
                        value="0" onchange="this.value=(checkbox9a.checked)?1:0" />
                    <label for="checkbox9a">
                        308路(劲松一路-胶州路)</label>
                    <input type="checkbox" name="checkbox10a" id="checkbox10a" class="custom" data-mini="true"
                        value="0" onchange="this.value=(checkbox10a.checked)?1:0" />
                    <label for="checkbox10a">
                        312路(仰口-轮渡)</label>
                    <input type="checkbox" name="checkbox11a" id="checkbox11a" class="custom" data-mini="true"
                        value="0" onchange="this.value=(checkbox11a.checked)?1:0" />
                    <label for="checkbox11a">
                        317路(石老人浴场-天泰体育场)</label>
                    <input type="checkbox" name="checkbox12a" id="checkbox12a" class="custom" data-mini="true"
                        value="0" onchange="this.value=(checkbox12a.checked)?1:0" />
                    <label for="checkbox12a">
                        325路(铁路北站东广场-团岛)</label>
                    <input type="checkbox" name="checkbox13a" id="checkbox13a" class="custom" data-mini="true"
                        value="0" onchange="this.value=(checkbox13a.checked)?1:0" />
                    <label for="checkbox13a">
                        370路(汽车东站-小西湖)</label>
                    <input type="checkbox" name="checkbox14a" id="checkbox14a" class="custom" data-mini="true"
                        value="0" onchange="this.value=(checkbox14a.checked)?1:0" />
                    <label for="checkbox14a">
                        374路(长城路-海洋地质所)</label>
                    <input type="checkbox" name="checkbox15a" id="checkbox15a" class="custom" data-mini="true"
                        value="0" onchange="this.value=(checkbox15a.checked)?1:0" />
                    <label for="checkbox15a">
                        385路(海大崂山校区-李村公园)</label>
                    <input type="checkbox" name="checkbox16a" id="checkbox16a" class="custom" data-mini="true"
                        value="0" onchange="this.value=(checkbox16a.checked)?1:0" />
                    <label for="checkbox16a">
                        33路(北岭-隆德路)</label>
                </fieldset>
            </div>
        </div>
    </div>
</body>
</html>
<script type="text/javascript">

    var container, scene, camera, renderer, controls, stats;
    var keyboard = new THREEx.KeyboardState();
    var clock = new THREE.Clock();
    var targetList = [];
    var projector, mouse = { x: 0, y: 0 };
    init();
    animate();

    function init() {
        //场景
        scene = new THREE.Scene();
        //相机
        var SCREEN_WIDTH = window.innerWidth, SCREEN_HEIGHT = window.innerHeight * 0.95;
        var VIEW_ANGLE = 45, ASPECT = SCREEN_WIDTH / SCREEN_HEIGHT, NEAR = 0.1, FAR = 20000;
        camera = new THREE.PerspectiveCamera(VIEW_ANGLE, ASPECT, NEAR, FAR);
        scene.add(camera);
        camera.position.set(-1.11, -120, 83);
        camera.lookAt(scene.position);

        //渲染器
        if (Detector.webgl)
            renderer = new THREE.WebGLRenderer({ antialias: true });
        else
            renderer = new THREE.CanvasRenderer();

        renderer.setSize(SCREEN_WIDTH, SCREEN_HEIGHT);
        container = document.getElementById("canvas-frame");
        container.appendChild(renderer.domElement);
        renderer.setClearColorHex(0x002847, 1.0);

        //事件
        THREEx.WindowResize(renderer, camera);
        THREEx.FullScreen.bindKey({ charCode: 'm'.charCodeAt(0) });

        //控制相机移动
        controls = new THREE.OrbitControls(camera, renderer.domElement);

        //        //监测性能
        //        stats = new Stats();
        //        stats.domElement.style.position = 'absolute';
        //        stats.domElement.style.bottom = '100px';
        //        stats.domElement.style.right = '5px';
        //        stats.domElement.style.zIndex = 100;
        //        container.appendChild(stats.domElement);

        //灯光
        light = new THREE.DirectionalLight(0XFFFFFF, 1.5, 0);
        light.position.set(0, 0, 100);
        scene.add(light);


        //绘制地面
        var floorTexture = new THREE.ImageUtils.loadTexture('roadCondition/images/qdMap.jpg');
        var floorMaterial = new THREE.MeshBasicMaterial({ map: floorTexture, side: THREE.DoubleSide });
        var floorGeometry = new THREE.PlaneGeometry(136.3, 73.7, 1, 1);
        //var floorGeometry = new THREE.PlaneGeometry(136.7, 82.9, 1, 1);
        var floor = new THREE.Mesh(floorGeometry, floorMaterial);
        scene.add(floor);


        //添加线

        //左上角竖线
        var lineGeometry1 = new THREE.Geometry();
        var vertArray1 = lineGeometry1.vertices;
        vertArray1.push(new THREE.Vector3(-68.15, 36.85, 0), new THREE.Vector3(-68.15, 36.85, 20));
        //vertArray1.push(new THREE.Vector3(-68.85, 41.45, 0), new THREE.Vector3(-68.85, 41.45, 10));
        lineGeometry1.computeLineDistances();
        var lineMaterial1 = new THREE.LineBasicMaterial({ color: 0xFFF000, linewidth: 3 });
        var line1 = new THREE.Line(lineGeometry1, lineMaterial1);
        scene.add(line1);

        //左下角竖线
        var lineGeometry2 = new THREE.Geometry();
        var vertArray2 = lineGeometry2.vertices;
        vertArray2.push(new THREE.Vector3(-68.15, -36.85, 0), new THREE.Vector3(-68.15, -36.85, 20));
        //vertArray2.push(new THREE.Vector3(-68.85, -41.45, 0), new THREE.Vector3(-68.85, -41.45, 10));
        lineGeometry2.computeLineDistances();
        var lineMaterial2 = new THREE.LineBasicMaterial({ color: 0xFFF000, linewidth: 3 });
        var line2 = new THREE.Line(lineGeometry2, lineMaterial2);
        scene.add(line2);

        //右上角竖线
        var lineGeometry3 = new THREE.Geometry();
        var vertArray3 = lineGeometry3.vertices;
        vertArray3.push(new THREE.Vector3(68.15, 36.85, 0), new THREE.Vector3(68.15, 36.85, 20));
        //vertArray3.push(new THREE.Vector3(68.85, 41.45, 0), new THREE.Vector3(68.85, 41.45, 10)); 
        lineGeometry3.computeLineDistances();
        var lineMaterial3 = new THREE.LineBasicMaterial({ color: 0xFFF000, linewidth: 3 });
        var line3 = new THREE.Line(lineGeometry3, lineMaterial3);
        scene.add(line3);

        //右下角竖线
        var lineGeometry4 = new THREE.Geometry();
        var vertArray4 = lineGeometry4.vertices;
        vertArray4.push(new THREE.Vector3(68.15, -36.85, 0), new THREE.Vector3(68.15, -36.85, 20));
        //vertArray4.push(new THREE.Vector3(68.85, -41.45, 0), new THREE.Vector3(68.85, -41.45, 10));
        lineGeometry4.computeLineDistances();
        var lineMaterial4 = new THREE.LineBasicMaterial({ color: 0xFFF000, linewidth: 3 });
        var line4 = new THREE.Line(lineGeometry4, lineMaterial4);
        scene.add(line4);


        //左侧横线
        var lineGeometryleft = new THREE.Geometry();
        var vertArrayleft = lineGeometryleft.vertices;
        vertArrayleft.push(new THREE.Vector3(-68.15, 36.85, 20), new THREE.Vector3(-68.15, -36.85, 20));
        //vertArrayleft.push(new THREE.Vector3(-68.85, 41.45, 10), new THREE.Vector3(-68.85, -41.45, 10));
        lineGeometryleft.computeLineDistances();
        var lineMaterialleft = new THREE.LineBasicMaterial({ color: 0xFFF000, linewidth: 3 });
        var lineleft = new THREE.Line(lineGeometryleft, lineMaterialleft);
        scene.add(lineleft);

        //右侧横线
        var lineGeometryright = new THREE.Geometry();
        var vertArrayright = lineGeometryright.vertices;
        vertArrayright.push(new THREE.Vector3(68.15, 36.85, 20), new THREE.Vector3(68.15, -36.85, 20));
        //vertArrayright.push(new THREE.Vector3(68.85, 41.45, 10), new THREE.Vector3(68.85, -41.45, 10));

        lineGeometryright.computeLineDistances();
        var lineMaterialright = new THREE.LineBasicMaterial({ color: 0xFFF000, linewidth: 3 });
        var lineright = new THREE.Line(lineGeometryright, lineMaterialright);
        scene.add(lineright);

        //前侧横线
        var lineGeometryfront = new THREE.Geometry();
        var vertArrayfront = lineGeometryfront.vertices;
        vertArrayfront.push(new THREE.Vector3(-68.15, -36.85, 20), new THREE.Vector3(68.15, -36.85, 20));
        //vertArrayfront.push(new THREE.Vector3(-68.85, -41.45, 10), new THREE.Vector3(68.85, -41.45, 10));
        lineGeometryfront.computeLineDistances();
        var lineMaterialfront = new THREE.LineBasicMaterial({ color: 0xFFF000, linewidth: 3 });
        var linefront = new THREE.Line(lineGeometryfront, lineMaterialfront);
        scene.add(linefront);

        //后侧横线
        var lineGeometryback = new THREE.Geometry();
        var vertArrayback = lineGeometryback.vertices;
        vertArrayback.push(new THREE.Vector3(-68.15, 36.85, 20), new THREE.Vector3(68.15, 36.85, 20));
        //vertArrayback.push(new THREE.Vector3(-68.85, 41.45, 10), new THREE.Vector3(68.85, 41.45, 10));
        lineGeometryback.computeLineDistances();
        var lineMaterialback = new THREE.LineBasicMaterial({ color: 0xFFF000, linewidth: 3 });
        var lineback = new THREE.Line(lineGeometryback, lineMaterialback);
        scene.add(lineback);



        //添加文字
        var materialFront = new THREE.MeshBasicMaterial({ color: 0xff0000 });
        var materialSide = new THREE.MeshBasicMaterial({ color: 0x000088 });
        var materialArray = [materialFront, materialSide];
        var textMaterial = new THREE.MeshFaceMaterial(materialArray);

        //左前8点与18点标签
        var textGeomrightback18 = new THREE.TextGeometry("18:00",
        	    {
        	        size: 1.0, height: 0.5, curveSegments: 3,
        	        font: "helvetiker", weight: "bold", style: "normal",
        	        bevelThickness: 0, bevelSize: 0, bevelEnabled: true,
        	        material: 0, extrudeMaterial: 1
        	    });


        var textMeshrightback18 = new THREE.Mesh(textGeomrightback18, textMaterial);
        textGeomrightback18.computeBoundingBox();
        textMeshrightback18.position.set(-72.15, -36.85, 15);
        textMeshrightback18.rotation.x = Math.PI / 2;
        scene.add(textMeshrightback18);


        var textGeomrightback12 = new THREE.TextGeometry("12:00",
        	    {
        	        size: 1.0, height: 0.5, curveSegments: 3,
        	        font: "helvetiker", weight: "bold", style: "normal",
        	        bevelThickness: 0, bevelSize: 0, bevelEnabled: true,
        	        material: 0, extrudeMaterial: 1
        	    });
        var textMeshrightback12 = new THREE.Mesh(textGeomrightback12, textMaterial);
        textGeomrightback12.computeBoundingBox();
        textMeshrightback12.position.set(-72.15, -36.85, 7.5);
        textMeshrightback12.rotation.x = Math.PI / 2;
        scene.add(textMeshrightback12);




        var textGeomrightfront8 = new THREE.TextGeometry("8:00",
        	    {
        	        size: 1.0, height: 0.5, curveSegments: 3,
        	        font: "helvetiker", weight: "bold", style: "normal",
        	        bevelThickness: 0, bevelSize: 0, bevelEnabled: true,
        	        material: 0, extrudeMaterial: 1
        	    });
        textGeomrightfront8.computeBoundingBox();
        var textMeshrightfront8 = new THREE.Mesh(textGeomrightfront8, textMaterial);
        textMeshrightfront8.position.set(-72.15, -36.85, 2.5);
        textMeshrightfront8.rotation.x = Math.PI / 2;
        scene.add(textMeshrightfront8);



        //右前8点与18点标签
        var textGeomrightback18 = new THREE.TextGeometry("18:00",
        	    {
        	        size: 1.0, height: 0.5, curveSegments: 3,
        	        font: "helvetiker", weight: "bold", style: "normal",
        	        bevelThickness: 0, bevelSize: 0, bevelEnabled: true,
        	        material: 0, extrudeMaterial: 1
        	    });


        var textMeshrightback18 = new THREE.Mesh(textGeomrightback18, textMaterial);
        textGeomrightback18.computeBoundingBox();
        textMeshrightback18.position.set(68.15, -36.85, 15);
        textMeshrightback18.rotation.x = Math.PI / 2;
        scene.add(textMeshrightback18);


        var textGeomrightback12 = new THREE.TextGeometry("12:00",
        	    {
        	        size: 1.0, height: 0.5, curveSegments: 3,
        	        font: "helvetiker", weight: "bold", style: "normal",
        	        bevelThickness: 0, bevelSize: 0, bevelEnabled: true,
        	        material: 0, extrudeMaterial: 1
        	    });
        var textMeshrightback12 = new THREE.Mesh(textGeomrightback12, textMaterial);
        textGeomrightback12.computeBoundingBox();
        textMeshrightback12.position.set(68.15, -36.85, 7.5);
        textMeshrightback12.rotation.x = Math.PI / 2;
        scene.add(textMeshrightback12);


        var textGeomrightfront8 = new THREE.TextGeometry("8:00",
        	    {
        	        size: 1.0, height: 0.5, curveSegments: 3,
        	        font: "helvetiker", weight: "bold", style: "normal",
        	        bevelThickness: 0, bevelSize: 0, bevelEnabled: true,
        	        material: 0, extrudeMaterial: 1
        	    });
        textGeomrightfront8.computeBoundingBox();
        var textMeshrightfront8 = new THREE.Mesh(textGeomrightfront8, textMaterial);
        textMeshrightfront8.position.set(68.15, -36.85, 2.5);
        textMeshrightfront8.rotation.x = Math.PI / 2;
        scene.add(textMeshrightfront8);



        //左后8点与18点标签
        var textGeomrightback18 = new THREE.TextGeometry("18:00",
        	    {
        	        size: 1.0, height: 0.5, curveSegments: 3,
        	        font: "helvetiker", weight: "bold", style: "normal",
        	        bevelThickness: 0, bevelSize: 0, bevelEnabled: true,
        	        material: 0, extrudeMaterial: 1
        	    });


        var textMeshrightback18 = new THREE.Mesh(textGeomrightback18, textMaterial);
        textGeomrightback18.computeBoundingBox();
        textMeshrightback18.position.set(-72.15, 36.85, 15);
        textMeshrightback18.rotation.x = Math.PI / 2;
        scene.add(textMeshrightback18);


        var textGeomrightback12 = new THREE.TextGeometry("12:00",
        	    {
        	        size: 1.0, height: 0.5, curveSegments: 3,
        	        font: "helvetiker", weight: "bold", style: "normal",
        	        bevelThickness: 0, bevelSize: 0, bevelEnabled: true,
        	        material: 0, extrudeMaterial: 1
        	    });
        var textMeshrightback12 = new THREE.Mesh(textGeomrightback12, textMaterial);
        textGeomrightback12.computeBoundingBox();
        textMeshrightback12.position.set(-72.15, 36.85, 7.5);
        textMeshrightback12.rotation.x = Math.PI / 2;
        scene.add(textMeshrightback12);


        var textGeomrightfront8 = new THREE.TextGeometry("8:00",
        	    {
        	        size: 1.0, height: 0.5, curveSegments: 3,
        	        font: "helvetiker", weight: "bold", style: "normal",
        	        bevelThickness: 0, bevelSize: 0, bevelEnabled: true,
        	        material: 0, extrudeMaterial: 1
        	    });
        textGeomrightfront8.computeBoundingBox();
        var textMeshrightfront8 = new THREE.Mesh(textGeomrightfront8, textMaterial);
        textMeshrightfront8.position.set(-72.15, 36.85, 2.5);
        textMeshrightfront8.rotation.x = Math.PI / 2;
        scene.add(textMeshrightfront8);


        //右后8点与18点标签
        var textGeomrightback18 = new THREE.TextGeometry("18:00",
        	    {
        	        size: 1.0, height: 0.5, curveSegments: 3,
        	        font: "helvetiker", weight: "bold", style: "normal",
        	        bevelThickness: 0, bevelSize: 0, bevelEnabled: true,
        	        material: 0, extrudeMaterial: 1
        	    });


        var textMeshrightback18 = new THREE.Mesh(textGeomrightback18, textMaterial);
        textGeomrightback18.computeBoundingBox();
        textMeshrightback18.position.set(68.15, 36.85, 15);
        textMeshrightback18.rotation.x = Math.PI / 2;
        scene.add(textMeshrightback18);

        var textGeomrightback12 = new THREE.TextGeometry("12:00",
        	    {
        	        size: 1.0, height: 0.5, curveSegments: 3,
        	        font: "helvetiker", weight: "bold", style: "normal",
        	        bevelThickness: 0, bevelSize: 0, bevelEnabled: true,
        	        material: 0, extrudeMaterial: 1
        	    });
        var textMeshrightback12 = new THREE.Mesh(textGeomrightback12, textMaterial);
        textGeomrightback12.computeBoundingBox();
        textMeshrightback12.position.set(68.15, 36.85, 7.5);
        textMeshrightback12.rotation.x = Math.PI / 2;
        scene.add(textMeshrightback12);


        var textGeomrightfront8 = new THREE.TextGeometry("8:00",
        	    {
        	        size: 1.0, height: 0.5, curveSegments: 3,
        	        font: "helvetiker", weight: "bold", style: "normal",
        	        bevelThickness: 0, bevelSize: 0, bevelEnabled: true,
        	        material: 0, extrudeMaterial: 1
        	    });
        textGeomrightfront8.computeBoundingBox();
        var textMeshrightfront8 = new THREE.Mesh(textGeomrightfront8, textMaterial);
        textMeshrightfront8.position.set(68.15, 36.85, 2.5);
        textMeshrightfront8.rotation.x = Math.PI / 2;
        scene.add(textMeshrightfront8);

        drawWall();


    }



    function selectNone() {//当换星期的时候原来选中的全部取消，注意jequery与jequerymobile对checkbox的操作不同

        $('input[type=checkbox]').each(function () {
            $(this).prop('checked', false).checkboxradio("refresh");
        });
    }

    //用数据库数据，绘制道路
    var wall;
    function drawWall() {

        $("#selectTime").change(function () {
            selectNone();
            for (var i = 0; i < targetList.length; i++) {
                if (targetList[i].visible) {
                    targetList[i].visible = false;
                }
            }

        });
        $(".custom").each(function (index, element) {
            $(element).on("click", function () {
                this.blur();
                this.focus();
                //                var clickline = $(element).context.parentElement.innerText; //线路名

                var clickline = $(element).context.parentElement.childNodes[0].firstChild.nodeValue; //线路名
                var busLineName = $.trim(clickline.split('(')[0]);
                var BusStopName = clickline.split('(')[1].split('-')[1].split(')')[0];
                var week = $("#selectTime").val();
                var tag;
                if ($(element).val() == "0") {
                    if (targetList.length != 0) {
                        for (var i = 1; i < targetList.length; i++) {

                            if (targetList[i - 1].busLineName == busLineName && targetList[i - 1].BusStopName == BusStopName && targetList[i - 1].week == week) {
                                targetList[i].visible = true;
                                tag = true;
                            }
                        }
                        if (!tag) {
                            draw(clickline, week);
                        }
                    }
                    else {
                        draw(clickline, week);
                    }
                }
                else {

                    for (var i = 1; i < targetList.length; i++) {

                        if (targetList[i - 1].busLineName == busLineName && targetList[i - 1].BusStopName == BusStopName && targetList[i - 1].week == week) {
                            targetList[i].visible = false;

                        }
                    }

                }

            });

        });

    }

    function draw(clickline, week) {

        $.ajax({
            url: '../../Home/getVisualData',
            data: { busline: clickline, time: week },
            type: 'post',
            dataType: 'json',
            success: function (data) {
                // alert(data[0].stationname);
                var count = 0;
                for (var i = 1; i < data.length; i++) {
                    var wallgeometry = new THREE.Geometry();
                    var startCoor = Projection(data[i - 1].startlng, data[i - 1].startlat);
                    var endCoor = Projection(data[i - 1].endlng, data[i - 1].endlat);
                    count = i - 1;
                    do {
                        var wallgeometry = new THREE.Geometry();
                        var vertex1 = new THREE.Vector3(startCoor.x, startCoor.y, (i - count) * 0.2);
                        var vertex3 = new THREE.Vector3(endCoor.x, endCoor.y, (i - count) * 0.2);
                        var vertex4 = new THREE.Vector3(startCoor.x, startCoor.y, (i - count + 1) * 0.2);
                        var vertex2 = new THREE.Vector3(endCoor.x, endCoor.y, (i - count + 1) * 0.2);
                        wallgeometry.vertices.push(vertex1);
                        wallgeometry.vertices.push(vertex2);
                        wallgeometry.vertices.push(vertex3);
                        wallgeometry.vertices.push(vertex4);

                        wallgeometry.faces.push(new THREE.Face3(2, 0, 3)); //0, 2, 3, 1 
                        wallgeometry.faces.push(new THREE.Face3(2, 3, 1)); //0, 2, 3, 1 
                        wallgeometry.faces.push(new THREE.Face3(0, 2, 3)); //0, 2, 3, 1 
                        wallgeometry.faces.push(new THREE.Face3(2, 1, 3)); //0, 2, 3, 1 
                        i++;

                        var material;
                        if (data[i - 1].speed > 0 && data[i - 1].speed <= 3) {
                            material = new THREE.MeshBasicMaterial({
                                color: 0xff0000 // 红色
                            });
                        } else if (data[i - 1].speed > 3 && data[i - 1].speed <= 5) {
                            material = new THREE.MeshBasicMaterial({
                                color: 0xCC0000
                            });
                        }

                        //                        else if (data[i - 1].speed > 5 && data[i - 1].speed <= 7) {
                        //                            material = new THREE.MeshBasicMaterial({
                        //                                color: 0xCC0033
                        //                            });

                        //                        } else if (data[i - 1].speed > 7 && data[i - 1].speed <= 9) {
                        //                            material = new THREE.MeshBasicMaterial({
                        //                                color: 0xFFFF00 // 黄色
                        //                            });

                        //                        } else if (data[i - 1].speed > 9 && data[i - 1].speed <= 10) {
                        //                            material = new THREE.MeshBasicMaterial({
                        //                                color: 0xFFCC00
                        //                            });

                        //                        } else if (data[i - 1].speed > 10 && data[i - 1].speed <= 12) {
                        //                            material = new THREE.MeshBasicMaterial({
                        //                                color: 0xFFFF33
                        //                            });

                        //                        } else if (data[i - 1].speed > 12 && data[i - 1].speed <= 14) {
                        //                            material = new THREE.MeshBasicMaterial({
                        //                                color: 0xFFFF66
                        //                            });

                        //                        } else if (data[i - 1].speed > 14 && data[i - 1].speed <= 16) {
                        //                            material = new THREE.MeshBasicMaterial({
                        //                                color: 0x00FF33 // 绿色
                        //                            });

                        //                        } else if (data[i - 1].speed > 16 && data[i - 1].speed <= 18) {
                        //                            material = new THREE.MeshBasicMaterial({
                        //                                color: 0x66CC00
                        //                            });

                        //                        } else if (data[i - 1].speed > 18 && data[i - 1].speed <= 20) {
                        //                            material = new THREE.MeshBasicMaterial({
                        //                                color: 0x66CC33
                        //                            });

                        //                        } else if (data[i - 1].speed > 20 && data[i - 1].speed <= 22) {
                        //                            material = new THREE.MeshBasicMaterial({
                        //                                color: 0x66CC66
                        //                            });

                        //                        } else if (data[i - 1].speed > 22 && data[i - 1].speed <= 24) {
                        //                            material = new THREE.MeshBasicMaterial({
                        //                                color: 0x66FF66
                        //                            });

                        //                        } else if (data[i - 1].speed > 24 && data[i - 1].speed <= 26) {
                        //                            material = new THREE.MeshBasicMaterial({
                        //                                color: 0x66FF99
                        //                            });
                        //                        }



                        else if (data[i - 1].speed > 5 && data[i - 1].speed <= 10) {
                            material = new THREE.MeshBasicMaterial({
                                color: 0xFF0033 // 浅红
                            });

                        } else if (data[i - 1].speed > 10 && data[i - 1].speed <= 15) {
                            material = new THREE.MeshBasicMaterial({
                                color: 0xFFFF00 // 黄色
                            });
                        } else if (data[i - 1].speed > 15) {
                            material = new THREE.MeshBasicMaterial({
                                color: 0x00FF33 // 绿色
                            });

                        }
                        wall = new THREE.Mesh(wallgeometry, material);
                        scene.add(wall);
                        var jsonStr = { "busLineName": data[i - 1].busLineName,
                            "BusStopName": data[i - 1].BusStopName,
                            "week": data[i - 1].week
                        };

                        targetList.push(jsonStr);
                        targetList.push(wall);


                    } while (i < data.length && data[i - 1].stationname == data[i].stationname);



                }

            }
        });

    }




    function animate() {
        requestAnimationFrame(animate);
        render();
        update();
    }
    function update() {

        if (keyboard.pressed("z")) {
            // do something
        }

        controls.update();
        // stats.update();
    }
    function render() {
        renderer.render(scene, camera);
        // document.getElementById("camera").innerHTML = camera.position.x + "," + camera.position.y + "," + camera.position.z; 

    }
    

</script>
