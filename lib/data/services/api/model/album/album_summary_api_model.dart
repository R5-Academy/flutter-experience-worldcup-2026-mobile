import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album_summary_api_model.g.dart';

@JsonSerializable()
class const AlbumSummaryApiModel({
  required final int total,
  required final int missing,
  required final int repeated,
}) extends Equatable {
  factory AlbumSummaryApiModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumSummaryApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumSummaryApiModelToJson(this);

  @override
  List<Object?> get props => [total, missing, repeated];
}
