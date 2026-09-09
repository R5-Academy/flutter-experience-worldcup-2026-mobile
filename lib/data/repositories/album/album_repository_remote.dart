import 'package:dio/dio.dart';
import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/data/repositories/album/album_repository.dart';
import 'package:wc_2026_mobile/data/services/api/album_api.dart';
import 'package:wc_2026_mobile/data/services/api/mappers/album_sumary_api_model_mapper.dart';
import 'package:wc_2026_mobile/data/services/api/mappers/dio_exception_mapper.dart';
import 'package:wc_2026_mobile/data/services/api/mappers/recent_sticker_api_model_mapper.dart';
import 'package:wc_2026_mobile/domain/models/album/album_summary.dart';
import 'package:wc_2026_mobile/domain/models/album/recent_sticker.dart';

class AlbumRepositoryRemote({required final AlbumApi _albumApi})
    implements AlbumRepository {
  @override
  Future<Result<List<RecentSticker>>> getRecentStickers() async {
    try {
      final recentsStickers = await _albumApi.getRecent();

      return Result.ok(
        recentsStickers.stickers.map((s) => s.toDomain()).toList(),
      );
    } on DioException catch (e, st) {
      return Result.error(e.toAppException(st));
    }
  }

  @override
  Future<Result<AlbumSummary>> getSummary() async {
    try {
      final summary = await _albumApi.getSummary();

      return Result.ok(summary.toDomain());
    } on DioException catch (e, st) {
      return Result.error(e.toAppException(st));
    }
  }
}
