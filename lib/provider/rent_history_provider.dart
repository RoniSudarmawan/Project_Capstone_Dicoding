import 'package:capstone_project/database/rent_service.dart';
import 'package:capstone_project/helper/result_state.dart';
import 'package:capstone_project/model/data_rent_history.dart';
import 'package:flutter/material.dart';

class RentHistoryProvider extends ChangeNotifier {
  RentService rentService;
  RentHistoryProvider({required this.rentService}) {
    _fetchRentData();
  }

  late ResultState _state;
  List<DataRentHistory> _listRent = [];

  ResultState get state => _state;
  List<DataRentHistory> get listRent => _listRent;

  Future<void> _fetchRentData() async {
    _state = ResultState.isLoading;
    notifyListeners();
    try {
      final snapshot = await rentService.getRentList();
      if (snapshot.isNotEmpty) {
        _listRent = snapshot;
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
}
