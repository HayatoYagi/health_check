import 'package:flutter/material.dart';
import 'package:health_check/model/temperature_data.dart';

import '../../firebase/firestore.dart';
import '../../model/user_data.dart';

class FormViewModel extends ChangeNotifier {
  bool _submitted = false;
  TemperatureData? _postedData;

  int _bodyTemperatureIntegerPart = 36;
  int _bodyTemperatureFractionalPart = 5;
  bool _symptom = false;
  bool _rulesAgreed = false;

  bool get submitted => _submitted;

  set submitted(bool value) {
    _submitted = value;
    notifyListeners();
  }

  TemperatureData? get postedData => _postedData;

  set postedData(TemperatureData? value) {
    _postedData = value;
    notifyListeners();
  }

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

  void submit() async {
    if (!rulesAgreed) {
      return;
    }

    UserData? userData = await Firestore.getUserData();
    if (userData == null) {
      // todo
      return;
    }

    TemperatureData data = TemperatureData(
      firstname: userData.firstname,
      lastname: userData.lastname,
      schoolid: userData.schoolid,
      studentid: userData.studentid,
      bodytemp:
          _bodyTemperatureIntegerPart + _bodyTemperatureFractionalPart / 10,
      symptom: symptom,
      posttime: DateTime.now(),
      mail: userData.mail,
    );
    Firestore.postForm(data);
    postedData = data;
    submitted = true;
  }

  void checkSubmitted() async {
    postedData = await Firestore.getForm();
    DateTime? prevPostTime = postedData?.posttime;
    if (prevPostTime == null) return;
    if (prevPostTime.year == DateTime.now().year &&
        prevPostTime.month == DateTime.now().month &&
        prevPostTime.day == DateTime.now().day) {
      submitted = true;
    }
  }
}
