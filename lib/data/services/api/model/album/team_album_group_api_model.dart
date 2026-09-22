import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wc_2026_mobile/data/services/api/model/album/album_position_api_model.dart';
import 'package:wc_2026_mobile/data/services/api/model/team/team_api_model.dart';

part 'team_album_group_api_model.g.dart';

@JsonSerializable()
class const TeamAlbumGroupApiModel({
  required final TeamApiModel team,
  required final List<AlbumPositionApiModel> stickers,
}) extends Equatable {
  factory TeamAlbumGroupApiModel.fromJson(Map<String, dynamic> json) =>
      _$TeamAlbumGroupApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeamAlbumGroupApiModelToJson(this);

  @override
  List<Object?> get props => [team, stickers];
}
