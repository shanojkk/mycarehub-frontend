// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/caregiver/managed_clients.dart';

part 'managed_client_response.freezed.dart';
part 'managed_client_response.g.dart';

@freezed
class ManagedClientsResponse with _$ManagedClientsResponse {
  factory ManagedClientsResponse({
    @JsonKey(name: 'getCaregiverManagedClients') ManagedClients? managedClients,
  }) = _ManagedClientsResponse;

  factory ManagedClientsResponse.fromJson(Map<String, dynamic> json) =>
      _$ManagedClientsResponseFromJson(json);
}
