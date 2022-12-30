import 'package:flutter/material.dart';

import 'home/homeScreen.dart';
import 'myTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        homeScreen.routeName: (context) => homeScreen(),
      },
      initialRoute: homeScreen.routeName,
      theme: MyTheme.lightTheme,
    );
  }
}


