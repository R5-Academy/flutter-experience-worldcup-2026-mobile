import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

abstract interface class LogOutput {
  void write(LogRecord record);
}

class const ConsoleLogOutput() implements LogOutput {
  @override
  void write(LogRecord record) {
    final buffer = StringBuffer()
      ..write(
        '${record.level.name} ${record.time} '
        '[${record.loggerName}] ${record.message}',
      );
    if (record.error != null) buffer.write('\n error: ${record.error}');
    if (record.stackTrace != null) buffer.write('\n${record.stackTrace}');
    debugPrint(buffer.toString());
  }
}
