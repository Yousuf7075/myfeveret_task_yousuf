import 'package:flutter/cupertino.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchHomeDataEvent extends HomeEvent {

  const FetchHomeDataEvent();

  @override
  List<Object> get props => [];
}
