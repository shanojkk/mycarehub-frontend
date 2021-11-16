import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_afya_user_profile.freezed.dart';
part 'my_afya_user_profile.g.dart';

@freezed
class MyAfyaUserProfile with _$MyAfyaUserProfile {
  factory MyAfyaUserProfile({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'userName') Name? username,
    @JsonKey(name: 'primaryPhone') PhoneNumber? primaryPhoneNumber,
    @JsonKey(name: 'primaryEmailAddress') EmailAddress? primaryEmailAddress,
    @JsonKey(name: 'termsAccepted') bool? termsAccepted,
    @JsonKey(name: 'userBioData') BioData? userBioData,
  }) = _MyAfyaUserProfile;

  factory MyAfyaUserProfile.fromJson(Map<String, dynamic> json) =>
      _$MyAfyaUserProfileFromJson(json);

  factory MyAfyaUserProfile.initial() => MyAfyaUserProfile(
        id: UNKNOWN,
        username: Name.withValue(UNKNOWN),
      );
}
