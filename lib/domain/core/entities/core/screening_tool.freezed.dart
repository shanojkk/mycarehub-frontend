// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'screening_tool.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningTool _$ScreeningToolFromJson(Map<String, dynamic> json) {
  return _ScreeningTool.fromJson(json);
}

/// @nodoc
mixin _$ScreeningTool {
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'toolType')
  ScreeningToolsType? get toolType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningToolCopyWith<ScreeningTool> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningToolCopyWith<$Res> {
  factory $ScreeningToolCopyWith(
          ScreeningTool value, $Res Function(ScreeningTool) then) =
      _$ScreeningToolCopyWithImpl<$Res, ScreeningTool>;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'toolType') ScreeningToolsType? toolType});
}

/// @nodoc
class _$ScreeningToolCopyWithImpl<$Res, $Val extends ScreeningTool>
    implements $ScreeningToolCopyWith<$Res> {
  _$ScreeningToolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? toolType = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      toolType: freezed == toolType
          ? _value.toolType
          : toolType // ignore: cast_nullable_to_non_nullable
              as ScreeningToolsType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScreeningToolCopyWith<$Res>
    implements $ScreeningToolCopyWith<$Res> {
  factory _$$_ScreeningToolCopyWith(
          _$_ScreeningTool value, $Res Function(_$_ScreeningTool) then) =
      __$$_ScreeningToolCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'toolType') ScreeningToolsType? toolType});
}

/// @nodoc
class __$$_ScreeningToolCopyWithImpl<$Res>
    extends _$ScreeningToolCopyWithImpl<$Res, _$_ScreeningTool>
    implements _$$_ScreeningToolCopyWith<$Res> {
  __$$_ScreeningToolCopyWithImpl(
      _$_ScreeningTool _value, $Res Function(_$_ScreeningTool) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? toolType = freezed,
  }) {
    return _then(_$_ScreeningTool(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      toolType: freezed == toolType
          ? _value.toolType
          : toolType // ignore: cast_nullable_to_non_nullable
              as ScreeningToolsType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScreeningTool implements _ScreeningTool {
  _$_ScreeningTool(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'toolType') this.toolType});

  factory _$_ScreeningTool.fromJson(Map<String, dynamic> json) =>
      _$$_ScreeningToolFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'toolType')
  final ScreeningToolsType? toolType;

  @override
  String toString() {
    return 'ScreeningTool(title: $title, description: $description, toolType: $toolType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScreeningTool &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.toolType, toolType) ||
                other.toolType == toolType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, toolType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScreeningToolCopyWith<_$_ScreeningTool> get copyWith =>
      __$$_ScreeningToolCopyWithImpl<_$_ScreeningTool>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreeningToolToJson(
      this,
    );
  }
}

abstract class _ScreeningTool implements ScreeningTool {
  factory _ScreeningTool(
          {@JsonKey(name: 'title') final String? title,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'toolType') final ScreeningToolsType? toolType}) =
      _$_ScreeningTool;

  factory _ScreeningTool.fromJson(Map<String, dynamic> json) =
      _$_ScreeningTool.fromJson;

  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'toolType')
  ScreeningToolsType? get toolType;
  @override
  @JsonKey(ignore: true)
  _$$_ScreeningToolCopyWith<_$_ScreeningTool> get copyWith =>
      throw _privateConstructorUsedError;
}
