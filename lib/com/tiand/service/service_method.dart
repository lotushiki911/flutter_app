//保存所有跟后台请求相关的方法
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

//获取首页主题内容
Future getHomePageContent(String queryPath,var formData) async{
  try {
    print('开始获取首页数据');
    Dio dio = Dio();
    //发送时候的请求类型  这里使用表单的模式向后端传送数据
//    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded").toString();
    //formdata 需要传入经纬度 ?
//    var formData = {'name':'hehehe1'};
    dio.options.queryParameters = formData;

    //直接获取 const地址
    Response response = await dio.post(
        servicePath[queryPath],
//        data: formData
    );
    //判断返回
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口访问异常!');
    }
  }catch(e){
    return print('ERROR: =======>${e}');
  }
}