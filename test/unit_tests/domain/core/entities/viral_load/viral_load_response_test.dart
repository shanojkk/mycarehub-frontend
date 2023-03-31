import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/domain/core/entities/viral_load/viral_load_code.dart';
import 'package:pro_health_360/domain/core/entities/viral_load/viral_load_edges.dart';
import 'package:pro_health_360/domain/core/entities/viral_load/viral_load_node.dart';
import 'package:pro_health_360/domain/core/entities/viral_load/viral_load_node_data.dart';
import 'package:pro_health_360/domain/core/entities/viral_load/viral_load_response.dart';

import '../../../../../mock_data.dart';

void main() {
  group('ViralLoadResponse', () {
    test('expects to convert ViralLoadResponse from json', () {
      expect(
        ViralLoadResponse.initial().copyWith(
          data: ViralLoadEdges.initial().copyWith(
            edges: <ViralLoadNode>[
              ViralLoadNode.initial().copyWith(
                node: ViralLoadNodeData.initial()
                    .copyWith(code: ViralLoadCode.initial()),
              ),
            ],
          ),
        ),
        isA<ViralLoadResponse>(),
      );
      final ViralLoadResponse viralLoadDataMock =
          ViralLoadResponse.fromJson(mockViralLoadDataResponse);
      expect(viralLoadDataMock, isA<ViralLoadResponse>());
    });
  });
}
