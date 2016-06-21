function Projection(lng, lat) {

    //坐标原点(地图中心点坐标)
    //qdMap
    var zeropointlng = 120.400382; ////黑色地图的中心点：120.1030535,36.0503355，qdMap:120.400382,36.097155
    var zeropointlat = 36.097155;

//    //qdMap2
//    var zeropointlng = 120.4598565; ////黑色地图的中心点：120.1030535,36.0503355
//    var zeropointlat = 37.152872;

        


    //绘图区域canvas的大小

    // //qdMap
    var width = 136.3/0.194752;
    var height = 73.7/0.08469;



//    // //qdMap2
//    var width = 136.7 / 0.390655;
//    var height = 82.9 / 1.81279;

    var x = (lng - zeropointlng) * width;
    var y = (lat - zeropointlat) * height;
    var point = new Point(x, y);

    return point;

}

function Point(x, y) {
    this.x = x;
    this.y = y;
}