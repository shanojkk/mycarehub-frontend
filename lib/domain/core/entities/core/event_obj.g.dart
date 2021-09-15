// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MarketplaceContent _$_$_MarketplaceContentFromJson(
    Map<String, dynamic> json) {
  return _$_MarketplaceContent(
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
    uid: json['uid'] as String?,
    primaryPhoneNumber: json['primary_phonenumber'] as String?,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    flavour: json['flavour'] as String?,
    appVersion: json['app_version'] as String? ?? 'dev-build',
  );
}

Map<String, dynamic> _$_$_MarketplaceContentToJson(
        _$_MarketplaceContent instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'uid': instance.uid,
      'primary_phonenumber': instance.primaryPhoneNumber,
      'timestamp': instance.timestamp?.toIso8601String(),
      'flavour': instance.flavour,
      'app_version': instance.appVersion,
    };
