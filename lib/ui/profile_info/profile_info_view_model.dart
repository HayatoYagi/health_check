import 'package:flutter/material.dart';
import 'package:health_check/firebase/firestore.dart';
import 'package:health_check/model/user_data.dart';
import 'package:local_auth/local_auth.dart';

class ProfileInfoViewModel extends ChangeNotifier {
  UserData? _userData;

  UserData? get userData => _userData;

  bool _didAuthenticate = false;

  bool get didAuthenticate => _didAuthenticate;

  Future<void> loadUserData() async {
    _userData = await Firestore.getUserData();
    notifyListeners();
  }

  Future<void> authenticate() async {
    var localAuth = LocalAuthentication();
    _didAuthenticate = await localAuth.authenticate(
      localizedReason: '個人情報は保護されています',
    );
    notifyListeners();
  }
}
