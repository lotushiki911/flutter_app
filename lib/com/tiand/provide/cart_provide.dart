import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvide with ChangeNotifier{
  String cartString ='[]';

  saveCart(goodsId,goodsName,count,price,image) async{
      //获取保存的参数
      SharedPreferences prefs = await SharedPreferences.getInstance();
      cartString = prefs.getString('cartInfo');
      //如果数据存在则进行格式化
      var temp =cartString==null?[]:json.decode(cartString.toString());
      List<Map> tempList = (temp as List).cast();
      int tempIndex = 0;
      bool isHave = false;
    //如果数据存在则 对数据数量增加
    tempList.forEach((item){
      if(item['goodsId'] == goodsId){
        tempList[tempIndex]['count'] = item['count']+1;
        isHave = true;
      }
      tempIndex ++ ;
    });
    //如果不存在 则新增
    if(!isHave){
      tempList.add({
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'image': image
      });
    }

    //反持久化解析并保存
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    print('添加购物车成功:${tempList.toString()}');
    notifyListeners();
  }

  //清空购物车
  remove() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartInfo');
    print('清空了购物车');
    notifyListeners();
  }
}