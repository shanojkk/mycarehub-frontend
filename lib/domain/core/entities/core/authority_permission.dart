import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authority_permission.freezed.dart';
part 'authority_permission.g.dart';

@freezed
class AuthorityPermission with _$AuthorityPermission {
  factory AuthorityPermission({
    @JsonKey(name: 'permissionID') String? id,
    @JsonKey(name: 'Active', defaultValue: false) bool? active,
  }) = _AuthorityPermission;

  factory AuthorityPermission.fromJson(Map<String, dynamic> json) =>
      _$AuthorityPermissionFromJson(json);

  factory AuthorityPermission.initial() => AuthorityPermission(
        id: UNKNOWN,
        active: false,
      );
}
