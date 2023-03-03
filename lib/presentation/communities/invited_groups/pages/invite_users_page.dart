import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/invite_users_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/search_group_members_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/communities/communities_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/widgets/user_list_item.dart';

import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/user.dart';

class InviteUsersPage extends StatelessWidget {
  InviteUsersPage({super.key, required this.room});

  final Room room;

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: const Center(child: Text(inviteMembers)),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        shrinkWrap: true,
        children: <Widget>[
          const Text(searchMembersDescription),

          const SizedBox(height: 20),

          /// Search input
          TextField(
            key: searchMembersInputKey,
            decoration: InputDecoration(
              labelText: searchUsers,
              hintText: searchUsers,
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
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.purple,
              ),
            ),
            controller: searchController,
            onChanged: (String value) async {
              if (value.isNotEmpty && value.length >= 3) {
                StoreProvider.dispatch<AppState>(
                  context,
                  SearchMembersAction(
                    searchParam: value,
                    client: AppWrapperBase.of(context)!.graphQLClient,
                  ),
                );
              }
            },
          ),

          const SizedBox(height: 20),

          ///
          /// List search results
          StoreConnector<AppState, SearchPageViewModel>(
            converter: (Store<AppState> store) {
              return SearchPageViewModel.fromStore(store);
            },
            builder: (BuildContext context, SearchPageViewModel vm) {
              final List<User>? users = vm.searchMemberResults;

              if (vm.searchMemberResults?.isEmpty ?? true) {
                return const Center(child: Text(noMembers));
              }

              if (vm.wait?.isWaitingFor(searchRoomMembersFlag) ?? false) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: users?.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final User currentUser = users![index];

                  return UserListItem(
                    key: Key(currentUser.userID ?? ''),
                    name: currentUser.displayName ?? 'No Name',
                    userID: currentUser.userID ?? '',
                    roomID: '',
                    onTap: () async {
                      StoreProvider.dispatch<AppState>(
                        context,
                        InviteUserAction(
                          roomID: room.roomID!,
                          userID: currentUser.userID!,
                          client: AppWrapperBase.of(context)!.graphQLClient,
                          onSuccess: () {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${currentUser.displayName} has been '
                                    'invited successfully',
                                  ),
                                ),
                              );

                            Navigator.of(context).pop();
                          },
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
