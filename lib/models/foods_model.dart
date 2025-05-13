import 'dart:convert';

List<FoodsModel> foodsModelFromJson(String str) =>
    List<FoodsModel>.from(json.decode(str).map((x) => FoodsModel.fromJson(x)));

String foodsModelToJson(List<FoodsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodsModel {
  final String id;
  final String title;
  final List<String> foodTags;
  final List<String> foodType;
  final String code;
  final bool isAvailable;
  final String restaurant;
  final String ratingCount;
  final String rating;
  final String description;
  final List<Additive> additives;
  final List<String> imageUrl;
  final double price;
  final String category;
  final String time;

  FoodsModel({
    required this.id,
    required this.title,
    required this.foodTags,
    required this.foodType,
    required this.code,
    required this.isAvailable,
    required this.restaurant,
    required this.ratingCount,
    required this.rating,
    required this.description,
    required this.additives,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.time,
  });

  factory FoodsModel.fromJson(Map<String, dynamic> json) => FoodsModel(
    id: json["_id"] ?? "",
    title: json["title"] ?? "",
    foodTags:
        json["foodTags"] != null
            ? List<String>.from(json["foodTags"].map((x) => x.toString()))
            : [],
    foodType:
        json["foodType"] != null
            ? List<String>.from(json["foodType"].map((x) => x.toString()))
            : [],
    code: json["code"] ?? "",
    isAvailable: json["isAvailable"] ?? false,
    restaurant: json["restaurant"] ?? "",
    rating: json["rating"]?.toString() ?? "0",
    ratingCount: json["ratingCount"]?.toString() ?? "0",
    description: json["description"] ?? "",
    additives:
        json["additives"] != null
            ? List<Additive>.from(
              json["additives"].map((x) => Additive.fromJson(x)),
            )
            : [],
    imageUrl:
        json["imageUrl"] != null
            ? List<String>.from(json["imageUrl"].map((x) => x.toString()))
            : [],
    price:
        (json["price"] != null &&
                json["price"] is List &&
                json["price"].isNotEmpty)
            ? (json["price"][0] as num).toDouble()
            : 0.0,
    category: json["category"] ?? "",
    time: json["time"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "foodTags": List<dynamic>.from(foodTags.map((x) => x)),
    "foodType": List<dynamic>.from(foodType.map((x) => x)),
    "code": code,
    "isAvailable": isAvailable,
    "restaurant": restaurant,
    "ratingCount": ratingCount,
    "rating": rating,
    "description": description,
    "additives": List<dynamic>.from(additives.map((x) => x.toJson())),
    "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
    "price": [price],
    "category": category,
    "time": time,
  };
}

class Additive {
  final String id;
  final String title;
  final String price;

  Additive({required this.id, required this.title, required this.price});

  factory Additive.fromJson(Map<String, dynamic> json) => Additive(
    id: json["_id"] ?? "",
    title: json["title"] ?? "",
    price: json["price"]?.toString() ?? "0",
  );

  Map<String, dynamic> toJson() => {"_id": id, "title": title, "price": price};
}
