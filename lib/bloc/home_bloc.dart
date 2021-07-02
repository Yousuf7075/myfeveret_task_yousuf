import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfeveret_task_yousuf/models/new_arrivals.dart';
import 'package:myfeveret_task_yousuf/models/new_shops.dart';
import 'package:myfeveret_task_yousuf/models/products.dart';
import 'package:myfeveret_task_yousuf/models/trending_products.dart';
import 'package:myfeveret_task_yousuf/models/trending_seller.dart';
import 'package:myfeveret_task_yousuf/repository/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with ChangeNotifier {
  HomeRepository repository = HomeRepository();
  List<List<TrendingSeller>> treadingSellers;
  List<List<TrendingProducts>> treadingProducts;
  List<List<NewArrivals>> newArrivals;
  List<List<NewShops>> newShops;
  List<List<Products>> products;

  HomeBloc({this.repository}) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    final currentState = state;

    if (event is FetchHomeDataEvent) {
      if (currentState is HomeInitial) {
        yield HomeLoading();
        try {
          //trending seller
          var trendingSellerRp = await repository.getTrendingSellers();
          treadingSellers = trendingSellerFromJson(trendingSellerRp);

          //trending products
          var trendingProductsRp = await repository.getTrendingProducts();
          treadingProducts = trendingProductsFromJson(trendingProductsRp);

          //new arrivals
          var newArrivalsRp = await repository.getNewArrivals();
          newArrivals = newArrivalsFromJson(newArrivalsRp);

          //new shops
          var newShopsRp = await repository.getNewShops();
          newShops = newShopsFromJson(newShopsRp);

          //products
          var productsRp = await repository.getProducts();
          products = productsFromJson(productsRp);

          yield HomeLoaded(
              treadingSellers: treadingSellers,
              treadingProducts: treadingProducts,
              newArrivals: newArrivals,
              newShops: newShops,
              products: products);
        } catch (e) {
          yield HomeError(errorMessage: e.toString());
          print(e);
        }
      }
    }
  }
}
