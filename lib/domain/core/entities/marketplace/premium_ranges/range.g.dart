// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Range _$_$_RangeFromJson(Map<String, dynamic> json) {
  return _$_Range(
    minAmount: json['minAmount'] as String?,
    maxAmount: json['maxAmount'] as String?,
    upfrontAmount: json['upfrontAmount'] as String?,
    periodOfPayment: json['periodOfPayment'] as String?,
    currency: json['currency'] as String?,
  );
}

Map<String, dynamic> _$_$_RangeToJson(_$_Range instance) => <String, dynamic>{
      'minAmount': instance.minAmount,
      'maxAmount': instance.maxAmount,
      'upfrontAmount': instance.upfrontAmount,
      'periodOfPayment': instance.periodOfPayment,
      'currency': instance.currency,
    };
