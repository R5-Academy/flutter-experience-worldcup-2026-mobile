// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_sticker_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentStickersApiModel _$RecentStickersApiModelFromJson(
  Map<String, dynamic> json,
) => RecentStickersApiModel(
  stickers: (json['stickers'] as List<dynamic>)
      .map((e) => RecentStickerApiModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RecentStickersApiModelToJson(
  RecentStickersApiModel instance,
) => <String, dynamic>{
  'stickers': instance.stickers.map((e) => e.toJson()).toList(),
};

RecentStickerApiModel _$RecentStickerApiModelFromJson(
  Map<String, dynamic> json,
) => RecentStickerApiModel(
  code: json['code'] as String,
  number: (json['number'] as num).toInt(),
  repeated: (json['repeated'] as num).toInt(),
  team: json['team'] == null
      ? null
      : TeamApiModel.fromJson(json['team'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RecentStickerApiModelToJson(
  RecentStickerApiModel instance,
) => <String, dynamic>{
  'code': instance.code,
  'number': instance.number,
  'repeated': instance.repeated,
  'team': instance.team?.toJson(),
};
