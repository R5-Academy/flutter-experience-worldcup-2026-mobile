// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_summary_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumSummaryApiModel _$AlbumSummaryApiModelFromJson(
  Map<String, dynamic> json,
) => AlbumSummaryApiModel(
  total: (json['total'] as num).toInt(),
  missing: (json['missing'] as num).toInt(),
  repeated: (json['repeated'] as num).toInt(),
);

Map<String, dynamic> _$AlbumSummaryApiModelToJson(
  AlbumSummaryApiModel instance,
) => <String, dynamic>{
  'total': instance.total,
  'missing': instance.missing,
  'repeated': instance.repeated,
};
