import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wc_2026_mobile/domain/models/album/sticker_status.dart';

part 'album_position_api_model.g.dart';

@JsonSerializable()
class const AlbumPositionApiModel({
  required final String code,
  required final int number,
  required final StickerStatus status,
  required final int repeated,
}) extends Equatable {
  factory AlbumPositionApiModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumPositionApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumPositionApiModelToJson(this);

  @override
  List<Object?> get props => [code, number, status, repeated];
}
