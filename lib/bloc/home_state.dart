import 'package:flutter/material.dart';
import 'package:myfeveret_task_yousuf/models/new_arrivals.dart';
import 'package:myfeveret_task_yousuf/models/new_shops.dart';
import 'package:myfeveret_task_yousuf/models/products.dart';
import 'package:myfeveret_task_yousuf/models/trending_products.dart';
import 'package:myfeveret_task_yousuf/models/trending_seller.dart';

@immutable
abstract class HomeState {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  final List<List<TrendingSellerRp>> treadingSellers;
  final List<List<TrendingProductsRp>> treadingProducts;
  final List<List<NewArrivalsRp>> newArrivals;
  final List<List<NewShopsRp>> newShops;
  final List<ProductsRp> firstThreeProducts;
  final List<ProductsRp> secondThreeProducts;
  final List<ProductsRp> restOfTheProducts;

  HomeLoaded(
      {this.treadingSellers,
      this.treadingProducts,
      this.newArrivals,
      this.newShops,
      this.firstThreeProducts,
      this.secondThreeProducts,
      this.restOfTheProducts});

  @override
  List<Object> get props => [
        treadingSellers,
        treadingProducts,
        newArrivals,
        newShops,
        firstThreeProducts,
        secondThreeProducts,
        restOfTheProducts
      ];
}

class HomeError extends HomeState {
  final String errorMessage;

  const HomeError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
