import 'dart:convert';

VendorData vendorDataFromJson(String str) =>
    VendorData.fromJson(json.decode(str));

String vendorDataToJson(VendorData data) => json.encode(data.toJson());

class VendorData {
  VendorData({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<Vendor> data;
  Links links;
  Meta meta;

  factory VendorData.fromJson(Map<String, dynamic> json) => VendorData(
        data: List<Vendor>.from(json["data"].map((x) => Vendor.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
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
    required this.isClaimable,
    required this.stores,
    required this.serviceAreas,
    required this.updatedAt,
    required this.createdAt,
  });

  int id;
  String name;
  String slug;
  String? description;
  String logoUrl;
  String? specialOffers;
  String? email;
  String? phone;
  String? website;
  bool hasMailOrder;
  bool isFeatured;
  bool isClaimable;
  List<dynamic> stores;
  List<ServiceArea> serviceAreas;
  DateTime updatedAt;
  DateTime createdAt;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"] == null ? null : json["description"],
        logoUrl: json["logo_url"],
        specialOffers:
            json["special_offers"] == null ? null : json["special_offers"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        website: json["website"] == null ? null : json["website"],
        hasMailOrder: json["has_mail_order"],
        isFeatured: json["is_featured"],
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
        "description": description == null ? null : description,
        "logo_url": logoUrl,
        "special_offers": specialOffers == null ? null : specialOffers,
        "email": email == null ? null : phone,
        "phone": phone == null ? null : phone,
        "website": website == null ? null : website,
        "has_mail_order": hasMailOrder,
        "is_featured": isFeatured,
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
  String? lat;
  String? lng;

  factory ServiceArea.fromJson(Map<String, dynamic> json) => ServiceArea(
        id: json["id"],
        vendorId: json["vendor_id"],
        city: json["city"],
        citySlug: json["city_slug"],
        state: json["state"],
        country: json["country"],
        details: json["details"],
        lat: json["lat"] == null ? null : json["lat"],
        lng: json["lng"] == null ? null : json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "city": city,
        "city_slug": citySlug,
        "state": state,
        "country": country,
        "details": details,
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
      };
}

// enum Country { CANADA }

// final countryValues = EnumValues({"Canada": Country.CANADA});

// enum State { ON, AB, BC }

// final stateValues =
//     EnumValues({"AB": State.AB, "BC": State.BC, "ON": State.ON});

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  String first;
  String last;
  dynamic prev;
  String next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
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
  int from;
  int lastPage;
  List<Link> links;
  String path;
  String perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
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

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
