import 'package:flutter/material.dart';
import 'dart:ui';

/***
 *
 * 1 先放一个图片
 * 2 上面加个矩形
 * 3 对矩形进行模糊
 * 4 中间加个字体
 */
class frostedGlassDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('毛玻璃'),),
      body: Stack(
        children: <Widget>[
          //约束盒子 组件,添加额外的约束条件到child上
          ConstrainedBox(
            constraints: const BoxConstraints.expand(), //随着里面的东西(child)进行扩展
            child: Image.asset('images/2.jpg')
          ) ,
          Center(
            //可裁切的矩形
            child: ClipRect(
              //添加过滤器   背景过滤器
              child: BackdropFilter(
                //使用图片过滤器  blur 模糊模式  ImageFilter在dart.ui模块里
                filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
                //过滤的对象
                child: Opacity(
                  //Opacity控制透明度
                  opacity: 0.5,
                  child: Container(
                    width: 500.0,
                    height: 700.0,
                    //盒子修饰器
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    child: Center(
                      child: Text(
                        '试一试',
                        style: Theme.of(context).textTheme.display3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

