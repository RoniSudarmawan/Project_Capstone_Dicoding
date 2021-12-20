import 'package:cloud_firestore/cloud_firestore.dart';

class DataUser {
  DataUser({
    required this.name,
    required this.email,
    this.phone,
    this.address,
    required this.bornDate,
    required this.createDate,
    required this.updateDate,
    this.imageUrl,
  });

  final String name;
  final String email;
  final String? phone;
  final String? address;
  final Timestamp bornDate;
  final Timestamp createDate;
  final Timestamp updateDate;
  final String? imageUrl;

  factory DataUser.fromObject(DocumentSnapshot<Map<String, dynamic>> data) =>
      DataUser(
        name: data["name"],
        email: data["email"],
        phone: data["phone"],
        address: data["address"],
        bornDate: data["bornDate"],
        createDate: data["createdAt"],
        updateDate: data["updatedAt"],
        imageUrl: data["imageUrl"],
      );

  Map<String, dynamic> toObject() => {
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "bornDate": bornDate,
        "createdAt": createDate,
        "updatedAt": updateDate,
        "imageUrl": imageUrl,
      };
}
