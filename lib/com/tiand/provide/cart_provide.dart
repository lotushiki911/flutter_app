import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cart_info_model.dart';
class CartProvide with ChangeNotifier{
  String cartString ='[]';
  List<CartInfoModel> cartList = [];
  //商品总价格
  double totalAmount = 0;
  //商品总数量
  int totalProduct = 0;
  //全选框判断
  bool isAllCheck = true;

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
      totalAmount = 0;
      totalProduct = 0;
    //如果数据存在则 对数据数量增加
    tempList.forEach((item){
      if(item['goodsId'] == goodsId){
        tempList[tempIndex]['count'] = item['count']+1;
        tempList[tempIndex]['isCheck'] = true;
        cartList[tempIndex].isCheck = true;
        cartList[tempIndex].count++;
        isHave = true;
      }
      if(item['isCheck']) {
        totalAmount += cartList[tempIndex].price * cartList[tempIndex].count;
        totalProduct += cartList[tempIndex].count;
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

      totalAmount += count * price;
      totalProduct += count;
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
      //首先初始化下 每次都从新算
      totalAmount = 0;
      totalProduct = 0;
      isAllCheck = true;
      tempList.forEach((item){
        //增加判断 如果选中则计算入中金额
        if(item['isCheck']) {
          totalAmount += item['price'] * item['count'];
          totalProduct += item['count'];
        }else{
          isAllCheck = false;
        }
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
    await getCartInfo();
  }

  //购物车页面点击复选框时改变购物车信息和状态
  changeCheckState(CartInfoModel cartInfoModel) async{
    SharedPreferences prefs = await  SharedPreferences.getInstance();
    cartString = prefs.get('cartInfo');
    List<Map> tempList = (json.decode(cartString) as List ).cast();
    //临时的索引
    int tempIndex = 0;
    //待更换的索引
    int changeIndex = 0;
    //如果匹配到了  获取到改变数据
    tempList.forEach((item){
      if(item['goodsId'] == cartInfoModel.goodsId){
        changeIndex = tempIndex;
      }
      tempIndex ++;
    });
    //改变选定的数据
    tempList[changeIndex] = cartInfoModel.toJson();
    //重新初始化购物车数据
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    //刷新
    await getCartInfo();

  }

  //点击全选按钮操作
  changeAllCheckButtonState(bool isCheck)async{
    //1 获取所有的数据
    SharedPreferences prefs = await  SharedPreferences.getInstance();
    cartString = prefs.get('cartInfo');
    List<Map> tempList = (json.decode(cartString) as List ).cast();
    //2将所有的数据的ischeck全部置为前台选择的值
    List<Map> newList = [];
    for(var item in tempList){
      var newItem = item;
      newItem['isCheck'] = isCheck;
      newList.add(newItem);
    }
    //组合新列表到页面展示
    cartString = json.encode(newList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }

  //点击加减进行数据更新操作
  changeProductNum(int type,var cartItem)async{
    SharedPreferences prefs = await  SharedPreferences.getInstance();
    cartString = prefs.get('cartInfo');
    List<Map> tempList = (json.decode(cartString) as List ).cast();
    int currentIndex = 0;
    int tempIndex = 0;
    tempList.forEach((item){
      if(item['goodsId'] == cartItem.goodsId ){
        currentIndex = tempIndex;
      }
      tempIndex ++;
    });
    //减方法
    if(type == 1){
      if(cartItem.count > 1){
        //删除对应的购物车数据
        cartItem.count --;
      }
    }else{
      //否则增加
      cartItem.count ++;
    }
    //改变选定的数据
    tempList[currentIndex] = cartItem.toJson();
    //重新初始化购物车数据
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    //刷新
    await getCartInfo();
  }
}