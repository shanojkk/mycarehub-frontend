import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  factory UserProfile({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'username') String? userName, // This is the nickname
    @JsonKey(name: 'name') String? name, // This is the @handle
    @JsonKey(name: 'active', defaultValue: false) bool? active,
    @JsonKey(name: 'termsAccepted', defaultValue: false) bool? termsAccepted,
    @JsonKey(name: 'hasSetPin', defaultValue: false) bool? hasSetPin,
    @JsonKey(name: 'hasSetSecurityQuestions', defaultValue: false)
        bool? hasSetSecurityQuestions,
    @JsonKey(name: 'hasSetNickname', defaultValue: false) bool? hasSetNickname,
    @JsonKey(name: 'isPhoneVerified', defaultValue: false)
        bool? isPhoneVerified,

    /// Whether this UserProfile needs to change their PIN
    ///
    /// This is normally used to signify that this UserProfile is a new UserProfile
    @JsonKey(name: 'pinChangeRequired', defaultValue: false)
        bool? pinChangeRequired,

    /// Used to indicate that the UserProfile's PIN has been reset by someone else
    ///
    /// This is used to trigger the change PIN workflow
    @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
        bool? pinUpdateRequired,
    @JsonKey(name: 'suspended', defaultValue: false) bool? suspended,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  factory UserProfile.initial() => UserProfile(
        name: UNKNOWN,
        active: false,
        termsAccepted: false,
        pinChangeRequired: false,
        pinUpdateRequired: false,
        hasSetNickname: false,
        hasSetPin: false,
        hasSetSecurityQuestions: false,
        isPhoneVerified: false,
        suspended: false,
      );
}
