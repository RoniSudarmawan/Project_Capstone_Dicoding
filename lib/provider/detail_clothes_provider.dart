import 'package:capstone_project/database/clothes_service.dart';
import 'package:capstone_project/helper/result_state.dart';
import 'package:capstone_project/model/data_clothes_model.dart';
import 'package:flutter/material.dart';

class DetailClothesProvider extends ChangeNotifier {
  ClothesService clothesService;
  String clothesId;

  DetailClothesProvider(
      {required this.clothesService, required this.clothesId}) {
    _fetchDetailData();
  }

  late ResultState _state;
  late DataClothes _clothesData;

  ResultState get state => _state;
  DataClothes get clothesData => _clothesData;

  _fetchDetailData() async {
    _state = ResultState.isLoading;
    notifyListeners();
    try {
      final snapshot = await clothesService.getDetailData(clothesId);
      _clothesData = snapshot;
      print(snapshot);
      _state = ResultState.hasData;
    } catch (e) {
      _state = ResultState.isError;
    }
    notifyListeners();
  }
}
