import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

class BottomNavViewModel {
  BottomNavViewModel({required this.currentIndex});

  final int currentIndex;

  static BottomNavViewModel fromStore(Store<AppState> store) {
    return BottomNavViewModel(
        currentIndex:
            store.state.miscState?.bottomNavObj?.currentBottomNavIndex ?? 0);
  }
}
