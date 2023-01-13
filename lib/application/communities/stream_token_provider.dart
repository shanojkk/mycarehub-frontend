import 'dart:convert';

import 'package:http/http.dart';
import 'package:pro_health_360/domain/core/entities/core/get_stream_token.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';

class StreamTokenProvider {
  final IGraphQlClient client;
  final String endpoint;
  final void Function(String)? saveToken;

  StreamTokenProvider({
    required this.client,
    required this.endpoint,
    this.saveToken,
  });

  Future<String> tokenProvider(String userId) async {
    final Response httpResponse = await client.callRESTAPI(
      endpoint: endpoint,
      method: httpPOST,
      variables: <String, String>{'userID': userId},
    );

    final ProcessedResponse processedResponse =
        processHttpResponse(httpResponse);

    final Map<String, dynamic> responseBody =
        jsonDecode(httpResponse.body) as Map<String, dynamic>;

    if (processedResponse.ok) {
      final GetStreamToken result = GetStreamToken.fromJson(responseBody);
      saveToken?.call(result.getStreamToken ?? '');

      return result.getStreamToken ?? '';
    }

    return '';
  }
}
