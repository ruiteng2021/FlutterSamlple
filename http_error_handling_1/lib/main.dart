import 'package:http_error_handling_1/screens/detail_screen.dart';
import 'package:flutter/material.dart';

import 'screens/main_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(elevation: 0.0),
        primarySwatch: Colors.blue,
      ),
      initialRoute: MainScreen.routName,
      routes: {
        '/': (context) => MainScreen(),
        '/detail': (context) => DetailScreen(),
      },
    );
  }
}
