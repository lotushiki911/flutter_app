import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'ListView ...',
      home: Scaffold(
        appBar: AppBar(title: Text('Listview haha...')),
        //网格列表 多用在图片现实
        body: GridView.count(
          padding: const EdgeInsets.all(20.0), //内边距
          crossAxisSpacing: 10.0, //网格间距
          crossAxisCount: 3, //每行现实多少个网格
          //列表元素显示
          children: <Widget>[
            new Text('hehehe'),
            new Text('haahah'),
            new Text('lalala'),
            new Text('xixixi'),
            new Text('mimimi'),
            new Text('jijiji'),
            new Text('zizizi'),
            new Text('gagaga'),
            new Text('niuniuniu'),
            new Text('biubiubiu'),
          ],
        ),
      ),
    );
  }
}