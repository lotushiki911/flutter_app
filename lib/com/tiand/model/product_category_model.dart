//class ProductCategoryModel{
//
//  String productCategoryId;
//  String productCategoryName;
//  String remark;
//  String image;
//  List<dynamic> subProductSet;
//
//  ProductCategoryModel({
//    this.productCategoryId,
//    this.productCategoryName,
//    this.remark,
//    this.image,
//    this.subProductSet
//  });
//
//  factory ProductCategoryModel.fromJson(dynamic json){
//    return ProductCategoryModel(
//      productCategoryId: json['productCategoryId'],
//      productCategoryName: json['productCategoryName'],
//      remark: json['remark'],
//      image: json['image'],
//      subProductSet: json['subProductSet'],
//    );
//  }
//}
//
//class ProductCategoryListModel{
//  List<ProductCategoryModel> data;
//
//  ProductCategoryListModel(this.data);
//
//  factory ProductCategoryListModel.fromJson(List json){
//    return ProductCategoryListModel(
//        json.map((i)=>ProductCategoryModel.fromJson(i)).toList()
//    );
//  }
//}

///自动生成

class ProductCategory {
  String errorNo;
  String errorMsg;
  List<ProductData> productData;

  ProductCategory({this.errorNo, this.errorMsg, this.productData});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    errorNo = json['error_no'];
    errorMsg = json['error_msg'];
    if (json['product_data'] != null) {
      productData = new List<ProductData>();
      json['product_data'].forEach((v) {
        productData.add(new ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_no'] = this.errorNo;
    data['error_msg'] = this.errorMsg;
    if (this.productData != null) {
      data['product_data'] = this.productData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductData {
  String productCategoryId;
  String productCategoryName;
  List<SubProductSet> subProductSet;
  String remark;
  String image;

  ProductData(
      {this.productCategoryId,
        this.productCategoryName,
        this.subProductSet,
        this.remark,
        this.image});

  ProductData.fromJson(Map<String, dynamic> json) {
    productCategoryId = json['productCategoryId'];
    productCategoryName = json['productCategoryName'];
    if (json['subProductSet'] != null) {
      subProductSet = new List<SubProductSet>();
      json['subProductSet'].forEach((v) {
        subProductSet.add(new SubProductSet.fromJson(v));
      });
    }
    remark = json['remark'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productCategoryId'] = this.productCategoryId;
    data['productCategoryName'] = this.productCategoryName;
    if (this.subProductSet != null) {
      data['subProductSet'] =
          this.subProductSet.map((v) => v.toJson()).toList();
    }
    data['remark'] = this.remark;
    data['image'] = this.image;
    return data;
  }
}

class SubProductSet {
  String subId;
  String productCategoryId;
  String subProductName;
  String remark;

  SubProductSet(
      {this.subId, this.productCategoryId, this.subProductName, this.remark});

  SubProductSet.fromJson(Map<String, dynamic> json) {
    subId = json['subId'];
    productCategoryId = json['productCategoryId'];
    subProductName = json['subProductName'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subId'] = this.subId;
    data['productCategoryId'] = this.productCategoryId;
    data['subProductName'] = this.subProductName;
    data['remark'] = this.remark;
    return data;
  }
}