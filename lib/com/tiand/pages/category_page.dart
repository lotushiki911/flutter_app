import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/config/service_url.dart';
import 'package:flutter_app/com/tiand/provide/category_goods_provide.dart';
import 'package:flutter_app/com/tiand/service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../model/product_category_model.dart';
import '../provide/child_category_provide.dart';
import '../model/category_goods_model.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  void initState() {
    // TODO: implement initState
//    _getCateGory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text('分类'),),
          body: Container(
              //分为左右两块 所有用row
              child: Row(
                children: <Widget>[
                  LeftCategoryNav(),
                  //右侧分为上下结构 上面是一排导航 下面是内容呈现
                  Column(
                    children: <Widget>[
                      RightCategoryNav(),
                      CategoryGoodsList(),
                    ],
                  ),
                ],
              ),

          )
      ),
    );
  }
}

//左侧大类导航
class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  //保存获取的大类列表
  List<ProductData> leftList = [];
  //点击高亮显示
  int indexClick = 0;
  @override
  void initState() {
    _getCateGory();
    _get_goods_list();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(160),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1,color: Colors.black12)
        )
      ),
      //动态列表 使用构造器
      child: ListView.builder(
        //个数
        itemCount: leftList.length,
        itemBuilder: (context,index){
          return _leftInkWell(index);
        },
      ),

    );
  }

  //页面布置 - 左边类别导航
  Widget _leftInkWell(int index){
    bool isClick = false;
    isClick = indexClick == index ? true : false;

    return InkWell(
      onTap: (){
        setState(() {
            indexClick = index;
        });
        //绑定provide进行左右侧导航栏联动改变
        List<SubProductSet> childList = leftList[index].subProductSet;
        String categoryId = leftList[index].productCategoryId;
        Provide.value<ChildCategoryProvide>(context).getChildCategory(childList,categoryId);
        print('大类是${categoryId}');
        _get_goods_list(categoryId:categoryId);
//        Provide.value<CategoryGoodsProvide>(context).getCategoryGoods(goodsList);
      },
      child: Container(
        //设置高度
        height: ScreenUtil().setHeight(80),
        //设置边距
        padding: EdgeInsets.only(left: 10,top: 10),
        //大类的名称
        child: Text(
          leftList[index].productCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
        //装饰器
        decoration: BoxDecoration(
          //点击高亮
          color: isClick?Colors.yellow : Colors.white,
          //包边
          border: Border(
            bottom: BorderSide(
                width: 1,
                color: Colors.black12
            )
          )
        ),

      ),
    );
  }

  //获取类别数据
  void _getCateGory() async{
    print('获取分类页信息');
    await getHomePageImg(servicePath['categoryPageInfo']).then((val){
      var data = json.decode(val.toString());
//      print(data);
      ProductCategory productCategory = ProductCategory.fromJson(data);
      //将后台获取的大类数据  在页面动态显示
      setState(() {
        leftList = productCategory.productData;
      });
      //传递第一个值 让右侧的导航栏有显示
      Provide.value<ChildCategoryProvide>(context)
          .getChildCategory(leftList[0].subProductSet,leftList[0].productCategoryId);
    });
  }

  //接口获取商品列表
  void _get_goods_list({String categoryId}) async{
    //传参
    var data={
      //大类项
      'categoryId': categoryId == null ? '1':categoryId,
      //小项id
      'categorySubId': '',
      //分页数
      'page': 1,
    };
    await getHomePageImg(servicePath['categoryPageGoods'],formData: data).then((val){
      var data = json.decode(val.toString());
//      print("------------->{$data}");
      CategoryGoodsModel categoryGoodsModel = CategoryGoodsModel.fromJson(data);
      print("--------获取商品列表----->");
      if(categoryGoodsModel.goodsData.length > 0) {
        print(categoryGoodsModel.goodsData[0].goodsName);
        print(categoryGoodsModel.goodsData[0].presentPrice.toString());
        print(categoryGoodsModel.goodsData[0].image);
      }
      Provide.value<CategoryGoodsProvide>(context).getCategoryGoods(categoryGoodsModel.goodsData);
    });
  }
}


