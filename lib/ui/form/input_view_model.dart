import 'package:flutter/material.dart';
import 'package:health_check/model/temperature_data.dart';

import '../../firebase/firestore.dart';
import '../../model/user_data.dart';

class InputViewModel extends ChangeNotifier {
  int _bodyTemperatureIntegerPart = 36;
  int _bodyTemperatureFractionalPart = 5;
  bool _symptom = false;
  bool _rulesAgreed = false;

  String get bodyTemperature =>
      _bodyTemperatureIntegerPart.toString() +
      "." +
      _bodyTemperatureFractionalPart.toString();

  int get bodyTemperatureIntegerPart => _bodyTemperatureIntegerPart;

  set bodyTemperatureIntegerPart(int value) {
    _bodyTemperatureIntegerPart = value;
    notifyListeners();
  }

  int get bodyTemperatureFractionalPart => _bodyTemperatureFractionalPart;
  set bodyTemperatureFractionalPart(int value) {
    assert(0 <= value && value <= 9);
    _bodyTemperatureFractionalPart = value;
    notifyListeners();
  }

  bool get symptom => _symptom;

  set symptom(bool value) {
    _symptom = value;
    notifyListeners();
  }

  bool get rulesAgreed => _rulesAgreed;

  set rulesAgreed(bool value) {
    _rulesAgreed = value;
    notifyListeners();
  }

  Future<void> submit() async {
    if (!rulesAgreed) {
      // todo
      return;
    }

    UserData? userData = await Firestore.getUserData();
    if (userData == null) {
      // todo
      return;
    }
    Firestore.postForm(
      TemperatureData(
        userData.firstname,
        userData.lastname,
        userData.schoolid,
        userData.studentid,
        _bodyTemperatureIntegerPart + _bodyTemperatureFractionalPart / 10,
        symptom,
        DateTime.now(),
        userData.mail,
      ),
    );
  }
}
