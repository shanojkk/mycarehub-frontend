import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_chat_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/user.dart';

import '../../../../mocks.dart';

void main() {
  group('UpdateChatStateAction', () {
    late StoreTester<AppState> storeTester;
    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    test('should work correctly', () async {
      expect(storeTester.state.chatState?.groupInfoMembers?.isEmpty, true);

      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: User.fromJson(loginResponseMock),
          joinedRooms: <Room>[Room.fromJson(roomMock)],
        ),
      );

      await storeTester.waitUntil(UpdateChatStateAction);
      expect(
        storeTester.state.chatState?.userProfile?.userID,
        loginResponseMock['user_id'],
      );
      expect(storeTester.state.chatState?.images?.length, 0);
    });

    test('adds image correctly', () async {
      expect(storeTester.state.chatState?.images?.isEmpty, true);

      final String dir = Directory.current.path;
      final String imgPath = '$dir/test/tests_resources/test_file.png';
      final ByteData imgData = await rootBundle.load(imgPath);
      final Uint8List uint8list = imgData.buffer.asUint8List();

      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: User.fromJson(loginResponseMock),
          image: <String, Uint8List?>{'1': uint8list},
        ),
      );

      await storeTester.waitUntil(UpdateChatStateAction);
      expect(storeTester.state.chatState?.images?.length, 1);

      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: User.fromJson(loginResponseMock),
          image: <String, Uint8List?>{'2': uint8list},
        ),
      );
      await storeTester.waitUntil(UpdateChatStateAction);
      expect(storeTester.state.chatState?.images?.length, 2);

      // Replaces image
      storeTester.dispatch(
        UpdateChatStateAction(
          userProfile: User.fromJson(loginResponseMock),
          image: <String, Uint8List?>{'1': uint8list},
        ),
      );
      await storeTester.waitUntil(UpdateChatStateAction);
      expect(storeTester.state.chatState?.images?.length, 2);
    });
  });
}
