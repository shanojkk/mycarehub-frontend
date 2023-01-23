// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get userName =>
      throw _privateConstructorUsedError; // This is the nickname
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError; // This is the @handle
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'termsAccepted', defaultValue: false)
  bool? get termsAccepted => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasSetPin', defaultValue: false)
  bool? get hasSetPin => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
  bool? get hasSetSecurityQuestions => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasSetNickname', defaultValue: false)
  bool? get hasSetNickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPhoneVerified', defaultValue: false)
  bool? get isPhoneVerified => throw _privateConstructorUsedError;

  /// Whether this UserProfile needs to change their PIN
  ///
  /// This is normally used to signify that this UserProfile is a new UserProfile
  @JsonKey(name: 'pinChangeRequired', defaultValue: false)
  bool? get pinChangeRequired => throw _privateConstructorUsedError;

  /// Used to indicate that the UserProfile's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
  bool? get pinUpdateRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'suspended', defaultValue: false)
  bool? get suspended => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'username')
          String? userName,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'termsAccepted', defaultValue: false)
          bool? termsAccepted,
      @JsonKey(name: 'hasSetPin', defaultValue: false)
          bool? hasSetPin,
      @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
          bool? hasSetSecurityQuestions,
      @JsonKey(name: 'hasSetNickname', defaultValue: false)
          bool? hasSetNickname,
      @JsonKey(name: 'isPhoneVerified', defaultValue: false)
          bool? isPhoneVerified,
      @JsonKey(name: 'pinChangeRequired', defaultValue: false)
          bool? pinChangeRequired,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          bool? pinUpdateRequired,
      @JsonKey(name: 'suspended', defaultValue: false)
          bool? suspended});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? name = freezed,
    Object? active = freezed,
    Object? termsAccepted = freezed,
    Object? hasSetPin = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? hasSetNickname = freezed,
    Object? isPhoneVerified = freezed,
    Object? pinChangeRequired = freezed,
    Object? pinUpdateRequired = freezed,
    Object? suspended = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      termsAccepted: freezed == termsAccepted
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetPin: freezed == hasSetPin
          ? _value.hasSetPin
          : hasSetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: freezed == hasSetSecurityQuestions
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetNickname: freezed == hasSetNickname
          ? _value.hasSetNickname
          : hasSetNickname // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerified: freezed == isPhoneVerified
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      pinChangeRequired: freezed == pinChangeRequired
          ? _value.pinChangeRequired
          : pinChangeRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      pinUpdateRequired: freezed == pinUpdateRequired
          ? _value.pinUpdateRequired
          : pinUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      suspended: freezed == suspended
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$_UserProfileCopyWith(
          _$_UserProfile value, $Res Function(_$_UserProfile) then) =
      __$$_UserProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'username')
          String? userName,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'termsAccepted', defaultValue: false)
          bool? termsAccepted,
      @JsonKey(name: 'hasSetPin', defaultValue: false)
          bool? hasSetPin,
      @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
          bool? hasSetSecurityQuestions,
      @JsonKey(name: 'hasSetNickname', defaultValue: false)
          bool? hasSetNickname,
      @JsonKey(name: 'isPhoneVerified', defaultValue: false)
          bool? isPhoneVerified,
      @JsonKey(name: 'pinChangeRequired', defaultValue: false)
          bool? pinChangeRequired,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          bool? pinUpdateRequired,
      @JsonKey(name: 'suspended', defaultValue: false)
          bool? suspended});
}

