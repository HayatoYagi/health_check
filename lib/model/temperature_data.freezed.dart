// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'temperature_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TemperatureData _$TemperatureDataFromJson(Map<String, dynamic> json) {
  return _TemperatureData.fromJson(json);
}

/// @nodoc
mixin _$TemperatureData {
  String get firstname => throw _privateConstructorUsedError;

  String get lastname => throw _privateConstructorUsedError;

  int get schoolid => throw _privateConstructorUsedError;

  int get studentid => throw _privateConstructorUsedError;

  double get bodytemp => throw _privateConstructorUsedError;

  bool get symptom => throw _privateConstructorUsedError;

  DateTime get posttime => throw _privateConstructorUsedError;

  String get mail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TemperatureDataCopyWith<TemperatureData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemperatureDataCopyWith<$Res> {
  factory $TemperatureDataCopyWith(
          TemperatureData value, $Res Function(TemperatureData) then) =
      _$TemperatureDataCopyWithImpl<$Res>;

  $Res call(
      {String firstname,
      String lastname,
      int schoolid,
      int studentid,
      double bodytemp,
      bool symptom,
      DateTime posttime,
      String mail});
}

/// @nodoc
class _$TemperatureDataCopyWithImpl<$Res>
    implements $TemperatureDataCopyWith<$Res> {
  _$TemperatureDataCopyWithImpl(this._value, this._then);

  final TemperatureData _value;

  // ignore: unused_field
  final $Res Function(TemperatureData) _then;

  @override
  $Res call({
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? schoolid = freezed,
    Object? studentid = freezed,
    Object? bodytemp = freezed,
    Object? symptom = freezed,
    Object? posttime = freezed,
    Object? mail = freezed,
  }) {
    return _then(_value.copyWith(
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      schoolid: schoolid == freezed
          ? _value.schoolid
          : schoolid // ignore: cast_nullable_to_non_nullable
              as int,
      studentid: studentid == freezed
          ? _value.studentid
          : studentid // ignore: cast_nullable_to_non_nullable
              as int,
      bodytemp: bodytemp == freezed
          ? _value.bodytemp
          : bodytemp // ignore: cast_nullable_to_non_nullable
              as double,
      symptom: symptom == freezed
          ? _value.symptom
          : symptom // ignore: cast_nullable_to_non_nullable
              as bool,
      posttime: posttime == freezed
          ? _value.posttime
          : posttime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mail: mail == freezed
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TemperatureDataCopyWith<$Res>
    implements $TemperatureDataCopyWith<$Res> {
  factory _$TemperatureDataCopyWith(
          _TemperatureData value, $Res Function(_TemperatureData) then) =
      __$TemperatureDataCopyWithImpl<$Res>;

  @override
  $Res call(
      {String firstname,
      String lastname,
      int schoolid,
      int studentid,
      double bodytemp,
      bool symptom,
      DateTime posttime,
      String mail});
}

/// @nodoc
class __$TemperatureDataCopyWithImpl<$Res>
    extends _$TemperatureDataCopyWithImpl<$Res>
    implements _$TemperatureDataCopyWith<$Res> {
  __$TemperatureDataCopyWithImpl(
      _TemperatureData _value, $Res Function(_TemperatureData) _then)
      : super(_value, (v) => _then(v as _TemperatureData));

  @override
  _TemperatureData get _value => super._value as _TemperatureData;

  @override
  $Res call({
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? schoolid = freezed,
    Object? studentid = freezed,
    Object? bodytemp = freezed,
    Object? symptom = freezed,
    Object? posttime = freezed,
    Object? mail = freezed,
  }) {
    return _then(_TemperatureData(
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      schoolid: schoolid == freezed
          ? _value.schoolid
          : schoolid // ignore: cast_nullable_to_non_nullable
              as int,
      studentid: studentid == freezed
          ? _value.studentid
          : studentid // ignore: cast_nullable_to_non_nullable
              as int,
      bodytemp: bodytemp == freezed
          ? _value.bodytemp
          : bodytemp // ignore: cast_nullable_to_non_nullable
              as double,
      symptom: symptom == freezed
          ? _value.symptom
          : symptom // ignore: cast_nullable_to_non_nullable
              as bool,
      posttime: posttime == freezed
          ? _value.posttime
          : posttime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mail: mail == freezed
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TemperatureData implements _TemperatureData {
  const _$_TemperatureData(
      {required this.firstname,
      required this.lastname,
      required this.schoolid,
      required this.studentid,
      required this.bodytemp,
      required this.symptom,
      required this.posttime,
      required this.mail});

  factory _$_TemperatureData.fromJson(Map<String, dynamic> json) =>
      _$$_TemperatureDataFromJson(json);

  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final int schoolid;
  @override
  final int studentid;
  @override
  final double bodytemp;
  @override
  final bool symptom;
  @override
  final DateTime posttime;
  @override
  final String mail;

  @override
  String toString() {
    return 'TemperatureData(firstname: $firstname, lastname: $lastname, schoolid: $schoolid, studentid: $studentid, bodytemp: $bodytemp, symptom: $symptom, posttime: $posttime, mail: $mail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TemperatureData &&
            const DeepCollectionEquality().equals(other.firstname, firstname) &&
            const DeepCollectionEquality().equals(other.lastname, lastname) &&
            const DeepCollectionEquality().equals(other.schoolid, schoolid) &&
            const DeepCollectionEquality().equals(other.studentid, studentid) &&
            const DeepCollectionEquality().equals(other.bodytemp, bodytemp) &&
            const DeepCollectionEquality().equals(other.symptom, symptom) &&
            const DeepCollectionEquality().equals(other.posttime, posttime) &&
            const DeepCollectionEquality().equals(other.mail, mail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstname),
      const DeepCollectionEquality().hash(lastname),
      const DeepCollectionEquality().hash(schoolid),
      const DeepCollectionEquality().hash(studentid),
      const DeepCollectionEquality().hash(bodytemp),
      const DeepCollectionEquality().hash(symptom),
      const DeepCollectionEquality().hash(posttime),
      const DeepCollectionEquality().hash(mail));

  @JsonKey(ignore: true)
  @override
  _$TemperatureDataCopyWith<_TemperatureData> get copyWith =>
      __$TemperatureDataCopyWithImpl<_TemperatureData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TemperatureDataToJson(this);
  }
}

abstract class _TemperatureData implements TemperatureData {
  const factory _TemperatureData(
      {required final String firstname,
      required final String lastname,
      required final int schoolid,
      required final int studentid,
      required final double bodytemp,
      required final bool symptom,
      required final DateTime posttime,
      required final String mail}) = _$_TemperatureData;

  factory _TemperatureData.fromJson(Map<String, dynamic> json) =
      _$_TemperatureData.fromJson;

  @override
  String get firstname => throw _privateConstructorUsedError;

  @override
  String get lastname => throw _privateConstructorUsedError;

  @override
  int get schoolid => throw _privateConstructorUsedError;

  @override
  int get studentid => throw _privateConstructorUsedError;

  @override
  double get bodytemp => throw _privateConstructorUsedError;

  @override
  bool get symptom => throw _privateConstructorUsedError;

  @override
  DateTime get posttime => throw _privateConstructorUsedError;

  @override
  String get mail => throw _privateConstructorUsedError;

  @override
  @JsonKey(ignore: true)
  _$TemperatureDataCopyWith<_TemperatureData> get copyWith =>
      throw _privateConstructorUsedError;
}
