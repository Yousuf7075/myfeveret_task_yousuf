import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfeveret_task_yousuf/models/trending_seller.dart';
import 'package:myfeveret_task_yousuf/repository/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with ChangeNotifier {
  HomeRepository repository = HomeRepository();
  List<List<TrendingSeller>> treadingSellers;


  HomeBloc({this.repository}) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    final currentState = state;

    if (event is FetchHomeDataEvent) {
      if (currentState is HomeInitial) {
        yield HomeLoading();
        try {
          var trendingSellerRp = await repository.getTrendingSellers();
          treadingSellers = trendingSellerFromJson(trendingSellerRp);
          //print('trending seller-> ${trendingSellerRp.body}');
          yield HomeLoaded(treadingSellers: treadingSellers);
        } catch (e) {
          yield HomeError(errorMessage: e.toString());
          print(e);
        }
      }
    }
  }
}
