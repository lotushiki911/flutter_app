import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/config/service_url.dart';
import 'package:flutter_app/com/tiand/model/cart_info_model.dart';
import 'package:flutter_app/com/tiand/provide/cart_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import 'cart_count.dart';

class CartItem extends StatelessWidget {
  final CartInfoModel cartItem;
  CartItem(this.cartItem);

  @override
  Widget build(BuildContext context) {
//    print(cartItem);
    return Container(
      margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.black12,
          )
        )
      ),
      child: Row(
        children: <Widget>[
          _cartCheckButton(context,cartItem),
          _cartImage(cartItem),
          _cartGoodsName(cartItem),
          _cartPrice(context,cartItem),
        ],
      ),
    );
  }

  //复选框
  Widget _cartCheckButton(context,item){
    return Container(
      child: Checkbox(
        //需要改成动态的加载方式 状态控制
        value: item.isCheck,
        activeColor: Colors.pink,
        onChanged: (bool val){
        },
      ),
    );
  }
  //图片展示
  Widget _cartImage(item){
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black12
        )
      ),
      child: Image.network(serviceUrlStatic + item.image),
    );
  }
  //名称
  Widget _cartGoodsName(item){
    return Container(
      width: ScreenUtil().setWidth(330),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Text(item.goodsName),
          CartCount(),
        ],
      )
    );
  }

  //商品价格
  Widget _cartPrice(context,item){
    return Container(
      width: ScreenUtil().setWidth(150),
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            child: Text('￥${item.price}'),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: (){
                Provide.value<CartProvide>(context).deleteOneGoods(item.goodsId);
              },
              child: Icon(
                Icons.delete_forever,
                color: Colors.black26,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
