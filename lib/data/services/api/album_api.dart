import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wc_2026_mobile/data/services/api/model/album/album_summary_api_model.dart';
import 'package:wc_2026_mobile/data/services/api/model/album/recent_sticker_api_model.dart';

part 'album_api.g.dart';

@RestApi()
abstract class AlbumApi {
  factory AlbumApi(Dio dio) = _AlbumApi;

  @GET('/v1/album/summary')
  Future<AlbumSummaryApiModel> getSummary();

  @GET('/v1/album/recent')
  Future<RecentStickersApiModel> getRecent();
}
