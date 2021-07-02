// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<List<Products>> productsFromJson(String str) => List<List<Products>>.from(json.decode(str).map((x) => List<Products>.from(x.map((x) => Products.fromJson(x)))));

String productsToJson(List<List<Products>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class Products {
  Products({
    this.storyTime,
    this.story,
    this.storyType,
    this.storyImage,
    this.storyAdditionalImages,
    this.promoImage,
    this.orderQty,
    this.lastAddToCart,
    this.availableStock,
    this.myId,
    this.ezShopName,
    this.companyName,
    this.companyLogo,
    this.companyEmail,
    this.currencyCode,
    this.unitPrice,
    this.discountAmount,
    this.discountPercent,
    this.iMyId,
    this.shopName,
    this.shopLogo,
    this.shopLink,
    this.friendlyTimeDiff,
    this.slNo,
  });

  DateTime storyTime;
  String story;
  String storyType;
  String storyImage;
  dynamic storyAdditionalImages;
  String promoImage;
  int orderQty;
  DateTime lastAddToCart;
  int availableStock;
  String myId;
  String ezShopName;
  String companyName;
  String companyLogo;
  String companyEmail;
  String currencyCode;
  int unitPrice;
  int discountAmount;
  int discountPercent;
  String iMyId;
  String shopName;
  String shopLogo;
  String shopLink;
  String friendlyTimeDiff;
  String slNo;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    storyTime: json["storyTime"] == null ? null : DateTime.parse(json["storyTime"]),
    story: json["story"] == null ? null : json["story"],
    storyType: json["storyType"] == null ? null : json["storyType"],
    storyImage: json["storyImage"] == null ? null : json["storyImage"],
    storyAdditionalImages: json["storyAdditionalImages"],
    promoImage: json["promoImage"] == null ? null : json["promoImage"],
    orderQty: json["orderQty"] == null ? null : json["orderQty"],
    lastAddToCart: json["lastAddToCart"] == null ? null : DateTime.parse(json["lastAddToCart"]),
    availableStock: json["availableStock"] == null ? null : json["availableStock"],
    myId: json["myId"] == null ? null : json["myId"],
    ezShopName: json["ezShopName"] == null ? null : json["ezShopName"],
    companyName: json["companyName"] == null ? null : json["companyName"],
    companyLogo: json["companyLogo"] == null ? null : json["companyLogo"],
    companyEmail: json["companyEmail"] == null ? null : json["companyEmail"],
    currencyCode: json["currencyCode"] == null ? null : json["currencyCode"],
    unitPrice: json["unitPrice"] == null ? null : json["unitPrice"],
    discountAmount: json["discountAmount"] == null ? null : json["discountAmount"],
    discountPercent: json["discountPercent"] == null ? null : json["discountPercent"],
    iMyId: json["iMyID"] == null ? null : json["iMyID"],
    shopName: json["shopName"] == null ? null : json["shopName"],
    shopLogo: json["shopLogo"] == null ? null : json["shopLogo"],
    shopLink: json["shopLink"] == null ? null : json["shopLink"],
    friendlyTimeDiff: json["friendlyTimeDiff"] == null ? null : json["friendlyTimeDiff"],
    slNo: json["slNo"] == null ? null : json["slNo"],
  );

  Map<String, dynamic> toJson() => {
    "storyTime": storyTime == null ? null : storyTime.toIso8601String(),
    "story": story == null ? null : story,
    "storyType": storyType == null ? null : storyType,
    "storyImage": storyImage == null ? null : storyImage,
    "storyAdditionalImages": storyAdditionalImages,
    "promoImage": promoImage == null ? null : promoImage,
    "orderQty": orderQty == null ? null : orderQty,
    "lastAddToCart": lastAddToCart == null ? null : lastAddToCart.toIso8601String(),
    "availableStock": availableStock == null ? null : availableStock,
    "myId": myId == null ? null : myId,
    "ezShopName": ezShopName == null ? null : ezShopName,
    "companyName": companyName == null ? null : companyName,
    "companyLogo": companyLogo == null ? null : companyLogo,
    "companyEmail": companyEmail == null ? null : companyEmail,
    "currencyCode": currencyCode == null ? null : currencyCode,
    "unitPrice": unitPrice == null ? null : unitPrice,
    "discountAmount": discountAmount == null ? null : discountAmount,
    "discountPercent": discountPercent == null ? null : discountPercent,
    "iMyID": iMyId == null ? null : iMyId,
    "shopName": shopName == null ? null : shopName,
    "shopLogo": shopLogo == null ? null : shopLogo,
    "shopLink": shopLink == null ? null : shopLink,
    "friendlyTimeDiff": friendlyTimeDiff == null ? null : friendlyTimeDiff,
    "slNo": slNo == null ? null : slNo,
  };
}
