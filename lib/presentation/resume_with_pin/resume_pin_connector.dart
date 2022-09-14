import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:pro_health_360/application/redux/actions/logout_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/presentation/resume_with_pin/resume_pin_view_model.dart';
import 'package:pro_health_360/presentation/resume_with_pin/resume_pin_view_model_factory.dart';
import 'package:pro_health_360/presentation/resume_with_pin/resume_with_pin_page.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class ResumePinConnector extends StatelessWidget {
  const ResumePinConnector({super.key});

  @override
  Widget build(BuildContext context) {
    final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;
    final String endpoint =
        AppWrapperBase.of(context)!.customContext!.loginByPhoneEndpoint;

    return StoreConnector<AppState, ResumePinViewModel>(
      vm: () => ResumePinFactory(client: client, endpoint: endpoint),
      builder: (BuildContext context, ResumePinViewModel vm) {
        return ResumeWithPinPage(
          username: vm.username,
          onSubmit: vm.onSubmit,
          isLoading: vm.isLoading,
          logoutCallback: () {
            StoreProvider.dispatch(
              context,
              LogoutAction(
                navigationCallback: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.phoneLogin,
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
