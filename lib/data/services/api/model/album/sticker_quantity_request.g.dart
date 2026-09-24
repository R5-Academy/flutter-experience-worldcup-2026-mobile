// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker_quantity_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StickerQuantityRequest _$StickerQuantityRequestFromJson(
  Map<String, dynamic> json,
) => StickerQuantityRequest(
  code: json['code'] as String,
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$StickerQuantityRequestToJson(
  StickerQuantityRequest instance,
) => <String, dynamic>{'code': instance.code, 'quantity': instance.quantity};
