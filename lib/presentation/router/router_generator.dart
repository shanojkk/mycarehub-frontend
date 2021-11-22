// Flutter imports:
// Package imports:
import 'package:afya_moja_core/community_list_item.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/faqs/faq_content.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/profile/edit_information_item.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/community/chat_screen/pages/community_chat_screen_page.dart';
import 'package:myafyahub/presentation/community/community_list_page.dart';
import 'package:myafyahub/presentation/core/widgets/handle_deep_link.dart';
import 'package:myafyahub/presentation/engagement/home/mood_selection/mood_feedback_page.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_page.dart';
import 'package:myafyahub/presentation/feed/pages/content_details_page.dart';
import 'package:myafyahub/presentation/feed/pages/feed_page.dart';
import 'package:myafyahub/presentation/my_health/pages/appointments_page.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_diary_page.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_page.dart';
import 'package:myafyahub/presentation/notifications/notifications_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/congratulations_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/create_new_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/forgot_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/login_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/pin_input_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/verify_phone_page.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/forgot_pin_otp_widget.dart';
import 'package:myafyahub/presentation/onboarding/security_questions/answer_security_question_page.dart';
import 'package:myafyahub/presentation/onboarding/security_questions/security_questions_page.dart';
import 'package:myafyahub/presentation/onboarding/terms_and_conditions_page.dart';
import 'package:myafyahub/presentation/profile/pages/clinic_information_page.dart';
import 'package:myafyahub/presentation/profile/pages/consent_page.dart';
import 'package:myafyahub/presentation/profile/pages/edit_information_page.dart';
import 'package:myafyahub/presentation/profile/pages/feedback_page.dart';
import 'package:myafyahub/presentation/profile/pages/medical_data_page.dart';
import 'package:myafyahub/presentation/profile/pages/personal_information_page.dart';
import 'package:myafyahub/presentation/profile/pages/profile_faqs/faq_detail_view_page.dart';
import 'package:myafyahub/presentation/profile/pages/profile_faqs/profile_faqs_page.dart';
import 'package:myafyahub/presentation/profile/pages/saved_posts.dart';
import 'package:myafyahub/presentation/profile/pages/settings_page.dart';
import 'package:myafyahub/presentation/profile/pages/user_profile_page.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:user_profile/term_and_conditions.dart' as webview;

/// The router generator for the app. The arrangement in this config must match that
/// in the routes.dart file
class RouteGenerator {
  /// gets the current route based on the [RouteSettings]
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;

