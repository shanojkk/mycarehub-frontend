// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OnboardingState _$OnboardingStateFromJson(Map<String, dynamic> json) {
  return _OnboardingState.fromJson(json);
}

/// @nodoc
mixin _$OnboardingState {
  TermsAndConditions? get termsAndConditions =>
      throw _privateConstructorUsedError;
  List<SecurityQuestion>? get securityQuestions =>
      throw _privateConstructorUsedError;
  List<SecurityQuestionResponse>? get securityQuestionResponses =>
      throw _privateConstructorUsedError;
  VerifySecurityQuestionsState? get verifySecurityQuestionsState =>
      throw _privateConstructorUsedError;

  ///------------WORKFLOW RELATED BOOLEANS------------
  /// Have standardized shared values that will be used across all states
  /// regardless of the workflow
// The current stage of onboarding that the user is in
  CurrentOnboardingStage? get currentOnboardingStage =>
      throw _privateConstructorUsedError; // If the user has verified their phone number
  bool? get isPhoneVerified =>
      throw _privateConstructorUsedError; // If the user has set their security questions
  bool? get hasSetSecurityQuestions =>
      throw _privateConstructorUsedError; // If the user has successfully verified their security questions if pin is expired
  bool? get hasVerifiedSecurityQuestions =>
      throw _privateConstructorUsedError; // If the user has set their nickname
  bool? get hasSetNickName =>
      throw _privateConstructorUsedError; // Whether the user's PIN has been set
  bool? get hasSetPin =>
      throw _privateConstructorUsedError; // Whether the user has accepted terms and conditions
  bool? get hasAcceptedTerms => throw _privateConstructorUsedError;

  ///------------WORKFLOW RELATED VALUES------------
// The currently active user's phone number
  String? get phoneNumber => throw _privateConstructorUsedError; // The PIN
  String? get pin => throw _privateConstructorUsedError; // The confirm PIN
  String? get confirmPIN =>
      throw _privateConstructorUsedError; // The OTP used when confirming the phone number
  String? get otp => throw _privateConstructorUsedError;

  ///------------LOGIN RELATED VALUES------------
// The number of failed login attempts that this user has
  int? get failedLoginCount =>
      throw _privateConstructorUsedError; // Whether the credentials this user entered are invalid
  bool? get invalidCredentials => throw _privateConstructorUsedError;

  ///------------VERIFY PHONE RELATED VALUES------------
// If the OTP entered is invalid
  bool? get invalidOTP =>
      throw _privateConstructorUsedError; // Whether there was a failure while sending an OTP
  bool? get failedToSendOTP =>
      throw _privateConstructorUsedError; //  Whether the user is allowed to resend their PIN
  bool? get canResendOTP => throw _privateConstructorUsedError;
  String? get nickName => throw _privateConstructorUsedError;
  bool? get isClient => throw _privateConstructorUsedError;
  bool? get isCaregiver => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res>;
  $Res call(
      {TermsAndConditions? termsAndConditions,
      List<SecurityQuestion>? securityQuestions,
      List<SecurityQuestionResponse>? securityQuestionResponses,
      VerifySecurityQuestionsState? verifySecurityQuestionsState,
      CurrentOnboardingStage? currentOnboardingStage,
      bool? isPhoneVerified,
      bool? hasSetSecurityQuestions,
      bool? hasVerifiedSecurityQuestions,
      bool? hasSetNickName,
      bool? hasSetPin,
      bool? hasAcceptedTerms,
      String? phoneNumber,
      String? pin,
      String? confirmPIN,
      String? otp,
      int? failedLoginCount,
      bool? invalidCredentials,
      bool? invalidOTP,
      bool? failedToSendOTP,
      bool? canResendOTP,
      String? nickName,
      bool? isClient,
      bool? isCaregiver});

  $TermsAndConditionsCopyWith<$Res>? get termsAndConditions;
  $VerifySecurityQuestionsStateCopyWith<$Res>? get verifySecurityQuestionsState;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  final OnboardingState _value;
  // ignore: unused_field
  final $Res Function(OnboardingState) _then;

  @override
  $Res call({
    Object? termsAndConditions = freezed,
    Object? securityQuestions = freezed,
    Object? securityQuestionResponses = freezed,
    Object? verifySecurityQuestionsState = freezed,
    Object? currentOnboardingStage = freezed,
    Object? isPhoneVerified = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? hasVerifiedSecurityQuestions = freezed,
    Object? hasSetNickName = freezed,
    Object? hasSetPin = freezed,
    Object? hasAcceptedTerms = freezed,
    Object? phoneNumber = freezed,
    Object? pin = freezed,
    Object? confirmPIN = freezed,
    Object? otp = freezed,
    Object? failedLoginCount = freezed,
    Object? invalidCredentials = freezed,
    Object? invalidOTP = freezed,
    Object? failedToSendOTP = freezed,
    Object? canResendOTP = freezed,
    Object? nickName = freezed,
    Object? isClient = freezed,
    Object? isCaregiver = freezed,
  }) {
    return _then(_value.copyWith(
      termsAndConditions: termsAndConditions == freezed
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as TermsAndConditions?,
      securityQuestions: securityQuestions == freezed
          ? _value.securityQuestions
          : securityQuestions // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestion>?,
      securityQuestionResponses: securityQuestionResponses == freezed
          ? _value.securityQuestionResponses
          : securityQuestionResponses // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestionResponse>?,
      verifySecurityQuestionsState: verifySecurityQuestionsState == freezed
          ? _value.verifySecurityQuestionsState
          : verifySecurityQuestionsState // ignore: cast_nullable_to_non_nullable
              as VerifySecurityQuestionsState?,
      currentOnboardingStage: currentOnboardingStage == freezed
          ? _value.currentOnboardingStage
          : currentOnboardingStage // ignore: cast_nullable_to_non_nullable
              as CurrentOnboardingStage?,
      isPhoneVerified: isPhoneVerified == freezed
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: hasSetSecurityQuestions == freezed
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasVerifiedSecurityQuestions: hasVerifiedSecurityQuestions == freezed
          ? _value.hasVerifiedSecurityQuestions
          : hasVerifiedSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetNickName: hasSetNickName == freezed
          ? _value.hasSetNickName
          : hasSetNickName // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetPin: hasSetPin == freezed
          ? _value.hasSetPin
          : hasSetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasAcceptedTerms: hasAcceptedTerms == freezed
          ? _value.hasAcceptedTerms
          : hasAcceptedTerms // ignore: cast_nullable_to_non_nullable
              as bool?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: pin == freezed
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPIN: confirmPIN == freezed
          ? _value.confirmPIN
          : confirmPIN // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      failedLoginCount: failedLoginCount == freezed
          ? _value.failedLoginCount
          : failedLoginCount // ignore: cast_nullable_to_non_nullable
              as int?,
      invalidCredentials: invalidCredentials == freezed
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool?,
      invalidOTP: invalidOTP == freezed
          ? _value.invalidOTP
          : invalidOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
      failedToSendOTP: failedToSendOTP == freezed
          ? _value.failedToSendOTP
          : failedToSendOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
      canResendOTP: canResendOTP == freezed
          ? _value.canResendOTP
          : canResendOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
      nickName: nickName == freezed
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      isClient: isClient == freezed
          ? _value.isClient
          : isClient // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCaregiver: isCaregiver == freezed
          ? _value.isCaregiver
          : isCaregiver // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $TermsAndConditionsCopyWith<$Res>? get termsAndConditions {
    if (_value.termsAndConditions == null) {
      return null;
    }

    return $TermsAndConditionsCopyWith<$Res>(_value.termsAndConditions!,
        (value) {
      return _then(_value.copyWith(termsAndConditions: value));
    });
  }

  @override
  $VerifySecurityQuestionsStateCopyWith<$Res>?
      get verifySecurityQuestionsState {
    if (_value.verifySecurityQuestionsState == null) {
      return null;
    }

    return $VerifySecurityQuestionsStateCopyWith<$Res>(
        _value.verifySecurityQuestionsState!, (value) {
      return _then(_value.copyWith(verifySecurityQuestionsState: value));
    });
  }
}

/// @nodoc
abstract class _$$_OnboardingStateCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$_OnboardingStateCopyWith(
          _$_OnboardingState value, $Res Function(_$_OnboardingState) then) =
      __$$_OnboardingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {TermsAndConditions? termsAndConditions,
      List<SecurityQuestion>? securityQuestions,
      List<SecurityQuestionResponse>? securityQuestionResponses,
      VerifySecurityQuestionsState? verifySecurityQuestionsState,
      CurrentOnboardingStage? currentOnboardingStage,
      bool? isPhoneVerified,
      bool? hasSetSecurityQuestions,
      bool? hasVerifiedSecurityQuestions,
      bool? hasSetNickName,
      bool? hasSetPin,
      bool? hasAcceptedTerms,
      String? phoneNumber,
      String? pin,
      String? confirmPIN,
      String? otp,
      int? failedLoginCount,
      bool? invalidCredentials,
      bool? invalidOTP,
      bool? failedToSendOTP,
      bool? canResendOTP,
      String? nickName,
      bool? isClient,
      bool? isCaregiver});

  @override
  $TermsAndConditionsCopyWith<$Res>? get termsAndConditions;
  @override
  $VerifySecurityQuestionsStateCopyWith<$Res>? get verifySecurityQuestionsState;
}

