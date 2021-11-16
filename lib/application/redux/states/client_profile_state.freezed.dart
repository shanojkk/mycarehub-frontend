// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'client_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientProfileState _$ClientProfileStateFromJson(Map<String, dynamic> json) {
  return _ClientProfileState.fromJson(json);
}

/// @nodoc
class _$ClientProfileStateTearOff {
  const _$ClientProfileStateTearOff();

  _ClientProfileState call(
      {MyAfyaUserProfile? myAfyaUserProfile,
      CommunicationSettings? communicationSettings,
      AuthCredentialResponse? auth,
      bool? isSignedIn,
      String? inActivitySetInTime,
      String? signedInTime,
      bool? isFirstLaunch,
      List<SecurityQuestion>? securityQuestions,
      Map<String, SecurityQuestionResponse>? securityQuestionsResponses,
      bool? active}) {
    return _ClientProfileState(
      myAfyaUserProfile: myAfyaUserProfile,
      communicationSettings: communicationSettings,
      auth: auth,
      isSignedIn: isSignedIn,
      inActivitySetInTime: inActivitySetInTime,
      signedInTime: signedInTime,
      isFirstLaunch: isFirstLaunch,
      securityQuestions: securityQuestions,
      securityQuestionsResponses: securityQuestionsResponses,
      active: active,
    );
  }

  ClientProfileState fromJson(Map<String, Object> json) {
    return ClientProfileState.fromJson(json);
  }
}

/// @nodoc
const $ClientProfileState = _$ClientProfileStateTearOff();

