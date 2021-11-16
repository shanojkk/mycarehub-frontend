// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'my_afya_user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyAfyaUserProfile _$MyAfyaUserProfileFromJson(Map<String, dynamic> json) {
  return _MyAfyaUserProfile.fromJson(json);
}

/// @nodoc
class _$MyAfyaUserProfileTearOff {
  const _$MyAfyaUserProfileTearOff();

  _MyAfyaUserProfile call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'userName') Name? username,
      @JsonKey(name: 'primaryPhone') PhoneNumber? primaryPhoneNumber,
      @JsonKey(name: 'primaryEmailAddress') EmailAddress? primaryEmailAddress,
      @JsonKey(name: 'termsAccepted') bool? termsAccepted,
      @JsonKey(name: 'userBioData') BioData? userBioData}) {
    return _MyAfyaUserProfile(
      id: id,
      username: username,
      primaryPhoneNumber: primaryPhoneNumber,
      primaryEmailAddress: primaryEmailAddress,
      termsAccepted: termsAccepted,
      userBioData: userBioData,
    );
  }

  MyAfyaUserProfile fromJson(Map<String, Object> json) {
    return MyAfyaUserProfile.fromJson(json);
  }
}

/// @nodoc
const $MyAfyaUserProfile = _$MyAfyaUserProfileTearOff();

/// @nodoc
mixin _$MyAfyaUserProfile {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  Name? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'primaryPhone')
  PhoneNumber? get primaryPhoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'primaryEmailAddress')
  EmailAddress? get primaryEmailAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'termsAccepted')
  bool? get termsAccepted => throw _privateConstructorUsedError;
  @JsonKey(name: 'userBioData')
  BioData? get userBioData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyAfyaUserProfileCopyWith<MyAfyaUserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyAfyaUserProfileCopyWith<$Res> {
  factory $MyAfyaUserProfileCopyWith(
          MyAfyaUserProfile value, $Res Function(MyAfyaUserProfile) then) =
      _$MyAfyaUserProfileCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'userName') Name? username,
      @JsonKey(name: 'primaryPhone') PhoneNumber? primaryPhoneNumber,
      @JsonKey(name: 'primaryEmailAddress') EmailAddress? primaryEmailAddress,
      @JsonKey(name: 'termsAccepted') bool? termsAccepted,
      @JsonKey(name: 'userBioData') BioData? userBioData});

  $BioDataCopyWith<$Res>? get userBioData;
}

/// @nodoc
class _$MyAfyaUserProfileCopyWithImpl<$Res>
    implements $MyAfyaUserProfileCopyWith<$Res> {
  _$MyAfyaUserProfileCopyWithImpl(this._value, this._then);

  final MyAfyaUserProfile _value;
  // ignore: unused_field
  final $Res Function(MyAfyaUserProfile) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? primaryPhoneNumber = freezed,
    Object? primaryEmailAddress = freezed,
    Object? termsAccepted = freezed,
    Object? userBioData = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Name?,
      primaryPhoneNumber: primaryPhoneNumber == freezed
          ? _value.primaryPhoneNumber
          : primaryPhoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber?,
      primaryEmailAddress: primaryEmailAddress == freezed
          ? _value.primaryEmailAddress
          : primaryEmailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress?,
      termsAccepted: termsAccepted == freezed
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      userBioData: userBioData == freezed
          ? _value.userBioData
          : userBioData // ignore: cast_nullable_to_non_nullable
              as BioData?,
    ));
  }

  @override
  $BioDataCopyWith<$Res>? get userBioData {
    if (_value.userBioData == null) {
      return null;
    }

    return $BioDataCopyWith<$Res>(_value.userBioData!, (value) {
      return _then(_value.copyWith(userBioData: value));
    });
  }
}

/// @nodoc
abstract class _$MyAfyaUserProfileCopyWith<$Res>
    implements $MyAfyaUserProfileCopyWith<$Res> {
  factory _$MyAfyaUserProfileCopyWith(
          _MyAfyaUserProfile value, $Res Function(_MyAfyaUserProfile) then) =
      __$MyAfyaUserProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'userName') Name? username,
      @JsonKey(name: 'primaryPhone') PhoneNumber? primaryPhoneNumber,
      @JsonKey(name: 'primaryEmailAddress') EmailAddress? primaryEmailAddress,
      @JsonKey(name: 'termsAccepted') bool? termsAccepted,
      @JsonKey(name: 'userBioData') BioData? userBioData});

  @override
  $BioDataCopyWith<$Res>? get userBioData;
}

