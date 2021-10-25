import 'package:flutter/material.dart';
import 'package:kushapple/model/vendor_data.dart';
import 'package:kushapple/view/vendor_product.dart';

class VendorCard extends StatelessWidget {
  final Vendor vendor;
  VendorCard({
    required this.vendor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width - 30.0,
      // height: MediaQuery.of(context).size.height - 20.0,

      child: _buildCard(vendor, context),
    );
  }
}

Widget _buildCard(Vendor vendor, context) {
  return Padding(
    padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => VendorProduct(
                  vendorSlug: vendor.slug,
                  vendorImagePath: vendor.logoUrl,
                  vendorDescription: vendor.description ?? "",
                  vendorName: vendor.name,
                  featured: vendor.isFeatured,
                )));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0)
            ],
            color: Colors.white),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  vendor.isFeatured
                      ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                      : Icon(Icons.favorite_border, color: Color(0xFFEF7532))
                ])),
            Hero(
              tag: vendor.logoUrl,
              child: Container(
                height: 74.0,
                width: 74.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(vendor.logoUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              "price",
              style: TextStyle(
                color: Color(0xFFCC8053),
                fontFamily: 'Varela',
                fontSize: 14.0,
              ),
            ),
            Text(
              vendor.name,
              style: TextStyle(
                color: Color(0xFF575E67),
                fontFamily: 'Varela',
                fontSize: 14.0,
              ),
            ),
            // Padding(
            //     padding: EdgeInsets.all(8.0),
            //     child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
            // Padding(
            //   padding: EdgeInsets.only(left: 5.0, right: 5.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       if (!added) ...[
            //         Icon(Icons.shopping_basket,
            //             color: Color(0xFFD17E50), size: 12.0),
            //         Text('Add to cart',
            //             style: TextStyle(
            //                 fontFamily: 'Varela',
            //                 color: Color(0xFFD17E50),
            //                 fontSize: 12.0))
            //       ],
            //       if (added) ...[
            //         Icon(Icons.remove_circle_outline,
            //             color: Color(0xFFD17E50), size: 12.0),
            //         Text('3',
            //             style: TextStyle(
            //                 fontFamily: 'Varela',
            //                 color: Color(0xFFD17E50),
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 12.0)),
            //         Icon(Icons.add_circle_outline,
            //             color: Color(0xFFD17E50), size: 12.0),
            //       ],
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    ),
  );
}
