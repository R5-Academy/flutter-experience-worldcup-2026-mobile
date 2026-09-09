import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/domain/models/album/album_summary.dart';
import 'package:wc_2026_mobile/domain/models/album/recent_sticker.dart';

abstract interface class AlbumRepository {
  Future<Result<AlbumSummary>> getSummary();

  Future<Result<List<RecentSticker>>> getRecentStickers();
}
