// Dart imports:
import 'dart:convert';
import 'dart:typed_data';

// Package imports:
import 'package:pro_health_360/infrastructure/endpoints.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
// Project imports:
import 'package:pro_health_360/application/core/services/custom_client.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/auth_credentials.dart';
import 'package:pro_health_360/infrastructure/endpoints.dart'
    as my_afya_hub_endpoints;

import '../../../mocks.dart';
import '../../../test_helpers.dart';
import 'custom_client_test.mocks.dart' as mocks;

@GenerateMocks(<Type>[Request, Client])
void main() {
  group('CustomClient', () {
    testWidgets('should proceed normally if token has not expired',
        (WidgetTester tester) async {
      final DateTime tokenExpiryDate =
          DateTime.now().add(const Duration(hours: 10));

      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          credentials: AuthCredentials(
            isSignedIn: true,
            tokenExpiryTimestamp: tokenExpiryDate.toIso8601String(),
          ),
        ),
      );

      late CustomClient customClient;

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = CustomClient(
                '',
                '',
                refreshTokenEndpoint: '',
                userID: '',
                context: context,
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final mocks.MockRequest baseRequest = mocks.MockRequest();
      final String jsonContent = json.encode(mockFeedContent);

      when(baseRequest.url).thenReturn(
        Uri.parse(my_afya_hub_endpoints.kTestGraphqlEndpoint),
      );

      when(baseRequest.send()).thenAnswer((_) {
        final List<int> responseBytes = utf8.encode(jsonContent);
        final StreamedResponse streamedResponse =
            StreamedResponse(Stream<List<int>>.value(responseBytes), 200);

        return Future<StreamedResponse>.value(streamedResponse);
      });

      when(baseRequest.headers).thenAnswer((_) => <String, String>{});

      final StreamedResponse resp = await customClient.send(baseRequest);

      final String respBody = await resp.stream.bytesToString();
      expect(jsonDecode(respBody), mockFeedContent);
    });

    testWidgets('should skip checks if request is login',
        (WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial(),
      );

      late CustomClient customClient;

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: Builder(
          builder: (BuildContext context) {
            customClient = CustomClient(
              '',
              '',
              refreshTokenEndpoint: '',
              userID: '',
              context: context,
            );
            return Container();
          },
        ),
      );

      await tester.pumpAndSettle();

      final mocks.MockRequest baseRequest = mocks.MockRequest();
      final String jsonContent = json.encode(mockLoginResponse);

      when(baseRequest.url).thenReturn(
        Uri.parse(my_afya_hub_endpoints.kTestLoginByPhoneEndpoint),
      );

      when(baseRequest.send()).thenAnswer((_) {
        final List<int> responseBytes = utf8.encode(jsonContent);
        final StreamedResponse streamedResponse =
            StreamedResponse(Stream<List<int>>.value(responseBytes), 200);

        return Future<StreamedResponse>.value(streamedResponse);
      });
      when(baseRequest.headers).thenAnswer((_) => <String, String>{});

      final StreamedResponse resp = await customClient.send(baseRequest);

      final String respBody = await resp.stream.bytesToString();
      expect(jsonDecode(respBody), mockLoginResponse);
    });

    testWidgets(
        'should refresh token if token has expired, and then proceed normally',
        (WidgetTester tester) async {
      final AppState state = AppState(
        credentials: AuthCredentials(isSignedIn: true),
      );

      final Store<AppState> store = Store<AppState>(initialState: state);

      late CustomClient customClient;

      final mocks.MockClient client = mocks.MockClient();

      const String userId = 'some-user-id';

      when(
        client.post(
          any,
          headers: <String, String>{'content-type': 'application/json'},
          body: jsonEncode(<String, String>{'userID': userId}),
        ),
      ).thenAnswer((_) {
        return Future<Response>.value(
          Response(
            jsonEncode(mockAuthCredentials),
            200,
            request: Request(
              'POST',
              Uri.parse(my_afya_hub_endpoints.kTestRefreshTokenEndpoint),
            ),
            headers: <String, String>{'content-type': 'application/json'},
          ),
        );
      });

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = CustomClient(
                '',
                '',
                refreshTokenEndpoint:
                    my_afya_hub_endpoints.kTestRefreshTokenEndpoint,
                userID: userId,
                client: client,
                context: context,
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final mocks.MockRequest mockRequest = mocks.MockRequest();
      final String jsonContent = json.encode(mockFeedContent);

      when(mockRequest.headers).thenReturn(
        <String, String>{'content-type': 'application/json'},
      );

      when(mockRequest.send()).thenAnswer((_) {
        final List<int> responseBytes = utf8.encode(jsonContent);
        final StreamedResponse streamedResponse =
            StreamedResponse(Stream<List<int>>.value(responseBytes), 200);

        return Future<StreamedResponse>.value(streamedResponse);
      });

      when(mockRequest.headers).thenAnswer((_) => <String, String>{});
      when(mockRequest.method).thenReturn('POST');
      when(mockRequest.url).thenReturn(
        Uri.parse(my_afya_hub_endpoints.kTestGraphqlEndpoint),
      );
      when(mockRequest.encoding).thenReturn(Encoding.getByName('utf-8')!);
      when(mockRequest.body).thenReturn(jsonContent);
      when(mockRequest.bodyBytes).thenReturn(
        Uint8List.fromList(utf8.encode(jsonContent)),
      );

      final StreamedResponse resp = await customClient.send(mockRequest);
      final String respBody = await resp.stream.bytesToString();

      expect(jsonDecode(respBody), mockFeedContent);
      expect(store.state.credentials?.idToken, mockAuthCredentials['idToken']);
    });

    testWidgets('should refresh token if abnormal expiry date',
        (WidgetTester tester) async {
      final AppState state = AppState(
        credentials: AuthCredentials.initial().copyWith(isSignedIn: true),
      );

      final Store<AppState> store = Store<AppState>(initialState: state);

      late CustomClient customClient;

      final mocks.MockClient client = mocks.MockClient();

      const String userId = 'some-user-id';

      when(
        client.post(
          any,
          headers: <String, String>{'content-type': 'application/json'},
          body: jsonEncode(<String, String>{'userID': userId}),
        ),
      ).thenAnswer((_) {
        return Future<Response>.value(
          Response(
            jsonEncode(mockAuthCredentials),
            200,
            request: Request(
              'POST',
              Uri.parse(my_afya_hub_endpoints.kTestRefreshTokenEndpoint),
            ),
            headers: <String, String>{'content-type': 'application/json'},
          ),
        );
      });

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = CustomClient(
                '',
                '',
                refreshTokenEndpoint:
                    my_afya_hub_endpoints.kTestRefreshTokenEndpoint,
                userID: userId,
                client: client,
                context: context,
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final mocks.MockRequest mockRequest = mocks.MockRequest();
      final String jsonContent = json.encode(mockFeedContent);

      when(mockRequest.headers).thenReturn(
        <String, String>{'content-type': 'application/json'},
      );

      when(mockRequest.send()).thenAnswer((_) {
        final List<int> responseBytes = utf8.encode(jsonContent);
        final StreamedResponse streamedResponse =
            StreamedResponse(Stream<List<int>>.value(responseBytes), 200);

        return Future<StreamedResponse>.value(streamedResponse);
      });

      when(mockRequest.headers).thenAnswer((_) => <String, String>{});
      when(mockRequest.method).thenReturn('POST');
      when(mockRequest.url).thenReturn(
        Uri.parse(my_afya_hub_endpoints.kTestGraphqlEndpoint),
      );
      when(mockRequest.encoding).thenReturn(Encoding.getByName('utf-8')!);
      when(mockRequest.body).thenReturn(jsonContent);
      when(mockRequest.bodyBytes).thenReturn(
        Uint8List.fromList(utf8.encode(jsonContent)),
      );

      final StreamedResponse resp = await customClient.send(mockRequest);
      final String respBody = await resp.stream.bytesToString();

      expect(jsonDecode(respBody), mockFeedContent);
      expect(store.state.credentials?.idToken, mockAuthCredentials['idToken']);
    });
  });
}

class MockCustomClient extends CustomClient {
  MockCustomClient(
    super.idToken,
    super.endpoint, {
    required super.context,
    required this.customResponse,
  }) : super(
          refreshTokenEndpoint: kTestRefreshTokenEndpoint,
          userID: '',
        );

  final Map<String, dynamic> customResponse;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    super.send(request);
    final String jsonResponse = jsonEncode(customResponse);
    final List<int> byteResponse = utf8.encode(jsonResponse);

    return StreamedResponse(Stream<List<int>>.value(byteResponse), 200);
  }
}
