import 'package:pro_health_360/domain/core/entities/core/user_profile_item_obj.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

/// Configuration for the user profile menu items
const List<ProfileMenuItem> userProfileItems = <ProfileMenuItem>[
  ProfileMenuItem(
    iconAssetPath: profileIcon,
    route: AppRoutes.personalInfo,
    title: 'Personal information',
  ),
  ProfileMenuItem(
    iconAssetPath: clinicIcon,
    route: AppRoutes.clinicInformationPage,
    title: 'Clinic information',
  ),
  ProfileMenuItem(
    iconAssetPath: surveyItemImage,
    route: AppRoutes.surveysPage,
    title: 'Surveys',
  ),
  ProfileMenuItem(
    iconAssetPath: mySavedIcon,
    route: AppRoutes.savedPosts,
    title: 'My saved content',
  ),
  ProfileMenuItem(
    iconAssetPath: faqsIcon,
    route: AppRoutes.profileFaqsPage,
    title: 'FAQs',
  ),
  ProfileMenuItem(
    iconAssetPath: helpCircleIcon,
    route: AppRoutes.consent,
    title: 'Consent',
  ),
  ProfileMenuItem(
    iconAssetPath: feedbackIcon,
    route: AppRoutes.feedbackPage,
    title: 'Feedback',
  ),
  ProfileMenuItem(
    iconAssetPath: settingsIcon,
    route: AppRoutes.settingsPage,
    title: 'Settings',
  ),
];
