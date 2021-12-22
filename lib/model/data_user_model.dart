import 'package:cloud_firestore/cloud_firestore.dart';

class DataUser {
  DataUser({
    required this.name,
    required this.email,
    this.phoneNumber,
    this.address,
    this.bornDate,
    required this.createDate,
    required this.updateDate,
    this.imageUrl,
  });

  final String name;
  final String email;
  final String? phoneNumber;
  final String? address;
  final Timestamp? bornDate;
  final Timestamp createDate;
  final Timestamp updateDate;
  final String? imageUrl;

  factory DataUser.fromObject(DocumentSnapshot<Map<String, dynamic>> data) =>
      DataUser(
        name: data["name"],
        email: data["email"],
        phoneNumber: data["phoneNumber"],
        address: data["address"],
        bornDate: data["bornDate"],
        createDate: data["createDate"],
        updateDate: data["updateDate"],
        imageUrl: data["imageUrl"],
      );

  Map<String, dynamic> toObject() => {
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "address": address,
        "bornDate": bornDate,
        "createDate": createDate,
        "updateDate": updateDate,
        "imageUrl": imageUrl,
      };
}
