import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cart_info_model.dart';
class CartProvide with ChangeNotifier{
  String cartString ='[]';
  List<CartInfoModel> cartList = [];

  //保存购物车信息
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
        cartList[tempIndex].count++;
        isHave = true;
      }
      tempIndex ++ ;
    });
    //如果不存在 则新增
    if(!isHave){
      Map<String, dynamic> newGoods = {
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'image': image,
        'isCheck': true
      };
      tempList.add(newGoods);
      //变为CartInfoModel对象
      cartList.add(CartInfoModel.fromJson(newGoods));
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
    cartList = [];
    print('清空了购物车');
    notifyListeners();
  }
  
  //查询方法
  getCartInfo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    cartList = [];
    if(cartString != null){
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      tempList.forEach((item){
        cartList.add(CartInfoModel.fromJson(item));
      });
    }
    notifyListeners();
  }

  //删除单个购物车商品
  deleteOneGoods(String goodsId) async{
    SharedPreferences prefs = await  SharedPreferences.getInstance();
    cartString = prefs.get('cartInfo');
    List<Map> tempList = (json.decode(cartString) as List ).cast();
    int tempIndex = 0;
    int deleteIndex = 0;
    //根据传入的goodsid去匹配
    tempList.forEach((item){
      if(item['goodsId'] == goodsId){
        deleteIndex = tempIndex;
      }
      tempIndex++;
    });
    //删除对应的购物车数据
    tempList.removeAt(deleteIndex);
    //重新初始化购物车数据
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    //刷新
    getCartInfo();
  }
}