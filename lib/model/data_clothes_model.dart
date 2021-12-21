import 'package:cloud_firestore/cloud_firestore.dart';

class DataClothes {
  DataClothes({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    this.productImageUrl,
    required this.createDate,
    required this.review,
  });

  late String id;
  late String name;
  late String price;
  late String description;
  late String? productImageUrl;
  late Timestamp createDate;
  late List<DataReview> review;

  DataClothes.fromObject(DocumentSnapshot<Map<String, dynamic>> data,
      QuerySnapshot<Map<String, dynamic>> reviewData) {
    id = data["id"];
    name = data["name"];
    price = data["price"];
    description = data["description"];
    productImageUrl = data["productImageUrl"];
    createDate = data["createdAt"];
    review = reviewData.docs.map((e) => DataReview.fromObject(e)).toList();
  }

  Map<String, dynamic> toObject() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "productImageUrl": productImageUrl,
        "createdDate": createDate,
        "dataClothes": List<dynamic>.from(review.map((x) => x.toObject())),
      };
}

class DataReview {
  DataReview({
    required this.reviewName,
    required this.reviewDate,
    required this.reviewContent,
    this.shopImageUrl,
  });

  final String reviewName;
  final String reviewDate;
  final String reviewContent;
  final String? shopImageUrl;

  factory DataReview.fromObject(DocumentSnapshot<Map<String, dynamic>> data) =>
      DataReview(
        reviewName: data["reviewName"],
        reviewDate: data["reviewDate"],
        reviewContent: data["reviewContent"],
        shopImageUrl: data["shopImageUrl"],
      );

  Map<String, dynamic> toObject() => {
        "reviewName": reviewName,
        "reviewDate": reviewDate,
        "reviewContent": reviewContent,
        "shopImageUrl": shopImageUrl,
      };
}
