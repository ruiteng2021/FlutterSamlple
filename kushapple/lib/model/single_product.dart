// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SingleProductData singleProductDataFromJson(String str) =>
    SingleProductData.fromJson(json.decode(str));

String singleProductDataToJson(SingleProductData data) =>
    json.encode(data.toJson());

class SingleProductData {
  SingleProductData({
    required this.data,
  });

  SingleProduct data;

  factory SingleProductData.fromJson(Map<String, dynamic> json) =>
      SingleProductData(
        data: SingleProduct.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class SingleProduct {
  SingleProduct({
    required this.id,
    required this.vendorId,
    required this.name,
    required this.slug,
    required this.description,
    required this.category,
    required this.url,
    required this.imageUrl,
    required this.thc,
    required this.thcMin,
    required this.thcMax,
    required this.cbd,
    required this.cbdMin,
    required this.cbdMax,
    required this.price,
    required this.priceOz,
    required this.priceOzHalf,
    required this.priceOzFourth,
    required this.priceOzEighth,
    required this.priceGram,
    required this.vendor,
    required this.isVendorFeatured,
    required this.isFeatured,
    required this.isFeaturedMailOrder,
    required this.updatedAt,
  });

  int id;
  int vendorId;
  String name;
  String slug;
  String description;
  String category;
  dynamic url;
  String imageUrl;
  int thc;
  dynamic thcMin;
  dynamic thcMax;
  int cbd;
  dynamic cbdMin;
  dynamic cbdMax;
  dynamic price;
  int priceOz;
  int priceOzHalf;
  int priceOzFourth;
  int priceOzEighth;
  dynamic priceGram;
  Vendor vendor;
  bool isVendorFeatured;
  bool isFeatured;
  bool isFeaturedMailOrder;
  DateTime updatedAt;

  factory SingleProduct.fromJson(Map<String, dynamic> json) => SingleProduct(
        id: json["id"],
        vendorId: json["vendor_id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        category: json["category"],
        url: json["url"],
        imageUrl: json["image_url"],
        thc: json["thc"],
        thcMin: json["thc_min"],
        thcMax: json["thc_max"],
        cbd: json["cbd"],
        cbdMin: json["cbd_min"],
        cbdMax: json["cbd_max"],
        price: json["price"],
        priceOz: json["price_oz"],
        priceOzHalf: json["price_oz_half"],
        priceOzFourth: json["price_oz_fourth"],
        priceOzEighth: json["price_oz_eighth"],
        priceGram: json["price_gram"],
        vendor: Vendor.fromJson(json["vendor"]),
        isVendorFeatured: json["is_vendor_featured"],
        isFeatured: json["is_featured"],
        isFeaturedMailOrder: json["is_featured_mail_order"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "name": name,
        "slug": slug,
        "description": description,
        "category": category,
        "url": url,
        "image_url": imageUrl,
        "thc": thc,
        "thc_min": thcMin,
        "thc_max": thcMax,
        "cbd": cbd,
        "cbd_min": cbdMin,
        "cbd_max": cbdMax,
        "price": price,
        "price_oz": priceOz,
        "price_oz_half": priceOzHalf,
        "price_oz_fourth": priceOzFourth,
        "price_oz_eighth": priceOzEighth,
        "price_gram": priceGram,
        "vendor": vendor.toJson(),
        "is_vendor_featured": isVendorFeatured,
        "is_featured": isFeatured,
        "is_featured_mail_order": isFeaturedMailOrder,
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Vendor {
  Vendor({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.logoUrl,
    required this.specialOffers,
    required this.email,
    required this.phone,
    required this.website,
    required this.hasMailOrder,
    required this.isFeatured,
    required this.enableOrders,
    required this.isClaimable,
    required this.stores,
    required this.serviceAreas,
    required this.updatedAt,
    required this.createdAt,
  });

  int id;
  String name;
  String slug;
  String description;
  String logoUrl;
  dynamic specialOffers;
  String email;
  String phone;
  dynamic website;
  bool hasMailOrder;
  bool isFeatured;
  bool enableOrders;
  bool isClaimable;
  List<dynamic> stores;
  List<ServiceArea> serviceAreas;
  DateTime updatedAt;
  DateTime createdAt;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        logoUrl: json["logo_url"],
        specialOffers: json["special_offers"],
        email: json["email"],
        phone: json["phone"],
        website: json["website"],
        hasMailOrder: json["has_mail_order"],
        isFeatured: json["is_featured"],
        enableOrders: json["enable_orders"],
        isClaimable: json["is_claimable"],
        stores: List<dynamic>.from(json["stores"].map((x) => x)),
        serviceAreas: List<ServiceArea>.from(
            json["service_areas"].map((x) => ServiceArea.fromJson(x))),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "logo_url": logoUrl,
        "special_offers": specialOffers,
        "email": email,
        "phone": phone,
        "website": website,
        "has_mail_order": hasMailOrder,
        "is_featured": isFeatured,
        "enable_orders": enableOrders,
        "is_claimable": isClaimable,
        "stores": List<dynamic>.from(stores.map((x) => x)),
        "service_areas":
            List<dynamic>.from(serviceAreas.map((x) => x.toJson())),
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
      };
}

class ServiceArea {
  ServiceArea({
    required this.id,
    required this.vendorId,
    required this.city,
    required this.citySlug,
    required this.state,
    required this.country,
    required this.details,
    required this.lat,
    required this.lng,
  });

  int id;
  int vendorId;
  String city;
  String citySlug;
  String state;
  String country;
  dynamic details;
  String lat;
  String lng;

  factory ServiceArea.fromJson(Map<String, dynamic> json) => ServiceArea(
        id: json["id"],
        vendorId: json["vendor_id"],
        city: json["city"],
        citySlug: json["city_slug"],
        state: json["state"],
        country: json["country"],
        details: json["details"],
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "city": city,
        "city_slug": citySlug,
        "state": state,
        "country": country,
        "details": details,
        "lat": lat,
        "lng": lng,
      };
}
