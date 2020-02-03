import 'package:flutter/material.dart';
import 'com/tiand/pages/index_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //使用container包裹 便于控制样式和扩展
    return Container(
      child: MaterialApp(
        title: '买买买',
        //去掉debug水印
        debugShowCheckedModeBanner: false,
        //设置主题色
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        //主页面
        home: IndexPage(),
      ),
    );
  }
}
