import 'package:flutter/material.dart';
import '../model/product_category_model.dart';

class ChildCategoryProvide with ChangeNotifier{
  List<SubProductSet> subProductList = [];
  int childIndex = 0; //子类高亮索引
  String categoryId = '1' ; // 传递大类的id需要保持
  String subId = ""; //子类传递的id
  int page = 1; //用于上拉加载的数据改变 列表页数
  String noMoreText = ''; //显示没有更多数据的文字

  //绑定一个待改变状态数据
  getChildCategory(List<SubProductSet> list,cId){
    //每次切换大类都要清0
    childIndex = 0;
    categoryId = cId;
    //每次切换大类需要初始化数据
    page = 1; //用于上拉加载的数据改变 列表页数
    noMoreText = ''; //显示没有更多数据的文字
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
  changeChildIndex(index ,sId){
    subId = sId;
    childIndex = index;
    //每次切换小类需要初始化数据
    page = 1; //用于上拉加载的数据改变 列表页数
    noMoreText = ''; //显示没有更多数据的文字
    notifyListeners();
  }
  //每次上拉都加1
  addPage(){
    page ++ ;
  }
  //改变没有更多数据的文字
  changeNoMore(String text){
    noMoreText = text;
    notifyListeners();
  }
}