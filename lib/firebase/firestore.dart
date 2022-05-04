import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_check/model/temperature_data.dart';

import '../model/user_data.dart';

class Firestore {
  static String get _uid {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  static Future<TemperatureData?> getForm() async {
    var snapshot =
        await FirebaseFirestore.instance.collection("data").doc(_uid).get();
    if (!snapshot.exists) {
      return null;
    }
    var data = snapshot.data();
    if (data == null) {
      return null;
    } else {
      return TemperatureData.fromJson(data);
    }
  }

  static void postForm(TemperatureData data) {
    FirebaseFirestore.instance.collection("data").doc(_uid).set(data.toJson());
  }

  static Future<UserData?> getUserData() async {
    var snapshot =
        await FirebaseFirestore.instance.collection("users").doc(_uid).get();
    if (!snapshot.exists) {
      var currentUser = FirebaseAuth.instance.currentUser!;
      return setUserData(UserData(
        firstname: currentUser.displayName ?? "",
        lastname: "",
        gender: "",
        mail: currentUser.email ?? "",
        schoolid: 0,
        studentid: 0,
        grade: 1,
        normalbodytemp: 36.5,
        uid: _uid,
      ));
    }
    var data = snapshot.data();
    if (data == null) {
      return null;
    } else {
      return UserData.fromJson(data);
    }
  }

  static UserData setUserData(UserData data) {
    FirebaseFirestore.instance.collection("users").doc(_uid).set(data.toJson());
    return data;
  }
}
