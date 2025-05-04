import 'dart:convert';

List<Restaurantsmodel> restaurantsmodelFromJson(String str) =>
    List<Restaurantsmodel>.from(
      json.decode(str).map((x) => Restaurantsmodel.fromJson(x)),
    );

String restaurantsmodelToJson(List<Restaurantsmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Restaurantsmodel {
  String id;
  String title;
  String time;
  String imageUrl;
  List<dynamic> foods;
  bool pickup;
  bool delivery;
  bool isAvailable;
  String owner;
  String code;
  String logoUrl;
  int rating;
  String ratingCount;
  String verification;
  String verificationMessage;
  Coords coords;

  Restaurantsmodel({
    required this.id,
    required this.title,
    required this.time,
    required this.imageUrl,
    required this.foods,
    required this.pickup,
    required this.delivery,
    required this.isAvailable,
    required this.owner,
    required this.code,
    required this.logoUrl,
    required this.rating,
    required this.ratingCount,
    required this.verification,
    required this.verificationMessage,
    required this.coords,
  });

  factory Restaurantsmodel.fromJson(Map<String, dynamic> json) =>
      Restaurantsmodel(
        id: json["_id"],
        title: json["title"],
        time: json["time"],
        imageUrl: json["imageUrl"],
        foods: List<dynamic>.from(json["foods"].map((x) => x)),
        pickup: json["pickup"],
        delivery: json["delivery"],
        isAvailable: json["isAvailable"],
        owner: json["owner"],
        code: json["code"],
        logoUrl: json["logoUrl"],
        rating: json["rating"],
        ratingCount: json["ratingCount"],
        verification: json["verification"],
        verificationMessage: json["verificationMessage"],
        coords: Coords.fromJson(json["coords"]),
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "time": time,
    "imageUrl": imageUrl,
    "foods": List<dynamic>.from(foods.map((x) => x)),
    "pickup": pickup,
    "delivery": delivery,
    "isAvailable": isAvailable,
    "owner": owner,
    "code": code,
    "logoUrl": logoUrl,
    "rating": rating,
    "ratingCount": ratingCount,
    "verification": verification,
    "verificationMessage": verificationMessage,
    "coords": coords.toJson(),
  };
}

class Coords {
  String id;
  double latitude;
  double longitude;
  String address;
  String title;
  double latitudeDelta;
  double longitudeDelta;

  Coords({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.title,
    required this.latitudeDelta,
    required this.longitudeDelta,
  });

  factory Coords.fromJson(Map<String, dynamic> json) => Coords(
    id: json["id"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    address: json["address"],
    title: json["title"],
    latitudeDelta: json["latitudeDelta"]?.toDouble(),
    longitudeDelta: json["longitudeDelta"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "latitude": latitude,
    "longitude": longitude,
    "address": address,
    "title": title,
    "latitudeDelta": latitudeDelta,
    "longitudeDelta": longitudeDelta,
  };
}
