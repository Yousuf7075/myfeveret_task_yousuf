import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfeveret_task_yousuf/bloc/home_bloc.dart';
import 'package:myfeveret_task_yousuf/bloc/home_event.dart';
import 'package:myfeveret_task_yousuf/bloc/home_state.dart';
import 'package:myfeveret_task_yousuf/screens/home/widgets/product_list.dart';
import 'package:myfeveret_task_yousuf/screens/home/widgets/new_arrivals.dart';
import 'package:myfeveret_task_yousuf/screens/home/widgets/new_shops.dart';
import 'package:myfeveret_task_yousuf/screens/home/widgets/trending_products.dart';
import 'package:myfeveret_task_yousuf/screens/home/widgets/trending_seller.dart';

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
              margin: EdgeInsets.all(5),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TrendingSeller(trendingSellers: state.treadingSellers[0],),
                    SizedBox(height: 5,),
                    TrendingProducts(trendingProducts: state.treadingProducts[0],),
                    SizedBox(height: 5,),
                    ProductList(products: state.firstThreeProducts,),
                    SizedBox(height: 5,),
                    NewArrivals(newArrivals: state.newArrivals[0],),
                    SizedBox(height: 5,),
                    ProductList(products: state.secondThreeProducts,),
                    SizedBox(height: 5,),
                    NewShops(newShops: state.newShops[0],),
                    SizedBox(height: 5,),
                    ProductList(products: state.restOfTheProducts,),
                  ],
                ),
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
