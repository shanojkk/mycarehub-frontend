import 'dart:typed_data';
import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_chat_state_action.dart';

import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class FetchMediaAction extends ReduxAction<AppState> {
  FetchMediaAction({required this.mediaUri, required this.client});

  final String? mediaUri;
  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(mediaUri));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(mediaUri));
  }

  @override
  Future<AppState?> reduce() async {
    final Uint8List? bytes = await ChatAPI.fetchMedia(
      mediaUri: mediaUri,
      client: client,
    );

    if (bytes != null) {
      dispatch(
        UpdateChatStateAction(
          image: <String, Uint8List?>{
            mediaUri!: bytes,
          },
        ),
      );
      return state;
    }

    return null;
  }
}
