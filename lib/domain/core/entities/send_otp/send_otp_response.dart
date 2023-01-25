// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:

part 'send_otp_response.freezed.dart';
part 'send_otp_response.g.dart';

@freezed
class SendOTPResponse with _$SendOTPResponse {
  factory SendOTPResponse({
    @JsonKey(name: 'otp') String? otp,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
  }) = _SendOTPResponse;

  factory SendOTPResponse.fromJson(Map<String, dynamic> json) =>
      _$SendOTPResponseFromJson(json);
}
