// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/my_afya_user_profile.dart';

class ContactViewModel extends Vm {
  ContactViewModel({
    required this.primaryEmail,
    required this.primaryPhone,
    required this.wait,
  });

  final EmailAddress? primaryEmail;
  final PhoneNumber primaryPhone;
  final Wait wait;

  static ContactViewModel fromStore(Store<AppState> store) {
    final MyAfyaUserProfile profile =
        store.state.clientProfileState!.myAfyaUserProfile!;
    return ContactViewModel(
      primaryEmail: profile.primaryEmailAddress,
      primaryPhone: profile.primaryPhoneNumber!,
      wait: store.state.wait!,
    );
  }
}
