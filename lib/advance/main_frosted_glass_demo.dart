import 'package:flutter/material.dart';
import 'frosted_glass_demo.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '测试下',
      theme: ThemeData(
        primaryColor: Colors.lightGreen
      ),
      home: frostedGlassDemo()
    );
  }
}
