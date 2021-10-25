import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kushapple/model/vendor_data.dart';
import 'package:kushapple/view/vendor_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Vendors extends StatefulWidget {
  @override
  _VendorsState createState() => _VendorsState();
}

// class _VendorsState extends State<Vendors> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('hello vendors'),
//     );
//   }
// }

class _VendorsState extends State<Vendors> {
  int currentPage = 1;

  late int totalPages = 0;

  List<Vendor> vendors = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> getVendorData({bool isRefresh = false}) async {
    print("currentPage: $currentPage");
    print("totalPages: $totalPages");
    print("isRefresh: $isRefresh");
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }

    final Uri uri = Uri.parse(
        "https://api.kushmapper.com/v1/vendors?page_size=10&page=$currentPage");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print("Url: $uri");
      final result = vendorDataFromJson(response.body);

      if (isRefresh) {
        vendors = result.data;
      } else {
        print(jsonEncode(result.data));
        vendors.addAll(result.data);
        print("passengers Length: ");
        print(vendors.length);
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

  // @override
  // void initState() {
  //   super.initState();
  //   getPassengerData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      // appBar: AppBar(
      //   title: Text("Vendors near your location"),
      // ),
      body: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        onRefresh: () async {
          final result = await getVendorData(isRefresh: true);
          if (result) {
            refreshController.refreshCompleted();
          } else {
            refreshController.refreshFailed();
          }
        },
        onLoading: () async {
          final result = await getVendorData();
          if (result) {
            refreshController.loadComplete();
          } else {
            refreshController.loadFailed();
          }
        },
        child: GridView.builder(
          padding: EdgeInsets.all(20.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 2
                    : 3,
            childAspectRatio:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 0.8
                    : 0.9,
          ),
          itemBuilder: (context, index) {
            final vendor = vendors[index];
            return VendorCard(
              vendor: vendor,
            );
          },
          // separatorBuilder: (contex, indexc) => Divider(),
          itemCount: vendors.length,
        ),
      ),
    );
  }
}
