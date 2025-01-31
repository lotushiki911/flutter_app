import 'package:flutter/material.dart';

void main() => runApp(MyApp(
  items: new List<String>.generate(20, (i)=>'item==>$i')
));

class MyApp extends StatelessWidget{
  final List<String> items;
  MyApp({Key key,@required this.items}):super(key:key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'heheda tiand Demo',
      home: Scaffold( //脚手架
        appBar: AppBar(title: Text('new app'),),
        //动态加载列表 文本类型
        body: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (context,index){
              return new ListTile(
                title: new Text('${items[index]}'),
              );
            }
        )
      ),
    );
  }
}
