import 'package:flutter/cupertino.dart';


//右滑操作是在cupertino组件里  苹果用的比较多
class RightBackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          color: CupertinoColors.activeGreen,
          child: CupertinoButton(
            child: Icon(CupertinoIcons.add),
            onPressed: (){
              Navigator.push(context,
                  //CupertinoPageRoute自动带了右滑功能
                  CupertinoPageRoute(
                    builder: (context) => RightBackDemo()
                  )
              );
            }
          ),
        ),
      ),
    );
  }
}
