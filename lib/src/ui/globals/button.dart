/* Developed by Eng Mouaz M Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:modern_calculator_flutter/src/ui/globals/app_colors.dart';
import 'package:modern_calculator_flutter/src/ui/globals/ui_helpers.dart';

class AppTheme {
  Widget unSelectedThemeButton(BuildContext context, Function func, IconData icon) =>
      SizedBox(
        width: screenWidth(context) * 0.2,
        height: screenHeight(context) * 0.08,
        child: TextButton(
          onPressed: () => func(),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Theme.of(context).secondaryHeaderColor),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          child: Icon(
            icon,
            color: Colors.grey[600],
            size: 30,
          ),
        ),
      );

  Widget selectedThemeButton(BuildContext context, Function func, IconData icon) =>
      SizedBox(
        width: screenWidth(context) * 0.2,
        height: screenHeight(context) * 0.08,
        child: TextButton(
          onPressed: () => func(),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )),
            foregroundColor: MaterialStateProperty.all(Theme.of(context).secondaryHeaderColor),
            backgroundColor: MaterialStateProperty.all(coralColor),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          child: Icon(
            icon,
            color: whiteColor,
            size: 30,
          ),
        ),
      );


  Widget calcButton(BuildContext context, Function func, String text) =>
      SizedBox(
        width: screenWidth(context) * 0.2,
        height: screenHeight(context) * 0.1,
        child: TextButton(
          onPressed: () => func(),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )),
            foregroundColor: MaterialStateProperty.all(Theme.of(context).secondaryHeaderColor),
            backgroundColor: MaterialStateProperty.all(Theme.of(context).cardColor),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).secondaryHeaderColor,
              fontSize: 25,
            ),
          ),
        ),
      );

  Widget mainCalcButton(BuildContext context, Function func, String text) =>
      SizedBox(
        width: screenWidth(context) * 0.2,
        height: screenHeight(context) * 0.1,
        child: TextButton(
          onPressed: () => func(),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )),
            foregroundColor: MaterialStateProperty.all(Theme.of(context).secondaryHeaderColor),
            backgroundColor: MaterialStateProperty.all(Theme.of(context).cardColor),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).backgroundColor,
              fontSize: 25,
            ),
          ),
        ),
      );

  Widget greenCalcButton(BuildContext context, Function func, String text) =>
      SizedBox(
        width: screenWidth(context) * 0.2,
        height: screenHeight(context) * 0.1,
        child: TextButton(
          onPressed: () => func(),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )),
            foregroundColor: MaterialStateProperty.all(Theme.of(context).secondaryHeaderColor),
            backgroundColor: MaterialStateProperty.all(Theme.of(context).cardColor),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              fontSize: 25,
            ),
          ),
        ),
      );

  Widget resultCalcButton(BuildContext context, Function func, String text) =>
      SizedBox(
        width: screenWidth(context) * 0.2,
        height: screenHeight(context) * 0.1,
        child: TextButton(
          onPressed: () => func(),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )),
            foregroundColor: MaterialStateProperty.all(Theme.of(context).secondaryHeaderColor),
            backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: whiteColor,
              fontSize: 25,
            ),
          ),
        ),
      );
}

