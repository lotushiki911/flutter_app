class HomeInfoModel {
  String errorNo;
  String errorMsg;
  List<HomeData> homeData;

  HomeInfoModel({this.errorNo, this.errorMsg, this.homeData});

  HomeInfoModel.fromJson(Map<String, dynamic> json) {
    errorNo = json['error_no'];
    errorMsg = json['error_msg'];
    if (json['home_data'] != null) {
      homeData = new List<HomeData>();
      json['home_data'].forEach((v) {
        homeData.add(new HomeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_no'] = this.errorNo;
    data['error_msg'] = this.errorMsg;
    if (this.homeData != null) {
      data['home_data'] = this.homeData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeData {
  String staticName;
  String staticUrl;
  String staticType;
  String newPrice;
  String oldPrice;

  HomeData(
      {this.staticName,
        this.staticUrl,
        this.staticType,
        this.newPrice,
        this.oldPrice});

  HomeData.fromJson(Map<String, dynamic> json) {
    staticName = json['static_name'];
    staticUrl = json['static_url'];
    staticType = json['static_type'];
    newPrice = json['new_price'];
    oldPrice = json['old_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['static_name'] = this.staticName;
    data['static_url'] = this.staticUrl;
    data['static_type'] = this.staticType;
    data['new_price'] = this.newPrice;
    data['old_price'] = this.oldPrice;
    return data;
  }
}