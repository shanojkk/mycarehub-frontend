// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'screening_tool_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningToolAnswer _$ScreeningToolAnswerFromJson(Map<String, dynamic> json) {
  return _ScreeningToolAnswer.fromJson(json);
}

/// @nodoc
mixin _$ScreeningToolAnswer {
  @JsonKey(name: 'questionID')
  String? get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'response')
  String? get response => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningToolAnswerCopyWith<ScreeningToolAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningToolAnswerCopyWith<$Res> {
  factory $ScreeningToolAnswerCopyWith(
          ScreeningToolAnswer value, $Res Function(ScreeningToolAnswer) then) =
      _$ScreeningToolAnswerCopyWithImpl<$Res, ScreeningToolAnswer>;
  @useResult
  $Res call(
      {@JsonKey(name: 'questionID') String? questionId,
      @JsonKey(name: 'response') String? response});
}

/// @nodoc
class _$ScreeningToolAnswerCopyWithImpl<$Res, $Val extends ScreeningToolAnswer>
    implements $ScreeningToolAnswerCopyWith<$Res> {
  _$ScreeningToolAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScreeningToolAnswerCopyWith<$Res>
    implements $ScreeningToolAnswerCopyWith<$Res> {
  factory _$$_ScreeningToolAnswerCopyWith(_$_ScreeningToolAnswer value,
          $Res Function(_$_ScreeningToolAnswer) then) =
      __$$_ScreeningToolAnswerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'questionID') String? questionId,
      @JsonKey(name: 'response') String? response});
}

/// @nodoc
class __$$_ScreeningToolAnswerCopyWithImpl<$Res>
    extends _$ScreeningToolAnswerCopyWithImpl<$Res, _$_ScreeningToolAnswer>
    implements _$$_ScreeningToolAnswerCopyWith<$Res> {
  __$$_ScreeningToolAnswerCopyWithImpl(_$_ScreeningToolAnswer _value,
      $Res Function(_$_ScreeningToolAnswer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? response = freezed,
  }) {
    return _then(_$_ScreeningToolAnswer(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScreeningToolAnswer implements _ScreeningToolAnswer {
  _$_ScreeningToolAnswer(
      {@JsonKey(name: 'questionID') this.questionId,
      @JsonKey(name: 'response') this.response});

  factory _$_ScreeningToolAnswer.fromJson(Map<String, dynamic> json) =>
      _$$_ScreeningToolAnswerFromJson(json);

  @override
  @JsonKey(name: 'questionID')
  final String? questionId;
  @override
  @JsonKey(name: 'response')
  final String? response;

  @override
  String toString() {
    return 'ScreeningToolAnswer(questionId: $questionId, response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScreeningToolAnswer &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, questionId, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScreeningToolAnswerCopyWith<_$_ScreeningToolAnswer> get copyWith =>
      __$$_ScreeningToolAnswerCopyWithImpl<_$_ScreeningToolAnswer>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreeningToolAnswerToJson(
      this,
    );
  }
}

abstract class _ScreeningToolAnswer implements ScreeningToolAnswer {
  factory _ScreeningToolAnswer(
          {@JsonKey(name: 'questionID') final String? questionId,
          @JsonKey(name: 'response') final String? response}) =
      _$_ScreeningToolAnswer;

  factory _ScreeningToolAnswer.fromJson(Map<String, dynamic> json) =
      _$_ScreeningToolAnswer.fromJson;

  @override
  @JsonKey(name: 'questionID')
  String? get questionId;
  @override
  @JsonKey(name: 'response')
  String? get response;
  @override
  @JsonKey(ignore: true)
  _$$_ScreeningToolAnswerCopyWith<_$_ScreeningToolAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}
