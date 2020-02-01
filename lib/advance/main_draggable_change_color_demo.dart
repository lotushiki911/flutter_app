import 'package:flutter/material.dart';
import 'boxs_widget.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'flutterDemo1',
      debugShowCheckedModeBanner: false, //去掉debug水印
      theme: ThemeData.light(),
      home: BoxColorChangeDemo(),
    );
  }
}

//点击拖拽小方块能改变大方块的颜色
class BoxColorChangeDemo extends StatefulWidget {
  @override
  _BoxColorChangeDemoState createState() => _BoxColorChangeDemoState();
}

class _BoxColorChangeDemoState extends State<BoxColorChangeDemo> {
  //接受容器的原始颜色
  Color _boxColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //使用可重叠组件
      body: Stack(
        children: <Widget>[
          BoxsWidget(
            offset: Offset(80.0,80.0),
            widgetColor: Colors.lightGreen,
          ),
          BoxsWidget(
            offset: Offset(180.0,80.0),
            widgetColor: Colors.lightBlue,
          ),
          //定义接收器
          Center(
            child: DragTarget(
              //接受触发事件 此处是自定义的组件boxwidget传递属性关联data: widget.widgetColor,
              onAccept: (Color color){
                //改变颜色
                _boxColor = color;
              },
              //构造器重新返回这个组件
              builder: (context, candidateData,rejectedData){
                  return Container(
                    //定义大方块
                    width: 200.0,
                    height: 200.0,
                    color: _boxColor,//拖拽之后 颜色变为传递过来的颜色
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}

