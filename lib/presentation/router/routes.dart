/// These are the all routes that the app uses.
/// For better code and readability, the arrangement in this
/// file **MUST** follow the same, and must be replicated in
/// the router generator file
class AppRoutes {
  static const String deepLink = '/mycarehub';

  // onboarding routes
  static const String phoneLogin = '/phoneLogin';
  static const String verifyCode = '/verifyCode';
  static const String termsAndConditions = '/termsAndConditions';
  static const String verifySignUpOTP = '/verifySignUpOTP';
  static const String securityQuestionsPage = '/securityQuestionsPage';

  static const String createPin = '/createPin';
  static const String confirmCreatePin = '/confirmCreatePin';

  // onboarding routes
  static const String setupUserAsTester = '/setupUserAsTester';

  static const String enterEmail = '/enterEmail';
  static const String emailVerification = '/emailVerification';

  // homepage
  static const String home = '/home';

  static const String moodFeedbackPage = '/moodFeedbackPage';

  // user profile routes
  static const String userProfile = '/userProfile';
  static const String consent = '/consent';
  static const String personalInfo = '/personalInfo';
  static const String medicalData = '/medicalData';
  static const String savedPosts = '/savedPosts';

  // Notifications page
  static const String notificationsPage = '/notificationsPage';

  // My Health Page
  static const String myHealthPage = '/myHealthPage';

  // Appointments page
  static const String appointmentsPage = '/appointmentsPage';

  // Answer Security Question
  static const String answerSecurityQuestionPage =
      '/answerSecurityQuestionPage';

  // Feed
  static const String feedPage = '/feedPage';

  // Health Diary Page
  static const String myHealthDiaryPage = '/healthDiaryPage';
  static const String successfulEntryPage = '/successfulEntryPage';

  // User Profile Page
  static const String userProfilePage = '/userProfilePage';

  // Profile Faqs Page
  static const String profileFaqsPage = '/profileFaqsPage';

  //Clinic Information Page
  static const String clinicInformationPage = '/clinicInformationPage';

  //Settings Page
  static const String settingsPage = '/settingsPage';

  //Feedback Page
  static const String feedbackPage = '/feedbackPage';

  //Pin Input Page
  static const String pinInputPage = '/pinInputPage';

  //Article Details Page
  static const String contentDetailPage = '/contentDetailPage';

  //Forgot PIN Page
  static const String forgotPINPage = '/forgotPINPage';

  //Edit Information Page
  static const String editInformationPage = '/editInformationPage';

  static const String galleryImagesPage = '/galleryImagesPage';

  //Documents Page
  static const String viewDocumentPage = '/viewDocumentPage';

  // violence assessment
  static const String violenceAssessmentPage = '/violenceAssessmentPage';

  //Contraceptive assessment Page
  static const String contraceptiveAssessmentPage =
      '/contraceptiveAssessmentPage';

  //Tuberculosis assessment Page
  static const String tuberculosisAssessmentPage =
      '/tuberculosisAssessmentPage';

  //Alcohol and substance use page
  static const String alcoholSubstanceUsePage = '/alcoholSubstanceUsePage';

  // successful assessment submission
  static const String successfulAssessmentSubmissionPage =
      '/successfulAssessmentSubmissionPage';

  // successful feedback submission
  static const String successfulFeedbackSubmissionPage =
      '/successfulFeedbackSubmissionPage';

  // resume with pin
  static const String resumeWithPin = '/resumeWithPin';

  // consent confirmation page
  static const String consentConfirmationPage = '/consentConfirmationPage';

  //pin requests
  static const String pinRequestSentPage = '/pinRequestSentPage';
  static const String pendingPINRequestPage = '/pendingPINRequestPage';
  static const String verifySecurityQuestionsHelpPage =
      '/verifySecurityQuestionsHelpPage';

  static const String pinExpiredPage = '/pinExpiredPage';
  static const String loginCounterPage = '/loginCounterPage';

  static const String myHealthTimeline = '/myHealthTimeline';
  static const String surveysPage = '/surveysPage';
  static const String customWebviewPage = '/customWebviewPage';
  static const String wrongResumeWithPINPage = '/wrongResumeWithPINPage';

  static const String hotlinesPage = '/hotlinesPage';
  static const String clientCaregiverSelectionPageRoute =
      '/clientCaregiverSelectionPageRoute';

  static const String clientSelectionPageRoute = '/clientSelectionPageRoute';
  static const String facilitySelectionPageRoute =
      '/facilitySelectionPageRoute';

  static const String programSelectionPageRoute = '/programSelectionPageRoute';
  static const String inviteUsersPageRoute = '/inviteUsersPageRoute';
  static const String roomListPageRoute = '/roomListPageRoute';
  static const String roomPageRoute = '/roomPageRoute';
  static const String roomInfoPageRoute = '/roomInfoPageRoute';
  static const String previewUploadMediaRoute = '/previewUploadMediaRoute';

  static const String imagePreviewRoute = '/imagePreviewRoute';

  static const String bannedMembersRoute = '/bannedMembersRoute';

  static const String flaggedMessagesRoute = '/flaggedMessagesRoute';

  static const String flaggedMessagePreviewRoute =
      '/flaggedMessagePreviewRoute';
}

List<String> unProtectedRoutes = <String>[AppRoutes.phoneLogin];
