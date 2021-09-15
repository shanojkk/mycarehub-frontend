// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Range _$RangeFromJson(Map<String, dynamic> json) {
  return _Range.fromJson(json);
}

/// @nodoc
class _$RangeTearOff {
  const _$RangeTearOff();

  _Range call(
      {String? minAmount,
      String? maxAmount,
      String? upfrontAmount,
      String? periodOfPayment,
      String? currency}) {
    return _Range(
      minAmount: minAmount,
      maxAmount: maxAmount,
      upfrontAmount: upfrontAmount,
      periodOfPayment: periodOfPayment,
      currency: currency,
    );
  }

  Range fromJson(Map<String, Object> json) {
    return Range.fromJson(json);
  }
}

/// @nodoc
const $Range = _$RangeTearOff();

/// @nodoc
mixin _$Range {
  String? get minAmount => throw _privateConstructorUsedError;
  String? get maxAmount => throw _privateConstructorUsedError;
  String? get upfrontAmount => throw _privateConstructorUsedError;
  String? get periodOfPayment => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RangeCopyWith<Range> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RangeCopyWith<$Res> {
  factory $RangeCopyWith(Range value, $Res Function(Range) then) =
      _$RangeCopyWithImpl<$Res>;
  $Res call(
      {String? minAmount,
      String? maxAmount,
      String? upfrontAmount,
      String? periodOfPayment,
      String? currency});
}

/// @nodoc
class _$RangeCopyWithImpl<$Res> implements $RangeCopyWith<$Res> {
  _$RangeCopyWithImpl(this._value, this._then);

  final Range _value;
  // ignore: unused_field
  final $Res Function(Range) _then;

  @override
  $Res call({
    Object? minAmount = freezed,
    Object? maxAmount = freezed,
    Object? upfrontAmount = freezed,
    Object? periodOfPayment = freezed,
    Object? currency = freezed,
  }) {
    return _then(_value.copyWith(
      minAmount: minAmount == freezed
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      maxAmount: maxAmount == freezed
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      upfrontAmount: upfrontAmount == freezed
          ? _value.upfrontAmount
          : upfrontAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      periodOfPayment: periodOfPayment == freezed
          ? _value.periodOfPayment
          : periodOfPayment // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$RangeCopyWith<$Res> implements $RangeCopyWith<$Res> {
  factory _$RangeCopyWith(_Range value, $Res Function(_Range) then) =
      __$RangeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? minAmount,
      String? maxAmount,
      String? upfrontAmount,
      String? periodOfPayment,
      String? currency});
}

/// @nodoc
class __$RangeCopyWithImpl<$Res> extends _$RangeCopyWithImpl<$Res>
    implements _$RangeCopyWith<$Res> {
  __$RangeCopyWithImpl(_Range _value, $Res Function(_Range) _then)
      : super(_value, (v) => _then(v as _Range));

  @override
  _Range get _value => super._value as _Range;

  @override
  $Res call({
    Object? minAmount = freezed,
    Object? maxAmount = freezed,
    Object? upfrontAmount = freezed,
    Object? periodOfPayment = freezed,
    Object? currency = freezed,
  }) {
    return _then(_Range(
      minAmount: minAmount == freezed
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      maxAmount: maxAmount == freezed
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      upfrontAmount: upfrontAmount == freezed
          ? _value.upfrontAmount
          : upfrontAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      periodOfPayment: periodOfPayment == freezed
          ? _value.periodOfPayment
          : periodOfPayment // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Range implements _Range {
  _$_Range(
      {this.minAmount,
      this.maxAmount,
      this.upfrontAmount,
      this.periodOfPayment,
      this.currency});

  factory _$_Range.fromJson(Map<String, dynamic> json) =>
      _$_$_RangeFromJson(json);

  @override
  final String? minAmount;
  @override
  final String? maxAmount;
  @override
  final String? upfrontAmount;
  @override
  final String? periodOfPayment;
  @override
  final String? currency;

  @override
  String toString() {
    return 'Range(minAmount: $minAmount, maxAmount: $maxAmount, upfrontAmount: $upfrontAmount, periodOfPayment: $periodOfPayment, currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Range &&
            (identical(other.minAmount, minAmount) ||
                const DeepCollectionEquality()
                    .equals(other.minAmount, minAmount)) &&
            (identical(other.maxAmount, maxAmount) ||
                const DeepCollectionEquality()
                    .equals(other.maxAmount, maxAmount)) &&
            (identical(other.upfrontAmount, upfrontAmount) ||
                const DeepCollectionEquality()
                    .equals(other.upfrontAmount, upfrontAmount)) &&
            (identical(other.periodOfPayment, periodOfPayment) ||
                const DeepCollectionEquality()
                    .equals(other.periodOfPayment, periodOfPayment)) &&
            (identical(other.currency, currency) ||
                const DeepCollectionEquality()
                    .equals(other.currency, currency)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(minAmount) ^
      const DeepCollectionEquality().hash(maxAmount) ^
      const DeepCollectionEquality().hash(upfrontAmount) ^
      const DeepCollectionEquality().hash(periodOfPayment) ^
      const DeepCollectionEquality().hash(currency);

  @JsonKey(ignore: true)
  @override
  _$RangeCopyWith<_Range> get copyWith =>
      __$RangeCopyWithImpl<_Range>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RangeToJson(this);
  }
}

abstract class _Range implements Range {
  factory _Range(
      {String? minAmount,
      String? maxAmount,
      String? upfrontAmount,
      String? periodOfPayment,
      String? currency}) = _$_Range;

  factory _Range.fromJson(Map<String, dynamic> json) = _$_Range.fromJson;

  @override
  String? get minAmount => throw _privateConstructorUsedError;
  @override
  String? get maxAmount => throw _privateConstructorUsedError;
  @override
  String? get upfrontAmount => throw _privateConstructorUsedError;
  @override
  String? get periodOfPayment => throw _privateConstructorUsedError;
  @override
  String? get currency => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RangeCopyWith<_Range> get copyWith => throw _privateConstructorUsedError;
}
