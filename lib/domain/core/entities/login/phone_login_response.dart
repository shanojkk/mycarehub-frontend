// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/login/user_response.dart';

part 'phone_login_response.freezed.dart';
part 'phone_login_response.g.dart';

@freezed
class PhoneLoginResponse with _$PhoneLoginResponse {
  factory PhoneLoginResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'is_caregiver', defaultValue: false) bool? isCaregiver,
    @JsonKey(name: 'is_client', defaultValue: false) bool? isClient,
    @JsonKey(name: 'response') UserResponse? userResponse,
  }) = _PhoneLoginResponse;

  factory PhoneLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$PhoneLoginResponseFromJson(json);
}
