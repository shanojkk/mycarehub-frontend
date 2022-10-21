// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/core/workstation_details.dart';

part 'managed_client.freezed.dart';
part 'managed_client.g.dart';

@freezed
class ManagedClient with _$ManagedClient {
  factory ManagedClient({
    @JsonKey(name: 'caregiverConsent') bool? caregiverConsent,
    @JsonKey(name: 'clientConsent') bool? clientConsent,
    @JsonKey(name: 'workStationDetails') WorkStationDetails? workStationDetails,
    @JsonKey(name: 'clientProfile') UserData? user,
  }) = _ManagedClient;

  factory ManagedClient.fromJson(Map<String, dynamic> json) =>
      _$ManagedClientFromJson(json);

  factory ManagedClient.initial() => ManagedClient(
        clientConsent: false,
        caregiverConsent: false,
        workStationDetails: WorkStationDetails.initial(),
        user: UserData.initial(),
      );
}
