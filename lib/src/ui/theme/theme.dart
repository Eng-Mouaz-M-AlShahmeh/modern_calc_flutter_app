/* Developed by Eng Mouaz M Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:modern_calculator_flutter/src/ui/globals/app_colors.dart';

const String appName = 'Modern Flutter Calculator';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: appColor,
  cardColor: whiteColor,
  secondaryHeaderColor: greyColor,
  backgroundColor: blackColor,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: appColor,
  cardColor: coralColor,
  secondaryHeaderColor: greyColor,
  backgroundColor: whiteColor,
);
