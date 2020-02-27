import 'dart:convert';

String list_to_string(list) {
//1.List转为String
//  var list = <String>['a', 'b'];
  String s = JsonEncoder().convert(list);
  return s;
}
List string_to_list(s){
//2.String转回List
  List<Map> list = <Map>[];
  for (var value in JsonDecoder().convert(s)) {
//    print("数据为 :${value}");
    list.add(value);
  };
  return list;
}