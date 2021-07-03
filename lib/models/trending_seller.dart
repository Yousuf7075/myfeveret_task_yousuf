// To parse this JSON data, do
//
//     final trendingSeller = trendingSellerFromJson(jsonString);

import 'dart:convert';

List<List<TrendingSellerRp>> trendingSellerFromJson(String str) => List<List<TrendingSellerRp>>.from(json.decode(str).map((x) => List<TrendingSellerRp>.from(x.map((x) => TrendingSellerRp.fromJson(x)))));

String trendingSellerToJson(List<List<TrendingSellerRp>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class TrendingSellerRp {
  TrendingSellerRp({
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
  dynamic aboutCompany;
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

  factory TrendingSellerRp.fromJson(Map<String, dynamic> json) => TrendingSellerRp(
    slNo: json["slNo"] == null ? null : json["slNo"],
    sellerName: json["sellerName"] == null ? null : json["sellerName"],
    sellerProfilePhoto: json["sellerProfilePhoto"] == null ? null : json["sellerProfilePhoto"],
    sellerItemPhoto: json["sellerItemPhoto"] == null ? null : json["sellerItemPhoto"],
    ezShopName: json["ezShopName"] == null ? null : json["ezShopName"],
    defaultPushScore: json["defaultPushScore"] == null ? null : json["defaultPushScore"].toDouble(),
    aboutCompany: json["aboutCompany"],
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
    "aboutCompany": aboutCompany,
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
