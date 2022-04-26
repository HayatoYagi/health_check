import 'package:flutter/material.dart';
import 'package:health_check/model/temperature_data.dart';

import '../../firebase/firestore.dart';

class InputViewModel extends ChangeNotifier {
  int _bodyTemperatureIntegerPart = 36;
  int _bodyTemperatureFractionalPart = 5;
  bool _symptom = false;

  String get bodyTemperature =>
      _bodyTemperatureIntegerPart.toString() +
      "." +
      _bodyTemperatureFractionalPart.toString();

  set bodyTemperatureIntegerPart(int value) {
    _bodyTemperatureIntegerPart = value;
    notifyListeners();
  }

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

  void submit() {
    Firestore.postForm(
      "uid", // todo
      TemperatureData(
        "firstname",
        "lastname",
        1,
        1,
        _bodyTemperatureIntegerPart + _bodyTemperatureFractionalPart / 10,
        symptom,
        DateTime.now(),
        "mail",
      ),
    );
  }
}
