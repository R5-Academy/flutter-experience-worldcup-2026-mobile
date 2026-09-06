import 'package:dio/dio.dart';
import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/data/repositories/team/team_repository.dart';
import 'package:wc_2026_mobile/data/services/api/mappers/dio_exception_mapper.dart';
import 'package:wc_2026_mobile/data/services/api/mappers/team_api_model_mapper.dart';
import 'package:wc_2026_mobile/data/services/api/team_api.dart';
import 'package:wc_2026_mobile/domain/models/team/team.dart';

class const TeamRepositoryRemote({required final TeamApi _teamApi})
    implements TeamRepository {
  @override
  Future<Result<List<Team>>> getTeams() async {
    try {
      final teams = await _teamApi.getTeams();

      return Result.ok(teams.map((t) => t.toDomain()).toList());
    } on DioException catch (e, st) {
      return Result.error(e.toAppException(st));
    }
  }
}
