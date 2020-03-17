import 'package:flutter/material.dart';
import 'package:flutter_app/com/tiand/model/product_category_model.dart';
import 'package:flutter_app/com/tiand/provide/category_provide.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

class LeftCategoryNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Consumer<CategoryProvide>(
      builder: (context,val,_){
        var leftList = Provider.of<CategoryProvide>(context).leftList;
        return Container(
          width: ScreenUtil().setWidth(160),
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(width: 1,color: Colors.black12)
              )
          ),
          //动态列表 使用构造器
          child: ListView.builder(
            //个数
            itemCount: leftList.length,
            itemBuilder: (context,index){
              return _leftInkWell(context,index,leftList[index]);
            },
          ),

        );
      },
    );
  }

  //页面布置 - 左边类别导航
  Widget _leftInkWell(context,int index,ProductData productData){
    bool isClick = false;
    //index 原值  对比点击值
    int clickIndex = Provider.of<CategoryProvide>(context).leftIndex;
    isClick = index == clickIndex?true : false;
    return InkWell(
      onTap: (){
        //改变大类的点亮
        Provider.of<CategoryProvide>(context,listen: false).changeLeftIndex(index,productData.productCategoryId);
        //绑定provide进行左右侧导航栏联动改变
        List<SubProductSet> childList = productData.subProductSet;
        String categoryId = productData.productCategoryId;
        Provider.of<CategoryProvide>(context,listen: false).getChildCategory(childList,categoryId);
        //要重新获取下商品列表数据
        print('大类是${categoryId},小类是${''}');
        //传参
        var data={
          //大类项
          'categoryId': categoryId == null ? '1':categoryId,
          //小项id
          'categorySubId': '',
          //分页数
          'page': 1,
        };
        Provider.of<CategoryProvide>(context,listen: false).getGoodsList(data);
      },
      child: Container(
        //设置高度
        height: ScreenUtil().setHeight(80),
        //设置边距
        padding: EdgeInsets.only(left: 10,top: 10),
        //大类的名称
        child: Text(
          productData.productCategoryName.toString(),
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
        //装饰器
        decoration: BoxDecoration(
          //点击高亮
            color: isClick?Colors.yellow : Colors.white,
            //包边
            border: Border(
                bottom: BorderSide(
                    width: 1,
                    color: Colors.black12
                )
            )
        ),

      ),
    );
  }

}
