import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_health_360/application/redux/actions/communities/send_message_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/widgets/image_attachment_widget.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/shared_themes/spaces.dart';

class SendMessageInput extends StatelessWidget {
  const SendMessageInput({super.key, required this.roomID});

  final String roomID;

  @override
  Widget build(BuildContext context) {
    final TextEditingController msgCtrl = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 20),
      child: Row(
        children: <Widget>[
          ImageAttachmentWidget(roomID: roomID, picker: ImagePicker()),
          verySmallHorizontalSizedBox,
          Flexible(
            child: TextField(
              key: messageInputKey,
              decoration: InputDecoration(
                hintText: sendMessageString,
                contentPadding: const EdgeInsets.only(left: 20, bottom: 32),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                suffixIcon: StoreConnector<AppState, MessageInputViewModel>(
                  converter: (Store<AppState> store) =>
                      MessageInputViewModel.fromStore(store),
                  builder: (BuildContext context, MessageInputViewModel vm) {
                    if (vm.isSending) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(strokeWidth: 1),
                      );
                    }
                    return IconButton(
                      key: sendMessageIconKey,
                      icon: const Icon(Icons.send),
                      onPressed: () async {
                        /// Add send message logic here
                        if (msgCtrl.text.isNotEmpty) {
                          StoreProvider.dispatch<AppState>(
                            context,
                            SendMessageAction(
                              roomID: roomID,
                              onSuccess: (String roomID) {
                                if (roomID.isNotEmpty) {
                                  msgCtrl.clear();
                                } else {
                                  // TODO(abiud): Show an error snackbar here
                                }
                              },
                              message: msgCtrl.text,
                              client: AppWrapperBase.of(context)!
                                  .communitiesClient!,
                            ),
                          );
                        }
                      },
                      color: Theme.of(context).primaryColor,
                    );
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              controller: msgCtrl,
              onSubmitted: (String value) {
                /// Add send message logic here
                if (msgCtrl.text.isNotEmpty) {
                  StoreProvider.dispatch<AppState>(
                    context,
                    SendMessageAction(
                      roomID: roomID,
                      onSuccess: (String roomID) {
                        if (roomID.isNotEmpty) {
                          msgCtrl.clear();
                        } else {
                          // TODO(abiud): Show an error snackbar here
                        }
                      },
                      message: msgCtrl.text,
                      client: AppWrapperBase.of(context)!.communitiesClient!,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
