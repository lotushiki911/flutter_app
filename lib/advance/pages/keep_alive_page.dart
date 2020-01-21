import 'package:flutter/material.dart';

class MyAliveHomePage extends StatefulWidget {
  @override
  _MyAliveHomePageState createState() => _MyAliveHomePageState();
}

class _MyAliveHomePageState extends State<MyAliveHomePage>
    with AutomaticKeepAliveClientMixin{

  int _counter = 0;

  @override
  bool get wantKeepAlive => true;

  //写一个方法点击计数器增加计数
  void _incrementCounter() => setState(() => _counter++);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //主属性对齐
          children: <Widget>[
            Text('点一点 加一加'),
            Text(
              '$_counter',
              //使用预设的主题样式  省的自己写
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      //增加浮动按钮 可交互的浮动按钮
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        //长按的时候显示提示
        tooltip: '点击增加',
        child: Icon(Icons.add),
      ),
      //浮动按钮对齐模式 居中
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}
