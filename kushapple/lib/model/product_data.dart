// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductData productDataFromJson(String str) =>
    ProductData.fromJson(json.decode(str));

String productDataToJson(ProductData data) => json.encode(data.toJson());

class ProductData {
  ProductData({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<Product> data;
  Links links;
  Meta meta;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class Product {
  Product({
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
    required this.isVendorFeatured,
    required this.isFeatured,
    required this.isFeaturedMailOrder,
    required this.updatedAt,
  });

  int id;
  int vendorId;
  String name;
  String slug;
  String? description;
  String category;
  String? url;
  String imageUrl;
  dynamic thc;
  dynamic thcMin;
  dynamic thcMax;
  dynamic cbd;
  dynamic cbdMin;
  dynamic cbdMax;
  dynamic price;
  int? priceOz;
  int? priceOzHalf;
  int? priceOzFourth;
  dynamic priceOzEighth;
  dynamic priceGram;
  bool isVendorFeatured;
  bool isFeatured;
  bool isFeaturedMailOrder;
  DateTime updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        vendorId: json["vendor_id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"] == null ? null : json["description"],
        category: json["category"],
        url: json["url"] == null ? null : json["url"],
        imageUrl: json["image_url"],
        thc: json["thc"],
        thcMin: json["thc_min"],
        thcMax: json["thc_max"],
        cbd: json["cbd"],
        cbdMin: json["cbd_min"],
        cbdMax: json["cbd_max"],
        price: json["price"] == 0 ? 0 : json["price"],
        priceOz: json["price_oz"] == 0 ? 0 : json["price_oz"],
        priceOzHalf: json["price_oz_half"] == 0 ? 0 : json["price_oz_half"],
        priceOzFourth:
            json["price_oz_fourth"] == 0 ? 0 : json["price_oz_fourth"],
        priceOzEighth: json["price_oz_eighth"],
        // priceGram: json["price_gram"] == 0.0 ? 0.0 : json["price_gram"],
        priceGram: json["price_gram"],
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
        "description": description == null ? null : description,
        "category": category,
        "url": url == null ? null : description,
        "image_url": imageUrl,
        "thc": thc,
        "thc_min": thcMin,
        "thc_max": thcMax,
        "cbd": cbd,
        "cbd_min": cbdMin,
        "cbd_max": cbdMax,
        "price": price == 0 ? 0 : price,
        "price_oz": priceOz == 0 ? 0 : priceOz,
        "price_oz_half": priceOzHalf == 0 ? 0 : priceOzHalf,
        "price_oz_fourth": priceOzFourth == 0 ? 0 : priceOzFourth,
        "price_oz_eighth": priceOzEighth,
        // "price_gram": priceGram == 0.0 ? 0.0 : priceGram,
        "price_gram": priceGram,
        "is_vendor_featured": isVendorFeatured,
        "is_featured": isFeatured,
        "is_featured_mail_order": isFeaturedMailOrder,
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  String? first;
  String? last;
  String? prev;
  String? next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"] == null ? null : json["first"],
        last: json["last"] == null ? null : json["last"],
        prev: json["prev"] == null ? null : json["prev"],
        next: json["next"] == null ? null : json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first == null ? null : first,
        "last": last == null ? null : last,
        "prev": prev == null ? null : prev,
        "next": next == null ? null : next,
      };
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  int currentPage;
  int? from;
  int lastPage;
  List<Link> links;
  String path;
  String perPage;
  int? to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"] == 0 ? 0 : json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"] == 0 ? 0 : json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from == 0 ? 0 : from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to == 0 ? 0 : to,
        "total": total,
      };
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  String? url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}
