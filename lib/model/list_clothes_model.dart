import 'package:cloud_firestore/cloud_firestore.dart';

class ListClothes {
  late String id;
  late String name;
  late int price;
  late String category;
  late String description;
  late String? productImageUrl;
  late String shopName;
  late String shopLocation;
  late Timestamp createDate;

  ListClothes.fromObject(QueryDocumentSnapshot<Map<String, dynamic>> data) {
    id = data["id"];
    name = data["name"];
    price = data["price"];
    category = data["category"];
    description = data["description"];
    productImageUrl = data["productImageUrl"];
    shopName = data["shopName"];
    shopLocation = data["shopLocation"];
    createDate = data["createDate"];
  }
}
