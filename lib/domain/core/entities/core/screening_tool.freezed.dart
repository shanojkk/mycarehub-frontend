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
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'active')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'questionnaireID')
  String? get questionnaireId => throw _privateConstructorUsedError;
  @JsonKey(name: 'threshold')
  int? get threshold => throw _privateConstructorUsedError;
  @JsonKey(name: 'questionnaire')
  Questionnaire? get questionnaire => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'active') bool? active,
      @JsonKey(name: 'questionnaireID') String? questionnaireId,
      @JsonKey(name: 'threshold') int? threshold,
      @JsonKey(name: 'questionnaire') Questionnaire? questionnaire});

  $QuestionnaireCopyWith<$Res>? get questionnaire;
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
    Object? id = freezed,
    Object? active = freezed,
    Object? questionnaireId = freezed,
    Object? threshold = freezed,
    Object? questionnaire = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      questionnaireId: freezed == questionnaireId
          ? _value.questionnaireId
          : questionnaireId // ignore: cast_nullable_to_non_nullable
              as String?,
      threshold: freezed == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as int?,
      questionnaire: freezed == questionnaire
          ? _value.questionnaire
          : questionnaire // ignore: cast_nullable_to_non_nullable
              as Questionnaire?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionnaireCopyWith<$Res>? get questionnaire {
    if (_value.questionnaire == null) {
      return null;
    }

    return $QuestionnaireCopyWith<$Res>(_value.questionnaire!, (value) {
      return _then(_value.copyWith(questionnaire: value) as $Val);
    });
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
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'active') bool? active,
      @JsonKey(name: 'questionnaireID') String? questionnaireId,
      @JsonKey(name: 'threshold') int? threshold,
      @JsonKey(name: 'questionnaire') Questionnaire? questionnaire});

  @override
  $QuestionnaireCopyWith<$Res>? get questionnaire;
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
    Object? id = freezed,
    Object? active = freezed,
    Object? questionnaireId = freezed,
    Object? threshold = freezed,
    Object? questionnaire = freezed,
  }) {
    return _then(_$_ScreeningTool(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      questionnaireId: freezed == questionnaireId
          ? _value.questionnaireId
          : questionnaireId // ignore: cast_nullable_to_non_nullable
              as String?,
      threshold: freezed == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as int?,
      questionnaire: freezed == questionnaire
          ? _value.questionnaire
          : questionnaire // ignore: cast_nullable_to_non_nullable
              as Questionnaire?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScreeningTool implements _ScreeningTool {
  _$_ScreeningTool(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'active') this.active,
      @JsonKey(name: 'questionnaireID') this.questionnaireId,
      @JsonKey(name: 'threshold') this.threshold,
      @JsonKey(name: 'questionnaire') this.questionnaire});

  factory _$_ScreeningTool.fromJson(Map<String, dynamic> json) =>
      _$$_ScreeningToolFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'active')
  final bool? active;
  @override
  @JsonKey(name: 'questionnaireID')
  final String? questionnaireId;
  @override
  @JsonKey(name: 'threshold')
  final int? threshold;
  @override
  @JsonKey(name: 'questionnaire')
  final Questionnaire? questionnaire;

  @override
  String toString() {
    return 'ScreeningTool(id: $id, active: $active, questionnaireId: $questionnaireId, threshold: $threshold, questionnaire: $questionnaire)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScreeningTool &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.questionnaireId, questionnaireId) ||
                other.questionnaireId == questionnaireId) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold) &&
            (identical(other.questionnaire, questionnaire) ||
                other.questionnaire == questionnaire));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, active, questionnaireId, threshold, questionnaire);

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
          {@JsonKey(name: 'id') final String? id,
          @JsonKey(name: 'active') final bool? active,
          @JsonKey(name: 'questionnaireID') final String? questionnaireId,
          @JsonKey(name: 'threshold') final int? threshold,
          @JsonKey(name: 'questionnaire') final Questionnaire? questionnaire}) =
      _$_ScreeningTool;

  factory _ScreeningTool.fromJson(Map<String, dynamic> json) =
      _$_ScreeningTool.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'active')
  bool? get active;
  @override
  @JsonKey(name: 'questionnaireID')
  String? get questionnaireId;
  @override
  @JsonKey(name: 'threshold')
  int? get threshold;
  @override
  @JsonKey(name: 'questionnaire')
  Questionnaire? get questionnaire;
  @override
  @JsonKey(ignore: true)
  _$$_ScreeningToolCopyWith<_$_ScreeningTool> get copyWith =>
      throw _privateConstructorUsedError;
}
