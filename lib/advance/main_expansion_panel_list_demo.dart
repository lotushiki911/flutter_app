import 'package:flutter/material.dart';
import 'expansionForList.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '隐藏内容list',
      theme: ThemeData.light(),
      home: ExpansionTileForList(),
    );
  }
}

