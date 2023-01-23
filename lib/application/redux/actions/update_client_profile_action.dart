// Package imports:
import 'package:pro_health_360/domain/core/entities/core/authority_permission.dart';
import 'package:pro_health_360/domain/core/entities/core/client_profile.dart';
import 'package:pro_health_360/domain/core/entities/core/facility.dart';
import 'package:pro_health_360/domain/core/entities/core/user.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/address.dart';
import 'package:pro_health_360/domain/core/entities/core/client_state.dart';
import 'package:pro_health_360/domain/core/entities/profile/caregiver_information.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

class UpdateClientProfileAction extends ReduxAction<AppState> {
  UpdateClientProfileAction({
    this.id,
    this.active,
    this.lastMoodRecordedDate,
    this.isSignedIn,
    this.treatmentEnrollmentDate,
    this.counselled,
    this.clientTypes,
    this.facilityID,
    this.treatmentBuddy,
    this.facilityName,
    this.facilityPhoneNumber,
    this.chvUserID,
    this.chvUserName,
    this.addresses,
    this.cccNumber,
    this.caregiverInformation,
    this.notifications,
    this.hasCaregiverInfo,
    this.user,
    this.roles,
    this.permissions,
    this.communityToken,
    this.fhirPatientID,
    this.healthRecordID,
    this.defaultFacility,
    this.caregiverID,
  });

  final bool? active;
  final List<Address>? addresses;
  final CaregiverInformation? caregiverInformation;
  final String? cccNumber;
  final String? chvUserID;
  final String? chvUserName;
  final List<ClientType>? clientTypes;
  final bool? counselled;
  final String? facilityID;
  final String? facilityName;
  final String? facilityPhoneNumber;
  final String? fhirPatientID;
  final String? healthRecordID;
  final bool? hasCaregiverInfo;
  final String? id;
  final bool? isSignedIn;
  final String? lastMoodRecordedDate;
  final List<NotificationDetails?>? notifications;
  final String? treatmentBuddy;
  final String? treatmentEnrollmentDate;
  final User? user;
  final List<Role>? roles;
  final List<AuthorityPermission>? permissions;
  final String? communityToken;
  final Facility? defaultFacility;
  final String? caregiverID;

  @override
  AppState reduce() {
    final ClientProfile newClientProfile = ClientProfile(
      id: this.id ?? state.clientState?.clientProfile?.id,
      active: this.active ?? state.clientState?.clientProfile?.active,
      treatmentEnrollmentDate: this.treatmentEnrollmentDate ??
          state.clientState!.clientProfile?.treatmentEnrollmentDate,
      clientTypes:
          this.clientTypes ?? state.clientState?.clientProfile?.clientTypes,
      counselled:
          this.counselled ?? state.clientState?.clientProfile?.counselled,
      treatmentBuddy: this.treatmentBuddy ??
          state.clientState?.clientProfile?.treatmentBuddy,
      chvUserID: this.chvUserID ?? state.clientState?.clientProfile?.chvUserID,
      chvUserName:
          this.chvUserName ?? state.clientState?.clientProfile?.chvUserName,
      cccNumber: this.cccNumber ?? state.clientState?.clientProfile?.cccNumber,
      user: this.user ?? state.clientState?.clientProfile?.user,
      fhirPatientID:
          this.fhirPatientID ?? state.clientState?.clientProfile?.fhirPatientID,
      healthRecordID: this.healthRecordID ??
          state.clientState?.clientProfile?.healthRecordID,
      defaultFacility: this.defaultFacility ??
          state.clientState?.clientProfile?.defaultFacility,
      caregiverID:
          this.caregiverID ?? state.clientState?.clientProfile?.caregiverID,
    );

    final AppState newState = state.copyWith(
      clientState: state.clientState?.copyWith.call(
        clientProfile: newClientProfile,
        isSignedIn: this.isSignedIn ?? state.clientState?.isSignedIn,
        lastMoodRecordedDate: this.lastMoodRecordedDate ??
            state.clientState?.lastMoodRecordedDate,
        facilityID: this.facilityID ?? state.clientState?.facilityID,
        facilityName: this.facilityName ?? state.clientState?.facilityName,
        facilityPhoneNumber:
            this.facilityPhoneNumber ?? state.clientState?.facilityPhoneNumber,
        addresses: this.addresses ?? state.clientState?.addresses,
        caregiverInformation: this.caregiverInformation ??
            state.clientState?.caregiverInformation,
        notifications: this.notifications ?? state.clientState?.notifications,
        hasCareGiverInfo:
            this.hasCaregiverInfo ?? state.clientState?.hasCareGiverInfo,
        roles: this.roles ?? state.clientState?.roles,
        permissions: this.permissions ?? state.clientState?.permissions,
        communityToken:
            this.communityToken ?? state.clientState?.communityToken,
      ),
    );

    return newState;
  }
}

class UpdateClientStateAction extends ReduxAction<AppState> {
  UpdateClientStateAction({this.clientState});

  final ClientState? clientState;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      clientState: clientState ?? state.clientState,
    );

    return newState;
  }
}
