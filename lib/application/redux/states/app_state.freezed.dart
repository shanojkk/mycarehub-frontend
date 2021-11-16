// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _AppState.fromJson(json);
}

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

  _AppState call(
      {ClientProfileState? clientProfileState,
      ConnectivityState? connectivityState,
      FeedResponsePayload? userFeedState,
      MiscState? miscState,
      @JsonKey(ignore: true) Wait? wait}) {
    return _AppState(
      clientProfileState: clientProfileState,
      connectivityState: connectivityState,
      userFeedState: userFeedState,
      miscState: miscState,
      wait: wait,
    );
  }

  AppState fromJson(Map<String, Object> json) {
    return AppState.fromJson(json);
  }
}

/// @nodoc
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState {
  ClientProfileState? get clientProfileState =>
      throw _privateConstructorUsedError;
  ConnectivityState? get connectivityState =>
      throw _privateConstructorUsedError;
  FeedResponsePayload? get userFeedState => throw _privateConstructorUsedError;
  MiscState? get miscState => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Wait? get wait => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call(
      {ClientProfileState? clientProfileState,
      ConnectivityState? connectivityState,
      FeedResponsePayload? userFeedState,
      MiscState? miscState,
      @JsonKey(ignore: true) Wait? wait});

  $ClientProfileStateCopyWith<$Res>? get clientProfileState;
  $ConnectivityStateCopyWith<$Res>? get connectivityState;
  $FeedResponsePayloadCopyWith<$Res>? get userFeedState;
  $MiscStateCopyWith<$Res>? get miscState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? clientProfileState = freezed,
    Object? connectivityState = freezed,
    Object? userFeedState = freezed,
    Object? miscState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_value.copyWith(
      clientProfileState: clientProfileState == freezed
          ? _value.clientProfileState
          : clientProfileState // ignore: cast_nullable_to_non_nullable
              as ClientProfileState?,
      connectivityState: connectivityState == freezed
          ? _value.connectivityState
          : connectivityState // ignore: cast_nullable_to_non_nullable
              as ConnectivityState?,
      userFeedState: userFeedState == freezed
          ? _value.userFeedState
          : userFeedState // ignore: cast_nullable_to_non_nullable
              as FeedResponsePayload?,
      miscState: miscState == freezed
          ? _value.miscState
          : miscState // ignore: cast_nullable_to_non_nullable
              as MiscState?,
      wait: wait == freezed
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
    ));
  }

  @override
  $ClientProfileStateCopyWith<$Res>? get clientProfileState {
    if (_value.clientProfileState == null) {
      return null;
    }

    return $ClientProfileStateCopyWith<$Res>(_value.clientProfileState!,
        (value) {
      return _then(_value.copyWith(clientProfileState: value));
    });
  }

  @override
  $ConnectivityStateCopyWith<$Res>? get connectivityState {
    if (_value.connectivityState == null) {
      return null;
    }

    return $ConnectivityStateCopyWith<$Res>(_value.connectivityState!, (value) {
      return _then(_value.copyWith(connectivityState: value));
    });
  }

  @override
  $FeedResponsePayloadCopyWith<$Res>? get userFeedState {
    if (_value.userFeedState == null) {
      return null;
    }

    return $FeedResponsePayloadCopyWith<$Res>(_value.userFeedState!, (value) {
      return _then(_value.copyWith(userFeedState: value));
    });
  }

  @override
  $MiscStateCopyWith<$Res>? get miscState {
    if (_value.miscState == null) {
      return null;
    }

    return $MiscStateCopyWith<$Res>(_value.miscState!, (value) {
      return _then(_value.copyWith(miscState: value));
    });
  }
}

/// @nodoc
abstract class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) then) =
      __$AppStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ClientProfileState? clientProfileState,
      ConnectivityState? connectivityState,
      FeedResponsePayload? userFeedState,
      MiscState? miscState,
      @JsonKey(ignore: true) Wait? wait});

  @override
  $ClientProfileStateCopyWith<$Res>? get clientProfileState;
  @override
  $ConnectivityStateCopyWith<$Res>? get connectivityState;
  @override
  $FeedResponsePayloadCopyWith<$Res>? get userFeedState;
  @override
  $MiscStateCopyWith<$Res>? get miscState;
}

