// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_setup_data.dart';
import 'package:sghi_core/app_wrapper/enums.dart';

void main() {
  test('AppSetupData creates a valid object', () {
    final AppSetupData appSetup = AppSetupData(
      appContexts: <AppContext>[AppContext.AppDemo],
      sentryDsn: 'some sentryDNS',
      streamAPIKey: 'some-stream-api-key',
      clinicalEndpoint: '',
      environment: '',
      appName: '',
    );

    expect(appSetup.sentryDsn, 'some sentryDNS');
    expect(appSetup.appContexts.first, AppContext.AppDemo);

    final AppSetupData sameSetup = AppSetupData(
      appContexts: <AppContext>[AppContext.AppDemo],
      sentryDsn: 'some sentryDNS',
      streamAPIKey: 'some-stream-api-key',
      clinicalEndpoint: '',
      environment: '',
      appName: '',
    );

    expect(appSetup, sameSetup);
    expect(appSetup.hashCode, sameSetup.hashCode);
  });
}
