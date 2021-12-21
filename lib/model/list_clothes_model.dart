import 'package:cloud_firestore/cloud_firestore.dart';

class ListClothes {
  late String id;
  late String name;
  late String price;
  late String description;
  late String? productImageUrl;
  late Timestamp createDate;

  ListClothes.fromObject(dynamic data) {
    id = data["id"];
    name = data["name"];
    price = data["price"];
    description = data["description"];
    productImageUrl = data["productImageUrl"];
    createDate = data["createdAt"];
  }
}
