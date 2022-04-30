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
    notifyListeners();
  }

  void saveUserData() {
    Firestore.setUserData(userData!);
  }
}
