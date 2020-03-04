import 'package:flutter/material.dart';
import '../model/product_category_model.dart';

class ChildCategoryProvide with ChangeNotifier{
  List<SubProductSet> subProductList = [];

  //绑定一个待改变状态数据
  getChildCategory(List list){
    subProductList = list;
    notifyListeners();
  }
}