import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  //定义存储数据
  List<String> testList = [];


  @override
  Widget build(BuildContext context) {
    _show();
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            child: ListView.builder(
                itemCount: testList.length,
                itemBuilder: (BuildContext context,index){
                  return ListTile(
                        title: Text(testList[index]),
                  );
                }
            ),
          ),
          RaisedButton(
            onPressed: (){_add();},
            child: Text('增加'),
          ),
          RaisedButton(
            onPressed: (){_clear();},
            child: Text('清空'),
          )
        ],
      )
    );
  }

  //处理数据方法 -增加
  void _add() async{
      //初始化
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //定义临时变量
      String temp = '呵呵哒';
      //添加数据
      testList.add(temp);
      //持久化
      prefs.setStringList('test1', testList);
    //查询显示 show
    _show();
  }

  //显示 添加的数据
  void _show() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.getStringList('test1') != null){
        setState(() {
          testList = prefs.getStringList('test1');
        });
      }
  }

  //删除
  void _clear() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // 1 清除全部的 持久化数据
  //    prefs.clear();
      // 2 移除某一个key值
      prefs.remove('test1');
      setState(() {
        testList = [];
      });
  }
}

