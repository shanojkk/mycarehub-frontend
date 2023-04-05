// Dart imports:
// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_health_360/application/core/services/custom_client.dart';
import 'package:pro_health_360/domain/core/entities/core/auth_credentials.dart';
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_messaging_platform_interface/firebase_messaging_platform_interface.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sghi_core/communities/core/endpoints.dart';
import 'package:sghi_core/flutter_graphql_client/flutter_graphql_client.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
// Project imports:
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/infrastructure/repository/initialize_db.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

import 'mock_utils.dart';
import 'mock_data.dart';
import 'test_utils.dart';
import 'package:firebase_analytics_platform_interface/firebase_analytics_platform_interface.dart';

class MockInitializeDB extends Mock implements InitializeDB<MockStateDB> {
  @override
  Future<MockStateDB> database({MockStateDB? preInitializedDB}) =>
      super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: Future<MockStateDB>.value(MockStateDB()),
      ) as Future<MockStateDB>;

  @override
  String get dbName =>
      super.noSuchMethod(Invocation.getter(#dbName), returnValue: 'testDb')
          as String;
}

const String testString = 'test';

class MockClientState extends Mock implements stream.ClientState {}

class MockLogger extends Mock implements stream.Logger {}

class MockChannel extends Mock implements stream.Channel {
  @override
  Future<bool> get initialized async => true;
}

class MockConnectivityPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements ConnectivityPlatform {
  MockConnectivityPlatform({List<ConnectivityResult>? connectivityValues})
      : connectivityValues = connectivityValues ??
            <ConnectivityResult>[ConnectivityResult.mobile];

  final List<ConnectivityResult> connectivityValues;

  @override
  Future<ConnectivityResult> checkConnectivity() async {
    return connectivityValues.last;
  }

  @override
  Stream<ConnectivityResult> get onConnectivityChanged {
    return Stream<ConnectivityResult>.fromIterable(connectivityValues);
  }
}

class MockStateDB extends Mock implements Database {
  @override
  Batch batch() {
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    throw UnimplementedError();
  }

  @override
  Future<int> delete(String table, {String? where, List<Object?>? whereArgs}) {
    throw UnimplementedError();
  }

  @override
  Future<T> devInvokeMethod<T>(String method, [dynamic arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<T> devInvokeSqlMethod<T>(
    String method,
    String sql, [
    List<Object?>? arguments,
  ]) {
    throw UnimplementedError();
  }

  @override
  Future<void> execute(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  Future<int> getVersion() {
    throw UnimplementedError();
  }

  @override
  Future<int> insert(
    String table,
    Map<String, Object?> values, {
    String? nullColumnHack,
    ConflictAlgorithm? conflictAlgorithm,
  }) {
    throw UnimplementedError();
  }

  @override
  bool get isOpen => true;

  @override
  String get path => 'test';

  @override
  Future<List<Map<String, Object?>>> query(
    String table, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<int> rawDelete(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  @override
  Future<int> rawInsert(String sql, [List<Object?>? arguments]) =>
      super.noSuchMethod(
        Invocation.method(#rawInsert, <dynamic>[sql, arguments]),
        returnValue: Future<int>.value(10),
      ) as Future<int>;

  @override
  Future<List<Map<String, Object?>>> rawQuery(
    String sql, [
    List<Object?>? arguments,
  ]) =>
      super.noSuchMethod(
        Invocation.method(#rawQuery, <dynamic>[sql, arguments]),
        returnValue: Future<List<Map<String, Object?>>>.value(
          <Map<String, Object?>>[
            <String, Object?>{'users': 10}
          ],
        ),
      ) as Future<List<Map<String, Object?>>>;

  @override
  Future<int> rawUpdate(String sql, [List<Object?>? arguments]) {
    throw UnimplementedError();
  }

  Future<void> setVersion(int version) {
    throw UnimplementedError();
  }

  @override
  Future<T> transaction<T>(
    Future<T> Function(Transaction txn) action, {
    bool? exclusive,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<int> update(
    String table,
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
    ConflictAlgorithm? conflictAlgorithm,
  }) {
    throw UnimplementedError();
  }
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockBuildContext extends Mock implements BuildContext {}

class MockTextEditingController extends Mock implements TextEditingController {}

typedef OnObservation = void Function(
  Route<dynamic>? route,
  Route<dynamic>? previousRoute,
);

class TestNavigatorObserver extends NavigatorObserver {
  TestNavigatorObserver({this.onPop, this.onPush});

  final OnObservation? onPop;
  final OnObservation? onPush;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      onPop?.call(route, previousRoute);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    onPush?.call(route, previousRoute);
  }
}

class MockCustomGraphQlClient extends IGraphQlClient implements CustomClient {
  MockCustomGraphQlClient.withResponse(
    String idToken,
    String endpoint,
    this.response,
  ) {
    super.idToken = idToken;
    super.endpoint = endpoint;
  }

  final http.Response response;

  @override
  Future<http.Response> callRESTAPI({
    required String endpoint,
    required String method,
    Map<String, dynamic>? variables,
    Duration? timeout,
    Map<String, String>? customHeaders,
  }) {
    return Future<http.Response>.value(response);
  }

  @override
  Future<http.Response> query(
    String queryString,
    Map<String, dynamic> variables, {
    Duration? timeout,
  }) {
    return Future<http.Response>.value(response);
  }

  @override
  Future<AuthCredentials?> refreshToken() {
    return Future<AuthCredentials>(AuthCredentials.initial);
  }

  @override
  BuildContext get context => throw UnimplementedError();

  @override
  String get refreshTokenEndpoint => throw UnimplementedError();

  @override
  String get userID => throw UnimplementedError();
}

/// a short client for providing custom responses
///
/// a good use case is when you want to return error responses
class MockShortGraphQlClient extends IGraphQlClient {
  MockShortGraphQlClient();
  MockShortGraphQlClient.withResponse(
    String idToken,
    String endpoint,
    this.response,
  ) {
    super.idToken = idToken;
    super.endpoint = endpoint;
  }

  late final http.Response response;

  @override
  Future<http.Response> callRESTAPI({
    required String endpoint,
    required String method,
    Map<String, dynamic>? variables,
    Duration? timeout,
    Map<String, String>? customHeaders,
  }) {
    return Future<http.Response>.value(response);
  }

  @override
  Future<http.Response> query(
    String queryString,
    Map<String, dynamic> variables, {
    Duration? timeout,
  }) {
    return Future<http.Response>.value(response);
  }

  @override
  Future<http.Response> uploadMedia({
    required String endpoint,
    required Map<String, String> uploadHeaders,
    Function(http.StreamedRequest request)? updateSink,
    Duration? timeout,
  }) {
    return Future<http.Response>.value(response);
  }
}

class MockGraphQlClient extends Mock implements GraphQlClient {
  String removeUserAsExperimenterVariables =
      json.encode(<String, dynamic>{'participate': false});

  String sendOTPTesterVariables =
      json.encode(<String, dynamic>{'phone': testPhoneNumber});

  String setupUserAsExperimenterVariables =
      json.encode(<String, dynamic>{'participate': true});

  @override
  Future<http.Response> callRESTAPI({
    required String endpoint,
    required String method,
    Map<String, dynamic>? variables,
    Duration? timeout,
    Map<String, String>? customHeaders,
  }) async {
    if (endpoint.contains('login_by_phone')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(mockLoginResponse),
          201,
        ),
      );
    }

    if (endpoint.contains('request_pin_reset')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, String>{
              'otp': '6969',
              'phoneNumber': '+25471123123',
            },
          ),
          201,
        ),
      );
    }

    if (endpoint.contains('user_recovery_phonenumbers')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{'otp': '6969'},
          ),
          201,
        ),
      );
    }

    if (endpoint.contains('verify_phone')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'isNewUser': false,
            },
          ),
          201,
        ),
      );
    }

    if (endpoint.contains('upload')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'id': '1r1idoAs54kbZ90l9KkHSK7GKva',
            },
          ),
          201,
        ),
      );
    }

    if (endpoint.contains('reset_pin')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(true),
          201,
        ),
      );
    }

    if (endpoint.contains('verify_otp')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(true),
          201,
        ),
      );
    }

    if (endpoint.contains('send_otp')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode('123456'),
          201,
        ),
      );
    }

    if (endpoint.contains('send_retry_otp')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode('123456'),
          201,
        ),
      );
    }

    if (endpoint.contains('create_user_by_phone')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'userCreated': true,
            },
          ),
          201,
        ),
      );
    }

    if (endpoint.contains('refresh_token')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'expiresIn': '3600',
              'idToken': 'some-id-token',
              'refreshToken': 'some-refresh-token'
            },
          ),
          201,
        ),
      );
    }

    if (endpoint.contains(syncEndpoint)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(syncResponseMock),
          201,
        ),
      );
    }

    if (endpoint.contains('joined_members')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(joinedMembersResponseMock),
          201,
        ),
      );
    }

    if (endpoint.contains('/send/m.room.message/')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'event_id': '16741180035XJnPW:chat.savannahghi.org',
          }),
          201,
        ),
      );
    }

    if (endpoint.contains('m.room.power_levels')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(powerLevelsResponseMock),
          201,
        ),
      );
    }

    if (endpoint.contains('/invite')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{}),
          201,
        ),
      );
    }

    if (endpoint.contains('/join')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'room_id': '!NvYSqaASzlfRpFCMtr:chat.savannahghi.org',
          }),
          201,
        ),
      );
    }

    if (endpoint.contains('/leave')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{}),
          201,
        ),
      );
    }

    if (endpoint.contains('/kick')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{}),
          201,
        ),
      );
    }

    if (endpoint.contains('/redact')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'event_id': '16741180035XJnPW:chat.savannahghi.org',
          }),
          201,
        ),
      );
    }

    if (endpoint.contains('/media/v3/download/')) {
      final String dir = Directory.current.path;
      final String imgPath = '$dir/test/tests_resources/test_file.png';
      final ByteData imgData = await rootBundle.load(imgPath);
      final Uint8List uint8list = imgData.buffer.asUint8List();

      return Future<http.Response>.value(
        http.Response(json.encode(uint8list), 201),
      );
    }

    if (endpoint.contains(searchMembersEndpoint)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'results': <Map<String, dynamic>>[loginResponseMock],
          }),
          201,
        ),
      );
    }

    return Future<http.Response>.value(
      http.Response(
        json.encode(
          <String, dynamic>{
            'data': <String, dynamic>{
              // add your data here
            }
          },
        ),
        201,
      ),
    );
  }

  @override
  String? parseError(Map<String, dynamic>? body) {
    const String errString =
        'Oops!!! Something wrong just happened. If this persists, log out and login again';
    if (body == null) {
      return errString;
    }
    Object? error;
    if (body.containsKey('errors')) {
      error = body['errors'];
    } else if (body.containsKey('error')) {
      error = body['error'];
    } else {
      error = null;
    }
    if (error is String) {
      return error.contains('ID token')
          ? 'Oops!!! Something wrong just happened. If this persists, log out and login again'
          : error;
    }
    if (error is List<dynamic>) {
      // ignore: avoid_dynamic_calls
      return error[0]['message'] as String;
    }
    if (error is Map) {
      return error.toString();
    }
    return null;
  }

  @override
  Future<http.Response> query(
    String queryString,
    Map<String, dynamic> variables, {
    Duration? timeout,
  }) {
    if (queryString.contains(patientTimelineQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': mockHealthTimelineItems,
            },
          ),
          200,
        ),
      );
    }

    if (json.encode(variables) == sendOTPTesterVariables) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'otp': testOTP,
                'phoneNumber': testPhoneNumber,
              }
            },
          ),
          200,
        ),
      );
    }

    if (queryString.contains('UpdateProfile')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'updateProfile': true}
          }),
          201,
        ),
      );
    }

    if (queryString.contains('unreadPersistentItems')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'unreadPersistentItems': 3}
          }),
          201,
        ),
      );
    }

    if (queryString.contains('generateOTP')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'generateOTP': '1234'}
          }),
          201,
        ),
      );
    }

    if (queryString.contains('emailVerificationOTP')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'emailVerificationOTP': '1234'}
          }),
          201,
        ),
      );
    }
    if (queryString.contains('verifyMSISDNandPIN')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'verifyMSISDNandPIN': true}
          }),
          201,
        ),
      );
    }

    if (queryString.contains('updateUserPIN')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'updateUserPIN': true},
          }),
          201,
        ),
      );
    }

    if (queryString.contains('generateRetryOTP')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'generateRetryOTP': '1234'},
          }),
          201,
        ),
      );
    }

    if (queryString.contains('completeSignup')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'completeSignup': true},
          }),
          201,
        ),
      );
    }

    if (queryString.contains('updateUserProfile')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'updateUserProfile': <String, dynamic>{
                'userBioData': <String, dynamic>{
                  'firstName': 'John',
                  'lastName': 'Doe',
                  'gender': 'male',
                  'dateOfBirth': '2000-01-01'
                }
              }
            },
          }),
          201,
        ),
      );
    }

    if (queryString.contains('userProfile')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'userProfile': true,
            },
          }),
          201,
        ),
      );
    }

    if (queryString == getHealthDiaryEntriesQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'getClientHealthDiaryEntries': mockDiaryEntries,
              },
            },
          ),
          201,
        ),
      );
    }

    if (queryString == updateClientCaregiverMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'createOrUpdateClientCaregiver': true}
            },
          ),
          201,
        ),
      );
    }

    if (queryString == retrieveFacilityQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'retrieveFacility': <String, dynamic>{
                  'ID': 'some-id',
                  'name': 'name',
                  'code': 1111,
                  'county': 'Nairobi',
                  'active': true,
                  'phone': '+254712345678',
                  'description': 'name Hospital'
                }
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains('canrecordmood')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'canRecordMood': true,
            },
          }),
          201,
        ),
      );
    }

    if (queryString.contains('userProfile')) {
      /// return fake data here
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'userProfile': true,
            },
          }),
          201,
        ),
      );
    }

    if (queryString == getContentQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'getContent': <String, dynamic>{
                  'items': <dynamic>[contentMock.first]
                },
              },
            },
          ),
          201,
        ),
      );
    }
    if (queryString == getFAQsQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'getFAQs': <String, dynamic>{
                  'items': <dynamic>[contentMock.first]
                },
              },
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains('fetchSuggestedGroups')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'fetchSuggestedGroups': mockSuggestions,
              },
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains('getEmptyFAQ')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'getFaqsContent': <dynamic>[]}
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains('getErrorFAQ')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{'error': 'no FAQ'}), 201),
      );
    }

    if (queryString.contains('resendOTP')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'resendOTP': true,
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains('sendOTP')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'sendOTP': true,
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains('getTimeoutErrorFAQ')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{'error': 'timeout'}), 201),
      );
    }

    if (queryString.contains('getNullFAQ')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{}), 401),
      );
    }

    if (queryString.contains('createMemberProfileRequest')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'createMemberProfileRequest': <String, dynamic>{'state': 'DRAFT'}
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains('upload')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'upload': <String, dynamic>{
                'id': 'uploadID',
              },
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains('getEmptyLibrary')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'getLibraryContent': <dynamic>[]}
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains('getErrorLibrary')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{'error': 'no FAQ'}), 201),
      );
    }

    if (queryString.contains('getTimeoutErrorLibrary')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{'error': 'timeout'}), 201),
      );
    }

    if (queryString.contains('setUserCommunicationsSettings')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'setUserCommunicationsSettings': <String, dynamic>{
                'allowWhatsApp': true,
                'allowPush': false,
                'allowEmail': true,
                'allowTextSMS': true
              }
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains('getMemberRequestByPhoneNumber')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getMemberRequestByPhoneNumber': <dynamic>[]
            }
          }),
          201,
        ),
      );
    }

    if (queryString.contains('getNullLibrary')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{'data': null}), 401),
      );
    }

    //set User PIN
    if (queryString == setUserPINMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'setUserPIN': true}
          }),
          201,
        ),
      );
    }

    //setNickname
    if (queryString == setNickNameMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'setNickName': true}
          }),
          201,
        ),
      );
    }

    if (queryString == completeOnboardingTourMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'completeOnboardingTour': true}
          }),
          201,
        ),
      );
    }

    if (queryString == getTermsQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getCurrentTerms': termsMock,
            }
          }),
          200,
        ),
      );
    }

    if (queryString == checkIfUserHasLikedContentQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'checkIfUserHasLikedContent': true,
            }
          }),
          200,
        ),
      );
    }

    if (queryString == listClientCaregiverQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'listClientsCaregivers': <String, dynamic>{
                'firstName': 'Jac',
                'lastName': 'Dough',
                'phoneNumber': '+254712344679',
                'caregiverType': 'SIBLING'
              }
            }
          }),
          200,
        ),
      );
    }

    if (queryString == checkIfUserBookmarkedContentQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'checkIfUserBookmarkedContent': false,
            }
          }),
          200,
        ),
      );
    }

    if (queryString == canRecordMoodQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'canRecordMood': true,
            }
          }),
          200,
        ),
      );
    }

    if (queryString == medicalDataQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'data': mockMedicalDataResponse}),
          200,
        ),
      );
    }

    if (queryString == searchObservationsQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'data': mockViralLoadDataResponse}),
          200,
        ),
      );
    }

    if (queryString == optOutMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'optOut': true,
            }
          }),
          200,
        ),
      );
    }
    if (queryString == getScreeningToolsQuestionsQuery) {
      return Future<http.Response>.value(
        http.Response(json.encode(screeningQuestionsMock), 200),
      );
    }
    if (queryString == answerScreeningToolQuestionMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{'respondToScreeningTool': true}
            },
          ),
          200,
        ),
      );
    }

    if (queryString == listUserProgramsQuery) {
      return Future<http.Response>.value(
        http.Response(json.encode(userProgramsMock), 200),
      );
    }

    if (queryString == setClientProgramMutation) {
      return Future<http.Response>.value(
        http.Response(json.encode(clientProgramDataMock), 200),
      );
    }
    if (queryString == getAvailableScreeningToolQuery) {
      return Future<http.Response>.value(
        http.Response(json.encode(availableScreeningToolsMock), 200),
      );
    }
    if (queryString == getUserSurveyFormsQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getUserSurveyForms': <dynamic>[
                <String, dynamic>{
                  'id': '725d719d-d720-47d0-860e-64b8431a4cad',
                  'link': 'https://mycarehub.org',
                  'title': 'phq9',
                  'description': 'description'
                },
              ]
            }
          }),
          200,
        ),
      );
    }
    if (queryString == listAppointmentsQuery) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'fetchClientAppointments': <String, dynamic>{
                'appointments': mockAppointments,
              }
            }
          }),
          200,
        ),
      );
    }
    if (queryString == rescheduleAppointmentMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'rescheduleAppointment': true,
            }
          }),
          200,
        ),
      );
    }

    if (queryString == shareHealthDiaryEntryMutation) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'shareHealthDiaryEntry': true,
            }
          }),
          200,
        ),
      );
    }

    if (queryString.contains(fetchNotificationFiltersQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{'data': mockNotificationFiltersResponse},
          ),
          201,
        ),
      );
    }
    if (queryString.contains(listNotificationsQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'data': mockNotificationsResponse}),
          201,
        ),
      );
    }
    if (queryString.contains(getCategoriesQuery)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'listContentCategories': categoriesMock,
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(getClientFacilitiesQuery)) {
      return Future<http.Response>.value(
        http.Response(json.encode(clientFacilitiesMock), 201),
      );
    }

    if (queryString.contains(setClientDefaultFacilityMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'setClientDefaultFacility': true,
              }
            },
          ),
          201,
        ),
      );
    }

    if (queryString.contains(getCaregiverManagedClientsQuery)) {
      return Future<http.Response>.value(
        http.Response(json.encode(caregiverManagedClientsMock), 201),
      );
    }

    if (queryString.contains(readNotificationsMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'readNotifications': true,
              }
            },
          ),
          201,
        ),
      );
    }
    if (queryString.contains(viewContentMutation)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(
            <String, dynamic>{
              'data': <String, dynamic>{
                'viewContent': true,
              }
            },
          ),
          201,
        ),
      );
    }

    return Future<http.Response>.value(
      http.Response(
        json.encode(<String, dynamic>{'data': <String, dynamic>{}}),
        200,
      ),
    );
  }

  @override
  Map<String, dynamic> toMap(http.Response? response) {
    final dynamic res = json.decode(response!.body);

    if (res is Map) return res as Map<String, dynamic>;
    // ignore: avoid_dynamic_calls
    return res[0] as Map<String, dynamic>;
  }
}

