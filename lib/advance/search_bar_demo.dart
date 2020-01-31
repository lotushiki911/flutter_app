import 'package:flutter/material.dart';
import 'data/asset_data.dart';
class SearchBarDemo extends StatefulWidget {
  @override
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar带一个控制按钮
      appBar: AppBar(
        title: Text('research bar'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: searchBarDelegate());
            }
          )
        ],
      ),
    );
  }
}

class searchBarDelegate extends SearchDelegate<String> {
  //右边的按键重写
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      )
    ];
  }

  //前面的按键重写(返回箭头)
  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
      //放入一个点击动画事件图标
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,progress: transitionAnimation,//增加一个过渡动画
      ),
      onPressed: ()=> close(context,null), //点击时 关闭页面清空
    );
  }

  //搜索出来的结果进行重写
  @override
  Widget buildResults(BuildContext context){
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),//将查出来结果放到里面 一般是从后台传入的数据
        ),
      ),
    );
  }

  //用户搜索结果推荐重写
  @override
  Widget buildSuggestions (BuildContext context){
    //设置返回数据
    final suggestionList = query.isEmpty ?
        //如果查询结果是空 直接返回推荐数据
        searchSuggestions :
        //如果不为空则返回查询到的数据匹配值
        searchList.where((input)=>input.startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        //返回的结果使用瓦片
        itemBuilder: (context,index) => ListTile(
          //对字体进行处理 搜索出来结果 填写字加粗
          title: RichText(        //富文本
            text: TextSpan(      //设定文字范围
              text: suggestionList[index].substring(0,query.length),
              style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey)
                )
              ]
            ),
          ),
        )
    );
  }
}