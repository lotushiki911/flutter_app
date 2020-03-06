import 'package:flutter/material.dart';
import '../model/product_category_model.dart';

class ChildCategoryProvide with ChangeNotifier{
  List<SubProductSet> subProductList = [];
  int childIndex = 0; //子类高亮索引
  String categoryId = '1' ; // 传递大类的id需要保持

  //绑定一个待改变状态数据
  getChildCategory(List<SubProductSet> list,cId){
    //每次切换大类都要清0
    childIndex = 0;
    categoryId = cId;
    SubProductSet all = SubProductSet();
    all.productCategoryId = '00';
    all.subProductName = "全部";
    all.remark = "";
    all.subId = "";
    subProductList = [all];
    subProductList.addAll(list);
    notifyListeners();
  }

  //改编子类 高亮
  changeChildIndex(index ){
    childIndex = index;
    notifyListeners();
  }
}