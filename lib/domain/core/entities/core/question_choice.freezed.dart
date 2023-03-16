// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question_choice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionChoice _$QuestionChoiceFromJson(Map<String, dynamic> json) {
  return _QuestionChoice.fromJson(json);
}

/// @nodoc
mixin _$QuestionChoice {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'active')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'questionID')
  String? get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  String? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'choice')
  String? get choice => throw _privateConstructorUsedError;
  @JsonKey(name: 'score')
  int? get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionChoiceCopyWith<QuestionChoice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionChoiceCopyWith<$Res> {
  factory $QuestionChoiceCopyWith(
          QuestionChoice value, $Res Function(QuestionChoice) then) =
      _$QuestionChoiceCopyWithImpl<$Res, QuestionChoice>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'active') bool? active,
      @JsonKey(name: 'questionID') String? questionId,
      @JsonKey(name: 'value') String? value,
      @JsonKey(name: 'choice') String? choice,
      @JsonKey(name: 'score') int? score});
}

/// @nodoc
class _$QuestionChoiceCopyWithImpl<$Res, $Val extends QuestionChoice>
    implements $QuestionChoiceCopyWith<$Res> {
  _$QuestionChoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? questionId = freezed,
    Object? value = freezed,
    Object? choice = freezed,
    Object? score = freezed,
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
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      choice: freezed == choice
          ? _value.choice
          : choice // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionChoiceCopyWith<$Res>
    implements $QuestionChoiceCopyWith<$Res> {
  factory _$$_QuestionChoiceCopyWith(
          _$_QuestionChoice value, $Res Function(_$_QuestionChoice) then) =
      __$$_QuestionChoiceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'active') bool? active,
      @JsonKey(name: 'questionID') String? questionId,
      @JsonKey(name: 'value') String? value,
      @JsonKey(name: 'choice') String? choice,
      @JsonKey(name: 'score') int? score});
}

/// @nodoc
class __$$_QuestionChoiceCopyWithImpl<$Res>
    extends _$QuestionChoiceCopyWithImpl<$Res, _$_QuestionChoice>
    implements _$$_QuestionChoiceCopyWith<$Res> {
  __$$_QuestionChoiceCopyWithImpl(
      _$_QuestionChoice _value, $Res Function(_$_QuestionChoice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? questionId = freezed,
    Object? value = freezed,
    Object? choice = freezed,
    Object? score = freezed,
  }) {
    return _then(_$_QuestionChoice(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      choice: freezed == choice
          ? _value.choice
          : choice // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionChoice implements _QuestionChoice {
  _$_QuestionChoice(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'active') this.active,
      @JsonKey(name: 'questionID') this.questionId,
      @JsonKey(name: 'value') this.value,
      @JsonKey(name: 'choice') this.choice,
      @JsonKey(name: 'score') this.score});

  factory _$_QuestionChoice.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionChoiceFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'active')
  final bool? active;
  @override
  @JsonKey(name: 'questionID')
  final String? questionId;
  @override
  @JsonKey(name: 'value')
  final String? value;
  @override
  @JsonKey(name: 'choice')
  final String? choice;
  @override
  @JsonKey(name: 'score')
  final int? score;

  @override
  String toString() {
    return 'QuestionChoice(id: $id, active: $active, questionId: $questionId, value: $value, choice: $choice, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionChoice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.choice, choice) || other.choice == choice) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, active, questionId, value, choice, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionChoiceCopyWith<_$_QuestionChoice> get copyWith =>
      __$$_QuestionChoiceCopyWithImpl<_$_QuestionChoice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionChoiceToJson(
      this,
    );
  }
}

abstract class _QuestionChoice implements QuestionChoice {
  factory _QuestionChoice(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'active') final bool? active,
      @JsonKey(name: 'questionID') final String? questionId,
      @JsonKey(name: 'value') final String? value,
      @JsonKey(name: 'choice') final String? choice,
      @JsonKey(name: 'score') final int? score}) = _$_QuestionChoice;

  factory _QuestionChoice.fromJson(Map<String, dynamic> json) =
      _$_QuestionChoice.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'active')
  bool? get active;
  @override
  @JsonKey(name: 'questionID')
  String? get questionId;
  @override
  @JsonKey(name: 'value')
  String? get value;
  @override
  @JsonKey(name: 'choice')
  String? get choice;
  @override
  @JsonKey(name: 'score')
  int? get score;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionChoiceCopyWith<_$_QuestionChoice> get copyWith =>
      throw _privateConstructorUsedError;
}
