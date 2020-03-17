import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/com/tiand/model/category_goods_model.dart';
import 'package:flutter_app/com/tiand/model/product_category_model.dart';
import 'package:flutter_app/com/tiand/service/service_method.dart';

class CategoryProvide extends ChangeNotifier{
  //大类别集合
  List<ProductData> _leftList = [];
  List<ProductData> get leftList => _leftList;
  //小类别集合
  List<SubProductSet> _rightList = [];
  List<SubProductSet> get rightList => _rightList;
  //商品列表集合
  List<GoodsData> _goodsDataList = [];
  List<GoodsData> get goodsDataList => _goodsDataList;
  //每次上拉获取一个新的集合
  CategoryGoodsModel _newCategoryGoods ;
  CategoryGoodsModel get newCategoryGoods => _newCategoryGoods;

  //产品列表
  int _leftIndex = 0; //主类别高亮索引
  int _rightIndex = 0; //子类高亮索引
  String _leftId = '1' ; // 传递大类的id需要保持
  String _rightId = ""; //子类传递的id
  int _page = 1; //用于上拉加载的数据改变 列表页数
  String _noMoreText = ''; //显示没有更多数据的文字

  int get leftIndex => _leftIndex;
  int get rightIndex => _rightIndex;
  String get leftId => _leftId;
  String get rightId => _rightId;
  int get page => _page;
  String get noMoreText => _noMoreText;

  //初始化时第一次 获取大类别 小类别 数据
  getCategoryFirstTime() async{
    print('----------->获取分类页信息');
    await requestForm('categoryPageInfo').then((val){
      var data = json.decode(val.toString());
      _leftList = ProductCategory.fromJson(data).productData;
      //获取小类别的数据
      getChildCategory(_leftList[0].subProductSet,_leftList[0].productCategoryId);
    });
  }


  //获取大类别数据
  getCategory() async{
    print('----------->获取分类页信息');
    await requestForm('categoryPageInfo').then((val){
      var data = json.decode(val.toString());
      _leftList = ProductCategory.fromJson(data).productData;
      //将后台获取的大类数据  在页面动态显示
      notifyListeners();
    });
  }

  //获取小类别的数据
  getChildCategory(List<SubProductSet> list,lId){
    print('----------->获取子类别信息');
    //每次切换大类都要清0
    _rightIndex = 0;
    _leftId = lId;
    //每次切换大类需要初始化数据
    _page = 1; //用于上拉加载的数据改变 列表页数
//    _noMoreText = ''; //显示没有更多数据的文字
    SubProductSet all = SubProductSet();
    all.productCategoryId = '00';
    all.subProductName = "全部";
    all.remark = "";
    all.subId = "";
    _rightList = [all];
    _rightList.addAll(list);
    notifyListeners();
  }

  //获取商品数据
  getGoodsList(data) async{
    print('----------->获取商品列表信息');
    await requestForm('categoryPageGoods',formData: data).then((val){
      var data = json.decode(val.toString());
      CategoryGoodsModel categoryGoodsModel = CategoryGoodsModel.fromJson(data);
      if(categoryGoodsModel.goodsData == null){
        print('没有查询到列表数据');
        getCategoryGoods([]);
      }else{
        getCategoryGoods(categoryGoodsModel.goodsData);
      }
    });
  }

  //点击大类时更换商品列表
  getCategoryGoods(List<GoodsData> list){
    _goodsDataList = list;
    notifyListeners();
  }

  //上拉改变更多商品信息
  getCategoryGoodsMore(List<GoodsData> list){
    _goodsDataList.addAll(list);
    notifyListeners();
  }

//上拉获取一个新的商品数据
  void getMoreList(data) async {
    print("--------获取商品明细----->");
    //传参
    await requestForm('categoryPageGoods',formData: data).then((val){
      var data = json.decode(val.toString());
      _newCategoryGoods = CategoryGoodsModel.fromJson(data);
      notifyListeners();
    });
  }



  //改变主类高亮
  changeLeftIndex(index,lId){
    _leftId = lId;
    _leftIndex = index;
    _rightIndex = 0;
    //每次切换小类需要初始化数据
    _page = 1; //用于上拉加载的数据改变 列表页数
    _noMoreText = ''; //显示没有更多数据的文字
    notifyListeners();

  }
  //改变子类 高亮
  changeRightIndex(index ,rId){
    _rightId = rId;
    _rightIndex = index;
    //每次切换小类需要初始化数据
    _page = 1; //用于上拉加载的数据改变 列表页数
    _noMoreText = ''; //显示没有更多数据的文字
    notifyListeners();
  }

  //每次上拉都加1
  addPage(){
    _page ++ ;
  }

}