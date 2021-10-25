import 'package:flutter/material.dart';
import 'package:kushapple/view/home.dart';
import 'package:kushapple/view/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      '/': (context) => Loading(),
      'home': (context) => Home(),
    },
  ));
}
