import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/process_and_upload_media_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';

class PreviewUploadImage extends StatelessWidget {
  const PreviewUploadImage({
    super.key,
    required this.image,
    required this.roomID,
  });

  // The image to preview
  final File image;

  // The roomID of the room in which the image is to be uploaded to
  final String roomID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: const Center(child: Text(uploadImageString)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            mediumVerticalSizedBox,
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: FileImage(image),
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
            mediumVerticalSizedBox,
            StoreConnector<AppState, ImageUploadViewModel>(
              converter: (Store<AppState> store) =>
                  ImageUploadViewModel.fromStore(store),
              builder: (BuildContext context, ImageUploadViewModel vm) {
                if (vm.uploadingImage) {
                  return const SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 1),
                    ),
                  );
                }
                return SizedBox(
                  height: 48,
                  child: MyAfyaHubPrimaryButton(
                    onPressed: () {
                      StoreProvider.dispatch<AppState>(
                        context,
                        ProcessAndUploadMediaAction(
                          image: image,
                          communitiesClient:
                              AppWrapperBase.of(context)!.communitiesClient!,
                          roomID: roomID,
                          onSuccess: () => Navigator.of(context).pop(),
                        ),
                      );
                    },
                    text: sendImageString,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
