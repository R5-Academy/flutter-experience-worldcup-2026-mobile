import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team_api_model.g.dart';

@JsonSerializable()
class const TeamApiModel({
  required final String code,
  required final String name,
  required final String flagUrl,
  required final String primaryColor,
}) extends Equatable {
  factory TeamApiModel.fromJson(Map<String, dynamic> json) =>
      _$TeamApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeamApiModelToJson(this);

  @override
  List<Object?> get props => [code, name, flagUrl, primaryColor];
}
