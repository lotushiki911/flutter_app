import 'package:flutter/material.dart';
import 'custom_route.dart';
import 'dart:math';

class PageChangeFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        //backgroundColor: Colors.grey,
        title: Text('First Page',style: TextStyle(fontSize: 40.0),),
        elevation: 0.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(Icons.navigate_next,color: Colors.white, size: 60.0,),
          onPressed: (){
            //普通的没有加任何动画效果
//            Navigator.push(context, MaterialPageRoute(
//              builder: (context) => PageChangeSecond()
//            ));
          //生成一个随机数用来 改变响应动画变为随机模式
            int ranint = Random().nextInt(4);
            print(ranint);
            //加了动画效果后
            Navigator.push(context, CustomRoute(PageChangeSecond(),ranint));
          },
        ),
      ),
    );
  }
}


class PageChangeSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Second Page',style: TextStyle(fontSize: 40.0),),
        elevation: 4.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(Icons.navigate_before,color: Colors.white,size: 60.0,),
          onPressed: (){
            //直接pop就能返回上一页
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