/// Please refer to:
///
///  https://developer.android.com/training/multiscreen/screendensities#dips-pels
const Size typicalPhoneScreenSizePortrait = Size(320, 480);
const Size typicalPhoneScreenSizeLandscape = Size(480, 320);

const Size mediumSizedTabletPortrait = Size(600, 1024);
const Size mediumSizedTabletLandscape = Size(1024, 600);

const Size tabletPortrait = Size(720, 1280);
const Size tabletLandscape = Size(1280, 720);
const Size typicalLargePhoneScreenSizePortrait = Size(300, 800);

final MockFirebaseMessaging kMockMessagingPlatform = MockFirebaseMessaging();

void setupFirebaseCoreMocks() {
  TestFirebaseCoreHostApi.setup(MockFirebaseApp());
}

void setupFirebaseMessagingMocks() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setupFirebaseCoreMocks();

  // Mock Platform Interface Methods
  // ignore: invalid_use_of_protected_member
  when(kMockMessagingPlatform.delegateFor(app: anyNamed('app')))
      .thenReturn(kMockMessagingPlatform);
  // ignore: invalid_use_of_protected_member
  when(
    kMockMessagingPlatform.setInitialValues(
      isAutoInitEnabled: anyNamed('isAutoInitEnabled'),
    ),
  ).thenReturn(kMockMessagingPlatform);
}