//右侧分类导航 --顶部
class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
//  List list = ['全部','美食','宝宝','旅游','玩具','气球','火车','飞机','外星人'];
  @override
  Widget build(BuildContext context) {
    //引入状态改变数据
    return Provide<ChildCategoryProvide>(
      builder: (context,child,childCategory){
        return Container(
          //右侧的模块
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(608),
          //加个底框
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      width: 1,color: Colors.black12
                  )
              )
          ),
          //改为横向布局
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: childCategory.subProductList.length,
              itemBuilder: (context,index){
                return _rightInkWell(
                    childCategory.subProductList[index],
                    index,
                    );
              }
          ),
        );
      },
    );
  }
  //右侧的小组件 构建
  Widget _rightInkWell(SubProductSet item, int index,){
    bool isClick = false;
    //index 原值  对比点击值
    int clickIndex = Provide.value<ChildCategoryProvide>(context).childIndex;
    isClick = index == clickIndex?true : false;
    return InkWell(
      onTap: (){
          //点击改变右侧高亮
        Provide.value<ChildCategoryProvide>(context).changeChildIndex(index,item.subId);

        _get_goods_list(subId :item.subId);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
            item.subProductName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(24),
            color: isClick?Colors.pinkAccent:Colors.black,
          ),

        ),
      ),
    );
  }
//接口获取商品列表
  void _get_goods_list({String subId}) {

    String categoryId = Provide.value<ChildCategoryProvide>(context).categoryId;
    print('大类是${categoryId},小类是${subId}');
    //传参
    var data={
      //大类项
      'categoryId': categoryId == null ? '1':categoryId,
      //小项id
      'categorySubId': subId == null ? '':subId,
      //分页数
      'page': 1,
    };
    getHomePageImg(servicePath['categoryPageGoods'],formData: data).then((val){
      var data = json.decode(val.toString());
//      print("------------->{$data}");
      CategoryGoodsModel categoryGoodsModel = CategoryGoodsModel.fromJson(data);
      print("--------获取商品列表----->");
      if(categoryGoodsModel.goodsData == null){
        print('没有查询到列表数据');
        Provide.value<CategoryGoodsProvide>(context).getCategoryGoods([]);
      }else{
        Provide.value<CategoryGoodsProvide>(context).getCategoryGoods(categoryGoodsModel.goodsData);
        if(categoryGoodsModel.goodsData.length > 0) {
          print(categoryGoodsModel.goodsData[0].goodsName);
          print(categoryGoodsModel.goodsData[0].presentPrice.toString());
          print(categoryGoodsModel.goodsData[0].image);
        }
      }


    });
  }
}

//商品明细列表 可上拉下拉
class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {

  GlobalKey<RefreshFooterState> _footerkey = new GlobalKey<RefreshFooterState>();
//  List<GoodsData> goodsList = [];
  @override
  void initState() {
    // TODO: implement initState
//    _get_goods_list();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsProvide>(
        builder: (context, child, categoryProvide) {
          if(categoryProvide.goodsDataList.length > 0){
            //自动伸缩小部件
            return Expanded(
              child: Container(
                width: ScreenUtil().setWidth(608),
//            height: ScreenUtil().setHeight(800),
                child: EasyRefresh(
                  //自定义刷新footer
                  refreshFooter: ClassicsFooter(
                    key: _footerkey,
                    bgColor: Colors.white,
                    textColor: Colors.pink,
                    //加载时候的颜色
                    moreInfoColor: Colors.pink,
                    //是否加载更多
                    showMore: true,
                    noMoreText: Provide.value<ChildCategoryProvide>(context).noMoreText,
                    moreInfo: '加载中',
                    loadedText: '呵呵呵',
                    loadingText: '加载完成',
                    //准备文字
                    loadReadyText: '准备加载...',
                    loadText: '加载...',
                  ),
                  loadMore: ()async{
                    print('上拉加载更多');
                    _getMoreList();
                  },
                  child: ListView.builder(
                      itemCount: categoryProvide.goodsDataList.length,
                      itemBuilder: (context, index) {
                        return _goodsWidget(categoryProvide.goodsDataList[index]);
                      }
                  ),
                )
              ),
            );
          }else{
            return Text('暂时没有数据');
          }

        });
  }

