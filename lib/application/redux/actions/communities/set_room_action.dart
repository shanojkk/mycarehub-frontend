import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

class SetRoom extends ReduxAction<AppState> {
  SetRoom({required this.roomID});

  final String? roomID;

  @override
  Future<AppState?> reduce() async {
    return state.copyWith.chatState?.call(selectedRoom: roomID);
  }
}
