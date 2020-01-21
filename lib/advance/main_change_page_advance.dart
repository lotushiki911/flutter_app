import 'package:flutter/material.dart';
import 'pages/change_pages.dart';
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
      home: PageChangeFirst(),
    );
  }
}

