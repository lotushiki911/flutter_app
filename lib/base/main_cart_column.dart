import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //卡片布局  带分割线
  var card = new Card(
    child: Column(
      children: <Widget>[
        new ListTile(
          title: Text('hehehe',style: TextStyle(fontWeight: FontWeight.w500),),
          subtitle: Text('asia'),
          leading: new Icon(Icons.account_box,color: Colors.lightBlue,),
        ),
        new Divider(),//分割线
        new ListTile(
          title: Text('lalala',style: TextStyle(fontWeight: FontWeight.w500),),
          subtitle: Text('china'),
          leading: new Icon(Icons.account_box,color: Colors.lightBlue,),
        ),
        new Divider(),
        new ListTile(
          title: Text('hahaha',style: TextStyle(fontWeight: FontWeight.w500),),
          subtitle: Text('japan'),
          leading: new Icon(Icons.account_box,color: Colors.lightBlue,),
        ),
      ],
    ),
  );
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'stack widget',
      home: Scaffold(
        appBar: AppBar(title: Text('呵呵哒'),),
        body: Center(
          child: card
        ),
      ),
    );
  }
}