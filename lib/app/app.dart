import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_with_mvvm/resources/routes_manager.dart';
import 'package:flutter_clean_architecture_with_mvvm/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: applicationTheme,
    );
  }
}
