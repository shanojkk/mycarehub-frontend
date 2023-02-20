// Dart imports:
import 'dart:async';

// Package imports:
import 'package:pro_health_360/application/core/services/custom_client.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_setup_data.dart';
import 'package:pro_health_360/application/redux/actions/bookmark_content_action.dart';
import 'package:pro_health_360/application/redux/actions/bottom_nav_action.dart';
import 'package:pro_health_360/application/redux/actions/content/update_reactions_state_action.dart';
import 'package:pro_health_360/application/redux/actions/update_content_like_status_action.dart';
import 'package:pro_health_360/application/redux/actions/update_pin_input_details_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/content/content_view_model.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_question.dart';
import 'package:pro_health_360/domain/core/entities/core/user.dart';
import 'package:pro_health_360/domain/core/entities/health_diary/mood_item_data.dart';
import 'package:pro_health_360/domain/core/entities/profile/caregiver_information.dart';
import 'package:pro_health_360/domain/core/entities/profile/edit_information_item.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/constants.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/app_wrapper/enums.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:url_launcher/url_launcher.dart';

/// Returns setup data depending on the environment the app is running on
///
/// The returned [AppSetupData]
AppSetupData getAppSetupData(AppContext context) {
  switch (context) {
    case AppContext.AppTest:
      return devAppSetupData;
    case AppContext.AppDemo:
      return demoAppSetupData;
    case AppContext.AppProd:
      return prodAppSetupData;
    default:
      return devAppSetupData;
  }
}

/// Returns a [User]'s display name
///
/// Takes in a [User] object, extracts and concatenates their name. It removes
/// any spaces in the name and omits empty segments of the name
///
/// ```dart
/// getDisplayName(vm.clientState?.clientProfile?.user)
/// ```
///
/// ```output```
/// "Abiud Orina"
String getDisplayName(User? user) {
  final String firstName = user?.firstName ?? '';
  String formattedFirstName = firstName.replaceAll(' ', '');

  if (formattedFirstName.isEmpty) {
    formattedFirstName = '';
  }

  final String lastName = user?.lastName ?? '';
  String formattedLastName = lastName.replaceAll(' ', '');

  if (formattedLastName.isEmpty) {
    formattedLastName = '';
  }

  return '$formattedFirstName $formattedLastName';
}

/// Returns a human readable format of the date entered by the user
String formatSecurityQuestionDate(
  dynamic dateValue, {
  String? format = datePickerFormat,
}) {
  late String date;
  if (dateValue.toString().contains(' ')) {
    final String d = dateValue.toString();
    date =
        DateFormat.yMMMMd('en_GB').parseLoose(d.replaceAll(',', '')).toString();
  } else {
    date = dateValue.toString();
  }
  return DateFormat(format).format(DateTime.parse(date));
}

