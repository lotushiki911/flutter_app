import 'package:flutter/material.dart';

class ExpansionTileForList extends StatefulWidget {
  @override
  _ExpansionTileForListState createState() => _ExpansionTileForListState();
}

class _ExpansionTileForListState extends State<ExpansionTileForList> {
  //数组列表
  List<int> mlist;

  //待展示的数组列表
  List<ExpandStateBean> expandList;

  //内部构造方法
  _ExpansionTileForListState(){
    mlist = new List();
    expandList = new List();
    //循环初始化两个数组
    for(int i = 0 ; i < 5 ; i ++){
      mlist.add(i);
      expandList.add(ExpandStateBean(i, false));
    }
  }

  //改变某一个点击的状态
  _setExpansionPanelState(int index , isExpand){
    setState(() {
      expandList[index].isOpen = !isExpand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('隐藏内容列表'),),
      //expansionList 必须放到可滚动的组件下面
      body: SingleChildScrollView(
        //用列表的方式展现所有的expansiontile
        child: ExpansionPanelList(
          //回调方法,点击右边的小箭头是否展开  点开动作
          expansionCallback: (index , bol)  {
            _setExpansionPanelState(index,bol);
          },
          //列表主体  进行构建
          children: mlist.map((index){
            return ExpansionPanel(
              //头
              headerBuilder: (context,isExpanded){
                return ListTile(
                  title: Text('这是第$index个隐藏列表'),
                );
              },
              //隐藏体
              body: ListTile(
                title: Text('隐藏内容为$index!'),
              ),
              isExpanded: expandList[index].isOpen
            );
          }).toList(),//必须要tolist下 这是为啥???TODO
        ),
      ),
    );
  }
}

//定义一个类 用来保存每一个列表中的下来隐藏菜单的状态
class ExpandStateBean{
  var isOpen;
  var index;
  ExpandStateBean(this.index,this.isOpen);
}