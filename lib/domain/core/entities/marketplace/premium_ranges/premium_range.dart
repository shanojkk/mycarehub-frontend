import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:myafyahub/domain/core/entities/marketplace/premium_ranges/range.dart';

part 'premium_range.freezed.dart';
part 'premium_range.g.dart';

@freezed
class PremiumRange with _$PremiumRange {
  factory PremiumRange({
    Range? monthlyRange,
    Range? yearlyRange,
    String? description,
    List<String?>? benefits,
  }) = _PremiumRange;

  factory PremiumRange.fromJson(Map<String, dynamic> json) =>
      _$PremiumRangeFromJson(json);
}
