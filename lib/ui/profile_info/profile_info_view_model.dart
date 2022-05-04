import 'package:flutter/material.dart';
import 'package:health_check/firebase/firestore.dart';
import 'package:health_check/model/user_data.dart';

class ProfileInfoViewModel extends ChangeNotifier {
  UserData? _userData;

  UserData? get userData => _userData;

  Future<void> loadUserData() async {
    _userData = await Firestore.getUserData();
    notifyListeners();
  }
}
