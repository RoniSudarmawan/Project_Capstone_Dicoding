import 'package:capstone_project/database/clothes_service.dart';
import 'package:capstone_project/helper/result_state.dart';
import 'package:capstone_project/model/data_clothes_model.dart';
import 'package:capstone_project/model/list_clothes_model.dart';
import 'package:flutter/material.dart';

class DetailClothesProvider extends ChangeNotifier {
  ClothesService clothesService;
  String clothesId;
  DetailClothesProvider({
    required this.clothesService,
    required this.clothesId,
  }) {
    _fetchDetailData();
  }

  late ResultState _state;
  late DataClothes _clothesData;
  List<ListClothes> _listClothes = [];

  ResultState get state => _state;
  DataClothes get clothesData => _clothesData;
  List<ListClothes> get listClothes => _listClothes;

  _fetchDetailData() async {
    _state = ResultState.isLoading;
    notifyListeners();
    try {
      final snapshot = await clothesService.getDetailData(clothesId);
      _clothesData = snapshot;
      sameShopClothes();
      _state = ResultState.hasData;
    } catch (e) {
      _state = ResultState.isError;
    }
    notifyListeners();
  }

  sameShopClothes() async {
    _state = ResultState.isLoading;
    notifyListeners();
    try {
      final snapshot =
          await clothesService.getListClothesByShopName(_clothesData.shopName);
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