/// @nodoc
class __$$_OnboardingStateCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res>
    implements _$$_OnboardingStateCopyWith<$Res> {
  __$$_OnboardingStateCopyWithImpl(
      _$_OnboardingState _value, $Res Function(_$_OnboardingState) _then)
      : super(_value, (v) => _then(v as _$_OnboardingState));

  @override
  _$_OnboardingState get _value => super._value as _$_OnboardingState;

  @override
  $Res call({
    Object? termsAndConditions = freezed,
    Object? securityQuestions = freezed,
    Object? securityQuestionResponses = freezed,
    Object? verifySecurityQuestionsState = freezed,
    Object? currentOnboardingStage = freezed,
    Object? isPhoneVerified = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? hasVerifiedSecurityQuestions = freezed,
    Object? hasSetNickName = freezed,
    Object? hasSetPin = freezed,
    Object? hasAcceptedTerms = freezed,
    Object? phoneNumber = freezed,
    Object? pin = freezed,
    Object? confirmPIN = freezed,
    Object? otp = freezed,
    Object? failedLoginCount = freezed,
    Object? invalidCredentials = freezed,
    Object? invalidOTP = freezed,
    Object? failedToSendOTP = freezed,
    Object? canResendOTP = freezed,
    Object? nickName = freezed,
    Object? isClient = freezed,
    Object? isCaregiver = freezed,
  }) {
    return _then(_$_OnboardingState(
      termsAndConditions: termsAndConditions == freezed
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as TermsAndConditions?,
      securityQuestions: securityQuestions == freezed
          ? _value.securityQuestions
          : securityQuestions // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestion>?,
      securityQuestionResponses: securityQuestionResponses == freezed
          ? _value.securityQuestionResponses
          : securityQuestionResponses // ignore: cast_nullable_to_non_nullable
              as List<SecurityQuestionResponse>?,
      verifySecurityQuestionsState: verifySecurityQuestionsState == freezed
          ? _value.verifySecurityQuestionsState
          : verifySecurityQuestionsState // ignore: cast_nullable_to_non_nullable
              as VerifySecurityQuestionsState?,
      currentOnboardingStage: currentOnboardingStage == freezed
          ? _value.currentOnboardingStage
          : currentOnboardingStage // ignore: cast_nullable_to_non_nullable
              as CurrentOnboardingStage?,
      isPhoneVerified: isPhoneVerified == freezed
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: hasSetSecurityQuestions == freezed
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasVerifiedSecurityQuestions: hasVerifiedSecurityQuestions == freezed
          ? _value.hasVerifiedSecurityQuestions
          : hasVerifiedSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetNickName: hasSetNickName == freezed
          ? _value.hasSetNickName
          : hasSetNickName // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetPin: hasSetPin == freezed
          ? _value.hasSetPin
          : hasSetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasAcceptedTerms: hasAcceptedTerms == freezed
          ? _value.hasAcceptedTerms
          : hasAcceptedTerms // ignore: cast_nullable_to_non_nullable
              as bool?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: pin == freezed
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPIN: confirmPIN == freezed
          ? _value.confirmPIN
          : confirmPIN // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      failedLoginCount: failedLoginCount == freezed
          ? _value.failedLoginCount
          : failedLoginCount // ignore: cast_nullable_to_non_nullable
              as int?,
      invalidCredentials: invalidCredentials == freezed
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool?,
      invalidOTP: invalidOTP == freezed
          ? _value.invalidOTP
          : invalidOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
      failedToSendOTP: failedToSendOTP == freezed
          ? _value.failedToSendOTP
          : failedToSendOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
      canResendOTP: canResendOTP == freezed
          ? _value.canResendOTP
          : canResendOTP // ignore: cast_nullable_to_non_nullable
              as bool?,
      nickName: nickName == freezed
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      isClient: isClient == freezed
          ? _value.isClient
          : isClient // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCaregiver: isCaregiver == freezed
          ? _value.isCaregiver
          : isCaregiver // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OnboardingState implements _OnboardingState {
  _$_OnboardingState(
      {this.termsAndConditions,
      this.securityQuestions,
      this.securityQuestionResponses,
      this.verifySecurityQuestionsState,
      this.currentOnboardingStage,
      this.isPhoneVerified,
      this.hasSetSecurityQuestions,
      this.hasVerifiedSecurityQuestions,
      this.hasSetNickName,
      this.hasSetPin,
      this.hasAcceptedTerms,
      this.phoneNumber,
      this.pin,
      this.confirmPIN,
      this.otp,
      this.failedLoginCount,
      this.invalidCredentials,
      this.invalidOTP,
      this.failedToSendOTP,
      this.canResendOTP,
      this.nickName,
      this.isClient,
      this.isCaregiver});

  factory _$_OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$$_OnboardingStateFromJson(json);

  @override
  final TermsAndConditions? termsAndConditions;
  @override
  final List<SecurityQuestion>? securityQuestions;
  @override
  final List<SecurityQuestionResponse>? securityQuestionResponses;
  @override
  final VerifySecurityQuestionsState? verifySecurityQuestionsState;

  ///------------WORKFLOW RELATED BOOLEANS------------
  /// Have standardized shared values that will be used across all states
  /// regardless of the workflow
// The current stage of onboarding that the user is in
  @override
  final CurrentOnboardingStage? currentOnboardingStage;
// If the user has verified their phone number
  @override
  final bool? isPhoneVerified;
// If the user has set their security questions
  @override
  final bool? hasSetSecurityQuestions;
// If the user has successfully verified their security questions if pin is expired
  @override
  final bool? hasVerifiedSecurityQuestions;
// If the user has set their nickname
  @override
  final bool? hasSetNickName;
// Whether the user's PIN has been set
  @override
  final bool? hasSetPin;
// Whether the user has accepted terms and conditions
  @override
  final bool? hasAcceptedTerms;

  ///------------WORKFLOW RELATED VALUES------------
// The currently active user's phone number
  @override
  final String? phoneNumber;
// The PIN
  @override
  final String? pin;
// The confirm PIN
  @override
  final String? confirmPIN;
// The OTP used when confirming the phone number
  @override
  final String? otp;

  ///------------LOGIN RELATED VALUES------------
// The number of failed login attempts that this user has
  @override
  final int? failedLoginCount;
// Whether the credentials this user entered are invalid
  @override
  final bool? invalidCredentials;

  ///------------VERIFY PHONE RELATED VALUES------------
// If the OTP entered is invalid
  @override
  final bool? invalidOTP;
// Whether there was a failure while sending an OTP
  @override
  final bool? failedToSendOTP;
//  Whether the user is allowed to resend their PIN
  @override
  final bool? canResendOTP;
  @override
  final String? nickName;
  @override
  final bool? isClient;
  @override
  final bool? isCaregiver;

  @override
  String toString() {
    return 'OnboardingState(termsAndConditions: $termsAndConditions, securityQuestions: $securityQuestions, securityQuestionResponses: $securityQuestionResponses, verifySecurityQuestionsState: $verifySecurityQuestionsState, currentOnboardingStage: $currentOnboardingStage, isPhoneVerified: $isPhoneVerified, hasSetSecurityQuestions: $hasSetSecurityQuestions, hasVerifiedSecurityQuestions: $hasVerifiedSecurityQuestions, hasSetNickName: $hasSetNickName, hasSetPin: $hasSetPin, hasAcceptedTerms: $hasAcceptedTerms, phoneNumber: $phoneNumber, pin: $pin, confirmPIN: $confirmPIN, otp: $otp, failedLoginCount: $failedLoginCount, invalidCredentials: $invalidCredentials, invalidOTP: $invalidOTP, failedToSendOTP: $failedToSendOTP, canResendOTP: $canResendOTP, nickName: $nickName, isClient: $isClient, isCaregiver: $isCaregiver)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnboardingState &&
            const DeepCollectionEquality()
                .equals(other.termsAndConditions, termsAndConditions) &&
            const DeepCollectionEquality()
                .equals(other.securityQuestions, securityQuestions) &&
            const DeepCollectionEquality().equals(
                other.securityQuestionResponses, securityQuestionResponses) &&
            const DeepCollectionEquality().equals(
                other.verifySecurityQuestionsState,
                verifySecurityQuestionsState) &&
            const DeepCollectionEquality()
                .equals(other.currentOnboardingStage, currentOnboardingStage) &&
            const DeepCollectionEquality()
                .equals(other.isPhoneVerified, isPhoneVerified) &&
            const DeepCollectionEquality().equals(
                other.hasSetSecurityQuestions, hasSetSecurityQuestions) &&
            const DeepCollectionEquality().equals(
                other.hasVerifiedSecurityQuestions,
                hasVerifiedSecurityQuestions) &&
            const DeepCollectionEquality()
                .equals(other.hasSetNickName, hasSetNickName) &&
            const DeepCollectionEquality().equals(other.hasSetPin, hasSetPin) &&
            const DeepCollectionEquality()
                .equals(other.hasAcceptedTerms, hasAcceptedTerms) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.pin, pin) &&
            const DeepCollectionEquality()
                .equals(other.confirmPIN, confirmPIN) &&
            const DeepCollectionEquality().equals(other.otp, otp) &&
            const DeepCollectionEquality()
                .equals(other.failedLoginCount, failedLoginCount) &&
            const DeepCollectionEquality()
                .equals(other.invalidCredentials, invalidCredentials) &&
            const DeepCollectionEquality()
                .equals(other.invalidOTP, invalidOTP) &&
            const DeepCollectionEquality()
                .equals(other.failedToSendOTP, failedToSendOTP) &&
            const DeepCollectionEquality()
                .equals(other.canResendOTP, canResendOTP) &&
            const DeepCollectionEquality().equals(other.nickName, nickName) &&
            const DeepCollectionEquality().equals(other.isClient, isClient) &&
            const DeepCollectionEquality()
                .equals(other.isCaregiver, isCaregiver));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(termsAndConditions),
        const DeepCollectionEquality().hash(securityQuestions),
        const DeepCollectionEquality().hash(securityQuestionResponses),
        const DeepCollectionEquality().hash(verifySecurityQuestionsState),
        const DeepCollectionEquality().hash(currentOnboardingStage),
        const DeepCollectionEquality().hash(isPhoneVerified),
        const DeepCollectionEquality().hash(hasSetSecurityQuestions),
        const DeepCollectionEquality().hash(hasVerifiedSecurityQuestions),
        const DeepCollectionEquality().hash(hasSetNickName),
        const DeepCollectionEquality().hash(hasSetPin),
        const DeepCollectionEquality().hash(hasAcceptedTerms),
        const DeepCollectionEquality().hash(phoneNumber),
        const DeepCollectionEquality().hash(pin),
        const DeepCollectionEquality().hash(confirmPIN),
        const DeepCollectionEquality().hash(otp),
        const DeepCollectionEquality().hash(failedLoginCount),
        const DeepCollectionEquality().hash(invalidCredentials),
        const DeepCollectionEquality().hash(invalidOTP),
        const DeepCollectionEquality().hash(failedToSendOTP),
        const DeepCollectionEquality().hash(canResendOTP),
        const DeepCollectionEquality().hash(nickName),
        const DeepCollectionEquality().hash(isClient),
        const DeepCollectionEquality().hash(isCaregiver)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_OnboardingStateCopyWith<_$_OnboardingState> get copyWith =>
      __$$_OnboardingStateCopyWithImpl<_$_OnboardingState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OnboardingStateToJson(
      this,
    );
  }
}

abstract class _OnboardingState implements OnboardingState {
  factory _OnboardingState(
      {final TermsAndConditions? termsAndConditions,
      final List<SecurityQuestion>? securityQuestions,
      final List<SecurityQuestionResponse>? securityQuestionResponses,
      final VerifySecurityQuestionsState? verifySecurityQuestionsState,
      final CurrentOnboardingStage? currentOnboardingStage,
      final bool? isPhoneVerified,
      final bool? hasSetSecurityQuestions,
      final bool? hasVerifiedSecurityQuestions,
      final bool? hasSetNickName,
      final bool? hasSetPin,
      final bool? hasAcceptedTerms,
      final String? phoneNumber,
      final String? pin,
      final String? confirmPIN,
      final String? otp,
      final int? failedLoginCount,
      final bool? invalidCredentials,
      final bool? invalidOTP,
      final bool? failedToSendOTP,
      final bool? canResendOTP,
      final String? nickName,
      final bool? isClient,
      final bool? isCaregiver}) = _$_OnboardingState;

  factory _OnboardingState.fromJson(Map<String, dynamic> json) =
      _$_OnboardingState.fromJson;

  @override
  TermsAndConditions? get termsAndConditions;
  @override
  List<SecurityQuestion>? get securityQuestions;
  @override
  List<SecurityQuestionResponse>? get securityQuestionResponses;
  @override
  VerifySecurityQuestionsState? get verifySecurityQuestionsState;
  @override

  ///------------WORKFLOW RELATED BOOLEANS------------
  /// Have standardized shared values that will be used across all states
  /// regardless of the workflow
// The current stage of onboarding that the user is in
  CurrentOnboardingStage? get currentOnboardingStage;
  @override // If the user has verified their phone number
  bool? get isPhoneVerified;
  @override // If the user has set their security questions
  bool? get hasSetSecurityQuestions;
  @override // If the user has successfully verified their security questions if pin is expired
  bool? get hasVerifiedSecurityQuestions;
  @override // If the user has set their nickname
  bool? get hasSetNickName;
  @override // Whether the user's PIN has been set
  bool? get hasSetPin;
  @override // Whether the user has accepted terms and conditions
  bool? get hasAcceptedTerms;
  @override

  ///------------WORKFLOW RELATED VALUES------------
// The currently active user's phone number
  String? get phoneNumber;
  @override // The PIN
  String? get pin;
  @override // The confirm PIN
  String? get confirmPIN;
  @override // The OTP used when confirming the phone number
  String? get otp;
  @override

  ///------------LOGIN RELATED VALUES------------
// The number of failed login attempts that this user has
  int? get failedLoginCount;
  @override // Whether the credentials this user entered are invalid
  bool? get invalidCredentials;
  @override

  ///------------VERIFY PHONE RELATED VALUES------------
// If the OTP entered is invalid
  bool? get invalidOTP;
  @override // Whether there was a failure while sending an OTP
  bool? get failedToSendOTP;
  @override //  Whether the user is allowed to resend their PIN
  bool? get canResendOTP;
  @override
  String? get nickName;
  @override
  bool? get isClient;
  @override
  bool? get isCaregiver;
  @override
  @JsonKey(ignore: true)
  _$$_OnboardingStateCopyWith<_$_OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}
