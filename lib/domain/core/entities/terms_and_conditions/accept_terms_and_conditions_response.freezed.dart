// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'accept_terms_and_conditions_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AcceptTermsAndConditionsResponse _$AcceptTermsAndConditionsResponseFromJson(
    Map<String, dynamic> json) {
  return _AcceptTermsAndConditionsResponse.fromJson(json);
}

/// @nodoc
mixin _$AcceptTermsAndConditionsResponse {
  @JsonKey(name: 'acceptTerms')
  bool get acceptTerms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AcceptTermsAndConditionsResponseCopyWith<AcceptTermsAndConditionsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcceptTermsAndConditionsResponseCopyWith<$Res> {
  factory $AcceptTermsAndConditionsResponseCopyWith(
          AcceptTermsAndConditionsResponse value,
          $Res Function(AcceptTermsAndConditionsResponse) then) =
      _$AcceptTermsAndConditionsResponseCopyWithImpl<$Res,
          AcceptTermsAndConditionsResponse>;
  @useResult
  $Res call({@JsonKey(name: 'acceptTerms') bool acceptTerms});
}

/// @nodoc
class _$AcceptTermsAndConditionsResponseCopyWithImpl<$Res,
        $Val extends AcceptTermsAndConditionsResponse>
    implements $AcceptTermsAndConditionsResponseCopyWith<$Res> {
  _$AcceptTermsAndConditionsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptTerms = null,
  }) {
    return _then(_value.copyWith(
      acceptTerms: null == acceptTerms
          ? _value.acceptTerms
          : acceptTerms // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AcceptTermsAndConditionsResponseCopyWith<$Res>
    implements $AcceptTermsAndConditionsResponseCopyWith<$Res> {
  factory _$$_AcceptTermsAndConditionsResponseCopyWith(
          _$_AcceptTermsAndConditionsResponse value,
          $Res Function(_$_AcceptTermsAndConditionsResponse) then) =
      __$$_AcceptTermsAndConditionsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'acceptTerms') bool acceptTerms});
}

/// @nodoc
class __$$_AcceptTermsAndConditionsResponseCopyWithImpl<$Res>
    extends _$AcceptTermsAndConditionsResponseCopyWithImpl<$Res,
        _$_AcceptTermsAndConditionsResponse>
    implements _$$_AcceptTermsAndConditionsResponseCopyWith<$Res> {
  __$$_AcceptTermsAndConditionsResponseCopyWithImpl(
      _$_AcceptTermsAndConditionsResponse _value,
      $Res Function(_$_AcceptTermsAndConditionsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptTerms = null,
  }) {
    return _then(_$_AcceptTermsAndConditionsResponse(
      acceptTerms: null == acceptTerms
          ? _value.acceptTerms
          : acceptTerms // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AcceptTermsAndConditionsResponse
    implements _AcceptTermsAndConditionsResponse {
  _$_AcceptTermsAndConditionsResponse(
      {@JsonKey(name: 'acceptTerms') required this.acceptTerms});

  factory _$_AcceptTermsAndConditionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_AcceptTermsAndConditionsResponseFromJson(json);

  @override
  @JsonKey(name: 'acceptTerms')
  final bool acceptTerms;

  @override
  String toString() {
    return 'AcceptTermsAndConditionsResponse(acceptTerms: $acceptTerms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AcceptTermsAndConditionsResponse &&
            (identical(other.acceptTerms, acceptTerms) ||
                other.acceptTerms == acceptTerms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, acceptTerms);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AcceptTermsAndConditionsResponseCopyWith<
          _$_AcceptTermsAndConditionsResponse>
      get copyWith => __$$_AcceptTermsAndConditionsResponseCopyWithImpl<
          _$_AcceptTermsAndConditionsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AcceptTermsAndConditionsResponseToJson(
      this,
    );
  }
}

abstract class _AcceptTermsAndConditionsResponse
    implements AcceptTermsAndConditionsResponse {
  factory _AcceptTermsAndConditionsResponse(
          {@JsonKey(name: 'acceptTerms') required final bool acceptTerms}) =
      _$_AcceptTermsAndConditionsResponse;

  factory _AcceptTermsAndConditionsResponse.fromJson(
      Map<String, dynamic> json) = _$_AcceptTermsAndConditionsResponse.fromJson;

  @override
  @JsonKey(name: 'acceptTerms')
  bool get acceptTerms;
  @override
  @JsonKey(ignore: true)
  _$$_AcceptTermsAndConditionsResponseCopyWith<
          _$_AcceptTermsAndConditionsResponse>
      get copyWith => throw _privateConstructorUsedError;
}
