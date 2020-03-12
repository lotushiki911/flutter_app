import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/provide/cart_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

//数量控制UI
class CartCount extends StatelessWidget {
  var cartItem;
  CartCount(this.cartItem);
  @override
  Widget build(BuildContext context) {
    return Container(
          width: ScreenUtil().setWidth(150),
          margin: EdgeInsets.only(top: 5.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1,color: Colors.black38)
          ),
          child: Row(
            children: <Widget>[
              _leftBottom(context),
              _centerBottom(),
              _rightBottom(context),
            ],
          ),
        );
  }
  
  Widget _centerBottom(){
    return Container(
      width: ScreenUtil().setWidth(60),
//      height: ScreenUtil().setHeight(35),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('${cartItem.count}'),
    );
  }

  //减方法
  Widget _leftBottom(context){
    return InkWell(
      onTap: (){
        Provide.value<CartProvide>(context).changeProductNum(1, cartItem);
      },
      child: Container(
        width: ScreenUtil().setWidth(40),
//        height: ScreenUtil().setHeight(35),
//        color: Colors.white,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: cartItem.count>1? Colors.white : Colors.black12,
          border: Border(
            right: BorderSide(
              width: 1,
              color: Colors.black12
            )
          )
        ),
        child: cartItem.count>1?Text('-'):Text(' '),
      ),
    );
  }

  //加方法
  Widget _rightBottom(context){
    return InkWell(
      onTap: (){
        Provide.value<CartProvide>(context).changeProductNum(2, cartItem);
      },
      child: Container(
        width: ScreenUtil().setWidth(40),
//        height: ScreenUtil().setHeight(35),
//        color: Colors.white,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                left: BorderSide(
                    width: 1,
                    color: Colors.black12
                )
            )
        ),
        child: Text('+'),
      ),
    );
  }
}
