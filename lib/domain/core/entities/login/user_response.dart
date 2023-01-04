// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/caregiver/caregiver_state.dart';
// Project imports:
import 'package:pro_health_360/domain/core/entities/core/auth_credentials.dart';
import 'package:pro_health_360/domain/core/entities/core/user_profile.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  factory UserResponse({
    @JsonKey(name: 'credentials') AuthCredentials? credentials,
    @JsonKey(name: 'userProfile') UserProfile? userProfile,
    @JsonKey(name: 'caregiverProfile') CaregiverState? caregiverState,
    @JsonKey(name: 'getStreamToken') String? streamToken,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
