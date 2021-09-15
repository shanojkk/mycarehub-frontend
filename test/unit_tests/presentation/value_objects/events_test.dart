import 'package:flutter_test/flutter_test.dart';

import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/domain/core/value_objects/events.dart';

void main() {
  test('consumer_navigated_to_select_assistant', () {
    final String appContext = demoAppContexts.first.toString();
    final String result = hasNavigatedToSelectAssistantPageEvent(appContext);

    expect(result, equals('consumer_navigated_to_chose_asst_$appContext'));
  });

  test('consumer_tapped_on_an_assistant_', () {
    final String appContext = demoAppContexts.first.toString();
    final String result = hasTappedOnAnAssistantEvent(appContext);
    expect(result, equals('consumer_selected_assistant_$appContext'));
  });

  test('consumer_navigated_to_select_range_', () {
    final String appContext = demoAppContexts.first.toString();

    final String result = hasNavigatedToSelectRangePage(appContext);

    expect(result, equals('consumer_navigated_to_select_range_$appContext'));
  });
  test('consumer_set_range_', () {
    final String appContext = demoAppContexts.first.toString();

    final String result = hasSuccessfullySetRangeEvent(appContext);

    expect(result, equals('consumer_set_range_$appContext'));
  });

  test('consumer_tapped_on_show_more_', () {
    final String appContext = demoAppContexts.first.toString();

    final String result = hasTappedOnShowMoreEvent(appContext);

    expect(result, equals('consumer_tapped_on_show_more_$appContext'));
  });

  test('consumer_tapped_on_see_details_', () {
    final String appContext = demoAppContexts.first.toString();

    final String result = hasTappedOnSeeDetailsEvent(appContext);

    expect(result, equals('consumer_tapped_on_see_details_$appContext'));
  });

  test('consumer_set_limits_', () {
    final String appContext = demoAppContexts.first.toString();

    final String result = hasSuccessfullySetLimitsEvent(appContext);

    expect(result, equals('consumer_set_limits_$appContext'));
  });
  test('consumer_navigated_to_kyc_details_', () {
    final String appContext = demoAppContexts.first.toString();

    final String result = hasNavigatedToKYCDetailsPageEvent(appContext);

    expect(result, equals('consumer_navigated_to_kyc_details_$appContext'));
  });

  test('consumer_navigated_to_payment page_', () {
    final String appContext = demoAppContexts.first.toString();

    final String result = hasNavigatedToPaymentPageEvent(appContext);

    expect(result, equals('consumer_navigated_to_payment_page_$appContext'));
  });
  test('consumer_navigated_to_appreciation_', () {
    final String appContext = demoAppContexts.first.toString();

    final String result = hasNavigatedToAppreciationPageEvent(appContext);

    expect(result, equals('consumer_navigated_to_appreciation_$appContext'));
  });

  test('consumer_navigated_to_parent_dependant_', () {
    final String appContext = demoAppContexts.first.toString();

    final String result = hasNavigatedToParentDependantEvent(appContext);

    expect(
        result, equals('consumer_navigated_to_parent_dependant_$appContext'));
  });

  test('consumer_navigated_to_child_dependant_', () {
    final String appContext = demoAppContexts.first.toString();

    final String result = hasNavigatedToChildDependantEvent(appContext);

    expect(result, equals('consumer_navigated_to_child_dependant_$appContext'));
  });

  test('consumer_navigated_to_spouse_dependant_', () {
    final String appContext = demoAppContexts.first.toString();

    final String result = hasNavigatedToSpouseDependantEvent(appContext);

    expect(
        result, equals('consumer_navigated_to_spouse_dependant_$appContext'));
  });

  test('consumer_nav_to_contact_veri_', () {
    final String appContext = demoAppContexts.first.toString();

    final String result =
        hasNavigatedToContactVerificationPageEvent(appContext);

    expect(result, equals('consumer_nav_to_contact_veri_$appContext'));
  });

  test('consumer_success_contact_veri_', () {
    final String appContext = demoAppContexts.first.toString();

    final String result = hasSuccessfullyVerifiedContactEvent(appContext);

    expect(result, equals('consumer_success_contact_veri_$appContext'));
  });

  test('consumer_failed_contact_veri_', () {
    final String appContext = demoAppContexts.first.toString();

    final String result = hasFailedContactVerificationEvent(appContext);

    expect(result, equals('consumer_failed_contact_veri_$appContext'));
  });

  test('consumer_nav_to_add_member_details_', () {
    final String appContext = demoAppContexts.first.toString();

    final String result = hasNavigatedToAddMemberDetailsPageEvent(appContext);

    expect(result, equals('consumer_nav_to_add_member_details_$appContext'));
  });
}
