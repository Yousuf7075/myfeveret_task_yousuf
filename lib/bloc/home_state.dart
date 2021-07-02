

import 'package:flutter/material.dart';
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

  HomeLoaded({this.treadingSellers});

  @override
  List<Object> get props => [treadingSellers];
}

class HomeError extends HomeState {
  final String errorMessage;

  const HomeError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
