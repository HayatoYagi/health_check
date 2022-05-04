import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_check/model/temperature_data.dart';

import '../model/user_data.dart';

class Firestore {
  static String get uid {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  static Future<TemperatureData?> getForm() async {
    var snapshot =
        await FirebaseFirestore.instance.collection("data").doc(uid).get();
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
    FirebaseFirestore.instance.collection("data").doc(uid).set(data.toJson());
  }

  static Future<UserData?> getUserData() async {
    var snapshot =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    if (!snapshot.exists) {
      return null;
    }
    var data = snapshot.data();
    if (data == null) {
      return null;
    } else {
      return UserData.fromJson(data);
    }
  }

  static UserData setUserData(UserData data) {
    FirebaseFirestore.instance.collection("users").doc(uid).set(data.toJson());
    return data;
  }
}
