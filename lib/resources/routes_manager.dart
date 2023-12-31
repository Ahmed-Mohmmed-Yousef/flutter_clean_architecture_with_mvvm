import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_with_mvvm/presentation/forget_password/forget_password.dart';
import 'package:flutter_clean_architecture_with_mvvm/presentation/login/login_view.dart';
import 'package:flutter_clean_architecture_with_mvvm/presentation/main/main_view.dart';
import 'package:flutter_clean_architecture_with_mvvm/presentation/onboarding/onboarding.dart';
import 'package:flutter_clean_architecture_with_mvvm/presentation/register/register_view.dart';
import 'package:flutter_clean_architecture_with_mvvm/resources/strings_manager.dart';
import 'package:flutter_clean_architecture_with_mvvm/presentation/splash/splash_view.dart';
import 'package:flutter_clean_architecture_with_mvvm/presentation/store_details/store_details_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoarding = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
          ), // todo move this string to strings manager
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ), // todo move this string to strings manager
      ),
    );
  }
}
