import 'dart:convert';
import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/process_and_upload_media_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

import '../../../../../mocks.dart';

void main() {
  group('ProcessAndUploadMediaAction', () {
    late StoreTester<AppState> storeTester;
    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      TestWidgetsFlutterBinding.ensureInitialized();
    });

    test('should should process and upload media successfully', () async {
      bool uploaded = false;

      final String dir = Directory.current.path;
      final String imgPath = '$dir/test/tests_resources/test_file.png';

      storeTester.dispatch(
        ProcessAndUploadMediaAction(
          onSuccess: () => uploaded = true,
          image: File(imgPath),
          communitiesClient: MockCommunitiesClient(),
          roomID: 'test-room-id',
        ),
      );

      await storeTester.waitUntil(ProcessAndUploadMediaAction);
      expect(uploaded, isTrue);
    });

    test('should fail to process and upload media successfully', () async {
      bool uploaded = false;
      bool error = false;

      final String dir = Directory.current.path;
      final String imgPath = '$dir/test/tests_resources/test_file.png';

      storeTester.dispatch(
        ProcessAndUploadMediaAction(
          onSuccess: () => uploaded = true,
          image: File(imgPath),
          communitiesClient: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(jsonEncode(<String, dynamic>{'errcode': false}), 200),
          ),
          roomID: 'test-room-id',
          onError: () => error = true,
        ),
      );

      await storeTester.waitUntil(ProcessAndUploadMediaAction);
      expect(uploaded, isFalse);
      expect(error, isTrue);
    });
  });
}
