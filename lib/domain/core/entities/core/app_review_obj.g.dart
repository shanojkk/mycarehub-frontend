// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_review_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppReviewObj _$AppReviewObjFromJson(Map<String, dynamic> json) {
  return AppReviewObj(
    launches: json['launches'] as int?,
    days: json['days'] as int?,
    lastLaunchDate: json['lastLaunchDate'] as String?,
    shouldRateApp: json['shouldRateApp'] as bool?,
  );
}

Map<String, dynamic> _$AppReviewObjToJson(AppReviewObj instance) =>
    <String, dynamic>{
      'days': instance.days,
      'lastLaunchDate': instance.lastLaunchDate,
      'launches': instance.launches,
      'shouldRateApp': instance.shouldRateApp,
    };
