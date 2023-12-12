import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_with_mvvm/resources/assets_manager.dart';
import 'package:flutter_clean_architecture_with_mvvm/resources/color_manager.dart';
import 'package:flutter_clean_architecture_with_mvvm/resources/constants_manager.dart';
import 'package:flutter_clean_architecture_with_mvvm/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  void _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  void _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoarding);
  }

  @override
  void initState() {
    super.initState();

    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image.asset(ImageAssets.splashLogo),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
