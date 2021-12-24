import 'package:capstone_project/model/data_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    } on FirebaseAuthException {
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
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        final user = userCredential.user;
        _inputUserDataWithoutBornDate(
            user!.uid, user.displayName!, user.email!);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          print(e.code);
        } else if (e.code == 'invalid-credential') {
          print(e.code);
        }
      } catch (e) {
        print(e);
      }
    }

    return user;
  }

  Future<DataUser> getUserDetail(String uid) async {
    final snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return DataUser.fromObject(snapshot);
  }

  Future<User?> userSignOut() async {
    await firebaseAuth.signOut();
  }

  String? getUserId() {
    return firebaseAuth.currentUser?.uid;
  }

  Future<void> _inputUserData(
      String uId, String name, String email, Timestamp? bornDate) async {
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

  Future<void> _inputUserDataWithoutBornDate(
      String uId, String name, String email) async {
    final createDate = Timestamp.fromDate(DateTime.now());
    final updateDate = Timestamp.fromDate(DateTime.now());
    final userData = DataUser(
      name: name,
      email: email,
      createDate: createDate,
      updateDate: updateDate,
    );

    final firebase = FirebaseFirestore.instance.collection('users').doc(uId);
    await firebase.set(userData.toObject());
  }

  Future<String> updateUserData(String uId, String name, String phoneNumber,
      String address, Timestamp bornDate) async {
    final dateNow = Timestamp.fromDate(DateTime.now());

    final Map<String, dynamic> userData = {
      "name": name,
      "phoneNumber": phoneNumber,
      "address": address,
      "bornDate": bornDate,
      "updatedAt": dateNow,
    };

    final firebase = FirebaseFirestore.instance.collection('users').doc(uId);
    await firebase.update(userData);
    return "success";
  }
}
