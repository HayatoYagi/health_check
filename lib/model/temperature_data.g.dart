// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TemperatureData _$$_TemperatureDataFromJson(Map<String, dynamic> json) =>
    _$_TemperatureData(
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      schoolid: json['schoolid'] as int,
      studentid: json['studentid'] as int,
      bodytemp: (json['bodytemp'] as num).toDouble(),
      symptom: json['symptom'] as bool,
      posttime: _posttimeFromJson(json['posttime'] as Timestamp),
      mail: json['mail'] as String,
    );

Map<String, dynamic> _$$_TemperatureDataToJson(_$_TemperatureData instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'schoolid': instance.schoolid,
      'studentid': instance.studentid,
      'bodytemp': instance.bodytemp,
      'symptom': instance.symptom,
      'posttime': _posttimeToJson(instance.posttime),
      'mail': instance.mail,
    };
