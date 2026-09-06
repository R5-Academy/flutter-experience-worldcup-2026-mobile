import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wc_2026_mobile/data/services/api/model/team/team_api_model.dart';

part 'team_api.g.dart';

@RestApi()
abstract class TeamApi {
  factory TeamApi(Dio dio) = _TeamApi;

  @GET('/v1/teams')
  @Extra({})
  Future<List<TeamApiModel>> getTeams();
}
