// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'questionnaire.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Questionnaire _$QuestionnaireFromJson(Map<String, dynamic> json) {
  return _Questionnaire.fromJson(json);
}

/// @nodoc
mixin _$Questionnaire {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'active')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'questions')
  List<ScreeningQuestion?>? get screeningQuestions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionnaireCopyWith<Questionnaire> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionnaireCopyWith<$Res> {
  factory $QuestionnaireCopyWith(
          Questionnaire value, $Res Function(Questionnaire) then) =
      _$QuestionnaireCopyWithImpl<$Res, Questionnaire>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'active')
          bool? active,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'description')
          String? description,
      @JsonKey(name: 'questions')
          List<ScreeningQuestion?>? screeningQuestions});
}

/// @nodoc
class _$QuestionnaireCopyWithImpl<$Res, $Val extends Questionnaire>
    implements $QuestionnaireCopyWith<$Res> {
  _$QuestionnaireCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? screeningQuestions = freezed,
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
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      screeningQuestions: freezed == screeningQuestions
          ? _value.screeningQuestions
          : screeningQuestions // ignore: cast_nullable_to_non_nullable
              as List<ScreeningQuestion?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionnaireCopyWith<$Res>
    implements $QuestionnaireCopyWith<$Res> {
  factory _$$_QuestionnaireCopyWith(
          _$_Questionnaire value, $Res Function(_$_Questionnaire) then) =
      __$$_QuestionnaireCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'active')
          bool? active,
      @JsonKey(name: 'name')
          String? name,
      @JsonKey(name: 'description')
          String? description,
      @JsonKey(name: 'questions')
          List<ScreeningQuestion?>? screeningQuestions});
}

/// @nodoc
class __$$_QuestionnaireCopyWithImpl<$Res>
    extends _$QuestionnaireCopyWithImpl<$Res, _$_Questionnaire>
    implements _$$_QuestionnaireCopyWith<$Res> {
  __$$_QuestionnaireCopyWithImpl(
      _$_Questionnaire _value, $Res Function(_$_Questionnaire) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? active = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? screeningQuestions = freezed,
  }) {
    return _then(_$_Questionnaire(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      screeningQuestions: freezed == screeningQuestions
          ? _value._screeningQuestions
          : screeningQuestions // ignore: cast_nullable_to_non_nullable
              as List<ScreeningQuestion?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Questionnaire implements _Questionnaire {
  _$_Questionnaire(
      {@JsonKey(name: 'id')
          this.id,
      @JsonKey(name: 'active')
          this.active,
      @JsonKey(name: 'name')
          this.name,
      @JsonKey(name: 'description')
          this.description,
      @JsonKey(name: 'questions')
          final List<ScreeningQuestion?>? screeningQuestions})
      : _screeningQuestions = screeningQuestions;

  factory _$_Questionnaire.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionnaireFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'active')
  final bool? active;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'description')
  final String? description;
  final List<ScreeningQuestion?>? _screeningQuestions;
  @override
  @JsonKey(name: 'questions')
  List<ScreeningQuestion?>? get screeningQuestions {
    final value = _screeningQuestions;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Questionnaire(id: $id, active: $active, name: $name, description: $description, screeningQuestions: $screeningQuestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Questionnaire &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._screeningQuestions, _screeningQuestions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, active, name, description,
      const DeepCollectionEquality().hash(_screeningQuestions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionnaireCopyWith<_$_Questionnaire> get copyWith =>
      __$$_QuestionnaireCopyWithImpl<_$_Questionnaire>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionnaireToJson(
      this,
    );
  }
}

abstract class _Questionnaire implements Questionnaire {
  factory _Questionnaire(
          {@JsonKey(name: 'id')
              final String? id,
          @JsonKey(name: 'active')
              final bool? active,
          @JsonKey(name: 'name')
              final String? name,
          @JsonKey(name: 'description')
              final String? description,
          @JsonKey(name: 'questions')
              final List<ScreeningQuestion?>? screeningQuestions}) =
      _$_Questionnaire;

  factory _Questionnaire.fromJson(Map<String, dynamic> json) =
      _$_Questionnaire.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'active')
  bool? get active;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'questions')
  List<ScreeningQuestion?>? get screeningQuestions;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionnaireCopyWith<_$_Questionnaire> get copyWith =>
      throw _privateConstructorUsedError;
}
