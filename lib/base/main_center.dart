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
              child: new Text('你好！',style: TextStyle(fontSize: 40.0),),
              alignment: Alignment.topLeft,
              width: 400,
              height: 300,
              //color: Colors.blue, 设定整体颜色
              //渐变色
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Colors.lightBlue, Colors.greenAccent, Colors.purple]
                ),
                border: Border.all(width: 5.0, color: Colors.red), //渐变模块的边框
              ),
              //padding: const EdgeInsets.all(20.0),//内边距
              padding: const EdgeInsets.fromLTRB(10.0, 100.0, 0.0, 0.0), //分别可以设定上下左右
              margin: const EdgeInsets.all(20.0), //外边距
            ),
          ),
        )
    );
  }
}