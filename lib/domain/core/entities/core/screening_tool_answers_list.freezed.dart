// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'screening_tool_answers_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreeningToolAnswersList _$ScreeningToolAnswersListFromJson(
    Map<String, dynamic> json) {
  return _ScreeningToolAnswersList.fromJson(json);
}

/// @nodoc
mixin _$ScreeningToolAnswersList {
  @JsonKey(name: 'questionResponses')
  List<ScreeningToolAnswer?>? get answersList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreeningToolAnswersListCopyWith<ScreeningToolAnswersList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreeningToolAnswersListCopyWith<$Res> {
  factory $ScreeningToolAnswersListCopyWith(ScreeningToolAnswersList value,
          $Res Function(ScreeningToolAnswersList) then) =
      _$ScreeningToolAnswersListCopyWithImpl<$Res, ScreeningToolAnswersList>;
  @useResult
  $Res call(
      {@JsonKey(name: 'questionResponses')
          List<ScreeningToolAnswer?>? answersList});
}

/// @nodoc
class _$ScreeningToolAnswersListCopyWithImpl<$Res,
        $Val extends ScreeningToolAnswersList>
    implements $ScreeningToolAnswersListCopyWith<$Res> {
  _$ScreeningToolAnswersListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answersList = freezed,
  }) {
    return _then(_value.copyWith(
      answersList: freezed == answersList
          ? _value.answersList
          : answersList // ignore: cast_nullable_to_non_nullable
              as List<ScreeningToolAnswer?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScreeningToolAnswersListCopyWith<$Res>
    implements $ScreeningToolAnswersListCopyWith<$Res> {
  factory _$$_ScreeningToolAnswersListCopyWith(
          _$_ScreeningToolAnswersList value,
          $Res Function(_$_ScreeningToolAnswersList) then) =
      __$$_ScreeningToolAnswersListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'questionResponses')
          List<ScreeningToolAnswer?>? answersList});
}

/// @nodoc
class __$$_ScreeningToolAnswersListCopyWithImpl<$Res>
    extends _$ScreeningToolAnswersListCopyWithImpl<$Res,
        _$_ScreeningToolAnswersList>
    implements _$$_ScreeningToolAnswersListCopyWith<$Res> {
  __$$_ScreeningToolAnswersListCopyWithImpl(_$_ScreeningToolAnswersList _value,
      $Res Function(_$_ScreeningToolAnswersList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answersList = freezed,
  }) {
    return _then(_$_ScreeningToolAnswersList(
      answersList: freezed == answersList
          ? _value._answersList
          : answersList // ignore: cast_nullable_to_non_nullable
              as List<ScreeningToolAnswer?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScreeningToolAnswersList implements _ScreeningToolAnswersList {
  _$_ScreeningToolAnswersList(
      {@JsonKey(name: 'questionResponses')
          final List<ScreeningToolAnswer?>? answersList})
      : _answersList = answersList;

  factory _$_ScreeningToolAnswersList.fromJson(Map<String, dynamic> json) =>
      _$$_ScreeningToolAnswersListFromJson(json);

  final List<ScreeningToolAnswer?>? _answersList;
  @override
  @JsonKey(name: 'questionResponses')
  List<ScreeningToolAnswer?>? get answersList {
    final value = _answersList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ScreeningToolAnswersList(answersList: $answersList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScreeningToolAnswersList &&
            const DeepCollectionEquality()
                .equals(other._answersList, _answersList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_answersList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScreeningToolAnswersListCopyWith<_$_ScreeningToolAnswersList>
      get copyWith => __$$_ScreeningToolAnswersListCopyWithImpl<
          _$_ScreeningToolAnswersList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreeningToolAnswersListToJson(
      this,
    );
  }
}

abstract class _ScreeningToolAnswersList implements ScreeningToolAnswersList {
  factory _ScreeningToolAnswersList(
          {@JsonKey(name: 'questionResponses')
              final List<ScreeningToolAnswer?>? answersList}) =
      _$_ScreeningToolAnswersList;

  factory _ScreeningToolAnswersList.fromJson(Map<String, dynamic> json) =
      _$_ScreeningToolAnswersList.fromJson;

  @override
  @JsonKey(name: 'questionResponses')
  List<ScreeningToolAnswer?>? get answersList;
  @override
  @JsonKey(ignore: true)
  _$$_ScreeningToolAnswersListCopyWith<_$_ScreeningToolAnswersList>
      get copyWith => throw _privateConstructorUsedError;
}
