// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'terms_and_conditions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TermsAndConditions _$TermsAndConditionsFromJson(Map<String, dynamic> json) {
  return _TermsAndConditions.fromJson(json);
}

/// @nodoc
mixin _$TermsAndConditions {
  @JsonKey(name: 'termsID')
  int get termsId => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TermsAndConditionsCopyWith<TermsAndConditions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsAndConditionsCopyWith<$Res> {
  factory $TermsAndConditionsCopyWith(
          TermsAndConditions value, $Res Function(TermsAndConditions) then) =
      _$TermsAndConditionsCopyWithImpl<$Res, TermsAndConditions>;
  @useResult
  $Res call(
      {@JsonKey(name: 'termsID') int termsId,
      @JsonKey(name: 'text') String text});
}

/// @nodoc
class _$TermsAndConditionsCopyWithImpl<$Res, $Val extends TermsAndConditions>
    implements $TermsAndConditionsCopyWith<$Res> {
  _$TermsAndConditionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsId = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      termsId: null == termsId
          ? _value.termsId
          : termsId // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TermsAndConditionsCopyWith<$Res>
    implements $TermsAndConditionsCopyWith<$Res> {
  factory _$$_TermsAndConditionsCopyWith(_$_TermsAndConditions value,
          $Res Function(_$_TermsAndConditions) then) =
      __$$_TermsAndConditionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'termsID') int termsId,
      @JsonKey(name: 'text') String text});
}

/// @nodoc
class __$$_TermsAndConditionsCopyWithImpl<$Res>
    extends _$TermsAndConditionsCopyWithImpl<$Res, _$_TermsAndConditions>
    implements _$$_TermsAndConditionsCopyWith<$Res> {
  __$$_TermsAndConditionsCopyWithImpl(
      _$_TermsAndConditions _value, $Res Function(_$_TermsAndConditions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsId = null,
    Object? text = null,
  }) {
    return _then(_$_TermsAndConditions(
      termsId: null == termsId
          ? _value.termsId
          : termsId // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TermsAndConditions implements _TermsAndConditions {
  _$_TermsAndConditions(
      {@JsonKey(name: 'termsID') required this.termsId,
      @JsonKey(name: 'text') required this.text});

  factory _$_TermsAndConditions.fromJson(Map<String, dynamic> json) =>
      _$$_TermsAndConditionsFromJson(json);

  @override
  @JsonKey(name: 'termsID')
  final int termsId;
  @override
  @JsonKey(name: 'text')
  final String text;

  @override
  String toString() {
    return 'TermsAndConditions(termsId: $termsId, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TermsAndConditions &&
            (identical(other.termsId, termsId) || other.termsId == termsId) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, termsId, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TermsAndConditionsCopyWith<_$_TermsAndConditions> get copyWith =>
      __$$_TermsAndConditionsCopyWithImpl<_$_TermsAndConditions>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TermsAndConditionsToJson(
      this,
    );
  }
}

abstract class _TermsAndConditions implements TermsAndConditions {
  factory _TermsAndConditions(
          {@JsonKey(name: 'termsID') required final int termsId,
          @JsonKey(name: 'text') required final String text}) =
      _$_TermsAndConditions;

  factory _TermsAndConditions.fromJson(Map<String, dynamic> json) =
      _$_TermsAndConditions.fromJson;

  @override
  @JsonKey(name: 'termsID')
  int get termsId;
  @override
  @JsonKey(name: 'text')
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_TermsAndConditionsCopyWith<_$_TermsAndConditions> get copyWith =>
      throw _privateConstructorUsedError;
}