    switch (settings.name) {
      case BWRoutes.deepLink:
        return MaterialPageRoute<HandleDeepLink>(
          builder: (BuildContext context) => const HandleDeepLink(),
        );

      case BWRoutes.createPin:
        return MaterialPageRoute<CreateNewPINPage>(
          builder: (_) => CreateNewPINPage(),
        );

      case BWRoutes.verifySignUpOTP:
        return MaterialPageRoute<VerifyPhonePage>(
          builder: (_) => VerifyPhonePage(),
        );

      case BWRoutes.congratulationsPage:
        return MaterialPageRoute<CongratulationsPage>(
          builder: (_) => CongratulationsPage(),
        );

      case BWRoutes.termsAndConditions:
        return MaterialPageRoute<TermsAndConditionsPage>(
          builder: (_) => const TermsAndConditionsPage(),
        );

      case BWRoutes.phoneLogin:
        return MaterialPageRoute<LoginPage>(
          builder: (_) => LoginPage(),
        );

      // the homepage route config
      case BWRoutes.home:
        return MaterialPageRoute<HomePage>(builder: (_) => const HomePage());

      case BWRoutes.moodFeedbackPage:
        return MaterialPageRoute<MoodFeedbackPage>(
          builder: (_) => MoodFeedbackPage(
            moodType: args as MoodType,
          ),
        );

      case BWRoutes.editInformationPage:
        final EditInformationItem editInformationItem =
            args as EditInformationItem;
        return MaterialPageRoute<EditInformationPage>(
          builder: (_) => EditInformationPage(
            editInformationItem: editInformationItem,
          ),
        );

      case BWRoutes.userProfile:
        return MaterialPageRoute<UserProfilePage>(
          builder: (_) => UserProfilePage(),
        );

      case BWRoutes.profileFaqsPage:
        return MaterialPageRoute<ProfileFaqsPage>(
          builder: (_) => const ProfileFaqsPage(),
        );

      case BWRoutes.webView:
        return MaterialPageRoute<webview.TermsAndConditionsPage>(
          builder: (_) => const webview.TermsAndConditionsPage(),
        );

      case BWRoutes.forgotPinOtpWidget:
        return MaterialPageRoute<ForgotPinOtpWidget>(
          builder: (_) => ForgotPinOtpWidget(),
        );

      case BWRoutes.securityQuestionsPage:
        return MaterialPageRoute<SecurityQuestionsPage>(
          builder: (_) => const SecurityQuestionsPage(),
        );

      case BWRoutes.answerSecurityQuestionPage:
        return MaterialPageRoute<AnswerSecurityQuestionPage>(
          builder: (_) => const AnswerSecurityQuestionPage(),
        );

      case BWRoutes.communityListView:
        return MaterialPageRoute<CommunityListViewPage>(
          builder: (_) => const CommunityListViewPage(),
        );

      case BWRoutes.communityChatScreenPage:
        final CommunityListItem chatDetailArguments = args as CommunityListItem;
        return MaterialPageRoute<CommunityChatScreenPage>(
          builder: (_) => CommunityChatScreenPage(
            communityChatData: chatDetailArguments,
          ),
        );

      case BWRoutes.consent:
        return MaterialPageRoute<ConsentPage>(
          builder: (_) => const ConsentPage(),
        );

      case BWRoutes.personalInfo:
        return MaterialPageRoute<PersonalInformationPage>(
          builder: (_) => PersonalInformationPage(),
        );

      case BWRoutes.medicalData:
        return MaterialPageRoute<MedicalDataPage>(
          builder: (_) => const MedicalDataPage(),
        );

      case BWRoutes.savedPosts:
        return MaterialPageRoute<SavedPostPage>(
          builder: (_) => SavedPostPage(),
        );

      case BWRoutes.feedPage:
        return MaterialPageRoute<FeedPage>(
          builder: (_) => const FeedPage(),
        );

      case BWRoutes.notificationsPage:
        return MaterialPageRoute<NotificationsPage>(
          builder: (_) => NotificationsPage(
            notifications: notifications,
          ),
        );

      case BWRoutes.appointmentsPage:
        return MaterialPageRoute<AppointmentsPage>(
          builder: (_) => AppointmentsPage(),
        );

      case BWRoutes.myHealthPage:
        return MaterialPageRoute<MyHealthPage>(
          builder: (_) => MyHealthPage(),
        );

      case BWRoutes.myHealthDiaryPage:
        return MaterialPageRoute<MyHealthDiaryPage>(
          builder: (_) => MyHealthDiaryPage(),
        );

      case BWRoutes.userProfilePage:
        return MaterialPageRoute<UserProfilePage>(
          builder: (_) => UserProfilePage(),
        );

      case BWRoutes.clinicInformationPage:
        return MaterialPageRoute<ClinicInformationPage>(
          builder: (_) => ClinicInformationPage(),
        );

      case BWRoutes.settingsPage:
        return MaterialPageRoute<SettingsPage>(
          builder: (_) => SettingsPage(),
        );

      case BWRoutes.feedbackPage:
        return MaterialPageRoute<FeedbackPage>(
          builder: (_) => const FeedbackPage(),
        );

      case BWRoutes.pinInputPage:
        return MaterialPageRoute<PINInputPage>(
          builder: (_) => PINInputPage(),
        );

      case BWRoutes.contentDetailPage:
        return MaterialPageRoute<ContentDetailPage>(
          builder: (_) => ContentDetailPage(articleDetails: args as Content),
        );

      case BWRoutes.faqDetailViewPage:
        return MaterialPageRoute<FAQDetailViewPage>(
          builder: (_) => FAQDetailViewPage(
            payload: args as FAQContent,
          ),
        );

      case BWRoutes.forgotPINPage:
        return MaterialPageRoute<ForgotPINPage>(
          builder: (_) => const ForgotPINPage(),
        );

      default:
        return MaterialPageRoute<LoginPage>(builder: (_) => LoginPage());
    }
  }
}
