// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/medical_data/medical_data_category.dart';
import 'package:pro_health_360/domain/core/entities/medical_data/medical_data_clinical_status.dart';
import 'package:pro_health_360/domain/core/entities/medical_data/medication_codeable_concept.dart';

part 'medical_data_details.freezed.dart';
part 'medical_data_details.g.dart';

@freezed
class MedicalDataDetails with _$MedicalDataDetails {
  factory MedicalDataDetails({
    @JsonKey(name: 'ValueString') String? valueString,
    @JsonKey(name: 'Code') MedicalDataCode? code,
    @JsonKey(name: 'Category') MedicalDataCategory? category,
    @JsonKey(name: 'MedicationCodeableConcept')
        MedicationCodeableConcept? medicationCodeableConcept,
  }) = _MedicalDataDetails;

  factory MedicalDataDetails.fromJson(Map<String, dynamic> json) =>
      _$MedicalDataDetailsFromJson(json);

  factory MedicalDataDetails.initial() => MedicalDataDetails(
        valueString: UNKNOWN,
        code: MedicalDataCode.initial(),
        category: MedicalDataCategory.initial(),
        medicationCodeableConcept: MedicationCodeableConcept.initial(),
      );
}