//接口获取商品列表
  void _getMoreList() {
    //每次上拉都需要把page 加一 以便加载新的数据
    Provide.value<ChildCategoryProvide>(context).addPage();
    String categoryId = Provide.value<ChildCategoryProvide>(context).categoryId;
    String subId = Provide.value<ChildCategoryProvide>(context).subId;
    int page = Provide.value<ChildCategoryProvide>(context).page;

    print('大类是${categoryId},小类是${subId},当前分页数:${page}');
    //传参
    var data={
      //大类项
      'categoryId': categoryId == null ? '1':categoryId,
      //小项id
      'categorySubId': subId == null ? '':subId,
      //分页数
      'page': page,
    };
    getHomePageImg(servicePath['categoryPageGoods'],formData: data).then((val){
      var data = json.decode(val.toString());
//      print("------------->{$data}");
      CategoryGoodsModel categoryGoodsModel = CategoryGoodsModel.fromJson(data);
      print("--------获取商品列表----->");
      if(categoryGoodsModel.goodsData.length == 0){
        print('没有查询到列表数据');
//        Provide.value<CategoryGoodsProvide>(context).getCategoryGoods([]);
        Provide.value<ChildCategoryProvide>(context).changeNoMore('没有更多数据了');
      }else{
        //每次上拉之后,更新当前的list 需要把新查询出来的list追加到之前的list中
        Provide.value<CategoryGoodsProvide>(context).getCategoryGoodsMore(categoryGoodsModel.goodsData);
        if(categoryGoodsModel.goodsData.length > 0) {
          print(categoryGoodsModel.goodsData[0].goodsName);
          print(categoryGoodsModel.goodsData[0].presentPrice.toString());
          print(categoryGoodsModel.goodsData[0].image);
        }
      }


    });
  }

  /// 列表详情页的拆分和组合
  /// 将本来的ListView 拆分成独立的 图片组件 标题组件和价格组件
  /// 然后再组合起来
  /// 使用provide绑定的方式来获得数据R
  ///
  ///
  /// 组合商品组件
  Widget _goodsWidget(GoodsData goodsData){
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.only(top: 5,bottom: 5),
        //设置背景色 加个底框
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    width: 1,color: Colors.black12
                )
            )
        ),
        child: Row(
          children: <Widget>[
            _goodsImage(goodsData),
            Column(
              children: <Widget>[
                _goodsName(goodsData),
                _goodsPrice(goodsData),
              ],
            )
          ],
        ),
      )
    );
  }

  /// 商品图片
  Widget _goodsImage(GoodsData goodsData){
    return Container(
      width: ScreenUtil().setWidth(100),
      child: Image.network(
        goodsData.image,
      ),
    );
  }

  ///商品名称
  Widget _goodsName(GoodsData goodsData){
    return Container(
      padding: EdgeInsets.all(5),
      width: ScreenUtil().setWidth(380),
      child: Text(
        goodsData.goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28),color: Colors.black),
      ),
    );
  }

  ///商品价格
  Widget _goodsPrice(GoodsData goodsData){
    return Container(
        width: ScreenUtil().setWidth(380),
        margin: EdgeInsets.only(top: 20),
        child: Row(
          children: <Widget>[
            Text(
                '价格:￥${goodsData.presentPrice}    ',
              style: TextStyle(fontSize: ScreenUtil().setSp(30),color: Colors.pinkAccent),
            ),
            Text(
                '￥${goodsData.oriPrice}',
              style: TextStyle(fontSize: ScreenUtil().setSp(24),
                               color: Colors.black12,
                                decoration: TextDecoration.lineThrough
              ),
            )

          ],
        )
    );
  }
}
