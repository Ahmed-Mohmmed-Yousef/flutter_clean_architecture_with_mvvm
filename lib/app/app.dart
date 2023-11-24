import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp._internal();

  static final MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
