import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 200.0,
            width: double.infinity,
            child: Carousel(
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotColor: Colors.lightGreenAccent,
              indicatorBgPadding: 5.0,
              images: [
                InkWell(
                  onTap: () {
                    print("slider1 XXXX");
                  },
                  child: Image.asset(
                    'assets/1.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("slider2 XXXX");
                  },
                  child: Image.asset(
                    'assets/2.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("slider3 XXXX");
                  },
                  child: Image.asset(
                    'assets/3.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
