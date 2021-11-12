// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppState _$_$_AppStateFromJson(Map<String, dynamic> json) {
  return _$_AppState(
    loginPageState: json['loginPageState'] == null
        ? null
        : LoginPageState.fromJson(
            json['loginPageState'] as Map<String, dynamic>),
    userProfileState: json['userProfileState'] == null
        ? null
        : UserProfileState.fromJson(
            json['userProfileState'] as Map<String, dynamic>),
    connectivityState: json['connectivityState'] == null
        ? null
        : ConnectivityState.fromJson(
            json['connectivityState'] as Map<String, dynamic>),
    userFeedState: json['userFeedState'] == null
        ? null
        : FeedResponsePayload.fromJson(
            json['userFeedState'] as Map<String, dynamic>),
    miscState: json['miscState'] == null
        ? null
        : MiscState.fromJson(json['miscState'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AppStateToJson(_$_AppState instance) =>
    <String, dynamic>{
      'loginPageState': instance.loginPageState,
      'userProfileState': instance.userProfileState,
      'connectivityState': instance.connectivityState,
      'userFeedState': instance.userFeedState,
      'miscState': instance.miscState,
    };
