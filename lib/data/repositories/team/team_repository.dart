import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/domain/models/team/team.dart';

abstract interface class TeamRepository {
  Future<Result<List<Team>>> getTeams();
}
