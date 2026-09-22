import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/core/command.dart';
import 'package:wc_2026_mobile/core/logging/app_logger.dart';
import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/core/view_model_initializable.dart';
import 'package:wc_2026_mobile/data/repositories/album/album_repository.dart';
import 'package:wc_2026_mobile/data/repositories/team/team_repository.dart';
import 'package:wc_2026_mobile/domain/models/album/album.dart';
import 'package:wc_2026_mobile/domain/models/album/album_summary.dart';
import 'package:wc_2026_mobile/domain/models/album/sticker_status.dart';
import 'package:wc_2026_mobile/domain/models/team/team.dart';

typedef AlbumStickerView = ({
  String code,
  int number,
  String label,
  String player,
  bool collected,
  int count,
});

class AlbumViewModel({
  required final AlbumRepository _albumRepository,
  required final TeamRepository _teamRepository,
}) extends ChangeNotifier implements ViewModelInitializable {
  final _log = AppLogger('AlbumViewModel');

  late final loadAlbum = Command0(_loadAlbum);
  late final loadTeams = Command0(_loadTeams);
  late final loadSummary = Command0(_loadSummary);

  Album? _album;
  List<Team> _teams = const [];
  AlbumSummary? _counts;
  StickerStatus? _status;
  String? _teamCode;

  List<Team> get teams => _teams;
  AlbumSummary? get counts => _counts;
  StickerStatus? get status => _status;
  String? get teamCode => _teamCode;

  bool get filtered => _status != null || _teamCode != null;

  @override
  void init() {
    loadAlbum.execute();
    loadTeams.execute();
    loadSummary.execute();
  }

  void selectedStatus(StickerStatus? status) {
    if (status == _status) return;
    _status = status;
    _reload();
  }

  void toggleTeam(String code) {
    if (_teamCode == code) return;
    _teamCode = code;
    _reload();
  }

  void _reload() {
    notifyListeners();
    loadAlbum.execute();
  }

  Future<void> refresh() => Future.wait([
    loadAlbum.execute(),
    loadTeams.execute(),
    loadSummary.execute(),
  ]);

  Future<Result<void>> _loadAlbum() async {
    final album = await _albumRepository.getAlbum(
      status: _status,
      team: _teamCode,
    );

    switch (album) {
      case Ok<Album>(:final value):
        _album = value;
        _log.debug(
          '${value.teams.length} seleções e ${value.loose.length} especiais '
          '(status: ${status?.name ?? 'Todas'}, seleção: ${_teamCode ?? 'Todas'})',
        );
        return Result.done;
      case Error<Album>(:final error):
        _log.error(
          'Falha ao carregar o album',
          error: error,
          stackTrace: error.stackTrace,
        );
        return Result.error(error);
    }
  }

  Future<Result<void>> _loadTeams() async {
    final teams = await _teamRepository.getTeams();

    switch (teams) {
      case Ok<List<Team>>(:final value):
        _teams = value;
        return Result.done;
      case Error<List<Team>>(:final error):
        return Result.error(error);
    }
  }

  Future<Result<void>> _loadSummary() async {
    final summary = await _albumRepository.getSummary();
    switch (summary) {
      case Ok<AlbumSummary>(:final value):
        _counts = value;
        return Result.done;
      case Error<AlbumSummary>(:final error):
        return Result.error(error);
    }
  }
}
