import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_check/model/temperature_data.dart';

class Firestore {
  static void postForm(String uid, TemperatureData data) {
    FirebaseFirestore.instance.collection("data").doc(uid).set({
      "firstname": data.firstname,
      // todo
    });
  }
}
