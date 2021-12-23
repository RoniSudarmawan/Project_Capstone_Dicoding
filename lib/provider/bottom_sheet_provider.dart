import 'package:flutter/material.dart';

class BottomSheetProvider extends ChangeNotifier {
  final int dataPrice;
  BottomSheetProvider({required this.dataPrice}) {
    _price = dataPrice;
  }

  String _size = "S";
  int _duration = 1;
  int _price = 0;

  int get duration => _duration;
  int get price => _price;
  String get size => _size;

  set setDuration(int value) {
    if (_duration + value > 0) {
      _duration += value;
      _price = dataPrice * _duration;
      print(_price);
    }
    notifyListeners();
  }

  set setSize(String dataSize) {
    _size = dataSize;
    notifyListeners();
  }
}
