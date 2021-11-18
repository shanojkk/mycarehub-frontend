// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/login/phone_login.dart';
import 'package:myafyahub/domain/core/entities/login/user_pin.dart';

part 'misc_state.freezed.dart';
part 'misc_state.g.dart';

@freezed
class MiscState with _$MiscState {
  factory MiscState({
    PhoneLogin? phoneLogin,
    UserPin? userPin,
    List<dynamic>? libraryListItems,
    String? healthPagePINInputTime,
    FAQState? faqState,
  }) = _MiscState;

  factory MiscState.fromJson(Map<String, dynamic> json) =>
      _$MiscStateFromJson(json);

  factory MiscState.initial() => MiscState(
        phoneLogin: PhoneLogin.initial(),
        userPin: UserPin(),
        libraryListItems: <dynamic>[],
        healthPagePINInputTime: UNKNOWN,
        faqState: FAQState.initial(),
      );
}

@freezed
class FAQState with _$FAQState {
  factory FAQState() = _FAQState;

  factory FAQState.fromJson(Map<String, dynamic> json) =>
      _$FAQStateFromJson(json);

  factory FAQState.initial() => FAQState();
}
