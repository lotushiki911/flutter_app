import 'package:flutter/material.dart';
import 'bottom_appbar_demo.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: BottomAppBarDemo(),
    );
  }
}