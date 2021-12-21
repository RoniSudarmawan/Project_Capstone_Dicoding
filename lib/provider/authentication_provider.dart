import 'package:capstone_project/database/authentication.dart';
import 'package:capstone_project/helper/result_state.dart';
import 'package:capstone_project/model/data_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  Authentication service;

  AuthenticationProvider({required this.service}) {
    _checkAuthentication();
  }

  late bool _isSignIn;
  late ResultState _state;
  late DataUser _user;
  late String _name;

  bool get isSignIn => _isSignIn;
  ResultState get state => _state;
  DataUser get user => _user;
  String? get name => _name;

  _checkAuthentication() async {
    _state = ResultState.isLoading;
    notifyListeners();
    final user = service.getUserId();
    if (user == null) {
      _isSignIn = false;
    } else {
      _isSignIn = true;
    }
    _state = ResultState.isSuccess;
    notifyListeners();
  }

  signOut() async {
    await service.userSignOut();
    _isSignIn = !_isSignIn;
    notifyListeners();
  }

  Future<void> login(String email, String pass) async {
    final result = await service.login(email, pass);
    if (result != null) {
      _isSignIn = true;
      notifyListeners();
    } else {
      _isSignIn = false;
      notifyListeners();
    }
  }

  Future<void> signUp(
      String email, String pass, String name, DateTime bornDate) async {
    Timestamp bornDateTs = Timestamp.fromDate(bornDate);
    final result = await service.signUp(email, pass, name, bornDateTs);
    if (result != null) {
      _isSignIn = true;
      notifyListeners();
    } else {
      _isSignIn = false;
      notifyListeners();
    }
  }

  Future<void> _getUser() async {
    final user = await service.getUserDetail(service.getUserId()!);
    _user = user!;
    final userName = user.name.split(" ").map((e) => e).toList();
    if (userName.elementAt(0).length > 2) {
      _name = userName.elementAt(0);
    } else {
      _name = userName.elementAt(1);
    }
  }
}
