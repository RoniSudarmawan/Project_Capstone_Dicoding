import 'package:cloud_firestore/cloud_firestore.dart';

class DataRentHistory {
  DataRentHistory({
    required this.clothesId,
    required this.userId,
    required this.clothesName,
    this.productImageUrl,
    required this.size,
    required this.total,
    required this.rentDate,
    this.receiveDate,
  });

  final String clothesId;
  final String clothesName;
  final String? productImageUrl;
  final String userId;
  final String size;
  final int total;
  final Timestamp rentDate;
  final Timestamp? receiveDate;

  factory DataRentHistory.fromObject(
          DocumentSnapshot<Map<String, dynamic>> data,
          DocumentSnapshot<Map<String, dynamic>> clothes) =>
      DataRentHistory(
        clothesId: data["clothesId"],
        clothesName: clothes["name"],
        productImageUrl: clothes['productImageUrl'],
        userId: data["userId"],
        size: data["size"],
        total: data["total"],
        rentDate: data["rentDate"],
        receiveDate: data["receiveDate"],
      );

  Map<String, dynamic> toObject() => {
        "clothesId": clothesId,
        "userId": userId,
        "name": clothesName,
        "productImageUrl": productImageUrl,
        "size": size,
        "total": total,
        "rentDate": rentDate,
        "receiveDate": receiveDate,
      };
}
