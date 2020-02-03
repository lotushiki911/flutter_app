import 'package:flutter/cupertino.dart'; //ios 风格
import 'package:flutter/material.dart';  //google 风格

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('买买买'),),
      body: Center(
        child: Text('买买买快来买'),
      ),
    );
  }
}
