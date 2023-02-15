// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'misc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MiscState _$MiscStateFromJson(Map<String, dynamic> json) {
  return _MiscState.fromJson(json);
}

/// @nodoc
mixin _$MiscState {
  @JsonKey(defaultValue: AppRoutes.phoneLogin)
  String get initialRoute => throw _privateConstructorUsedError;
  List<dynamic>? get libraryListItems => throw _privateConstructorUsedError;
  FAQsContentState? get profileFAQsContentState =>
      throw _privateConstructorUsedError;
  String? get healthPagePINInputTime => throw _privateConstructorUsedError;
  int? get pinInputTries => throw _privateConstructorUsedError;
  String? get maxTryTime => throw _privateConstructorUsedError;
  bool? get pinVerified => throw _privateConstructorUsedError;
  bool? get resumeTimer => throw _privateConstructorUsedError;
  ScreeningToolsState? get screeningToolsState =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'fetchClientAppointments')
  AppointmentState? get appointmentState => throw _privateConstructorUsedError;
  String? get inactiveTime => throw _privateConstructorUsedError;
  bool? get resumeWithPin => throw _privateConstructorUsedError;
  List<Survey>? get availableSurveysList =>
      throw _privateConstructorUsedError; // track the number of time a wrong PIN has been input on the resume with PIN workflow
  int? get resumeWithPINRetries =>
      throw _privateConstructorUsedError; // selected survey to be opened
  Survey? get selectedSurvey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MiscStateCopyWith<MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MiscStateCopyWith<$Res> {
  factory $MiscStateCopyWith(MiscState value, $Res Function(MiscState) then) =
      _$MiscStateCopyWithImpl<$Res, MiscState>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: AppRoutes.phoneLogin)
          String initialRoute,
      List<dynamic>? libraryListItems,
      FAQsContentState? profileFAQsContentState,
      String? healthPagePINInputTime,
      int? pinInputTries,
      String? maxTryTime,
      bool? pinVerified,
      bool? resumeTimer,
      ScreeningToolsState? screeningToolsState,
      @JsonKey(name: 'fetchClientAppointments')
          AppointmentState? appointmentState,
      String? inactiveTime,
      bool? resumeWithPin,
      List<Survey>? availableSurveysList,
      int? resumeWithPINRetries,
      Survey? selectedSurvey});

  $FAQsContentStateCopyWith<$Res>? get profileFAQsContentState;
  $ScreeningToolsStateCopyWith<$Res>? get screeningToolsState;
  $AppointmentStateCopyWith<$Res>? get appointmentState;
  $SurveyCopyWith<$Res>? get selectedSurvey;
}

