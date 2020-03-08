class DetailsModel {
  String errorNo;
  String errorMsg;
  DetailData detailData;

  DetailsModel({this.errorNo, this.errorMsg, this.detailData});

  DetailsModel.fromJson(Map<String, dynamic> json) {
    errorNo = json['error_no'];
    errorMsg = json['error_msg'];
    detailData = json['detail_data'] != null
        ? new DetailData.fromJson(json['detail_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_no'] = this.errorNo;
    data['error_msg'] = this.errorMsg;
    if (this.detailData != null) {
      data['detail_data'] = this.detailData.toJson();
    }
    return data;
  }
}

class DetailData {
  DetailInfo detailInfo;
  List<GoodComments> goodComments;
  AdvertesPicture advertesPicture;

  DetailData({this.detailInfo, this.goodComments, this.advertesPicture});

  DetailData.fromJson(Map<String, dynamic> json) {
    detailInfo = json['detailInfo'] != null
        ? new DetailInfo.fromJson(json['detailInfo'])
        : null;
    if (json['goodComments'] != null) {
      goodComments = new List<GoodComments>();
      json['goodComments'].forEach((v) {
        goodComments.add(new GoodComments.fromJson(v));
      });
    }
    advertesPicture = json['advertesPicture'] != null
        ? new AdvertesPicture.fromJson(json['advertesPicture'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detailInfo != null) {
      data['detailInfo'] = this.detailInfo.toJson();
    }
    if (this.goodComments != null) {
      data['goodComments'] = this.goodComments.map((v) => v.toJson()).toList();
    }
    if (this.advertesPicture != null) {
      data['advertesPicture'] = this.advertesPicture.toJson();
    }
    return data;
  }
}

class DetailInfo {
  String image5;
  int amount;
  String image3;
  String image4;
  String goodsId;
  String isOnline;
  String image1;
  String image2;
  String goodsSerialNumber;
  double oriPrice;
  double presentPrice;
  String comPic;
  int state;
  String shopId;
  String goodsName;
  String goodsDetail;

  DetailInfo(
      {this.image5,
        this.amount,
        this.image3,
        this.image4,
        this.goodsId,
        this.isOnline,
        this.image1,
        this.image2,
        this.goodsSerialNumber,
        this.oriPrice,
        this.presentPrice,
        this.comPic,
        this.state,
        this.shopId,
        this.goodsName,
        this.goodsDetail});

  DetailInfo.fromJson(Map<String, dynamic> json) {
    image5 = json['image5'];
    amount = json['amount'];
    image3 = json['image3'];
    image4 = json['image4'];
    goodsId = json['goodsId'];
    isOnline = json['isOnline'];
    image1 = json['image1'];
    image2 = json['image2'];
    goodsSerialNumber = json['goodsSerialNumber'];
    oriPrice = json['oriPrice'];
    presentPrice = json['presentPrice'];
    comPic = json['comPic'];
    state = json['state'];
    shopId = json['shopId'];
    goodsName = json['goodsName'];
    goodsDetail = json['goodsDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image5'] = this.image5;
    data['amount'] = this.amount;
    data['image3'] = this.image3;
    data['image4'] = this.image4;
    data['goodsId'] = this.goodsId;
    data['isOnline'] = this.isOnline;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['goodsSerialNumber'] = this.goodsSerialNumber;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['comPic'] = this.comPic;
    data['state'] = this.state;
    data['shopId'] = this.shopId;
    data['goodsName'] = this.goodsName;
    data['goodsDetail'] = this.goodsDetail;
    return data;
  }
}

class GoodComments {
  int sCORE;
  String comments;
  String userName;
  int discussTime;

  GoodComments({this.sCORE, this.comments, this.userName, this.discussTime});

  GoodComments.fromJson(Map<String, dynamic> json) {
    sCORE = json['SCORE'];
    comments = json['comments'];
    userName = json['userName'];
    discussTime = json['discussTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SCORE'] = this.sCORE;
    data['comments'] = this.comments;
    data['userName'] = this.userName;
    data['discussTime'] = this.discussTime;
    return data;
  }
}

class AdvertesPicture {
  String pICTUREADDRESS;
  String tOPLACE;

  AdvertesPicture({this.pICTUREADDRESS, this.tOPLACE});

  AdvertesPicture.fromJson(Map<String, dynamic> json) {
    pICTUREADDRESS = json['PICTURE_ADDRESS'];
    tOPLACE = json['TO_PLACE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PICTURE_ADDRESS'] = this.pICTUREADDRESS;
    data['TO_PLACE'] = this.tOPLACE;
    return data;
  }
}