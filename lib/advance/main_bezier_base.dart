import 'package:flutter/material.dart';
import 'custom_clipper.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'flutterDemo',
      debugShowCheckedModeBanner: false, //去掉debug水印
      theme: ThemeData.light(),
      home: CustomClipperDemo(),
    );
  }
}