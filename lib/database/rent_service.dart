import 'package:capstone_project/database/authentication.dart';
import 'package:capstone_project/model/data_rent_history.dart';
import 'package:capstone_project/model/data_rent_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RentService {
  final _rentData = FirebaseFirestore.instance.collection('rents');
  final _clothesData = FirebaseFirestore.instance.collection('clothes');

  Future<List<DataRentHistory>> getRentList() async {
    final rentData = (await _rentData
        .where("userId", isEqualTo: Authentication().getUserId())
        .get());
    List<DataRentHistory> dataRentHistory = [];
    for (var items in rentData.docs) {
      final clothesData = await _clothesData.doc(items["clothesId"]).get();
      dataRentHistory.add(DataRentHistory.fromObject(items, clothesData));
    }
    return dataRentHistory;
  }

  Future<void> addRent(
    String userId,
    String clothesId,
    String size,
    int duration,
    int total,
  ) async {
    final rentDate = Timestamp.fromDate(DateTime.now());
    final rentData = DataRent(
        userId: userId,
        clothesId: clothesId,
        size: size,
        total: total,
        rentDate: rentDate);
    await FirebaseFirestore.instance
        .collection('rents')
        .add(rentData.toObject());
  }
}
