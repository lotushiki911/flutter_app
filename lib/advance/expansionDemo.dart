import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('隐藏下拉菜单'),),
      //点击后能打开隐藏的内容
      body: Center(
        child: ExpansionTile(
          title: Text('点击打开隐藏'),
          //隐藏组件的图标
          leading: Icon(Icons.ac_unit),
          //点击后可改变的背景颜色
          backgroundColor: Colors.lightGreen,
          //初始状态 隐藏的内容是否打开 false是默认的不打开
          initiallyExpanded: false,
          //隐藏的内容
          children: <Widget>[
            ListTile(
              title: Text('今天星期一'),
              subtitle: Text('是个好天气'),
            ),
          ],
        ),
      )
    );
  }
}

