// Flutter imports:
import 'package:flutter/foundation.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';

/// How the user is feeling at a given time - Their mood
enum MoodType {
  VERY_HAPPY,
  HAPPY,
  NEUTRAL,
  SAD,
  VERY_SAD,
}

/// [MoodTypeEx] extends [MoodType] enum to get the icon values as
/// strings
extension MoodTypeEx on MoodType {
  String get iconString {
    switch (this) {
      case MoodType.VERY_HAPPY:
        return excitedIconSvgPath;

      case MoodType.HAPPY:
        return happyIconSvgPath;

      case MoodType.NEUTRAL:
        return mehIconSvgPath;

      case MoodType.SAD:
        return sadIconSvgPath;

      case MoodType.VERY_SAD:
        return verySadIconSvgPath;
    }
  }

  /// Returns the name equivalent of the [MoodType]
  String get name {
    switch (this) {
      case MoodType.VERY_HAPPY:
        return veryHappyString;

      case MoodType.HAPPY:
        return happyString;

      case MoodType.NEUTRAL:
        return neutralString;

      case MoodType.SAD:
        return sadString;

      case MoodType.VERY_SAD:
        return verySadString;
    }
  }

  String get value {
    return describeEnum(this).toUpperCase();
  }
}

enum MoodTypeFilter {
  ALL,
  VERY_HAPPY,
  HAPPY,
  NEUTRAL,
  SAD,
  VERY_SAD,
}

/// The type of the client
enum ClientType {
  PMTCT,
  OVC,
  OTZ,
  OTZ_PLUS,
  HVL,
  DREAMS,
  HIGH_RISK,
  SPOUSES,
  YOUTH,
  KenyaEMR, // This is used for a user who has been synchronized from KenyaEMR
  UNKNOWN
}

/// The type of the address being used
enum AddressType { POSTAL, PHYSICAL, BOTH, UNKNOWN }

/// The relationship type. Used in next of kin
enum RelationshipType {
  NEXT_OF_KIN,
  EMPLOYER,
  EMERGENCY_CONTACT,
  CHILD,
  OTHER,
  UNKNOWN
}

/// The type of contact being used
enum ContactType { PHONE, EMAIL, UNKNOWN }

/// The current onboarding workflow that is running
///
/// [Login] stage is when a user is signing up normally. It was combined and
///  tweaked to handle signup as well because once a user has been invited they
///  will still have to login
///
/// [ChangePin] is used when the user's PIN has been changed by someone else
///  like their HCW or an admin
///
/// [PINExpired] is used when a user's PIN has expired
///
/// [PINUpdate] is used when a user's PIN has been changed previously
///
/// The [CurrentOnboardingStage] is stored in the [onboardingState] and must be
///  changed at the end of each workflow
enum CurrentOnboardingStage { Login, ResetPIN, PINExpired, PINUpdate }

enum AppointmentListTye { Past, Upcoming }

enum ScreeningToolsType {
  VIOLENCE_ASSESSMENT,
  CONTRACEPTIVE_ASSESSMENT,
  TB_ASSESSMENT,
  ALCOHOL_SUBSTANCE_ASSESSMENT,
}

/// [ScreeningToolsTypeEX] extends [ScreeningToolsType] enum to get the values as
/// strings
extension ScreeningToolsTypeEX on ScreeningToolsType {
  String get name {
    return describeEnum(this);
  }
}

/// The type of feedback a user is giving on the platform
///
/// [GENERAL_FEEDBACK] is for the platform while [SERVICES_OFFERED] means
///  services offered at the client's clinic
enum FeedBackType {
  GENERAL_FEEDBACK,
  SERVICES_OFFERED,
}

extension FeedBackTypeEx on FeedBackType {
  String get name {
    return describeEnum(this);
  }
}

/// The type of medical information during display
enum MedicalDataType { REGIMEN, ALLERGIES, WEIGHT, VIRAL_LOAD, BMI, CD4COUNT }

/// [MedicalDataTypeEX] extends [MedicalDataType] enum to get the values as
/// strings
extension MedicalDataTypeEX on MedicalDataType {
  String get name {
    return '${describeEnum(this)[0].toUpperCase()}${describeEnum(this).replaceAll('_', ' ').substring(1).toLowerCase()}';
  }
}

/// Whether the diary entry has been creates or shared
enum DiaryEntrySuccessType { shared, created }

/// The types of events that we will collect on the platform
enum AnalyticsEventType {
  // Navigation events
  NAVIGATION,

  // General app interactions i.e record diary entry
  INTERACTION,

  // Used for likes, shared and saves in content
  CONTENT_INTERACTION,

  // Used for all authentication events e.g login, logout
  AUTH,

  // Connectivity events
  CONNECTIVITY,

  /// Events used in the onboarding workflow
  ONBOARDING
}

/// The type of section item being rendered in the home page
enum HomePageCarouselItemType { SCREENING_TOOL, SURVEY }

/// Returns cleaned string equivalents of the user's mood
extension MoodTypeFilterEx on MoodTypeFilter {
  String get name {
    switch (this) {
      case MoodTypeFilter.ALL:
        return all;

      case MoodTypeFilter.VERY_HAPPY:
        return veryHappyString;

      case MoodTypeFilter.HAPPY:
        return happyString;

      case MoodTypeFilter.NEUTRAL:
        return neutralString;

      case MoodTypeFilter.SAD:
        return sadString;

      case MoodTypeFilter.VERY_SAD:
        return verySadString;
    }
  }

  String get value {
    return describeEnum(this).toUpperCase();
  }
}

/// The environment the app is running on
enum AppEnvironment { dev, demo, prod }

extension AppEnvironmentEx on AppEnvironment {
  String get name {
    return describeEnum(this).toUpperCase();
  }
}

enum QuestionType { OPEN_ENDED, CLOSE_ENDED }

enum QuestionResponseValueType {
  STRING,
  NUMBER,
  BOOLEAN,
  TIME,
  DATE,
  DATE_TIME,
}
