import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';

part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String firstname,
    required String lastname,
    required String gender,
    required String mail,
    required int schoolid,
    required int studentid,
    required int grade,
    required double normalbodytemp,
    required String uid,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
