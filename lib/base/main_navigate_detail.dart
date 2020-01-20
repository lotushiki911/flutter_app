import 'package:flutter/material.dart';

class Product{
  final String title;
  final String description;

  Product(this.title,this.description);

}
void main(){
  runApp(MaterialApp(
    title: '导航2',
    home: MyAppBaseView(
      products:List.generate(20, (i)=>Product('呵呵哒商品$i','这是第$i个商品'))
    )
  ));
}

class MyAppBaseView extends StatelessWidget{
  final List<Product> products;
  MyAppBaseView({Key key,@required this.products}):super(key:key);
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('导航的数据传递和接收',)),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text(products[index].title),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
               builder: (context) => ProductDetail(product:products[index])
              ));
            }, //点击后 响应事件
          );
        }
      )
    );
  }
}



class ProductDetail extends StatelessWidget{
  final Product product;
  ProductDetail({Key key,@required this.product}):super(key:key);
  @override
  Widget build (BuildContext context){
    return Scaffold(
        appBar: AppBar(title: Text('${product.title}',)),
        body: Center(
          child: Text('${product.description}'),
        )
    );
  }
}
