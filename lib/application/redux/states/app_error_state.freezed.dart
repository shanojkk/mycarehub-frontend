// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_error_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppErrorState _$AppErrorStateFromJson(Map<String, dynamic> json) {
  return _AppErrorState.fromJson(json);
}

/// @nodoc
class _$AppErrorStateTearOff {
  const _$AppErrorStateTearOff();

  _AppErrorState call(
      {String? errorMessage,
      bool? isError,
      bool? isTimeout,
      AppErrorType? appErrorType}) {
    return _AppErrorState(
      errorMessage: errorMessage,
      isError: isError,
      isTimeout: isTimeout,
      appErrorType: appErrorType,
    );
  }

  AppErrorState fromJson(Map<String, Object> json) {
    return AppErrorState.fromJson(json);
  }
}

/// @nodoc
const $AppErrorState = _$AppErrorStateTearOff();

/// @nodoc
mixin _$AppErrorState {
  String? get errorMessage => throw _privateConstructorUsedError;
  bool? get isError => throw _privateConstructorUsedError;
  bool? get isTimeout => throw _privateConstructorUsedError;
  AppErrorType? get appErrorType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppErrorStateCopyWith<AppErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppErrorStateCopyWith<$Res> {
  factory $AppErrorStateCopyWith(
          AppErrorState value, $Res Function(AppErrorState) then) =
      _$AppErrorStateCopyWithImpl<$Res>;
  $Res call(
      {String? errorMessage,
      bool? isError,
      bool? isTimeout,
      AppErrorType? appErrorType});
}

/// @nodoc
class _$AppErrorStateCopyWithImpl<$Res>
    implements $AppErrorStateCopyWith<$Res> {
  _$AppErrorStateCopyWithImpl(this._value, this._then);

  final AppErrorState _value;
  // ignore: unused_field
  final $Res Function(AppErrorState) _then;

  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? isError = freezed,
    Object? isTimeout = freezed,
    Object? appErrorType = freezed,
  }) {
    return _then(_value.copyWith(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTimeout: isTimeout == freezed
          ? _value.isTimeout
          : isTimeout // ignore: cast_nullable_to_non_nullable
              as bool?,
      appErrorType: appErrorType == freezed
          ? _value.appErrorType
          : appErrorType // ignore: cast_nullable_to_non_nullable
              as AppErrorType?,
    ));
  }
}

/// @nodoc
abstract class _$AppErrorStateCopyWith<$Res>
    implements $AppErrorStateCopyWith<$Res> {
  factory _$AppErrorStateCopyWith(
          _AppErrorState value, $Res Function(_AppErrorState) then) =
      __$AppErrorStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? errorMessage,
      bool? isError,
      bool? isTimeout,
      AppErrorType? appErrorType});
}

/// @nodoc
class __$AppErrorStateCopyWithImpl<$Res>
    extends _$AppErrorStateCopyWithImpl<$Res>
    implements _$AppErrorStateCopyWith<$Res> {
  __$AppErrorStateCopyWithImpl(
      _AppErrorState _value, $Res Function(_AppErrorState) _then)
      : super(_value, (v) => _then(v as _AppErrorState));

  @override
  _AppErrorState get _value => super._value as _AppErrorState;

  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? isError = freezed,
    Object? isTimeout = freezed,
    Object? appErrorType = freezed,
  }) {
    return _then(_AppErrorState(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTimeout: isTimeout == freezed
          ? _value.isTimeout
          : isTimeout // ignore: cast_nullable_to_non_nullable
              as bool?,
      appErrorType: appErrorType == freezed
          ? _value.appErrorType
          : appErrorType // ignore: cast_nullable_to_non_nullable
              as AppErrorType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppErrorState implements _AppErrorState {
  _$_AppErrorState(
      {this.errorMessage, this.isError, this.isTimeout, this.appErrorType});

  factory _$_AppErrorState.fromJson(Map<String, dynamic> json) =>
      _$_$_AppErrorStateFromJson(json);

  @override
  final String? errorMessage;
  @override
  final bool? isError;
  @override
  final bool? isTimeout;
  @override
  final AppErrorType? appErrorType;

  @override
  String toString() {
    return 'AppErrorState(errorMessage: $errorMessage, isError: $isError, isTimeout: $isTimeout, appErrorType: $appErrorType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppErrorState &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)) &&
            (identical(other.isError, isError) ||
                const DeepCollectionEquality()
                    .equals(other.isError, isError)) &&
            (identical(other.isTimeout, isTimeout) ||
                const DeepCollectionEquality()
                    .equals(other.isTimeout, isTimeout)) &&
            (identical(other.appErrorType, appErrorType) ||
                const DeepCollectionEquality()
                    .equals(other.appErrorType, appErrorType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(errorMessage) ^
      const DeepCollectionEquality().hash(isError) ^
      const DeepCollectionEquality().hash(isTimeout) ^
      const DeepCollectionEquality().hash(appErrorType);

  @JsonKey(ignore: true)
  @override
  _$AppErrorStateCopyWith<_AppErrorState> get copyWith =>
      __$AppErrorStateCopyWithImpl<_AppErrorState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppErrorStateToJson(this);
  }
}

abstract class _AppErrorState implements AppErrorState {
  factory _AppErrorState(
      {String? errorMessage,
      bool? isError,
      bool? isTimeout,
      AppErrorType? appErrorType}) = _$_AppErrorState;

  factory _AppErrorState.fromJson(Map<String, dynamic> json) =
      _$_AppErrorState.fromJson;

  @override
  String? get errorMessage => throw _privateConstructorUsedError;
  @override
  bool? get isError => throw _privateConstructorUsedError;
  @override
  bool? get isTimeout => throw _privateConstructorUsedError;
  @override
  AppErrorType? get appErrorType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppErrorStateCopyWith<_AppErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
