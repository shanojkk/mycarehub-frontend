import 'package:pro_health_360/application/redux/actions/update_program_state_action.dart';
import 'package:pro_health_360/domain/core/entities/login/program.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ListUserProgramsAction extends ReduxAction<AppState> {
  ListUserProgramsAction({required this.client});

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchProgramsFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchProgramsFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final String? userID = state.clientState!.clientProfile!.user!.userId;

    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': userID,
      'flavour': Flavour.consumer.name
    };

    /// fetch the data from the api
    final Response response = await client.query(
      listUserProgramsQuery,
      variables,
    );
    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> payLoad = client.toMap(response);
      final String? error = parseError(payLoad);

      if (error != null) {
        Sentry.captureException(UserException(error));
        throw UserException(getErrorMessage('listing user programs'));
      }

      final List<Program> programs = <Program>[];
      final Map<String, dynamic> data = payLoad['data'] as Map<String, dynamic>;

      final Map<String, dynamic> programsMap =
          data['listUserPrograms'] as Map<String, dynamic>;

      final List<dynamic> programsData =
          programsMap['programs'] as List<dynamic>;

      for (final dynamic programItem in programsData) {
        programs.add(Program.fromJson(programItem as Map<String, dynamic>));
      }

      dispatch(UpdateProgramStateAction(programs: programs));
      if (programs.length < 2) {
        dispatch(UpdateProgramStateAction(currentProgram: programs.first));
      }
    } else {
      throw UserException(processedResponse.message);
    }

    return state;
  }
}