/// A bottom sheet that alerts a user when a failure occurs
///
/// It can show an [imageAssetPath] image in the bottom sheet
Future<dynamic> showFeedbackBottomSheet({
  required BuildContext context,
  required String modalContent,
  required String imageAssetPath,
}) async {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        key: feedbackBottomSheet,
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          constraints: const BoxConstraints(
            maxWidth: 420,
          ),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SvgPicture.asset(
                        imageAssetPath,
                        height: 34.0,
                        width: 34.0,
                      ),
                      mediumHorizontalSizedBox,
                      Flexible(
                        child: Text(
                          modalContent,
                          style: normalSize14Text(),
                        ),
                      ),
                    ],
                  ),
                ),
                smallHorizontalSizedBox,
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Image(
                      key: feedbackBottomSheetCloseIconKey,
                      image: AssetImage(closeIconUrl),
                      color: Colors.black54,
                      height: 16.0,
                      width: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

/// Formats the next refill date for a patient's viral load
///
/// An Map containing the day and month is returned
/// ```dart
/// {'day': '01', "Aug"}
/// ```
Map<String, String> extractNextRefillDate(String loadedDate) {
  final DateTime parsedDate =
      DateTime.tryParse(loadedDate)?.toLocal() ?? DateTime.now();
  final String postDay = DateFormat.d().format(parsedDate);
  final String postMonth = DateFormat.MMM().format(parsedDate);

  return <String, String>{
    'day': postDay,
    'month': postMonth,
  };
}

/// Reports an error to [Sentry]
dynamic reportErrorToSentry({
  /// A human readable description of the error
  required String hint,

  /// The [AppState] used to add contact info
  AppState? state,

  /// Used in cases of HTTP request errors
  http.Response? response,

  // Should be a derivative of the [AppRoutes class] i.e AppRoutes.loginPage
  String? route,

  /// Any exception object for example from a try {...} catch {...} operation
  Object? exception,

  /// The GraphQL query
  String? query,

  /// Variables
  Map<String, dynamic>? variables,
}) {
  final Map<String, dynamic> stackTrace = <String, dynamic>{};
  final String contact =
      state?.clientState?.clientProfile?.user?.primaryContact?.value ?? UNKNOWN;
  final bool isSignedIn = state?.clientState?.isSignedIn ?? false;

  if (response != null) {
    stackTrace.addAll(
      <String, dynamic>{
        'request': response.request.toString(),
        'body': response.body,
        'statusCode': response.statusCode,
      },
    );
  }

  if (isSignedIn) {
    stackTrace.addAll(<String, dynamic>{'phoneNumber': contact});
  }

  stackTrace.addAll(<String, dynamic>{
    'exception': exception ?? UNKNOWN,
    'query': query ?? UNKNOWN,
    'variables': variables ?? UNKNOWN,
  });

  Sentry.captureException(stackTrace, stackTrace: stackTrace, hint: hint);
}

/// Indicates how long a user can retry after exponential backoff
String tooManyTriesString(int timeLeft) {
  final DateFormat f = DateFormat('mm:ss');
  final String convertedTime =
      f.format(DateTime.fromMillisecondsSinceEpoch(timeLeft * 1000));

  return 'Too many tries, try again in $convertedTime minutes';
}

/// Whether a user should input their PIN to access their medical information
///
///
/// Compares the last time someone signed in time and prompts them every 30
/// minutes
bool shouldInputPIN(BuildContext context) {
  final String? signedInTimeFromState =
      StoreProvider.state<AppState>(context)?.credentials?.signedInTime;

  final String lastUserSignInTime =
      signedInTimeFromState == UNKNOWN || signedInTimeFromState == null
          ? DateTime.now().toString()
          : signedInTimeFromState;

  final DateTime signedInTime = DateTime.parse(lastUserSignInTime);

  final String? pinInputTimeFromState =
      StoreProvider.state<AppState>(context)!.miscState!.healthPagePINInputTime;

  final String lastPINInputTime = pinInputTimeFromState ?? UNKNOWN;

  final int differenceFromSignIn =
      DateTime.now().difference(signedInTime).inMinutes;

  final int differenceFromLastInput = lastPINInputTime != UNKNOWN
      ? DateTime.now().difference(DateTime.parse(lastPINInputTime)).inMinutes
      : 0;

  return (differenceFromSignIn > 20 && lastPINInputTime == UNKNOWN) ||
      differenceFromLastInput > 20;
}

/// Caregiver information menu items
EditInformationItem getEditCareGiverInfo({
  required CaregiverInformation caregiverInformation,
}) {
  return EditInformationItem(
    title: myProfileCaregiverText,
    description: myProfileCaregiverDescriptionText,
    editInformationInputItem: <EditInformationInputItem>[
      EditInformationInputItem(
        fieldName: firstName,
        hintText: caregiverInformation.firstName ?? jane,
        inputType: EditInformationInputType.Text,
        inputController: TextEditingController(),
        apiFieldValue: 'firstName',
      ),
      EditInformationInputItem(
        fieldName: lastName,
        hintText: caregiverInformation.lastName ?? doe,
        inputType: EditInformationInputType.Text,
        inputController: TextEditingController(),
        apiFieldValue: 'lastName',
      ),
      EditInformationInputItem(
        fieldName: phoneNumber,
        hintText: caregiverInformation.phoneNumber ?? hotlineNumberString,
        inputType: EditInformationInputType.Text,
        inputController: TextEditingController(),
        apiFieldValue: 'phoneNumber',
      ),
      EditInformationInputItem(
        fieldName: relationText,
        hintText: relationText,
        inputType: EditInformationInputType.DropDown,
        inputController: TextEditingController(),
        dropdownValue: caregiverInformation.caregiverType!.name,
        dropDownOptionList: CaregiverType.values
            .map<String>((CaregiverType type) => type.name)
            .toList(),
        apiFieldValue: 'caregiverType',
      ),
    ],
  );
}

EditInformationInputItem nickNameInputItem(String userNickName) =>
    EditInformationInputItem(
      fieldName: nickNameFieldName,
      hintText: userNickName,
      inputType: EditInformationInputType.Text,
      inputController: TextEditingController(),
    );

EditInformationItem nickNameEditInfo(String userNickName) =>
    EditInformationItem(
      title: nickNameString,
      editInformationInputItem: <EditInformationInputItem>[
        nickNameInputItem(userNickName)
      ],
    );

/// Navigates to a new page based on the [bottomNavIndex]
void navigateToNewPage({
  required BuildContext context,
  required String route,
  int? bottomNavIndex,
}) {
  if (bottomNavIndex != null) {
    StoreProvider.dispatch<AppState>(
      context,
      BottomNavAction(currentBottomNavIndex: bottomNavIndex),
    );
  }
  Navigator.pushReplacementNamed(context, route);
}

/// Updates the status of the like of a content item
///
/// It updates the app state before making an API call to update the backend
Future<void> updateLikeStatus({
  required BuildContext context,
  required int contentID,
  required bool isLiked,
  bool updateLikeCount = false,
  required ContentDisplayedType contentDisplayedType,
}) async {
  StoreProvider.dispatch(
    context,
    UpdateReactionStatusAction(
      contentID: contentID,
      hasLiked: !isLiked,
      updateLikeCount: updateLikeCount,
      contentDisplayedType: contentDisplayedType,
    ),
  );

  await StoreProvider.dispatch(
    context,
    UpdateContentLikeStatusAction(
      contentID: contentID,
      context: context,
      isLiked: isLiked,
    ),
  );
}

/// Updates the status of the bookmark of a content item
///
/// It updates the app state before making an API call to update the backend
Future<void> updateBookmarkStatus({
  required BuildContext context,
  required int contentID,
  required ContentDisplayedType contentDisplayedType,
}) async {
  //update save status locally
  StoreProvider.dispatch(
    context,
    UpdateReactionStatusAction(
      contentID: contentID,
      hasSaved: true,
      contentDisplayedType: contentDisplayedType,
    ),
  );

  await StoreProvider.dispatch(
    context,
    BookmarkContentAction(
      contentID: contentID,
      context: context,
    ),
  );
}

/// Returns a [MoodItemData] that contains the mood configs like the color and
/// the icon
///
/// The output is dependent on the type of the mood
MoodItemData getMoodData(String? mood) {
  if (mood == null) {
    return MoodItemData.initial();
  }

  switch (mood) {
    case veryHappyString:
      return MoodItemData(
        color: AppColors.greenHappyColor,
        svgIconUrl: excitedIconSvgPath,
      );
    case happyString:
      return MoodItemData(
        color: AppColors.greenHappyColor,
        svgIconUrl: happyIconSvgPath,
      );
    case neutralString:
      return MoodItemData(
        color: AppColors.mehMoodColor,
        svgIconUrl: mehIconSvgPath,
      );
    case sadString:
      return MoodItemData(
        color: AppColors.warningColor,
        svgIconUrl: sadIconSvgPath,
      );
    case verySadString:
      return MoodItemData(
        color: AppColors.verySadColor,
        svgIconUrl: verySadIconSvgPath,
      );
    default:
      return MoodItemData.initial();
  }
}

/// Checks whether a user has liked a content item with the provided [contentID]
bool getHasLiked({
  required int contentID,
  required ContentDisplayedType contentDisplayedType,
  required ContentViewModel vm,
}) {
  final List<Content?> contentItems =
      getContentList(contentDisplayedType: contentDisplayedType, vm: vm);
  if (contentItems.isNotEmpty) {
    return contentItems
        .firstWhere(
          (Content? element) => element?.contentID == contentID,
          orElse: () => Content.initial(),
        )!
        .hasLiked!;
  }
  return false;
}

/// Returns the number of likes for a content item based on the [contentID]
int getLikeCount({
  required int contentID,
  required ContentDisplayedType contentDisplayedType,
  required ContentViewModel vm,
}) {
  final List<Content?> contentItems =
      getContentList(contentDisplayedType: contentDisplayedType, vm: vm);

  if (contentItems.isNotEmpty) {
    return contentItems
            .firstWhere(
              (Content? element) => element?.contentID == contentID,
              orElse: () => Content.initial(),
            )!
            .likeCount ??
        0;
  }
  return 0;
}

/// Checks whether a user has saved a content item based on tbe [contentID]
bool getHasSaved({
  required int contentID,
  required ContentDisplayedType contentDisplayedType,
  required ContentViewModel vm,
}) {
  final List<Content?> contentItems =
      getContentList(contentDisplayedType: contentDisplayedType, vm: vm);
  if (contentItems.isNotEmpty) {
    return contentItems
        .firstWhere(
          (Content? element) => element?.contentID == contentID,
          orElse: () => Content.initial(),
        )!
        .hasSaved!;
  }
  return false;
}

/// Lists content items based on the [ContentDisplayedType]
///
/// [ContentDisplayedType.RECENT] lists the recent content in the home page
/// [ContentDisplayedType.FEED] lists content items in the feed
/// [ContentDisplayedType.BOOKMARK] lists bookmarked content
List<Content?> getContentList({
  required ContentDisplayedType contentDisplayedType,
  required ContentViewModel vm,
}) {
  switch (contentDisplayedType) {
    case ContentDisplayedType.FEED:
      return vm.feedContentState?.contentItems ?? <Content?>[];
    case ContentDisplayedType.BOOKMARK:
      return vm.savedContentState?.savedContentItems ?? <Content?>[];

    case ContentDisplayedType.RECENT:
      return vm.recentContentState?.contentItems ?? <Content?>[];
    default:
      return <Content?>[];
  }
}

/// Updates the like count based on whether a user has liked a content.
int getNewLikeCount({required bool? hasLiked, required int likeCount}) {
  if (hasLiked != null) {
    return hasLiked ? likeCount + 1 : likeCount - 1;
  }
  return likeCount;
}

/// Updates the status of the PIN input timer
///
/// Used in the page to access medical information
void pinInputTimerStatus({required BuildContext context}) {
  bool resumeTimer;
  final String maxTryTime =
      StoreProvider.state<AppState>(context)?.miscState?.maxTryTime ?? '';

  if (maxTryTime.isNotEmpty && maxTryTime != UNKNOWN) {
    final DateTime? parsedMaxTryTime = DateTime.tryParse(maxTryTime);
    if (parsedMaxTryTime != null &&
        DateTime.now().difference(parsedMaxTryTime).inSeconds <
            medicalInfoTimer - 2) {
      resumeTimer = true;
    } else {
      StoreProvider.dispatch(
        context,
        UpdatePINInputDetailsAction(maxTryTime: '', pinInputTries: 0),
      );
      resumeTimer = false;
    }
  } else {
    resumeTimer = false;
  }

  StoreProvider.dispatch(
    context,
    UpdatePINInputDetailsAction(resumeTimer: resumeTimer),
  );
}

/// Shows a text snackbar
void showTextSnackbar(
  ScaffoldMessengerState scaffoldMessengerState, {
  required String content,
  SnackBarAction? action,
}) {
  scaffoldMessengerState
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(content),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: closeString,
          textColor: Colors.white,
          onPressed: () => scaffoldMessengerState.hideCurrentSnackBar(),
        ),
      ),
    );
}

