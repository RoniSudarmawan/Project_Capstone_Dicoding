import 'package:cloud_firestore/cloud_firestore.dart';

class DataClothes {
  DataClothes({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    this.productImageUrl,
    required this.shopName,
    required this.shopLocation,
    required this.createDate,
    required this.review,
  });

  late String id;
  late String name;
  late int price;
  late String description;
  late String category;
  late String? productImageUrl;
  late String shopName;
  late String shopLocation;
  late Timestamp createDate;
  late List<DataReview> review;

  DataClothes.fromObject(DocumentSnapshot<Map<String, dynamic>> data,
      QuerySnapshot<Map<String, dynamic>> reviewData) {
    id = data.id;
    name = data["name"];
    price = data["price"];
    category = data["category"];
    description = data["description"];
    productImageUrl = data["productImageUrl"];
    shopName = data["shopName"];
    shopLocation = data["shopLocation"];
    createDate = data["createDate"];
    review = reviewData.docs.map((e) => DataReview.fromObject(e)).toList();
  }

  Map<String, dynamic> toObject() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "productImageUrl": productImageUrl,
        "shopName": shopName,
        "shopLocation": shopLocation,
        "createDate": createDate,
        "dataClothes": List<dynamic>.from(review.map((x) => x.toObject())),
      };
}

class DataReview {
  DataReview({
    required this.reviewName,
    required this.reviewDate,
    required this.reviewContent,
  });

  final String reviewName;
  final Timestamp reviewDate;
  final String reviewContent;

  factory DataReview.fromObject(DocumentSnapshot<Map<String, dynamic>> data) =>
      DataReview(
        reviewName: data["reviewName"],
        reviewDate: data["reviewDate"],
        reviewContent: data["reviewContent"],
      );

  Map<String, dynamic> toObject() => {
        "reviewName": reviewName,
        "reviewDate": reviewDate,
        "reviewContent": reviewContent,
      };
}
