import 'package:flutter/material.dart';
import 'warp_base.dart';
void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '流式布局app',
      theme: ThemeData.light(),
      home: warpBaseDemo(),
    );
  }
}
