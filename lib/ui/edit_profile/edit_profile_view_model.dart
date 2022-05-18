import 'package:flutter/material.dart';
import 'package:health_check/firebase/fire_auth.dart';
import 'package:health_check/firebase/firestore.dart';
import 'package:health_check/model/user_data.dart';
import 'package:local_auth/local_auth.dart';

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
      var user = FireAuth.user;
      _userData = Firestore.setUserData(UserData(
        firstname: user?.displayName ?? "",
        lastname: "",
        gender: "その他",
        mail: user?.email ?? "",
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

  bool _didAuthenticate = false;

  bool get didAuthenticate => _didAuthenticate;

  Future<void> authenticate() async {
    var localAuth = LocalAuthentication();
    final bool canAuthenticate = await localAuth.canCheckBiometrics ||
        await localAuth.isDeviceSupported();
    if (canAuthenticate) {
      try {
        _didAuthenticate = await localAuth.authenticate(
          localizedReason: '個人情報は保護されています',
        );
      } catch (e) {
        debugPrint(e.toString());
        _didAuthenticate = true;
      }
    } else {
      _didAuthenticate = true;
    }
    notifyListeners();
  }
}
