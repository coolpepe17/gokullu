import 'package:flutter/material.dart';
import 'package:gokullu/constant.dart';
import 'package:gokullu/screen/splash/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Kullu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: mBackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Colors.purple,
          accentColor: Colors.purple,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.purple,
            selectionColor: Colors.purple,
            selectionHandleColor: Colors.purple,
          )),
      home: SplashScreen(),
    );
  }
}
