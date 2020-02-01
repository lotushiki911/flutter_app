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
             clipper: BottomClip(),
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
