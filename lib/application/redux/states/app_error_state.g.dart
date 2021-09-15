// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_error_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppErrorState _$_$_AppErrorStateFromJson(Map<String, dynamic> json) {
  return _$_AppErrorState(
    errorMessage: json['errorMessage'] as String?,
    isError: json['isError'] as bool?,
    isTimeout: json['isTimeout'] as bool?,
    appErrorType:
        _$enumDecodeNullable(_$AppErrorTypeEnumMap, json['appErrorType']),
  );
}

Map<String, dynamic> _$_$_AppErrorStateToJson(_$_AppErrorState instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'isError': instance.isError,
      'isTimeout': instance.isTimeout,
      'appErrorType': _$AppErrorTypeEnumMap[instance.appErrorType],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$AppErrorTypeEnumMap = {
  AppErrorType.UserFeedError: 'UserFeedError',
};
