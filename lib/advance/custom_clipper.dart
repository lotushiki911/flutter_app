import 'package:flutter/material.dart';

//贝塞尔曲线 按路径进行裁切
class CustomClipperDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
         children: <Widget>[
           //按路径 裁切组件
           ClipPath(
             clipper: BottomClip2(),
             child: Container(
               color: Colors.deepOrange,
               height: 200.0,
             ),
           )
         ],
       )
    );
  }
}

class BottomClip extends CustomClipper<Path>{
  //复写返回路径
  @override
  Path getClip(Size size) {
    //四个点加上一个贝塞尔曲线 共同确定截取的图形
    var path = Path();
    //定义片斜率
    var offlength = 50;
    //第一个点添加
    path.lineTo(0, 0);
    //第二个点
    path.lineTo(0, size.height-offlength);
    //接下来是贝塞尔曲线的控制点和结束点
    //首先确定位置
    var firstControlPoint = Offset(size.width/2,size.height);
    var firstEndPoint = Offset(size.width,size.height-offlength);
    //生成二次贝塞尔曲线
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    //第三个点
    path.lineTo(size.width,size.height-offlength);
    //第四个点
    path.lineTo(size.width,0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class BottomClip2 extends CustomClipper<Path>{
  //复写返回路径
  @override
  Path getClip(Size size) {
    //定义路径 四个点加上两个贝塞尔曲线 共同确定截取的图形
    var path = Path();
    //定义片斜率
    var setLength = 50;
    //第一个点添加
    path.lineTo(0, 0);
    //第二个点
    path.lineTo(0, size.height-setLength);
    //接下来是贝塞尔曲线的控制点和结束点
    //首先定位第一段贝塞尔曲线 控制点设置到1/4处,高度与size相同
    var firstControlPoint = Offset(size.width/4, size.height);
    var firstEndPoint = Offset(size.width/2, size.height-setLength);
    //生成第一段贝塞尔曲线
    path.quadraticBezierTo(
        firstControlPoint.dx,firstControlPoint.dy,
        firstEndPoint.dx,firstEndPoint.dy
    );
    //定位第二段贝塞尔曲线 控制点设置到3/4处,高度为size高度 - 2* setLength
    var secondControlPoint = Offset(size.width*3/4,size.height-2*setLength);
    var secondEndPoint = Offset(size.width,size.height-setLength);
    //生成第二段贝塞尔曲线
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy
    );
    //第三个点
    path.lineTo(size.width,size.height-setLength);
    //第四个点
    path.lineTo(size.width,0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
