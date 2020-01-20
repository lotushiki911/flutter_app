import 'package:flutter/material.dart';
import 'pages/airplay_page.dart';
import 'pages/email_page.dart';
import 'pages/explore_page.dart';
import 'pages/home_page.dart';

//动态widget  固定写法
class BottomNavigationWidget extends StatefulWidget{
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget>{
  //定义一个 内部的颜色用来显示底层的图标显示
  final _bottomNavigationColor = Colors.lightGreen;
  int _currentIndex = 0;
  List<Widget> list = List();
  @override
  void initState(){
    list
      ..add(HomePage())
      ..add(EmailPage())
      ..add(ExplorePage())
      ..add(AirplayPage());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: list[_currentIndex],
      //底部导航图标返回一个widget items组
      bottomNavigationBar: BottomNavigationBar(
        //高亮显示
        currentIndex: _currentIndex,
        //响应时间 点击之后 变换对应的页面编码
        onTap: (int index){
          print('index---->$index');
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.red, //只在第一行有用?
            icon: Icon(
              Icons.home,
              color: _bottomNavigationColor,
            ),
            title: Text(
              'home',
              style: TextStyle(color: _bottomNavigationColor),
            )
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.black, //只在第一行有用?
              icon: Icon(
                Icons.email,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'email',
                style: TextStyle(color: _bottomNavigationColor),
              )
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.yellow, //只在第一行有用?
              icon: Icon(
                Icons.explore,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'explore',
                style: TextStyle(color: _bottomNavigationColor),
              )
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.grey, //只在第一行有用?
              icon: Icon(
                Icons.airplay,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'airplay',
                style: TextStyle(color: _bottomNavigationColor),
              )
          ),
        ]
      ),
    );
  }
}