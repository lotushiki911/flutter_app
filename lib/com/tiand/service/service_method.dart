//保存所有跟后台请求相关的方法
import 'package:dio/dio.dart';
import 'package:flutter_app/advance/main_bezier_base.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';
//import 'package:flutter_app/utils/HttpUtil.dart';

//获取首页主题内容
Future getHomePageContent(String queryPath,var paramData) async{
  try {
    print('开始获取首页数据');
    Dio dio = Dio();
    var formData = {'name':'hehehe1'};
    dio.options.queryParameters = paramData;
    //发送时候的请求类型  这里使用表单的模式向后端传送数据
    dio.options.contentType = "application/x-www-form-urlencoded";
    //直接获取 const地址
    Response response = await dio.post(
        servicePath[queryPath],
        data: formData
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口访问异常!');
    }
  }catch(e){
    return print('ERROR: =======>${e}');
  }
}

Future gerDoubanData() async {
  try {
    print('开始获取首页数据');
    Dio dio = Dio();
    dio.options.contentType = "application/x-www-form-urlencoded";
    Response response = await dio.post(
        'http://api.douban.com/v2/movie/top250', data: {'count': 15}
    );
    print('---->'+response.data);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('后端接口访问异常!');
    }
  }catch(e){
    return print('ERROR: =======>${e}');
  }
}

//获取首页轮播图片
Future getHomePageImg(String url,{formData}) async{
  try {
    print('开始获取首页数据');
    Dio dio = Dio();
    //发送时候的请求类型  这里使用表单的模式向后端传送数据
    dio.options.contentType = "application/x-www-form-urlencoded";
    Response response;
    //直接获取 const地址
    if (formData == null ){
      response = await dio.post(url);
    }else{
      response = await dio.post(
          url,
          data: formData
      );
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口访问异常!');
    }
  }catch(e){
    return print('ERROR: =======>${e}');
  }
}