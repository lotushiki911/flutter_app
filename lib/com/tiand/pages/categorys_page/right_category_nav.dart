import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/model/product_category_model.dart';
import 'package:flutter_app/com/tiand/provide/category_provide.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

class RightCategoryNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvide>(
      builder: (context,val,_){
        return Container(
          //右侧的模块
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(608),
          //加个底框
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      width: 1,color: Colors.black12
                  )
              )
          ),
          //改为横向布局
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: val.rightList.length,
              itemBuilder: (context,index){
                return _rightInkWell(
                  context,
                  index,
                  val.rightList[index],

                );
              }
          ),
        );
      },
    );
  }

  //右侧的小组件 构建
  Widget _rightInkWell(context,int index,SubProductSet item, ){
    bool isClick = false;
    //index 原值  对比点击值
    int clickIndex = Provider.of<CategoryProvide>(context).rightIndex;
    //要重新获取下商品列表数据
    String leftId = Provider.of<CategoryProvide>(context).leftId;
    isClick = index == clickIndex?true : false;
    return InkWell(
      onTap: (){
        print('---------->开始改变小类别信息');
        //点击改变右侧高亮
        Provider.of<CategoryProvide>(context,listen: false).changeRightIndex(index,item.subId);

        print('大类是${leftId},小类是${item.subId}');
        //传参
        var data={
          //大类项
          'categoryId': leftId,
          //小项id
          'categorySubId': item.subId,
          //分页数
          'page': 1,
        };
        Provider.of<CategoryProvide>(context,listen: false).getGoodsList(data);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          item.subProductName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(24),
            color: isClick?Colors.pinkAccent:Colors.black,
          ),

        ),
      ),
    );
  }

}
