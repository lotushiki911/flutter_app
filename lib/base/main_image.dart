import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends  StatelessWidget {
  //@override
  Widget build(BuildContext context) {
//    return Container();
    //var container = Container();
    //container.
    return MaterialApp(
      title: '欢迎。。。',
      home: Scaffold(
        appBar: AppBar(
          title: Text('welcome to hello'),
        ),
        body: Center(
          //container 类似html里面的div 块
          child: Container(
            //图片组件 asset 项目内部目录 file 本地路径（手机） memory内存形式 network 网络图片
            child: Image.network(
              'https://www.baidu.com/img/superlogo_c4d7df0a003d3db9b65e9ef0fe6da1ec.png?where=super',
              //fit: BoxFit.contain, //填充模式
              //fit: BoxFit.fill, //填充模式 填满
              //color: Colors.black38,
              //colorBlendMode: BlendMode.modulate, //图片颜色混合模式
              repeat: ImageRepeat.repeat, //图片重复 显示
              //fitwidth 横向填满
            ),
            color: Colors.lightGreen,
            width: 300.0,
            height: 200.0,

          ),
        ),
      )
    );
  }
}