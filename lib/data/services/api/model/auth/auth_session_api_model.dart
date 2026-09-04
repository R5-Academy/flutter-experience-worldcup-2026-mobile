import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_session_api_model.g.dart';

@JsonSerializable()
class const AuthSessionApiModel({
  required final String token,
  required final AuthSessionUserApiModel user,
}) extends Equatable {
  factory AuthSessionApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSessionApiModelToJson(this);

  @override
  List<Object?> get props => [token, user];
}

@JsonSerializable()
class const AuthSessionUserApiModel({
  required final String name,
  required final String email,
}) extends Equatable {
  factory AuthSessionUserApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionUserApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSessionUserApiModelToJson(this);

  @override
  List<Object?> get props => [name, email];
}
