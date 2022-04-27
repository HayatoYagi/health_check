class UserData {
  String firstname;
  String lastname;
  String gender;
  String mail;
  int schoolId;
  int studentId;
  int grade;
  double normalBodyTemperature;
  String uid;

  UserData(
    this.firstname,
    this.lastname,
    this.gender,
    this.mail,
    this.schoolId,
    this.studentId,
    this.grade,
    this.normalBodyTemperature,
    this.uid,
  );

  UserData.fromMap(Map<String, dynamic> data)
      : firstname = data[UserField.firstname],
        lastname = data[UserField.lastname],
        gender = data[UserField.gender],
        mail = data[UserField.mail],
        schoolId = data[UserField.schoolId],
        studentId = data[UserField.studentId],
        grade = data[UserField.grade],
        normalBodyTemperature = data[UserField.normalBodyTemp],
        uid = data[UserField.uid];

  Map<String, dynamic> toMap() {
    return {
      UserField.firstname: firstname,
      UserField.lastname: lastname,
      UserField.gender: gender,
      UserField.mail: mail,
      UserField.schoolId: schoolId,
      UserField.studentId: studentId,
      UserField.grade: grade,
      UserField.normalBodyTemp: normalBodyTemperature,
      UserField.uid: uid,
    };
  }
}

class UserField {
  static const String firstname = "firstname";
  static const String lastname = "lastname";
  static const String gender = "gender";
  static const String mail = "mail";
  static const String schoolId = "schoolid";
  static const String studentId = "studentid";
  static const String grade = "grade";
  static const String normalBodyTemp = "normalbodytemp";
  static const String uid = "uid";
}
