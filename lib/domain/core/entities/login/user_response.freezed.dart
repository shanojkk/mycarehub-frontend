// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return _UserResponse.fromJson(json);
}

/// @nodoc
mixin _$UserResponse {
  @JsonKey(name: 'credentials')
  AuthCredentials? get credentials => throw _privateConstructorUsedError;
  @JsonKey(name: 'userProfile')
  UserProfile? get userProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'caregiverProfile')
  CaregiverState? get caregiverState => throw _privateConstructorUsedError;
  @JsonKey(name: 'getStreamToken')
  String? get streamToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserResponseCopyWith<UserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseCopyWith<$Res> {
  factory $UserResponseCopyWith(
          UserResponse value, $Res Function(UserResponse) then) =
      _$UserResponseCopyWithImpl<$Res, UserResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'credentials') AuthCredentials? credentials,
      @JsonKey(name: 'userProfile') UserProfile? userProfile,
      @JsonKey(name: 'caregiverProfile') CaregiverState? caregiverState,
      @JsonKey(name: 'getStreamToken') String? streamToken});

  $AuthCredentialsCopyWith<$Res>? get credentials;
  $UserProfileCopyWith<$Res>? get userProfile;
  $CaregiverStateCopyWith<$Res>? get caregiverState;
}

/// @nodoc
class _$UserResponseCopyWithImpl<$Res, $Val extends UserResponse>
    implements $UserResponseCopyWith<$Res> {
  _$UserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credentials = freezed,
    Object? userProfile = freezed,
    Object? caregiverState = freezed,
    Object? streamToken = freezed,
  }) {
    return _then(_value.copyWith(
      credentials: freezed == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      caregiverState: freezed == caregiverState
          ? _value.caregiverState
          : caregiverState // ignore: cast_nullable_to_non_nullable
              as CaregiverState?,
      streamToken: freezed == streamToken
          ? _value.streamToken
          : streamToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthCredentialsCopyWith<$Res>? get credentials {
    if (_value.credentials == null) {
      return null;
    }

    return $AuthCredentialsCopyWith<$Res>(_value.credentials!, (value) {
      return _then(_value.copyWith(credentials: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get userProfile {
    if (_value.userProfile == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.userProfile!, (value) {
      return _then(_value.copyWith(userProfile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CaregiverStateCopyWith<$Res>? get caregiverState {
    if (_value.caregiverState == null) {
      return null;
    }

    return $CaregiverStateCopyWith<$Res>(_value.caregiverState!, (value) {
      return _then(_value.copyWith(caregiverState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserResponseCopyWith<$Res>
    implements $UserResponseCopyWith<$Res> {
  factory _$$_UserResponseCopyWith(
          _$_UserResponse value, $Res Function(_$_UserResponse) then) =
      __$$_UserResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'credentials') AuthCredentials? credentials,
      @JsonKey(name: 'userProfile') UserProfile? userProfile,
      @JsonKey(name: 'caregiverProfile') CaregiverState? caregiverState,
      @JsonKey(name: 'getStreamToken') String? streamToken});

  @override
  $AuthCredentialsCopyWith<$Res>? get credentials;
  @override
  $UserProfileCopyWith<$Res>? get userProfile;
  @override
  $CaregiverStateCopyWith<$Res>? get caregiverState;
}

/// @nodoc
class __$$_UserResponseCopyWithImpl<$Res>
    extends _$UserResponseCopyWithImpl<$Res, _$_UserResponse>
    implements _$$_UserResponseCopyWith<$Res> {
  __$$_UserResponseCopyWithImpl(
      _$_UserResponse _value, $Res Function(_$_UserResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credentials = freezed,
    Object? userProfile = freezed,
    Object? caregiverState = freezed,
    Object? streamToken = freezed,
  }) {
    return _then(_$_UserResponse(
      credentials: freezed == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as AuthCredentials?,
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      caregiverState: freezed == caregiverState
          ? _value.caregiverState
          : caregiverState // ignore: cast_nullable_to_non_nullable
              as CaregiverState?,
      streamToken: freezed == streamToken
          ? _value.streamToken
          : streamToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserResponse implements _UserResponse {
  _$_UserResponse(
      {@JsonKey(name: 'credentials') this.credentials,
      @JsonKey(name: 'userProfile') this.userProfile,
      @JsonKey(name: 'caregiverProfile') this.caregiverState,
      @JsonKey(name: 'getStreamToken') this.streamToken});

  factory _$_UserResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UserResponseFromJson(json);

  @override
  @JsonKey(name: 'credentials')
  final AuthCredentials? credentials;
  @override
  @JsonKey(name: 'userProfile')
  final UserProfile? userProfile;
  @override
  @JsonKey(name: 'caregiverProfile')
  final CaregiverState? caregiverState;
  @override
  @JsonKey(name: 'getStreamToken')
  final String? streamToken;

  @override
  String toString() {
    return 'UserResponse(credentials: $credentials, userProfile: $userProfile, caregiverState: $caregiverState, streamToken: $streamToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserResponse &&
            (identical(other.credentials, credentials) ||
                other.credentials == credentials) &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile) &&
            (identical(other.caregiverState, caregiverState) ||
                other.caregiverState == caregiverState) &&
            (identical(other.streamToken, streamToken) ||
                other.streamToken == streamToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, credentials, userProfile, caregiverState, streamToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserResponseCopyWith<_$_UserResponse> get copyWith =>
      __$$_UserResponseCopyWithImpl<_$_UserResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserResponseToJson(
      this,
    );
  }
}

abstract class _UserResponse implements UserResponse {
  factory _UserResponse(
      {@JsonKey(name: 'credentials')
          final AuthCredentials? credentials,
      @JsonKey(name: 'userProfile')
          final UserProfile? userProfile,
      @JsonKey(name: 'caregiverProfile')
          final CaregiverState? caregiverState,
      @JsonKey(name: 'getStreamToken')
          final String? streamToken}) = _$_UserResponse;

  factory _UserResponse.fromJson(Map<String, dynamic> json) =
      _$_UserResponse.fromJson;

  @override
  @JsonKey(name: 'credentials')
  AuthCredentials? get credentials;
  @override
  @JsonKey(name: 'userProfile')
  UserProfile? get userProfile;
  @override
  @JsonKey(name: 'caregiverProfile')
  CaregiverState? get caregiverState;
  @override
  @JsonKey(name: 'getStreamToken')
  String? get streamToken;
  @override
  @JsonKey(ignore: true)
  _$$_UserResponseCopyWith<_$_UserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
