import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'flutterDemo1',
      debugShowCheckedModeBanner: false, //去掉debug水印
      theme: ThemeData.light(),
      home: ToolTipDemo(),
    );
  }
}


//轻量级的提示  点击不动就会进行提示一个message
class ToolTipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tool tips demo'),),
      body: Center(
        //tooltip需要提示什么 将其包裹起来就行
        child: Tooltip(
            child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1580559533391&di=657a7ed605d7e79c944f9bd4721d613c&imgtype=0&src=http%3A%2F%2Fattachments.gfan.com%2Fforum%2Fattachments2%2Fday_111113%2F1111131811fe8b6d1575c620d7.jpg'),
            message: '呵呵哒!',
        ),
      ),
    );
  }
}
