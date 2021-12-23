import 'package:cloud_firestore/cloud_firestore.dart';

class DataRent {
  DataRent({
    required this.clothesId,
    required this.userId,
    required this.size,
    required this.total,
    required this.rentDate,
    this.receiveDate,
  });

  final String clothesId;
  final String userId;
  final String size;
  final int total;
  final Timestamp rentDate;
  final Timestamp? receiveDate;

  factory DataRent.fromObject(DocumentSnapshot<Map<String, dynamic>> data) =>
      DataRent(
        clothesId: data["clothesId"],
        userId: data["userId"],
        size: data["size"],
        total: data["total"],
        rentDate: data["rentDate"],
        receiveDate: data["receiveDate"],
      );

  Map<String, dynamic> toObject() => {
        "clothesId": clothesId,
    "userId" : userId,
        "size": size,
        "total": total,
        "rentDate": rentDate,
        "receiveDate": receiveDate,
      };
}
