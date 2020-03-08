import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/goods_detail_provide.dart';

class DetailsPage extends StatelessWidget {
  String goodsId;

  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    _getDetailinfo(context);
    //获取数据 从provide中
    return Container(
      child: Center(
        child: Text('商品id为:${goodsId}'),
      ),
    );
  }

  void _getDetailinfo(BuildContext context) async{
    goodsId = 'ed675dda49e0445fa769f3d8020ab5e9';
    await Provide.value<GoodDetailProvide>(context).getGoodsDetail(goodsId);
    print('加载商品详情provide完毕');
  }

}
