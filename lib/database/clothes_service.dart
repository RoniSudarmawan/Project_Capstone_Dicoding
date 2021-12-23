import 'package:capstone_project/model/data_clothes_model.dart';
import 'package:capstone_project/model/list_clothes_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClothesService {
  final _clothesData = FirebaseFirestore.instance.collection('clothes');

  Future<List<ListClothes>> getListClothes() async {
    final snapshot = await _clothesData.get();
    List<ListClothes> _clothesList = [];

    for (var value in snapshot.docs) {
      final data = ListClothes.fromObject(value);
      _clothesList.add(data);
    }

    return _clothesList;
  }

  Future<List<ListClothes>> getListClothesSearch(String query) async {
    final filteredData = (await _clothesData.get()).docs.map((e) {
      if (e
          .data()['name']
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase())) {
        return e;
      }
    }).toList();

    List<ListClothes> _clothesList = [];

    for (var value in filteredData) {
      if (value != null) {
        final data = ListClothes.fromObject(value);
        _clothesList.add(data);
      }
    }

    return _clothesList;
  }

  Future<List<ListClothes>> getClothesByCategory(String category) async {
    final filteredData =
        (await _clothesData.where("category", isEqualTo: category).get());

    return filteredData.docs.map((e) => ListClothes.fromObject(e)).toList();
  }

  Future<List<ListClothes>> getListClothesByShopName(String shopName) async {
    final filteredData =
        (await _clothesData.where("shopName", isEqualTo: shopName).get());

    return filteredData.docs.map((e) => ListClothes.fromObject(e)).toList();
  }

  Future<List<ListClothes>> getListByNewestCreated() async {
    final filteredData =
        (await _clothesData.orderBy('createDate', descending: false).get());

    return filteredData.docs.map((e) => ListClothes.fromObject(e)).toList();
  }

  Future<DataClothes> getDetailData(String id) async {
    final snapshotData = await _clothesData.doc(id).get();
    final snapshotReview =
        await _clothesData.doc(id).collection("review").get();
    DataClothes _clothesDetail =
        DataClothes.fromObject(snapshotData, snapshotReview);
    return _clothesDetail;
  }
}