/// @nodoc
class __$MyAfyaUserProfileCopyWithImpl<$Res>
    extends _$MyAfyaUserProfileCopyWithImpl<$Res>
    implements _$MyAfyaUserProfileCopyWith<$Res> {
  __$MyAfyaUserProfileCopyWithImpl(
      _MyAfyaUserProfile _value, $Res Function(_MyAfyaUserProfile) _then)
      : super(_value, (v) => _then(v as _MyAfyaUserProfile));

  @override
  _MyAfyaUserProfile get _value => super._value as _MyAfyaUserProfile;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? primaryPhoneNumber = freezed,
    Object? primaryEmailAddress = freezed,
    Object? termsAccepted = freezed,
    Object? userBioData = freezed,
  }) {
    return _then(_MyAfyaUserProfile(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Name?,
      primaryPhoneNumber: primaryPhoneNumber == freezed
          ? _value.primaryPhoneNumber
          : primaryPhoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber?,
      primaryEmailAddress: primaryEmailAddress == freezed
          ? _value.primaryEmailAddress
          : primaryEmailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress?,
      termsAccepted: termsAccepted == freezed
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      userBioData: userBioData == freezed
          ? _value.userBioData
          : userBioData // ignore: cast_nullable_to_non_nullable
              as BioData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyAfyaUserProfile implements _MyAfyaUserProfile {
  _$_MyAfyaUserProfile(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'userName') this.username,
      @JsonKey(name: 'primaryPhone') this.primaryPhoneNumber,
      @JsonKey(name: 'primaryEmailAddress') this.primaryEmailAddress,
      @JsonKey(name: 'termsAccepted') this.termsAccepted,
      @JsonKey(name: 'userBioData') this.userBioData});

  factory _$_MyAfyaUserProfile.fromJson(Map<String, dynamic> json) =>
      _$_$_MyAfyaUserProfileFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'userName')
  final Name? username;
  @override
  @JsonKey(name: 'primaryPhone')
  final PhoneNumber? primaryPhoneNumber;
  @override
  @JsonKey(name: 'primaryEmailAddress')
  final EmailAddress? primaryEmailAddress;
  @override
  @JsonKey(name: 'termsAccepted')
  final bool? termsAccepted;
  @override
  @JsonKey(name: 'userBioData')
  final BioData? userBioData;

  @override
  String toString() {
    return 'MyAfyaUserProfile(id: $id, username: $username, primaryPhoneNumber: $primaryPhoneNumber, primaryEmailAddress: $primaryEmailAddress, termsAccepted: $termsAccepted, userBioData: $userBioData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MyAfyaUserProfile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.primaryPhoneNumber, primaryPhoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.primaryPhoneNumber, primaryPhoneNumber)) &&
            (identical(other.primaryEmailAddress, primaryEmailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.primaryEmailAddress, primaryEmailAddress)) &&
            (identical(other.termsAccepted, termsAccepted) ||
                const DeepCollectionEquality()
                    .equals(other.termsAccepted, termsAccepted)) &&
            (identical(other.userBioData, userBioData) ||
                const DeepCollectionEquality()
                    .equals(other.userBioData, userBioData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(primaryPhoneNumber) ^
      const DeepCollectionEquality().hash(primaryEmailAddress) ^
      const DeepCollectionEquality().hash(termsAccepted) ^
      const DeepCollectionEquality().hash(userBioData);

  @JsonKey(ignore: true)
  @override
  _$MyAfyaUserProfileCopyWith<_MyAfyaUserProfile> get copyWith =>
      __$MyAfyaUserProfileCopyWithImpl<_MyAfyaUserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MyAfyaUserProfileToJson(this);
  }
}

abstract class _MyAfyaUserProfile implements MyAfyaUserProfile {
  factory _MyAfyaUserProfile(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'userName')
          Name? username,
      @JsonKey(name: 'primaryPhone')
          PhoneNumber? primaryPhoneNumber,
      @JsonKey(name: 'primaryEmailAddress')
          EmailAddress? primaryEmailAddress,
      @JsonKey(name: 'termsAccepted')
          bool? termsAccepted,
      @JsonKey(name: 'userBioData')
          BioData? userBioData}) = _$_MyAfyaUserProfile;

  factory _MyAfyaUserProfile.fromJson(Map<String, dynamic> json) =
      _$_MyAfyaUserProfile.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'userName')
  Name? get username => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'primaryPhone')
  PhoneNumber? get primaryPhoneNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'primaryEmailAddress')
  EmailAddress? get primaryEmailAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'termsAccepted')
  bool? get termsAccepted => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'userBioData')
  BioData? get userBioData => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MyAfyaUserProfileCopyWith<_MyAfyaUserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
