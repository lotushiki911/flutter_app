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
          child: Text(
              'Hello Worldfhjdkwjqkfuidsjmabfjiejwqjkfjkdsajfjkdjsalfjkldsjalkfjdklsjafklejkqhfea!!-'
            , textAlign: TextAlign.center,//居中显示
            maxLines: 2, //最多显示x行
            overflow: TextOverflow.ellipsis, //多余部分显示省略号
            style: TextStyle(  //字体属性
              fontSize: 25.0, //必须保存成浮点
              color: Color.fromARGB(255, 255, 125, 125), //（a ，r，g，b）a 透明度
              decoration: TextDecoration.underline, //下划线
              decorationStyle: TextDecorationStyle.solid, //下划线样式 实心

            ),
          ),
        ),
      )
    );
  }
}