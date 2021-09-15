import 'dart:convert';

import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/domain/core/entities/core/result.dart';
import 'package:myafyahub/domain/core/entities/core/suggestion.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

import '../../mocks.dart';

void main() {
  group('Utils', () {
    test('should test applyPayerBackground method', () {
      expect(applyPayerPrimaryColor('Other'), AppColors.britamPrimaryColor);
      expect(applyPayerPrimaryColor('Jubilee'), AppColors.jubileePrimaryColor);
      expect(applyPayerPrimaryColor('APA'), AppColors.apaPrimaryColor);
      expect(applyPayerPrimaryColor('Resolution'),
          AppColors.resolutionPrimaryColor);
    });
  });

  test('should return getSentryDSN per appContext', () {
    expect(getSentryDSN(testAppContexts), isA<String>());
    expect(getSentryDSN(testAppContexts), isNotNull);
    expect(getSentryDSN(prodAppContexts), isA<String>());
    expect(getSentryDSN(prodAppContexts), isNotNull);
  });

  test('should sentencecase username', () {
    expect(sentenceCaseUserName(firstName: 'ule', lastName: 'makmende'),
        'Ule Makmende');
    expect(sentenceCaseUserName(firstName: 'u', lastName: 'm'), 'u m');
    expect(sentenceCaseUserName(firstName: '', lastName: ''), ' ');
  });

  test('should getWidthOfSymmetricalWidgetsSmallDevices', () {
    expect(getWidthOfSymmetricalWidgetsOnLargeDevice(), 190.0);
  });

  test('should get empty globalSearchResults ', () {
    final List<Result> results = globalSearchResults(searchParam: '');
    expect(results.isEmpty, true);
  });

  test('should get globalSearchResults ', () {
    final List<Result> results = globalSearchResults(searchParam: libraryTitle);
    expect(results.isNotEmpty, true);
  });

  test('should get globalSearchResults with alias', () {
    final List<Result> results = globalSearchResults(searchParam: 'lib');
    expect(results.isNotEmpty, true);
  });

  test('should get  globalSearchSuggestion when search tem is empty', () {
    final List<Suggestion> results = globalSearchSuggestion(searchParam: '');
    expect(results.isEmpty, false);
  });

  test('should get  globalSearchSuggestion', () {
    final List<Suggestion> results =
        globalSearchSuggestion(searchParam: libraryTitle);
    expect(results.isNotEmpty, true);
  });

  test('should get  globalSearchSuggestion with alias', () {
    final List<Suggestion> results = globalSearchSuggestion(searchParam: 'lib');
    expect(results.isNotEmpty, true);
  });

  test('should return false on onWillPopCallback call', () async {
    final bool res = await onWillPopCallback();
    expect(res, false);
  });

  test('should return an unprotected route', () async {
    expect(unProtectedRoutes[0], BWRoutes.landing);
  });

  test('should throw message no_user_account_found', () {
    final Response expectedResponse =
        Response(json.encode(<String, dynamic>{'code': 7}), 400);
    final MockBuildContext context = MockBuildContext();

    expect(
        () => processHttpResponse(expectedResponse, context), throwsException);
  });

  test('should parser expiredAt', () {
    expect(DateTimeParser().parsedExpireAt(int.parse('3600')), isA<String>());
    expect(
        DateTimeParser().parsedExpireAt(int.parse('3600')).contains('T'), true);

    expect(
        DateTimeParser(
          useCustomDateTime: true,
          customDateTime: DateTime.parse('2021-05-18 13:27:00'),
        ).parsedExpireAt(int.parse('3600')),
        isA<String>());
  });
}