/// Checks whether all questions have been answered in screening tools
bool allQuestionsAnswered(List<ScreeningQuestion>? questions) {
  if (questions != null) {
    for (final ScreeningQuestion question in questions) {
      if (question.answer == null) return false;
    }
    return true;
  }
  return false;
}

NotificationActionInfo getNotificationInfo(NotificationType notificationType) {
  switch (notificationType) {
    case NotificationType.COMMUNITIES:
      return NotificationActionInfo(
        actionTitle: 'View Community Invites',
        route: AppRoutes.groupInvitesPage,
      );
    case NotificationType.APPOINTMENT:
      return NotificationActionInfo(
        actionTitle: 'View Appointments',
        route: AppRoutes.appointmentsPage,
      );
    default:
      return NotificationActionInfo(actionTitle: null, route: null);
  }
}

/// calculates someone's age from the date of birth
String calculateAge(String dateOfBirth) {
  if (dateOfBirth.isEmpty || dateOfBirth == UNKNOWN) {
    return 'Age not recorded';
  }
  final DateTime parsedDate = DateTime.parse(dateOfBirth);

  return '${(DateTime.now().difference(parsedDate).inDays / 365).round().toString()} yrs';
}

String capitalize(String word) {
  return word[0].toUpperCase() + word.substring(1);
}

