import 'package:flutter/material.dart';
import 'expansionDemo.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '下拉隐藏菜单',
      theme: ThemeData.light(),
      home: ExpansionTileDemo(),
    );
  }
}