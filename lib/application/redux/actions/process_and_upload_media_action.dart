import 'dart:convert';
import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/flutter_graphql_client/flutter_graphql_client.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class ProcessAndUploadMediaAction extends ReduxAction<AppState> {
  ProcessAndUploadMediaAction({
    required this.image,
    required this.communitiesClient,
    required this.roomID,
    this.mediaName = 'media-default',
    this.onSuccess,
    this.onError,
  });

  final File image;
  final IGraphQlClient communitiesClient;
  final String? mediaName;
  final String roomID;

  final Function()? onSuccess;
  final Function(String msg)? onError;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(uploadMediaFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(uploadMediaFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String? accessToken = store.state.clientState?.communityToken;

    final Response response = await SimpleCall.uploadMedia(
      graphClient: communitiesClient,
      image: image,
      mediaName: mediaName!,
      idToken: accessToken!,
    );

    final ProcessedResponse uploadResponse = processHttpResponse(response);
    if (uploadResponse.ok) {
      final Map<String, dynamic> data =
          json.decode(uploadResponse.response.body) as Map<String, dynamic>;

      final String? mxcUri = data['content_uri'] as String?;
      if (mxcUri != null) {
        final Response mediaResult = await ChatAPI.sendMediaMessage(
          client: communitiesClient,
          roomID: roomID,
          messageText: 'A good looking image',
          imageMXCUrl: mxcUri,
        );

        final ProcessedResponse mediaResponse =
            processHttpResponse(mediaResult);

        if (mediaResponse.ok) {
          onSuccess?.call();
          return state;
        } else {
          onError?.call(
            'Failed to send your image to the group. Please try again later',
          );
          return null;
        }
      }
    } else {
      this.onError?.call('Failed to upload your image. Please try again later');
      return null;
    }

    return null;
  }
}
