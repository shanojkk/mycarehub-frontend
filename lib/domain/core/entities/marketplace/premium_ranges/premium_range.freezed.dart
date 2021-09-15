// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'premium_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PremiumRange _$PremiumRangeFromJson(Map<String, dynamic> json) {
  return _PremiumRange.fromJson(json);
}

/// @nodoc
class _$PremiumRangeTearOff {
  const _$PremiumRangeTearOff();

  _PremiumRange call(
      {Range? monthlyRange,
      Range? yearlyRange,
      String? description,
      List<String?>? benefits}) {
    return _PremiumRange(
      monthlyRange: monthlyRange,
      yearlyRange: yearlyRange,
      description: description,
      benefits: benefits,
    );
  }

  PremiumRange fromJson(Map<String, Object> json) {
    return PremiumRange.fromJson(json);
  }
}

/// @nodoc
const $PremiumRange = _$PremiumRangeTearOff();

/// @nodoc
mixin _$PremiumRange {
  Range? get monthlyRange => throw _privateConstructorUsedError;
  Range? get yearlyRange => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String?>? get benefits => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PremiumRangeCopyWith<PremiumRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PremiumRangeCopyWith<$Res> {
  factory $PremiumRangeCopyWith(
          PremiumRange value, $Res Function(PremiumRange) then) =
      _$PremiumRangeCopyWithImpl<$Res>;
  $Res call(
      {Range? monthlyRange,
      Range? yearlyRange,
      String? description,
      List<String?>? benefits});

  $RangeCopyWith<$Res>? get monthlyRange;
  $RangeCopyWith<$Res>? get yearlyRange;
}

/// @nodoc
class _$PremiumRangeCopyWithImpl<$Res> implements $PremiumRangeCopyWith<$Res> {
  _$PremiumRangeCopyWithImpl(this._value, this._then);

  final PremiumRange _value;
  // ignore: unused_field
  final $Res Function(PremiumRange) _then;

  @override
  $Res call({
    Object? monthlyRange = freezed,
    Object? yearlyRange = freezed,
    Object? description = freezed,
    Object? benefits = freezed,
  }) {
    return _then(_value.copyWith(
      monthlyRange: monthlyRange == freezed
          ? _value.monthlyRange
          : monthlyRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      yearlyRange: yearlyRange == freezed
          ? _value.yearlyRange
          : yearlyRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      benefits: benefits == freezed
          ? _value.benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ));
  }

  @override
  $RangeCopyWith<$Res>? get monthlyRange {
    if (_value.monthlyRange == null) {
      return null;
    }

    return $RangeCopyWith<$Res>(_value.monthlyRange!, (value) {
      return _then(_value.copyWith(monthlyRange: value));
    });
  }

  @override
  $RangeCopyWith<$Res>? get yearlyRange {
    if (_value.yearlyRange == null) {
      return null;
    }

    return $RangeCopyWith<$Res>(_value.yearlyRange!, (value) {
      return _then(_value.copyWith(yearlyRange: value));
    });
  }
}

/// @nodoc
abstract class _$PremiumRangeCopyWith<$Res>
    implements $PremiumRangeCopyWith<$Res> {
  factory _$PremiumRangeCopyWith(
          _PremiumRange value, $Res Function(_PremiumRange) then) =
      __$PremiumRangeCopyWithImpl<$Res>;
  @override
  $Res call(
      {Range? monthlyRange,
      Range? yearlyRange,
      String? description,
      List<String?>? benefits});

  @override
  $RangeCopyWith<$Res>? get monthlyRange;
  @override
  $RangeCopyWith<$Res>? get yearlyRange;
}

/// @nodoc
class __$PremiumRangeCopyWithImpl<$Res> extends _$PremiumRangeCopyWithImpl<$Res>
    implements _$PremiumRangeCopyWith<$Res> {
  __$PremiumRangeCopyWithImpl(
      _PremiumRange _value, $Res Function(_PremiumRange) _then)
      : super(_value, (v) => _then(v as _PremiumRange));

  @override
  _PremiumRange get _value => super._value as _PremiumRange;

  @override
  $Res call({
    Object? monthlyRange = freezed,
    Object? yearlyRange = freezed,
    Object? description = freezed,
    Object? benefits = freezed,
  }) {
    return _then(_PremiumRange(
      monthlyRange: monthlyRange == freezed
          ? _value.monthlyRange
          : monthlyRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      yearlyRange: yearlyRange == freezed
          ? _value.yearlyRange
          : yearlyRange // ignore: cast_nullable_to_non_nullable
              as Range?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      benefits: benefits == freezed
          ? _value.benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PremiumRange implements _PremiumRange {
  _$_PremiumRange(
      {this.monthlyRange, this.yearlyRange, this.description, this.benefits});

  factory _$_PremiumRange.fromJson(Map<String, dynamic> json) =>
      _$_$_PremiumRangeFromJson(json);

  @override
  final Range? monthlyRange;
  @override
  final Range? yearlyRange;
  @override
  final String? description;
  @override
  final List<String?>? benefits;

  @override
  String toString() {
    return 'PremiumRange(monthlyRange: $monthlyRange, yearlyRange: $yearlyRange, description: $description, benefits: $benefits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PremiumRange &&
            (identical(other.monthlyRange, monthlyRange) ||
                const DeepCollectionEquality()
                    .equals(other.monthlyRange, monthlyRange)) &&
            (identical(other.yearlyRange, yearlyRange) ||
                const DeepCollectionEquality()
                    .equals(other.yearlyRange, yearlyRange)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.benefits, benefits) ||
                const DeepCollectionEquality()
                    .equals(other.benefits, benefits)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(monthlyRange) ^
      const DeepCollectionEquality().hash(yearlyRange) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(benefits);

  @JsonKey(ignore: true)
  @override
  _$PremiumRangeCopyWith<_PremiumRange> get copyWith =>
      __$PremiumRangeCopyWithImpl<_PremiumRange>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PremiumRangeToJson(this);
  }
}

abstract class _PremiumRange implements PremiumRange {
  factory _PremiumRange(
      {Range? monthlyRange,
      Range? yearlyRange,
      String? description,
      List<String?>? benefits}) = _$_PremiumRange;

  factory _PremiumRange.fromJson(Map<String, dynamic> json) =
      _$_PremiumRange.fromJson;

  @override
  Range? get monthlyRange => throw _privateConstructorUsedError;
  @override
  Range? get yearlyRange => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  List<String?>? get benefits => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PremiumRangeCopyWith<_PremiumRange> get copyWith =>
      throw _privateConstructorUsedError;
}
