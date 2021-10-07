// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/dynamic_back_route_holder.dart';
import 'package:myafyahub/presentation/router/routes.dart';

void main() {
  final DynamicBackRouteHolder holder = DynamicBackRouteHolder();
  test('BottomNavObj toJson', () {
    holder.createPINPage.add(BWRoutes.userProfile);
    expect(
      holder.createPINPage.valueOrNull,
      BWRoutes.userProfile,
    );
  });
}
