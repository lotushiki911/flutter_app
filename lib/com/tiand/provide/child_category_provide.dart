import 'package:flutter/material.dart';
import '../model/product_category_model.dart';

class ChildCategoryProvide with ChangeNotifier{
  List<SubProductSet> subProductList = [];

  //绑定一个待改变状态数据
  getChildCategory(List<SubProductSet> list){
    SubProductSet all = SubProductSet();
    all.productCategoryId = '00';
    all.subProductName = "全部";
    all.remark = "";
    all.subId = "";
    subProductList = [all];
    subProductList.addAll(list);
    notifyListeners();
  }
}