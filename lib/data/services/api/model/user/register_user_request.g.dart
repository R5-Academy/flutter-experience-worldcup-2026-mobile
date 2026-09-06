// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUserRequest _$RegisterUserRequestFromJson(Map<String, dynamic> json) =>
    RegisterUserRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      favoriteTeams: (json['favorite_teams'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      acceptedTerms: json['accepted_terms'] as bool,
    );

Map<String, dynamic> _$RegisterUserRequestToJson(
  RegisterUserRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'password': instance.password,
  'favorite_teams': instance.favoriteTeams,
  'accepted_terms': instance.acceptedTerms,
};
