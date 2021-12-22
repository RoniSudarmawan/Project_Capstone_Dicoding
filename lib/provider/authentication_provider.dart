import 'package:capstone_project/database/authentication.dart';
import 'package:capstone_project/helper/result_state.dart';
import 'package:capstone_project/model/data_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationProvider extends ChangeNotifier {
  Authentication service;

  AuthenticationProvider({required this.service}) {
    _checkAuthentication();
  }

  final googleSignIn = GoogleSignIn();
  late bool _isSignIn;
  late ResultState _state;
  late DataUser _user;
  late String _name;
  GoogleSignInAccount? _googleUser;

  bool get isSignIn => _isSignIn;

  ResultState get state => _state;

  DataUser get user => _user;

  String? get name => _name;

  GoogleSignInAccount get googleUser => _googleUser!;

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

  Future googleLogin() async {
    final googleUserData = await googleSignIn.signIn();
    if (googleUserData == null) return;
    _googleUser = googleUserData;
    notifyListeners();

    final googleAuth = await googleUserData.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential);

    _getUserDetail();
    notifyListeners();
  }

  Future<void> login(String email, String pass) async {
    final result = await service.login(email, pass);
    if (result != null) {
      _isSignIn = true;
      _getUserDetail();
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

  Future<void> _getUserDetail() async {
    final user = await service.getUserDetail(service.getUserId()!);
    _user = user;
    _state = ResultState.hasData;
    final userName = user.name.split(" ").map((e) => e).toList();
    if (userName.elementAt(0).length > 2) {
      _name = userName.elementAt(0);
    } else {
      _name = userName.elementAt(1);
    }
  }

  Future<void> updateDataUser(String name, String phoneNumber, String address,
      Timestamp bornDate) async {
    await service.updateUserData(
        service.getUserId()!, name, phoneNumber, address, bornDate);
    _getUserDetail();
    _state = ResultState.isSuccess;
  }
}
