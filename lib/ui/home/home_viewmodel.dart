import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/core/command.dart';
import 'package:wc_2026_mobile/core/logging/app_logger.dart';
import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/core/view_model_initializable.dart';
import 'package:wc_2026_mobile/data/repositories/album/album_repository.dart';
import 'package:wc_2026_mobile/domain/models/album/album_summary.dart';
import 'package:wc_2026_mobile/domain/models/album/recent_sticker.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

typedef AlbumProgress = ({int collected, int total, int repeated});

typedef RecentStickerView = ({
  String code,
  int number,
  String label,
  String teamName,
  Color teamColor,
  String? flagCode,
  int count,
});

class HomeViewModel({required final AlbumRepository _albumRepository})
    extends ChangeNotifier
    implements ViewModelInitializable {
  final _log = AppLogger('HomeViewModel');

  late final loadSummary = Command0(_loadSummary);
  late final loadRecent = Command0(_loadRecent);

  AlbumProgress? _progress;
  AlbumProgress? get progress => _progress;

  List<RecentStickerView> _recentStickers = const [];
  List<RecentStickerView> get recentStickers => _recentStickers;

  @override
  void init() {
    loadSummary.execute();
    loadRecent.execute();
  }

  Future<void> refresh() =>
      Future.wait([loadSummary.execute(), loadRecent.execute()]);

  Future<Result<void>> _loadSummary() async {
    try {
      final summary = await _albumRepository.getSummary();

      switch (summary) {
        case Ok<AlbumSummary>(:final value):
          _progress = (
            collected: value.total - value.missing,
            total: value.total,
            repeated: value.repeated,
          );
          _log.debug(
            '${value.total - value.missing} de ${value.total} coladas',
          );
          return Result.done;
        case Error<AlbumSummary>(:final error):
          _log.error(
            'Falha ao carregar o resumo do álbum',
            error: error,
            stackTrace: error.stackTrace,
          );
          return Result.error(error);
      }
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _loadRecent() async {
    try {
      final recentStickers = await _albumRepository.getRecentStickers();
      switch (recentStickers) {
        case Ok<List<RecentSticker>>(:final value):
          _recentStickers = value.map(_viewOf).toList();
          _log.debug('${value.length} figurinhas recentes');
          return Result.done;
        case Error<List<RecentSticker>>(:final error):
          _log.error(
            'Falha ao carregar as figurinhas recentes ',
            error: error,
            stackTrace: error.stackTrace,
          );
          return Result.error(error);
      }
    } finally {
      notifyListeners();
    }
  }

  RecentStickerView _viewOf(RecentSticker sticker) {
    final team = sticker.team;
    return (
      code: sticker.code,
      number: sticker.number,
      label: team?.code ?? sticker.code.split('-').first,
      teamName: team?.name ?? sticker.code,
      teamColor: team == null ? AppColors.ink : Color(team.primaryColor),
      flagCode: team?.code,
      count: sticker.repeated + 1,
    );
  }
}
