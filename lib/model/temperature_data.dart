import 'package:freezed_annotation/freezed_annotation.dart';

part 'temperature_data.freezed.dart';

part 'temperature_data.g.dart';

@freezed
class TemperatureData with _$TemperatureData {
  const factory TemperatureData({
    required String firstname,
    required String lastname,
    required int schoolid,
    required int studentid,
    required double bodytemp,
    required bool symptom,
    required DateTime posttime,
    required String mail,
  }) = _TemperatureData;

  factory TemperatureData.fromJson(Map<String, dynamic> json) =>
      _$TemperatureDataFromJson(json);
}
