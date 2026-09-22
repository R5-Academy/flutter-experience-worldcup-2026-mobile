import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/domain/models/album/album.dart';
import 'package:wc_2026_mobile/domain/models/album/album_summary.dart';
import 'package:wc_2026_mobile/domain/models/album/recent_sticker.dart';
import 'package:wc_2026_mobile/domain/models/album/sticker_status.dart';

abstract interface class AlbumRepository {
  Future<Result<Album>> getAlbum({StickerStatus? status, String? team});

  Future<Result<AlbumSummary>> getSummary();

  Future<Result<List<RecentSticker>>> getRecentStickers();
}
