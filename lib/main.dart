/* Developed by Eng Mouaz M Al-Shahmeh
* UI Design was token from Asia Kustrzyńska on Dribbble: https://dribbble.com/shots/18777352-Calculator-App
* */
import 'package:flutter/material.dart';
import 'package:modern_calculator_flutter/src/state/app_provider.dart';
import 'package:modern_calculator_flutter/src/ui/screens/home.dart';
import 'package:modern_calculator_flutter/src/ui/theme/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppStateNotifier>(
          create: (context) => AppStateNotifier(),
        ),
      ],
      child: Consumer<AppStateNotifier>(
        builder: (context, app, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: appName,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: app.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}
