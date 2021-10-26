import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> imageList = [
    "https://i.imgur.com/zuG2bGQ.jpg",
    "https://i.imgur.com/ovr0NAF.jpg",
    "https://i.imgur.com/pSHXfuS.jpg",
    "https://i.imgur.com/3wQcZey.jpg",
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Image Slider Demo"),
        ),
        body: Container(
          child: CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: true,
            ),
            items: imageList
                .map((e) => ClipRRect(
                      // borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.network(
                            e,
                            width: 1000,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ),

      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