Future<T> neverEndingFuture<T>() async {
  // ignore: literal_only_boolean_expressions
  while (true) {
    await Future<T>.delayed(const Duration(minutes: 5));
  }
}

final List<MethodCall> methodCallLog = <MethodCall>[];

void setupFirebaseAnalyticsMocks([Callback? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  setupFirebaseCoreMocks();

  MethodChannelFirebaseAnalytics.channel
      .setMockMethodCallHandler((MethodCall methodCall) async {
    methodCallLog.add(methodCall);
    switch (methodCall.method) {
      default:
        return false;
    }
  });
}

class MockFirebaseMessaging extends Mock
    with MockPlatformInterfaceMixin
    implements FirebaseMessagingPlatform {
  MockFirebaseMessaging() {
    TestFirebaseMessagingPlatform();
  }

  @override
  bool get isAutoInitEnabled {
    return super.noSuchMethod(
      Invocation.getter(#isAutoInitEnabled),
      returnValue: true,
      returnValueForMissingStub: true,
    ) as bool;
  }

  @override
  FirebaseMessagingPlatform delegateFor({FirebaseApp? app}) {
    return super.noSuchMethod(
      Invocation.method(
        #delegateFor,
        <Object?>[],
        <Symbol, Object?>{#app: app},
      ),
      returnValue: TestFirebaseMessagingPlatform(),
      returnValueForMissingStub: TestFirebaseMessagingPlatform(),
    ) as FirebaseMessagingPlatform;
  }

  @override
  FirebaseMessagingPlatform setInitialValues({bool? isAutoInitEnabled}) {
    return super.noSuchMethod(
      Invocation.method(
        #setInitialValues,
        <Object?>[],
        <Symbol, Object?>{#isAutoInitEnabled: isAutoInitEnabled},
      ),
      returnValue: TestFirebaseMessagingPlatform(),
      returnValueForMissingStub: TestFirebaseMessagingPlatform(),
    ) as FirebaseMessagingPlatform;
  }

  @override
  Future<RemoteMessage?> getInitialMessage() {
    return super.noSuchMethod(
      Invocation.method(#getInitialMessage, <Object?>[]),
      returnValue: neverEndingFuture<RemoteMessage>(),
      returnValueForMissingStub: neverEndingFuture<RemoteMessage>(),
    ) as Future<RemoteMessage?>;
  }

  @override
  Future<void> deleteToken() {
    return super.noSuchMethod(
      Invocation.method(#deleteToken, <Object?>[]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Future<String?> getAPNSToken() {
    return super.noSuchMethod(
      Invocation.method(#getAPNSToken, <Object?>[]),
      returnValue: Future<String>.value(''),
      returnValueForMissingStub: Future<String>.value(''),
    ) as Future<String?>;
  }

  @override
  Future<String> getToken({String? vapidKey}) {
    return super.noSuchMethod(
      Invocation.method(
        #getToken,
        <Object?>[],
        <Symbol, Object?>{#vapidKey: vapidKey},
      ),
      returnValue: Future<String>.value(''),
      returnValueForMissingStub: Future<String>.value(''),
    ) as Future<String>;
  }

  @override
  Future<void> setAutoInitEnabled(bool? enabled) {
    return super.noSuchMethod(
      Invocation.method(#setAutoInitEnabled, <Object?>[enabled]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Stream<String> get onTokenRefresh {
    return super.noSuchMethod(
      Invocation.getter(#onTokenRefresh),
      returnValue: const Stream<String>.empty(),
      returnValueForMissingStub: const Stream<String>.empty(),
    ) as Stream<String>;
  }

  @override
  Future<NotificationSettings> requestPermission({
    bool? alert = true,
    bool? announcement = false,
    bool? badge = true,
    bool? carPlay = false,
    bool? criticalAlert = false,
    bool? provisional = false,
    bool? sound = true,
  }) {
    return super.noSuchMethod(
      Invocation.method(#requestPermission, <Object?>[], <Symbol, Object?>{
        #alert: alert,
        #announcement: announcement,
        #badge: badge,
        #carPlay: carPlay,
        #criticalAlert: criticalAlert,
        #provisional: provisional,
        #sound: sound
      }),
      returnValue: neverEndingFuture<NotificationSettings>(),
      returnValueForMissingStub: neverEndingFuture<NotificationSettings>(),
    ) as Future<NotificationSettings>;
  }

  @override
  Future<void> subscribeToTopic(String? topic) {
    return super.noSuchMethod(
      Invocation.method(#subscribeToTopic, <Object?>[topic]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Future<void> unsubscribeFromTopic(String? topic) {
    return super.noSuchMethod(
      Invocation.method(#unsubscribeFromTopic, <Object?>[topic]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(),
    ) as Future<void>;
  }
}

class TestFirebaseMessagingPlatform extends FirebaseMessagingPlatform {
  TestFirebaseMessagingPlatform() : super();
}

class MockCommunitiesClient extends Mock implements GraphQlClient {
  @override
  String get idToken => 'some-id-token';

  @override
  Future<http.Response> callRESTAPI({
    required String endpoint,
    required String method,
    Map<String, dynamic>? variables,
    Duration? timeout,
    Map<String, String>? customHeaders,
  }) async {
    if (endpoint.contains(loginEndpoint)) {
      return Future<http.Response>.value(
        http.Response(json.encode(loginResponseMock), 201),
      );
    }

    if (endpoint.contains(syncEndpoint)) {
      return Future<http.Response>.value(
        http.Response(json.encode(syncResponseMock), 201),
      );
    }

    if (endpoint.contains('joined_members')) {
      return Future<http.Response>.value(
        http.Response(json.encode(joinedMembersResponseMock), 201),
      );
    }

    if (endpoint.contains('/send/m.room.message/')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'event_id': 'test-event-id'}),
          201,
        ),
      );
    }

    // For fetching power levels
    if (endpoint.contains('m.room.power_levels') && method == 'GET') {
      return Future<http.Response>.value(
        http.Response(
          json.encode(powerLevelsResponseMock),
          201,
        ),
      );
    }

    // For promoting a user to a moderator
    if (endpoint.contains('/state/power_levels/') && method == 'PUT') {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{'event_id': 'test-event-id'}),
          201,
        ),
      );
    }

    if (endpoint.contains('/invite')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{}), 201),
      );
    }

    if (endpoint.contains('?membership=ban')) {
      return Future<http.Response>.value(
        http.Response(json.encode(bannedUserResponseMock), 201),
      );
    }

    if (endpoint.contains('/join')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'room_id': '!NvYSqaASzlfRpFCMtr:chat.savannahghi.org',
          }),
          201,
        ),
      );
    }

    if (endpoint.contains('/leave')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{}), 201),
      );
    }

    if (endpoint.contains('/kick')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{}), 201),
      );
    }

    if (endpoint.contains('/redact')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'event_id': '16741180035XJnPW:chat.savannahghi.org',
          }),
          201,
        ),
      );
    }

    if (endpoint.contains('/report/')) {
      return Future<http.Response>.value(
        http.Response(json.encode(<String, dynamic>{}), 201),
      );
    }

    if (endpoint.contains('/event_reports?room_id')) {
      return Future<http.Response>.value(
        http.Response(json.encode(flaggedMessagesMock), 201),
      );
    }

    if (endpoint.contains('/event_reports/')) {
      return Future<http.Response>.value(
        http.Response(json.encode(eventReportMock), 201),
      );
    }

    if (endpoint.contains('/createRoom')) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'room_id': '!NvYSqaASzlfRpFCMtr:chat.savannahghi.org',
          }),
          201,
        ),
      );
    }

    if (endpoint.contains('/media/v3/download/')) {
      final String dir = Directory.current.path;
      final String imgPath = '$dir/test/test_resources/test_file.png';
      final ByteData imgData = await rootBundle.load(imgPath);
      final Uint8List uint8list = imgData.buffer.asUint8List();

      return Future<http.Response>.value(
        http.Response(json.encode(uint8list), 201),
      );
    }

    if (endpoint.contains(searchMembersEndpoint)) {
      return Future<http.Response>.value(
        http.Response(
          json.encode(<String, dynamic>{
            'results': <Map<String, dynamic>>[loginResponseMock],
          }),
          201,
        ),
      );
    }

    return Future<http.Response>.value(
      http.Response(
        json.encode(<String, dynamic>{'data': <String, dynamic>{}}),
        200,
      ),
    );
  }

  @override
  Future<http.Response> uploadMedia({
    required String endpoint,
    required Map<String, String> uploadHeaders,
    Function(http.StreamedRequest request)? updateSink,
    Duration? timeout,
  }) {
    return Future<http.Response>.value(
      http.Response(
        json.encode(<String, dynamic>{
          'content_uri': 'mxc://chat.savannahghi.org/some-media'
        }),
        200,
      ),
    );
  }

  @override
  Map<String, dynamic> toMap(http.Response? response) {
    final dynamic res = json.decode(response!.body);

    if (res is Map) return res as Map<String, dynamic>;
    // ignore: avoid_dynamic_calls
    return res[0] as Map<String, dynamic>;
  }
}

class ImagePickerMock extends Mock implements ImagePicker {
  @override
  Future<PickedFile?> getImage({
    required ImageSource source,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) {
    final String dir = Directory.current.path;
    final String imgPath = '$dir/test/tests_resources/test_file.png';

    final PickedFile selectedImage = PickedFile(imgPath);

    return Future<PickedFile>.value(selectedImage);
  }
}
