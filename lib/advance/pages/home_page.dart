import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('欢迎主页面'),),
      body: Center(child: Text('欢迎'),),
    );
  }
}