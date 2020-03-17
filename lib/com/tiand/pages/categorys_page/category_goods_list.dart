import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/model/category_goods_model.dart';
import 'package:flutter_app/com/tiand/provide/category_provide.dart';
import 'package:flutter_app/com/tiand/routers/routers_application.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CategoryGoodsList extends StatelessWidget {

  final GlobalKey<RefreshFooterState> _footerkey = new GlobalKey<RefreshFooterState>();

  final ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvide>(
        builder: (context, val, _) {
      //增加控制器控制 如果切换了小类或者大类 调转到列表的最上面
      try {
        scrollController.jumpTo(0.0);
      } catch (e) {
        print('第一次跳转过来');
      }

      if (val.goodsDataList.length > 0) {
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
                  noMoreText: '',
                  //Provide.value<ChildCategoryProvide>(context).noMoreText,
                  moreInfo: '加载中',
                  //准备文字
                  loadReadyText: '上拉加载...',
                ),
                loadMore: () async {
                  _loadMore(context);

                },
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: val.goodsDataList.length,
                    itemBuilder: (context, index) {
                      return _goodsWidget(val.goodsDataList[index],context);
                    }),
              )),
        );
      } else {
        return Text('暂时没有数据');
      }
    });
  }

  void _loadMore(context){
    print('上拉加载更多');
    final cCategory = Provider.of<CategoryProvide>(context);

    String categoryId = cCategory.leftId;
    String subId = cCategory.rightId;
    int page = cCategory.page;
    if(page == 1){
      cCategory.addPage();
      page ++ ;
    }
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
    Provider.of<CategoryProvide>(context).getMoreList(data);
    var goodsList = Provider.of<CategoryProvide>(context,listen: false).newCategoryGoods;
    if(goodsList.goodsData.length == 0){
      print('没有查询到列表数据');
      Fluttertoast.showToast(
        //待提示的内容 字符串
          msg: '已经到底了',
          //亲提示的大小长短
          toastLength: Toast.LENGTH_SHORT,
          // 提示的位置 底部提示 顶部提示 中部提示
          gravity: ToastGravity.BOTTOM,
          //提示背景颜色
          backgroundColor: Colors.pinkAccent,
          //文字颜色
          textColor: Colors.white,
          //字体大小
          fontSize: 16
      );
//      cCategory.changeNoMore('没有更多数据了');
    }else{
      //每次上拉之后,更新当前的list 需要把新查询出来的list追加到之前的list中
      Provider.of<CategoryProvide>(context,listen: false).getCategoryGoodsMore(goodsList.goodsData);
      //每次上拉都需要把page 加一 以便加载新的数据
      Provider.of<CategoryProvide>(context).addPage();
    }
  }

  /// 列表详情页的拆分和组合
  /// 将本来的ListView 拆分成独立的 图片组件 标题组件和价格组件
  /// 然后再组合起来
  /// 使用provide绑定的方式来获得数据
  ///
  ///
  /// 组合商品组件
  Widget _goodsWidget(GoodsData goodsData,context){
    return InkWell(
        onTap: (){
          RoutersApplication.router.navigateTo(context, '/detail?id=lunbo1');
        },
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
