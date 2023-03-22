// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'screening_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningQuestion _$ScreeningQuestionFromJson(Map<String, dynamic> json) {
  return _ScreeningQuestion.fromJson(json);
}

/// @nodoc
mixin _$ScreeningQuestion {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'active')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get questionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'questionType')
  QuestionType? get questionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'responseValueType')
  QuestionResponseValueType? get responseValueType =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'required')
  bool? get required => throw _privateConstructorUsedError;
  @JsonKey(name: 'selectMultiple')
  bool? get selectMultiple => throw _privateConstructorUsedError;
  @JsonKey(name: 'sequence')
  int? get sequence => throw _privateConstructorUsedError;
  @JsonKey(name: 'choices')
  List<QuestionChoice?>? get choices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningQuestionCopyWith<ScreeningQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningQuestionCopyWith<$Res> {
  factory $ScreeningQuestionCopyWith(
          ScreeningQuestion value, $Res Function(ScreeningQuestion) then) =
      _$ScreeningQuestionCopyWithImpl<$Res, ScreeningQuestion>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'active')
          bool? active,
      @JsonKey(name: 'text')
          String? questionText,
      @JsonKey(name: 'questionType')
          QuestionType? questionType,
      @JsonKey(name: 'responseValueType')
          QuestionResponseValueType? responseValueType,
      @JsonKey(name: 'required')
          bool? required,
      @JsonKey(name: 'selectMultiple')
          bool? selectMultiple,
      @JsonKey(name: 'sequence')
          int? sequence,
      @JsonKey(name: 'choices')
          List<QuestionChoice?>? choices});
}

/// @nodoc
class _$ScreeningQuestionCopyWithImpl<$Res, $Val extends ScreeningQuestion>
    implements $ScreeningQuestionCopyWith<$Res> {
  _$ScreeningQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? questionText = freezed,
    Object? questionType = freezed,
    Object? responseValueType = freezed,
    Object? required = freezed,
    Object? selectMultiple = freezed,
    Object? sequence = freezed,
    Object? choices = freezed,
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
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as QuestionType?,
      responseValueType: freezed == responseValueType
          ? _value.responseValueType
          : responseValueType // ignore: cast_nullable_to_non_nullable
              as QuestionResponseValueType?,
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool?,
      selectMultiple: freezed == selectMultiple
          ? _value.selectMultiple
          : selectMultiple // ignore: cast_nullable_to_non_nullable
              as bool?,
      sequence: freezed == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int?,
      choices: freezed == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<QuestionChoice?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScreeningQuestionCopyWith<$Res>
    implements $ScreeningQuestionCopyWith<$Res> {
  factory _$$_ScreeningQuestionCopyWith(_$_ScreeningQuestion value,
          $Res Function(_$_ScreeningQuestion) then) =
      __$$_ScreeningQuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'active')
          bool? active,
      @JsonKey(name: 'text')
          String? questionText,
      @JsonKey(name: 'questionType')
          QuestionType? questionType,
      @JsonKey(name: 'responseValueType')
          QuestionResponseValueType? responseValueType,
      @JsonKey(name: 'required')
          bool? required,
      @JsonKey(name: 'selectMultiple')
          bool? selectMultiple,
      @JsonKey(name: 'sequence')
          int? sequence,
      @JsonKey(name: 'choices')
          List<QuestionChoice?>? choices});
}

