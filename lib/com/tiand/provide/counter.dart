import 'package:flutter/material.dart';

///状态管理分离 不用管理听众
//继承
class Counter with ChangeNotifier{
  //需要改变状态的数据
  int value = 0;
  //改变状态使用的方法
  increment(){
    value ++ ;
    //通知听众 进行变换 更新widget
    notifyListeners();
  }
}