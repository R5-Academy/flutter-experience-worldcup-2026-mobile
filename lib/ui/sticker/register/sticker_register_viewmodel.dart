import 'package:flutter/material.dart';
import 'package:wc_2026_mobile/core/command.dart';
import 'package:wc_2026_mobile/core/logging/app_logger.dart';
import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/core/view_model_initializable.dart';
import 'package:wc_2026_mobile/data/repositories/album/album_repository.dart';
import 'package:wc_2026_mobile/data/repositories/team/team_repository.dart';
import 'package:wc_2026_mobile/domain/models/team/team.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

typedef StickerMatch = ({
  String code,
  String label,
  String team,
  String number,
  Color color,
  String? flagPath,
});

class StickerRegisterViewModel({
  required final AlbumRepository _albumRepository,
  required final TeamRepository _teamRepository,
}) extends ChangeNotifier implements ViewModelInitializable {
  final _log = AppLogger('RegisterViewModel');

  late final register = Command1<StickerMatch, StickerMatch>(_register);

  final codeLength = 5;
  final codeLetter = 3;

  List<Team> _teams = const [];

  var _code = '';
  var _changed = false;

  String get code => _code;
  bool get changed => _changed;
  final _specialPrefix = 'FWC';

  Future<void> _loadTeams() async {
    final result = await _teamRepository.getTeams();
    switch (result) {
      case Ok<List<Team>>(:final value):
        _teams = value;
        notifyListeners();
      case Error<List<Team>>(:final error):
        _log.error(
          'Falha ao carregar o catálogo de seleções',
          error: error,
          stackTrace: error.stackTrace,
        );
    }
  }

  StickerMatch? get match {
    if (_code.length < codeLength) return null;

    final prefix = _code.substring(0, codeLetter);
    final number = _code.substring(codeLetter);

    final code = '$prefix-${int.parse(number)}';
    final label = '$prefix – $number';

    if (prefix == _specialPrefix) {
      return (
        code: code,
        label: label,
        team: 'ESPECIAL',
        number: number,
        color: AppColors.ink,
        flagPath: null,
      );
    }

    if (int.parse(number) > 20) return null;

    final team = _teamOf(prefix);
    if (team == null) return null;

    return (
      code: code,
      label: label,
      team: team.name,
      number: number,
      color: Color(team.primaryColor),
      flagPath: team.flagUrl,
    );
  }

  void type(String char) {
    if (code.length == codeLength) return;
    _code += char;
    notifyListeners();
  }

  void backspace() {
    if (_code.isEmpty) return;
    _code = _code.substring(0, _code.length - 1);
    notifyListeners();
  }

  Team? _teamOf(String prefix) {
    for (final team in _teams) {
      if (team.code == prefix) return team;
    }
    return null;
  }

  @override
  void init() {
    _loadTeams();
  }

  Future<Result<StickerMatch>> _register(StickerMatch sticker) async {
    try {
      final result = await _albumRepository.registerSticker(
        code: sticker.code,
        quantity: 1,
      );
      switch (result) {
        case Ok<void>():
          _changed = true;
          _code = '';
          return Result.ok(sticker);
        case Error<void>(:final error):
          _log.error(
            'Falha ao colar ${sticker.code}',
            error: error,
            stackTrace: error.stackTrace,
          );
          return Result.error(error);
      }
    } finally {
      notifyListeners();
    }
  }
}
