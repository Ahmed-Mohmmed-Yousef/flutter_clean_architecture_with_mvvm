import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_with_mvvm/presentation/color_manager.dart';

ThemeData get applicationTheme {
  return ThemeData(
    // main color
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,

    // card view theme

    // app bar theme

    // button theme

    // input decoration theme (text from field)
  );
}
