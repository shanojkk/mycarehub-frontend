// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/communities/community_list_page.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;
import '../../../test_helpers.dart';
import 'community_list_page_test.mocks.dart';

@GenerateMocks(<Type>[
  stream.StreamChatClient,
  stream.ClientState,
  stream.Logger,
  stream.Channel,
  stream.ChannelState,
  stream.ChannelClientState,
])
void main() {
  group('CommunityListItem', () {
    late Store<AppState> store;

    late MockStreamChatClient client;
    late MockClientState clientState;
    late MockLogger logger;
    late MockChannel channel;
    late MockChannelClientState? channelClientState;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());

      client = MockStreamChatClient();
      when(client.connectUser(any, any)).thenAnswer(
        (_) => Future<stream.OwnUser>.value(stream.OwnUser(id: '')),
      );

      clientState = MockClientState();
      logger = MockLogger();
      channel = MockChannel();
      channelClientState = MockChannelClientState();

      final stream.OwnUser user = stream.OwnUser(id: 'user-id');

      when(client.state).thenReturn(clientState);
      when(clientState.currentUser).thenReturn(user);
      when(channel.initialized).thenAnswer((_) => Future<bool>.value(true));
      when(channel.state).thenReturn(channelClientState);
      when(client.logger).thenReturn(logger);
      when(client.on(any, any, any, any))
          .thenAnswer((_) => const Stream<stream.Event>.empty());
      when(client.wsConnectionStatus)
          .thenReturn(stream.ConnectionStatus.connected);
      when(client.wsConnectionStatusStream).thenAnswer(
        (_) => Stream<stream.ConnectionStatus>.value(
          stream.ConnectionStatus.connected,
        ),
      );
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: stream.StreamChat(
          client: client,
          child: stream.StreamChannel(
            channel: channel,
            child: const CommunityListViewPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(stream.ChannelListView), findsOneWidget);
    });
  });
}
