// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:pro_health_360/domain/core/entities/core/address.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

part 'related_person.g.dart';
part 'related_person.freezed.dart';

@freezed
class RelatedPerson with _$RelatedPerson {
  factory RelatedPerson({
    @JsonKey(name: 'active')
        bool? active,
    @JsonKey(name: 'relatedTo')
        String? relatedTo,
    @JsonKey(
      name: 'relationshipType',
      defaultValue: RelationshipType.UNKNOWN,
    )
        RelationshipType? relationshipType,
    @JsonKey(name: 'firstName')
        String? firstName,
    @JsonKey(name: 'lastName')
        String? lastName,
    @JsonKey(name: 'otherName')
        String? otherName,
    @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
        Gender? gender,
    @JsonKey(name: 'dateOfBirth')
        String? dateOfBirth,
    @JsonKey(name: 'addresses')
        List<Address>? addresses,
    @JsonKey(name: 'contacts')
        List<Contact>? contacts,
  }) = _RelatedPerson;

  factory RelatedPerson.fromJson(Map<String, dynamic> json) =>
      _$RelatedPersonFromJson(json);

  factory RelatedPerson.initial() => RelatedPerson(
        active: false,
        relatedTo: UNKNOWN,
        relationshipType: RelationshipType.UNKNOWN,
        firstName: UNKNOWN,
        lastName: UNKNOWN,
        otherName: UNKNOWN,
        gender: Gender.unknown,
        dateOfBirth: UNKNOWN,
        addresses: <Address>[],
        contacts: <Contact>[],
      );
}
