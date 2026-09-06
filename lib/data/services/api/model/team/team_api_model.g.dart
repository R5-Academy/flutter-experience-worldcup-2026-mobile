// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamApiModel _$TeamApiModelFromJson(Map<String, dynamic> json) => TeamApiModel(
  code: json['code'] as String,
  name: json['name'] as String,
  flagUrl: json['flag_url'] as String,
  primaryColor: json['primary_color'] as String,
);

Map<String, dynamic> _$TeamApiModelToJson(TeamApiModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'flag_url': instance.flagUrl,
      'primary_color': instance.primaryColor,
    };
