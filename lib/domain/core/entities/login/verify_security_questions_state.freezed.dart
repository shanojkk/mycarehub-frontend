// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'verify_security_questions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerifySecurityQuestionsState _$VerifySecurityQuestionsStateFromJson(
    Map<String, dynamic> json) {
  return _VerifySecurityQuestionsState.fromJson(json);
}

/// @nodoc
mixin _$VerifySecurityQuestionsState {
  bool get hasVerifiedSecurityQuestions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifySecurityQuestionsStateCopyWith<VerifySecurityQuestionsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifySecurityQuestionsStateCopyWith<$Res> {
  factory $VerifySecurityQuestionsStateCopyWith(
          VerifySecurityQuestionsState value,
          $Res Function(VerifySecurityQuestionsState) then) =
      _$VerifySecurityQuestionsStateCopyWithImpl<$Res,
          VerifySecurityQuestionsState>;
  @useResult
  $Res call({bool hasVerifiedSecurityQuestions});
}

/// @nodoc
class _$VerifySecurityQuestionsStateCopyWithImpl<$Res,
        $Val extends VerifySecurityQuestionsState>
    implements $VerifySecurityQuestionsStateCopyWith<$Res> {
  _$VerifySecurityQuestionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasVerifiedSecurityQuestions = null,
  }) {
    return _then(_value.copyWith(
      hasVerifiedSecurityQuestions: null == hasVerifiedSecurityQuestions
          ? _value.hasVerifiedSecurityQuestions
          : hasVerifiedSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VerifySecurityQuestionsStateCopyWith<$Res>
    implements $VerifySecurityQuestionsStateCopyWith<$Res> {
  factory _$$_VerifySecurityQuestionsStateCopyWith(
          _$_VerifySecurityQuestionsState value,
          $Res Function(_$_VerifySecurityQuestionsState) then) =
      __$$_VerifySecurityQuestionsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasVerifiedSecurityQuestions});
}

/// @nodoc
class __$$_VerifySecurityQuestionsStateCopyWithImpl<$Res>
    extends _$VerifySecurityQuestionsStateCopyWithImpl<$Res,
        _$_VerifySecurityQuestionsState>
    implements _$$_VerifySecurityQuestionsStateCopyWith<$Res> {
  __$$_VerifySecurityQuestionsStateCopyWithImpl(
      _$_VerifySecurityQuestionsState _value,
      $Res Function(_$_VerifySecurityQuestionsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasVerifiedSecurityQuestions = null,
  }) {
    return _then(_$_VerifySecurityQuestionsState(
      hasVerifiedSecurityQuestions: null == hasVerifiedSecurityQuestions
          ? _value.hasVerifiedSecurityQuestions
          : hasVerifiedSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VerifySecurityQuestionsState implements _VerifySecurityQuestionsState {
  _$_VerifySecurityQuestionsState({this.hasVerifiedSecurityQuestions = false});

  factory _$_VerifySecurityQuestionsState.fromJson(Map<String, dynamic> json) =>
      _$$_VerifySecurityQuestionsStateFromJson(json);

  @override
  @JsonKey()
  final bool hasVerifiedSecurityQuestions;

  @override
  String toString() {
    return 'VerifySecurityQuestionsState(hasVerifiedSecurityQuestions: $hasVerifiedSecurityQuestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifySecurityQuestionsState &&
            (identical(other.hasVerifiedSecurityQuestions,
                    hasVerifiedSecurityQuestions) ||
                other.hasVerifiedSecurityQuestions ==
                    hasVerifiedSecurityQuestions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hasVerifiedSecurityQuestions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerifySecurityQuestionsStateCopyWith<_$_VerifySecurityQuestionsState>
      get copyWith => __$$_VerifySecurityQuestionsStateCopyWithImpl<
          _$_VerifySecurityQuestionsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VerifySecurityQuestionsStateToJson(
      this,
    );
  }
}

abstract class _VerifySecurityQuestionsState
    implements VerifySecurityQuestionsState {
  factory _VerifySecurityQuestionsState(
          {final bool hasVerifiedSecurityQuestions}) =
      _$_VerifySecurityQuestionsState;

  factory _VerifySecurityQuestionsState.fromJson(Map<String, dynamic> json) =
      _$_VerifySecurityQuestionsState.fromJson;

  @override
  bool get hasVerifiedSecurityQuestions;
  @override
  @JsonKey(ignore: true)
  _$$_VerifySecurityQuestionsStateCopyWith<_$_VerifySecurityQuestionsState>
      get copyWith => throw _privateConstructorUsedError;
}
