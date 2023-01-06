// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'available_screening_tools.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AvailableScreeningTools _$AvailableScreeningToolsFromJson(
    Map<String, dynamic> json) {
  return _AvailableScreeningTools.fromJson(json);
}

/// @nodoc
mixin _$AvailableScreeningTools {
  @JsonKey(name: 'availableScreeningTools')
  List<ScreeningTool>? get availableScreeningTools =>
      throw _privateConstructorUsedError;
  bool? get errorFetchingQuestions => throw _privateConstructorUsedError;
  bool? get timeoutFetchingQuestions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvailableScreeningToolsCopyWith<AvailableScreeningTools> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableScreeningToolsCopyWith<$Res> {
  factory $AvailableScreeningToolsCopyWith(AvailableScreeningTools value,
          $Res Function(AvailableScreeningTools) then) =
      _$AvailableScreeningToolsCopyWithImpl<$Res, AvailableScreeningTools>;
  @useResult
  $Res call(
      {@JsonKey(name: 'availableScreeningTools')
          List<ScreeningTool>? availableScreeningTools,
      bool? errorFetchingQuestions,
      bool? timeoutFetchingQuestions});
}

/// @nodoc
class _$AvailableScreeningToolsCopyWithImpl<$Res,
        $Val extends AvailableScreeningTools>
    implements $AvailableScreeningToolsCopyWith<$Res> {
  _$AvailableScreeningToolsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableScreeningTools = freezed,
    Object? errorFetchingQuestions = freezed,
    Object? timeoutFetchingQuestions = freezed,
  }) {
    return _then(_value.copyWith(
      availableScreeningTools: freezed == availableScreeningTools
          ? _value.availableScreeningTools
          : availableScreeningTools // ignore: cast_nullable_to_non_nullable
              as List<ScreeningTool>?,
      errorFetchingQuestions: freezed == errorFetchingQuestions
          ? _value.errorFetchingQuestions
          : errorFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingQuestions: freezed == timeoutFetchingQuestions
          ? _value.timeoutFetchingQuestions
          : timeoutFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AvailableScreeningToolsCopyWith<$Res>
    implements $AvailableScreeningToolsCopyWith<$Res> {
  factory _$$_AvailableScreeningToolsCopyWith(_$_AvailableScreeningTools value,
          $Res Function(_$_AvailableScreeningTools) then) =
      __$$_AvailableScreeningToolsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'availableScreeningTools')
          List<ScreeningTool>? availableScreeningTools,
      bool? errorFetchingQuestions,
      bool? timeoutFetchingQuestions});
}

/// @nodoc
class __$$_AvailableScreeningToolsCopyWithImpl<$Res>
    extends _$AvailableScreeningToolsCopyWithImpl<$Res,
        _$_AvailableScreeningTools>
    implements _$$_AvailableScreeningToolsCopyWith<$Res> {
  __$$_AvailableScreeningToolsCopyWithImpl(_$_AvailableScreeningTools _value,
      $Res Function(_$_AvailableScreeningTools) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableScreeningTools = freezed,
    Object? errorFetchingQuestions = freezed,
    Object? timeoutFetchingQuestions = freezed,
  }) {
    return _then(_$_AvailableScreeningTools(
      availableScreeningTools: freezed == availableScreeningTools
          ? _value._availableScreeningTools
          : availableScreeningTools // ignore: cast_nullable_to_non_nullable
              as List<ScreeningTool>?,
      errorFetchingQuestions: freezed == errorFetchingQuestions
          ? _value.errorFetchingQuestions
          : errorFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingQuestions: freezed == timeoutFetchingQuestions
          ? _value.timeoutFetchingQuestions
          : timeoutFetchingQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AvailableScreeningTools implements _AvailableScreeningTools {
  _$_AvailableScreeningTools(
      {@JsonKey(name: 'availableScreeningTools')
          final List<ScreeningTool>? availableScreeningTools,
      this.errorFetchingQuestions,
      this.timeoutFetchingQuestions})
      : _availableScreeningTools = availableScreeningTools;

  factory _$_AvailableScreeningTools.fromJson(Map<String, dynamic> json) =>
      _$$_AvailableScreeningToolsFromJson(json);

  final List<ScreeningTool>? _availableScreeningTools;
  @override
  @JsonKey(name: 'availableScreeningTools')
  List<ScreeningTool>? get availableScreeningTools {
    final value = _availableScreeningTools;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? errorFetchingQuestions;
  @override
  final bool? timeoutFetchingQuestions;

  @override
  String toString() {
    return 'AvailableScreeningTools(availableScreeningTools: $availableScreeningTools, errorFetchingQuestions: $errorFetchingQuestions, timeoutFetchingQuestions: $timeoutFetchingQuestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AvailableScreeningTools &&
            const DeepCollectionEquality().equals(
                other._availableScreeningTools, _availableScreeningTools) &&
            (identical(other.errorFetchingQuestions, errorFetchingQuestions) ||
                other.errorFetchingQuestions == errorFetchingQuestions) &&
            (identical(
                    other.timeoutFetchingQuestions, timeoutFetchingQuestions) ||
                other.timeoutFetchingQuestions == timeoutFetchingQuestions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_availableScreeningTools),
      errorFetchingQuestions,
      timeoutFetchingQuestions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AvailableScreeningToolsCopyWith<_$_AvailableScreeningTools>
      get copyWith =>
          __$$_AvailableScreeningToolsCopyWithImpl<_$_AvailableScreeningTools>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AvailableScreeningToolsToJson(
      this,
    );
  }
}

abstract class _AvailableScreeningTools implements AvailableScreeningTools {
  factory _AvailableScreeningTools(
      {@JsonKey(name: 'availableScreeningTools')
          final List<ScreeningTool>? availableScreeningTools,
      final bool? errorFetchingQuestions,
      final bool? timeoutFetchingQuestions}) = _$_AvailableScreeningTools;

  factory _AvailableScreeningTools.fromJson(Map<String, dynamic> json) =
      _$_AvailableScreeningTools.fromJson;

  @override
  @JsonKey(name: 'availableScreeningTools')
  List<ScreeningTool>? get availableScreeningTools;
  @override
  bool? get errorFetchingQuestions;
  @override
  bool? get timeoutFetchingQuestions;
  @override
  @JsonKey(ignore: true)
  _$$_AvailableScreeningToolsCopyWith<_$_AvailableScreeningTools>
      get copyWith => throw _privateConstructorUsedError;
}
