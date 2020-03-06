class CategoryGoodsModel {
  String errorNo;
  String errorMsg;
  List<GoodsData> goodsData;

  CategoryGoodsModel({this.errorNo, this.errorMsg, this.goodsData});

  CategoryGoodsModel.fromJson(Map<String, dynamic> json) {
    errorNo = json['error_no'];
    errorMsg = json['error_msg'];
    if (json['goods_data'] != null) {
      goodsData = new List<GoodsData>();
      json['goods_data'].forEach((v) {
        goodsData.add(new GoodsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_no'] = this.errorNo;
    data['error_msg'] = this.errorMsg;
    if (this.goodsData != null) {
      data['goods_data'] = this.goodsData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GoodsData {
  String image;
  double oriPrice;
  double presentPrice;
  String goodsName;
  String goodsId;

  GoodsData(
      {this.image,
        this.oriPrice,
        this.presentPrice,
        this.goodsName,
        this.goodsId});

  GoodsData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    oriPrice = json['oriPrice'];
    presentPrice = json['presentPrice'];
    goodsName = json['goodsName'];
    goodsId = json['goodsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['goodsName'] = this.goodsName;
    data['goodsId'] = this.goodsId;
    return data;
  }
}
