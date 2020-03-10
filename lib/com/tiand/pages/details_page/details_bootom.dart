import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/model/goods_detail_model.dart';
import 'package:flutter_app/com/tiand/provide/cart_provide.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_detail_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DetailInfo detailInfo = Provide.value<GoodDetailProvide>(context).goodDetails.detailData.detailInfo;
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
          InkWell(
            onTap: (){},
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
          InkWell(
            onTap: () async{
              await Provide.value<CartProvide>(context).saveCart(goodsId, goodsName, count, price, image);
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
              await Provide.value<CartProvide>(context).remove();
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
