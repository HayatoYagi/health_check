class TemperatureData {
  String firstname;
  String lastname;
  int schoolId;
  int studentId;
  double bodyTemp;
  bool symptom;
  DateTime postTime;
  String mail;

  TemperatureData(
    this.firstname,
    this.lastname,
    this.schoolId,
    this.studentId,
    this.bodyTemp,
    this.symptom,
    this.postTime,
    this.mail,
  );

  Map<String, dynamic> toMap() {
    return {
      TemperatureField.firstname: firstname,
      TemperatureField.lastname: lastname,
      TemperatureField.schoolId: schoolId,
      TemperatureField.studentId: studentId,
      TemperatureField.bodyTemperature: bodyTemp,
      TemperatureField.symptom: symptom,
      TemperatureField.postTime: postTime,
      TemperatureField.mail: mail,
    };
  }
}

class TemperatureField {
  static const String firstname = "firstname";
  static const String lastname = "lastname";
  static const String schoolId = "schoolid";
  static const String studentId = "studentid";
  static const String bodyTemperature = "bodytemp";
  static const String symptom = "symptom";
  static const String postTime = "posttime";
  static const String mail = "mail";
}
