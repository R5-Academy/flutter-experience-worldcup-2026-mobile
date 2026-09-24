import 'package:flutter/material.dart';
import 'package:wc_2026_mobile/core/command.dart';
import 'package:wc_2026_mobile/core/logging/app_logger.dart';
import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/data/repositories/album/album_repository.dart';

class DetailViewModel({
  required final AlbumRepository _albumRepository,
  required final String _code,
  required var int _count,
}) extends ChangeNotifier {
  final _log = AppLogger('DetailViewModel');

  int _stored = _count;

  late final save = Command0(_save);
  late final remove = Command0(_remove);

  int get count => _count;
  bool get collected => _count > 0;
  bool get inAlbum => _stored > 0;

  bool get busy => save.running || remove.running;

  void changeCount(int count) {
    if (count == _count) return;
    _count = count;
    notifyListeners();
  }

  Future<Result<void>> _save() async {
    try {
      final quantity = _count < 1 ? 1 : _count;

      final result = _stored == 0
          ? await _albumRepository.registerSticker(
              code: _code,
              quantity: quantity,
            )
          : await _albumRepository.updateStickerQuantity(
              code: _code,
              quantity: quantity,
            );

      switch (result) {
        case Ok<void>():
          _log.debug(
            _stored == 0
                ? '$_code colada com $quantity cópia(s)'
                : '$_code atualiza de $_stored para $quantity cópias',
          );
          _stored = quantity;
          _count = quantity;
          return Result.done;

        case Error<void>(:final error):
          _log.error(
            'Falha ao gravar $_code',
            error: error,
            stackTrace: error.stackTrace,
          );
          return Result.error(error);
      }
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _remove() async {
    try {
      final result = await _albumRepository.removeSticker(_code);
      switch (result) {
        case Ok<void>():
          _log.debug('$_code removeida do álbum');
          _stored = 0;
          _count = 0;
          return Result.done;
        case Error<void>(:final error):
          _log.error(
            'Falha ao remover $_code',
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
