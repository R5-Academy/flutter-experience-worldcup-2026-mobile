// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_album_group_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamAlbumGroupApiModel _$TeamAlbumGroupApiModelFromJson(
  Map<String, dynamic> json,
) => TeamAlbumGroupApiModel(
  team: TeamApiModel.fromJson(json['team'] as Map<String, dynamic>),
  stickers: (json['stickers'] as List<dynamic>)
      .map((e) => AlbumPositionApiModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TeamAlbumGroupApiModelToJson(
  TeamAlbumGroupApiModel instance,
) => <String, dynamic>{
  'team': instance.team.toJson(),
  'stickers': instance.stickers.map((e) => e.toJson()).toList(),
};
