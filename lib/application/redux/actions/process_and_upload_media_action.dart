import 'dart:convert';
import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
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
  });

  final File image;
  final IGraphQlClient communitiesClient;
  final String? mediaName;
  final String roomID;

  final Function()? onSuccess;

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
    final String? accessToken = store.state.chatState?.userProfile?.accessToken;

    final Response response = await SimpleCall.uploadMedia(
      graphClient: communitiesClient,
      image: image,
      mediaName: mediaName!,
      idToken: accessToken!,
    );

    // final Response response = await communitiesClient.uploadMediaFile(
    //   image: image,
    //   mediaName: mediaName ?? UNKNOWN,
    //   uploadEndpoint: uploadMediaEndpoint,
    // );

    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;

    if (data['errcode'] != null) {
      return null;
    }

    final String? mxcUri = data['content_uri'] as String?;

    if (mxcUri != null) {
      final Map<String, dynamic> mediaResult = await ChatAPI.sendMediaMessage(
        client: communitiesClient,
        roomID: roomID,
        messageText: 'A good looking image',
        imageMXCUrl: mxcUri,
      );

      if (mediaResult.containsKey('event_id')) {
        if (kDebugMode) {
          print(mediaResult);
        }
        onSuccess?.call();
        return state;
      }
    } else {
      throw 'Failed to upload image';
    }

    return null;
  }
}
