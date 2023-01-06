// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuoteRelay _$QuoteRelayFromJson(Map<String, dynamic> json) {
  return _QuoteRelay.fromJson(json);
}

/// @nodoc
mixin _$QuoteRelay {
  @JsonKey(name: 'getHealthDiaryQuote')
  List<Quote>? get quotes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteRelayCopyWith<QuoteRelay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteRelayCopyWith<$Res> {
  factory $QuoteRelayCopyWith(
          QuoteRelay value, $Res Function(QuoteRelay) then) =
      _$QuoteRelayCopyWithImpl<$Res, QuoteRelay>;
  @useResult
  $Res call({@JsonKey(name: 'getHealthDiaryQuote') List<Quote>? quotes});
}

/// @nodoc
class _$QuoteRelayCopyWithImpl<$Res, $Val extends QuoteRelay>
    implements $QuoteRelayCopyWith<$Res> {
  _$QuoteRelayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quotes = freezed,
  }) {
    return _then(_value.copyWith(
      quotes: freezed == quotes
          ? _value.quotes
          : quotes // ignore: cast_nullable_to_non_nullable
              as List<Quote>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuoteRelayCopyWith<$Res>
    implements $QuoteRelayCopyWith<$Res> {
  factory _$$_QuoteRelayCopyWith(
          _$_QuoteRelay value, $Res Function(_$_QuoteRelay) then) =
      __$$_QuoteRelayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'getHealthDiaryQuote') List<Quote>? quotes});
}

/// @nodoc
class __$$_QuoteRelayCopyWithImpl<$Res>
    extends _$QuoteRelayCopyWithImpl<$Res, _$_QuoteRelay>
    implements _$$_QuoteRelayCopyWith<$Res> {
  __$$_QuoteRelayCopyWithImpl(
      _$_QuoteRelay _value, $Res Function(_$_QuoteRelay) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quotes = freezed,
  }) {
    return _then(_$_QuoteRelay(
      quotes: freezed == quotes
          ? _value.quotes
          : quotes // ignore: cast_nullable_to_non_nullable
              as List<Quote>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuoteRelay implements _QuoteRelay {
  _$_QuoteRelay({@JsonKey(name: 'getHealthDiaryQuote') this.quotes});

  factory _$_QuoteRelay.fromJson(Map<String, dynamic> json) =>
      _$$_QuoteRelayFromJson(json);

  @override
  @JsonKey(name: 'getHealthDiaryQuote')
  final List<Quote>? quotes;

  @override
  String toString() {
    return 'QuoteRelay(quotes: $quotes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuoteRelay &&
            const DeepCollectionEquality().equals(other.quotes, quotes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(quotes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuoteRelayCopyWith<_$_QuoteRelay> get copyWith =>
      __$$_QuoteRelayCopyWithImpl<_$_QuoteRelay>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuoteRelayToJson(
      this,
    );
  }
}

abstract class _QuoteRelay implements QuoteRelay {
  factory _QuoteRelay(
          {@JsonKey(name: 'getHealthDiaryQuote') final List<Quote>? quotes}) =
      _$_QuoteRelay;

  factory _QuoteRelay.fromJson(Map<String, dynamic> json) =
      _$_QuoteRelay.fromJson;

  @override
  @JsonKey(name: 'getHealthDiaryQuote')
  List<Quote>? get quotes;
  @override
  @JsonKey(ignore: true)
  _$$_QuoteRelayCopyWith<_$_QuoteRelay> get copyWith =>
      throw _privateConstructorUsedError;
}

Quote _$QuoteFromJson(Map<String, dynamic> json) {
  return _Quote.fromJson(json);
}

/// @nodoc
mixin _$Quote {
  @JsonKey(name: 'author')
  String? get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'quote')
  String? get quote => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteCopyWith<Quote> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteCopyWith<$Res> {
  factory $QuoteCopyWith(Quote value, $Res Function(Quote) then) =
      _$QuoteCopyWithImpl<$Res, Quote>;
  @useResult
  $Res call(
      {@JsonKey(name: 'author') String? author,
      @JsonKey(name: 'quote') String? quote});
}

/// @nodoc
class _$QuoteCopyWithImpl<$Res, $Val extends Quote>
    implements $QuoteCopyWith<$Res> {
  _$QuoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = freezed,
    Object? quote = freezed,
  }) {
    return _then(_value.copyWith(
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      quote: freezed == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuoteCopyWith<$Res> implements $QuoteCopyWith<$Res> {
  factory _$$_QuoteCopyWith(_$_Quote value, $Res Function(_$_Quote) then) =
      __$$_QuoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'author') String? author,
      @JsonKey(name: 'quote') String? quote});
}

/// @nodoc
class __$$_QuoteCopyWithImpl<$Res> extends _$QuoteCopyWithImpl<$Res, _$_Quote>
    implements _$$_QuoteCopyWith<$Res> {
  __$$_QuoteCopyWithImpl(_$_Quote _value, $Res Function(_$_Quote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = freezed,
    Object? quote = freezed,
  }) {
    return _then(_$_Quote(
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      quote: freezed == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Quote implements _Quote {
  _$_Quote(
      {@JsonKey(name: 'author') this.author,
      @JsonKey(name: 'quote') this.quote});

  factory _$_Quote.fromJson(Map<String, dynamic> json) =>
      _$$_QuoteFromJson(json);

  @override
  @JsonKey(name: 'author')
  final String? author;
  @override
  @JsonKey(name: 'quote')
  final String? quote;

  @override
  String toString() {
    return 'Quote(author: $author, quote: $quote)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Quote &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.quote, quote) || other.quote == quote));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, author, quote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuoteCopyWith<_$_Quote> get copyWith =>
      __$$_QuoteCopyWithImpl<_$_Quote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuoteToJson(
      this,
    );
  }
}

abstract class _Quote implements Quote {
  factory _Quote(
      {@JsonKey(name: 'author') final String? author,
      @JsonKey(name: 'quote') final String? quote}) = _$_Quote;

  factory _Quote.fromJson(Map<String, dynamic> json) = _$_Quote.fromJson;

  @override
  @JsonKey(name: 'author')
  String? get author;
  @override
  @JsonKey(name: 'quote')
  String? get quote;
  @override
  @JsonKey(ignore: true)
  _$$_QuoteCopyWith<_$_Quote> get copyWith =>
      throw _privateConstructorUsedError;
}