/// @nodoc
class __$$_ScreeningQuestionCopyWithImpl<$Res>
    extends _$ScreeningQuestionCopyWithImpl<$Res, _$_ScreeningQuestion>
    implements _$$_ScreeningQuestionCopyWith<$Res> {
  __$$_ScreeningQuestionCopyWithImpl(
      _$_ScreeningQuestion _value, $Res Function(_$_ScreeningQuestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? questionText = freezed,
    Object? questionType = freezed,
    Object? responseValueType = freezed,
    Object? required = freezed,
    Object? selectMultiple = freezed,
    Object? sequence = freezed,
    Object? choices = freezed,
  }) {
    return _then(_$_ScreeningQuestion(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      questionText: freezed == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as QuestionType?,
      responseValueType: freezed == responseValueType
          ? _value.responseValueType
          : responseValueType // ignore: cast_nullable_to_non_nullable
              as QuestionResponseValueType?,
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as bool?,
      selectMultiple: freezed == selectMultiple
          ? _value.selectMultiple
          : selectMultiple // ignore: cast_nullable_to_non_nullable
              as bool?,
      sequence: freezed == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int?,
      choices: freezed == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<QuestionChoice?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScreeningQuestion implements _ScreeningQuestion {
  _$_ScreeningQuestion(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'active') this.active,
      @JsonKey(name: 'text') this.questionText,
      @JsonKey(name: 'questionType') this.questionType,
      @JsonKey(name: 'responseValueType') this.responseValueType,
      @JsonKey(name: 'required') this.required,
      @JsonKey(name: 'selectMultiple') this.selectMultiple,
      @JsonKey(name: 'sequence') this.sequence,
      @JsonKey(name: 'choices') final List<QuestionChoice?>? choices})
      : _choices = choices;

  factory _$_ScreeningQuestion.fromJson(Map<String, dynamic> json) =>
      _$$_ScreeningQuestionFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'active')
  final bool? active;
  @override
  @JsonKey(name: 'text')
  final String? questionText;
  @override
  @JsonKey(name: 'questionType')
  final QuestionType? questionType;
  @override
  @JsonKey(name: 'responseValueType')
  final QuestionResponseValueType? responseValueType;
  @override
  @JsonKey(name: 'required')
  final bool? required;
  @override
  @JsonKey(name: 'selectMultiple')
  final bool? selectMultiple;
  @override
  @JsonKey(name: 'sequence')
  final int? sequence;
  final List<QuestionChoice?>? _choices;
  @override
  @JsonKey(name: 'choices')
  List<QuestionChoice?>? get choices {
    final value = _choices;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ScreeningQuestion(id: $id, active: $active, questionText: $questionText, questionType: $questionType, responseValueType: $responseValueType, required: $required, selectMultiple: $selectMultiple, sequence: $sequence, choices: $choices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScreeningQuestion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.responseValueType, responseValueType) ||
                other.responseValueType == responseValueType) &&
            (identical(other.required, required) ||
                other.required == required) &&
            (identical(other.selectMultiple, selectMultiple) ||
                other.selectMultiple == selectMultiple) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            const DeepCollectionEquality().equals(other._choices, _choices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      active,
      questionText,
      questionType,
      responseValueType,
      required,
      selectMultiple,
      sequence,
      const DeepCollectionEquality().hash(_choices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScreeningQuestionCopyWith<_$_ScreeningQuestion> get copyWith =>
      __$$_ScreeningQuestionCopyWithImpl<_$_ScreeningQuestion>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreeningQuestionToJson(
      this,
    );
  }
}

abstract class _ScreeningQuestion implements ScreeningQuestion {
  factory _ScreeningQuestion(
      {@JsonKey(name: 'id')
          final String? id,
      @JsonKey(name: 'active')
          final bool? active,
      @JsonKey(name: 'text')
          final String? questionText,
      @JsonKey(name: 'questionType')
          final QuestionType? questionType,
      @JsonKey(name: 'responseValueType')
          final QuestionResponseValueType? responseValueType,
      @JsonKey(name: 'required')
          final bool? required,
      @JsonKey(name: 'selectMultiple')
          final bool? selectMultiple,
      @JsonKey(name: 'sequence')
          final int? sequence,
      @JsonKey(name: 'choices')
          final List<QuestionChoice?>? choices}) = _$_ScreeningQuestion;

  factory _ScreeningQuestion.fromJson(Map<String, dynamic> json) =
      _$_ScreeningQuestion.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'active')
  bool? get active;
  @override
  @JsonKey(name: 'text')
  String? get questionText;
  @override
  @JsonKey(name: 'questionType')
  QuestionType? get questionType;
  @override
  @JsonKey(name: 'responseValueType')
  QuestionResponseValueType? get responseValueType;
  @override
  @JsonKey(name: 'required')
  bool? get required;
  @override
  @JsonKey(name: 'selectMultiple')
  bool? get selectMultiple;
  @override
  @JsonKey(name: 'sequence')
  int? get sequence;
  @override
  @JsonKey(name: 'choices')
  List<QuestionChoice?>? get choices;
  @override
  @JsonKey(ignore: true)
  _$$_ScreeningQuestionCopyWith<_$_ScreeningQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}
