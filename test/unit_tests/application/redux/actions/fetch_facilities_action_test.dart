import 'dart:convert';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/fetch_facilities_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';

import '../../../../mocks.dart';

void main() {
  group('FetchFacilitiesAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should run successfully', () async {
      storeTester.dispatch(
        FetchFacilitiesAction(
          client: MockGraphQlClient(),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchFacilitiesAction);

      expect(info.state.wait!.isWaitingFor(fetchFacilitiesFlag), false);
    });

    test('should run successfully when there is one facility', () async {
      storeTester.dispatch(
        FetchFacilitiesAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              json.encode(
                <String, dynamic>{
                  'data': <String, dynamic>{
                    'getClientFacilities': <String, dynamic>{
                      'Pagination': <String, dynamic>{
                        'limit': 20,
                        'currentPage': 1,
                        'count': 1,
                        'totalPages': 1,
                        'nextPage': null,
                        'previousPage': null
                      },
                      'facilities': <dynamic>[
                        <String, dynamic>{
                          'id': 'some-id',
                          'name': 'hospital name',
                          'code': 1,
                          'phone': '',
                          'active': true,
                          'county': 'some-county',
                          'description': '',
                          'fhirOrganisationID': '',
                          'workStationDetails': <String, dynamic>{
                            'notifications': 1,
                            'surveys': 1,
                            'articles': 1,
                            'messages': 1
                          }
                        },
                      ]
                    }
                  }
                },
              ),
              201,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchFacilitiesAction);

      expect(info.state.wait!.isWaitingFor(fetchFacilitiesFlag), false);
      expect(
        info.state.clientState?.facilityState?.currentFacility?.name,
        'hospital name',
      );
    });

    test('should throw error if api call is not 200', () async {
      storeTester.dispatch(
        FetchFacilitiesAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              500,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchFacilitiesAction);

      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });

    test('should throw error if response has error', () async {
      storeTester.dispatch(
        FetchFacilitiesAction(
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              200,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchFacilitiesAction);

      expect(
        (info.error! as UserException).msg,
        getErrorMessage('fetching facilities'),
      );
    });
  });
}
