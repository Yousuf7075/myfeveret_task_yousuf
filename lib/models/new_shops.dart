// To parse this JSON data, do
//
//     final newShops = newShopsFromJson(jsonString);

import 'dart:convert';

List<List<NewShops>> newShopsFromJson(String str) => List<List<NewShops>>.from(json.decode(str).map((x) => List<NewShops>.from(x.map((x) => NewShops.fromJson(x)))));

String newShopsToJson(List<List<NewShops>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class NewShops {
  NewShops({
    this.slNo,
    this.sellerName,
    this.sellerProfilePhoto,
    this.sellerItemPhoto,
    this.ezShopName,
    this.defaultPushScore,
    this.aboutCompany,
    this.allowCod,
    this.division,
    this.subDivision,
    this.city,
    this.state,
    this.zipcode,
    this.country,
    this.currencyCode,
    this.orderQty,
    this.orderAmount,
    this.salesQty,
    this.salesAmount,
    this.highestDiscountPercent,
    this.lastAddToCart,
    this.lastAddToCartThatSold,
  });

  String slNo;
  String sellerName;
  String sellerProfilePhoto;
  String sellerItemPhoto;
  String ezShopName;
  double defaultPushScore;
  String aboutCompany;
  int allowCod;
  dynamic division;
  dynamic subDivision;
  String city;
  String state;
  String zipcode;
  String country;
  String currencyCode;
  int orderQty;
  int orderAmount;
  int salesQty;
  int salesAmount;
  int highestDiscountPercent;
  DateTime lastAddToCart;
  DateTime lastAddToCartThatSold;

  factory NewShops.fromJson(Map<String, dynamic> json) => NewShops(
    slNo: json["slNo"] == null ? null : json["slNo"],
    sellerName: json["sellerName"] == null ? null : json["sellerName"],
    sellerProfilePhoto: json["sellerProfilePhoto"] == null ? null : json["sellerProfilePhoto"],
    sellerItemPhoto: json["sellerItemPhoto"] == null ? null : json["sellerItemPhoto"],
    ezShopName: json["ezShopName"] == null ? null : json["ezShopName"],
    defaultPushScore: json["defaultPushScore"] == null ? null : json["defaultPushScore"].toDouble(),
    aboutCompany: json["aboutCompany"] == null ? null : json["aboutCompany"],
    allowCod: json["allowCOD"] == null ? null : json["allowCOD"],
    division: json["division"],
    subDivision: json["subDivision"],
    city: json["city"] == null ? null : json["city"],
    state: json["state"] == null ? null : json["state"],
    zipcode: json["zipcode"] == null ? null : json["zipcode"],
    country: json["country"] == null ? null : json["country"],
    currencyCode: json["currencyCode"] == null ? null : json["currencyCode"],
    orderQty: json["orderQty"] == null ? null : json["orderQty"],
    orderAmount: json["orderAmount"] == null ? null : json["orderAmount"],
    salesQty: json["salesQty"] == null ? null : json["salesQty"],
    salesAmount: json["salesAmount"] == null ? null : json["salesAmount"],
    highestDiscountPercent: json["highestDiscountPercent"] == null ? null : json["highestDiscountPercent"],
    lastAddToCart: json["lastAddToCart"] == null ? null : DateTime.parse(json["lastAddToCart"]),
    lastAddToCartThatSold: json["lastAddToCartThatSold"] == null ? null : DateTime.parse(json["lastAddToCartThatSold"]),
  );

  Map<String, dynamic> toJson() => {
    "slNo": slNo == null ? null : slNo,
    "sellerName": sellerName == null ? null : sellerName,
    "sellerProfilePhoto": sellerProfilePhoto == null ? null : sellerProfilePhoto,
    "sellerItemPhoto": sellerItemPhoto == null ? null : sellerItemPhoto,
    "ezShopName": ezShopName == null ? null : ezShopName,
    "defaultPushScore": defaultPushScore == null ? null : defaultPushScore,
    "aboutCompany": aboutCompany == null ? null : aboutCompany,
    "allowCOD": allowCod == null ? null : allowCod,
    "division": division,
    "subDivision": subDivision,
    "city": city == null ? null : city,
    "state": state == null ? null : state,
    "zipcode": zipcode == null ? null : zipcode,
    "country": country == null ? null : country,
    "currencyCode": currencyCode == null ? null : currencyCode,
    "orderQty": orderQty == null ? null : orderQty,
    "orderAmount": orderAmount == null ? null : orderAmount,
    "salesQty": salesQty == null ? null : salesQty,
    "salesAmount": salesAmount == null ? null : salesAmount,
    "highestDiscountPercent": highestDiscountPercent == null ? null : highestDiscountPercent,
    "lastAddToCart": lastAddToCart == null ? null : lastAddToCart.toIso8601String(),
    "lastAddToCartThatSold": lastAddToCartThatSold == null ? null : lastAddToCartThatSold.toIso8601String(),
  };
}
