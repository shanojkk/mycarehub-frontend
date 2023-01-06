import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'caregiver_information.freezed.dart';
part 'caregiver_information.g.dart';

/// Basic information about a caregiver
@freezed
class CaregiverInformation with _$CaregiverInformation {
  factory CaregiverInformation({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    @JsonKey(name: 'caregiverType', fromJson: caregiverTypeFromJson, toJson: caregiverTypeToJson)
        CaregiverType? caregiverType,
    String? clientID,
  }) = _CaregiverInformation;

  factory CaregiverInformation.fromJson(Map<String, dynamic> json) =>
      _$CaregiverInformationFromJson(json);

  factory CaregiverInformation.initial() => CaregiverInformation(
        firstName: UNKNOWN,
        lastName: UNKNOWN,
        phoneNumber: UNKNOWN,
        caregiverType: CaregiverType.HEALTHCARE_PROFESSIONAL,
        clientID: UNKNOWN,
      );
}

/// Formats the caregiver type
CaregiverType caregiverTypeFromJson(String? caregiverTypeString) {
  if (caregiverTypeString == null || caregiverTypeString.isEmpty) {
    return CaregiverType.HEALTHCARE_PROFESSIONAL;
  }

  switch (caregiverTypeString.toUpperCase()) {
    case 'FATHER':
      return CaregiverType.FATHER;
    case 'MOTHER':
      return CaregiverType.MOTHER;
    case 'SIBLING':
      return CaregiverType.SIBLING;
    default:
      return CaregiverType.HEALTHCARE_PROFESSIONAL;
  }
}

/// Formats the caregiver type
String caregiverTypeToJson(CaregiverType? caregiverType) {
  switch (caregiverType) {
    case CaregiverType.FATHER:
      return 'FATHER';
    case CaregiverType.MOTHER:
      return 'MOTHER';
    case CaregiverType.SIBLING:
      return 'SIBLING';
    default:
      return 'HEALTHCARE_PROFESSIONAL';
  }
}
