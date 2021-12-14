// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quote.freezed.dart';
part 'quote.g.dart';

@freezed
class QuoteRelay with _$QuoteRelay {
  factory QuoteRelay({
    @JsonKey(name: 'getHealthDiaryQuote') Quote? quote,
  }) = _QuoteRelay;

  factory QuoteRelay.fromJson(Map<String, dynamic> json) =>
      _$QuoteRelayFromJson(json);

  factory QuoteRelay.initial() => QuoteRelay(quote: Quote.initial());
}

@freezed
class Quote with _$Quote {
  factory Quote({
    @JsonKey(name: 'author') String? author,
    @JsonKey(name: 'quote') String? quote,
  }) = _Quote;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  factory Quote.initial() => Quote(quote: UNKNOWN, author: UNKNOWN);
}