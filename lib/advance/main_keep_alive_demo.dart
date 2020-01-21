import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '测试123',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen
      ),
      home: KeepAliveDemo(),
    );
  }
}



class KeepAliveDemo extends StatefulWidget {
  @override
  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}

//多继承
class _KeepAliveDemoState extends State<KeepAliveDemo>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  //重写初始状态
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //TabController 协调标签和标签展示内容页,this指代当前实例对象
    _controller = TabController(length: 3,vsync: this);
  }

  //重写销毁方法
  @override
  void dispose() {
    // TODO: implement dispose
    //销毁的时候要一起销毁页面状态
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('keep alive demo'),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.build)),
            Tab(icon: Icon(Icons.access_time)),
            Tab(icon: Icon(Icons.beach_access)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          Center(
            child: Text('修理',style: TextStyle(fontSize: 40.0),),
          ),
          Center(
            child: Text('闹钟',style: TextStyle(fontSize: 40.0),),
          ),
          Center(
            child: Text('沙滩',style: TextStyle(fontSize: 40.0),),
          )
        ],
      ),
    );
  }
}
