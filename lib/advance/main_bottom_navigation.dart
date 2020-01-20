import 'package:flutter/material.dart';
import 'bottom_navigate_widget.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '底部导航栏',
      theme: ThemeData.dark(), //导航栏底部主题 皮肤
      home: BottomNavigationWidget(),
    );
  }
}