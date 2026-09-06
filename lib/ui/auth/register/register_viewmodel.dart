import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/core/command.dart';
import 'package:wc_2026_mobile/core/logging/app_logger.dart';
import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/core/view_model_initializable.dart';
import 'package:wc_2026_mobile/data/repositories/auth/auth_repository.dart';
import 'package:wc_2026_mobile/data/repositories/team/team_repository.dart';
import 'package:wc_2026_mobile/domain/models/team/team.dart';

typedef NewUser = ({
  String name,
  String email,
  String password,
  List<String> favoriteTeams,
  bool acceptedTerms,
});

class RegisterViewModel({
  required final AuthRepository _authRepository,
  required final TeamRepository _teamRepository,
}) extends ChangeNotifier implements ViewModelInitializable {
  final _log = AppLogger('RegisterViewModel');

  late final loadTeams = Command0(_loadTeams);
  late final registerUser = Command1<void, NewUser>(_register);

  List<Team> _teams = [];

  List<Team> get teams => _teams;

  @override
  void init() {
    loadTeams.execute();
  }

  List<Team> teamMatching(String term) {
    final query = term.trim().toLowerCase();
    if (query.isEmpty) return _teams;
    return _teams
        .where(
          (team) =>
              team.name.toLowerCase().contains(query) ||
              team.code.toLowerCase().contains(query),
        )
        .toList();
  }

  Future<Result<void>> _loadTeams() async {
    final teams = await _teamRepository.getTeams();

    switch (teams) {
      case Ok<List<Team>>(:final value):
        _teams = value;
        _log.debug('${value.length} seleções no catalogo');
        return Result.done;
      case Error<List<Team>>(:final error):
        _log.error(
          'Falha ao carregar o catálogo de seleções',
          error: error,
          stackTrace: error.stackTrace,
        );
        return Result.error(error);
    }
  }

  Future<Result<void>> _register(NewUser user) async {
    final result = await _authRepository.register(
      name: user.name,
      email: user.email,
      password: user.password,
      favoriteTeams: user.favoriteTeams,
      acceptedTerms: user.acceptedTerms,
    );

    if (result case Error(:final error)) {
      _log.error(
        'Falha ao criar a conta',
        error: error,
        stackTrace: error.stackTrace,
      );
    }
    return result;
  }
}
