// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/onboarding_state.dart';
import 'package:pro_health_360/domain/core/entities/terms_and_conditions/terms_and_conditions.dart';
import '../../mock_data.dart';

void main() {
  group('OnboardingState', () {
    test('fromJson works correctly', () {
      final OnboardingState fromJson =
          OnboardingState.fromJson(mockOnboardingState);

      final OnboardingState actual = OnboardingState(
        termsAndConditions: TermsAndConditions.initial(),
        securityQuestions: <SecurityQuestion>[SecurityQuestion.initial()],
        securityQuestionResponses: <SecurityQuestionResponse>[
          SecurityQuestionResponse.initial(),
        ],
      );

      expect(fromJson, actual);
    });
  });
}