bool shouldResumeWithPIN(AppState? appState) {
  final bool isSignedIn = appState?.credentials?.isSignedIn ?? false;
  final User? userState = appState?.clientState?.clientProfile?.user;

  return isSignedIn &&
      (userState?.hasSetNickname ?? false) &&
      (userState?.hasSetPin ?? false) &&
      (userState?.hasSetSecurityQuestions ?? false) &&
      (userState?.isPhoneVerified ?? false) &&
      (userState?.termsAccepted ?? false) &&
      !(userState?.pinChangeRequired ?? false) &&
      !(userState?.pinUpdateRequired ?? false);
}

final List<String> quoteSliderBackgroundImages = <String>[
  moodSelectionBackgroundUrl,
  carrousel1BackgroundUrl,
  carrousel2BackgroundUrl,
  carrousel3BackgroundUrl,
  carrousel4BackgroundUrl,
  carrousel5BackgroundUrl
];

/// Sets Duration taken by each slide to 5 minutes when
/// [autoPlay] is set to true.
const int quoteSliderAutoPlayInterval = 300; //300 seconds == 5 minutes

Future<void> launchEmailUrl(String email) async {
  final Uri url = Uri.parse('mailto:$email');
  await launchUrl(url);
}

String? usernameValidator(String? value) {
  final RegExp userNameRegex = RegExp(r'^[0-9a-zA-Z_]{1,30}$');
  if (value?.trim().isEmpty ?? true) {
    return 'Please enter a Username';
  }else if (!userNameRegex.hasMatch(value!)) {
      return errorNicknameInputString;
    }
  return null;
}

IGraphQlClient getCustomClient({
  IGraphQlClient? graphQlClient,
  required BuildContext context,
}) {
  if (graphQlClient != null) {
    return graphQlClient;
  }
  final List<AppContext>? contexts = AppWrapperBase.of(context)?.appContexts;
  final AppSetupData appSetupData =
      getAppSetupData(contexts?.last ?? AppContext.AppTest);
  final String graphqlEndpoint =
      appSetupData.customContext?.graphqlEndpoint ?? '';
  final String refreshTokenEndpoint =
      appSetupData.customContext?.refreshTokenEndpoint ?? '';

  final String idToken =
      StoreProvider.state<AppState>(context)?.credentials?.idToken ?? '';
  final String userID = StoreProvider.state<AppState>(context)
          ?.clientState
          ?.clientProfile
          ?.user
          ?.userId ??
      '';

  return CustomClient(
    idToken,
    graphqlEndpoint,
    context: context,
    refreshTokenEndpoint: refreshTokenEndpoint,
    userID: userID,
  );
}
