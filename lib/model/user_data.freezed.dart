// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  String get firstname => throw _privateConstructorUsedError;

  String get lastname => throw _privateConstructorUsedError;

  String get gender => throw _privateConstructorUsedError;

  String get mail => throw _privateConstructorUsedError;

  int get schoolid => throw _privateConstructorUsedError;

  int get studentid => throw _privateConstructorUsedError;

  int get grade => throw _privateConstructorUsedError;

  double get normalbodytemp => throw _privateConstructorUsedError;

  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res>;

  $Res call(
      {String firstname,
      String lastname,
      String gender,
      String mail,
      int schoolid,
      int studentid,
      int grade,
      double normalbodytemp,
      String uid});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res> implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  final UserData _value;

  // ignore: unused_field
  final $Res Function(UserData) _then;

  @override
  $Res call({
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? gender = freezed,
    Object? mail = freezed,
    Object? schoolid = freezed,
    Object? studentid = freezed,
    Object? grade = freezed,
    Object? normalbodytemp = freezed,
    Object? uid = freezed,
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
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      mail: mail == freezed
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String,
      schoolid: schoolid == freezed
          ? _value.schoolid
          : schoolid // ignore: cast_nullable_to_non_nullable
              as int,
      studentid: studentid == freezed
          ? _value.studentid
          : studentid // ignore: cast_nullable_to_non_nullable
              as int,
      grade: grade == freezed
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int,
      normalbodytemp: normalbodytemp == freezed
          ? _value.normalbodytemp
          : normalbodytemp // ignore: cast_nullable_to_non_nullable
              as double,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$UserDataCopyWith(_UserData value, $Res Function(_UserData) then) =
      __$UserDataCopyWithImpl<$Res>;

  @override
  $Res call(
      {String firstname,
      String lastname,
      String gender,
      String mail,
      int schoolid,
      int studentid,
      int grade,
      double normalbodytemp,
      String uid});
}

/// @nodoc
class __$UserDataCopyWithImpl<$Res> extends _$UserDataCopyWithImpl<$Res>
    implements _$UserDataCopyWith<$Res> {
  __$UserDataCopyWithImpl(_UserData _value, $Res Function(_UserData) _then)
      : super(_value, (v) => _then(v as _UserData));

  @override
  _UserData get _value => super._value as _UserData;

  @override
  $Res call({
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? gender = freezed,
    Object? mail = freezed,
    Object? schoolid = freezed,
    Object? studentid = freezed,
    Object? grade = freezed,
    Object? normalbodytemp = freezed,
    Object? uid = freezed,
  }) {
    return _then(_UserData(
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      mail: mail == freezed
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String,
      schoolid: schoolid == freezed
          ? _value.schoolid
          : schoolid // ignore: cast_nullable_to_non_nullable
              as int,
      studentid: studentid == freezed
          ? _value.studentid
          : studentid // ignore: cast_nullable_to_non_nullable
              as int,
      grade: grade == freezed
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as int,
      normalbodytemp: normalbodytemp == freezed
          ? _value.normalbodytemp
          : normalbodytemp // ignore: cast_nullable_to_non_nullable
              as double,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserData with DiagnosticableTreeMixin implements _UserData {
  const _$_UserData(
      {required this.firstname,
      required this.lastname,
      required this.gender,
      required this.mail,
      required this.schoolid,
      required this.studentid,
      required this.grade,
      required this.normalbodytemp,
      required this.uid});

  factory _$_UserData.fromJson(Map<String, dynamic> json) =>
      _$$_UserDataFromJson(json);

  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String gender;
  @override
  final String mail;
  @override
  final int schoolid;
  @override
  final int studentid;
  @override
  final int grade;
  @override
  final double normalbodytemp;
  @override
  final String uid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserData(firstname: $firstname, lastname: $lastname, gender: $gender, mail: $mail, schoolid: $schoolid, studentid: $studentid, grade: $grade, normalbodytemp: $normalbodytemp, uid: $uid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserData'))
      ..add(DiagnosticsProperty('firstname', firstname))
      ..add(DiagnosticsProperty('lastname', lastname))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('mail', mail))
      ..add(DiagnosticsProperty('schoolid', schoolid))
      ..add(DiagnosticsProperty('studentid', studentid))
      ..add(DiagnosticsProperty('grade', grade))
      ..add(DiagnosticsProperty('normalbodytemp', normalbodytemp))
      ..add(DiagnosticsProperty('uid', uid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserData &&
            const DeepCollectionEquality().equals(other.firstname, firstname) &&
            const DeepCollectionEquality().equals(other.lastname, lastname) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.mail, mail) &&
            const DeepCollectionEquality().equals(other.schoolid, schoolid) &&
            const DeepCollectionEquality().equals(other.studentid, studentid) &&
            const DeepCollectionEquality().equals(other.grade, grade) &&
            const DeepCollectionEquality()
                .equals(other.normalbodytemp, normalbodytemp) &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstname),
      const DeepCollectionEquality().hash(lastname),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(mail),
      const DeepCollectionEquality().hash(schoolid),
      const DeepCollectionEquality().hash(studentid),
      const DeepCollectionEquality().hash(grade),
      const DeepCollectionEquality().hash(normalbodytemp),
      const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$UserDataCopyWith<_UserData> get copyWith =>
      __$UserDataCopyWithImpl<_UserData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDataToJson(this);
  }
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {required final String firstname,
      required final String lastname,
      required final String gender,
      required final String mail,
      required final int schoolid,
      required final int studentid,
      required final int grade,
      required final double normalbodytemp,
      required final String uid}) = _$_UserData;

  factory _UserData.fromJson(Map<String, dynamic> json) = _$_UserData.fromJson;

  @override
  String get firstname => throw _privateConstructorUsedError;

  @override
  String get lastname => throw _privateConstructorUsedError;

  @override
  String get gender => throw _privateConstructorUsedError;

  @override
  String get mail => throw _privateConstructorUsedError;

  @override
  int get schoolid => throw _privateConstructorUsedError;

  @override
  int get studentid => throw _privateConstructorUsedError;

  @override
  int get grade => throw _privateConstructorUsedError;

  @override
  double get normalbodytemp => throw _privateConstructorUsedError;

  @override
  String get uid => throw _privateConstructorUsedError;

  @override
  @JsonKey(ignore: true)
  _$UserDataCopyWith<_UserData> get copyWith =>
      throw _privateConstructorUsedError;
}
