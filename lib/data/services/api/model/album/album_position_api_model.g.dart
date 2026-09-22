// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_position_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumPositionApiModel _$AlbumPositionApiModelFromJson(
  Map<String, dynamic> json,
) => AlbumPositionApiModel(
  code: json['code'] as String,
  number: (json['number'] as num).toInt(),
  status: $enumDecode(_$StickerStatusEnumMap, json['status']),
  repeated: (json['repeated'] as num).toInt(),
);

Map<String, dynamic> _$AlbumPositionApiModelToJson(
  AlbumPositionApiModel instance,
) => <String, dynamic>{
  'code': instance.code,
  'number': instance.number,
  'status': _$StickerStatusEnumMap[instance.status]!,
  'repeated': instance.repeated,
};

const _$StickerStatusEnumMap = {
  StickerStatus.missing: 'missing',
  StickerStatus.owned: 'owned',
  StickerStatus.repeated: 'repeated',
};