/// @nodoc
class __$$_UserProfileCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$_UserProfile>
    implements _$$_UserProfileCopyWith<$Res> {
  __$$_UserProfileCopyWithImpl(
      _$_UserProfile _value, $Res Function(_$_UserProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? name = freezed,
    Object? active = freezed,
    Object? termsAccepted = freezed,
    Object? hasSetPin = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? hasSetNickname = freezed,
    Object? isPhoneVerified = freezed,
    Object? pinChangeRequired = freezed,
    Object? pinUpdateRequired = freezed,
    Object? suspended = freezed,
  }) {
    return _then(_$_UserProfile(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      termsAccepted: freezed == termsAccepted
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetPin: freezed == hasSetPin
          ? _value.hasSetPin
          : hasSetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: freezed == hasSetSecurityQuestions
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetNickname: freezed == hasSetNickname
          ? _value.hasSetNickname
          : hasSetNickname // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerified: freezed == isPhoneVerified
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      pinChangeRequired: freezed == pinChangeRequired
          ? _value.pinChangeRequired
          : pinChangeRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      pinUpdateRequired: freezed == pinUpdateRequired
          ? _value.pinUpdateRequired
          : pinUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      suspended: freezed == suspended
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfile implements _UserProfile {
  _$_UserProfile(
      {@JsonKey(name: 'id')
          this.id,
      @JsonKey(name: 'username')
          this.userName,
      @JsonKey(name: 'name')
          this.name,
      @JsonKey(name: 'active', defaultValue: false)
          this.active,
      @JsonKey(name: 'termsAccepted', defaultValue: false)
          this.termsAccepted,
      @JsonKey(name: 'hasSetPin', defaultValue: false)
          this.hasSetPin,
      @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
          this.hasSetSecurityQuestions,
      @JsonKey(name: 'hasSetNickname', defaultValue: false)
          this.hasSetNickname,
      @JsonKey(name: 'isPhoneVerified', defaultValue: false)
          this.isPhoneVerified,
      @JsonKey(name: 'pinChangeRequired', defaultValue: false)
          this.pinChangeRequired,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          this.pinUpdateRequired,
      @JsonKey(name: 'suspended', defaultValue: false)
          this.suspended});

  factory _$_UserProfile.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'username')
  final String? userName;
// This is the nickname
  @override
  @JsonKey(name: 'name')
  final String? name;
// This is the @handle
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'termsAccepted', defaultValue: false)
  final bool? termsAccepted;
  @override
  @JsonKey(name: 'hasSetPin', defaultValue: false)
  final bool? hasSetPin;
  @override
  @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
  final bool? hasSetSecurityQuestions;
  @override
  @JsonKey(name: 'hasSetNickname', defaultValue: false)
  final bool? hasSetNickname;
  @override
  @JsonKey(name: 'isPhoneVerified', defaultValue: false)
  final bool? isPhoneVerified;

  /// Whether this UserProfile needs to change their PIN
  ///
  /// This is normally used to signify that this UserProfile is a new UserProfile
  @override
  @JsonKey(name: 'pinChangeRequired', defaultValue: false)
  final bool? pinChangeRequired;

  /// Used to indicate that the UserProfile's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @override
  @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
  final bool? pinUpdateRequired;
  @override
  @JsonKey(name: 'suspended', defaultValue: false)
  final bool? suspended;

  @override
  String toString() {
    return 'UserProfile(id: $id, userName: $userName, name: $name, active: $active, termsAccepted: $termsAccepted, hasSetPin: $hasSetPin, hasSetSecurityQuestions: $hasSetSecurityQuestions, hasSetNickname: $hasSetNickname, isPhoneVerified: $isPhoneVerified, pinChangeRequired: $pinChangeRequired, pinUpdateRequired: $pinUpdateRequired, suspended: $suspended)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.termsAccepted, termsAccepted) ||
                other.termsAccepted == termsAccepted) &&
            (identical(other.hasSetPin, hasSetPin) ||
                other.hasSetPin == hasSetPin) &&
            (identical(
                    other.hasSetSecurityQuestions, hasSetSecurityQuestions) ||
                other.hasSetSecurityQuestions == hasSetSecurityQuestions) &&
            (identical(other.hasSetNickname, hasSetNickname) ||
                other.hasSetNickname == hasSetNickname) &&
            (identical(other.isPhoneVerified, isPhoneVerified) ||
                other.isPhoneVerified == isPhoneVerified) &&
            (identical(other.pinChangeRequired, pinChangeRequired) ||
                other.pinChangeRequired == pinChangeRequired) &&
            (identical(other.pinUpdateRequired, pinUpdateRequired) ||
                other.pinUpdateRequired == pinUpdateRequired) &&
            (identical(other.suspended, suspended) ||
                other.suspended == suspended));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userName,
      name,
      active,
      termsAccepted,
      hasSetPin,
      hasSetSecurityQuestions,
      hasSetNickname,
      isPhoneVerified,
      pinChangeRequired,
      pinUpdateRequired,
      suspended);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileCopyWith<_$_UserProfile> get copyWith =>
      __$$_UserProfileCopyWithImpl<_$_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  factory _UserProfile(
      {@JsonKey(name: 'id')
          final String? id,
      @JsonKey(name: 'username')
          final String? userName,
      @JsonKey(name: 'name')
          final String? name,
      @JsonKey(name: 'active', defaultValue: false)
          final bool? active,
      @JsonKey(name: 'termsAccepted', defaultValue: false)
          final bool? termsAccepted,
      @JsonKey(name: 'hasSetPin', defaultValue: false)
          final bool? hasSetPin,
      @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
          final bool? hasSetSecurityQuestions,
      @JsonKey(name: 'hasSetNickname', defaultValue: false)
          final bool? hasSetNickname,
      @JsonKey(name: 'isPhoneVerified', defaultValue: false)
          final bool? isPhoneVerified,
      @JsonKey(name: 'pinChangeRequired', defaultValue: false)
          final bool? pinChangeRequired,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          final bool? pinUpdateRequired,
      @JsonKey(name: 'suspended', defaultValue: false)
          final bool? suspended}) = _$_UserProfile;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$_UserProfile.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'username')
  String? get userName;
  @override // This is the nickname
  @JsonKey(name: 'name')
  String? get name;
  @override // This is the @handle
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(name: 'termsAccepted', defaultValue: false)
  bool? get termsAccepted;
  @override
  @JsonKey(name: 'hasSetPin', defaultValue: false)
  bool? get hasSetPin;
  @override
  @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
  bool? get hasSetSecurityQuestions;
  @override
  @JsonKey(name: 'hasSetNickname', defaultValue: false)
  bool? get hasSetNickname;
  @override
  @JsonKey(name: 'isPhoneVerified', defaultValue: false)
  bool? get isPhoneVerified;
  @override

  /// Whether this UserProfile needs to change their PIN
  ///
  /// This is normally used to signify that this UserProfile is a new UserProfile
  @JsonKey(name: 'pinChangeRequired', defaultValue: false)
  bool? get pinChangeRequired;
  @override

  /// Used to indicate that the UserProfile's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
  bool? get pinUpdateRequired;
  @override
  @JsonKey(name: 'suspended', defaultValue: false)
  bool? get suspended;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileCopyWith<_$_UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
