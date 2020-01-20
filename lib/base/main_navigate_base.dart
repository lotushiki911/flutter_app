import 'package:flutter/material.dart';
//为什么main函数里需要分开写 而不是像以前一样直接 返回myapp然后再myapp里返回MaterialApp
void main() {
  runApp(MaterialApp(
      title: '导航01',
      home: MyApp()
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext context){
    return  Scaffold(
      appBar: AppBar(title: Text('导航页面'),),
      body: Center(
        //按钮组件
        child: RaisedButton(
          child: Text('查看商品详情页'),
          onPressed:(){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => SecondView()
            ));
          }
        ),
      ),
    );
  }
}

class SecondView extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Scaffold(
        appBar: AppBar(title: Text('商品详情子页')),
        body: Center(
          child: RaisedButton(
            child: Text('返回'),
            onPressed: (){
              Navigator.pop(context);
            }
          ),
        ),
    );
  }
}