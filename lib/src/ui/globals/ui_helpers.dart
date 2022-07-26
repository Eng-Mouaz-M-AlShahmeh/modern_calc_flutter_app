/* Developed by Eng Mouaz M Al-Shahmeh */
import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;

    _safeAreaHorizontal =
        _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical =
        _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!) / 100;
    safeBlockVertical = (screenHeight! - _safeAreaVertical!) / 100;

    blockSizeHorizontal = (screenWidth! - _safeAreaHorizontal!) / 100;
    blockSizeVertical = (screenHeight! - _safeAreaVertical!) / 100;
  }
}

double screenWidth(BuildContext context) {
  SizeConfig().init(context);
  return SizeConfig.screenWidth!;
}

double screenHeight(BuildContext context) {
  SizeConfig().init(context);
  return SizeConfig.screenHeight!;
}

double blockSizeHorizontal(BuildContext context) {
  SizeConfig().init(context);
  return SizeConfig.blockSizeHorizontal!;
}

double blockSizeVertical(BuildContext context) {
  SizeConfig().init(context);
  return SizeConfig.blockSizeVertical!;
}

Widget verticalSpaceSmall(BuildContext context) {
  return SizedBox(
    height: blockSizeHorizontal(context) * 5,
  );
}

Widget verticalSpaceMedium(BuildContext context) {
  return SizedBox(
    height: blockSizeHorizontal(context) * 10,
  );
}

Widget verticalSpaceLarge(BuildContext context) {
  return SizedBox(
    height: blockSizeHorizontal(context) * 15,
  );
}

Widget horizontalSpaceSmall(BuildContext context) {
  return SizedBox(
    width: blockSizeHorizontal(context) * 5,
  );
}

Widget horizontalSpaceMedium(BuildContext context) {
  return SizedBox(
    width: blockSizeHorizontal(context) * 10,
  );
}

Widget horizontalSpaceLarge(BuildContext context) {
  return SizedBox(
    width: blockSizeHorizontal(context) * 15,
  );
}