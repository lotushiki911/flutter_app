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
  String _errorNo;
  String _errorMsg;
  List<ProductData> _productData;

  ProductCategory(
      {String errorNo, String errorMsg, List<ProductData> productData}) {
    this._errorNo = errorNo;
    this._errorMsg = errorMsg;
    this._productData = productData;
  }

  String get errorNo => _errorNo;
  set errorNo(String errorNo) => _errorNo = errorNo;
  String get errorMsg => _errorMsg;
  set errorMsg(String errorMsg) => _errorMsg = errorMsg;
  List<ProductData> get productData => _productData;
  set productData(List<ProductData> productData) => _productData = productData;

  ProductCategory.fromJson(Map<String, dynamic> json) {
    _errorNo = json['error_no'];
    _errorMsg = json['error_msg'];
    if (json['product_data'] != null) {
      _productData = new List<ProductData>();
      json['product_data'].forEach((v) {
        _productData.add(new ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_no'] = this._errorNo;
    data['error_msg'] = this._errorMsg;
    if (this._productData != null) {
      data['product_data'] = this._productData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductData {
  String _productCategoryId;
  String _productCategoryName;
  String _image;
  String _remark;
  List<SubProductSet> _subProductSet;

  ProductData(
      {String productCategoryId,
        String productCategoryName,
        String image,
        String remark,
        List<SubProductSet> subProductSet}) {
    this._productCategoryId = productCategoryId;
    this._productCategoryName = productCategoryName;
    this._image = image;
    this._remark = remark;
    this._subProductSet = subProductSet;
  }

  String get productCategoryId => _productCategoryId;
  set productCategoryId(String productCategoryId) =>
      _productCategoryId = productCategoryId;
  String get productCategoryName => _productCategoryName;
  set productCategoryName(String productCategoryName) =>
      _productCategoryName = productCategoryName;
  String get image => _image;
  set image(String image) => _image = image;
  String get remark => _remark;
  set remark(String remark) => _remark = remark;
  List<SubProductSet> get subProductSet => _subProductSet;
  set subProductSet(List<SubProductSet> subProductSet) =>
      _subProductSet = subProductSet;

  ProductData.fromJson(Map<String, dynamic> json) {
    _productCategoryId = json['productCategoryId'];
    _productCategoryName = json['productCategoryName'];
    _image = json['image'];
    _remark = json['remark'];
    if (json['subProductSet'] != null) {
      _subProductSet = new List<SubProductSet>();
      json['subProductSet'].forEach((v) {
        _subProductSet.add(new SubProductSet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productCategoryId'] = this._productCategoryId;
    data['productCategoryName'] = this._productCategoryName;
    data['image'] = this._image;
    data['remark'] = this._remark;
    if (this._subProductSet != null) {
      data['subProductSet'] =
          this._subProductSet.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubProductSet {
  String _sId;
  String _productCategoryId;
  String _subProductName;
  String _remark;

  SubProductSet(
      {String sId,
        String productCategoryId,
        String subProductName,
        String remark}) {
    this._sId = sId;
    this._productCategoryId = productCategoryId;
    this._subProductName = subProductName;
    this._remark = remark;
  }

  String get sId => _sId;
  set sId(String sId) => _sId = sId;
  String get productCategoryId => _productCategoryId;
  set productCategoryId(String productCategoryId) =>
      _productCategoryId = productCategoryId;
  String get subProductName => _subProductName;
  set subProductName(String subProductName) => _subProductName = subProductName;
  String get remark => _remark;
  set remark(String remark) => _remark = remark;

  SubProductSet.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _productCategoryId = json['productCategoryId'];
    _subProductName = json['subProductName'];
    _remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['productCategoryId'] = this._productCategoryId;
    data['subProductName'] = this._subProductName;
    data['remark'] = this._remark;
    return data;
  }
}