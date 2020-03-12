import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/provide/cart_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';


class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(765),
      padding: EdgeInsets.all(5.0),
      color: Colors.white,
      child: Provide<CartProvide>(
        builder: (context,child,childCarts){
          return Row(
            children: <Widget>[
              selectAllButton(context),
              countArea(context),
              goButton(context),
            ],
          );
        },
      ),
    );
  }

  //全选按钮
  Widget selectAllButton(context){
    bool isAllCheck = Provide.value<CartProvide>(context).isAllCheck;
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: isAllCheck,
            activeColor: Colors.pink,
            onChanged: (bool val){
//              isAllCheck = val;
              Provide.value<CartProvide>(context).changeAllCheckButtonState(val);
            },
          ),
          Text('全选'),
        ],
      ),
    );
  }

  //合计区域
  Widget countArea(context){
    double totalAmount = Provide.value<CartProvide>(context).totalAmount;
    return Container(
      width: ScreenUtil().setWidth(410),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(220),
                child: Text('合计: ',style: TextStyle(fontSize: ScreenUtil().setSp(36)),),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(180),
                child: Text(
                  '￥:${totalAmount.toString()} ',
                  style: TextStyle(fontSize: ScreenUtil().setSp(30),color: Colors.red),),
              ),
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(380),
            alignment: Alignment.centerRight,
            child: Text('满500免配送费: ',style: TextStyle(color:Colors.black38,fontSize: ScreenUtil().setSp(36)),),
          ),

        ],
      ),
    );
  }

  //结算模块
  Widget goButton(context){
    int totalProduct = Provide.value<CartProvide>(context).totalProduct;
    return Container(
      width: ScreenUtil().setWidth(180),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            //圆角弧度
            borderRadius: BorderRadius.circular(3.0)
          ),
          child: Text('结算(${totalProduct})',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
