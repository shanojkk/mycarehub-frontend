// Dart imports:

// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
// Flutter imports:
import 'package:intl/intl.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

// TODO(abiud): move to afya_moja_core and add tests
/// Validates a security question
String? securityQuestionResponseValidator(String? value) {
  if (value != null && (value.isEmpty || value == UNKNOWN)) {
    return 'Please enter a response';
  }
  return null;
}

// TODO(abiud): move to afya_moja_core
/// Validates an appointment date
///
/// It ensures the date entered is not in the past
String? appointmentDateValidator(String? value) {
  if (value?.isEmpty ?? true) {
    return dateRequiredString;
  } else if (!(DateFormat(datePickerFormat)
          .parseLoose(value!)
          .compareTo(DateTime.now()) >
      0)) {
    return inValidDateString;
  }
  return null;
}

String validateFeedback({
  required FeedBackType feedBackType,
  required String feedBackText,
  required int selectedRating,
  String? searchString,
}) {
  final bool serviceEntered = searchString?.isEmpty ?? true;
  if (selectedRating == 0) {
    return 'Please select a rating';
  } else if (feedBackType == FeedBackType.SERVICES_OFFERED && serviceEntered) {
    return 'Please enter the name of service';
  } else {
    return 'Please share your thoughts';
  }
}
