import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_check/model/temperature_data.dart';

import '../model/user_data.dart';

class Firestore {
  static String get _uid {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  static void postForm(TemperatureData data) {
    FirebaseFirestore.instance.collection("data").doc(_uid).set(data.toMap());
  }

  static Future<UserData?> getUserData() async {
    var snapshot =
        await FirebaseFirestore.instance.collection("users").doc(_uid).get();
    if (!snapshot.exists) {
      var currentUser = FirebaseAuth.instance.currentUser!;
      return setUserData(UserData(
        currentUser.displayName ?? "",
        "",
        "",
        currentUser.email ?? "",
        0,
        0,
        1,
        36.5,
        _uid,
      ));
    }
    var data = (snapshot).data();
    if (data == null) {
      return null;
    } else {
      return UserData.fromMap(data);
    }
  }

  static UserData setUserData(UserData data) {
    FirebaseFirestore.instance.collection("users").doc(_uid).set(data.toMap());
    return data;
  }
}
