import 'package:dio/dio.dart';
import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/data/repositories/album/album_repository.dart';
import 'package:wc_2026_mobile/data/services/api/album_api.dart';
import 'package:wc_2026_mobile/data/services/api/mappers/album_api_model_mapper.dart';
import 'package:wc_2026_mobile/data/services/api/mappers/album_sumary_api_model_mapper.dart';
import 'package:wc_2026_mobile/data/services/api/mappers/dio_exception_mapper.dart';
import 'package:wc_2026_mobile/data/services/api/mappers/recent_sticker_api_model_mapper.dart';
import 'package:wc_2026_mobile/data/services/api/model/album/sticker_quantity_request.dart';
import 'package:wc_2026_mobile/domain/models/album/album.dart';
import 'package:wc_2026_mobile/domain/models/album/album_summary.dart';
import 'package:wc_2026_mobile/domain/models/album/recent_sticker.dart';
import 'package:wc_2026_mobile/domain/models/album/sticker_status.dart';

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

  @override
  Future<Result<Album>> getAlbum({StickerStatus? status, String? team}) async {
    try {
      final album = await _albumApi.getAlbum(status: status?.name, team: team);
      return Result.ok(album.toDomain());
    } on DioException catch (e, st) {
      return Result.error(e.toAppException(st));
    }
  }

  @override
  Future<Result<void>> registerSticker({
    required String code,
    required int quantity,
  }) async {
    try {
      await _albumApi.registerSticker(
        StickerQuantityRequest(code: code, quantity: quantity),
      );
      return Result.done;
    } on DioException catch (e, st) {
      return Result.error(e.toAppException(st));
    }
  }

  @override
  Future<Result<void>> removeSticker(String code) async {
    try {
      await _albumApi.removeSticker(code);
      return Result.done;
    } on DioException catch (e, st) {
      return Result.error(e.toAppException(st));
    }
  }

  @override
  Future<Result<void>> updateStickerQuantity({
    required String code,
    required int quantity,
  }) async {
    try {
      await _albumApi.updateStickerQuantity(
        StickerQuantityRequest(code: code, quantity: quantity),
      );
      return Result.done;
    } on DioException catch (e, st) {
      return Result.error(e.toAppException(st));
    }
  }
}
