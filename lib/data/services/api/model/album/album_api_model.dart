import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wc_2026_mobile/data/services/api/model/album/album_position_api_model.dart';
import 'package:wc_2026_mobile/data/services/api/model/album/team_album_group_api_model.dart';

part 'album_api_model.g.dart';

@JsonSerializable()
class const AlbumApiModel({
  required final List<TeamAlbumGroupApiModel> teams,
  required final List<AlbumPositionApiModel> loose,
}) extends Equatable {
  factory AlbumApiModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumApiModelToJson(this);

  @override
  List<Object?> get props => [teams, loose];
}
