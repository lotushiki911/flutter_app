import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/config/service_url.dart';
import 'package:flutter_app/com/tiand/model/goods_detail_model.dart';
import 'package:provider/provider.dart';
//import 'package:provide/provide.dart';
import '../../provide/goods_detail_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsWabArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsDetails = Provider.of<GoodDetailProvide>(context).goodDetails.detailData.detailInfo.goodsDetail;
    print('web详情:${goodsDetails}');
    return Consumer<GoodDetailProvide>(
      builder: (context,val,_){
        bool isLeft = val.isLeft;
        if(isLeft){
          return Container(
            child: Html(
              data: goodsDetails,
            ),
          );
        }else{
          return Container(
            width: ScreenUtil().setWidth(700),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text('好喝!'),
          );
        }
      },
    );

  }
}
