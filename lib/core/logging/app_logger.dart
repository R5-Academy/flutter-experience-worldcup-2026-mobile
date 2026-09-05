import 'package:logging/logging.dart';
import 'package:wc_2026_mobile/core/logging/log_output.dart';

class AppLogger(String name) {
  final Logger _logger = Logger(name);

  void debug(String message) => _logger.fine(message);
  void info(String message) => _logger.info(message);

  void warning(String message, {Object? error, StackTrace? stackTrace}) =>
      _logger.warning(message, error, stackTrace);

  void error(String message, {Object? error, StackTrace? stackTrace}) =>
      _logger.severe(message, error, stackTrace);

  static void configure({
    required Level level,
    required List<LogOutput> outputs,
  }) {
    Logger.root.level = level;
    Logger.root.onRecord.listen((event) {
      for (final output in outputs) {
        output.write(event);
      }
    });
  }
}
