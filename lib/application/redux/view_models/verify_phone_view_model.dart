// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

class VerifyPhoneViewModel extends Vm {
  VerifyPhoneViewModel({
    required this.wait,
    required this.userID,
    required this.username,
    required this.otp,
    required this.currentOnboardingStage,
    this.failedToSendOTP,
    this.canResendOTP,
    this.invalidOTP,
    this.phoneNumber,
  }) : super(
          equals: <Object?>[
            wait,
            userID,
            username,
            otp,
            failedToSendOTP,
            canResendOTP,
            invalidOTP,
            currentOnboardingStage,
            phoneNumber
          ],
        );

  final Wait? wait;
  final String? userID;
  final String? username;
  final String? otp;
  final bool? invalidOTP;
  final bool? failedToSendOTP;
  final bool? canResendOTP;
  final CurrentOnboardingStage? currentOnboardingStage;
  final String? phoneNumber;

  static VerifyPhoneViewModel fromStore(AppState state) {
    return VerifyPhoneViewModel(
      wait: state.wait,
      userID: state.clientState?.clientProfile?.user?.userId ?? UNKNOWN,
      username: state.onboardingState?.userName ?? UNKNOWN,
      otp: state.onboardingState?.otp ?? UNKNOWN,
      invalidOTP: state.onboardingState?.invalidOTP ?? false,
      failedToSendOTP: state.onboardingState?.failedToSendOTP ?? false,
      canResendOTP: state.onboardingState?.canResendOTP ?? false,
      currentOnboardingStage: state.onboardingState?.currentOnboardingStage,
      phoneNumber: state.onboardingState?.phoneNumber,
    );
  }
}
