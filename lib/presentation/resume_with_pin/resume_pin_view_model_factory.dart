import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:pro_health_360/application/redux/actions/resume_with_pin_action/resume_with_pin_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/presentation/resume_with_pin/resume_pin_connector.dart';
import 'package:pro_health_360/presentation/resume_with_pin/resume_pin_view_model.dart';

class ResumePinFactory extends VmFactory<AppState, ResumePinConnector> {
  final IGraphQlClient client;
  final String endpoint;

  ResumePinFactory({required this.client, required this.endpoint});

  @override
  ResumePinViewModel fromStore() {
    final String username =
        state.clientState?.clientProfile?.user?.username ?? '';
    final bool isLoading = state.wait?.isWaitingFor(resumeWithPinFlag) ?? false;

    return ResumePinViewModel(
      username: username,
      isLoading: isLoading,
      onSubmit: (String value) {
        dispatch(
          ResumeWithPinAction(
            pin: value,
            httpClient: client,
            endpoint: endpoint,
          ),
        );
      },
    );
  }
}
