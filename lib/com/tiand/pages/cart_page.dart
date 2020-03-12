import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/model/cart_info_model.dart';
import 'package:flutter_app/com/tiand/provide/cart_provide.dart';
import 'package:provide/provide.dart';
import 'carts_page/cart_bottom.dart';
import 'carts_page/cart_item.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('购物车'),),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<CartInfoModel> cartList = Provide.value<CartProvide>(context).cartList;
            return Stack(
              children: <Widget>[
                ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    return CartItem(cartList[index]);
                  },
                ),
                Positioned(
                  bottom: 0,
                    left: 0,
                  child: CartBottom(),
                )

              ],
            );

          }else{
            return Text('正在加载中');
          }
        },
      ),
    );
  }

  //provide必须要上下文才能使用
  Future<String> _getCartInfo(BuildContext context) async{
    await Provide.value<CartProvide>(context).getCartInfo();
    return 'end';
  }
}
