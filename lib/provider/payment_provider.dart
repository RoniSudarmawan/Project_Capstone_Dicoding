import 'package:capstone_project/database/authentication.dart';
import 'package:capstone_project/database/rent_service.dart';
import 'package:flutter/cupertino.dart';

class PaymentProvider extends ChangeNotifier {
  RentService rentService;
  PaymentProvider({required this.rentService});

  Future<void> addRentData(
      String clothesId, String size, int duration, int total) async {
    final result = await rentService.addRent(
        Authentication().getUserId()!, clothesId, size, duration, total);
  }
}
