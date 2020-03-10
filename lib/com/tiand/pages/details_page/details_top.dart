import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/config/service_url.dart';
import 'package:flutter_app/com/tiand/model/goods_detail_model.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_detail_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<GoodDetailProvide>(
      builder: (context,child,val){
        DetailInfo detailInfo = Provide.value<GoodDetailProvide>(context).goodDetails.detailData.detailInfo;
        if(detailInfo != null) {
          return Container(
//            height: ScreenUtil().setHeight(900),
            child: Column(
              children: <Widget>[
                _goodsImage(detailInfo.image1),
                _goodsName(detailInfo.goodsName),
                _goodsNum(detailInfo.goodsSerialNumber),
              ],
            ),
          );
        }else{
          return Text('暂时没有详情数据');
        }
      },
    );


  }

  //头部-图片
  Widget _goodsImage(url){
    return Image.network(
      serviceUrlStatic + url,
      width: ScreenUtil().setWidth(700),);
  }
  //头部 - 名称
  Widget _goodsName(name){
    return Container(
//      height: ScreenUtil().setHeight(40),
      width: ScreenUtil().setWidth(700),
      margin: EdgeInsets.only(left: 10),
      child: Text(
        name,
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(30)
        ),
      ),
    );
  }

  //头部 - 编码
  Widget _goodsNum(num){
    return Container(
      width: ScreenUtil().setWidth(650),
      margin: EdgeInsets.only(left: 10,top: 4),
      child: Text(
        '商品编号${num}',
        style: TextStyle(
          color: Colors.black38,
          fontSize: ScreenUtil().setHeight(20)
        ),
      ),
    );
  }
}
