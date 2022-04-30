// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      gender: json['gender'] as String,
      mail: json['mail'] as String,
      schoolid: json['schoolid'] as int,
      studentid: json['studentid'] as int,
      grade: json['grade'] as int,
      normalbodytemp: (json['normalbodytemp'] as num).toDouble(),
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'gender': instance.gender,
      'mail': instance.mail,
      'schoolid': instance.schoolid,
      'studentid': instance.studentid,
      'grade': instance.grade,
      'normalbodytemp': instance.normalbodytemp,
      'uid': instance.uid,
    };
