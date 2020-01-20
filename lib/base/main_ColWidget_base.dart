import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext buildContext){
    return MaterialApp(
      title: 'hello colWidget',
      home: Scaffold(
        appBar: AppBar(title: Text('垂直布局方法'),),
        //使用center叠加column 实现屏幕居中
        body:new Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start, //副属性 行对齐属性
              mainAxisAlignment: MainAxisAlignment.center, //主属性  列对齐属性
              children: <Widget>[
                //可以使用 Expanded 灵活得布局
                new Text('heheda'),
                new Text('lalalala'),
                new Text('i like it hehehe'),
              ],
          )
        )
      ),
    );
  }
}