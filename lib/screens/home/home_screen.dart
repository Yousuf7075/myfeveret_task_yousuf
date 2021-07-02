import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfeveret_task_yousuf/bloc/home_bloc.dart';
import 'package:myfeveret_task_yousuf/bloc/home_event.dart';
import 'package:myfeveret_task_yousuf/bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = context.read<HomeBloc>();
    _homeBloc.add(FetchHomeDataEvent());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is HomeLoading) {
            return Container(
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }
          if (state is HomeError) {
            return Container(
              child: Center(
                child: Text(
                  "${state.errorMessage.toString()}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
              ),
            );
          }
          if (state is HomeLoaded) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('trending seller length->${state.treadingSellers[0].length}'),
                  Text('trending products length->${state.treadingProducts[0].length}'),
                  Text('new arrivals length->${state.newArrivals[0].length}'),
                  Text('new shops length->${state.newShops[0].length}'),
                  Text('products length->${state.products[0].length}'),
                ],
              ),
            );
          }
          return Container(
            width: 0.0,
            height: 0.0,
          );
        }),
      ),
    );
  }
}
