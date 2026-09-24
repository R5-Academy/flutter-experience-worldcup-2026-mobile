import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sticker_quantity_request.g.dart';

@JsonSerializable()
class const StickerQuantityRequest({
  required final String code,
  required final int quantity,
}) extends Equatable {
  factory StickerQuantityRequest.fromJson(Map<String, dynamic> json) =>
      _$StickerQuantityRequestFromJson(json);

  Map<String, dynamic> toJson() => _$StickerQuantityRequestToJson(this);

  @override
  List<Object?> get props => [code, quantity];
}