/// @nodoc
class __$AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(_AppState _value, $Res Function(_AppState) _then)
      : super(_value, (v) => _then(v as _AppState));

  @override
  _AppState get _value => super._value as _AppState;

  @override
  $Res call({
    Object? clientProfileState = freezed,
    Object? connectivityState = freezed,
    Object? userFeedState = freezed,
    Object? miscState = freezed,
    Object? wait = freezed,
  }) {
    return _then(_AppState(
      clientProfileState: clientProfileState == freezed
          ? _value.clientProfileState
          : clientProfileState // ignore: cast_nullable_to_non_nullable
              as ClientProfileState?,
      connectivityState: connectivityState == freezed
          ? _value.connectivityState
          : connectivityState // ignore: cast_nullable_to_non_nullable
              as ConnectivityState?,
      userFeedState: userFeedState == freezed
          ? _value.userFeedState
          : userFeedState // ignore: cast_nullable_to_non_nullable
              as FeedResponsePayload?,
      miscState: miscState == freezed
          ? _value.miscState
          : miscState // ignore: cast_nullable_to_non_nullable
              as MiscState?,
      wait: wait == freezed
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppState implements _AppState {
  _$_AppState(
      {this.clientProfileState,
      this.connectivityState,
      this.userFeedState,
      this.miscState,
      @JsonKey(ignore: true) this.wait});

  factory _$_AppState.fromJson(Map<String, dynamic> json) =>
      _$_$_AppStateFromJson(json);

  @override
  final ClientProfileState? clientProfileState;
  @override
  final ConnectivityState? connectivityState;
  @override
  final FeedResponsePayload? userFeedState;
  @override
  final MiscState? miscState;
  @override
  @JsonKey(ignore: true)
  final Wait? wait;

  @override
  String toString() {
    return 'AppState(clientProfileState: $clientProfileState, connectivityState: $connectivityState, userFeedState: $userFeedState, miscState: $miscState, wait: $wait)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppState &&
            (identical(other.clientProfileState, clientProfileState) ||
                const DeepCollectionEquality()
                    .equals(other.clientProfileState, clientProfileState)) &&
            (identical(other.connectivityState, connectivityState) ||
                const DeepCollectionEquality()
                    .equals(other.connectivityState, connectivityState)) &&
            (identical(other.userFeedState, userFeedState) ||
                const DeepCollectionEquality()
                    .equals(other.userFeedState, userFeedState)) &&
            (identical(other.miscState, miscState) ||
                const DeepCollectionEquality()
                    .equals(other.miscState, miscState)) &&
            (identical(other.wait, wait) ||
                const DeepCollectionEquality().equals(other.wait, wait)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(clientProfileState) ^
      const DeepCollectionEquality().hash(connectivityState) ^
      const DeepCollectionEquality().hash(userFeedState) ^
      const DeepCollectionEquality().hash(miscState) ^
      const DeepCollectionEquality().hash(wait);

  @JsonKey(ignore: true)
  @override
  _$AppStateCopyWith<_AppState> get copyWith =>
      __$AppStateCopyWithImpl<_AppState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppStateToJson(this);
  }
}

abstract class _AppState implements AppState {
  factory _AppState(
      {ClientProfileState? clientProfileState,
      ConnectivityState? connectivityState,
      FeedResponsePayload? userFeedState,
      MiscState? miscState,
      @JsonKey(ignore: true) Wait? wait}) = _$_AppState;

  factory _AppState.fromJson(Map<String, dynamic> json) = _$_AppState.fromJson;

  @override
  ClientProfileState? get clientProfileState =>
      throw _privateConstructorUsedError;
  @override
  ConnectivityState? get connectivityState =>
      throw _privateConstructorUsedError;
  @override
  FeedResponsePayload? get userFeedState => throw _privateConstructorUsedError;
  @override
  MiscState? get miscState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  Wait? get wait => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppStateCopyWith<_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
