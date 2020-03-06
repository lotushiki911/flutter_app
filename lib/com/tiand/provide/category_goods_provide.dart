import 'package:flutter/material.dart';
import '../model/category_goods_model.dart';

class CategoryGoodsProvide with ChangeNotifier{
  List<GoodsData> goodsDataList = [];

  //点击大类时更换商品列表
  getCategoryGoods(List<GoodsData> list){
    goodsDataList = list;
    notifyListeners();
  }

  //点击大类时更换商品列表
  getCategoryGoodsMore(List<GoodsData> list){
    goodsDataList.addAll(list);
    notifyListeners();
  }
}