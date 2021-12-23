import 'package:capstone_project/database/clothes_service.dart';
import 'package:capstone_project/helper/result_state.dart';
import 'package:capstone_project/model/list_clothes_model.dart';
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  ClothesService clothesService;
  HomePageProvider({required this.clothesService}) {
    _newestClothes();
    _recommendedClothes();
  }

  late ResultState _state;
  List<ListClothes> _listNewestClothes = [];
  List<ListClothes> _listClothesRecommended = [];

  ResultState get state => _state;
  List<ListClothes> get listNewestClothes => _listNewestClothes;
  List<ListClothes> get listClothesRecommended => _listClothesRecommended;

  _newestClothes() async {
    _state = ResultState.isLoading;
    notifyListeners();
    try {
      final snapshot = await clothesService.getListByNewestCreated();
      if (snapshot.isNotEmpty) {
        _listNewestClothes = snapshot;
        _state = ResultState.hasData;
      } else {
        _state = ResultState.noData;
      }
    } catch (e) {
      _state = ResultState.isError;
    }
    notifyListeners();
  }

  _recommendedClothes() async {
    _state = ResultState.isLoading;
    notifyListeners();
    try {
      final snapshot = await clothesService.getClothesByCategory("jas");
      if (snapshot.isNotEmpty) {
        _listClothesRecommended = snapshot;
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
