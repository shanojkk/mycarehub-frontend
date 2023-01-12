import 'package:pro_health_360/domain/core/entities/core/authority_permission.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AuthorityPermission fromJson', () {
    final Map<String, dynamic> mockAuthorityPermission = <String, dynamic>{
      'permissionID': 'some-id',
      'active': false
    };
    final AuthorityPermission permission =
        AuthorityPermission.fromJson(mockAuthorityPermission);

    expect(permission, isA<AuthorityPermission>());
    expect(permission.id, 'some-id');
  });

  test('initial AuthorityPermission object is correctly created', () {
    final AuthorityPermission authorityPermission =
        AuthorityPermission.initial();
    expect(authorityPermission.id, UNKNOWN);
    expect(authorityPermission.active, false);
  });
}
