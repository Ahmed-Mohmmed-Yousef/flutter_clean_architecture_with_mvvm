import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_with_mvvm/presentation/theme_manager.dart';

class MyApp extends StatelessWidget {
  MyApp._internal();

  static final MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: applicationTheme,
    );
  }
}
