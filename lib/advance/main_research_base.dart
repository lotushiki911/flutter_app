import 'package:flutter/material.dart';
import 'search_bar_demo.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'research demo',
      theme: ThemeData.light(),
      home: SearchBarDemo(
      ),
    );
  }
}