/// @nodoc
mixin _$ClientProfileState {
  MyAfyaUserProfile? get myAfyaUserProfile =>
      throw _privateConstructorUsedError;
  CommunicationSettings? get communicationSettings =>
      throw _privateConstructorUsedError;
  AuthCredentialResponse? get auth => throw _privateConstructorUsedError;
  bool? get isSignedIn => throw _privateConstructorUsedError;
  String? get inActivitySetInTime => throw _privateConstructorUsedError;
  String? get signedInTime => throw _privateConstructorUsedError;
  bool? get isFirstLaunch => throw _privateConstructorUsedError;
  List<SecurityQuestion>? get securityQuestions =>
      throw _privateConstructorUsedError;
  Map<String, SecurityQuestionResponse>? get securityQuestionsResponses =>
      throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientProfileStateCopyWith<ClientProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientProfileStateCopyWith<$Res> {
  factory $ClientProfileStateCopyWith(
          ClientProfileState value, $Res Function(ClientProfileState) then) =
      _$ClientProfileStateCopyWithImpl<$Res>;
  $Res call(
      {MyAfyaUserProfile? myAfyaUserProfile,
      CommunicationSettings? communicationSettings,
      AuthCredentialResponse? auth,
      bool? isSignedIn,
      String? inActivitySetInTime,
      String? signedInTime,
      bool? isFirstLaunch,
      List<SecurityQuestion>? securityQuestions,
      Map<String, SecurityQuestionResponse>? securityQuestionsResponses,
      bool? active});

  $MyAfyaUserProfileCopyWith<$Res>? get myAfyaUserProfile;
  $CommunicationSettingsCopyWith<$Res>? get communicationSettings;
  $AuthCredentialResponseCopyWith<$Res>? get auth;
}

/// @nodoc
class _$ClientProfileStateCopyWithImpl<$Res>
    implements $ClientProfileStateCopyWith<$Res> {
  _$ClientProfileStateCopyWithImpl(this._value, this._then);

  final ClientProfileState _value;
  // ignore: unused_field
  final $Res Function(ClientProfileState) _then;

  @override
  $Res call({
    Object? myAfyaUserProfile = freezed,
    Object? communicationSettings = freezed,
    Object? auth = freezed,
    Object? isSignedIn = freezed,
    Object? inActivitySetInTime = freezed,
    Object? signedInTime = freezed,
    Object? isFirstLaunch = freezed,
    Object? securityQuestions = freezed,
    Object? securityQuestionsResponses = freezed,
    Object? active = freezed,
  }) {
    return _then(_value.copyWith(
      myAfyaUserProfile: myAfyaUserProfile == freezed
          ? _value.myAfyaUserProfile
          : myAfyaUserProfile // ignore: cast_nullable_to_non_nullable
              as MyAfyaUserProfile?,
      communicationSettings: communicationSettings == freezed
          ? _value.communicationSettings
          : communicationSettings // ignore: cast_nullable_to_non_nullable
              as CommunicationSettings?,
      auth: auth == freezed
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as AuthCredentialResponse?,
      isSignedIn: isSignedIn == freezed
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      inActivitySetInTime: inActivitySetInTime == freezed
          ? _value.inActivitySetInTime
          : inActivitySetInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      signedInTime: signedInTime == freezed
          ? _value.signedInTime
          : signedInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isFirstLaunch: isFirstLaunch == freezed
          ? _value.isFirstLaunch
          : isFirstLaunch // ignore: cast_nullable_to_non_nullable
              as bool?,
      securityQuestions: securityQuestions == freezed
          ? _value.securityQuestions
          : securityQuestions // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestion>?,
      securityQuestionsResponses: securityQuestionsResponses == freezed
          ? _value.securityQuestionsResponses
          : securityQuestionsResponses // ignore: cast_nullable_to_non_nullable
              as Map<String, SecurityQuestionResponse>?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $MyAfyaUserProfileCopyWith<$Res>? get myAfyaUserProfile {
    if (_value.myAfyaUserProfile == null) {
      return null;
    }

    return $MyAfyaUserProfileCopyWith<$Res>(_value.myAfyaUserProfile!, (value) {
      return _then(_value.copyWith(myAfyaUserProfile: value));
    });
  }

  @override
  $CommunicationSettingsCopyWith<$Res>? get communicationSettings {
    if (_value.communicationSettings == null) {
      return null;
    }

    return $CommunicationSettingsCopyWith<$Res>(_value.communicationSettings!,
        (value) {
      return _then(_value.copyWith(communicationSettings: value));
    });
  }

  @override
  $AuthCredentialResponseCopyWith<$Res>? get auth {
    if (_value.auth == null) {
      return null;
    }

    return $AuthCredentialResponseCopyWith<$Res>(_value.auth!, (value) {
      return _then(_value.copyWith(auth: value));
    });
  }
}

/// @nodoc
abstract class _$ClientProfileStateCopyWith<$Res>
    implements $ClientProfileStateCopyWith<$Res> {
  factory _$ClientProfileStateCopyWith(
          _ClientProfileState value, $Res Function(_ClientProfileState) then) =
      __$ClientProfileStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {MyAfyaUserProfile? myAfyaUserProfile,
      CommunicationSettings? communicationSettings,
      AuthCredentialResponse? auth,
      bool? isSignedIn,
      String? inActivitySetInTime,
      String? signedInTime,
      bool? isFirstLaunch,
      List<SecurityQuestion>? securityQuestions,
      Map<String, SecurityQuestionResponse>? securityQuestionsResponses,
      bool? active});

  @override
  $MyAfyaUserProfileCopyWith<$Res>? get myAfyaUserProfile;
  @override
  $CommunicationSettingsCopyWith<$Res>? get communicationSettings;
  @override
  $AuthCredentialResponseCopyWith<$Res>? get auth;
}

/// @nodoc
class __$ClientProfileStateCopyWithImpl<$Res>
    extends _$ClientProfileStateCopyWithImpl<$Res>
    implements _$ClientProfileStateCopyWith<$Res> {
  __$ClientProfileStateCopyWithImpl(
      _ClientProfileState _value, $Res Function(_ClientProfileState) _then)
      : super(_value, (v) => _then(v as _ClientProfileState));

  @override
  _ClientProfileState get _value => super._value as _ClientProfileState;

  @override
  $Res call({
    Object? myAfyaUserProfile = freezed,
    Object? communicationSettings = freezed,
    Object? auth = freezed,
    Object? isSignedIn = freezed,
    Object? inActivitySetInTime = freezed,
    Object? signedInTime = freezed,
    Object? isFirstLaunch = freezed,
    Object? securityQuestions = freezed,
    Object? securityQuestionsResponses = freezed,
    Object? active = freezed,
  }) {
    return _then(_ClientProfileState(
      myAfyaUserProfile: myAfyaUserProfile == freezed
          ? _value.myAfyaUserProfile
          : myAfyaUserProfile // ignore: cast_nullable_to_non_nullable
              as MyAfyaUserProfile?,
      communicationSettings: communicationSettings == freezed
          ? _value.communicationSettings
          : communicationSettings // ignore: cast_nullable_to_non_nullable
              as CommunicationSettings?,
      auth: auth == freezed
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as AuthCredentialResponse?,
      isSignedIn: isSignedIn == freezed
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      inActivitySetInTime: inActivitySetInTime == freezed
          ? _value.inActivitySetInTime
          : inActivitySetInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      signedInTime: signedInTime == freezed
          ? _value.signedInTime
          : signedInTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isFirstLaunch: isFirstLaunch == freezed
          ? _value.isFirstLaunch
          : isFirstLaunch // ignore: cast_nullable_to_non_nullable
              as bool?,
      securityQuestions: securityQuestions == freezed
          ? _value.securityQuestions
          : securityQuestions // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestion>?,
      securityQuestionsResponses: securityQuestionsResponses == freezed
          ? _value.securityQuestionsResponses
          : securityQuestionsResponses // ignore: cast_nullable_to_non_nullable
              as Map<String, SecurityQuestionResponse>?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientProfileState implements _ClientProfileState {
  _$_ClientProfileState(
      {this.myAfyaUserProfile,
      this.communicationSettings,
      this.auth,
      this.isSignedIn,
      this.inActivitySetInTime,
      this.signedInTime,
      this.isFirstLaunch,
      this.securityQuestions,
      this.securityQuestionsResponses,
      this.active});

  factory _$_ClientProfileState.fromJson(Map<String, dynamic> json) =>
      _$_$_ClientProfileStateFromJson(json);

  @override
  final MyAfyaUserProfile? myAfyaUserProfile;
  @override
  final CommunicationSettings? communicationSettings;
  @override
  final AuthCredentialResponse? auth;
  @override
  final bool? isSignedIn;
  @override
  final String? inActivitySetInTime;
  @override
  final String? signedInTime;
  @override
  final bool? isFirstLaunch;
  @override
  final List<SecurityQuestion>? securityQuestions;
  @override
  final Map<String, SecurityQuestionResponse>? securityQuestionsResponses;
  @override
  final bool? active;

  @override
  String toString() {
    return 'ClientProfileState(myAfyaUserProfile: $myAfyaUserProfile, communicationSettings: $communicationSettings, auth: $auth, isSignedIn: $isSignedIn, inActivitySetInTime: $inActivitySetInTime, signedInTime: $signedInTime, isFirstLaunch: $isFirstLaunch, securityQuestions: $securityQuestions, securityQuestionsResponses: $securityQuestionsResponses, active: $active)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ClientProfileState &&
            (identical(other.myAfyaUserProfile, myAfyaUserProfile) ||
                const DeepCollectionEquality()
                    .equals(other.myAfyaUserProfile, myAfyaUserProfile)) &&
            (identical(other.communicationSettings, communicationSettings) ||
                const DeepCollectionEquality().equals(
                    other.communicationSettings, communicationSettings)) &&
            (identical(other.auth, auth) ||
                const DeepCollectionEquality().equals(other.auth, auth)) &&
            (identical(other.isSignedIn, isSignedIn) ||
                const DeepCollectionEquality()
                    .equals(other.isSignedIn, isSignedIn)) &&
            (identical(other.inActivitySetInTime, inActivitySetInTime) ||
                const DeepCollectionEquality()
                    .equals(other.inActivitySetInTime, inActivitySetInTime)) &&
            (identical(other.signedInTime, signedInTime) ||
                const DeepCollectionEquality()
                    .equals(other.signedInTime, signedInTime)) &&
            (identical(other.isFirstLaunch, isFirstLaunch) ||
                const DeepCollectionEquality()
                    .equals(other.isFirstLaunch, isFirstLaunch)) &&
            (identical(other.securityQuestions, securityQuestions) ||
                const DeepCollectionEquality()
                    .equals(other.securityQuestions, securityQuestions)) &&
            (identical(other.securityQuestionsResponses,
                    securityQuestionsResponses) ||
                const DeepCollectionEquality().equals(
                    other.securityQuestionsResponses,
                    securityQuestionsResponses)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(myAfyaUserProfile) ^
      const DeepCollectionEquality().hash(communicationSettings) ^
      const DeepCollectionEquality().hash(auth) ^
      const DeepCollectionEquality().hash(isSignedIn) ^
      const DeepCollectionEquality().hash(inActivitySetInTime) ^
      const DeepCollectionEquality().hash(signedInTime) ^
      const DeepCollectionEquality().hash(isFirstLaunch) ^
      const DeepCollectionEquality().hash(securityQuestions) ^
      const DeepCollectionEquality().hash(securityQuestionsResponses) ^
      const DeepCollectionEquality().hash(active);

  @JsonKey(ignore: true)
  @override
  _$ClientProfileStateCopyWith<_ClientProfileState> get copyWith =>
      __$ClientProfileStateCopyWithImpl<_ClientProfileState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ClientProfileStateToJson(this);
  }
}

abstract class _ClientProfileState implements ClientProfileState {
  factory _ClientProfileState(
      {MyAfyaUserProfile? myAfyaUserProfile,
      CommunicationSettings? communicationSettings,
      AuthCredentialResponse? auth,
      bool? isSignedIn,
      String? inActivitySetInTime,
      String? signedInTime,
      bool? isFirstLaunch,
      List<SecurityQuestion>? securityQuestions,
      Map<String, SecurityQuestionResponse>? securityQuestionsResponses,
      bool? active}) = _$_ClientProfileState;

  factory _ClientProfileState.fromJson(Map<String, dynamic> json) =
      _$_ClientProfileState.fromJson;

  @override
  MyAfyaUserProfile? get myAfyaUserProfile =>
      throw _privateConstructorUsedError;
  @override
  CommunicationSettings? get communicationSettings =>
      throw _privateConstructorUsedError;
  @override
  AuthCredentialResponse? get auth => throw _privateConstructorUsedError;
  @override
  bool? get isSignedIn => throw _privateConstructorUsedError;
  @override
  String? get inActivitySetInTime => throw _privateConstructorUsedError;
  @override
  String? get signedInTime => throw _privateConstructorUsedError;
  @override
  bool? get isFirstLaunch => throw _privateConstructorUsedError;
  @override
  List<SecurityQuestion>? get securityQuestions =>
      throw _privateConstructorUsedError;
  @override
  Map<String, SecurityQuestionResponse>? get securityQuestionsResponses =>
      throw _privateConstructorUsedError;
  @override
  bool? get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ClientProfileStateCopyWith<_ClientProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
