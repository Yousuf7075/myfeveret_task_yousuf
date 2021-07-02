import 'package:flutter/material.dart';
import 'package:myfeveret_task_yousuf/bloc/home_bloc.dart';
import 'package:myfeveret_task_yousuf/repository/home_repository.dart';
import 'package:myfeveret_task_yousuf/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (context) => HomeBloc(repository: HomeRepository())),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myfeveret task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/homeScreen',

      //-----------all routes----------
      routes: {
        '/homeScreen': (_) => HomeScreen(),
      },
    );
  }
}
