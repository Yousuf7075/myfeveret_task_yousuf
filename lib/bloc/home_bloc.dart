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
  List<List<TrendingSellerRp>> treadingSellers;
  List<List<TrendingProductsRp>> treadingProducts;
  List<List<NewArrivalsRp>> newArrivals;
  List<List<NewShopsRp>> newShops;
  List<List<ProductsRp>> products;
  List<ProductsRp> firstThreeProducts = [];
  List<ProductsRp> secondThreeProducts = [];
  List<ProductsRp> restOfTheProducts = [];

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
          print('three items-> ${products[0].length}');
          firstThreeProducts = getFirstThreeProducts(products);
          secondThreeProducts = getSecondThreeProducts(products);
          restOfTheProducts = getRestOfTheProducts(products);
          print('three items-> ${firstThreeProducts.length}');
          print('three items-> ${secondThreeProducts.length}');
          print('three items-> ${restOfTheProducts.length}');

          yield HomeLoaded(
              treadingSellers: treadingSellers,
              treadingProducts: treadingProducts,
              newArrivals: newArrivals,
              newShops: newShops,
              firstThreeProducts: firstThreeProducts,
              secondThreeProducts: secondThreeProducts,
              restOfTheProducts: restOfTheProducts);
        } catch (e) {
          yield HomeError(errorMessage: e.toString());
          print(e);
        }
      }
    }
  }

  List<ProductsRp> getFirstThreeProducts(List<List<ProductsRp>> products) {
    List<ProductsRp> firstThreeItems = [];
    products[0].asMap().forEach((i, value) {
      if(i < 3){
        firstThreeItems.add(value);
      }
    });
    return firstThreeItems;
  }

  List<ProductsRp> getSecondThreeProducts(List<List<ProductsRp>> products) {
    List<ProductsRp> secondThreeItems = [];
    products[0].asMap().forEach((i, value) {
      if(i > 2 && i < 6) {
        secondThreeItems.add(value);
      }
    });
    return secondThreeItems;
  }

  List<ProductsRp> getRestOfTheProducts(List<List<ProductsRp>> products) {
    List<ProductsRp> restOfTheItems = [];
    products[0].asMap().forEach((i, value) {
      if(i > 5) {
        restOfTheItems.add(value);
      }
    });
    return restOfTheItems;
  }
}
