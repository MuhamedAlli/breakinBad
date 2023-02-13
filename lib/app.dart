import 'package:braeking_bad/presentation/routes_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyApp._internal(); //named constructor

  static final MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: ThemeData(),
    );
  }
}
