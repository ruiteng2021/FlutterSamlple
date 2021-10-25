import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kushapple/model/product_data.dart';
import 'package:kushapple/view/view_single_product.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

class VendorProduct extends StatefulWidget {
  final vendorImagePath, vendorDescription, vendorName, featured, vendorSlug;

  VendorProduct(
      {this.vendorImagePath,
      this.vendorDescription,
      this.vendorName,
      this.vendorSlug,
      this.featured});

  @override
  _VendorProductState createState() => _VendorProductState();
}

class _VendorProductState extends State<VendorProduct> {
  int currentPage = 1;

  late int totalPages = 0;

  List<Product> products = [];

  String vendorSlug = '';
  String vendorName = '';

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
    vendorSlug = super.widget.vendorSlug;
    vendorName = super.widget.vendorName;
  }

  Future<bool> getProductData({bool isRefresh = false}) async {
    print("Current Product Page: $currentPage");
    print("Total Product Pages: $totalPages");
    print("isRefresh(Product): $isRefresh");
    print("vendorName: $vendorName");

    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }
    // print("Product Slug: $(widget.vendorSlug)");

    final Uri uri = Uri.parse(
        "https://api.kushmapper.com/v1/vendors/slug/$vendorSlug/products?page_size=10&page=$currentPage");
    // "https://api.kushmapper.com/v1/vendors?page_size=10&page=$currentPage");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print("Product Page Url: $uri");
      final result = productDataFromJson(response.body);

      if (isRefresh) {
        products = result.data;
      } else {
        print(jsonEncode(result.data));
        products.addAll(result.data);
        print("products Length: ");
        print(products.length);
      }

      // print("passengers: ");
      // print(jsonEncode(result.data));

      currentPage++;

      totalPages = result.meta.total;

      // print(response.body);
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text(vendorName),
        backgroundColor: Colors.green[500], //elevation value of appbar
      ),
      body: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        onRefresh: () async {
          final result = await getProductData(isRefresh: true);
          if (result) {
            refreshController.refreshCompleted();
          } else {
            refreshController.refreshFailed();
          }
        },
        onLoading: () async {
          final result = await getProductData();
          if (result) {
            refreshController.loadComplete();
          } else {
            refreshController.loadFailed();
          }
        },
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ViewSingleProduct(productSlug: product.slug)));
              },
              child: Container(
                margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        width: 100,
                        height: 100,
                        child: Image.network(product.imageUrl),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: width,
                              child: Text(
                                product.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: width,
                              child: Text(
                                product.category,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
