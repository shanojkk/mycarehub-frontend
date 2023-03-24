import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/communities_utils.dart';
import 'package:sghi_core/communities/core/chat_api.dart';
import 'package:sghi_core/communities/models/strings.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.avatarURI,
    required this.displayName,
    this.aviSize = 50,
  });

  final String? avatarURI;
  final String? displayName;
  final double aviSize;

  @override
  Widget build(BuildContext context) {
    final bool emptyAvi = avatarURI == null ||
        (avatarURI?.isEmpty ?? true) ||
        avatarURI == UNKNOWN;

    final String aviMediaURL =
        ChatAPI.getMediaURL(mediaUrl: avatarURI ?? '') ?? '';

    if (!emptyAvi) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(aviSize),
        child: CachedNetworkImage(
          height: aviSize,
          width: aviSize,
          fit: BoxFit.cover,
          imageUrl: aviMediaURL,
          progressIndicatorBuilder: (
            BuildContext context,
            String url,
            DownloadProgress progress,
          ) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: const CircularProgressIndicator(strokeWidth: 1),
              ),
            );
          },
        ),
      );
    } else {
      return Container(
        height: aviSize,
        width: aviSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.purple.withOpacity(0.2),
        ),
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            getInitials(displayName ?? 'No name').toUpperCase(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      );
    }
  }
}
