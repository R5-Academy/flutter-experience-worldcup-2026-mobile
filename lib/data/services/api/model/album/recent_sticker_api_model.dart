import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wc_2026_mobile/data/services/api/model/team/team_api_model.dart';

part 'recent_sticker_api_model.g.dart';

@JsonSerializable()
class const RecentStickersApiModel({
  required final List<RecentStickerApiModel> stickers,
}) extends Equatable {
  factory RecentStickersApiModel.fromJson(Map<String, dynamic> json) =>
      _$RecentStickersApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecentStickersApiModelToJson(this);

  @override
  List<Object?> get props => [stickers];
}

@JsonSerializable()
class const RecentStickerApiModel({
  required final String code,
  required final int number,
  required final int repeated,
  final TeamApiModel? team,
}) extends Equatable {
  factory RecentStickerApiModel.fromJson(Map<String, dynamic> json) =>
      _$RecentStickerApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecentStickerApiModelToJson(this);

  @override
  List<Object?> get props => [code, number, repeated, team];
}
