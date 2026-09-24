import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wc_2026_mobile/data/services/api/model/album/album_api_model.dart';
import 'package:wc_2026_mobile/data/services/api/model/album/album_summary_api_model.dart';
import 'package:wc_2026_mobile/data/services/api/model/album/recent_sticker_api_model.dart';
import 'package:wc_2026_mobile/data/services/api/model/album/sticker_quantity_request.dart';

part 'album_api.g.dart';

@RestApi()
abstract class AlbumApi {
  factory AlbumApi(Dio dio) = _AlbumApi;

  @GET('/v1/album')
  Future<AlbumApiModel> getAlbum({
    @Query('status') String? status,
    @Query('team') String? team,
  });

  @GET('/v1/album/summary')
  Future<AlbumSummaryApiModel> getSummary();

  @GET('/v1/album/recent')
  Future<RecentStickersApiModel> getRecent();

  @POST('/v1/album/stickers')
  Future<void> registerSticker(@Body() StickerQuantityRequest request);

  @PUT('/v1/album/stickers')
  Future<void> updateStickerQuantity(@Body() StickerQuantityRequest request);

  @DELETE('/v1/album/stickers/{code}')
  Future<void> removeSticker(@Path('code') String code);
}
