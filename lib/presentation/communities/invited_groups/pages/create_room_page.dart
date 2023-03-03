import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/create_room_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';

class CreateRoomPage extends StatefulWidget {
  const CreateRoomPage({super.key});

  @override
  State<CreateRoomPage> createState() => _CreateRoomPageState();
}

class _CreateRoomPageState extends State<CreateRoomPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController topicController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    topicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(createARoom),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          const Text(enterRoomDetails),
          const SizedBox(height: 20),
          TextField(
            key: nameInputKey,
            decoration: InputDecoration(
              labelText: name,
              hintText: enterName,
              contentPadding: const EdgeInsets.only(left: 20, bottom: 32),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            controller: nameController,
          ),
          const SizedBox(height: 20),
          TextField(
            key: topicInputKey,
            decoration: InputDecoration(
              labelText: topic,
              hintText: enterTopic,
              contentPadding: const EdgeInsets.only(left: 20, bottom: 32),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            controller: topicController,
            maxLines: 5,
          ),
          const SizedBox(height: 30),
          StoreConnector<AppState, CreateRoomViewModel>(
            converter: (Store<AppState> store) =>
                CreateRoomViewModel.fromStore(store),
            builder: (BuildContext context, CreateRoomViewModel vm) {
              if (vm.isCreatingRoom) {
                return const Center(child: CircularProgressIndicator());
              }
              return TextButton(
                key: createRoomKey,
                onPressed: () async {
                  StoreProvider.dispatch<AppState>(
                    context,
                    CreateRoomAction(
                      roomName: nameController.text,
                      topic: topicController.text,
                      onSuccess: (String roomID) {
                        if (roomID.isNotEmpty) {
                          Navigator.of(context).pop(true);
                        }
                      },
                      client: AppWrapperBase.of(context)!.graphQLClient,
                    ),
                  );
                },
                child: const Text(createRoom),
              );
            },
          ),
        ],
      ),
    );
  }
}
