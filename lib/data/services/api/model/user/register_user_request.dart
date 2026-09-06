import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_user_request.g.dart';

@JsonSerializable()
class const RegisterUserRequest({
  required final String name,
  required final String email,
  required final String password,
  required final List<String> favoriteTeams,
  required final bool acceptedTerms,
}) extends Equatable {
  factory RegisterUserRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterUserRequestToJson(this);

  @override
  List<Object?> get props => [
    name,
    email,
    password,
    favoriteTeams,
    acceptedTerms,
  ];

  @override
  bool? get stringify => false;
}
