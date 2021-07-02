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
  final List<List<TrendingSeller>> treadingSellers;
  final List<List<TrendingProducts>> treadingProducts;
  final List<List<NewArrivals>> newArrivals;
  final List<List<NewShops>> newShops;
  final List<List<Products>> products;

  HomeLoaded(
      {this.treadingSellers,
      this.treadingProducts,
      this.newArrivals,
      this.newShops,
      this.products});

  @override
  List<Object> get props =>
      [treadingSellers, treadingProducts, newArrivals, newShops, products];
}

class HomeError extends HomeState {
  final String errorMessage;

  const HomeError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
