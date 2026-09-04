// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSessionApiModel _$AuthSessionApiModelFromJson(Map<String, dynamic> json) =>
    AuthSessionApiModel(
      token: json['token'] as String,
      user: AuthSessionUserApiModel.fromJson(
        json['user'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$AuthSessionApiModelToJson(
  AuthSessionApiModel instance,
) => <String, dynamic>{'token': instance.token, 'user': instance.user.toJson()};

AuthSessionUserApiModel _$AuthSessionUserApiModelFromJson(
  Map<String, dynamic> json,
) => AuthSessionUserApiModel(
  name: json['name'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$AuthSessionUserApiModelToJson(
  AuthSessionUserApiModel instance,
) => <String, dynamic>{'name': instance.name, 'email': instance.email};
