// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumApiModel _$AlbumApiModelFromJson(Map<String, dynamic> json) =>
    AlbumApiModel(
      teams: (json['teams'] as List<dynamic>)
          .map(
            (e) => TeamAlbumGroupApiModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      loose: (json['loose'] as List<dynamic>)
          .map((e) => AlbumPositionApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlbumApiModelToJson(AlbumApiModel instance) =>
    <String, dynamic>{
      'teams': instance.teams.map((e) => e.toJson()).toList(),
      'loose': instance.loose.map((e) => e.toJson()).toList(),
    };
