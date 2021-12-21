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

  Future<List<ListClothes>> getListDataSearch(String query) async {
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
}
