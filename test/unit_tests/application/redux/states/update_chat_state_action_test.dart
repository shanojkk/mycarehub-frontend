import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_chat_state_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/user.dart';

import '../../../../mock_data.dart';

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
    });
  });
}
