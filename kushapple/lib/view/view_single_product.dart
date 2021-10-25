import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kushapple/model/single_product.dart';

class ViewSingleProduct extends StatefulWidget {
  final productSlug;
  ViewSingleProduct({this.productSlug});

  @override
  _ViewSingleProductState createState() => _ViewSingleProductState();
}

class _ViewSingleProductState extends State<ViewSingleProduct> {
  // List<Vendor> vendors = [];
  late final SingleProduct singleProduct;
  @override
  void initState() {
    super.initState();
    String productSlug = super.widget.productSlug;
    getSingleProductData(productSlug);
  }

  Future<void> getSingleProductData(productSlug) async {
    final Uri uri =
        Uri.parse("https://api.kushmapper.com/v1/products/slug/$productSlug");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print("Url: $uri");
      final singleProduct = singleProductDataFromJson(response.body);
      // singleProduct = result.data;
      print(jsonEncode(singleProduct));
    } else {
      print("Request data fail!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      // appBar: AppBar(
      //   title: Text("Vendors near your location"),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Hero(
              tag: singleProduct.name,
              child: Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(singleProduct.imageUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Text(
              singleProduct.category,
              style: TextStyle(
                color: Color(0xFFCC8053),
                fontFamily: 'Varela',
                fontSize: 14.0,
              ),
            ),
            Text(
              singleProduct.description,
              style: TextStyle(
                color: Color(0xFFCC8053),
                fontFamily: 'Varela',
                fontSize: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
