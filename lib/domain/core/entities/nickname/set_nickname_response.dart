import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_nickname_response.freezed.dart';
part 'set_nickname_response.g.dart';

@freezed
class SetNicknameResponse with _$SetNicknameResponse {
  factory SetNicknameResponse({
    @JsonKey(name: 'setNickName') required bool acceptTerms,
  }) = _SetNicknameResponse;

  factory SetNicknameResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SetNicknameResponseFromJson(json);
}
