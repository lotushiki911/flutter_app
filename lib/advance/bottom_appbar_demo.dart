import 'package:flutter/material.dart';
import 'pages/each_view.dart';

class BottomAppBarDemo extends StatefulWidget {
  @override
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  List<Widget> _eachView;
  int _index =0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eachView = List();
    _eachView..add(EachView('home'))..add(EachView('heheda'));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_index],
      //可交互的浮动按钮
      floatingActionButton: FloatingActionButton(
        //响应事件
        onPressed: (){
//          Navigator.of(context).push(
//            MaterialPageRoute(builder:(BuildContext context){
//              return EachView('新页面');
//            })
//          );
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => EachView('呵呵哒页面')
          ));

        },
        //长按的时候显示提示
        tooltip: '来点一点，呵呵哒',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //bottomappbar要比navidatebar要灵活
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen,
        //圆形缺口组件 用来在底栏增加中间那个大的圆形按钮
        shape: CircularNotchedRectangle(),
        child: Row(
          //主轴 占满
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround, //对齐模式
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.email),
              color: Colors.white,
              onPressed: (){
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.airplay),
              color: Colors.white,
              onPressed: (){
                setState(() {
                  _index = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
