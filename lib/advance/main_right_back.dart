import 'package:flutter/material.dart';
import 'right_back_demo.dart';
void main() => runApp(MyApp());

//闪屏动画 就是正式进入主页之前的加载动画效果
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'flutterDemo1',
      debugShowCheckedModeBanner: false, //去掉debug水印
      theme: ThemeData.light(),
      home: RightBackDemo(),
    );
  }
}