import 'dart:typed_data';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/fetch_media_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';

class MediaItem extends StatefulWidget {
  const MediaItem({
    super.key,
    required this.isUserSent,
    required this.sender,
    required this.timestamp,
    required this.url,
  });

  final bool isUserSent;
  final Widget sender;
  final String? url;
  final String timestamp;

  @override
  State<MediaItem> createState() => _MediaItemState();
}

class _MediaItemState extends State<MediaItem> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      StoreProvider.dispatch<AppState>(
        context,
        FetchMediaAction(
          mediaUri: widget.url,
          client: AppWrapperBase.of(context)!.graphQLClient,
        ),
      );
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(content: Text(optionsWillBeAvailable)),
          );
      },
      child: Column(
        crossAxisAlignment: widget.isUserSent
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15),
            margin: EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: widget.isUserSent ? 50 : 10,
              right: widget.isUserSent ? 10 : 50,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft:
                    widget.isUserSent ? const Radius.circular(10) : Radius.zero,
                topRight:
                    widget.isUserSent ? Radius.zero : const Radius.circular(10),
                bottomLeft: const Radius.circular(10),
                bottomRight: const Radius.circular(10),
              ),
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(widget.isUserSent ? .5 : .2),
            ),
            child: Column(
              crossAxisAlignment: widget.isUserSent
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: <Widget>[
                widget.sender,
                const SizedBox(height: 5),
                // Add image here

                StoreConnector<AppState, MediaItemViewModel>(
                  converter: (Store<AppState> store) {
                    return MediaItemViewModel.fromStore(store);
                  },
                  builder: (BuildContext context, MediaItemViewModel vm) {
                    if (vm.wait?.isWaitingFor(widget.url) ?? false) {
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: const CircularProgressIndicator(),
                        ),
                      );
                    }

                    final List<Map<String, Uint8List?>?>? images = vm.images;

                    final Map<String, Uint8List?>? imageByteMap =
                        images?.firstWhere(
                      (Map<String, Uint8List?>? element) {
                        return element?.keys.first == widget.url;
                      },
                      orElse: () {
                        return null;
                      },
                    );

                    if (imageByteMap?.isNotEmpty ?? false) {
                      final Uint8List? bodyBytes = imageByteMap![widget.url];

                      if (bodyBytes != null && bodyBytes.isNotEmpty) {
                        return Image.memory(bodyBytes);
                      }

                      return const SizedBox();
                    }
                    return const SizedBox();
                  },
                ),

                const SizedBox(height: 10),
                Text(
                  widget.timestamp,
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
