// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_page_state.freezed.dart';
part 'login_page_state.g.dart';

@freezed
class LoginPageState with _$LoginPageState {
  factory LoginPageState({
    String? phoneNumber,
    String? pinCode,
    @Default(false) bool invalidCredentials,
  }) = _LoginPageState;

  factory LoginPageState.fromJson(Map<String, dynamic> json) =>
      _$LoginPageStateFromJson(json);

  factory LoginPageState.initial() => LoginPageState(
        phoneNumber: UNKNOWN,
        pinCode: UNKNOWN,
      );
}
