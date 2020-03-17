import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/model/goods_detail_model.dart';
import 'package:flutter_app/com/tiand/provide/cart_provide.dart';
import 'package:flutter_app/com/tiand/provide/current_index_provide.dart';
import 'package:provider/provider.dart';
//import 'package:provide/provide.dart';
import '../../provide/goods_detail_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final goodsProvide = Provider.of<GoodDetailProvide>(context);
    DetailInfo detailInfo = goodsProvide.goodDetails.detailData.detailInfo;
    print("detailInfo:${detailInfo}");
    //组合 cartProvide中数据
    var goodsId = detailInfo.goodsId;
    var goodsName = detailInfo.goodsName;
    var count = 1;
    var price = detailInfo.presentPrice;
    var image = detailInfo.image1;
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(80),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              InkWell(
                onTap: (){
                  //改变底栏index值,然后直接pop弹出到购物车页面
                  Provider.of<CurrentIndexProvide>(context,listen: false).changeIndex(2);
                  Navigator.pop(context);
                },
                child: Container(
                  width: ScreenUtil().setWidth(110),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.shopping_cart,
                    size: 35,
                    color: Colors.red,
                  ),
                ),
              ),
              //添加一个气泡用来显示 一共多少数量
              Consumer<CartProvide>(
                builder: (context,val,_){
                  int goodsCount = val.totalProduct;
                  return Positioned(
                    top: 0,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                      //定义一个圆
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        border: Border.all(width: 2,color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                          '${goodsCount}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(22),
                          ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          InkWell(
            onTap: () async{
              await Provider.of<CartProvide>(context,listen: false).saveCart(goodsId, goodsName, count, price, image);
            },
            child: Container(
              color: Colors.green,
              width: ScreenUtil().setWidth(320),
              alignment: Alignment.center,
              child: Text(
                '加入购物车',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(30),
                ),
              )
            ),
          ),
          InkWell(
            onTap: () async{
              await Provider.of<CartProvide>(context,listen: false).remove();
            },
            child: Container(
                color: Colors.red,
                width: ScreenUtil().setWidth(320),
                alignment: Alignment.center,
                child: Text(
                  '立即购买',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(30),
                  ),
                )
            ),
          ),
        ],
      ),

    );
  }
}
