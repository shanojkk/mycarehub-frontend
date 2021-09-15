import 'package:freezed_annotation/freezed_annotation.dart';

part 'range.freezed.dart';
part 'range.g.dart';

@freezed
class Range with _$Range {
  factory Range({
    String? minAmount,
    String? maxAmount,
    String? upfrontAmount,
    String? periodOfPayment,
    String? currency,
  }) = _Range;

  factory Range.fromJson(Map<String, dynamic> json) => _$RangeFromJson(json);
}
