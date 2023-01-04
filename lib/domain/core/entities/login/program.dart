// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
// Project imports:
import 'package:pro_health_360/domain/core/entities/login/organization.dart';

part 'program.freezed.dart';
part 'program.g.dart';

@freezed
class Program with _$Program {
  factory Program({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'active') bool? active,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'organisation') Organization? organization,
  }) = _Program;

  factory Program.fromJson(Map<String, dynamic> json) =>
      _$ProgramFromJson(json);
}
