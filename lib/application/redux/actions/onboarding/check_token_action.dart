// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:pro_health_360/application/core/services/custom_client.dart';
import 'package:pro_health_360/application/redux/actions/onboarding/update_initial_route_action.dart';
import 'package:pro_health_360/application/redux/actions/update_credentials_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/auth_credentials.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class CheckTokenAction extends ReduxAction<AppState> {
  CheckTokenAction({
    required this.httpClient,
    required this.refreshTokenEndpoint,
  });

  final CustomClient httpClient;
  final String refreshTokenEndpoint;

  @override
  Future<AppState?> reduce() async {
    final bool isSignedIn = state.credentials?.isSignedIn ?? false;

    String initialRoute = AppRoutes.phoneLogin;

    if (isSignedIn) {
      final DateTime now = DateTime.now();

      final DateTime expiresAt = DateTime.parse(
        state.credentials?.tokenExpiryTimestamp ?? now.toIso8601String(),
      );

      if (hasTokenExpired(expiresAt, now)) {
        AuthCredentials? authCredentials = await httpClient.refreshToken();

        if (authCredentials?.idToken != null &&
            authCredentials?.expiresIn != null &&
            authCredentials?.refreshToken != null) {
          final DateTime expiryTimestamp =
              getTokenExpiryTimestamp(authCredentials?.expiresIn);

          authCredentials = authCredentials?.copyWith(
            tokenExpiryTimestamp: expiryTimestamp.toIso8601String(),
          );

          dispatch(
            UpdateCredentialsAction(
              idToken: authCredentials?.idToken,
              refreshToken: authCredentials?.refreshToken,
              expiresIn: authCredentials?.expiresIn,
              tokenExpiryTimestamp: authCredentials?.tokenExpiryTimestamp,
            ),
          );

          // User is authenticated, ask them to put in their pin
          initialRoute = AppRoutes.resumeWithPin;
        } else {
          initialRoute = AppRoutes.phoneLogin;
        }
      } else {
        // User is authenticated, ask them to put in their pin
        initialRoute = AppRoutes.resumeWithPin;
      }
    }

    dispatch(UpdateInitialRouteAction(initialRoute: initialRoute));

    return null;
  }
}
