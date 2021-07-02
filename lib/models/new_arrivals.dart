// To parse this JSON data, do
//
//     final newArrivals = newArrivalsFromJson(jsonString);

import 'dart:convert';

List<List<NewArrivals>> newArrivalsFromJson(String str) => List<List<NewArrivals>>.from(json.decode(str).map((x) => List<NewArrivals>.from(x.map((x) => NewArrivals.fromJson(x)))));

String newArrivalsToJson(List<List<NewArrivals>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class NewArrivals {
  NewArrivals({
    this.slNo,
    this.productName,
    this.shortDetails,
    this.productDescription,
    this.availableStock,
    this.orderQty,
    this.salesQty,
    this.orderAmount,
    this.salesAmount,
    this.discountPercent,
    this.discountAmount,
    this.unitPrice,
    this.productImage,
    this.sellerName,
    this.sellerProfilePhoto,
    this.sellerCoverPhoto,
    this.ezShopName,
    this.defaultPushScore,
    this.myProductVarId,
  });

  String slNo;
  String productName;
  String shortDetails;
  String productDescription;
  int availableStock;
  int orderQty;
  int salesQty;
  int orderAmount;
  int salesAmount;
  int discountPercent;
  int discountAmount;
  int unitPrice;
  String productImage;
  String sellerName;
  String sellerProfilePhoto;
  String sellerCoverPhoto;
  String ezShopName;
  int defaultPushScore;
  String myProductVarId;

  factory NewArrivals.fromJson(Map<String, dynamic> json) => NewArrivals(
    slNo: json["slNo"] == null ? null : json["slNo"],
    productName: json["productName"] == null ? null : json["productName"],
    shortDetails: json["shortDetails"] == null ? null : json["shortDetails"],
    productDescription: json["productDescription"] == null ? null : json["productDescription"],
    availableStock: json["availableStock"] == null ? null : json["availableStock"],
    orderQty: json["orderQty"] == null ? null : json["orderQty"],
    salesQty: json["salesQty"] == null ? null : json["salesQty"],
    orderAmount: json["orderAmount"] == null ? null : json["orderAmount"],
    salesAmount: json["salesAmount"] == null ? null : json["salesAmount"],
    discountPercent: json["discountPercent"] == null ? null : json["discountPercent"],
    discountAmount: json["discountAmount"] == null ? null : json["discountAmount"],
    unitPrice: json["unitPrice"] == null ? null : json["unitPrice"],
    productImage: json["productImage"] == null ? null : json["productImage"],
    sellerName: json["sellerName"] == null ? null : json["sellerName"],
    sellerProfilePhoto: json["sellerProfilePhoto"] == null ? null : json["sellerProfilePhoto"],
    sellerCoverPhoto: json["sellerCoverPhoto"] == null ? null : json["sellerCoverPhoto"],
    ezShopName: json["ezShopName"] == null ? null : json["ezShopName"],
    defaultPushScore: json["defaultPushScore"] == null ? null : json["defaultPushScore"],
    myProductVarId: json["myProductVarId"] == null ? null : json["myProductVarId"],
  );

  Map<String, dynamic> toJson() => {
    "slNo": slNo == null ? null : slNo,
    "productName": productName == null ? null : productName,
    "shortDetails": shortDetails == null ? null : shortDetails,
    "productDescription": productDescription == null ? null : productDescription,
    "availableStock": availableStock == null ? null : availableStock,
    "orderQty": orderQty == null ? null : orderQty,
    "salesQty": salesQty == null ? null : salesQty,
    "orderAmount": orderAmount == null ? null : orderAmount,
    "salesAmount": salesAmount == null ? null : salesAmount,
    "discountPercent": discountPercent == null ? null : discountPercent,
    "discountAmount": discountAmount == null ? null : discountAmount,
    "unitPrice": unitPrice == null ? null : unitPrice,
    "productImage": productImage == null ? null : productImage,
    "sellerName": sellerName == null ? null : sellerName,
    "sellerProfilePhoto": sellerProfilePhoto == null ? null : sellerProfilePhoto,
    "sellerCoverPhoto": sellerCoverPhoto == null ? null : sellerCoverPhoto,
    "ezShopName": ezShopName == null ? null : ezShopName,
    "defaultPushScore": defaultPushScore == null ? null : defaultPushScore,
    "myProductVarId": myProductVarId == null ? null : myProductVarId,
  };
}