/// @nodoc
class _$MiscStateCopyWithImpl<$Res, $Val extends MiscState>
    implements $MiscStateCopyWith<$Res> {
  _$MiscStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialRoute = null,
    Object? libraryListItems = freezed,
    Object? profileFAQsContentState = freezed,
    Object? healthPagePINInputTime = freezed,
    Object? pinInputTries = freezed,
    Object? maxTryTime = freezed,
    Object? pinVerified = freezed,
    Object? resumeTimer = freezed,
    Object? screeningToolsState = freezed,
    Object? appointmentState = freezed,
    Object? inactiveTime = freezed,
    Object? resumeWithPin = freezed,
    Object? availableSurveysList = freezed,
    Object? resumeWithPINRetries = freezed,
    Object? selectedSurvey = freezed,
  }) {
    return _then(_value.copyWith(
      initialRoute: null == initialRoute
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String,
      libraryListItems: freezed == libraryListItems
          ? _value.libraryListItems
          : libraryListItems // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      profileFAQsContentState: freezed == profileFAQsContentState
          ? _value.profileFAQsContentState
          : profileFAQsContentState // ignore: cast_nullable_to_non_nullable
              as FAQsContentState?,
      healthPagePINInputTime: freezed == healthPagePINInputTime
          ? _value.healthPagePINInputTime
          : healthPagePINInputTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pinInputTries: freezed == pinInputTries
          ? _value.pinInputTries
          : pinInputTries // ignore: cast_nullable_to_non_nullable
              as int?,
      maxTryTime: freezed == maxTryTime
          ? _value.maxTryTime
          : maxTryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pinVerified: freezed == pinVerified
          ? _value.pinVerified
          : pinVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      resumeTimer: freezed == resumeTimer
          ? _value.resumeTimer
          : resumeTimer // ignore: cast_nullable_to_non_nullable
              as bool?,
      screeningToolsState: freezed == screeningToolsState
          ? _value.screeningToolsState
          : screeningToolsState // ignore: cast_nullable_to_non_nullable
              as ScreeningToolsState?,
      appointmentState: freezed == appointmentState
          ? _value.appointmentState
          : appointmentState // ignore: cast_nullable_to_non_nullable
              as AppointmentState?,
      inactiveTime: freezed == inactiveTime
          ? _value.inactiveTime
          : inactiveTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resumeWithPin: freezed == resumeWithPin
          ? _value.resumeWithPin
          : resumeWithPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      availableSurveysList: freezed == availableSurveysList
          ? _value.availableSurveysList
          : availableSurveysList // ignore: cast_nullable_to_non_nullable
              as List<Survey>?,
      resumeWithPINRetries: freezed == resumeWithPINRetries
          ? _value.resumeWithPINRetries
          : resumeWithPINRetries // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedSurvey: freezed == selectedSurvey
          ? _value.selectedSurvey
          : selectedSurvey // ignore: cast_nullable_to_non_nullable
              as Survey?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FAQsContentStateCopyWith<$Res>? get profileFAQsContentState {
    if (_value.profileFAQsContentState == null) {
      return null;
    }

    return $FAQsContentStateCopyWith<$Res>(_value.profileFAQsContentState!,
        (value) {
      return _then(_value.copyWith(profileFAQsContentState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ScreeningToolsStateCopyWith<$Res>? get screeningToolsState {
    if (_value.screeningToolsState == null) {
      return null;
    }

    return $ScreeningToolsStateCopyWith<$Res>(_value.screeningToolsState!,
        (value) {
      return _then(_value.copyWith(screeningToolsState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppointmentStateCopyWith<$Res>? get appointmentState {
    if (_value.appointmentState == null) {
      return null;
    }

    return $AppointmentStateCopyWith<$Res>(_value.appointmentState!, (value) {
      return _then(_value.copyWith(appointmentState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SurveyCopyWith<$Res>? get selectedSurvey {
    if (_value.selectedSurvey == null) {
      return null;
    }

    return $SurveyCopyWith<$Res>(_value.selectedSurvey!, (value) {
      return _then(_value.copyWith(selectedSurvey: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MiscStateCopyWith<$Res> implements $MiscStateCopyWith<$Res> {
  factory _$$_MiscStateCopyWith(
          _$_MiscState value, $Res Function(_$_MiscState) then) =
      __$$_MiscStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: AppRoutes.phoneLogin)
          String initialRoute,
      List<dynamic>? libraryListItems,
      FAQsContentState? profileFAQsContentState,
      String? healthPagePINInputTime,
      int? pinInputTries,
      String? maxTryTime,
      bool? pinVerified,
      bool? resumeTimer,
      ScreeningToolsState? screeningToolsState,
      @JsonKey(name: 'fetchClientAppointments')
          AppointmentState? appointmentState,
      String? inactiveTime,
      bool? resumeWithPin,
      List<Survey>? availableSurveysList,
      int? resumeWithPINRetries,
      Survey? selectedSurvey});

  @override
  $FAQsContentStateCopyWith<$Res>? get profileFAQsContentState;
  @override
  $ScreeningToolsStateCopyWith<$Res>? get screeningToolsState;
  @override
  $AppointmentStateCopyWith<$Res>? get appointmentState;
  @override
  $SurveyCopyWith<$Res>? get selectedSurvey;
}

/// @nodoc
class __$$_MiscStateCopyWithImpl<$Res>
    extends _$MiscStateCopyWithImpl<$Res, _$_MiscState>
    implements _$$_MiscStateCopyWith<$Res> {
  __$$_MiscStateCopyWithImpl(
      _$_MiscState _value, $Res Function(_$_MiscState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialRoute = null,
    Object? libraryListItems = freezed,
    Object? profileFAQsContentState = freezed,
    Object? healthPagePINInputTime = freezed,
    Object? pinInputTries = freezed,
    Object? maxTryTime = freezed,
    Object? pinVerified = freezed,
    Object? resumeTimer = freezed,
    Object? screeningToolsState = freezed,
    Object? appointmentState = freezed,
    Object? inactiveTime = freezed,
    Object? resumeWithPin = freezed,
    Object? availableSurveysList = freezed,
    Object? resumeWithPINRetries = freezed,
    Object? selectedSurvey = freezed,
  }) {
    return _then(_$_MiscState(
      initialRoute: null == initialRoute
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String,
      libraryListItems: freezed == libraryListItems
          ? _value._libraryListItems
          : libraryListItems // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      profileFAQsContentState: freezed == profileFAQsContentState
          ? _value.profileFAQsContentState
          : profileFAQsContentState // ignore: cast_nullable_to_non_nullable
              as FAQsContentState?,
      healthPagePINInputTime: freezed == healthPagePINInputTime
          ? _value.healthPagePINInputTime
          : healthPagePINInputTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pinInputTries: freezed == pinInputTries
          ? _value.pinInputTries
          : pinInputTries // ignore: cast_nullable_to_non_nullable
              as int?,
      maxTryTime: freezed == maxTryTime
          ? _value.maxTryTime
          : maxTryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pinVerified: freezed == pinVerified
          ? _value.pinVerified
          : pinVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      resumeTimer: freezed == resumeTimer
          ? _value.resumeTimer
          : resumeTimer // ignore: cast_nullable_to_non_nullable
              as bool?,
      screeningToolsState: freezed == screeningToolsState
          ? _value.screeningToolsState
          : screeningToolsState // ignore: cast_nullable_to_non_nullable
              as ScreeningToolsState?,
      appointmentState: freezed == appointmentState
          ? _value.appointmentState
          : appointmentState // ignore: cast_nullable_to_non_nullable
              as AppointmentState?,
      inactiveTime: freezed == inactiveTime
          ? _value.inactiveTime
          : inactiveTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resumeWithPin: freezed == resumeWithPin
          ? _value.resumeWithPin
          : resumeWithPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      availableSurveysList: freezed == availableSurveysList
          ? _value._availableSurveysList
          : availableSurveysList // ignore: cast_nullable_to_non_nullable
              as List<Survey>?,
      resumeWithPINRetries: freezed == resumeWithPINRetries
          ? _value.resumeWithPINRetries
          : resumeWithPINRetries // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedSurvey: freezed == selectedSurvey
          ? _value.selectedSurvey
          : selectedSurvey // ignore: cast_nullable_to_non_nullable
              as Survey?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MiscState implements _MiscState {
  _$_MiscState(
      {@JsonKey(defaultValue: AppRoutes.phoneLogin) required this.initialRoute,
      final List<dynamic>? libraryListItems,
      this.profileFAQsContentState,
      this.healthPagePINInputTime,
      this.pinInputTries,
      this.maxTryTime,
      this.pinVerified,
      this.resumeTimer,
      this.screeningToolsState,
      @JsonKey(name: 'fetchClientAppointments') this.appointmentState,
      this.inactiveTime,
      this.resumeWithPin,
      final List<Survey>? availableSurveysList,
      this.resumeWithPINRetries,
      this.selectedSurvey})
      : _libraryListItems = libraryListItems,
        _availableSurveysList = availableSurveysList;

  factory _$_MiscState.fromJson(Map<String, dynamic> json) =>
      _$$_MiscStateFromJson(json);

  @override
  @JsonKey(defaultValue: AppRoutes.phoneLogin)
  final String initialRoute;
  final List<dynamic>? _libraryListItems;
  @override
  List<dynamic>? get libraryListItems {
    final value = _libraryListItems;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final FAQsContentState? profileFAQsContentState;
  @override
  final String? healthPagePINInputTime;
  @override
  final int? pinInputTries;
  @override
  final String? maxTryTime;
  @override
  final bool? pinVerified;
  @override
  final bool? resumeTimer;
  @override
  final ScreeningToolsState? screeningToolsState;
  @override
  @JsonKey(name: 'fetchClientAppointments')
  final AppointmentState? appointmentState;
  @override
  final String? inactiveTime;
  @override
  final bool? resumeWithPin;
  final List<Survey>? _availableSurveysList;
  @override
  List<Survey>? get availableSurveysList {
    final value = _availableSurveysList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// track the number of time a wrong PIN has been input on the resume with PIN workflow
  @override
  final int? resumeWithPINRetries;
// selected survey to be opened
  @override
  final Survey? selectedSurvey;

  @override
  String toString() {
    return 'MiscState(initialRoute: $initialRoute, libraryListItems: $libraryListItems, profileFAQsContentState: $profileFAQsContentState, healthPagePINInputTime: $healthPagePINInputTime, pinInputTries: $pinInputTries, maxTryTime: $maxTryTime, pinVerified: $pinVerified, resumeTimer: $resumeTimer, screeningToolsState: $screeningToolsState, appointmentState: $appointmentState, inactiveTime: $inactiveTime, resumeWithPin: $resumeWithPin, availableSurveysList: $availableSurveysList, resumeWithPINRetries: $resumeWithPINRetries, selectedSurvey: $selectedSurvey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MiscState &&
            (identical(other.initialRoute, initialRoute) ||
                other.initialRoute == initialRoute) &&
            const DeepCollectionEquality()
                .equals(other._libraryListItems, _libraryListItems) &&
            (identical(
                    other.profileFAQsContentState, profileFAQsContentState) ||
                other.profileFAQsContentState == profileFAQsContentState) &&
            (identical(other.healthPagePINInputTime, healthPagePINInputTime) ||
                other.healthPagePINInputTime == healthPagePINInputTime) &&
            (identical(other.pinInputTries, pinInputTries) ||
                other.pinInputTries == pinInputTries) &&
            (identical(other.maxTryTime, maxTryTime) ||
                other.maxTryTime == maxTryTime) &&
            (identical(other.pinVerified, pinVerified) ||
                other.pinVerified == pinVerified) &&
            (identical(other.resumeTimer, resumeTimer) ||
                other.resumeTimer == resumeTimer) &&
            (identical(other.screeningToolsState, screeningToolsState) ||
                other.screeningToolsState == screeningToolsState) &&
            (identical(other.appointmentState, appointmentState) ||
                other.appointmentState == appointmentState) &&
            (identical(other.inactiveTime, inactiveTime) ||
                other.inactiveTime == inactiveTime) &&
            (identical(other.resumeWithPin, resumeWithPin) ||
                other.resumeWithPin == resumeWithPin) &&
            const DeepCollectionEquality()
                .equals(other._availableSurveysList, _availableSurveysList) &&
            (identical(other.resumeWithPINRetries, resumeWithPINRetries) ||
                other.resumeWithPINRetries == resumeWithPINRetries) &&
            (identical(other.selectedSurvey, selectedSurvey) ||
                other.selectedSurvey == selectedSurvey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      initialRoute,
      const DeepCollectionEquality().hash(_libraryListItems),
      profileFAQsContentState,
      healthPagePINInputTime,
      pinInputTries,
      maxTryTime,
      pinVerified,
      resumeTimer,
      screeningToolsState,
      appointmentState,
      inactiveTime,
      resumeWithPin,
      const DeepCollectionEquality().hash(_availableSurveysList),
      resumeWithPINRetries,
      selectedSurvey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MiscStateCopyWith<_$_MiscState> get copyWith =>
      __$$_MiscStateCopyWithImpl<_$_MiscState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MiscStateToJson(
      this,
    );
  }
}

abstract class _MiscState implements MiscState {
  factory _MiscState(
      {@JsonKey(defaultValue: AppRoutes.phoneLogin)
          required final String initialRoute,
      final List<dynamic>? libraryListItems,
      final FAQsContentState? profileFAQsContentState,
      final String? healthPagePINInputTime,
      final int? pinInputTries,
      final String? maxTryTime,
      final bool? pinVerified,
      final bool? resumeTimer,
      final ScreeningToolsState? screeningToolsState,
      @JsonKey(name: 'fetchClientAppointments')
          final AppointmentState? appointmentState,
      final String? inactiveTime,
      final bool? resumeWithPin,
      final List<Survey>? availableSurveysList,
      final int? resumeWithPINRetries,
      final Survey? selectedSurvey}) = _$_MiscState;

  factory _MiscState.fromJson(Map<String, dynamic> json) =
      _$_MiscState.fromJson;

  @override
  @JsonKey(defaultValue: AppRoutes.phoneLogin)
  String get initialRoute;
  @override
  List<dynamic>? get libraryListItems;
  @override
  FAQsContentState? get profileFAQsContentState;
  @override
  String? get healthPagePINInputTime;
  @override
  int? get pinInputTries;
  @override
  String? get maxTryTime;
  @override
  bool? get pinVerified;
  @override
  bool? get resumeTimer;
  @override
  ScreeningToolsState? get screeningToolsState;
  @override
  @JsonKey(name: 'fetchClientAppointments')
  AppointmentState? get appointmentState;
  @override
  String? get inactiveTime;
  @override
  bool? get resumeWithPin;
  @override
  List<Survey>? get availableSurveysList;
  @override // track the number of time a wrong PIN has been input on the resume with PIN workflow
  int? get resumeWithPINRetries;
  @override // selected survey to be opened
  Survey? get selectedSurvey;
  @override
  @JsonKey(ignore: true)
  _$$_MiscStateCopyWith<_$_MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}
