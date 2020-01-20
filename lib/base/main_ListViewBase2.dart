import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'heheda tiand Demo',
      home: Scaffold( //脚手架
        appBar: AppBar(title: Text('new app'),),
        //列表
        body: Center(
          child: Container(
            height: 200.0,
            color: Colors.deepOrange,
            //列表组件
            child: ListView(
              //改为横轴拖动
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                new Container(
                  width: 180.0,
                  color: Colors.lightGreen,
                )
                ,new Image.network('https://pics2.baidu.com/feed/6f061d950a7b0208783622a78807ffd5552cc8d9.jpeg?token=c7522ff51dbf845da030eda26423a094&s=47D05B83C94EB6CC1AE50D230300B0C0')
                ,new Image.network('https://pics7.baidu.com/feed/4610b912c8fcc3ce44e8b17f7b9bdb8ed53f20b2.jpeg?token=e8337160f5a4c1de678f608597c46945&s=9741D101E4D063D685048D9F010050C0')
                ,new Image.network('https://pics0.baidu.com/feed/4ec2d5628535e5dd560b71599f18aae9cf1b6272.jpeg?token=5f17cfca54f9973663ed849d146a4b31&s=5E268645E102E347409805DB0100C0B2')
              ],

//              children: <Widget>[
//                //图片模式
//                new Image.network('https://pics2.baidu.com/feed/6f061d950a7b0208783622a78807ffd5552cc8d9.jpeg?token=c7522ff51dbf845da030eda26423a094&s=47D05B83C94EB6CC1AE50D230300B0C0')
//                ,new Image.network('https://pics7.baidu.com/feed/4610b912c8fcc3ce44e8b17f7b9bdb8ed53f20b2.jpeg?token=e8337160f5a4c1de678f608597c46945&s=9741D101E4D063D685048D9F010050C0')
//                ,new Image.network('https://pics0.baidu.com/feed/4ec2d5628535e5dd560b71599f18aae9cf1b6272.jpeg?token=5f17cfca54f9973663ed849d146a4b31&s=5E268645E102E347409805DB0100C0B2')
//                ,
//                //图标加文字模式
//                new ListTile(
//                  leading: new Icon(Icons.tablet_android),
//                  title: new Text('lalalal'),
//                ),
//                new ListTile(
//                  leading: new Icon(Icons.access_alarm),
//                  title: new Text('zzzzz'),
//                )
//              ], //返回一个集合,
            ),
          ),
        heightFactor: 400.0,
        )
      ),
    );
  }

}