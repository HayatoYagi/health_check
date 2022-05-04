import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_check/firebase/firestore.dart';
import 'package:health_check/model/user_data.dart';

class EditProfileViewModel extends ChangeNotifier {
  UserData? _userData;

  UserData? get userData => _userData;

  set userData(UserData? value) {
    _userData = value;
    notifyListeners();
  }

  void loadUserData() async {
    _userData = await Firestore.getUserData();
    if (_userData == null) {
      var currentUser = FirebaseAuth.instance.currentUser!;
      _userData = Firestore.setUserData(UserData(
        firstname: currentUser.displayName ?? "",
        lastname: "",
        gender: "その他",
        mail: currentUser.email ?? "",
        schoolid: 0,
        studentid: 0,
        grade: 1,
        normalbodytemp: 36.5,
        uid: Firestore.uid,
      ));
    }
    notifyListeners();
  }

  void saveUserData() {
    Firestore.setUserData(userData!);
  }
}
