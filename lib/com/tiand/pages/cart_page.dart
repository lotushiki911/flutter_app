import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('provide状态控制'),),
      body: Center(
        child: Column(
          children: <Widget>[
            Number(),
            ClickBottom()
          ],
        ),
      ),
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200),
      child: Provide<Counter>(
        builder: (context,child,counter){
          return Text(
              '${counter.value}'
          );
        },
      )
    );
  }
}


class ClickBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          Provide.value<Counter>(context).increment();
        },
        child: Text('点击增加'),
      ),
    );
  }
}

