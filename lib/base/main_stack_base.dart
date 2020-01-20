import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var stack = new Stack(
    //在组件里的对齐方式 本例中 指的是 对齐图片的重叠方式 ，文字回出现在背景图片的中间下方
      alignment: const FractionalOffset(0.5, 0.8),
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
              color : Colors.lightBlue
          ),
          padding: EdgeInsets.all(7.0),
          child: Text('hehehehe'),
        ),
        //背景使用 圆形 头像
        new CircleAvatar(
          backgroundImage: NetworkImage('11'), //背景的图片来源
          radius: 100.0,  //弧度大小
        ),

      ],
  );
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'stack widget',
      home: Scaffold(
        appBar: AppBar(title: Text('重叠布局'),),
        body: Center(
          child: stack
        ),
      ),
    );
  }
}