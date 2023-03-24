import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sghi_core/communities/core/utils.dart';

class ImageAttachmentWidget extends StatelessWidget {
  const ImageAttachmentWidget({super.key, required this.roomID});

  final String roomID;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        key: addAttachmentIconKey,
        icon: const Icon(Icons.attach_file, size: 28),
        onPressed: () async {
          final File? img = await selectPhoto(picker: ImagePicker());

          if (img != null) {
            Navigator.of(context).pushNamed(
              AppRoutes.previewUploadMediaRoute,
              arguments: <String, dynamic>{'img': img, 'roomID': roomID},
            );
          }
        },
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
