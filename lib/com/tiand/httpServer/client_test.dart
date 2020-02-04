import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

/**
 * Author: Jonny Zheng 270406@qq.com
 *
 * 测试客户端，发送一个JSON串到服务器，为模拟真实环境，采用分步发送的方式进行
 * 每隔1秒就发送一小段代码
 */
void connectserver() {
  getHttp('111');
}

//使用异步请求 请求http
void getHttp(String text) async {
//  try {
//    //远程请求 响应
//    Response response;
//    String path = "http://127.0.0.1:5000/hi";
////      Uri uri = Uri(host: "127.0.0.1",port: 5000,path: "hi");
//    Uri uri = Uri(scheme: "http", host: "127.0.0.1",port: 5000,path: "/hi");
//    //必须使用异步的方法才能使用await
//    response = await Dio().get(path);
//    //response = await Dio().getUri(uri);
//    return print(response);
//  } catch (e) {
//    return print(e);
//  }
  try{
    Response response;
    //参数
    var data ={'name': text};
    var url ='https://www.easy-mock.com/project/5e3974fdf35d4261222b3145/example/query';
    var url1 ='https://www.easy-mock.com/mock/5e3974fdf35d4261222b3145/tiand/query?name=aa';
    response = await Dio().get(url1,
        //queryParameters: data
    );
    print(response.data);
    return response.data;
  }catch(e){
    print(e);
  }
}

void main(){
  connectserver();
}
