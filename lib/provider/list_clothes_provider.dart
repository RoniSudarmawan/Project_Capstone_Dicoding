import 'package:capstone_project/database/clothes_service.dart';
import 'package:capstone_project/helper/result_state.dart';
import 'package:capstone_project/model/list_clothes_model.dart';
import 'package:flutter/material.dart';

class ListClothesProvider extends ChangeNotifier {
  ClothesService clothesService;
  ListClothesProvider({required this.clothesService}) {
    _fetchAllData();
  }

  late ResultState _state;
  List<ListClothes> _listClothes = [];

  ResultState get state => _state;
  List<ListClothes> get listClothes => _listClothes;

  _fetchAllData() async {
    _state = ResultState.isLoading;
    notifyListeners();
    try {
      final snapshot = await clothesService.getListClothes();
      if (snapshot.isNotEmpty) {
        _listClothes = snapshot;
        _state = ResultState.hasData;
      } else {
        _state = ResultState.noData;
      }
    } catch (e) {
      print(e);
      _state = ResultState.isError;
    }
    notifyListeners();
  }

  searchClothes(String query) async {
    _state = ResultState.isLoading;
    notifyListeners();
    try {
      final snapshot = await clothesService.getListClothesSearch(query);
      if (snapshot.isNotEmpty) {
        _listClothes = snapshot;
        _state = ResultState.hasData;
      } else {
        _state = ResultState.noData;
      }
    } catch (e) {
      _state = ResultState.isError;
    }
    notifyListeners();
  }
}
