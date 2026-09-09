import 'package:wc_2026_mobile/data/services/api/model/album/recent_sticker_api_model.dart';
import 'package:wc_2026_mobile/domain/models/album/recent_sticker.dart';

extension RecentStickerApiModelMapper on RecentStickerApiModel {
  RecentSticker toDomain() =>
      RecentSticker(code: code, number: number, repeated: repeated);
}
