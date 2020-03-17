import 'package:flutter/material.dart';
import '../model/goods_detail_model.dart';
import '../service/service_method.dart';
import 'dart:convert';

//将业务逻辑放入到provide中 与UI界面分离

class GoodDetailProvide with ChangeNotifier{
  DetailsModel _goodDetails ;
  DetailsModel get goodDetails => _goodDetails;

  bool _isLeft = true;
  bool _isRight = false;

  bool get isLeft => _isLeft;
  bool get isRight => _isRight;

  //tabbar 切换方法
  changeLeftOrRight(String changeState){
    if(changeState == 'left'){
      _isLeft = true;
      _isRight = false;
    }else{
      _isLeft = false;
      _isRight = true;
    }
    notifyListeners();
  }

  //从后台获取商品数据
  getGoodsDetail(String detailId) async{
    var formData = {'goods_id': detailId};
    await requestForm('getGoodsDetailInfo',formData: formData).then((val){
      var responseData = json.decode(val.toString());
//      print(responseData);
      _goodDetails = DetailsModel.fromJson(responseData);
      print('商品名称是${_goodDetails.detailData.detailInfo.goodsName}');
      //数据获取完了通知
      notifyListeners();
    });
  }
}

