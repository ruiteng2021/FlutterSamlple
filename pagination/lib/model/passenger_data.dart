// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

PassengersData passengersDataFromJson(String str) =>
    PassengersData.fromJson(json.decode(str));

String passengersDataToJson(PassengersData data) => json.encode(data.toJson());

class PassengersData {
  PassengersData({
    required this.totalPassengers,
    required this.totalPages,
    required this.data,
  });

  int totalPassengers;
  int totalPages;
  List<Passenger> data;

  factory PassengersData.fromJson(Map<String, dynamic> json) => PassengersData(
        totalPassengers: json["totalPassengers"],
        totalPages: json["totalPages"],
        data: List<Passenger>.from(
            json["data"].map((x) => Passenger.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalPassengers": totalPassengers,
        "totalPages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Passenger {
  Passenger({
    required this.id,
    required this.name,
    required this.trips,
    required this.airline,
    required this.v,
  });

  String id;
  String name;
  int trips;
  List<Airline> airline;
  int v;

  factory Passenger.fromJson(Map<String, dynamic> json) => Passenger(
        id: json["_id"],
        name: json["name"],
        trips: json["trips"] ?? 0,
        airline:
            List<Airline>.from(json["airline"].map((x) => Airline.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "trips": trips,
        "airline": List<dynamic>.from(airline.map((x) => x.toJson())),
        "__v": v,
      };
}

class Airline {
  Airline({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.slogan,
    required this.headQuaters,
    required this.website,
    required this.established,
  });

  int id;
  String name;
  String country;
  String logo;
  String slogan;
  String headQuaters;
  String website;
  String established;

  factory Airline.fromJson(Map<String, dynamic> json) => Airline(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        slogan: json["slogan"],
        headQuaters: json["head_quaters"],
        website: json["website"],
        established: json["established"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "slogan": slogan,
        "head_quaters": headQuaters,
        "website": website,
        "established": established,
      };
}

// enum Country { TAIWAN, THAILAND }

// final countryValues =
//     EnumValues({"Taiwan": Country.TAIWAN, "Thailand": Country.THAILAND});

// enum HeadQuaters {
//   THE_376_HSIN_NAN_RD_SEC_1_LUZHU_TAOYUAN_CITY_TAIWAN,
//   JOM_PHOL_SUBDISTRICT_CHATUCHAK_BANGKOK_THAILAND
// }

// final headQuatersValues = EnumValues({
//   "Jom Phol Subdistrict, Chatuchak, Bangkok, Thailand":
//       HeadQuaters.JOM_PHOL_SUBDISTRICT_CHATUCHAK_BANGKOK_THAILAND,
//   "376, Hsin-Nan Rd., Sec. 1, Luzhu, Taoyuan City, Taiwan":
//       HeadQuaters.THE_376_HSIN_NAN_RD_SEC_1_LUZHU_TAOYUAN_CITY_TAIWAN
// });

// enum AirlineName { EVA_AIR, THAI_AIRWAYS }

// final airlineNameValues = EnumValues(
//     {"Eva Air": AirlineName.EVA_AIR, "Thai Airways": AirlineName.THAI_AIRWAYS});

// enum Slogan { SHARING_THE_WORLD_FLYING_TOGETHER, SMOOTH_AS_SILK_I_FLY_THAI }

// final sloganValues = EnumValues({
//   "Sharing the World, Flying Together":
//       Slogan.SHARING_THE_WORLD_FLYING_TOGETHER,
//   "Smooth as Silk / I Fly THAI": Slogan.SMOOTH_AS_SILK_I_FLY_THAI
// });

// enum Website { WWW_EVAAIR_COM, WWW_THAIAIRWAYS_COM }

// final websiteValues = EnumValues({
//   "www.evaair.com": Website.WWW_EVAAIR_COM,
//   "www.thaiairways.com": Website.WWW_THAIAIRWAYS_COM
// });

// enum PassengerName { JOHN_DOE, ALICE_PRINCE }

// final PassengerNameValues = EnumValues({
//   "Alice Prince": PassengerName.ALICE_PRINCE,
//   "John Doe": PassengerName.JOHN_DOE
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
