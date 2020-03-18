class HuoModel {
  String errorNo;
  String errorMsg;
  List<HuoData> huoData;

  HuoModel({this.errorNo, this.errorMsg, this.huoData});

  HuoModel.fromJson(Map<String, dynamic> json) {
    errorNo = json['error_no'];
    errorMsg = json['error_msg'];
    if (json['huo_data'] != null) {
      huoData = new List<HuoData>();
      json['huo_data'].forEach((v) {
        huoData.add(new HuoData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_no'] = this.errorNo;
    data['error_msg'] = this.errorMsg;
    if (this.huoData != null) {
      data['huo_data'] = this.huoData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HuoData {
  String name;
  String staticUrl;
  String price;
  String staticType;

  HuoData({this.name, this.staticUrl, this.price, this.staticType});

  HuoData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    staticUrl = json['static_url'];
    price = json['price'];
    staticType = json['static_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['static_url'] = this.staticUrl;
    data['price'] = this.price;
    data['static_type'] = this.staticType;
    return data;
  }
}