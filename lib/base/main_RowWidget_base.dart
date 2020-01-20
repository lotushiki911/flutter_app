import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext buildContext){
    return MaterialApp(
      title: 'hello rowWidget',
      home: Scaffold(
        appBar: AppBar(title: Text('水平布局方法'),),
        body: new Row(  //水平布局方法
          children: <Widget>[
            //加入按钮组件    普通的不灵活的组件  固定长度
            new RaisedButton(
              onPressed: (){},
              color: Colors.orange,
              child: new Text('orange butten'),
            ),
            //加入Expanded 灵活得布局
            Expanded(child: new RaisedButton(
              onPressed: (){},
              color: Colors.redAccent,
              child: new Text('red butten'),
            ),),
            Expanded(child: new RaisedButton(
              onPressed: (){},
              color: Colors.purple,
              child: new Text('purple butten'),
            ),),
            new RaisedButton(
              onPressed: (){},
              color: Colors.lightBlue,
              child: new Text('lightBlue butten'),
            ),
          ],
        )
      ),
    );
  }
}