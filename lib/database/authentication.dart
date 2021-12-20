import 'package:capstone_project/model/data_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String?> signUp(
      String email, String password, String name, Timestamp bornDate) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await _inputUserData(
        userCredential.user!.uid,
        name,
        email,
        bornDate,
      );
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print(userCredential.user?.uid);
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<DataUser?> getUserDetail(String uid) async {
    final snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (snapshot.exists) {
      return DataUser.fromObject(snapshot);
    } else {
      return null;
    }
  }

  Future<String> userSignOut() async {
    await firebaseAuth.signOut();
    return 'User Log Out';
  }

  String? getUserId() {
    return firebaseAuth.currentUser?.uid;
  }

  Future<void> _inputUserData(
      String uId, String name, String email, Timestamp bornDate) async {
    final createDate = Timestamp.fromDate(DateTime.now());
    final updateDate = Timestamp.fromDate(DateTime.now());
    final userData = DataUser(
      name: name,
      email: email,
      bornDate: bornDate,
      createDate: createDate,
      updateDate: updateDate,
    );

    final firebase = FirebaseFirestore.instance.collection('users').doc(uId);
    await firebase.set(userData.toObject());
  }
}
