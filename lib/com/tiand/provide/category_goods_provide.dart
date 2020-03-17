import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/config/service_url.dart';
import 'package:flutter_app/com/tiand/service/service_method.dart';
import '../model/category_goods_model.dart';

class CategoryGoodsProvide with ChangeNotifier{
  List<GoodsData> _goodsDataList = [];
  List<GoodsData> get goodsDataList => _goodsDataList;

  CategoryGoodsModel _newCategoryGoods ;
  CategoryGoodsModel get newCategoryGoods => _newCategoryGoods;


  //点击大类时更换商品列表
  getCategoryGoods(List<GoodsData> list){
    _goodsDataList = list;
    notifyListeners();
  }

  //点击大类时更换商品列表
  getCategoryGoodsMore(List<GoodsData> list){
    _goodsDataList.addAll(list);
    notifyListeners();
  }

//上拉获取商品列表
  void getMoreList(data) async {
    print("--------获取商品明细----->");
    //传参
    await requestForm('categoryPageGoods',formData: data).then((val){
      var data = json.decode(val.toString());
      _newCategoryGoods = CategoryGoodsModel.fromJson(data);
      notifyListeners();
    });
  }

}