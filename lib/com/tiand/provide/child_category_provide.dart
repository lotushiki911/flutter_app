import 'package:flutter/material.dart';
import '../model/product_category_model.dart';

class ChildCategoryProvide with ChangeNotifier{
  List<SubProductSet> _subProductList = [];
  int _childIndex = 0; //子类高亮索引
  String _categoryId = '1' ; // 传递大类的id需要保持
  String _subId = ""; //子类传递的id
  int _page = 1; //用于上拉加载的数据改变 列表页数
  String _noMoreText = ''; //显示没有更多数据的文字

  List<SubProductSet> get subProductList => _subProductList;
  int get childIndex => _childIndex;
  String get categoryId => _categoryId;
  String get subId => _subId;
  int get page => _page;
  String get noMoreText => _noMoreText;

  //绑定一个待改变状态数据
  getChildCategory(List<SubProductSet> list,cId){
    //每次切换大类都要清0
    _childIndex = 0;
    _categoryId = cId;
    //每次切换大类需要初始化数据
    _page = 1; //用于上拉加载的数据改变 列表页数
    _noMoreText = ''; //显示没有更多数据的文字
    SubProductSet all = SubProductSet();
    all.productCategoryId = '00';
    all.subProductName = "全部";
    all.remark = "";
    all.subId = "";
    _subProductList = [all];
    _subProductList.addAll(list);
    notifyListeners();
  }

  //改编子类 高亮
  changeChildIndex(index ,sId){
    _subId = sId;
    _childIndex = index;
    //每次切换小类需要初始化数据
    _page = 1; //用于上拉加载的数据改变 列表页数
    _noMoreText = ''; //显示没有更多数据的文字
    notifyListeners();
  }
  //每次上拉都加1
  addPage(){
    _page ++ ;
  }
  //改变没有更多数据的文字
  changeNoMore(String text){
    _noMoreText = text;
    notifyListeners();
  }
}