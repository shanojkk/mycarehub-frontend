// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PremiumRange _$_$_PremiumRangeFromJson(Map<String, dynamic> json) {
  return _$_PremiumRange(
    monthlyRange: json['monthlyRange'] == null
        ? null
        : Range.fromJson(json['monthlyRange'] as Map<String, dynamic>),
    yearlyRange: json['yearlyRange'] == null
        ? null
        : Range.fromJson(json['yearlyRange'] as Map<String, dynamic>),
    description: json['description'] as String?,
    benefits:
        (json['benefits'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  );
}

Map<String, dynamic> _$_$_PremiumRangeToJson(_$_PremiumRange instance) =>
    <String, dynamic>{
      'monthlyRange': instance.monthlyRange,
      'yearlyRange': instance.yearlyRange,
      'description': instance.description,
      'benefits': instance.benefits,
    };
